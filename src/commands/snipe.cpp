#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_snipe( Character *ch, char *argument )
{
  Object *wield = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  DirectionType dir = DIR_INVALID;
  short dist = 0;
  short max_dist = 1;
  Exit *pexit = NULL;
  Room *was_in_room = NULL;
  Room *to_room = NULL;
  Character *victim = NULL;
  int the_chance = 0;
  char buf[MAX_STRING_LENGTH];
  bool pfound = false;

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "You'll have to do that elswhere.\r\n", ch );
      return;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD ) != NULL )
    {
      SendToCharacter( "You can't do that while wielding two weapons.",ch );
      return;
    }

  wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );
  if ( !wield || wield->ItemType != ITEM_WEAPON || wield->Value[3] != WEAPON_BLASTER )
    {
      SendToCharacter( "You don't seem to be holding a blaster",ch );
      return;
    }

  if ( !IsNpc(ch) && ch->PCData->Learned[gsn_snipe]> 100)
    max_dist += (ch->PCData->Learned[gsn_snipe]) / 15;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( ( dir = GetDirection( arg ) ) == -1 || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Usage: snipe <dir> <target>\r\n", ch );
      return;
    }

  if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
    {
      SendToCharacter( "Are you expecting to fire through a wall!?\r\n", ch );
      return;
    }

  if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
    {
      SendToCharacter( "Are you expecting to fire through a door!?\r\n", ch );
      return;
    }

  was_in_room = ch->InRoom;

  for ( dist = 0; dist <= max_dist; dist++ )
    {
      if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
        break;

      if ( !pexit->ToRoom )
        break;

      to_room = NULL;

      if ( pexit->Distance > 1 )
        to_room = GenerateExit( ch->InRoom , &pexit );

      if ( to_room == NULL )
        to_room = pexit->ToRoom;

      CharacterFromRoom( ch );
      CharacterToRoom( ch, to_room );


      if ( IsNpc(ch) && ( victim = GetCharacterInRoomMudProg( ch, arg2 ) ) != NULL )
        {
          pfound = true;
          break;
        }
      else if ( !IsNpc(ch) && ( victim = GetCharacterInRoom( ch, arg2 ) ) != NULL )
        {
          pfound = true;
          break;
        }


      if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
        break;

    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, was_in_room );

  if ( !pfound )
    {
      Echo( ch, "You don't see that person to the %s!\r\n",
                 GetDirectionName(dir) );
      CharacterFromRoom( ch );
      CharacterToRoom( ch, was_in_room );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Shoot yourself ... really?\r\n", ch );
      return;
    }

  if ( IsBitSet( victim->InRoom->Flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "You can't shoot them there.\r\n", ch );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == victim )
    {
      Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      SendToCharacter( "You do the best you can!\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) && IsBitSet( ch->Flags, PLR_NICE ) )
    {
      SendToCharacter( "You feel too nice to do that!\r\n", ch );
      return;
    }

  the_chance = IsNpc(ch) ? 100
    : (int)  (ch->PCData->Learned[gsn_snipe]) ;

  switch ( dir )
    {
    case DIR_NORTH:
    case DIR_EAST:
      dir = (DirectionType)(dir + 2);
      break;

    case DIR_SOUTH:
    case DIR_WEST:
      dir = (DirectionType)(dir - 2);
      break;

    case DIR_UP:
    case DIR_NORTHWEST:
      dir = (DirectionType)(dir + 1);
      break;

    case DIR_DOWN:
    case DIR_SOUTHEAST:
      dir = (DirectionType)(dir - 1);
      break;

    case DIR_NORTHEAST:
      dir = (DirectionType)(dir + 3);
      break;

    case DIR_SOUTHWEST:
      dir = (DirectionType)(dir - 3);
      break;

    default:
      break;
    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, victim->InRoom );

  if ( GetRandomPercent() < the_chance )
    {
      sprintf( buf , "A blaster shot fires at you from the %s." , GetDirectionName(dir) );
      Act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
      Act( AT_ACTION, "You fire at $N.", ch, NULL, victim, TO_CHAR );
      sprintf( buf, "A blaster shot fires at $N from the %s." , GetDirectionName(dir) );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );

      HitOnce( ch, victim, TYPE_UNDEFINED );

      if ( CharacterDiedRecently(ch) )
        return;

      StopFighting( ch , true );

      LearnFromSuccess( ch, gsn_snipe );
    }
  else
    {
      Act( AT_ACTION, "You fire at $N but don't even come close.", ch, NULL, victim, TO_CHAR );
      sprintf( buf, "A blaster shot fired from the %s barely misses you." , GetDirectionName(dir) );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );
      LearnFromFailure( ch, gsn_snipe );
    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, was_in_room );

  if ( IsNpc(ch) )
    SetWaitState( ch, 1 * PULSE_VIOLENCE );
  else
    {
      if ( GetRandomPercent() < ch->PCData->Learned[gsn_third_attack] )
        SetWaitState( ch, 1 * PULSE_PER_SECOND );
      else if ( GetRandomPercent() < ch->PCData->Learned[gsn_second_attack] )
	SetWaitState( ch, 2 * PULSE_PER_SECOND );
      else
        SetWaitState( ch, 3 * PULSE_PER_SECOND );
    }
  if ( IsNpc( victim ) && !CharacterDiedRecently(victim) )
    {
      if ( IsBitSet( victim->Flags , ACT_SENTINEL ) )
        {
          victim->WasSentinel = victim->InRoom;
          RemoveBit( victim->Flags, ACT_SENTINEL );
        }

      StartHating( victim , ch );
      StartHunting( victim, ch );
    }
}
