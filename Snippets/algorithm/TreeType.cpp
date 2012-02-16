#include "TreeType.h"

#include <cctype>
#include <cassert>

const int InputAssistSearchTreeNode::NUM_LETTER = 26;

void InputAssistSearchTree::insert(const string& word) {
  if (word.empty()) return;
  
  const char* first = word.c_str();
  int index = _getIndexByChar(*first);
  InputAssistSearchTreeNode*& root = roots[index];
  if (root == NULL) {
    root = new InputAssistSearchTreeNode(*first);
  }
  _insert(first, root);
}

void InputAssistSearchTree::_insert(const char* word, InputAssistSearchTreeNode* node) {
  word += 1;
  if (!*word) {
    node->endofword = true;
    return;
  }

  int index = _getIndexByChar(*word);
  InputAssistSearchTreeNode*& child = node->children[index];
  if (child == NULL ){
    child = new InputAssistSearchTreeNode(*word);
  }

  _insert(word, child);
}

void InputAssistSearchTree::getListWithPrefix(const string& prefix, vector<string>& list) {
  if (prefix.empty()) return;

  InputAssistSearchTreeNode* node = roots[_getIndexByChar(prefix[0])];
  for (int i = 1; i < prefix.size(); ++i) {
    char c = prefix[i];
    int index = _getIndexByChar(c);
    node = node->children[i];
    if (!node) return;
  }

  if (node->endofword) list.push_back(prefix);

  _collectWordsWithPrefix(prefix, node, list);
}

int InputAssistSearchTree::_getIndexByChar(char c) {
  assert(isalpha(c));

  return tolower(c)-'a';
}
    
void InputAssistSearchTree::_collectWordsWithPrefix(const string& prefix, InputAssistSearchTreeNode* node, vector<string>& list) {
  for (int i = 0; i < 26; ++i) {
    node = node->children[i];
    if (!node) {
      _collectWordsWithPrefix(prefix + node->letter, node, list);
    }
  }

  if (node->endofword) list.push_back(prefix);
}
