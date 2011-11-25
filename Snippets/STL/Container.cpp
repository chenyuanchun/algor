#include <iostream>
#include <vector>
using namespace std;

#include "Container.h"

void Vector::assign()
{
  vector<int> first;

  first.assign(7,100);

  cout << "size of first: " << first.size() << endl;

}
