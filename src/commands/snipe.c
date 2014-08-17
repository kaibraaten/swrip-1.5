#include "character.h"
#include "mud.h"

void do_snipe( Character *ch, char *argument )
{
  OBJ_DATA        * wield;
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
      set_char_color( AT_MAGIC, ch );
      send_to_char( "You'll have to do that elswhere.\r\n", ch );
      return;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD ) != NULL )
    {
      send_to_char( "You can't do that while wielding two weapons.",ch );
      return;
    }

  wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );
  if ( !wield || wield->item_type != ITEM_WEAPON || wield->value[3] != WEAPON_BLASTER )
    {
      send_to_char( "You don't seem to be holding a blaster",ch );
      return;
    }

  if ( !IsNpc(ch) && ch->pcdata->learned[gsn_snipe]> 100)
    max_dist += (ch->pcdata->learned[gsn_snipe]) / 15;

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  if ( ( dir = get_dir( arg ) ) == -1 || arg2[0] == '\0' )
    {
      send_to_char( "Usage: snipe <dir> <target>\r\n", ch );
      return;
    }

  if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
    {
      send_to_char( "Are you expecting to fire through a wall!?\r\n", ch );
      return;
    }

  if ( IsBitSet( pexit->exit_info, EX_CLOSED ) )
    {
      send_to_char( "Are you expecting to fire through a door!?\r\n", ch );
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
        to_room = generate_exit( ch->in_room , &pexit );

      if ( to_room == NULL )
        to_room = pexit->to_room;

      char_from_room( ch );
      char_to_room( ch, to_room );


      if ( IsNpc(ch) && ( victim = get_char_room_mp( ch, arg2 ) ) != NULL )
        {
          pfound = true;
          break;
        }
      else if ( !IsNpc(ch) && ( victim = get_char_room( ch, arg2 ) ) != NULL )
        {
          pfound = true;
          break;
        }


      if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
        break;

    }

  char_from_room( ch );
  char_to_room( ch, was_in_room );

  if ( !pfound )
    {
      ch_printf( ch, "You don't see that person to the %s!\r\n",
                 get_dir_name(dir) );
      char_from_room( ch );
      char_to_room( ch, was_in_room );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Shoot yourself ... really?\r\n", ch );
      return;
    }

  if ( IsBitSet( victim->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "You can't shoot them there.\r\n", ch );
      return;
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == victim )
    {
      act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You do the best you can!\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) && IsBitSet( ch->act, PLR_NICE ) )
    {
      send_to_char( "You feel too nice to do that!\r\n", ch );
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

  char_from_room( ch );
  char_to_room( ch, victim->in_room );

  if ( number_percent() < the_chance )
    {
      sprintf( buf , "A blaster shot fires at you from the %s." , get_dir_name(dir) );
      act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
      act( AT_ACTION, "You fire at $N.", ch, NULL, victim, TO_CHAR );
      sprintf( buf, "A blaster shot fires at $N from the %s." , get_dir_name(dir) );
      act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );

      one_hit( ch, victim, TYPE_UNDEFINED );

      if ( char_died(ch) )
        return;

      stop_fighting( ch , true );

      learn_from_success( ch, gsn_snipe );
    }
  else
    {
      act( AT_ACTION, "You fire at $N but don't even come close.", ch, NULL, victim, TO_CHAR );
      sprintf( buf, "A blaster shot fired from the %s barely misses you." , get_dir_name(dir) );
      act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );
      learn_from_failure( ch, gsn_snipe );
    }

  char_from_room( ch );
  char_to_room( ch, was_in_room );

  if ( IsNpc(ch) )
    SetWaitState( ch, 1 * PULSE_VIOLENCE );
  else
    {
      if ( number_percent() < ch->pcdata->learned[gsn_third_attack] )
        SetWaitState( ch, 1 * PULSE_PER_SECOND );
      else if ( number_percent() < ch->pcdata->learned[gsn_second_attack] )
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

      start_hating( victim , ch );
      start_hunting( victim, ch );
    }
}
