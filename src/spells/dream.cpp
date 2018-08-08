#include "character.hpp"
#include "mud.hpp"

extern char *spell_target_name;

ch_ret spell_dream( int sn, int level, Character *ch, void *vo )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];

  spell_target_name = OneArgument(spell_target_name, arg);
  SetCharacterColor(AT_MAGIC, ch);
  if ( !(victim = GetCharacterAnywhere(ch, arg)) )
    {
      ch->Echo("They aren't here.\r\n");
      return rSPELL_FAILED;
    }
  if ( victim->Position != POS_SLEEPING )
    {
      ch->Echo("They aren't asleep.\r\n");
      return rSPELL_FAILED;
    }
  if ( victim->Race == RACE_DROID )
    {
      ch->Echo("Machines do not dream.\r\n");
      return rSPELL_FAILED;
    }

  if ( !spell_target_name )
    {
      ch->Echo("What do you want them to dream about?\r\n");
      return rSPELL_FAILED;
    }

  SetCharacterColor(AT_TELL, victim);
  victim->Echo("You have dreams about %s telling you '%s'.\r\n",
               PERS(ch, victim), spell_target_name);
  ch->Echo("Ok.\r\n");
  return rNONE;
}

