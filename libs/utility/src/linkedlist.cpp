#include <cstdlib>
#include <cstddef>
#include <cassert>
#include "linkedlist.hpp"

struct jsw_node
{
    void *data = nullptr;
    jsw_node *next = nullptr;
    jsw_node *prev = nullptr;
};

struct jsw_list
{
    jsw_node *head = nullptr;
    jsw_node *tail = nullptr;
    int has_dummy_head = 0;
    int has_dummy_tail = 0;
    size_t size = 0;
};

struct List
{
    jsw_list *implementation = nullptr;
};

struct ListIterator
{
    const List *linklist = nullptr;
    jsw_node *cursor = nullptr;
    bool isReverse = false;
};

static jsw_list *new_list(int has_dummy_head, int has_dummy_tail);
static jsw_node *new_node(void *data, jsw_node *prev, jsw_node *next);
static jsw_node *insert_after(jsw_list *list, jsw_node *pos, void *data);
static jsw_node *insert_before(jsw_list *list, jsw_node *pos, void *data);
static jsw_node *insert_sorted(jsw_list *list, void *data, Comparator compare);
static jsw_node *remove_node(jsw_list *list, jsw_node *pos);
static jsw_node *destroy_node(jsw_node *node, void (destroy_data)(void *));
static void destroy_list(jsw_list *list, void (destroy_data)(void *));

/*
    Create a new list with an optional dummy head and tail
    Returns a pointer to the new list, or NULL on error
*/
static jsw_list *new_list(int has_dummy_head, int has_dummy_tail)
{
    jsw_list *rv = (jsw_list*)calloc(1, sizeof *rv);

    if(rv != nullptr)
    {
        jsw_node *tail = has_dummy_tail ? new_node(nullptr, nullptr, nullptr) : nullptr;

        if(has_dummy_tail && tail == nullptr)
        {
            /* Release the list if a dummy couldn't be allocated */
            free(rv);
            rv = nullptr;
        }
        else
        {
            rv->head = has_dummy_head ? new_node(nullptr, nullptr, tail) : nullptr;

            /* Finish linking the tail to the head */
            rv->tail = tail;
            rv->tail->prev = rv->head;

            rv->has_dummy_head = has_dummy_head;
            rv->has_dummy_tail = has_dummy_tail;

            rv->size = 0;

            if(has_dummy_head && rv->head == nullptr)
            {
                /* Release the list if a dummy couldn't be allocated */
                free(rv);
                rv = nullptr;
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
static jsw_node *destroy_node(jsw_node *node, void (destroy_data)(void *))
{
    jsw_node *rv = nullptr;

    if(node != nullptr)
    {
        /*
          Save a reference to the next node
          because we're about to destroy this one
        */
        rv = node->next;

        if(destroy_data != nullptr)
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
static void destroy_list(jsw_list *list, void (destroy_data)(void *))
{
    while(list->head != nullptr)
    {
        list->head = destroy_node(list->head, destroy_data);
    }
}

/*
    Insert a new node after the given node
    Returns a pointer to the new node or NULL on failure
*/
static jsw_node *insert_after(jsw_list *list, jsw_node *pos, void *data)
{
    jsw_node *rv = nullptr;

    if(list != nullptr && pos != nullptr)
    {
        if(pos != list->tail)
        {
            /* Create a new node and set the next link */
            rv = new_node(data, pos, pos->next);

            if(rv != nullptr)
            {
                if(pos->next != nullptr)
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
static jsw_node *insert_before(jsw_list *list, jsw_node *pos, void *data)
{
    jsw_node *rv = nullptr;

    if(list != nullptr && pos != nullptr)
    {
        if(pos != list->head)
        {
            /* Create a new node and set the next link */
            rv = new_node(data, pos->prev, pos);

            if(rv != nullptr)
            {
                if(pos->prev != nullptr)
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
static jsw_node *remove_node(jsw_list *list, jsw_node *pos)
{
    jsw_node *rv = nullptr;

    if(list != nullptr && pos != nullptr)
    {
        /* Shift off of the dummies */
        if(pos == list->head)
        {
            pos = pos->next;
        }

        if(pos == list->tail)
        {
            pos = pos->prev;
        }

        if(pos != list->head)
        {
            /* Remove a non-dummy node */
            rv = pos;

            /* Reset the list links if necessary */
            if(rv->prev != nullptr)
            {
                rv->prev->next = rv->next;
            }

            if(rv->next != nullptr)
            {
                rv->next->prev = rv->prev;
            }

            /* Clean up the old node */
            rv->prev = rv->next = nullptr;
            --list->size;
        }
    }

    return rv;
}

/*
    Insert a new node in sorted order
    Returns a pointer to the new node or NULL on failure
*/
static jsw_node *insert_sorted(jsw_list *list, void *data, Comparator compare)
{
    jsw_node *rv = nullptr;

    if(list != nullptr)
    {
        /* Find the sorted position of the new node */
        jsw_node *it = list->head;

        while(it->next != nullptr && compare(it->next->data, data) < 0)
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
static jsw_node *new_node(void *data, jsw_node *prev, jsw_node *next)
{
    jsw_node *rv = (jsw_node *)calloc(1, sizeof * rv);

    if(rv != nullptr)
    {
        rv->data = data;
        rv->prev = prev;
        rv->next = next;
    }

    return rv;
}

List *AllocateList()
{
    List *newList = (List *)calloc(1, sizeof(List));
    newList->implementation = new_list(true, true);

    return newList;
}

void FreeList(List *list)
{
    destroy_list(list->implementation, nullptr);
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

void AddToListSorted(List *list, void *data, Comparator compare)
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
    ListIterator *newIterator = (ListIterator *)calloc(1, sizeof(ListIterator));
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
    assert(iterator->cursor != nullptr);
    jsw_node *node = remove_node(iterator->linklist->implementation, iterator->cursor);
    assert(node != nullptr);
    destroy_node(node, nullptr);
    iterator->cursor = nullptr;
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

void *FindIfInList(const List *list, Predicate predicate, const void *userData)
{
    ListIterator *iterator = AllocateListIterator(list);
    void *result = nullptr;

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

void ForEachInList(const List *list, ForEachFunc action, void *userData)
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

size_t CountIfInList(const List *list, Predicate predicate, const void *userData)
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
