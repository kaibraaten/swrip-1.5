#include "character.h"
#include "mud.h"

void do_teach( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  int sn;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) )
    return;

  argument = one_argument(argument, arg);

  if ( argument[0] == '\0' )
    {
      send_to_char( "Teach who, what?\r\n", ch );
      return;
    }
  else
    {
      Character *victim;
      int adept;

      if ( !IsAwake(ch) )
        {
          send_to_char( "In your dreams, or what?\r\n", ch );
          return;
        }

      if ( ( victim = get_char_room( ch, arg ) ) == NULL )
        {
          send_to_char( "They don't seem to be here...\r\n", ch );
          return;
        }

      if (IsNpc(victim))
        {
	  send_to_char( "You can't teach that to them!\r\n", ch );
          return;
        }

      sn = skill_lookup( argument );

      if ( sn == -1 )
        {
          act( AT_TELL, "You have no idea what that is.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( skill_table[sn]->guild < 0  || skill_table[sn]->guild >= MAX_ABILITY )
        {
          act( AT_TELL, "Thats just not going to happen.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( GetAbilityLevel( victim, skill_table[sn]->guild ) < skill_table[sn]->min_level )
        {
          act( AT_TELL, "$n isn't ready to learn that yet.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( is_name( skill_tname[skill_table[sn]->type], CANT_PRAC ) )
        {
          act( AT_TELL, "You are unable to teach that skill.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      adept = 20;

      if ( victim->pcdata->learned[sn] >= adept )
        {
          act( AT_TELL, "$n must practice that on their own.", victim, NULL, ch, TO_VICT );
          return;
        }
      if ( ch->pcdata->learned[sn] < 100 )
        {
          act( AT_TELL, "You must perfect that yourself before teaching others.", victim, NULL, ch, TO_VICT );
          return;
	}
      else
        {
          victim->pcdata->learned[sn] += int_app[GetCurrentIntelligence(ch)].learn;
          sprintf( buf, "You teach %s $T.", victim->name );
          act( AT_ACTION, buf,
               ch, NULL, skill_table[sn]->name, TO_CHAR );
          sprintf( buf, "%s teaches you $T.", ch->name );
          act( AT_ACTION, buf,
               victim, NULL, skill_table[sn]->name, TO_CHAR );
        }
    }
}
