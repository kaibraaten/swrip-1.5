#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_mfind( Character *ch, std::string argument )
{
  std::string arg;
  ProtoMobile *pMobIndex = nullptr;
  int hash = 0;
  int nMatch = 0;

  OneArgument( argument, arg );
  
  if ( arg.empty() )
    {
      ch->Echo("Mfind whom?\r\n");
      return;
    }

  bool fAll = !StrCmp( arg, "all" );
  SetCharacterColor( AT_PLAIN, ch );

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pMobIndex = MobIndexHash[hash];
	  pMobIndex;
	  pMobIndex = pMobIndex->Next )
      if ( fAll || NiftyIsName( arg, pMobIndex->Name ) )
	{
	  nMatch++;
          ch->Echo("[%5d] %s\r\n",
                   pMobIndex->Vnum, Capitalize( pMobIndex->ShortDescr ).c_str() );
	}

  if ( nMatch )
    ch->Echo("Number of matches: %d\n", nMatch );
  else
    ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}

