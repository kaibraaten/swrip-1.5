#include "character.h"
#include "mud.h"

void do_goto( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location;
  Character *fch;
  Character *fch_next;
  Room *in_room;
  Area *pArea;
  short vnum;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Goto where?\r\n", ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      vnum = atoi( arg );
      if ( vnum < 0 || get_room_index( vnum ) )
        {
          SendToCharacter( "You cannot find that...\r\n", ch );
          return;
	}

      if ( vnum < 1 || IsNpc(ch) || !ch->pcdata->area )
        {
          SendToCharacter( "No such location.\r\n", ch );
          return;
        }
      if ( GetTrustLevel( ch ) < sysdata.level_modify_proto &&
           !( ch->pcdata->bestowments && IsName( "intergoto", ch->pcdata->bestowments) ))

        {
          if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
            {
              SendToCharacter( "You must have an assigned area to create rooms.\r\n", ch );
              return;
            }
          if ( vnum < pArea->low_r_vnum
               ||   vnum > pArea->hi_r_vnum  )
            {
              SendToCharacter( "That room is not within your assigned range.\r\n", ch );
              return;
            }
        }
      location = make_room( vnum );
      if ( !location )
        {
          bug( "Goto: make_room failed", 0 );
          return;
        }
      location->area = ch->pcdata->area;
      SetCharacterColor( AT_WHITE, ch );
      SendToCharacter( "Waving your hand, you form order from swirling chaos,\r\nand step into a new reality...\r\n", ch );
    }

  if ( room_is_private(ch, location ) )
    {
      SendToCharacter( "Overriding private flag!\r\n", ch );
    }

  if ( GetTrustLevel( ch ) < LEVEL_GREATER &&
       !( ch->pcdata->bestowments && IsName( "intergoto", ch->pcdata->bestowments) ))
    {
      vnum = atoi( arg );

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          SendToCharacter( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( vnum < pArea->low_r_vnum
           ||  vnum > pArea->hi_r_vnum )
        {
          SendToCharacter( "That room is not within your assigned range.\r\n", ch );
          return;
        }

      if ( ( ch->in_room->vnum < pArea->low_r_vnum || ch->in_room->vnum > pArea->hi_r_vnum )
	   && !IsBitSet(ch->in_room->room_flags , ROOM_HOTEL) )
        {
          SendToCharacter( "Builders can only use goto from a hotel or in their zone.\r\n", ch );
          return;
        }

    }

  in_room = ch->in_room;

  if ( ch->fighting )
    stop_fighting( ch, true );

  if ( !IsBitSet(ch->act, PLR_WIZINVIS) )
    {
      if (ch->pcdata && ch->pcdata->bamfout[0] != '\0')
        Act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfout ,  TO_ROOM );
      else
        Act( AT_IMMORT, "$n $T", ch, NULL, "leaves in a swirl of the force.",  TO_ROOM );
    }

  ch->regoto = ch->in_room->vnum;
  char_from_room( ch );

  if ( ch->mount )
    {
      char_from_room( ch->mount );
      char_to_room( ch->mount, location );
    }

  char_to_room( ch, location );

  if ( !IsBitSet(ch->act, PLR_WIZINVIS) )
    {
      if (ch->pcdata && ch->pcdata->bamfin[0] != '\0')
        Act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfin ,  TO_ROOM );
      else
        Act( AT_IMMORT, "$n $T", ch, NULL, "enters in a swirl of the Force.",  TO_ROOM );
    }



  do_look( ch, "auto" );

  if ( ch->in_room == in_room )
    return;

  for ( fch = in_room->first_person; fch; fch = fch_next )
    {
      fch_next = fch->next_in_room;
      if ( fch->master == ch && IsImmortal(fch) )
        {
          Act( AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR );
          do_goto( fch, argument );
        }
    }
}
