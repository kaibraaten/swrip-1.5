#include "mud.h"

void do_viewskills( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  int sn;
  int col;

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "&zSyntax: skills <player>.\r\n", ch );
      return;
    }
  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char("No such person in the game.\r\n", ch );
      return;
    }

  col = 0;

  if ( !IS_NPC( victim ) )
    {
      set_char_color( AT_MAGIC, ch );
      for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
        {
	  if ( skill_table[sn]->name == NULL )
            break;
          if ( victim->pcdata->learned[sn] == 0 )
            continue;

          sprintf( buf, "%20s %3d%% ", skill_table[sn]->name,
                   victim->pcdata->learned[sn]);
          send_to_char( buf, ch );

          if ( ++col % 3 == 0 )
            send_to_char( "\r\n", ch );
        }
    }
}
