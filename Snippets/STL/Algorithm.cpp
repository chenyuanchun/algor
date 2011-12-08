#include "Algorithm.h"

#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

namespace {
  void myfun(int i) {
    cout << " " << i;
  }

  struct funclass {
    void operator () (int i) { cout << " " << i;}
  };
}

void Searching::forEach()
{
  int myints[] = {1,2,3,5,8};
  int size = sizeof(myints)/sizeof(myints[0]);

  cout << "myints contains:";
  for_each(myints, myints+size, myfun);
  cout << endl;
}
