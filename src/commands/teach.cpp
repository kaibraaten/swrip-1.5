#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_teach( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  int sn;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) )
    return;

  argument = OneArgument(argument, arg);

  if ( IsNullOrEmpty( argument ) )
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

      if ( SkillTable[sn]->Guild < 0  || SkillTable[sn]->Guild >= MAX_ABILITY )
        {
          Act( AT_TELL, "Thats just not going to happen.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( GetAbilityLevel( victim, SkillTable[sn]->Guild ) < SkillTable[sn]->Level )
        {
          Act( AT_TELL, "$n isn't ready to learn that yet.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      if ( IsName( SkillTypeName[SkillTable[sn]->Type], CANT_PRAC ) )
        {
          Act( AT_TELL, "You are unable to teach that skill.",
               victim, NULL, ch, TO_VICT );
          return;
        }

      adept = 20;

      if ( victim->PCData->Learned[sn] >= adept )
        {
          Act( AT_TELL, "$n must practice that on their own.", victim, NULL, ch, TO_VICT );
          return;
        }
      if ( ch->PCData->Learned[sn] < 100 )
        {
          Act( AT_TELL, "You must perfect that yourself before teaching others.", victim, NULL, ch, TO_VICT );
          return;
	}
      else
        {
          victim->PCData->Learned[sn] += IntelligenceBonus[GetCurrentIntelligence(ch)].Learn;
          sprintf( buf, "You teach %s $T.", victim->Name );
          Act( AT_ACTION, buf,
               ch, NULL, SkillTable[sn]->Name, TO_CHAR );
          sprintf( buf, "%s teaches you $T.", ch->Name );
          Act( AT_ACTION, buf,
               victim, NULL, SkillTable[sn]->Name, TO_CHAR );
        }
    }
}
