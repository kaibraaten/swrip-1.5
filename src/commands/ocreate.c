#include "character.h"
#include "mud.h"

void do_ocreate( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex = NULL;
  Object *obj = NULL;
  int vnum = 0, cvnum = 0;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "Mobiles cannot create.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  vnum = IsNumber( arg ) ? atoi( arg ) : -1;

  if ( vnum == -1 || !argument || argument[0] == '\0' )
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

  if ( cvnum != 0 )
    argument = OneArgument( argument, arg2 );

  if ( cvnum < 1 )
    cvnum = 0;

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

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          SendToCharacter( "You must have an assigned area to create objects.\r\n", ch );
          return;
        }

      if ( vnum < pArea->low_o_vnum
           ||   vnum > pArea->hi_o_vnum )
        {
          SendToCharacter( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if( cvnum == vnum )
    SendToCharacter( "The vnums must be different!\r\n", ch );

  pObjIndex = make_object( vnum, cvnum, argument );

  if ( !pObjIndex )
    {
      SendToCharacter( "Error.\r\n", ch );
      log_string( "do_ocreate: make_object failed." );
      return;
    }

  obj = CreateObject( pObjIndex, GetTrustLevel(ch) );
  obj_to_char( obj, ch );
  Act( AT_IMMORT, "$n makes some ancient arcane gestures, and opens $s hands to reveal $p!",
       ch, obj, NULL, TO_ROOM );
  Act( AT_IMMORT, "You make some ancient arcane gestures, and open your hands to reveal $p!",
       ch, obj, NULL, TO_CHAR );
}
