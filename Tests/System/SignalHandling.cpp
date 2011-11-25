#include "SignalHandling.h"

#include <stdlib.h>
#include <iostream>
#include <signal.h>
using namespace std;

void fn()
{
  cout << "on exit" << endl;
}

void fn2(int)
{
  cout << "interrupted" << endl;
}

int Test::testSignalHandling()
{
  cout << "start..." << endl;
  atexit(fn);
  signal(SIGINT,fn2);
  signal(SIGTERM,fn2);
  sleep(10000);
  cout << "end" << endl;
  return EXIT_SUCCESS;
}
