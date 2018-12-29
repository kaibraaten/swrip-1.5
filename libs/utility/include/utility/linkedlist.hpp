#ifndef _CERIS_LINKEDLIST_HPP_
#define _CERIS_LINKEDLIST_HPP_

#include <cstddef>
#include <utility/types.hpp>

struct List;
struct ListIterator;

List *AllocateList();
void FreeList(List *list);
void AddToList(List *list, void *data);
void AddToListFront(List *list, void *data);
void AddToListBack(List *list, void *data);
void AddToListSorted(List *list, void *data, Comparator compare);
size_t ListSize(const List *list);
void RemoveFromList(List *list, void *data);
ListIterator *AllocateListIterator(const List *list);
ListIterator *AllocateListReverseIterator(const List *list);
void RemoveFromListByIterator(ListIterator *iterator);
void FreeListIterator(ListIterator *iterator);
void *GetListData(const ListIterator *iterator);
void MoveToNextListElement(ListIterator *iterator);
bool ListHasMoreElements(const ListIterator *iterator);
void InsertBefore(ListIterator *iterator, void *data);
void InsertAfter(ListIterator *iterator, void *data);
void *FindIfInList(const List *list, Predicate predicate, const void *userData);
void ForEachInList(const List *list, ForEachFunc action, void *userData);
size_t CountIfInList(const List *list, Predicate predicate, const void *userData);

#endif
