#include "character.h"
#include "mud.h"

void do_setplanet( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  PLANET_DATA *planet;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage: setplanet <planet> <field> [value]\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( " base_value flags\r\n", ch );
      send_to_char( " name filename spaceobject governed_by\r\n", ch );
      return;
    }

  planet = get_planet( arg1 );

  if ( !planet )
    {
      send_to_char( "No such planet.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      STRFREE( planet->name );
      planet->name = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      return;
    }

  if ( !str_cmp( arg2, "governed_by" ) )
    {
      CLAN_DATA *clan = get_clan( argument );

      if ( clan )
        {
          planet->governed_by = clan;
          send_to_char( "Done.\r\n", ch );
          save_planet( planet );
        }
      else
        {
          send_to_char( "No such clan.\r\n", ch );
        }

      return;
    }

  if ( !str_cmp( arg2, "spaceobject" ) )
    {
      if ( (planet->spaceobject = spaceobject_from_name(argument)) )
        {
          SPACE_DATA *spaceobject = planet->spaceobject;

          if (spaceobject != NULL)
	    {
              spaceobject->planet = planet;
              send_to_char( "Done.\r\n", ch );
              save_planet(planet);
            }
          else
            {
              send_to_char( "No such spaceobject.\r\n", ch );
            }
        }

      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( planet->filename );
      planet->filename = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      write_planet_list( );
      return;
    }

  if ( !str_cmp( arg2, "base_value" ) )
    {
      planet->base_value = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      char farg[MAX_INPUT_LENGTH];

      argument = one_argument( argument, farg);

      if ( farg[0] == '\0' )
        {
          send_to_char( "Possible flags: nocapture\r\n", ch );
          return;
        }

      for ( ; farg[0] != '\0'; argument = one_argument( argument, farg) )
	{
          if ( !str_cmp( farg, "nocapture" ) )
            {
              TOGGLE_BIT( planet->flags, PLANET_NOCAPTURE );
            }
          else
            {
              ch_printf( ch , "No such flag: %s\r\n" , farg );
            }
        }

      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      return;
    }

  do_setplanet( ch, "" );
}
