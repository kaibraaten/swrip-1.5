#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

static void set_target( Character *ch, const char *target );

void do_focusalias( Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  SmashTilde(argument);
  OneArgument( argument, arg );

  if ( IsNpc(ch) )
    {
      ch->Echo("Alias focuses are for players!\r\n");
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {

      if ( !IsNullOrEmpty( ch->PCData->Target ) )
        {
          ch->Echo( "Your current alias focus is : %s\r\n", ch->PCData->Target);
          return;
        }

      ch->Echo("You have no current alias focus.\r\n");
      return;
    }
  else
    {
      set_target( ch, arg );
      ch->Echo( "Your new alias focus is : %s\r\n", ch->PCData->Target);
      return;
    }
}

static void set_target( Character *ch, const char *target )
{
  char buf[MAX_STRING_LENGTH];

  strcpy( buf, target );

  if ( !IsNullOrEmpty( ch->PCData->Target ) )
    FreeMemory( ch->PCData->Target );

  ch->PCData->Target = CopyString( buf );
}

