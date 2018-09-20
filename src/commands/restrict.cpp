#include "character.hpp"
#include "mud.hpp"
#include "command.hpp"
#include "log.hpp"

void do_restrict( Character *ch, std::string argument )
{
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = NULL;
  std::string arg;
  std::string arg2;
  short level = 0;
  Command *cmd = NULL;
  bool found = false;

  argument = OneArgument( argument, arg );

  if ( arg.empty() )
    {
      ch->Echo("Restrict which command?\r\n");
      return;
    }

  argument = OneArgument ( argument, arg2 );

  if ( arg2.empty() )
    {
      level = GetTrustLevel( ch );
    }
  else
    {
      level = ToLong( arg2 );
    }

  level = umax( umin( GetTrustLevel( ch ), level ), 0 );

  iterator = AllocateListIterator(commands);
  
  while(ListHasMoreElements(iterator))
    {
      cmd = (Command*) GetListData(iterator);
      MoveToNextListElement(iterator);

      if ( !StringPrefix( arg, cmd->Name )
           && cmd->Level <= GetTrustLevel( ch ) )
        {
          found = true;
          break;
        }
    }

  FreeListIterator(iterator);

  if ( found )
    {
      if ( !StringPrefix( arg2, "show" ) )
        {
          char buf[MAX_STRING_LENGTH];
          sprintf(buf, "%s show", cmd->Name.c_str());
          do_cedit(ch, buf);
          return;
        }

      cmd->Level = level;
      ch->Echo("You restrict %s to level %d\r\n",
               cmd->Name.c_str(), level );
      Log->Info("%s restricting %s to level %d",
                ch->Name.c_str(), cmd->Name.c_str(), level );
    }
  else
    {
      ch->Echo("You may not restrict that command.\r\n");
    }
}
