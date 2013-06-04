#include "character.h"
#include "mud.h"
#include "alias.h"

static void SendAliasToPager( void *element, void *userData );

void do_alias( CHAR_DATA *ch, char *argument )
{
  Alias *pal = NULL;
  char arg[MAX_INPUT_LENGTH];

  if (!ch || !ch->pcdata)
    return;

  argument = one_argument(argument, arg);

  if ( !*arg )
    {
      if ( List_Count( GetAliases( ch ) ) == 0 )
        {
          send_to_char("You have no aliases defined!\r\n", ch);
          return;
        }

      pager_printf( ch, "%-20s What it does\r\n", "Alias" );
      List_ForEach( GetAliases( ch ), SendAliasToPager, ch );
      return;
    }

  if ( !*argument)
    {
      Alias *alias = FindAlias( ch, arg );

      if ( alias != NULL )
        {
	  RemoveAlias( ch, alias );
	  DestroyAlias( alias );
          send_to_char("Deleted Alias.\r\n", ch);
        }
      else
	{
	  send_to_char("That alias does not exist.\r\n", ch);
	}

      return;
    }

  pal = FindAlias( ch, arg );

  if ( pal == NULL )
    {
      pal = CreateAlias( arg, argument );
      AddAlias( ch, pal );
      send_to_char("Created Alias.\r\n", ch);
    }
  else
    {
      SetAliasValue( pal, argument );
      send_to_char("Modified Alias.\r\n", ch);
    }
}

static void SendAliasToPager( void *element, void *userData )
{
  CHAR_DATA *ch = (CHAR_DATA*) userData;
  Alias *alias = (Alias*) element;

  pager_printf( ch, "%-20s %s\r\n", GetAliasName( alias ), GetAliasValue( alias ) );
}
