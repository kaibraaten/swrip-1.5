#include "mud.h"

extern ProtoMobile *mob_index_hash[MAX_KEY_HASH];

void do_mfind( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex;
  int hash;
  int nMatch;
  bool fAll;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Mfind whom?\r\n", ch );
      return;
    }

  fAll  = !StrCmp( arg, "all" );
  nMatch        = 0;
  set_pager_color( AT_PLAIN, ch );

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pMobIndex = mob_index_hash[hash];
	  pMobIndex;
	  pMobIndex = pMobIndex->next )
      if ( fAll || NiftyIsName( arg, pMobIndex->player_name ) )
	{
	  nMatch++;
	  pager_printf( ch, "[%5d] %s\r\n",
			pMobIndex->vnum, Capitalize( pMobIndex->short_descr ) );
	}

  if ( nMatch )
    pager_printf( ch, "Number of matches: %d\n", nMatch );
  else
    send_to_char( "Nothing like that in hell, earth, or heaven.\r\n", ch );
}
