#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_slist( Character *ch, char *argument )
{
  int sn = 0, i = 0;
  char skn[MAX_INPUT_LENGTH];
  char skn2[MAX_INPUT_LENGTH / 2];
  int lowlev = 1, hilev = 150;
  int col = 0;
  int ability = 0;
  int filter_ability = GetAbility(argument);

  if ( IsNpc(ch) )
    {
      return;
    }

  SetCharacterColor( AT_CYAN, ch );
  ch->Echo("SKILL LIST\r\n");
  ch->Echo("------------------\r\n");

  for ( ability = -1 ; ability < MAX_ABILITY ; ability++ )
    {
      if ( ability == FORCE_ABILITY && !IsImmortal(ch) )
        {
          continue;
        }

      if( ability == COMMANDO_ABILITY )
	{
	  continue;
	}

      if(filter_ability != -1 && filter_ability != ability)
        {
          continue;
        }

      if ( ability >= 0 )
        {
          sprintf(skn2, "** %s **", Capitalize( AbilityName[ability] ) );
          sprintf(skn, "\r\n\t\t\t  %s \r\n", skn2 );
	}
      else
        {
          sprintf(skn, "\r\n\t\t\t** General Skills **\r\n" );
        }

      SetCharacterColor( AT_CYAN, ch );
      ch->Echo(skn);

      for (i=lowlev; i <= hilev; i++)
        {
          for ( sn = 0; sn < TopSN; sn++ )
            {
	      const Skill *skill = SkillTable[sn];

              if ( IsNullOrEmpty( skill->Name ) )
                {
                  break;
                }

              if ( skill->Guild != ability)
                {
                  continue;
                }

              if ( ch->PCData->Learned[sn] == 0
                   && SPELL_FLAG( skill, SF_SECRETSKILL ) )
                {
                  continue;
                }

              if( i == skill->Level )
                {
                  SetCharacterColor( AT_LBLUE, ch );
                  ch->Echo("(%3d) %-18.18s  ",
                               i,  Capitalize( skill->Name ) );

                  if ( ++col == 3 )
                    {
                      ch->Echo("\r\n");
                      col = 0;
                    }
                }
            }
        }

      if ( col != 0 )
	{
          ch->Echo("\r\n");
          col = 0;
        }
    }
}
