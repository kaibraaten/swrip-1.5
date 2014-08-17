#include "character.h"
#include "mud.h"

void do_seduce ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Seduce whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }


  if ( IsAffectedBy(victim, AFF_CHARM) && victim->master )
    {
      act( AT_PLAIN, "But he'd rather follow $N!", ch, NULL, victim->master, TO_CHAR );
      return;
    }

  if ( circle_follow( victim, ch ) )
    {
      send_to_char( "Following in loops is not allowed... sorry.\r\n", ch );
      return;
    }


  SetWaitState( ch, skill_table[gsn_seduce]->beats );

  if ( victim->top_level - GetCurrentCharisma(ch) > ch->pcdata->learned[gsn_seduce] )
    {
      send_to_char("You failed.\r\n", ch);
      sprintf(buf, "%s failed to seduce you.", ch->name);
      send_to_char(buf, victim);
      global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
      return;
    }


  if ( victim->master )
    stop_follower( victim );

  learn_from_success( ch, gsn_seduce );
  add_follower( victim, ch );
}
