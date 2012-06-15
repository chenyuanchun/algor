#include <sys/mman.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <malloc.h>

static const size_t FILE_SIZE = 1024;
static const char* const FILE_NAME = "/tmp/mmap1";

void testMmap()
{
  int fd;
  int i;
  char* p;

  fd = open(FILE_NAME, O_RDWR | O_CREAT | O_TRUNC, (mode_t)0600);
  if (fd < 0) {
    printf("open file error\n");
    return;
  }

  // stretch file to the size of memory map
  int result = lseek(fd, FILE_SIZE-1, SEEK_SET);
  if (result == -1) {
    close(fd);
    perror("failed to stretch file size");
    return;
  }

  // write a empty string (actually a '\0' byte) at the end so that file
  // has the actual size
  result = write(fd, "", 1);
  if(result == -1) {
    close(fd);
    perror("failed to write empty string at the end of mmap file");
    return;
  }

  p=(char*)mmap(0, FILE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,fd,0);
  if (MAP_FAILED==p) {
    perror("failed to map the file");
    close(fd);
    return;
  }

  sprintf(p, "Test text...\n");
  getchar();

  munmap(p,FILE_SIZE);
  close(fd);
}
