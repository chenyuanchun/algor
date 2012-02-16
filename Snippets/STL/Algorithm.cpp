#include "Algorithm.h"

#include <iostream>
#include <algorithm>
#include <vector>
#include <functional>
using namespace std;

namespace {
  void myfun(int i) {
    cout << " " << i;
  }

  struct funclass {
    void operator () (int i) { cout << " " << i;}
  };
}

class TestCallMemberFunc
{
public:
  void doIt()
  {
    std::cout << "TestCallMemberFunc::doIt()" << endl;
  }
};

void Searching::forEach()
{
  int myints[] = {1,2,3,5,8};
  int size = sizeof(myints)/sizeof(myints[0]);

  vector<int> anvec(size,0);
  copy(myints, myints+size, anvec.begin());

  anvec.resize(size+3);

  copy_backward(anvec.begin(), anvec.begin()+size, anvec.end());

  cout << "anvec contains:";
  for_each(anvec.begin(), anvec.end(), myfun);
  cout << endl;

  vector<TestCallMemberFunc*> funcList;
  TestCallMemberFunc* func1 = new TestCallMemberFunc();
  funcList.push_back(func1);
  for_each(funcList.begin(), funcList.end(), mem_fun(&TestCallMemberFunc::doIt));
}

void Searching::testfind()
{
  int myints[] = {1,2,3,5,8};
  int size = sizeof(myints)/sizeof(myints[0]);

  vector<int> anvec(size);
  anvec.assign(myints,myints+size);

  int* p = find(myints,myints+size,3);
  cout << "Value following 3 is:" << *(p+1) << endl;

  vector<int>::iterator it =
    find(anvec.begin(), anvec.end(), 3);
  cout << "Value following 3 is:" << *(++it) << endl;
}
