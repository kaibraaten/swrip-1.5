#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_dream( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];

  spell_target_name = one_argument(spell_target_name, arg);
  set_char_color(AT_MAGIC, ch);
  if ( !(victim = get_char_world(ch, arg)) )
    {
      send_to_char("They aren't here.\r\n", ch);
      return rSPELL_FAILED;
    }
  if ( victim->position != POS_SLEEPING )
    {
      send_to_char("They aren't asleep.\r\n", ch);
      return rSPELL_FAILED;
    }
  if ( victim->race == RACE_DROID )
    {
      send_to_char("Machines do not dream.\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( !spell_target_name )
    {
      send_to_char("What do you want them to dream about?\r\n", ch );
      return rSPELL_FAILED;
    }

  set_char_color(AT_TELL, victim);
  ch_printf(victim, "You have dreams about %s telling you '%s'.\r\n",
            PERS(ch, victim), spell_target_name);
  send_to_char("Ok.\r\n", ch);
  return rNONE;
}
