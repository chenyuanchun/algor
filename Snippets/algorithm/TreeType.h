#ifndef __TREE_TYPE_H__
#define __TREE_TYPE_H__

#include <vector>
#include <string>

using namespace std;

struct InputAssistSearchTreeNode {
InputAssistSearchTreeNode(char c) : letter(c), children(NUM_LETTER,NULL), endofword(false) {}
  char letter;
  vector<InputAssistSearchTreeNode*> children;
  bool endofword;
  static const int NUM_LETTER;
};

class InputAssistSearchTree {
 public:
 InputAssistSearchTree() : roots(InputAssistSearchTreeNode::NUM_LETTER,NULL){}
  ~InputAssistSearchTree(){ clear(); }

 public:
  void insert(const string& word);
  void getListWithPrefix(const string& prefix, vector<string>& list);
  void clear() {}
  
 private:
  vector<InputAssistSearchTreeNode*> roots;
 private:
  int _getIndexByChar(char letter);
  void _insert(const char* word, InputAssistSearchTreeNode* node);
  void _collectWordsWithPrefix(const string& prefix, InputAssistSearchTreeNode* node, vector<string>& list);
};
  

#endif //__TREE_TYPE_H__
