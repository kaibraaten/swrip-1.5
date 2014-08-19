#include "character.h"
#include "mud.h"

void do_snipe( Character *ch, char *argument )
{
  Object        * wield;
  char              arg[MAX_INPUT_LENGTH];
  char              arg2[MAX_INPUT_LENGTH];
  short            dir, dist;
  short            max_dist = 1;
  Exit       * pexit;
  Room * was_in_room;
  Room * to_room;
  Character       * victim = NULL;
  int               the_chance;
  char              buf[MAX_STRING_LENGTH];
  bool              pfound = false;


  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
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
  if ( !wield || wield->item_type != ITEM_WEAPON || wield->value[3] != WEAPON_BLASTER )
    {
      SendToCharacter( "You don't seem to be holding a blaster",ch );
      return;
    }

  if ( !IsNpc(ch) && ch->pcdata->learned[gsn_snipe]> 100)
    max_dist += (ch->pcdata->learned[gsn_snipe]) / 15;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( ( dir = GetDirection( arg ) ) == -1 || arg2[0] == '\0' )
    {
      SendToCharacter( "Usage: snipe <dir> <target>\r\n", ch );
      return;
    }

  if ( ( pexit = GetExit( ch->in_room, dir ) ) == NULL )
    {
      SendToCharacter( "Are you expecting to fire through a wall!?\r\n", ch );
      return;
    }

  if ( IsBitSet( pexit->exit_info, EX_CLOSED ) )
    {
      SendToCharacter( "Are you expecting to fire through a door!?\r\n", ch );
      return;
    }

  was_in_room = ch->in_room;

  for ( dist = 0; dist <= max_dist; dist++ )
    {
      if ( IsBitSet( pexit->exit_info, EX_CLOSED ) )
        break;

      if ( !pexit->to_room )
        break;

      to_room = NULL;
      if ( pexit->distance > 1 )
        to_room = GenerateExit( ch->in_room , &pexit );

      if ( to_room == NULL )
        to_room = pexit->to_room;

      CharacterFromRoom( ch );
      CharacterToRoom( ch, to_room );


      if ( IsNpc(ch) && ( victim = GetCharacterInRoomMudProg( ch, arg2 ) ) != NULL )
        {
          pfound = true;
          break;
        }
      else if ( !IsNpc(ch) && ( victim = get_char_room( ch, arg2 ) ) != NULL )
        {
          pfound = true;
          break;
        }


      if ( ( pexit = GetExit( ch->in_room, dir ) ) == NULL )
        break;

    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, was_in_room );

  if ( !pfound )
    {
      ChPrintf( ch, "You don't see that person to the %s!\r\n",
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

  if ( IsBitSet( victim->in_room->room_flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "You can't shoot them there.\r\n", ch );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == victim )
    {
      Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      SendToCharacter( "You do the best you can!\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) && IsBitSet( ch->act, PLR_NICE ) )
    {
      SendToCharacter( "You feel too nice to do that!\r\n", ch );
      return;
    }

  the_chance = IsNpc(ch) ? 100
    : (int)  (ch->pcdata->learned[gsn_snipe]) ;

  switch ( dir )
    {
    case 0:
    case 1:
      dir += 2;
      break;
    case 2:
    case 3:
      dir -= 2;
      break;
    case 4:
    case 7:
      dir += 1;
      break;
    case 5:
    case 8:
      dir -= 1;
      break;
    case 6:
      dir += 3;
      break;
    case 9:
      dir -=3;
      break;
    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, victim->in_room );

  if ( GetRandomPercent() < the_chance )
    {
      sprintf( buf , "A blaster shot fires at you from the %s." , GetDirectionName(dir) );
      Act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
      Act( AT_ACTION, "You fire at $N.", ch, NULL, victim, TO_CHAR );
      sprintf( buf, "A blaster shot fires at $N from the %s." , GetDirectionName(dir) );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );

      HitOnce( ch, victim, TYPE_UNDEFINED );

      if ( char_died(ch) )
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
      if ( GetRandomPercent() < ch->pcdata->learned[gsn_third_attack] )
        SetWaitState( ch, 1 * PULSE_PER_SECOND );
      else if ( GetRandomPercent() < ch->pcdata->learned[gsn_second_attack] )
	SetWaitState( ch, 2 * PULSE_PER_SECOND );
      else
        SetWaitState( ch, 3 * PULSE_PER_SECOND );
    }
  if ( IsNpc( victim ) && !char_died(victim) )
    {
      if ( IsBitSet( victim->act , ACT_SENTINEL ) )
        {
          victim->was_sentinel = victim->in_room;
          RemoveBit( victim->act, ACT_SENTINEL );
        }

      StartHating( victim , ch );
      StartHunting( victim, ch );
    }
}
