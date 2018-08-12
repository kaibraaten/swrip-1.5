#include <string.h>
#include "character.hpp"
#include "mud.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "room.hpp"

void do_astat( Character *ch, char *argument )
{
  Area *tarea = nullptr;
  bool proto = false;
  bool found= false;
  char filename_buf[MAX_INPUT_LENGTH];
  char *filename = filename_buf;

  if( !StrCmp( argument, "this" ) )
    {
      strcpy( filename, ch->InRoom->Area->Filename );
    }
  else
    {
      strcpy( filename, argument );
    }

  for ( tarea = FirstArea; tarea; tarea = tarea->Next )
    if ( !StrCmp( tarea->Filename, filename ) )
      {
        found = true;
        break;
      }

  if ( !found )
    for ( tarea = FirstBuild; tarea; tarea = tarea->Next )
      if ( !StrCmp( tarea->Filename, filename ) )
        {
          found = true;
          proto = true;
          break;
        }

  if ( !found )
    {
      if ( !IsNullOrEmpty( filename ) )
        {
          ch->Echo( "Area not found. Check 'zones'.\r\n" );
          return;
        }
      else
        {
          tarea = ch->InRoom->Area;
        }
    }

  ch->Echo( "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
            tarea->Name,
            tarea->Filename,
            proto ? "yes" : "no" );

  if ( !proto )
    {
      ch->Echo( "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                tarea->MaxPlayers,
                tarea->IllegalPk,
                tarea->GoldLooted );

      if ( tarea->HighEconomy )
        ch->Echo( "Area economy: %d billion and %d credits.\r\n",
                  tarea->HighEconomy,
                  tarea->LowEconomy );
      else
        ch->Echo( "Area economy: %d credits.\r\n", tarea->LowEconomy );

      if ( tarea->Planet )
        ch->Echo( "Planet: %s.\r\n", tarea->Planet->Name );

      ch->Echo( "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                tarea->MDeaths,
                tarea->MKills,
                tarea->PDeaths,
                tarea->PKills );
    }

  ch->Echo( "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->Author,
             tarea->Age,
             tarea->NumberOfPlayers );
 ch->Echo( "Area flags: %s\r\n", FlagString(tarea->Flags, AreaFlags).c_str() );
 ch->Echo( "low_room: %5d  hi_room: %d\r\n",
             tarea->VnumRanges.Room.First,
	     tarea->VnumRanges.Room.Last );
 ch->Echo( "low_obj : %5d  hi_obj : %d\r\n",
             tarea->VnumRanges.Object.First,
             tarea->VnumRanges.Object.Last );
 ch->Echo( "low_mob : %5d  hi_mob : %d\r\n",
             tarea->VnumRanges.Mob.First,
             tarea->VnumRanges.Mob.Last );
 ch->Echo( "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->LevelRanges.Soft.Low,
             tarea->LevelRanges.Soft.High,
             tarea->LevelRanges.Hard.Low,
             tarea->LevelRanges.Hard.High );
 ch->Echo( "Resetmsg: %s\r\n", tarea->ResetMessage ? tarea->ResetMessage
             : "(default)" ); /* Rennard */
 ch->Echo( "Reset frequency: %d minutes.\r\n",
             tarea->ResetFrequency ? tarea->ResetFrequency : 15 );
}

