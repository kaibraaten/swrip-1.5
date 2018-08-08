#include "mud.hpp"
#include "character.hpp"
#include "planet.hpp"
#include "area.hpp"

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

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      ch->Echo( "Usage: aset <area filename> <field> <value>\r\n" );
      ch->Echo( "\r\nField being one of:\r\n" );
      ch->Echo( "  low_room hi_room low_obj hi_obj low_mob hi_mob\r\n" );
      ch->Echo( "  name filename low_soft hi_soft low_hard hi_hard\r\n" );
      ch->Echo( "  author resetmsg resetfreq flags planet\r\n" );
      return;
    }

  found = false;

  for ( tarea = FirstArea; tarea; tarea = tarea->Next )
    if ( !StrCmp( tarea->Filename, arg1 ) )
      {
        found = true;
        break;
      }

  if ( !found )
    for ( tarea = FirstBuild; tarea; tarea = tarea->Next )
      if ( !StrCmp( tarea->Filename, arg1 ) )
        {
          found = true;
          break;
        }

  if( !StrCmp( arg1, "this" ) )
    {
      tarea = ch->InRoom->Area;
      found = true;
    }

  if ( !found )
    {
      ch->Echo( "Area not found.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( tarea->Name );
      tarea->Name = CopyString( argument );
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "planet" ) )
    {
      Planet *planet = Planets->FindByName(argument);

      if (planet)
        {
          if (tarea->Planet)
            {
              Planet *old_planet = tarea->Planet;
              UNLINK(tarea, old_planet->FirstArea, old_planet->LastArea, NextOnPlanet, PreviousOnPlanet);
            }

          tarea->Planet = planet;
	  LINK(tarea, planet->FirstArea, planet->LastArea, NextOnPlanet, PreviousOnPlanet);
          Planets->Save(planet);
        }
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( tarea->Filename );
      tarea->Filename = CopyString( argument );
      WriteAreaList();
      FoldArea( tarea, tarea->Filename, true );
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "low_economy" ) )
    {
      tarea->LowEconomy = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "high_economy" ) )
    {
      tarea->HighEconomy = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "low_room" ) )
    {
      tarea->VnumRanges.Room.First = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "hi_room" ) )
    {
      tarea->VnumRanges.Room.Last = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "low_obj" ) )
    {
      tarea->VnumRanges.Object.First = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "hi_obj" ) )
    {
      tarea->VnumRanges.Object.Last = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "low_mob" ) )
    {
      tarea->VnumRanges.Mob.First = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "hi_mob" ) )
    {
      tarea->VnumRanges.Mob.Last = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "low_soft" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "That is not an acceptable value.\r\n" );
          return;
        }

      tarea->LevelRanges.Soft.Low = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "hi_soft" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "That is not an acceptable value.\r\n" );
	  return;
        }

      tarea->LevelRanges.Soft.High = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "low_hard" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "That is not an acceptable value.\r\n" );
          return;
        }

      tarea->LevelRanges.Hard.Low = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "hi_hard" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "That is not an acceptable value.\r\n" );
          return;
        }

      tarea->LevelRanges.Hard.High = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "author" ) )
    {
      FreeMemory( tarea->Author );
      tarea->Author = CopyString( argument );
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "resetmsg" ) )
    {
      if ( tarea->ResetMessage )
        FreeMemory( tarea->ResetMessage );

      if ( StrCmp( argument, "clear" ) )
        tarea->ResetMessage = CopyString( argument );

      ch->Echo( "Done.\r\n" );
      return;
    } /* Rennard */

  if ( !StrCmp( arg2, "resetfreq" ) )
    {
      tarea->ResetFrequency = value;
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo( "Usage: aset <filename> flags <flag> [flag]...\r\n" );
          return;
        }
      
      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg3 );
          value = GetAreaFlag( arg3 );
	  
          if ( value < 0 || static_cast<size_t>(value) > MAX_BIT )
            {
              ch->Echo( "Unknown flag: %s\r\n", arg3 );
            }
          else
            {
              if ( IsBitSet( tarea->Flags, 1 << value ) )
                RemoveBit( tarea->Flags, 1 << value );
              else
                SetBit( tarea->Flags, 1 << value );
            }
        }

      return;
    }

  do_aset( ch, "" );
}

