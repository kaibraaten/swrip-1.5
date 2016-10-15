#include "character.h"
#include "mud.h"
#include "skill.h"

void do_affected ( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  Affect *paf;
  Skill *skill;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  if ( !StrCmp( arg, "by" ) )
    {
      SetCharacterColor( AT_BLUE, ch );
      SendToCharacter( "\r\nImbued with:\r\n", ch );
      SetCharacterColor( AT_SCORE, ch );
      Echo( ch, "%s\r\n", FlagString( ch->AffectedBy, AffectFlags ) );

      if ( ch->TopLevel >= 20 )
        {
          SendToCharacter( "\r\n", ch );

          if ( ch->Resistant > 0 )
            {
              SetCharacterColor ( AT_BLUE, ch );
              SendToCharacter( "Resistances:  ", ch );
              SetCharacterColor( AT_SCORE, ch );
              Echo( ch, "%s\r\n", FlagString(ch->Resistant, RisFlags) );
            }

          if ( ch->Immune > 0 )
            {
              SetCharacterColor( AT_BLUE, ch );
              SendToCharacter( "Immunities:   ", ch);
	      SetCharacterColor( AT_SCORE, ch );
              Echo( ch, "%s\r\n", FlagString(ch->Immune, RisFlags) );
            }

          if ( ch->Susceptible > 0 )
            {
              SetCharacterColor( AT_BLUE, ch );
              SendToCharacter( "Suscepts:     ", ch );
              SetCharacterColor( AT_SCORE, ch );
              Echo( ch, "%s\r\n", FlagString(ch->Susceptible, RisFlags) );
            }
        }

      return;
    }

  if ( !ch->FirstAffect )
    {
      SetCharacterColor( AT_SCORE, ch );
      SendToCharacter( "\r\nNo cantrip or skill affects you.\r\n", ch );
    }
  else
    {
      SendToCharacter( "\r\n", ch );

      for (paf = ch->FirstAffect; paf; paf = paf->Next)
	{
	  if ( (skill=GetSkill(paf->Type)) != NULL )
	    {
	      SetCharacterColor( AT_BLUE, ch );
	      SendToCharacter( "Affected:  ", ch );
	      SetCharacterColor( AT_SCORE, ch );

	      if ( ch->TopLevel >= 20 )
		{
		  if (paf->Duration < 25 )
		    {
		      SetCharacterColor( AT_WHITE, ch );
		    }

		  if (paf->Duration < 6  )
		    {
		      SetCharacterColor( AT_WHITE + AT_BLINK, ch );
		    }

		  Echo( ch, "(%5d)   ", paf->Duration );
		}

	      Echo( ch, "%s\r\n", skill->Name );
	    }
	}
    }
}
