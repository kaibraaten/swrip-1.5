#include <string.h>
#include "mud.h"

/*
 * Obsolete Merc room editing routine
 */
void do_rset( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  Room *location;
  int value;
  bool proto;

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  strcpy( arg3, argument );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' )
    {
      SendToCharacter( "Syntax: rset <location> <field> value\r\n",        ch );
      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "Field being one of:\r\n",                  ch );
      SendToCharacter( "  flags sector\r\n",                               ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "No such location.\r\n", ch );
      return;
    }

  if ( !CanModifyRoom( ch, location ) )
    return;

  if ( !IsNumber( arg3 ) )
    {
      SendToCharacter( "Value must be numeric.\r\n", ch );
      return;
    }
  value = atoi( arg3 );

  /*
   * Set something.
   */
  if ( !StrCmp( arg2, "flags" ) )
    {
      /*
       * Protect from messing up prototype flag
       */
      if ( IsBitSet( location->room_flags, ROOM_PROTOTYPE ) )
        proto = true;
      else
        proto = false;
      location->room_flags      = value;
      if ( proto )
        SetBit( location->room_flags, ROOM_PROTOTYPE );
      return;
    }

  if ( !StrCmp( arg2, "sector" ) )
    {
      location->sector_type     = value;
      return;
    }

  /*
   * Generate usage message.
   */
  do_rset( ch, "" );
}
