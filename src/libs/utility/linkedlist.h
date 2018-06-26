#ifndef _SWRIP_LINKEDLIST_H_
#define _SWRIP_LINKEDLIST_H_

#include <utility.h>

typedef struct LinkList LinkList;
typedef struct ListIterator ListIterator;

LinkList *AllocateLinkList(void);
void FreeLinkList(LinkList *list);
void AddToFront(LinkList *list, void *data);
void AddToBack(LinkList *list, void *data);
void AddSorted(LinkList *list, void *data, int (*compare)(const void*, const void*));
size_t ListSize(const LinkList *list);
void RemoveFromList(LinkList *list, void *data);
ListIterator *AllocateIterator(const LinkList *list);
ListIterator *AllocateReverseIterator(const LinkList *list);
void RemoveByIterator(ListIterator *iterator);
void FreeIterator(ListIterator *iterator);
void *GetData(const ListIterator *iterator);
void MoveToNextElement(ListIterator *iterator);
bool HasMoreElements(const ListIterator *iterator);
void InsertBefore(ListIterator *iterator, void *data);
void InsertAfter(ListIterator *iterator, void *data);
void *FindInList(LinkList *list, bool (*predicate)(void *element, void *ud), void *userData);
void ForEachInList(LinkList *list, void (*operation)(void *element, void *ud), void *userData);

#endif
