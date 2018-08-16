#include <cstdlib>
#include <cstddef>
#include <cassert>
#include "linkedlist.hpp"

struct jsw_node
{
  void *data;
  struct jsw_node *next;
  struct jsw_node *prev;
};

struct jsw_list
{
  struct jsw_node *head;
  struct jsw_node *tail;
  int has_dummy_head;
  int has_dummy_tail;
  size_t size;
};

struct List
{
  struct jsw_list *implementation;
};

struct ListIterator
{
  const List *linklist;
  struct jsw_node *cursor;
  bool isReverse;
};

static struct jsw_list *new_list(int has_dummy_head, int has_dummy_tail);
static struct jsw_node *new_node(void *data, struct jsw_node *prev, struct jsw_node *next);
static struct jsw_node *insert_after(struct jsw_list *list, struct jsw_node *pos, void *data);
static struct jsw_node *insert_before(struct jsw_list *list, struct jsw_node *pos, void *data);
static struct jsw_node *insert_sorted(struct jsw_list *list, void *data,
                                      int (*compare)(const void*, const void*));
static struct jsw_node *remove_node(struct jsw_list *list, struct jsw_node *pos);
static struct jsw_node *destroy_node(struct jsw_node *node, void (destroy_data)(void*));
static void destroy_list(struct jsw_list *list, void (destroy_data)(void*));

/*
    Create a new list with an optional dummy head and tail
    Returns a pointer to the new list, or NULL on error
*/
static struct jsw_list *new_list(int has_dummy_head, int has_dummy_tail)
{
  struct jsw_list *rv = (struct jsw_list*) calloc(1, sizeof *rv);

  if (rv != NULL)
    {
      struct jsw_node *tail = has_dummy_tail ? new_node(NULL, NULL, NULL) : NULL;

      if (has_dummy_tail && tail == NULL)
        {
          /* Release the list if a dummy couldn't be allocated */
          free(rv);
          rv = NULL;
        }
      else
        {
          rv->head = has_dummy_head ? new_node(NULL, NULL, tail) : NULL;

          /* Finish linking the tail to the head */
          rv->tail = tail;
          rv->tail->prev = rv->head;

          rv->has_dummy_head = has_dummy_head;
          rv->has_dummy_tail = has_dummy_tail;

          rv->size = 0;

          if (has_dummy_head && rv->head == NULL)
            {
              /* Release the list if a dummy couldn't be allocated */
              free(rv);
              rv = NULL;
            }
        }
    }

  return rv;
}

/*
    Destroy a single given node, assuming it has been unlinked
    Optionally destroy the data contained in the node
    Returns the next node specified by the link
*/
static struct jsw_node *destroy_node(struct jsw_node *node, void (destroy_data)(void*))
{
  struct jsw_node *rv = NULL;

  if (node != NULL)
    {
      /*
        Save a reference to the next node
        because we're about to destroy this one
      */
      rv = node->next;

      if (destroy_data != NULL)
        {
          destroy_data(node->data);
        }

      free(node);
    }

  return rv;
}

/*
    Destroy all nodes in a given list
    Optionally destroy all data in each node
*/
static void destroy_list(struct jsw_list *list, void (destroy_data)(void*))
{
  while (list->head != NULL)
    {
      list->head = destroy_node(list->head, destroy_data);
    }
}

/*
    Insert a new node after the given node
    Returns a pointer to the new node or NULL on failure
*/
static struct jsw_node *insert_after(struct jsw_list *list, struct jsw_node *pos, void *data)
{
  struct jsw_node *rv = NULL;

  if (list != NULL && pos != NULL)
    {
      if (pos != list->tail)
        {
          /* Create a new node and set the next link */
          rv = new_node(data, pos, pos->next);

          if (rv != NULL)
            {
              if (pos->next != NULL)
                {
                  pos->next->prev = rv;
                }

              pos->next = rv;
              ++list->size;
            }
        }
      else
        {
          rv = insert_before(list, pos, data);
        }
    }

  return rv;
}

/*
    Insert a new node before the given node
    Returns a pointer to the new node or NULL on failure
*/
static struct jsw_node *insert_before(struct jsw_list *list, struct jsw_node *pos, void *data)
{
  struct jsw_node *rv = NULL;

  if (list != NULL && pos != NULL)
    {
      if (pos != list->head)
        {
          /* Create a new node and set the next link */
          rv = new_node(data, pos->prev, pos);

          if (rv != NULL)
            {
              if (pos->prev != NULL)
                {
                  pos->prev->next = rv;
                }

              pos->prev = rv;
              ++list->size;
            }
        }
      else
        {
          rv = insert_after(list, pos, data);
        }
    }

  return rv;
}

/*
    Remove the selected node
    Returns the removed node or NULL on failure
*/
static struct jsw_node *remove_node(struct jsw_list *list, struct jsw_node *pos)
{
  struct jsw_node *rv = NULL;

  if (list != NULL && pos != NULL)
    {
      /* Shift off of the dummies */
      if (pos == list->head)
        {
          pos = pos->next;
        }

      if (pos == list->tail)
        {
          pos = pos->prev;
        }

      if (pos != list->head)
        {
          /* Remove a non-dummy node */
          rv = pos;

          /* Reset the list links if necessary */
          if (rv->prev != NULL)
            {
              rv->prev->next = rv->next;
            }

          if (rv->next != NULL)
            {
              rv->next->prev = rv->prev;
            }

          /* Clean up the old node */
          rv->prev = rv->next = NULL;
          --list->size;
        }
    }

