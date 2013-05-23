#include "character.h"
#include "mud.h"

void do_slist( CHAR_DATA *ch, char *argument )
{
  int sn, i;
  char skn[MAX_INPUT_LENGTH];
  char skn2[MAX_INPUT_LENGTH];
  int lowlev = 1, hilev = 150;
  int col = 0;
  int ability;
  int filter_ability = get_ability(argument);

  if ( is_npc(ch) )
    {
      return;
    }

  set_pager_color( AT_CYAN, ch );
  send_to_pager("SKILL LIST\r\n",ch);
  send_to_pager("------------------\r\n",ch);

  for ( ability = -1 ; ability < MAX_ABILITY ; ability++ )
    {
      if ( ability == FORCE_ABILITY && !IS_IMMORTAL(ch) )
        {
          continue;
        }

      if(filter_ability != -1 && filter_ability != ability)
        {
          continue;
        }

      if ( ability >= 0 )
        {
          sprintf(skn2, "** %s **", ability_name[ability] );
          sprintf(skn, "\r\n\t\t\t  %s \r\n", skn2 );
	}
      else
        {
          sprintf(skn, "\r\n\t\t\t** General Skills **\r\n" );
        }

      set_pager_color( AT_CYAN, ch );
      send_to_pager(skn,ch);

      for (i=lowlev; i <= hilev; i++)
        {
          for ( sn = 0; sn < top_sn; sn++ )
            {
              if ( !skill_table[sn]->name )
                {
                  break;
                }

              if ( skill_table[sn]->guild != ability)
                {
                  continue;
                }

              if ( ch->pcdata->learned[sn] == 0
                   && SPELL_FLAG(skill_table[sn], SF_SECRETSKILL) )
                {
                  continue;
                }

              if(i==skill_table[sn]->min_level )
                {
                  set_pager_color( AT_LBLUE, ch );
                  pager_printf(ch, "(%3d) %-18.18s  ",
                               i,  skill_table[sn]->name );

                  if ( ++col == 3 )
                    {
                      pager_printf(ch, "\r\n");
                      col = 0;
                    }
                }
            }
        }

      if ( col != 0 )
	{
          pager_printf(ch, "\r\n");
          col = 0;
        }
    }
}
