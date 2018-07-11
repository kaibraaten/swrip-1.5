#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "event.h"

typedef struct EventHandlerData EventHandlerData;

typedef struct ListNode
{
  EventHandlerData *data;
  struct ListNode* next;
} ListNode;

typedef void (*ListCallback)(ListNode* data);

struct EventHandlerData
{
  void *UserData;
  EventHandler Func;
};

struct event_t
{
  ListNode *Handlers;
};

static ListNode* CreateNode(EventHandlerData *data, ListNode* next)
{
  ListNode* new_node = (ListNode*)calloc(1, sizeof(ListNode));

  if(new_node == NULL)
    {
      printf("Error creating a new node.\n");
      exit(0);
    }

  new_node->data = data;
  new_node->next = next;

  return new_node;
}

static void Traverse(ListNode *head, ListCallback f)
{
  ListNode* cursor = head;

  while(cursor != NULL)
    {
      f(cursor);
      cursor = cursor->next;
    }
}

static ListNode* RemoveFront(ListNode* head)
{
  ListNode *front = head;

  if(head == NULL)
    return NULL;

  head = head->next;
  front->next = NULL;
  /* is this the last node in the list */

  if(front == head)
    head = NULL;

  free(front);
  return head;
}

static ListNode* RemoveBack(ListNode* head)
{
  ListNode *cursor = head;
  ListNode *back = NULL;

  if(head == NULL)
    {
      return NULL;
    }

  while(cursor->next != NULL)
    {
      back = cursor;
      cursor = cursor->next;
    }

  if(back != NULL)
    back->next = NULL;

  /* if this is the last node in the list*/
  if(cursor == head)
    head = NULL;

  free(cursor);

  return head;
}

static ListNode* RemoveAny(ListNode* head, ListNode* nd)
{
  ListNode *cursor = NULL;

  if(nd == NULL)
    return NULL;

  /* if the node is the first node */
  if(nd == head)
    return RemoveFront(head);

  /* if the node is the last node */
  if(nd->next == NULL)
    return RemoveBack(head);

  /* if the node is in the middle */
  cursor = head;

  while(cursor != NULL)
    {
      if(cursor->next == nd)
        break;

      cursor = cursor->next;
    }

  if(cursor != NULL)
    {
      ListNode* tmp = cursor->next;
      cursor->next = tmp->next;
      tmp->next = NULL;
      free(tmp);
    }

  return head;
}

event_t *CreateEvent( void )
{
  return (event_t*)calloc(1, sizeof(event_t));
}

static void DeleteNode(ListNode *node)
{
  EventHandlerData *data = node->data;
  free(data);
}

static void DisposeList(ListNode *head)
{
  ListNode *cursor, *tmp;

  if(head != NULL)
    {
      cursor = head->next;
      head->next = NULL;

      while(cursor != NULL)
        {
          tmp = cursor->next;
          free(cursor);
          cursor = tmp;
        }
    }
}

static ListNode* InsertFront(ListNode* head, EventHandlerData *data)
{
  ListNode* new_node = CreateNode(data,head);
  head = new_node;
  return head;
}

void DestroyEvent( event_t *ev )
{
  Traverse(ev->Handlers, DeleteNode);
  DisposeList(ev->Handlers);
  free(ev);
}

void AddEventHandler( event_t *ev, void *userdata,
		      EventHandler func )
{
  EventHandlerData *data = (EventHandlerData*)calloc(1, sizeof(EventHandlerData));
  data->UserData = userdata;
  data->Func = func;

  ev->Handlers = InsertFront(ev->Handlers, data);
}

void RemoveEventHandler( event_t *ev, void *userdata,
			 EventHandler func )
{
  ListNode* cursor = ev->Handlers;

  while(cursor != NULL)
    {
      EventHandlerData *data = cursor->data;

      if(data->UserData == userdata && func != NULL)
        {
          ev->Handlers = RemoveAny(ev->Handlers, cursor);
          break;
        }

      cursor = cursor->next;
    }
}

void RaiseEvent( event_t *ev, void *eventArgs )
{
  ListNode* cursor = ev->Handlers;

  while(cursor != NULL)
    {
      EventHandlerData *data = cursor->data;
      data->Func(data->UserData, eventArgs);
      cursor = cursor->next;
    }
}
