#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "event.h"

struct DataEventArgs
{
  char Data[4096];
};

struct PointlessEventArgs
{

};

/*
 * Subject/Publisher
 *
 */
struct MySubject
{
  event_t *OnData;
  event_t *Pointless;
  event_t *IntegerEvent;
};

static struct MySubject *MySubjectCreate( void )
{
  struct MySubject *s = (struct MySubject*)calloc( 1, sizeof(struct MySubject) );
  s->OnData = CreateEvent();
  s->Pointless = CreateEvent();
  s->IntegerEvent = CreateEvent();

  return s;
}

static void MySubjectDestroy( struct MySubject *s )
{
  DestroyEvent( s->OnData );
  DestroyEvent( s->Pointless );
  DestroyEvent( s->IntegerEvent );
  free(s);
}

static void MySubjectRun( struct MySubject *subject )
{
  struct DataEventArgs dea;
  strcpy( dea.Data, "This is the data from MySubject" );
  RaiseEvent( subject->OnData, &dea );

  struct PointlessEventArgs pea;
  RaiseEvent( subject->Pointless, &pea );

  int twentyThree = 23;
  RaiseEvent( subject->IntegerEvent, &twentyThree );
}

/*
 * Observer/Subscriber
 */
struct MyObserver
{
  const char *Name;
  struct MySubject *Subject;
};

/*
 * Event handlers
 */
static void DataHandler( void *UserData, void *args )
{
  struct MyObserver *o = (struct MyObserver*) UserData;
  struct DataEventArgs *a = (struct DataEventArgs*) args;

  printf( "struct MyObserver, \"%s\", %s: %s\n",
	  o->Name, __FUNCTION__, a->Data );
}

static void PointlessHandler( void *UserData, void *args )
{
  struct MyObserver *o = (struct MyObserver*) UserData;
  printf( "struct MyObserver, \"%s\", %s\n", o->Name, __FUNCTION__ );
}

static void FooHandler( void *userData, void *args )
{
  struct MyObserver *o = (struct MyObserver*) userData;
  printf( "struct MyObserver, \"%s\", %s\n", o->Name, __FUNCTION__ );
}

static void IntegerHandler( void *UserData, void *args )
{
  struct MyObserver *o = (struct MyObserver*) UserData;
  int *twentyThree = (int*) args;
  printf( "struct MyObserver, \"%s\", %s: %d\n",
	  o->Name, __FUNCTION__, *twentyThree );
}

/*
 * Try it all out
 */
int main( int argc, char **argv )
{
  struct MySubject *sub = MySubjectCreate();
  struct MyObserver bob = { "Bob", sub };
  struct MyObserver will = { "Will", sub };

  printf("  --> Registering eventhandlers\r\n");
  AddEventHandler( sub->OnData, &bob, DataHandler );
  AddEventHandler( sub->Pointless, &bob, PointlessHandler );
  AddEventHandler( sub->IntegerEvent, &bob, IntegerHandler );
  AddEventHandler( sub->Pointless, &bob, FooHandler );
  AddEventHandler( sub->OnData, &will, DataHandler );
  AddEventHandler( sub->Pointless, &will, PointlessHandler );
  AddEventHandler( sub->IntegerEvent, &will, IntegerHandler );

  printf("  --> Raising events\r\n");
  MySubjectRun( sub );

  printf("  --> Unregistering some handlers\r\n");
  RemoveEventHandler( sub->OnData, &will, DataHandler );
  RemoveEventHandler( sub->Pointless, &bob, FooHandler );
  RemoveEventHandler( sub->IntegerEvent, &will, IntegerHandler );


  printf("  --> Raising events\r\n");
  MySubjectRun( sub );

  printf("-------------------------------------------------------------------------------\r\n");

  MySubjectDestroy( sub );
  return 0;
}
