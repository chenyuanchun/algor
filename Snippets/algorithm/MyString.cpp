#include "MyString.h"

MyString::MyString(const char* str)
{
  if (!str) return;

  if (_data)
    delete [] _data;
  
  _data = new char[strlen(str)+1];
  strcpy(_data, str);
}

MyString::MyString(const MyString& other)
{
  if (this == &other) return; // avoid copying to self

  if (_data)
    delete _data;
  
  _data = new char[strlen(other._data)+1];
  strcpy(_data, other.data);
}

MyString::~MyString()
{
  if (_data)
  {
    delete [] _data;
    _data = NULL;
  }
}

