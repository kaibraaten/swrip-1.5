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

static bool IsWithinTrustLevel(const Command *command, const std::shared_ptr<Character> ch)
{
  return command->Level <= GetTrustLevel(ch);
}

static bool NameBeginsWith(const Command *command, const std::string &name)
{
  return StringPrefix(name, command->Name) == 0;
}

void do_commands( std::shared_ptr<Character> ch, std::string argument )
{
  const List *commands = GetEntities(CommandRepository);
  const int NumColumns = 6;

  SetCharacterColor( AT_PLAIN, ch );

  if ( argument.empty() )
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
              ch->Echo( "%-12s", command->Name.c_str() );

              if ( col % NumColumns == 0 )
                {
                  ch->Echo( "\r\n" );
                }
            }
	}

      if ( col % NumColumns != 0 )
        {
          ch->Echo( "\r\n" );
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
              ch->Echo( "%-12s", command->Name.c_str() );
              found = true;

              if ( col % NumColumns == 0 )
                {
                  ch->Echo( "\r\n" );
                }
            }
        }

      if ( col % NumColumns != 0 )
        {
          ch->Echo( "\r\n" );
        }

      if ( !found )
        {
          ch->Echo( "No command found under %s.\r\n", argument.c_str());
        }

      FreeListIterator(iterator);
    }
}

