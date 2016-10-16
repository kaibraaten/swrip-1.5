#include <string.h>
#include "mud.h"
#include "character.h"
#include "editor.h"
#include "reset.h"

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
      SendToCharacter( "You have no descriptor.\r\n", ch );
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
          Bug( "redit: sub_room_desc: NULL ch->dest_buf", 0 );
          location = ch->InRoom;
        }

      FreeMemory( location->Description );
      location->Description = CopyBuffer( ch );
      StopEditing( ch );
      ch->SubState = ch->tempnum;
      return;

    case SUB_ROOM_EXTRA:
      ed = (ExtraDescription*)ch->dest_buf;

      if ( !ed )
        {
          Bug( "redit: sub_room_extra: NULL ch->dest_buf", 0 );
          StopEditing( ch );
          return;
        }

      FreeMemory( ed->Description );
      ed->Description = CopyBuffer( ch );
      StopEditing( ch );
      ch->SubState = ch->tempnum;
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
          SendToCharacter( "Redit mode off.\r\n", ch );

	  if ( ch->PCData && ch->PCData->SubPrompt )
            FreeMemory( ch->PCData->SubPrompt );

          ch->SubState = SUB_NONE;
          return;
        }
    }

  if ( IsNullOrEmpty( arg ) || !StrCmp( arg, "?" ) )
    {
      if ( ch->SubState == SUB_REPEATCMD )
        SendToCharacter( "Syntax: <field> value\r\n",                      ch );
      else
        SendToCharacter( "Syntax: redit <field> value\r\n",                ch );

      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "Field being one of:\r\n",                  ch );
      SendToCharacter( "  name desc ed rmed\r\n",                  ch );
      SendToCharacter( "  exit bexit exdesc exflags exname exkey\r\n",     ch );
      SendToCharacter( "  flags sector teledelay televnum tunnel\r\n",     ch );
      SendToCharacter( "  rlist exdistance\r\n",                           ch );
      return;
    }

  if ( !CanModifyRoom( ch, location ) )
    return;

  if ( !StrCmp( arg, "name" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Set the room name. A very brief single line room description.\r\n", ch );
          SendToCharacter( "Usage: redit name <Room summary>\r\n", ch );
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
          SendToCharacter( "Set the maximum characters allowed in the room at one time. (0 = unlimited).\r\n", ch );
          SendToCharacter( "Usage: redit tunnel <value>\r\n", ch );
          return;
        }

      location->Tunnel = urange( 0, atoi(argument), 1000 );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "ed" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Create an extra description.\r\n", ch );
          SendToCharacter( "You must supply keyword(s).\r\n", ch );
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
          SendToCharacter( "Remove an extra description.\r\n", ch );
          SendToCharacter( "You must supply keyword(s).\r\n", ch );
          return;
        }

      if ( DelRExtra( location, argument ) )
        SendToCharacter( "Deleted.\r\n", ch );
      else
        SendToCharacter( "Not found.\r\n", ch );

      return;
    }

  if ( !StrCmp( arg, "rlist" ) )
    {
      Reset *pReset = NULL;
      Area *tarea = location->Area;
      short num = 0;

      if ( !tarea->FirstReset )
        {
          SendToCharacter( "This area has no resets to list.\r\n", ch );
          return;
        }

      for ( pReset = tarea->FirstReset; pReset; pReset = pReset->Next )
        {
	  const char *bptr = NULL;
          num++;

          if ( (bptr = SPrintReset( ch, pReset, num, true )) == NULL )
            continue;

          SendToCharacter( bptr, ch );
        }

      return;
    }

  if ( !StrCmp( arg, "flags" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Toggle the room flags.\r\n", ch );
	  SendToCharacter( "Usage: redit flags <flag> [flag]...\r\n", ch );
          SendToCharacter( "\r\nPossible Flags: \r\n", ch );
          SendToCharacter( "dark, nomob, indoors, nomagic, bank,\r\n", ch );
          SendToCharacter( "private, safe, petshop, norecall, donation, nodropall, silence,\r\n", ch);
          SendToCharacter( "logspeach, nodrop, clanstoreroom, plr_home, empty_home, teleport\r\n",ch);
          SendToCharacter( "nofloor, prototype, refinery, factory, recruit\r\n", ch );
          SendToCharacter( "spacecraft, auction, no_drive, can_land, can_fly, hotel\r\n", ch );
          return;
        }

      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg2 );
          value = GetRoomFlag( arg2 );

          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg2 );
          else if ( 1 << value == ROOM_PLR_HOME && GetTrustLevel(ch) < LEVEL_IMPLEMENTOR )
            SendToCharacter( "If you want to build a player home use the 'empty_home' flag instead.\r\n", ch );
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
          SendToCharacter( "Set the delay of the teleport. (0 = off).\r\n", ch );
          SendToCharacter( "Usage: redit teledelay <value>\r\n", ch );
          return;
        }

      location->TeleDelay = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "televnum" ) )
    {
      vnum_t televnum = INVALID_VNUM;

      if ( IsNullOrEmpty( argument ) )
        {
	  SendToCharacter( "Set the vnum of the room to teleport to.\r\n", ch );
          SendToCharacter( "Usage: redit televnum <vnum>\r\n", ch );
          return;

        }

      televnum = atoi( argument );

      if( !GetRoom( televnum ) )
	{
	  Echo( ch, "&R%ld is not a valid room vnum.\r\n" );
	}
      else
	{
	  location->TeleVnum = televnum;
	  SendToCharacter( "Done.\r\n", ch );
	}

      return;
    }

  if ( !StrCmp( arg, "sector" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
	  SectorType sector = SECT_INSIDE;
          SendToCharacter( "Set the sector type.\r\n", ch );
          SendToCharacter( "Usage: redit sector <value>\r\n", ch );
          SendToCharacter( "\r\nSector Values:\r\n", ch );

	  for( sector = SECT_INSIDE; sector < SECT_MAX; sector = (SectorType)(sector + 1) )
	    {
	      Echo( ch, "  %s\r\n", SectorNames[sector][1] );
	    }

          return;
        }

      location->Sector = GetSectorType( argument );

      if ( location->Sector == SECT_INVALID )
        {
          location->Sector = SECT_CITY;
          SendToCharacter( "Out of range\r\n.", ch );
        }
      else
	{
	  SendToCharacter( "Done.\r\n", ch );
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
          SendToCharacter( "Usage: redit exkey <dir> <key vnum>\r\n", ch );
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
          SendToCharacter( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }

      xit->key = keyvnum;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "exname" ) )
    {
      argument = OneArgument( argument, arg2 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          SendToCharacter( "Change or clear exit keywords.\r\n", ch );
          SendToCharacter( "Usage: redit exname <dir> [keywords]\r\n", ch );
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
          SendToCharacter( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }

      FreeMemory( xit->Keyword );
      xit->Keyword = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "exflags" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Toggle or display exit flags.\r\n", ch );
          SendToCharacter( "Usage: redit exflags <dir> <flag> [flag]...\r\n", ch );
          SendToCharacter( "\r\nExit flags:\r\n", ch );
          SendToCharacter( "isdoor, closed, locked, can_look, searchable, can_leave, can_climb,\r\n",
			ch );
          SendToCharacter( "nopassdoor, secret, pickproof, fly, climb, dig, window, auto, can_enter\r\n", ch );
          SendToCharacter( "hidden, no_mob, bashproof, bashed\r\n", ch );

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
          SendToCharacter( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }

      if ( IsNullOrEmpty( argument ) )
        {
          sprintf( buf, "Flags for exit direction: %d  Keywords: %s  Key: %ld\r\n[ ",
                   xit->vdir, xit->Keyword, xit->key );

          for ( value = 0; value <= MAX_EXFLAG; value++ )
            {
              if ( IsBitSet( xit->Flags, 1 << value ) )
                {
                  strcat( buf, ExitFlags[value] );
                  strcat( buf, " " );
		}
            }

          strcat( buf, "]\r\n" );
          SendToCharacter( buf, ch );
          return;
        }

      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg2 );
          value = GetExitFlag( arg2 );

          if ( value < 0 || value > MAX_EXFLAG )
            Echo( ch, "Unknown flag: %s\r\n", arg2 );
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
          SendToCharacter( "Create, change or remove an exit.\r\n", ch );
          SendToCharacter( "Usage: redit exit <dir> [room] [flags] [key] [keywords]\r\n", ch );
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
            edir = xit->vdir;
        }
      else
        xit = GetExit(location, edir);

      if ( evnum == INVALID_VNUM )
        {
          if ( xit )
            {
              ExtractExit(location, xit);
              SendToCharacter( "Exit removed.\r\n", ch );
              return;
            }

          SendToCharacter( "No exit in that direction.\r\n", ch );
          return;
        }

      if ( evnum < 1 || evnum > MAX_VNUM )
        {
          SendToCharacter( "Invalid room number.\r\n", ch );
          return;
        }

      if ( (tmp = GetRoom( evnum )) == NULL )
        {
          SendToCharacter( "Non-existant room.\r\n", ch );
          return;
        }

      if ( GetTrustLevel(ch) <= LEVEL_IMMORTAL && tmp->Area != location->Area )
        {
          SendToCharacter( "You can't make an exit to that room.\r\n", ch );
          return;
        }

      if ( addexit || !xit )
        {
          if ( numnotdir )
            {
              SendToCharacter( "Cannot add an exit by number, sorry.\r\n", ch );
              return;
            }

          if ( addexit && xit && GetExitTo(location, edir, tmp->Vnum) )
            {
              SendToCharacter( "There is already an exit in that direction leading to that location.\r\n", ch );
              return;
            }

          xit = MakeExit( location, tmp, edir );
	  xit->Keyword          = CopyString( "" );
          xit->Description              = CopyString( "" );
          xit->key                      = -1;
          xit->Flags                = 0;
          Act( AT_IMMORT, "$n reveals a hidden passage!", ch, NULL, NULL, TO_ROOM );
        }
      else
        Act( AT_IMMORT, "Something is different...", ch, NULL, NULL, TO_ROOM );

      if ( xit->to_room != tmp )
        {
          xit->to_room = tmp;
          xit->Vnum = evnum;
          texit = GetExitTo( xit->to_room, GetReverseDirection(edir), location->Vnum );

          if ( texit )
            {
              texit->rexit = xit;
              xit->rexit = texit;
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
              xit->key = ekey;
            }

          if ( IsNullOrEmpty( argument ) )
            {
              FreeMemory( xit->Keyword );
              xit->Keyword = CopyString( argument );
            }
        }

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /*
   * Twisted and evil, but works                                -Thoric
   * Makes an exit, and the reverse in one shot.
   */
  if ( !StrCmp( arg, "bexit" ) )
    {
      Exit *this_exit = NULL, *rxit = NULL;
      char tmpcmd[MAX_INPUT_LENGTH];
      Room *tmploc = NULL;
      vnum_t vnum = INVALID_VNUM;
      int exnum = 0;
      char rvnum[MAX_INPUT_LENGTH];
      bool numnotdir = false;

      argument = OneArgument( argument, arg2 );
      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          SendToCharacter( "Create, change or remove a two-way exit.\r\n", ch );
          SendToCharacter( "Usage: redit bexit <dir> [room] [flags] [key] [keywords]\r\n", ch );
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
	      edir = this_exit->vdir;
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

          if ( this_exit->to_room )
            rxit = GetExit(this_exit->to_room, GetReverseDirection(edir));
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

          if ( this_exit->to_room )
            rxit = GetExit(this_exit->to_room, GetReverseDirection(edir));
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
	  SendToCharacter( "Set the distance (in rooms) between this room, and the destination room.\r\n", ch );
          SendToCharacter( "Usage: redit exdistance <dir> [distance]\r\n", ch );
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
          xit->distance = urange( 1, atoi(argument), 50 );
          SendToCharacter( "Done.\r\n", ch );
          return;
        }
      SendToCharacter( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "exdesc" ) )
    {
      argument = OneArgument( argument, arg2 );

      if ( IsNullOrEmpty( arg2 ) )
        {
          SendToCharacter( "Create or clear a description for an exit.\r\n", ch );
          SendToCharacter( "Usage: redit exdesc <dir> [description]\r\n", ch );
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

          SendToCharacter( "Done.\r\n", ch );
          return;
        }

      SendToCharacter( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
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
