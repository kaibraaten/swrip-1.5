#include "character.h"
#include "mud.h"

void do_goto( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;
  Character *fch = NULL;
  Character *fch_next = NULL;
  Room *in_room = NULL;
  Area *pArea = NULL;
  vnum_t vnum = INVALID_VNUM;

  OneArgument( argument, arg );
  
  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Goto where?\r\n", ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      vnum = atoi( arg );
      
      if ( vnum < 0 || GetRoom( vnum ) )
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
          if ( vnum < pArea->VnumRanges.FirstRoom
               ||   vnum > pArea->VnumRanges.LastRoom  )
            {
              SendToCharacter( "That room is not within your assigned range.\r\n", ch );
              return;
            }
        }

      location = MakeRoom( vnum );

      if ( !location )
        {
          Bug( "Goto: MakeRoom failed", 0 );
          return;
        }

      location->Area = ch->pcdata->area;
      SetCharacterColor( AT_WHITE, ch );
      SendToCharacter( "Waving your hand, you form order from swirling chaos,\r\nand step into a new reality...\r\n", ch );
    }

  if ( IsRoomPrivate(ch, location ) )
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

      if ( vnum < pArea->VnumRanges.FirstRoom
           ||  vnum > pArea->VnumRanges.LastRoom )
        {
          SendToCharacter( "That room is not within your assigned range.\r\n", ch );
          return;
        }

      if ( ( ch->in_room->Vnum < pArea->VnumRanges.FirstRoom
	     || ch->in_room->Vnum > pArea->VnumRanges.LastRoom )
	   && !IsBitSet(ch->in_room->Flags , ROOM_HOTEL) )
        {
          SendToCharacter( "Builders can only use goto from a hotel or in their zone.\r\n", ch );
          return;
        }
    }

  in_room = ch->in_room;

  if ( ch->fighting )
    StopFighting( ch, true );

  if ( !IsBitSet(ch->Flags, PLR_WIZINVIS) )
    {
      if ( ch->pcdata && !IsNullOrEmpty( ch->pcdata->bamfout ) )
        Act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfout ,  TO_ROOM );
      else
        Act( AT_IMMORT, "$n $T", ch, NULL, "leaves in a swirl of the force.",  TO_ROOM );
    }

  ch->regoto = ch->in_room->Vnum;
  CharacterFromRoom( ch );

  if ( ch->mount )
    {
      CharacterFromRoom( ch->mount );
      CharacterToRoom( ch->mount, location );
    }

  CharacterToRoom( ch, location );

  if ( !IsBitSet(ch->Flags, PLR_WIZINVIS) )
    {
      if ( ch->pcdata && !IsNullOrEmpty( ch->pcdata->bamfin ) )
        Act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfin ,  TO_ROOM );
      else
        Act( AT_IMMORT, "$n $T", ch, NULL, "enters in a swirl of the Force.",  TO_ROOM );
    }



  do_look( ch, "auto" );

  if ( ch->in_room == in_room )
    return;

  for ( fch = in_room->FirstPerson; fch; fch = fch_next )
    {
      fch_next = fch->next_in_room;
      if ( fch->master == ch && IsImmortal(fch) )
        {
          Act( AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR );
          do_goto( fch, argument );
        }
    }
}
