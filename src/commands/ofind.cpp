#include "mud.hpp"
#include "character.hpp"
#include "protoobject.hpp"

void do_ofind( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex;
  int hash;
  int nMatch;
  bool fAll;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Ofind what?\r\n");
      return;
    }

  SetCharacterColor( AT_PLAIN, ch );
  fAll  = !StrCmp( arg, "all" );
  nMatch        = 0;

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pObjIndex = ObjectIndexHash[hash];
          pObjIndex;
          pObjIndex = pObjIndex->Next )
      if ( fAll || NiftyIsName( arg, pObjIndex->Name ) )
        {
          nMatch++;
          ch->Echo("[%5d] %s\r\n",
                        pObjIndex->Vnum, Capitalize( pObjIndex->ShortDescr ) );
        }

  if ( nMatch )
    ch->Echo("Number of matches: %d\n", nMatch );
  else
    ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}

