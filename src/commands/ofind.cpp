#include "mud.hpp"
#include "character.hpp"
#include "protoobject.hpp"

void do_ofind( Character *ch, std::string arg )
{
  ProtoObject *pObjIndex = nullptr;
  int nMatch = 0;
  bool fAll = false;

  if ( arg.empty() )
    {
      ch->Echo("Ofind what?\r\n");
      return;
    }

  SetCharacterColor( AT_PLAIN, ch );
  fAll  = !StrCmp( arg, "all" );

  for ( int hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pObjIndex = ObjectIndexHash[hash];
          pObjIndex;
          pObjIndex = pObjIndex->Next )
      if ( fAll || NiftyIsName( arg, pObjIndex->Name ) )
        {
          nMatch++;
          ch->Echo("[%5d] %s\r\n",
                   pObjIndex->Vnum, Capitalize( pObjIndex->ShortDescr ).c_str() );
        }

  if ( nMatch )
    ch->Echo("Number of matches: %d\n", nMatch );
  else
    ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}

