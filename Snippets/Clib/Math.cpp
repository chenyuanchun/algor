#include <cstdlib>
#include <iostream>
using namespace std;

#include <cmath>
#include <cfloat>

void testFloatLimits()
{
  char szInput[] = "inf"; //"nan"
  double inf = std::atof(szInput);

  int ret = ::finite(inf);
  if (ret ==0)
    cout << "Infinite is:" << inf << endl;
}

void floatOperations()
{
  double param = 3.14159265;
  double fractional, integral;

  fractional = std::modf(param, &integral);

  cout << param << " = " << integral << " + " << fractional << endl;

  double pos_ceil = std::ceil(param);
  double nag_ceil = std::ceil(-param);

  cout << "Ceil of " << param << ": " << pos_ceil << endl;
  cout << "Ceil of " << -param << ": " << nag_ceil << endl;
}
