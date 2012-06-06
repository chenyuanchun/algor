#ifndef _MY_STRING_H_
#define _MY_STRING_H_

class MyString
{
 public:
  MyString(const char* str);
  MyString(const MyString& other);

  MyString& operator= (const MyString& other);
  MyString& operator= (const char* str);

  bool operator== (const MyString& other);

  operator const char* () const;

  size_t size() const;

 private:
  char* _data;
};

#endif // _MY_STRING_H_
