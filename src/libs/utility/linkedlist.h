#ifndef _CERIS_LINKEDLIST_H_
#define _CERIS_LINKEDLIST_H_

#include <utility.h>

typedef struct List List;
typedef struct ListIterator ListIterator;
typedef bool Predicate(const void *element, const void *ud);
typedef int Comparator(const void *lhv, const void *rhv);
typedef void ForEachFunc(void *element, void *ud);

List *AllocateList(void);
void FreeList(List *list);
void AddToFront(List *list, void *data);
void AddToBack(List *list, void *data);
void AddSorted(List *list, void *data, Comparator *compare);
size_t ListSize(const List *list);
void RemoveFromList(List *list, void *data);
ListIterator *AllocateIterator(const List *list);
ListIterator *AllocateReverseIterator(const List *list);
void RemoveByIterator(ListIterator *iterator);
void FreeIterator(ListIterator *iterator);
void *GetData(const ListIterator *iterator);
void MoveToNextElement(ListIterator *iterator);
bool HasMoreElements(const ListIterator *iterator);
void InsertBefore(ListIterator *iterator, void *data);
void InsertAfter(ListIterator *iterator, void *data);
void *FindIf(const List *list, Predicate *predicate, const void *userData);
void ForEachInList(const List *list, ForEachFunc *action, void *userData);
size_t CountIf(const List *list, Predicate *predicate, const void *userData);

#endif
