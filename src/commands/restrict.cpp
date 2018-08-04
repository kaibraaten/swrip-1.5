#include "character.hpp"
#include "mud.hpp"
#include "command.hpp"
#include "log.hpp"

void do_restrict( Character *ch, char *argument )
{
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  short level = 0;
  Command *cmd = NULL;
  bool found = false;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Restrict which command?\r\n", ch );
      return;
    }

  argument = OneArgument ( argument, arg2 );

  if ( IsNullOrEmpty( arg2 ) )
    {
      level = GetTrustLevel( ch );
    }
  else
    {
      level = atoi( arg2 );
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
          sprintf(buf, "%s show", cmd->Name);
          do_cedit(ch, buf);
          return;
        }

      cmd->Level = level;
      Echo( ch, "You restrict %s to level %d\r\n", cmd->Name, level );
      Log->Info("%s restricting %s to level %d", ch->Name, cmd->Name, level );
    }
  else
    {
      SendToCharacter( "You may not restrict that command.\r\n", ch );
    }
}
