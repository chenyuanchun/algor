#pragma once

template <typename T>
struct ListNode {
	T val;
	ListNode* next;
	ListNode(const T& v) : val(v), next(nullptr) {}
};

template <typename T>
void append(ListNode<T>* head, const T& value) {
	if (head->next)
		append(head->next, value);
	else {
		head->next = new ListNode<T>(value);
	}
}

template <typename T>
ListNode<T>* reverse(ListNode<T>* head) {
	if (!head->next) return head;
	ListNode<T>* last = reverse(head->next);
	head->next->next = head;
	head->next = nullptr;
	return last;
}

//template <typename T>
//ListNode<T>* successor = nullptr;


template <typename T>
ListNode<T>* reverseN(ListNode<T>* head, int n) {
	static ListNode<T>* successor = nullptr;
	if (n == 1) {
		successor = head->next;
		return head;
	}
	ListNode<T>* last = reverseN(head->next, n - 1);
	head->next->next = head;
	head->next = successor;
	return last;
}

ListNode<int>* initList10();