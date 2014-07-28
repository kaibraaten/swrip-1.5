#include "craft.h"

struct Craft
{
  int Foo;
};

Craft *AllocateCraft( void )
{
  Craft *craft = NULL;

  CREATE( craft, Craft, 1 );

  return craft;
}

void FreeCraft( Craft *craft )
{

}
