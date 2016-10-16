#include "character.h"
#include "mud.h"
#include "skill.h"

void show_char_to_char( Character *list, Character *ch );

void do_scan( Character *ch, char *argument )
{
  Room *was_in_room;
  Room *to_room;
  Exit *pexit;
  DirectionType dir = DIR_INVALID;
  short dist;
  short max_dist = 5;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Scan in a direction...\r\n", ch );
      return;
    }

  if ( ( dir = GetDirection( argument ) ) == -1 )
    {
      Echo( ch, "Scan in WHAT direction?\r\n" );
      return;
    }

  was_in_room = ch->InRoom;
  Act( AT_GREY, "Scanning $t...", ch, GetDirectionName(dir), NULL, TO_CHAR );
  Act( AT_GREY, "$n scans $t.", ch, GetDirectionName(dir), NULL, TO_ROOM );

  if ( IsNpc( ch )
       || ( GetRandomPercent() > ch->PCData->Learned[gsn_scan] ) )
    {
      Act( AT_GREY, "You stop scanning $t as your vision blurs.", ch,
           GetDirectionName(dir), NULL, TO_CHAR );
      LearnFromFailure( ch, gsn_scan );
      return;
    }


  if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
    {
      Act( AT_GREY, "You can't see $t.", ch, GetDirectionName(dir), NULL, TO_CHAR );
      return;
    }

  if ( ch->TopLevel < 50 ) max_dist--;
  if ( ch->TopLevel < 20 ) max_dist--;

  for ( dist = 1; dist <= max_dist; )
    {
      if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
        {
          if ( IsBitSet( pexit->Flags, EX_SECRET ) )
            Act( AT_GREY, "Your view $t is blocked by a wall.", ch,
                 GetDirectionName(dir), NULL, TO_CHAR );
          else
            Act( AT_GREY, "Your view $t is blocked by a door.", ch,
                 GetDirectionName(dir), NULL, TO_CHAR );
          break;
        }

      to_room = NULL;
      if ( pexit->Distance > 1 )
        to_room = GenerateExit( ch->InRoom , &pexit );

      if ( to_room == NULL )
        to_room = pexit->ToRoom;

      if ( IsRoomPrivate( ch, to_room )
           && GetTrustLevel(ch) < LEVEL_GREATER )
        {
          Act( AT_GREY, "Your view $t is blocked by a private room.", ch,
               GetDirectionName(dir), NULL, TO_CHAR );
	  break;
        }
      CharacterFromRoom( ch );
      CharacterToRoom( ch, to_room );
      SetCharacterColor( AT_RMNAME, ch );
      SendToCharacter( ch->InRoom->Name, ch );
      SendToCharacter( "\r\n", ch );
      ShowObjectListToCharacter( ch->InRoom->FirstContent, ch, false, false );
      show_char_to_char( ch->InRoom->FirstPerson, ch );

      switch( ch->InRoom->Sector )
        {
        default:
	  dist++;
	  break;

        case SECT_AIR:
          if ( GetRandomPercent() < 80 ) dist++;
	  break;

        case SECT_INSIDE:
        case SECT_FIELD:
        case SECT_UNDERGROUND:
          dist++;
	  break;

        case SECT_FOREST:
        case SECT_CITY:
        case SECT_DESERT:
        case SECT_HILLS:
          dist += 2;
	  break;

        case SECT_WATER_SWIM:
        case SECT_WATER_NOSWIM:
          dist += 3;
	  break;

        case SECT_MOUNTAIN:
        case SECT_UNDERWATER:
        case SECT_OCEANFLOOR:
          dist += 4;
	  break;
        }

      if ( dist >= max_dist )
        {
          Act( AT_GREY, "Your vision blurs with distance and you see no "
               "farther $t.", ch, GetDirectionName(dir), NULL, TO_CHAR );
          break;
        }
      if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
        {
          Act( AT_GREY, "Your view $t is blocked by a wall.", ch,
               GetDirectionName(dir), NULL, TO_CHAR );
          break;
        }
    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, was_in_room );
  LearnFromSuccess( ch, gsn_scan );
}
