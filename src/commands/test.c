#include <string.h>
#include "mud.h"

static void AccumulateSomething( void *element, void *userData )
{
  int *sum = (int*) userData;

  *sum += 1;
}

void do_test( Character *ch, char *argument )
{
  CerisList *list = CreateList();
  int sum = 0;
  int i = 0;

  for( i = 0; i < 100; ++i )
    {
      List_AddTail( list, NULL );
    }

  List_ForEach( list, AccumulateSomething, &sum );

  ch_printf( ch, "sum == %d\r\n", sum );

  DestroyList( list );
}
