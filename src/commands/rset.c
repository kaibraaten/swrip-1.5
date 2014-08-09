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
  ROOM_INDEX_DATA *location;
  int value;
  bool proto;

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  strcpy( arg3, argument );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' )
    {
      send_to_char( "Syntax: rset <location> <field> value\r\n",        ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  flags sector\r\n",                               ch );
      return;
    }

  if ( ( location = find_location( ch, arg1 ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  if ( !can_rmodify( ch, location ) )
    return;

  if ( !is_number( arg3 ) )
    {
      send_to_char( "Value must be numeric.\r\n", ch );
      return;
    }
  value = atoi( arg3 );

  /*
   * Set something.
   */
  if ( !str_cmp( arg2, "flags" ) )
    {
      /*
       * Protect from messing up prototype flag
       */
      if ( IS_SET( location->room_flags, ROOM_PROTOTYPE ) )
        proto = true;
      else
        proto = false;
      location->room_flags      = value;
      if ( proto )
        SET_BIT( location->room_flags, ROOM_PROTOTYPE );
      return;
    }

  if ( !str_cmp( arg2, "sector" ) )
    {
      location->sector_type     = value;
      return;
    }

  /*
   * Generate usage message.
   */
  do_rset( ch, "" );
}
