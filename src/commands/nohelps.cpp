#include "command.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "help.hpp"
#include "skill.hpp"
#include "area.hpp"

static void ShowMissingHelpsForCommands(const Character *ch);
static void ShowMissingHelpsForSkills(const Character *ch);
static void ShowMissingHelpsForAreas(const Character *ch);

void do_nohelps(Character *ch, char *argument)
{
  char arg[MAX_STRING_LENGTH];
  argument = OneArgument( argument, arg );

  if(!IsImmortal(ch) || IsNpc(ch) )
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  if ( IsNullOrEmpty( arg ) || !StrCmp(arg, "all") )
    {
      do_nohelps(ch, "Commands");
      SendToCharacter( "\r\n", ch);
      do_nohelps(ch, "Skills");
      SendToCharacter( "\r\n", ch);
      do_nohelps(ch, "Areas");
      SendToCharacter( "\r\n", ch);
      return;
    }

  if(!StrCmp(arg, "commands") )
    {
      ShowMissingHelpsForCommands(ch);
    }
  else if(!StrCmp(arg, "skills") || !StrCmp(arg, "spells") )
    {
      ShowMissingHelpsForSkills(ch);
    }
  else if(!StrCmp(arg, "areas") )
    {
      ShowMissingHelpsForAreas(ch);
    }
  else
    {
      SendToCharacter("Syntax:  nohelps <all|areas|commands|skills>\r\n", ch);
    }
}

static void ShowMissingHelpsForCommands(const Character *ch)
{
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = AllocateListIterator(commands);
  int col = 0;
  const int NUM_COLUMNS = 5;

  SendToCharacter("&C&YCommands for which there are no help files:\r\n\r\n", ch);

  while(ListHasMoreElements(iterator))
    {
      const Command *command = (const Command*) GetListData(iterator);
      MoveToNextListElement(iterator);

      if(!GetHelpFile(ch, command->Name) )
        {
          Echo(ch, "&W%-15s", command->Name);

          if ( ++col % NUM_COLUMNS == 0 )
            {
              SendToCharacter( "\r\n", ch );
            }
        }
    }

  SendToCharacter("\r\n", ch);
}

static void ShowMissingHelpsForSkills(const Character *ch)
{
  int sn = 0;
  int col = 0;
  const int NUM_COLUMNS = 4;

  SendToCharacter("&CSkills/Spells for which there are no help files:\r\n\r\n", ch);

  for ( sn = 0; sn < TopSN && SkillTable[sn] && SkillTable[sn]->Name; sn++ )
    {
      if(!GetHelpFile(ch, SkillTable[sn]->Name))
        {
          Echo(ch, "&W%-20s", SkillTable[sn]->Name);

          if ( ++col % NUM_COLUMNS == 0 )
            {
              SendToCharacter("\r\n", ch);
            }
        }
    }

  SendToCharacter("\r\n", ch);
}

static void ShowMissingHelpsForAreas(const Character *ch)
{
  const Area *tArea = NULL;
  int col = 0;
  const int NUM_COLUMNS = 2;

  SendToCharacter("&GAreas for which there are no help files:\r\n\r\n", ch);

  for (tArea = FirstArea; tArea;tArea = tArea->Next)
    {
      if(!GetHelpFile(ch, tArea->Name) )
        {
          Echo(ch, "&W%-35s", tArea->Name);

          if ( ++col % NUM_COLUMNS == 0 )
            {
              SendToCharacter("\r\n", ch);
            }
        }
    }

  SendToCharacter( "\r\n", ch);
}
