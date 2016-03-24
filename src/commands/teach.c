#include "character.h"
#include "mud.h"
#include "skill.h"

void do_teach( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  int sn;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) )
    return;

  argument = OneArgument(argument, arg);

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Teach who, what?\r\n", ch );
      return;
    }
  else
    {
      Character *victim;
      int adept;

      if ( !IsAwake(ch) )
        {
          SendToCharacter( "In your dreams, or what?\r\n", ch );
          return;
        }

      if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
        {
          SendToCharacter( "They don't seem to be here...\r\n", ch );
          return;
        }

      if (IsNpc(victim))
        {
	  SendToCharacter( "You can't teach that to them!\r\n", ch );
          return;
        }

      sn = LookupSkill( argument );

      if ( sn == -1 )
        {
          Act( AT_TELL, "You have no idea what that is.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( SkillTable[sn]->guild < 0  || SkillTable[sn]->guild >= MAX_ABILITY )
        {
          Act( AT_TELL, "Thats just not going to happen.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( GetAbilityLevel( victim, SkillTable[sn]->guild ) < SkillTable[sn]->min_level )
        {
          Act( AT_TELL, "$n isn't ready to learn that yet.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( IsName( SkillTypeName[SkillTable[sn]->type], CANT_PRAC ) )
        {
          Act( AT_TELL, "You are unable to teach that skill.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      adept = 20;

      if ( victim->pcdata->learned[sn] >= adept )
        {
          Act( AT_TELL, "$n must practice that on their own.", victim, NULL, ch, TO_VICT );
          return;
        }
      if ( ch->pcdata->learned[sn] < 100 )
        {
          Act( AT_TELL, "You must perfect that yourself before teaching others.", victim, NULL, ch, TO_VICT );
          return;
	}
      else
        {
          victim->pcdata->learned[sn] += int_app[GetCurrentIntelligence(ch)].learn;
          sprintf( buf, "You teach %s $T.", victim->name );
          Act( AT_ACTION, buf,
               ch, NULL, SkillTable[sn]->name, TO_CHAR );
          sprintf( buf, "%s teaches you $T.", ch->name );
          Act( AT_ACTION, buf,
               victim, NULL, SkillTable[sn]->name, TO_CHAR );
        }
    }
}
