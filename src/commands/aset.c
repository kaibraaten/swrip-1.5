#include "mud.h"
#include "character.h"

void do_aset( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  bool found = false;
  int value = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  value = atoi( argument );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      SendToCharacter( "Usage: aset <area filename> <field> <value>\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "  low_room hi_room low_obj hi_obj low_mob hi_mob\r\n", ch );
      SendToCharacter( "  name filename low_soft hi_soft low_hard hi_hard\r\n", ch );
      SendToCharacter( "  author resetmsg resetfreq flags planet\r\n", ch );
      return;
    }

  found = false;

  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !StrCmp( tarea->filename, arg1 ) )
      {
        found = true;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !StrCmp( tarea->filename, arg1 ) )
        {
          found = true;
          break;
        }

  if( !StrCmp( arg1, "this" ) )
    {
      tarea = ch->in_room->area;
      found = true;
    }

  if ( !found )
    {
      SendToCharacter( "Area not found.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( tarea->name );
      tarea->name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "planet" ) )
    {
      Planet *planet;
      planet = GetPlanet(argument);
      if (planet)
        {
          if (tarea->planet)
            {
              Planet *old_planet;

              old_planet=tarea->planet;
              UNLINK(tarea, old_planet->first_area, old_planet->last_area, next_on_planet, prev_on_planet);
            }

          tarea->planet=planet;
	  LINK(tarea, planet->first_area, planet->last_area, next_on_planet, prev_on_planet);
          SavePlanet(planet);
        }
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( tarea->filename );
      tarea->filename = CopyString( argument );
      WriteAreaList();
      FoldArea( tarea, tarea->filename, true );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_economy" ) )
    {
      tarea->low_economy = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "high_economy" ) )
    {
      tarea->high_economy = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_room" ) )
    {
      tarea->low_r_vnum = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_room" ) )
    {
      tarea->hi_r_vnum = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_obj" ) )
    {
      tarea->low_o_vnum = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_obj" ) )
    {
      tarea->hi_o_vnum = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_mob" ) )
    {
      tarea->low_m_vnum = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_mob" ) )
    {
      tarea->hi_m_vnum = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_soft" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->low_soft_range = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_soft" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "That is not an acceptable value.\r\n", ch);
	  return;
        }

      tarea->hi_soft_range = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_hard" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->low_hard_range = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_hard" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->hi_hard_range = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "author" ) )
    {
      FreeMemory( tarea->author );
      tarea->author = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "resetmsg" ) )
    {
      if ( tarea->resetmsg )
        FreeMemory( tarea->resetmsg );
      if ( StrCmp( argument, "clear" ) )
        tarea->resetmsg = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    } /* Rennard */

  if ( !StrCmp( arg2, "resetfreq" ) )
    {
      tarea->reset_frequency = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: aset <filename> flags <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetAreaFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              if ( IsBitSet( tarea->flags, 1 << value ) )
                RemoveBit( tarea->flags, 1 << value );
              else
                SetBit( tarea->flags, 1 << value );
            }
        }
      return;
    }

  do_aset( ch, "" );
}
