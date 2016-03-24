#include "character.h"
#include "mud.h"
#include "skill.h"

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
          sprintf(skn2, "** %s **", Capitalize( ability_name[ability] ) );
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
              if ( !SkillTable[sn]->name )
                {
                  break;
                }

              if ( SkillTable[sn]->guild != ability)
                {
                  continue;
                }

              if ( ch->pcdata->learned[sn] == 0
                   && SPELL_FLAG(SkillTable[sn], SF_SECRETSKILL) )
                {
                  continue;
                }

              if(i==SkillTable[sn]->min_level )
                {
                  SetPagerColor( AT_LBLUE, ch );
                  PagerPrintf(ch, "(%3d) %-18.18s  ",
                               i,  Capitalize( SkillTable[sn]->name ) );

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
