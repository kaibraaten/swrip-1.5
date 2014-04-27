#include "mud.h"

extern OBJ_INDEX_DATA *obj_index_hash[MAX_KEY_HASH];

void do_ofind( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_INDEX_DATA *pObjIndex;
  int hash;
  int nMatch;
  bool fAll;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Ofind what?\r\n", ch );
      return;
    }

  set_pager_color( AT_PLAIN, ch );
  fAll  = !str_cmp( arg, "all" );
  nMatch        = 0;

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pObjIndex = obj_index_hash[hash];
          pObjIndex;
          pObjIndex = pObjIndex->next )
      if ( fAll || nifty_is_name( arg, pObjIndex->name ) )
        {
          nMatch++;
          pager_printf( ch, "[%5d] %s\r\n",
                        pObjIndex->vnum, capitalize( pObjIndex->short_descr ) );
        }

  if ( nMatch )
    pager_printf( ch, "Number of matches: %d\n", nMatch );
  else
    send_to_char( "Nothing like that in hell, earth, or heaven.\r\n", ch );
}
