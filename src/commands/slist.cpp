#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_slist( Character *ch, char *argument )
{
  int sn, i;
  char skn[MAX_INPUT_LENGTH];
  char skn2[MAX_INPUT_LENGTH];
  int lowlev = 1, hilev = 150;
  int col = 0;
  int ability;
  int filter_ability = GetAbility(argument);

  if ( IsNpc(ch) )
    {
      return;
    }

  SetPagerColor( AT_CYAN, ch );
  SendToPager("SKILL LIST\r\n",ch);
  SendToPager("------------------\r\n",ch);

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

      SetPagerColor( AT_CYAN, ch );
      SendToPager(skn,ch);

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
                  SetPagerColor( AT_LBLUE, ch );
                  PagerPrintf(ch, "(%3d) %-18.18s  ",
                               i,  Capitalize( skill->Name ) );

                  if ( ++col == 3 )
                    {
                      PagerPrintf(ch, "\r\n");
                      col = 0;
                    }
                }
            }
        }

      if ( col != 0 )
	{
          PagerPrintf(ch, "\r\n");
          col = 0;
        }
    }
}
