#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_ocreate( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex = NULL;
  Object *obj = NULL;
  vnum_t vnum = INVALID_VNUM;
  vnum_t cvnum = INVALID_VNUM;

  if ( IsNpc(ch) )
    {
      ch->Echo("Mobiles cannot create.\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  vnum = IsNumber( arg ) ? atoi( arg ) : INVALID_VNUM;

  if ( vnum == INVALID_VNUM || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: ocreate <vnum> [copy vnum] <item name>\r\n");
      return;
    }

  if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
    {
      ch->Echo("Bad number.\r\n");
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
      ch->Echo("An object with that number already exists.\r\n");
      return;
    }

  if ( IsNpc( ch ) )
    return;

  if ( GetTrustLevel( ch ) <= LEVEL_IMMORTAL )
    {
      Area *pArea;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          ch->Echo("You must have an assigned area to create objects.\r\n");
          return;
        }

      if ( vnum < pArea->VnumRanges.Object.First
           ||   vnum > pArea->VnumRanges.Object.Last )
        {
          ch->Echo("That number is not in your allocated range.\r\n");
          return;
        }
    }

  if( cvnum == vnum )
    ch->Echo("The vnums must be different!\r\n");

  pObjIndex = MakeObject( vnum, cvnum, argument );

  if ( !pObjIndex )
    {
      ch->Echo("Error.\r\n");
      Log->Bug( "do_ocreate: MakeObject failed." );
      return;
    }

  obj = CreateObject( pObjIndex, GetTrustLevel(ch) );
  ObjectToCharacter( obj, ch );
  Act( AT_IMMORT, "$n makes some ancient arcane gestures, and opens $s hands to reveal $p!",
       ch, obj, NULL, TO_ROOM );
  Act( AT_IMMORT, "You make some ancient arcane gestures, and open your hands to reveal $p!",
       ch, obj, NULL, TO_CHAR );
}

