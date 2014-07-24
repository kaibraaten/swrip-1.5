#include "mud.h"

void do_aset( Character *ch, char *argument )
{
  Area *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  bool found;
  int vnum, value;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  vnum = atoi( argument );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Usage: aset <area filename> <field> <value>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  low_room hi_room low_obj hi_obj low_mob hi_mob\r\n", ch );
      send_to_char( "  name filename low_soft hi_soft low_hard hi_hard\r\n", ch );
      send_to_char( "  author resetmsg resetfreq flags planet\r\n", ch );
      return;
    }

  found = FALSE;

  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !str_cmp( tarea->filename, arg1 ) )
      {
        found = TRUE;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !str_cmp( tarea->filename, arg1 ) )
        {
          found = TRUE;
          break;
        }

  if ( !found )
    {
      send_to_char( "Area not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      DISPOSE( tarea->name );
      tarea->name = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "planet" ) )
    {
      PLANET_DATA *planet;
      planet = get_planet(argument);
      if (planet)
        {
          if (tarea->planet)
            {
              PLANET_DATA *old_planet;

              old_planet=tarea->planet;
              UNLINK(tarea, old_planet->first_area, old_planet->last_area, next_on_planet, prev_on_planet);
            }

          tarea->planet=planet;
	  LINK(tarea, planet->first_area, planet->last_area, next_on_planet, prev_on_planet);
          save_planet(planet);
        }
      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( tarea->filename );
      tarea->filename = str_dup( argument );
      write_area_list();
      fold_area( tarea, tarea->filename, TRUE );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_economy" ) )
    {
      tarea->low_economy = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "high_economy" ) )
    {
      tarea->high_economy = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_room" ) )
    {
      tarea->low_r_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_room" ) )
    {
      tarea->hi_r_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_obj" ) )
    {
      tarea->low_o_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_obj" ) )
    {
      tarea->hi_o_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_mob" ) )
    {
      tarea->low_m_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_mob" ) )
    {
      tarea->hi_m_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_soft" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->low_soft_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_soft" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
	  return;
        }

      tarea->hi_soft_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_hard" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->low_hard_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_hard" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->hi_hard_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "author" ) )
    {
      STRFREE( tarea->author );
      tarea->author = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "resetmsg" ) )
    {
      if ( tarea->resetmsg )
        DISPOSE( tarea->resetmsg );
      if ( str_cmp( argument, "clear" ) )
        tarea->resetmsg = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    } /* Rennard */

  if ( !str_cmp( arg2, "resetfreq" ) )
    {
      tarea->reset_frequency = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: aset <filename> flags <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_areaflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              if ( IS_SET( tarea->flags, 1 << value ) )
                REMOVE_BIT( tarea->flags, 1 << value );
              else
                SET_BIT( tarea->flags, 1 << value );
            }
        }
      return;
    }

  do_aset( ch, "" );
}
