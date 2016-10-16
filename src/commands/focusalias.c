#include <string.h>
#include "mud.h"
#include "character.h"

static void set_target( Character *ch, const char *target );

void do_focusalias( Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH], buf[MAX_STRING_LENGTH];

  SmashTilde(argument);
  OneArgument( argument, arg );

  if ( IsNpc(ch) )
    {
      SendToCharacter("Alias focuses are for players!\r\n", ch);
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {

      if ( !IsNullOrEmpty( ch->PCData->Target ) )
        {
          sprintf( buf, "Your current alias focus is : %s\r\n", ch->PCData->Target);
          SendToCharacter(buf,ch);
          return;
        }

      SendToCharacter("You have no current alias focus.\r\n",ch);
      return;

    }
  else
    {
      set_target( ch, arg );
      sprintf( buf, "Your new alias focus is : %s\r\n", ch->PCData->Target);
      SendToCharacter( buf, ch );
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
