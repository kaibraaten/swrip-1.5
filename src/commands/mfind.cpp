#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"

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
      ch->Echo("Mfind whom?\r\n");
      return;
    }

  fAll  = !StrCmp( arg, "all" );
  nMatch        = 0;
  SetCharacterColor( AT_PLAIN, ch );

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pMobIndex = MobIndexHash[hash];
	  pMobIndex;
	  pMobIndex = pMobIndex->Next )
      if ( fAll || NiftyIsName( arg, pMobIndex->Name ) )
	{
	  nMatch++;
   ch->Echo("[%5d] %s\r\n",
			pMobIndex->Vnum, Capitalize( pMobIndex->ShortDescr ) );
	}

  if ( nMatch )
    ch->Echo("Number of matches: %d\n", nMatch );
  else
    ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}

