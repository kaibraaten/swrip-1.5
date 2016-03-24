#include "command.h"
#include "mud.h"
#include "character.h"
#include "help.h"
#include "skill.h"

void do_nohelps(Character *ch, char *argument)
{
  Command *command;
  Area *tArea;
  char arg[MAX_STRING_LENGTH];
  int hash, col=0, sn=0;

  argument = OneArgument( argument, arg );

  if(!IsImmortal(ch) || IsNpc(ch) )
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  if ( arg[0] == '\0' || !StrCmp(arg, "all") )
    {
      do_nohelps(ch, "commands");
      SendToCharacter( "\r\n", ch);
      do_nohelps(ch, "skills");
      SendToCharacter( "\r\n", ch);
      do_nohelps(ch, "areas");
      SendToCharacter( "\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "commands") )
    {
      SendToCharacter("&C&YCommands for which there are no help files:\r\n\r\n", ch);

      for ( hash = 0; hash < 126; hash++ )
        {
          for( command = CommandTable[hash]; command; command = command->next )
            {
              if(!GetHelpFile(ch, command->Name) )
		{
                  Echo(ch, "&W%-15s", command->Name);

                  if ( ++col % 5 == 0 )
                    {
                      SendToCharacter( "\r\n", ch );
                    }
                }
            }
        }

      SendToCharacter("\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "skills") || !StrCmp(arg, "spells") )
    {
      SendToCharacter("&CSkills/Spells for which there are no help files:\r\n\r\n", ch);

      for ( sn = 0; sn < TopSN && SkillTable[sn] && SkillTable[sn]->Name; sn++ )
        {
          if(!GetHelpFile(ch, SkillTable[sn]->Name))
            {
              Echo(ch, "&W%-20s", SkillTable[sn]->Name);

              if ( ++col % 4 == 0 )
                {
                  SendToCharacter("\r\n", ch);
                }
            }
        }

      SendToCharacter("\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "areas") )
    {
      SendToCharacter("&GAreas for which there are no help files:\r\n\r\n", ch);

      for (tArea = first_area; tArea;tArea = tArea->next)
        {
          if(!GetHelpFile(ch, tArea->name) )
            {
              Echo(ch, "&W%-35s", tArea->name);
              if ( ++col % 2 == 0 )
                {
		  SendToCharacter("\r\n", ch);
                }
            }
        }

      SendToCharacter( "\r\n", ch);
      return;
    }

  SendToCharacter("Syntax:  nohelps <all|areas|commands|skills>\r\n", ch);
}
