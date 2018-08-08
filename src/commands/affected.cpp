#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

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
      ch->Echo( "\r\nImbued with:\r\n" );
      SetCharacterColor( AT_SCORE, ch );
      ch->Echo( "%s\r\n", FlagString( ch->AffectedBy, AffectFlags ).c_str() );

      if ( ch->TopLevel >= 20 )
        {
          ch->Echo( "\r\n" );

          if ( ch->Resistant > 0 )
            {
              SetCharacterColor ( AT_BLUE, ch );
              ch->Echo( "Resistances:  " );
              SetCharacterColor( AT_SCORE, ch );
              ch->Echo( "%s\r\n", FlagString(ch->Resistant, RisFlags).c_str() );
            }

          if ( ch->Immune > 0 )
            {
              SetCharacterColor( AT_BLUE, ch );
              ch->Echo( "Immunities:   " );
	      SetCharacterColor( AT_SCORE, ch );
              ch->Echo( "%s\r\n", FlagString(ch->Immune, RisFlags).c_str() );
            }

          if ( ch->Susceptible > 0 )
            {
              SetCharacterColor( AT_BLUE, ch );
              ch->Echo( "Suscepts:     " );
              SetCharacterColor( AT_SCORE, ch );
              ch->Echo( "%s\r\n", FlagString(ch->Susceptible, RisFlags).c_str() );
            }
        }

      return;
    }

  if ( !ch->FirstAffect )
    {
      SetCharacterColor( AT_SCORE, ch );
      ch->Echo( "\r\nNo cantrip or skill affects you.\r\n" );
    }
  else
    {
      ch->Echo( "\r\n" );

      for (paf = ch->FirstAffect; paf; paf = paf->Next)
	{
	  if ( (skill=GetSkill(paf->Type)) != NULL )
	    {
	      SetCharacterColor( AT_BLUE, ch );
	      ch->Echo( "Affected:  " );
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

		  ch->Echo( "(%5d)   ", paf->Duration );
		}

	      ch->Echo( "%s\r\n", skill->Name );
	    }
	}
    }
}

