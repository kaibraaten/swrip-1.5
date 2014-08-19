#include "character.h"
#include "mud.h"

void do_viewskills( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim;
  int sn;
  int col;

  argument = OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "&zSyntax: skills <player>.\r\n", ch );
      return;
    }
  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter("No such person in the game.\r\n", ch );
      return;
    }

  col = 0;

  if ( !IsNpc( victim ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
        {
	  if ( skill_table[sn]->name == NULL )
            break;
          if ( victim->pcdata->learned[sn] == 0 )
            continue;

          sprintf( buf, "%20s %3d%% ", skill_table[sn]->name,
                   victim->pcdata->learned[sn]);
          SendToCharacter( buf, ch );

          if ( ++col % 3 == 0 )
            SendToCharacter( "\r\n", ch );
        }
    }
}
