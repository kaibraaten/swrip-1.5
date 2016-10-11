#include "character.h"
#include "mud.h"
#include "skill.h"

void do_languages( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int lang;
  int sn;

  argument = OneArgument( argument, arg );

  if ( !IsNullOrEmpty( arg ) && !StringPrefix( arg, "learn" ) &&
       !IsImmortal(ch) && !IsNpc(ch) )
    {
      Character *sch;
      char arg2[MAX_INPUT_LENGTH];
      int prct;

      argument = OneArgument( argument, arg2 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          SendToCharacter( "Learn which language?\r\n", ch );
          return;
        }

      for ( lang = 0; LanguageArray[lang] != LANG_UNKNOWN; lang++ )
        {
          if ( LanguageArray[lang] == LANG_CLAN )
            continue;
          if ( !StringPrefix( arg2, LanguageNames[lang] ) )
            break;
        }

      if ( LanguageArray[lang] == LANG_UNKNOWN )
        {
          SendToCharacter( "That is not a language.\r\n", ch );
          return;
        }

      if ( !IsValidLanguage( LanguageArray[lang] ) )
        {
          Echo( ch, "You may not learn that language.\r\n" );
          return;
        }
      
      if ( ( sn = LookupSkill( LanguageNames[lang] ) ) < 0 )
        {
          SendToCharacter( "That is not a language.\r\n", ch );
	  return;
        }
      
      if ( RaceTable[ch->race].language & LanguageArray[lang] ||
           ch->pcdata->learned[sn] >= 99 )
        {
          Act( AT_PLAIN, "You are already fluent in $t.", ch,
               LanguageNames[lang], NULL, TO_CHAR );
          return;
        }

      for ( sch = ch->in_room->FirstPerson; sch; sch = sch->next )
        if ( IsNpc(sch) && IsBitSet(sch->Flags, ACT_SCHOLAR) &&
             CharacterKnowsLanguage( sch, ch->speaking, ch ) &&
             CharacterKnowsLanguage( sch, LanguageArray[lang], sch ) &&
             (!sch->speaking || CharacterKnowsLanguage( ch, sch->speaking, sch )) )
          break;

      if ( !sch )
        {
          SendToCharacter( "There is no one who can teach that language here.\r\n", ch );
          return;
        }

      if ( ch->gold < 25 )
        {
          SendToCharacter( "Language lessons cost 25 credits... you don't have enough.\r\n", ch );
          return;
        }
      ch->gold -= 25;
      /* Max 12% (5 + 4 + 3) at 24+ int and 21+ wis. -- Altrag */
      prct = 5 + (GetCurrentIntelligence(ch) / 6) + (GetCurrentWisdom(ch) / 7);
      ch->pcdata->learned[sn] += prct;
      ch->pcdata->learned[sn] = umin(ch->pcdata->learned[sn], 99);
      SetBit( ch->speaks, LanguageArray[lang] );

      if ( ch->pcdata->learned[sn] == prct )
        Act( AT_PLAIN, "You begin lessons in $t.", ch, LanguageNames[lang],
             NULL, TO_CHAR );
      else if ( ch->pcdata->learned[sn] < 60 )
        Act( AT_PLAIN, "You continue lessons in $t.", ch, LanguageNames[lang],
             NULL, TO_CHAR );
      else if ( ch->pcdata->learned[sn] < 60 + prct )
        Act( AT_PLAIN, "You feel you can start communicating in $t.", ch,
             LanguageNames[lang], NULL, TO_CHAR );
      else if ( ch->pcdata->learned[sn] < 99 )
        Act( AT_PLAIN, "You become more fluent in $t.", ch,
             LanguageNames[lang], NULL, TO_CHAR );
      else
        Act( AT_PLAIN, "You now speak perfect $t.", ch, LanguageNames[lang],
	     NULL, TO_CHAR );
      return;
    }

  for ( lang = 0; LanguageArray[lang] != LANG_UNKNOWN; lang++ )
    {
      if ( !IsValidLanguage( LanguageArray[lang] ) )
        continue;

      if ( ch->speaking & LanguageArray[lang] || (IsNpc(ch) && !ch->speaking) )
        SetCharacterColor( AT_RED, ch );
      else
        SetCharacterColor( AT_SAY, ch );

      if ( ( sn = LookupSkill( LanguageNames[lang] ) ) < 0 )
        SendToCharacter( "(  0) ", ch );
      else
        Echo( ch , "(%3d) ", ch->pcdata->learned[sn] );

      SendToCharacter( LanguageNames[lang], ch );
      SendToCharacter( "\r\n", ch );
    }

  SendToCharacter( "\r\n", ch );
}
