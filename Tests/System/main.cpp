/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  test ctrl+c and atexit()
 *
 *        Version:  1.0
 *        Created:  11/01/10 15:55:33
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Ray Chen (RC), ray.chen@algorithmics.com
 *        Company:  Algorithmics Inc.
 *
 * =====================================================================================
 */

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
int main()
{
  cout << "start..." << endl;
  atexit(fn);
  signal(SIGINT,fn2);
  signal(SIGTERM,fn2);
  sleep(10000);
  cout << "end" << endl;
  return EXIT_SUCCESS;
}
