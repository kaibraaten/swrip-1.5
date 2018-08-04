#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"

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

      if ( vnum < 1 || IsNpc(ch) || !ch->PCData->Build.Area )
        {
          SendToCharacter( "No such location.\r\n", ch );
          return;
        }

      if ( GetTrustLevel( ch ) < SysData.LevelToModifyProto &&
           !( ch->PCData->Bestowments && IsName( "intergoto", ch->PCData->Bestowments) ))

        {
          if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
            {
              SendToCharacter( "You must have an assigned area to create rooms.\r\n", ch );
              return;
            }
          if ( vnum < pArea->VnumRanges.Room.First
               ||   vnum > pArea->VnumRanges.Room.Last  )
            {
              SendToCharacter( "That room is not within your assigned range.\r\n", ch );
              return;
            }
        }

      location = MakeRoom( vnum );
      location->Area = ch->PCData->Build.Area;
      SetCharacterColor( AT_WHITE, ch );
      SendToCharacter( "Waving your hand, you form order from swirling chaos,\r\nand step into a new reality...\r\n", ch );
    }

  if ( IsRoomPrivate(ch, location ) )
    {
      SendToCharacter( "Overriding private flag!\r\n", ch );
    }

  if ( GetTrustLevel( ch ) < LEVEL_GREATER &&
       !( ch->PCData->Bestowments && IsName( "intergoto", ch->PCData->Bestowments) ))
    {
      vnum = atoi( arg );

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( vnum < pArea->VnumRanges.Room.First
           ||  vnum > pArea->VnumRanges.Room.Last )
        {
          SendToCharacter( "That room is not within your assigned range.\r\n", ch );
          return;
        }

      if ( ( ch->InRoom->Vnum < pArea->VnumRanges.Room.First
	     || ch->InRoom->Vnum > pArea->VnumRanges.Room.Last )
	   && !IsBitSet(ch->InRoom->Flags , ROOM_HOTEL) )
        {
          SendToCharacter( "Builders can only use goto from a hotel or in their zone.\r\n", ch );
          return;
        }
    }

  in_room = ch->InRoom;

  if ( ch->Fighting )
    StopFighting( ch, true );

  if ( !IsBitSet(ch->Flags, PLR_WIZINVIS) )
    {
      if ( ch->PCData && !IsNullOrEmpty( ch->PCData->BamfOut ) )
        Act( AT_IMMORT, "$T", ch, NULL, ch->PCData->BamfOut ,  TO_ROOM );
      else
        Act( AT_IMMORT, "$n $T", ch, NULL, "leaves in a swirl of the force.",  TO_ROOM );
    }

  ch->ReGoto = ch->InRoom->Vnum;
  CharacterFromRoom( ch );

  if ( ch->Mount )
    {
      CharacterFromRoom( ch->Mount );
      CharacterToRoom( ch->Mount, location );
    }

  CharacterToRoom( ch, location );

  if ( !IsBitSet(ch->Flags, PLR_WIZINVIS) )
    {
      if ( ch->PCData && !IsNullOrEmpty( ch->PCData->BamfIn ) )
        Act( AT_IMMORT, "$T", ch, NULL, ch->PCData->BamfIn ,  TO_ROOM );
      else
        Act( AT_IMMORT, "$n $T", ch, NULL, "enters in a swirl of the Force.",  TO_ROOM );
    }



  do_look( ch, "auto" );

  if ( ch->InRoom == in_room )
    return;

  for ( fch = in_room->FirstPerson; fch; fch = fch_next )
    {
      fch_next = fch->NextInRoom;
      if ( fch->Master == ch && IsImmortal(fch) )
        {
          Act( AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR );
          do_goto( fch, argument );
        }
    }
}
