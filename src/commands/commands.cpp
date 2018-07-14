#include "command.hpp"
#include "character.hpp"
#include "mud.hpp"

static bool IsMudProgCommand(const Command *command)
{
  return command->Name[0] == 'm' && command->Name[1] == 'p';
}

static bool IsMortalCommand(const Command *command)
{
  return command->Level < LEVEL_IMMORTAL;
}

static bool IsWithinTrustLevel(const Command *command, const Character *ch)
{
  return command->Level <= GetTrustLevel(ch);
}

static bool NameBeginsWith(const Command *command, const char *name)
{
  return StringPrefix(name, command->Name) == 0;
}

void do_commands( Character *ch, char *argument )
{
  const List *commands = GetEntities(CommandRepository);
  const int NumColumns = 6;

  SetPagerColor( AT_PLAIN, ch );

  if ( IsNullOrEmpty( argument ) )
    {
      ListIterator *iterator = AllocateListIterator(commands);
      int col = 0;

      while(ListHasMoreElements(iterator))
	{
	  const Command *command = (const Command*) GetListData(iterator);
          MoveToNextListElement(iterator);
          ++col;

          if ( IsMortalCommand(command)
               && IsWithinTrustLevel(command, ch)
               && !IsMudProgCommand(command))
            {
              PagerPrintf( ch, "%-12s", command->Name );

              if ( col % NumColumns == 0 )
                {
                  SendToPager( "\r\n", ch );
                }
            }
	}

      if ( col % NumColumns != 0 )
        {
          SendToPager( "\r\n", ch );
        }

      FreeListIterator(iterator);
    }
  else
    {
      ListIterator *iterator = AllocateListIterator(commands);
      int col = 0;
      bool found = false;

      while(ListHasMoreElements(iterator))
        {
          const Command *command = (const Command*) GetListData(iterator);
          MoveToNextListElement(iterator);
          ++col;

          if ( IsMortalCommand(command)
               && IsWithinTrustLevel(command, ch)
               && NameBeginsWith(command, argument)
               && !IsMudProgCommand(command))
            {
              PagerPrintf( ch, "%-12s", command->Name );
              found = true;

              if ( col % NumColumns == 0 )
                {
                  SendToPager( "\r\n", ch );
                }
            }
        }

      if ( col % NumColumns != 0 )
        {
          SendToPager( "\r\n", ch );
        }

      if ( !found )
        {
          Echo( ch, "No command found under %s.\r\n", argument);
        }

      FreeListIterator(iterator);
    }
}
