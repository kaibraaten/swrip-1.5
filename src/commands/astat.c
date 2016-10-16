#include <string.h>
#include "character.h"
#include "mud.h"

void do_astat( Character *ch, char *argument )
{
  Area *tarea = NULL;
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

  for ( tarea = first_area; tarea; tarea = tarea->Next )
    if ( !StrCmp( tarea->Filename, filename ) )
      {
        found = true;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->Next )
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
          SendToCharacter( "Area not found. Check 'zones'.\r\n", ch );
          return;
        }
      else
        {
          tarea = ch->InRoom->Area;
        }
    }

  Echo( ch, "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
             tarea->Name,
             tarea->Filename,
             proto ? "yes" : "no" );
  if ( !proto )
    {
      Echo( ch, "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                 tarea->MaxPlayers,
                 tarea->IllegalPk,
                 tarea->GoldLooted );
      if ( tarea->HighEconomy )
        Echo( ch, "Area economy: %d billion and %d credits.\r\n",
                   tarea->HighEconomy,
                   tarea->LowEconomy );
      else
        Echo( ch, "Area economy: %d credits.\r\n",
                   tarea->LowEconomy );
      if ( tarea->Planet )
        Echo( ch, "Planet: %s.\r\n",
                   tarea->Planet->Name );
      Echo( ch, "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                 tarea->MDeaths,
                 tarea->MKills,
                 tarea->PDeaths,
                 tarea->PKills );
    }
  Echo( ch, "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->Author,
             tarea->Age,
             tarea->NumberOfPlayers );
  Echo( ch, "Area flags: %s\r\n", FlagString(tarea->Flags, AreaFlags) );
  Echo( ch, "low_room: %5d  hi_room: %d\r\n",
             tarea->VnumRanges.FirstRoom,
	     tarea->VnumRanges.LastRoom );
  Echo( ch, "low_obj : %5d  hi_obj : %d\r\n",
             tarea->VnumRanges.FirstObject,
             tarea->VnumRanges.LastObject );
  Echo( ch, "low_mob : %5d  hi_mob : %d\r\n",
             tarea->VnumRanges.FirstMob,
             tarea->VnumRanges.LastMob );
  Echo( ch, "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->LevelRanges.LowSoft,
             tarea->LevelRanges.HighSoft,
             tarea->LevelRanges.LowHard,
             tarea->LevelRanges.HighHard );
  Echo( ch, "Resetmsg: %s\r\n", tarea->ResetMessage ? tarea->ResetMessage
             : "(default)" ); /* Rennard */
  Echo( ch, "Reset frequency: %d minutes.\r\n",
             tarea->ResetFrequency ? tarea->ResetFrequency : 15 );
}
