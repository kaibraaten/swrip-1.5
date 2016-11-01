#include "mud.h"
#include "character.h"
#include "planet.h"

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
      SendToCharacter( "Usage: aset <area filename> <field> <value>\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "  low_room hi_room low_obj hi_obj low_mob hi_mob\r\n", ch );
      SendToCharacter( "  name filename low_soft hi_soft low_hard hi_hard\r\n", ch );
      SendToCharacter( "  author resetmsg resetfreq flags planet\r\n", ch );
      return;
    }

  found = false;

  for ( tarea = first_area; tarea; tarea = tarea->Next )
    if ( !StrCmp( tarea->Filename, arg1 ) )
      {
        found = true;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->Next )
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
      SendToCharacter( "Area not found.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( tarea->Name );
      tarea->Name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "planet" ) )
    {
      Planet *planet = GetPlanet(argument);

      if (planet)
        {
          if (tarea->Planet)
            {
              Planet *old_planet = tarea->Planet;
              UNLINK(tarea, old_planet->FirstArea, old_planet->LastArea, NextOnPlanet, PreviousOnPlanet);
            }

          tarea->Planet = planet;
	  LINK(tarea, planet->FirstArea, planet->LastArea, NextOnPlanet, PreviousOnPlanet);
          SavePlanet(planet);
        }
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( tarea->Filename );
      tarea->Filename = CopyString( argument );
      WriteAreaList();
      FoldArea( tarea, tarea->Filename, true );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_economy" ) )
    {
      tarea->LowEconomy = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "high_economy" ) )
    {
      tarea->HighEconomy = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_room" ) )
    {
      tarea->VnumRanges.Room.First = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_room" ) )
    {
      tarea->VnumRanges.Room.Last = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_obj" ) )
    {
      tarea->VnumRanges.Object.First = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_obj" ) )
    {
      tarea->VnumRanges.Object.Last = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "low_mob" ) )
    {
      tarea->VnumRanges.Mob.First = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hi_mob" ) )
    {
      tarea->VnumRanges.Mob.Last = value;
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

      tarea->LevelRanges.Soft.Low = value;
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

      tarea->LevelRanges.Soft.High = value;
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

      tarea->LevelRanges.Hard.Low = value;
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

      tarea->LevelRanges.Hard.High = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "author" ) )
    {
      FreeMemory( tarea->Author );
      tarea->Author = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "resetmsg" ) )
    {
      if ( tarea->ResetMessage )
        FreeMemory( tarea->ResetMessage );
      if ( StrCmp( argument, "clear" ) )
        tarea->ResetMessage = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    } /* Rennard */

  if ( !StrCmp( arg2, "resetfreq" ) )
    {
      tarea->ResetFrequency = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Usage: aset <filename> flags <flag> [flag]...\r\n", ch );
          return;
        }
      
      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg3 );
          value = GetAreaFlag( arg3 );
	  
          if ( value < 0 || value > MAX_BIT )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
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
