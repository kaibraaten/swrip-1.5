#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

void do_redit( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Room *location = NULL, *tmp = NULL;
  ExtraDescription *ed = NULL;
  Exit *xit = NULL, *texit = NULL;
  int value = 0;
  DirectionType edir = DIR_INVALID;
  vnum_t evnum = INVALID_VNUM;
  char *origarg = argument;

  if ( !ch->Desc )
    {
      ch->Echo("You have no descriptor.\r\n");
      return;
    }

  switch( ch->SubState )
    {
    default:
      break;

    case SUB_ROOM_DESC:
      location = (Room*)ch->dest_buf;

      if ( !location )
        {
          Log->Bug( "redit: sub_room_desc: NULL ch->dest_buf" );
          location = ch->InRoom;
        }

      FreeMemory( location->Description );
      location->Description = CopyBuffer( ch );
      StopEditing( ch );
      ch->SubState = (CharacterSubState)ch->tempnum;
      return;

    case SUB_ROOM_EXTRA:
      ed = (ExtraDescription*)ch->dest_buf;

      if ( !ed )
        {
          Log->Bug( "redit: sub_room_extra: NULL ch->dest_buf" );
          StopEditing( ch );
          return;
        }

      FreeMemory( ed->Description );
      ed->Description = CopyBuffer( ch );
      StopEditing( ch );
      ch->SubState = (CharacterSubState)ch->tempnum;
      return;
    }

  location = ch->InRoom;

  SmashTilde( argument );
  argument = OneArgument( argument, arg );

  if ( ch->SubState == SUB_REPEATCMD )
    {
      if ( IsNullOrEmpty( arg ) )
        {
          do_rstat( ch, "" );
          return;
        }

      if ( !StrCmp( arg, "done" ) || !StrCmp( arg, "off" ) )
        {
          ch->Echo("Redit mode off.\r\n");

	  if ( ch->PCData && ch->PCData->SubPrompt )
            FreeMemory( ch->PCData->SubPrompt );

          ch->SubState = SUB_NONE;
          return;
        }
    }

  if ( IsNullOrEmpty( arg ) || !StrCmp( arg, "?" ) )
    {
      if ( ch->SubState == SUB_REPEATCMD )
        ch->Echo("Syntax: <field> value\r\n");
      else
        ch->Echo("Syntax: redit <field> value\r\n");

      ch->Echo("\r\n");
      ch->Echo("Field being one of:\r\n");
      ch->Echo("  name desc ed rmed\r\n");
      ch->Echo("  exit bexit exdesc exflags exname exkey\r\n");
      ch->Echo("  flags sector teledelay televnum tunnel\r\n");
      ch->Echo("  rlist exdistance\r\n");
      return;
    }

  if ( !CanModifyRoom( ch, location ) )
    return;

  if ( !StrCmp( arg, "name" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Set the room name. A very brief single line room description.\r\n");
          ch->Echo("Usage: redit name <Room summary>\r\n");
          return;
        }

      FreeMemory( location->Name );
      location->Name = CopyString( argument );
      return;
    }

  if ( !StrCmp( arg, "desc" ) )
    {
      if ( ch->SubState == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;

      ch->SubState = SUB_ROOM_DESC;
      ch->dest_buf = location;
      StartEditing( ch, location->Description );
      SetEditorDescription( ch, "Room %d (%s) description",
                            location->Vnum, location->Name );
      return;
    }

  if ( !StrCmp( arg, "tunnel" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Set the maximum characters allowed in the room at one time. (0 = unlimited).\r\n");
          ch->Echo("Usage: redit tunnel <value>\r\n");
          return;
        }

      location->Tunnel = urange( 0, atoi(argument), 1000 );
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg, "ed" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Create an extra description.\r\n");
          ch->Echo("You must supply keyword(s).\r\n");
          return;
        }

      CHECK_SUBRESTRICTED( ch );
      ed = SetRExtra( location, argument );

      if ( ch->SubState == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;

      ch->SubState = SUB_ROOM_EXTRA;
      ch->dest_buf = ed;
      StartEditing( ch, ed->Description );
      SetEditorDescription( ch, "Room %d (%s) extra description: %s",
                            location->Vnum, location->Name, argument );
      return;
    }

  if ( !StrCmp( arg, "rmed" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Remove an extra description.\r\n");
          ch->Echo("You must supply keyword(s).\r\n");
          return;
        }

      if ( DelRExtra( location, argument ) )
        ch->Echo("Deleted.\r\n");
      else
        ch->Echo("Not found.\r\n");

      return;
    }

  if ( !StrCmp( arg, "rlist" ) )
    {
      Reset *pReset = NULL;
      Area *tarea = location->Area;
      short num = 0;

      if ( !tarea->FirstReset )
        {
          ch->Echo("This area.hppas no resets to list.\r\n");
          return;
        }

      for ( pReset = tarea->FirstReset; pReset; pReset = pReset->Next )
        {
	  const char *bptr = NULL;
          num++;

          if ( (bptr = SPrintReset( ch, pReset, num, true )) == NULL )
            continue;

          ch->Echo(bptr);
        }

      return;
    }

  if ( !StrCmp( arg, "flags" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Toggle the room flags.\r\n");
   ch->Echo("Usage: redit flags <flag> [flag]...\r\n");
          ch->Echo("\r\nPossible Flags: \r\n");
          ch->Echo("dark, nomob, indoors, nomagic, bank,\r\n");
          ch->Echo("private, safe, petshop, norecall, donation, nodropall, silence,\r\n");
          ch->Echo("logspeach, nodrop, clanstoreroom, plr_home, empty_home, teleport\r\n");
          ch->Echo("nofloor, prototype, refinery, factory, recruit\r\n");
          ch->Echo("spacecraft, auction, no_drive, can_land, can_fly, hotel\r\n");
          return;
        }

      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg2 );
          value = GetRoomFlag( arg2 );

          if ( value < 0 || value > 31 )
            ch->Echo("Unknown flag: %s\r\n", arg2 );
          else if ( 1 << value == ROOM_PLR_HOME && GetTrustLevel(ch) < LEVEL_IMPLEMENTOR )
            ch->Echo("If you want to build a player home use the 'empty_home' flag instead.\r\n");
          else
            {
              ToggleBit( location->Flags, 1 << value );
            }
        }

      return;
    }

  if ( !StrCmp( arg, "teledelay" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Set the delay of the teleport. (0 = off).\r\n");
          ch->Echo("Usage: redit teledelay <value>\r\n");
          return;
        }

      location->TeleDelay = atoi( argument );
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg, "televnum" ) )
    {
      vnum_t televnum = INVALID_VNUM;

      if ( IsNullOrEmpty( argument ) )
        {
   ch->Echo("Set the vnum of the room to teleport to.\r\n");
          ch->Echo("Usage: redit televnum <vnum>\r\n");
          return;

        }

      televnum = atoi( argument );

      if( !GetRoom( televnum ) )
	{
   ch->Echo("&R%ld is not a valid room vnum.\r\n" );
	}
      else
	{
	  location->TeleVnum = televnum;
   ch->Echo("Done.\r\n");
	}

      return;
    }

  if ( !StrCmp( arg, "sector" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
	  SectorType sector = SECT_INSIDE;
          ch->Echo("Set the sector type.\r\n");
          ch->Echo("Usage: redit sector <value>\r\n");
          ch->Echo("\r\nSector Values:\r\n");

	  for( sector = SECT_INSIDE; sector < SECT_MAX; sector = (SectorType)(sector + 1) )
	    {
       ch->Echo("  %s\r\n", SectorNames[sector][1] );
	    }

          return;
        }

      location->Sector = GetSectorType( argument );

      if ( location->Sector == SECT_INVALID )
        {
          location->Sector = SECT_CITY;
          ch->Echo("Out of range\r\n.");
        }
      else
	{
   ch->Echo("Done.\r\n");
	}

      return;
    }

  if ( !StrCmp( arg, "exkey" ) )
    {
      vnum_t keyvnum = INVALID_VNUM;

      argument = OneArgument( argument, arg2 );
      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg2 ) || IsNullOrEmpty( arg3 ) )
        {
          ch->Echo("Usage: redit exkey <dir> <key vnum>\r\n");
          return;
        }

      if ( arg2[0] == '#' )
        {
	  edir = (DirectionType)atoi( arg2 + 1 );
          xit = GetExitNumber( location, edir );
        }
      else
        {
          edir = GetDirection( arg2 );
          xit = GetExit( location, edir );
        }

      keyvnum = atoi( arg3 );

      if ( !xit )
        {
          ch->Echo("No exit in that direction.  Use 'redit exit ...' first.\r\n");
          return;
        }

      xit->Key = keyvnum;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg, "exname" ) )
    {
      argument = OneArgument( argument, arg2 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          ch->Echo("Change or clear exit keywords.\r\n");
          ch->Echo("Usage: redit exname <dir> [keywords]\r\n");
          return;
        }

      if ( arg2[0] == '#' )
        {
          edir = (DirectionType)atoi( arg2+1 );
          xit = GetExitNumber( location, edir );
        }
      else
        {
          edir = GetDirection( arg2 );
          xit = GetExit( location, edir );
        }

      if ( !xit )
        {
          ch->Echo("No exit in that direction.  Use 'redit exit ...' first.\r\n");
          return;
        }

      FreeMemory( xit->Keyword );
      xit->Keyword = CopyString( argument );
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg, "exflags" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo("Toggle or display exit flags.\r\n");
          ch->Echo("Usage: redit exflags <dir> <flag> [flag]...\r\n");
          ch->Echo("\r\nExit flags:\r\n");
          ch->Echo( "isdoor, closed, locked, can_look, searchable, can_leave, can_climb,\r\n");
          ch->Echo("nopassdoor, secret, pickproof, fly, climb, dig, window, auto, can_enter\r\n");
          ch->Echo("hidden, no_mob, bashproof, bashed\r\n");

          return;
        }

      argument = OneArgument( argument, arg2 );

      if ( arg2[0] == '#' )
        {
          edir = (DirectionType)atoi( arg2+1 );
          xit = GetExitNumber( location, edir );
        }
      else
        {
          edir = GetDirection( arg2 );
          xit = GetExit( location, edir );
        }

      if ( !xit )
        {
          ch->Echo("No exit in that direction.  Use 'redit exit ...' first.\r\n");
          return;
        }

      if ( IsNullOrEmpty( argument ) )
        {
          sprintf( buf, "Flags for exit direction: %d  Keywords: %s  Key: %ld\r\n[ ",
                   xit->Direction, xit->Keyword, xit->Key );

          for (size_t bit = 0; bit <= MAX_BIT; ++bit)
            {
              if (IsBitSet(xit->Flags, 1 << bit))
                {
                  strcat( buf, ExitFlags[bit] );
                  strcat( buf, " " );
		}
            }

          strcat( buf, "]\r\n" );
          ch->Echo(buf);
          return;
        }

      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg2 );
          value = GetExitFlag( arg2 );

          if (value < 0)
            ch->Echo("Unknown flag: %s\r\n", arg2 );
          else
            ToggleBit( xit->Flags, 1 << value );
        }

      return;
    }

  if ( !StrCmp( arg, "exit" ) )
    {
      bool addexit = false;
      bool numnotdir = false;

      argument = OneArgument( argument, arg2 );
      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          ch->Echo("Create, change or remove an exit.\r\n");
          ch->Echo("Usage: redit exit <dir> [room] [flags] [key] [keywords]\r\n");
          return;
        }

      switch( arg2[0] )
        {
        default:
	  edir = GetDirection(arg2);
	  break;

        case '+':
	  edir = GetDirection(arg2+1);
	  addexit = true;
	  break;

        case '#':
	  edir = (DirectionType)atoi(arg2+1);
	  numnotdir = true;
	  break;
        }

      if ( IsNullOrEmpty( arg3 ) )
        evnum = INVALID_VNUM;
      else
        evnum = atoi( arg3 );

      if ( numnotdir )
        {
	  if ( (xit = GetExitNumber(location, edir)) != NULL )
            edir = xit->Direction;
        }
      else
        xit = GetExit(location, edir);

      if ( evnum == INVALID_VNUM )
        {
          if ( xit )
            {
              ExtractExit(location, xit);
              ch->Echo("Exit removed.\r\n");
              return;
            }

          ch->Echo("No exit in that direction.\r\n");
          return;
        }

      if ( evnum < 1 || evnum > MAX_VNUM )
        {
          ch->Echo("Invalid room number.\r\n");
          return;
        }

      if ( (tmp = GetRoom( evnum )) == NULL )
        {
          ch->Echo("Non-existant room.\r\n");
          return;
        }

      if ( GetTrustLevel(ch) <= LEVEL_IMMORTAL && tmp->Area != location->Area )
        {
          ch->Echo("You can't make an exit to that room.\r\n");
          return;
        }

      if ( addexit || !xit )
        {
          if ( numnotdir )
            {
              ch->Echo("Cannot add an exit by number, sorry.\r\n");
              return;
            }

          if ( addexit && xit && GetExitTo(location, edir, tmp->Vnum) )
            {
              ch->Echo("There is already an exit in that direction leading to that location.\r\n");
              return;
            }

          xit = MakeExit( location, tmp, edir );
	  xit->Keyword          = CopyString( "" );
          xit->Description              = CopyString( "" );
          xit->Key                      = -1;
          xit->Flags                = 0;
          Act( AT_IMMORT, "$n reveals a hidden passage!", ch, NULL, NULL, TO_ROOM );
        }
      else
        Act( AT_IMMORT, "Something is different...", ch, NULL, NULL, TO_ROOM );

      if ( xit->ToRoom != tmp )
        {
          xit->ToRoom = tmp;
          xit->Vnum = evnum;
          texit = GetExitTo( xit->ToRoom, GetReverseDirection(edir), location->Vnum );

          if ( texit )
            {
              texit->ReverseExit = xit;
              xit->ReverseExit = texit;
            }
        }

      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg3 ) )
        xit->Flags = atoi( arg3 );

      if ( !IsNullOrEmpty( argument ) )
        {
	  vnum_t ekey = INVALID_VNUM;

          OneArgument( argument, arg3 );
          ekey = atoi( arg3 );

          if ( ekey != 0 || arg3[0] == '0' )
            {
              argument = OneArgument( argument, arg3 );
              xit->Key = ekey;
            }

          if ( IsNullOrEmpty( argument ) )
            {
              FreeMemory( xit->Keyword );
              xit->Keyword = CopyString( argument );
            }
        }

      ch->Echo("Done.\r\n");
      return;
    }

  /*
   * Twisted and evil, but works                                -Thoric
   * Makes an exit, and the reverse in one shot.
   */
  if ( !StrCmp( arg, "bexit" ) )
    {
      Exit *this_exit = NULL, *rxit = NULL;
      char tmpcmd[MAX_STRING_LENGTH];
      Room *tmploc = NULL;
      vnum_t vnum = INVALID_VNUM;
      int exnum = 0;
      char rvnum[MAX_INPUT_LENGTH];
      bool numnotdir = false;

      argument = OneArgument( argument, arg2 );
      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          ch->Echo("Create, change or remove a two-way exit.\r\n");
          ch->Echo("Usage: redit bexit <dir> [room] [flags] [key] [keywords]\r\n");
          return;
        }

      switch( arg2[0] )
        {
        default:
          edir = GetDirection( arg2 );
          break;

        case '#':
          numnotdir = true;
          edir = (DirectionType)atoi( arg2+1 );
          break;

        case '+':
          edir = GetDirection( arg2+1 );
          break;
        }

      tmploc = location;
      exnum = edir;

      if ( numnotdir )
        {
          if ( (this_exit = GetExitNumber(tmploc, edir)) != NULL )
	    {
	      edir = this_exit->Direction;
	    }
        }
      else
	{
	  this_exit = GetExit(tmploc, edir);
	}

      if ( this_exit )
        {
          vnum = this_exit->Vnum;

          if ( !IsNullOrEmpty( arg3 ) )
            sprintf( rvnum, "%ld", tmploc->Vnum );

          if ( this_exit->ToRoom )
            rxit = GetExit(this_exit->ToRoom, GetReverseDirection(edir));
          else
            rxit = NULL;
        }

      sprintf( tmpcmd, "exit %s %s %s", arg2, arg3, argument );
      do_redit( ch, tmpcmd );

      if ( numnotdir )
        this_exit = GetExitNumber(tmploc, exnum);
      else
        this_exit = GetExit(tmploc, edir);

      if ( !rxit && this_exit )
        {
          vnum = this_exit->Vnum;

          if ( !IsNullOrEmpty( arg3 ) )
            sprintf( rvnum, "%ld", tmploc->Vnum );

          if ( this_exit->ToRoom )
            rxit = GetExit(this_exit->ToRoom, GetReverseDirection(edir));
          else
            rxit = NULL;
        }

      if ( vnum != INVALID_VNUM )
        {
          sprintf( tmpcmd, "%ld redit exit %d %s %s",
                   vnum, GetReverseDirection(edir), rvnum, argument );
          do_at( ch, tmpcmd );
        }

      return;
    }

  if ( !StrCmp( arg, "exdistance" ) )
    {
      argument = OneArgument( argument, arg2 );

      if ( IsNullOrEmpty( arg2 ) )
        {
   ch->Echo("Set the distance (in rooms) between this room, and the destination room.\r\n");
          ch->Echo("Usage: redit exdistance <dir> [distance]\r\n");
          return;
        }

      if ( arg2[0] == '#' )
        {
          edir = (DirectionType)atoi( arg2+1 );
          xit = GetExitNumber( location, edir );
        }
      else
        {
          edir = GetDirection( arg2 );
          xit = GetExit( location, edir );
        }

      if ( xit )
        {
          xit->Distance = urange( 1, atoi(argument), 50 );
          ch->Echo("Done.\r\n");
          return;
        }
      ch->Echo("No exit in that direction.  Use 'redit exit ...' first.\r\n");
      return;
    }

  if ( !StrCmp( arg, "exdesc" ) )
    {
      argument = OneArgument( argument, arg2 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          ch->Echo("Create or clear a description for an exit.\r\n");
          ch->Echo("Usage: redit exdesc <dir> [description]\r\n");
          return;
        }

      if ( arg2[0] == '#' )
        {
          edir = (DirectionType)atoi( arg2+1 );
          xit = GetExitNumber( location, edir );
        }
      else
        {
          edir = GetDirection( arg2 );
          xit = GetExit( location, edir );
        }

      if ( xit )
	{
          FreeMemory( xit->Description );

          if ( IsNullOrEmpty( argument ) )
	    {
	      xit->Description = CopyString( "" );
	    }
          else
            {
              sprintf( buf, "%s\r\n", argument );
              xit->Description = CopyString( buf );
            }

          ch->Echo("Done.\r\n");
          return;
        }

      ch->Echo("No exit in that direction.  Use 'redit exit ...' first.\r\n");
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->SubState == SUB_REPEATCMD )
    {
      ch->SubState = SUB_RESTRICTED;
      Interpret( ch, origarg );
      ch->SubState = SUB_REPEATCMD;
      ch->LastCommand = do_redit;
    }
  else
    {
      do_redit( ch, "" );
    }
}

