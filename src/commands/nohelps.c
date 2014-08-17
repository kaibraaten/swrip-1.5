#include "mud.h"
#include "character.h"
#include "help.h"

void do_nohelps(Character *ch, char *argument)
{
  CMDTYPE *command;
  Area *tArea;
  char arg[MAX_STRING_LENGTH];
  int hash, col=0, sn=0;

  argument = OneArgument( argument, arg );

  if(!IsImmortal(ch) || IsNpc(ch) )
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  if ( arg[0] == '\0' || !StrCmp(arg, "all") )
    {
      do_nohelps(ch, "commands");
      send_to_char( "\r\n", ch);
      do_nohelps(ch, "skills");
      send_to_char( "\r\n", ch);
      do_nohelps(ch, "areas");
      send_to_char( "\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "commands") )
    {
      send_to_char("&C&YCommands for which there are no help files:\r\n\r\n", ch);

      for ( hash = 0; hash < 126; hash++ )
        {
          for( command = command_hash[hash]; command; command = command->next )
            {
              if(!GetHelpFile(ch, command->name) )
		{
                  ch_printf(ch, "&W%-15s", command->name);

                  if ( ++col % 5 == 0 )
                    {
                      send_to_char( "\r\n", ch );
                    }
                }
            }
        }

      send_to_char("\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "skills") || !StrCmp(arg, "spells") )
    {
      send_to_char("&CSkills/Spells for which there are no help files:\r\n\r\n", ch);

      for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
        {
          if(!GetHelpFile(ch, skill_table[sn]->name))
            {
              ch_printf(ch, "&W%-20s", skill_table[sn]->name);

              if ( ++col % 4 == 0 )
                {
                  send_to_char("\r\n", ch);
                }
            }
        }

      send_to_char("\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "areas") )
    {
      send_to_char("&GAreas for which there are no help files:\r\n\r\n", ch);

      for (tArea = first_area; tArea;tArea = tArea->next)
        {
          if(!GetHelpFile(ch, tArea->name) )
            {
              ch_printf(ch, "&W%-35s", tArea->name);
              if ( ++col % 2 == 0 )
                {
		  send_to_char("\r\n", ch);
                }
            }
        }

      send_to_char( "\r\n", ch);
      return;
    }

  send_to_char("Syntax:  nohelps <all|areas|commands|skills>\r\n", ch);
}
