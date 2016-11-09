#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"

void do_ocreate( Character *ch, std::string argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex = NULL;
  Object *obj = NULL;
  vnum_t vnum = 0, cvnum = 0;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "Mobiles cannot create.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  vnum = IsNumber( arg ) ? atoi( arg ) : INVALID_VNUM;

  if ( vnum == INVALID_VNUM || IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: ocreate <vnum> [copy vnum] <item name>\r\n", ch );
      return;
    }

  if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
    {
      SendToCharacter( "Bad number.\r\n", ch );
      return;
    }

  OneArgument( argument, arg2 );
  cvnum = atoi( arg2 );

  if ( cvnum != INVALID_VNUM )
    argument = OneArgument( argument, arg2 );

  if ( cvnum < 1 )
    cvnum = INVALID_VNUM;

  if ( GetProtoObject( vnum ) )
    {
      SendToCharacter( "An object with that number already exists.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    return;

  if ( GetTrustLevel( ch ) <= LEVEL_IMMORTAL )
    {
      Area *pArea;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "You must have an assigned area to create objects.\r\n", ch );
          return;
        }

      if ( vnum < pArea->VnumRanges.Object.First
           ||   vnum > pArea->VnumRanges.Object.Last )
        {
          SendToCharacter( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if( cvnum == vnum )
    SendToCharacter( "The vnums must be different!\r\n", ch );

  pObjIndex = MakeObject( vnum, cvnum, argument );

  if ( !pObjIndex )
    {
      SendToCharacter( "Error.\r\n", ch );
      LogPrintf( "do_ocreate: MakeObject failed." );
      return;
    }

  obj = CreateObject( pObjIndex, GetTrustLevel(ch) );
  ObjectToCharacter( obj, ch );
  Act( AT_IMMORT, "$n makes some ancient arcane gestures, and opens $s hands to reveal $p!",
       ch, obj, NULL, TO_ROOM );
  Act( AT_IMMORT, "You make some ancient arcane gestures, and open your hands to reveal $p!",
       ch, obj, NULL, TO_CHAR );
}
