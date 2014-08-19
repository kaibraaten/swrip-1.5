#include "mud.h"

extern ProtoObject *obj_index_hash[MAX_KEY_HASH];

void do_ofind( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex;
  int hash;
  int nMatch;
  bool fAll;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Ofind what?\r\n", ch );
      return;
    }

  SetPagerColor( AT_PLAIN, ch );
  fAll  = !StrCmp( arg, "all" );
  nMatch        = 0;

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pObjIndex = obj_index_hash[hash];
          pObjIndex;
          pObjIndex = pObjIndex->next )
      if ( fAll || NiftyIsName( arg, pObjIndex->name ) )
        {
          nMatch++;
          PagerPrintf( ch, "[%5d] %s\r\n",
                        pObjIndex->vnum, Capitalize( pObjIndex->short_descr ) );
        }

  if ( nMatch )
    PagerPrintf( ch, "Number of matches: %d\n", nMatch );
  else
    SendToCharacter( "Nothing like that in hell, earth, or heaven.\r\n", ch );
}