  return rv;
}

/*
    Insert a new node in sorted order
    Returns a pointer to the new node or NULL on failure
*/
static struct jsw_node *insert_sorted(struct jsw_list *list, void *data,
                                      int (*compare)(const void*, const void*))
{
  struct jsw_node *rv = NULL;

  if (list != NULL)
    {
      /* Find the sorted position of the new node */
      struct jsw_node *it = list->head;

      while (it->next != NULL && compare(it->next->data, data) < 0)
        {
          it = it->next;
        }

      /* Delegate the insertion to an existing function */
      rv = insert_after(list, it, data);
    }

  return rv;
}

/*
    Create a new node with the given data and links
    Returns a pointer to the new node, or NULL on error
*/
static struct jsw_node *new_node(void *data, struct jsw_node *prev, struct jsw_node *next)
{
  struct jsw_node *rv = (struct jsw_node*) calloc(1, sizeof *rv);

  if (rv != NULL)
    {
      rv->data = data;
      rv->prev = prev;
      rv->next = next;
    }

  return rv;
}

List *AllocateList(void)
{
  List *newList = (List*)calloc(1, sizeof(List));
  newList->implementation = new_list(true, true);

  return newList;
}

void FreeList(List *list)
{
  destroy_list(list->implementation, NULL);
  free(list);
}

void AddToListFront(List *list, void *data)
{
  insert_before(list->implementation, list->implementation->head, data);
}

void AddToListBack(List *list, void *data)
{
  insert_after(list->implementation, list->implementation->tail, data);
}

void AddToList(List *list, void *data)
{
  AddToListBack(list, data);
}

void AddToListSorted(List *list, void *data, Comparator *compare)
{
  insert_sorted(list->implementation, data, compare);
}

void RemoveFromList(List *list, void *dataToFind)
{
  ListIterator *iterator = AllocateListIterator(list);

  while(ListHasMoreElements(iterator))
    {
      void *dataInList = GetListData(iterator);

      if(dataInList == dataToFind)
        {
          RemoveFromListByIterator(iterator);
          break;
        }

      MoveToNextListElement(iterator);
    }

  FreeListIterator(iterator);
}

ListIterator *AllocateListIterator(const List *list)
{
  ListIterator *newIterator = (ListIterator*)calloc(1, sizeof(ListIterator));
  newIterator->linklist = list;
  newIterator->cursor = list->implementation->head->next;

  return newIterator;
}

ListIterator *AllocateListReverseIterator(const List *list)
{
  ListIterator *newIterator = AllocateListIterator(list);
  newIterator->isReverse = true;
  newIterator->cursor = list->implementation->tail->prev;

  return newIterator;
}

void RemoveFromListByIterator(ListIterator *iterator)
{
  struct jsw_node *node = NULL;
  assert(iterator->cursor != NULL);
  node = remove_node(iterator->linklist->implementation, iterator->cursor);
  assert(node != NULL);
  destroy_node(node, NULL);
  iterator->cursor = NULL;
}

void FreeListIterator(ListIterator *iterator)
{
  free(iterator);
}

void *GetListData(const ListIterator *iterator)
{
  return iterator->cursor->data;
}

void MoveToNextListElement(ListIterator *iterator)
{
  if(iterator->isReverse)
    {
      iterator->cursor = iterator->cursor->prev;
    }
  else
    {
      iterator->cursor = iterator->cursor->next;
    }
}

bool ListHasMoreElements(const ListIterator *iterator)
{
  if(iterator->isReverse)
    {
      return iterator->cursor != iterator->linklist->implementation->head;
    }
  else
    {
      return iterator->cursor != iterator->linklist->implementation->tail;
    }
}

void InsertBefore(ListIterator *iterator, void *data)
{
  iterator->cursor = insert_before(iterator->linklist->implementation, iterator->cursor, data);
}

void InsertAfter(ListIterator *iterator, void *data)
{
  iterator->cursor = insert_after(iterator->linklist->implementation, iterator->cursor, data);
}

size_t ListSize(const List *list)
{
  return list->implementation->size;
}

void *FindIfInList(const List *list, Predicate *predicate, const void *userData)
{
  ListIterator *iterator = AllocateListIterator(list);
  void *result = NULL;

  while(ListHasMoreElements(iterator))
    {
      void *dataInList = GetListData(iterator);
      bool match = predicate(dataInList, userData);

      if(match)
        {
          result = dataInList;
          break;
        }

      MoveToNextListElement(iterator);
    }

  FreeListIterator(iterator);
  return result;
}

void ForEachInList(const List *list, ForEachFunc *action, void *userData)
{
  ListIterator *iterator = AllocateListIterator(list);

  while(ListHasMoreElements(iterator))
    {
      void *dataInList = GetListData(iterator);
      action(dataInList, userData);
      MoveToNextListElement(iterator);
    }

  FreeListIterator(iterator);
}

size_t CountIfInList(const List *list, Predicate *predicate, const void *userData)
{
  ListIterator *iterator = AllocateListIterator(list);
  size_t counter = 0;

  while(ListHasMoreElements(iterator))
    {
      void *dataInList = GetListData(iterator);
      bool matchesCriteria = predicate(dataInList, userData);

      if(matchesCriteria)
        {
          ++counter;
        }

      MoveToNextListElement(iterator);
    }

  FreeListIterator(iterator);
  return counter;
}