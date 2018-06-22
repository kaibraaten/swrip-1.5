#include "mud.h"

void do_mfind( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex;
  int hash;
  int nMatch;
  bool fAll;

  OneArgument( argument, arg );
  
  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Mfind whom?\r\n", ch );
      return;
    }

  fAll  = !StrCmp( arg, "all" );
  nMatch        = 0;
  SetPagerColor( AT_PLAIN, ch );

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pMobIndex = MobIndexHash[hash];
	  pMobIndex;
	  pMobIndex = pMobIndex->Next )
      if ( fAll || NiftyIsName( arg, pMobIndex->Name ) )
	{
	  nMatch++;
	  PagerPrintf( ch, "[%5d] %s\r\n",
			pMobIndex->Vnum, Capitalize( pMobIndex->ShortDescr ) );
	}

  if ( nMatch )
    PagerPrintf( ch, "Number of matches: %d\n", nMatch );
  else
    SendToCharacter( "Nothing like that in hell, earth, or heaven.\r\n", ch );
}
