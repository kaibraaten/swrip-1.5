#include "character.h"
#include "mud.h"

void do_punch( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];

  if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IS_NPC(ch)
       &&   ch->pcdata->learned[gsn_punch] <= 0 )
    {
      send_to_char(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {

      one_argument( argument, arg );

      if ( arg[0] == '\0' )
        {
          send_to_char( "Punch whom?\r\n", ch );
          return;
        }

      if ( ( victim = get_char_room( ch, arg ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( !IS_NPC(victim) )
        {
          send_to_char( "You must MURDER a player.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          send_to_char( "You punch yourself.  Ouch!\r\n", ch );
          multi_hit( ch, ch, TYPE_UNDEFINED );
	  return;
        }

      if ( is_safe( ch, victim ) )
        return;

      if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }

      if ( victim->vip_flags != 0 )
        ch->alignment -= 10;
    }

  WAIT_STATE( ch, skill_table[gsn_punch]->beats );

  if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_punch] )
    {
      learn_from_success( ch, gsn_punch );
      global_retcode = damage( ch, victim, number_range( 1, get_level(ch, COMBAT_ABILITY ) ), gsn_punch );
    }
  else
    {
      learn_from_failure( ch, gsn_punch );
      global_retcode = damage( ch, victim, 0, gsn_punch );
    }
}
