#include <iostream>
#include <vector>
#include <map>
using namespace std;

#include "Container.h"

void Vector::assign()
{
  vector<int> first;

  first.assign(7,100);

  cout << "size of first: " << first.size() << endl;

  int myint[] = {16, 7, 4};
  first.assign(myint, myint+3);

  cout << "size of first: " << first.size() << endl;
}

void Vector::addDelete()
{
  vector<int> intarr;
  for (int i = 0; i < 10; ++i)
  {
    intarr.push_back(i);
  }

  intarr.erase(intarr.begin()+5);
  intarr.erase(intarr.begin(), intarr.begin()+3);

  for (int i = 0; i < intarr.size(); ++i)
  {
    cout << intarr[i] << " ";
  }

  cout << endl;
}

void Map::assign()
{
  map<string, string> amap;

  amap["John"] = "Apple";
  amap["Black"] = "Orange";

  for (map<string,string>::const_iterator it = amap.begin(); it != amap.end(); ++it)
  {
    cout << it->first << ": " << it->second << endl;
  }

}
