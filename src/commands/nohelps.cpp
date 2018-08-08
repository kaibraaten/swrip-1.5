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
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( IsNullOrEmpty( arg ) || !StrCmp(arg, "all") )
    {
      do_nohelps(ch, "Commands");
      ch->Echo("\r\n");
      do_nohelps(ch, "Skills");
      ch->Echo("\r\n");
      do_nohelps(ch, "Areas");
      ch->Echo("\r\n");
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
      ch->Echo("Syntax:  nohelps <all|areas|commands|skills>\r\n");
    }
}

static void ShowMissingHelpsForCommands(const Character *ch)
{
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = AllocateListIterator(commands);
  int col = 0;
  const int NUM_COLUMNS = 5;

  ch->Echo("&C&YCommands for which there are no help files:\r\n\r\n");

  while(ListHasMoreElements(iterator))
    {
      const Command *command = (const Command*) GetListData(iterator);
      MoveToNextListElement(iterator);

      if(!GetHelpFile(ch, command->Name) )
        {
          ch->Echo("&W%-15s", command->Name);

          if ( ++col % NUM_COLUMNS == 0 )
            {
              ch->Echo("\r\n");
            }
        }
    }

  ch->Echo("\r\n");
}

static void ShowMissingHelpsForSkills(const Character *ch)
{
  int sn = 0;
  int col = 0;
  const int NUM_COLUMNS = 4;

  ch->Echo("&CSkills/Spells for which there are no help files:\r\n\r\n");

  for ( sn = 0; sn < TopSN && SkillTable[sn] && SkillTable[sn]->Name; sn++ )
    {
      if(!GetHelpFile(ch, SkillTable[sn]->Name))
        {
          ch->Echo("&W%-20s", SkillTable[sn]->Name);

          if ( ++col % NUM_COLUMNS == 0 )
            {
              ch->Echo("\r\n");
            }
        }
    }

  ch->Echo("\r\n");
}

static void ShowMissingHelpsForAreas(const Character *ch)
{
  const Area *tArea = NULL;
  int col = 0;
  const int NUM_COLUMNS = 2;

  ch->Echo("&GAreas for which there are no help files:\r\n\r\n");

  for (tArea = FirstArea; tArea;tArea = tArea->Next)
    {
      if(!GetHelpFile(ch, tArea->Name) )
        {
          ch->Echo("&W%-35s", tArea->Name);

          if ( ++col % NUM_COLUMNS == 0 )
            {
              ch->Echo("\r\n");
            }
        }
    }

  ch->Echo("\r\n");
}

