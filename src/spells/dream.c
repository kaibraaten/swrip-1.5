#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_dream( int sn, int level, Character *ch, void *vo )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];

  spell_target_name = OneArgument(spell_target_name, arg);
  SetCharacterColor(AT_MAGIC, ch);
  if ( !(victim = GetCharacterAnywhere(ch, arg)) )
    {
      SendToCharacter("They aren't here.\r\n", ch);
      return rSPELL_FAILED;
    }
  if ( victim->position != POS_SLEEPING )
    {
      SendToCharacter("They aren't asleep.\r\n", ch);
      return rSPELL_FAILED;
    }
  if ( victim->race == RACE_DROID )
    {
      SendToCharacter("Machines do not dream.\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( !spell_target_name )
    {
      SendToCharacter("What do you want them to dream about?\r\n", ch );
      return rSPELL_FAILED;
    }

  SetCharacterColor(AT_TELL, victim);
  ChPrintf(victim, "You have dreams about %s telling you '%s'.\r\n",
            PERS(ch, victim), spell_target_name);
  SendToCharacter("Ok.\r\n", ch);
  return rNONE;
}
