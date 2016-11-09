#include "mud.hpp"

void do_ofind( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex;
  int hash;
  int nMatch;
  bool fAll;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Ofind what?\r\n", ch );
      return;
    }

  SetPagerColor( AT_PLAIN, ch );
  fAll  = !StrCmp( arg, "all" );
  nMatch        = 0;

  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pObjIndex = ObjectIndexHash[hash];
          pObjIndex;
          pObjIndex = pObjIndex->Next )
      if ( fAll || NiftyIsName( arg, pObjIndex->Name ) )
        {
          nMatch++;
          PagerPrintf( ch, "[%5d] %s\r\n",
                        pObjIndex->Vnum, Capitalize( pObjIndex->ShortDescr ) );
        }

  if ( nMatch )
    PagerPrintf( ch, "Number of matches: %d\n", nMatch );
  else
    SendToCharacter( "Nothing like that in hell, earth, or heaven.\r\n", ch );
}
