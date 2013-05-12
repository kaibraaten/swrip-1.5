#include <string.h>
#include "mud.h"

void do_redit( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  ROOM_INDEX_DATA *location = NULL, *tmp = NULL;
  EXTRA_DESCR_DATA *ed = NULL;
  char dir = '\0';
  EXIT_DATA *xit = NULL, *texit = NULL;
  int value = 0;
  int edir = 0, ekey = 0, evnum = 0;
  char *origarg = argument;

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor.\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;

    case SUB_ROOM_DESC:
      location = (ROOM_INDEX_DATA*)ch->dest_buf;

      if ( !location )
        {
          bug( "redit: sub_room_desc: NULL ch->dest_buf", 0 );
          location = ch->in_room;
        }

      STRFREE( location->description );
      location->description = copy_buffer( ch );
      stop_editing( ch );
      ch->substate = ch->tempnum;
      return;

    case SUB_ROOM_EXTRA:
      ed = (EXTRA_DESCR_DATA*)ch->dest_buf;

      if ( !ed )
        {
          bug( "redit: sub_room_extra: NULL ch->dest_buf", 0 );
          stop_editing( ch );
          return;
        }
      STRFREE( ed->description );
      ed->description = copy_buffer( ch );
      stop_editing( ch );
      ch->substate = ch->tempnum;
      return;
    }

  location = ch->in_room;

  smash_tilde( argument );
  argument = one_argument( argument, arg );
  if ( ch->substate == SUB_REPEATCMD )
    {
      if ( arg[0] == '\0' )
        {
          do_rstat( ch, "" );
          return;
        }
      if ( !str_cmp( arg, "done" ) || !str_cmp( arg, "off" ) )
        {
          send_to_char( "Redit mode off.\r\n", ch );
	  if ( ch->pcdata && ch->pcdata->subprompt )
            STRFREE( ch->pcdata->subprompt );
          ch->substate = SUB_NONE;
          return;
        }
    }
  if ( arg[0] == '\0' || !str_cmp( arg, "?" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        send_to_char( "Syntax: <field> value\r\n",                      ch );
      else
        send_to_char( "Syntax: redit <field> value\r\n",                ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  name desc ed rmed\r\n",                  ch );
      send_to_char( "  exit bexit exdesc exflags exname exkey\r\n",     ch );
      send_to_char( "  flags sector teledelay televnum tunnel\r\n",     ch );
      send_to_char( "  rlist exdistance\r\n",                           ch );
      return;
    }

  if ( !can_rmodify( ch, location ) )
    return;

  /*
    if ( !str_cmp( arg, "on" ) )
    {
    send_to_char( "Redit mode on.\r\n", ch );
    ch->substate = SUB_REPEATCMD;
    if ( ch->pcdata )
    {
    if ( ch->pcdata->subprompt )
    STRFREE( ch->pcdata->subprompt );
    ch->pcdata->subprompt = STRALLOC( "<&CRedit &W#%r&w> %i" );
    }
    return;
    }
  */

  if ( !str_cmp( arg, "substate" ) )
    {
      argument = one_argument( argument, arg2);
      if( !str_cmp( arg2, "north" )  )
        {
          ch->inter_substate = SUB_NORTH;
	  return;
        }
      if( !str_cmp( arg2, "east" )  )
        {
          ch->inter_substate = SUB_EAST;
          return;
        }
      if( !str_cmp( arg2, "south" )  )
        {
          ch->inter_substate = SUB_SOUTH;
          return;
        }
      if( !str_cmp( arg2, "west" )  )
        {
          ch->inter_substate = SUB_WEST;
          return;
        }
      if( !str_cmp( arg2, "up" )  )
        {
          ch->inter_substate = SUB_UP;
          return;
        }
      if( !str_cmp( arg2, "down" )  )
        {
          ch->inter_substate = SUB_DOWN;
          return;
        }
      send_to_char( " unrecognized substate in redit\r\n", ch);
      return;
    }


  if ( !str_cmp( arg, "name" ) )
    {
      if ( argument[0] == '\0' )
        {
          send_to_char( "Set the room name.  A very brief single line room description.\r\n", ch );
          send_to_char( "Usage: redit name <Room summary>\r\n", ch );
          return;
        }
      STRFREE( location->name );
      location->name = STRALLOC( argument );
      return;
    }

  if ( !str_cmp( arg, "desc" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      ch->substate = SUB_ROOM_DESC;
      ch->dest_buf = location;
      start_editing( ch, location->description );
      return;
    }

  if ( !str_cmp( arg, "tunnel" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the maximum characters allowed in the room at one time. (0 = unlimited).\r\n", ch );
          send_to_char( "Usage: redit tunnel <value>\r\n", ch );
          return;
        }
      location->tunnel = URANGE( 0, atoi(argument), 1000 );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "ed" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Create an extra description.\r\n", ch );
          send_to_char( "You must supply keyword(s).\r\n", ch );
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      ed = SetRExtra( location, argument );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      ch->substate = SUB_ROOM_EXTRA;
      ch->dest_buf = ed;
      start_editing( ch, ed->description );
      return;
    }

  if ( !str_cmp( arg, "rmed" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Remove an extra description.\r\n", ch );
          send_to_char( "You must supply keyword(s).\r\n", ch );
          return;
        }
      if ( DelRExtra( location, argument ) )
        send_to_char( "Deleted.\r\n", ch );
      else
        send_to_char( "Not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "rlist" ) )
    {
      RESET_DATA *pReset;
      char *bptr;
      AREA_DATA *tarea;
      short num;

      tarea = location->area;
      if ( !tarea->first_reset )
        {
          send_to_char( "This area has no resets to list.\r\n", ch );
          return;
        }
      num = 0;
      for ( pReset = tarea->first_reset; pReset; pReset = pReset->next )
        {
          num++;
          if ( (bptr = sprint_reset( ch, pReset, num, TRUE )) == NULL )
            continue;
          send_to_char( bptr, ch );
        }
      return;
    }

  if ( !str_cmp( arg, "flags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Toggle the room flags.\r\n", ch );
	  send_to_char( "Usage: redit flags <flag> [flag]...\r\n", ch );
          send_to_char( "\r\nPossible Flags: \r\n", ch );
          send_to_char( "dark, nomob, indoors, nomagic, bank,\r\n", ch );
          send_to_char( "private, safe, petshop, norecall, donation, nodropall, silence,\r\n", ch);
          send_to_char( "logspeach, nodrop, clanstoreroom, plr_home, empty_home, teleport\r\n",ch);
          send_to_char( "nofloor, prototype, refinery, factory, recruit\r\n", ch );
          send_to_char( "spacecraft, auction, no_drive, can_land, can_fly, hotel\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg2 );
          value = get_roomflag( arg2 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg2 );
          else if ( 1 << value == ROOM_PLR_HOME && get_trust(ch) < LEVEL_SUPREME )
            send_to_char( "If you want to build a player home use the 'empty_home' flag instead.\r\n", ch );
          else
            {
              TOGGLE_BIT( location->room_flags, 1 << value );
            }
        }
      return;
    }

  if ( !str_cmp( arg, "teledelay" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the delay of the teleport. (0 = off).\r\n", ch );
          send_to_char( "Usage: redit teledelay <value>\r\n", ch );
          return;
        }
      location->tele_delay = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "televnum" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
	  send_to_char( "Set the vnum of the room to teleport to.\r\n", ch );
          send_to_char( "Usage: redit televnum <vnum>\r\n", ch );
          return;
        }
      location->tele_vnum = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "sector" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the sector type.\r\n", ch );
          send_to_char( "Usage: redit sector <value>\r\n", ch );
          send_to_char( "\r\nSector Values:\r\n", ch );
          send_to_char( "0:dark, 1:city, 2:field, 3:forest, 4:hills, 5:mountain, 6:water_swim\r\n",
			ch );
          send_to_char( "7:water_noswim, 8:underwater, 9:air, 10:desert, 11:unkown, 12:oceanfloor, 13:underground\r\n", ch );

          return;
        }
      location->sector_type = atoi( argument );
      if ( location->sector_type < 0 || location->sector_type >= SECT_MAX )
        {
          location->sector_type = 1;
          send_to_char( "Out of range\r\n.", ch );
        }
      else
        send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exkey" ) )
    {
      argument = one_argument( argument, arg2 );
      argument = one_argument( argument, arg3 );
      if ( arg2[0] == '\0' || arg3[0] == '\0' )
        {
          send_to_char( "Usage: redit exkey <dir> <key vnum>\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
	  edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      value = atoi( arg3 );
      if ( !xit )
        {
          send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }
      xit->key = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exname" ) )
    {
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Change or clear exit keywords.\r\n", ch );
          send_to_char( "Usage: redit exname <dir> [keywords]\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( !xit )
        {
          send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }
      STRFREE( xit->keyword );
      xit->keyword = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exflags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Toggle or display exit flags.\r\n", ch );
          send_to_char( "Usage: redit exflags <dir> <flag> [flag]...\r\n", ch );
          send_to_char( "\r\nExit flags:\r\n", ch );
          send_to_char( "isdoor, closed, locked, can_look, searchable, can_leave, can_climb,\r\n",
			ch );
          send_to_char( "nopassdoor, secret, pickproof, fly, climb, dig, window, auto, can_enter\r\n", ch );
          send_to_char( "hidden, no_mob, bashproof, bashed\r\n", ch );

          return;
        }
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( !xit )
        {
          send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }
      if ( argument[0] == '\0' )
        {
          sprintf( buf, "Flags for exit direction: %d  Keywords: %s  Key: %d\r\n[ ",
                   xit->vdir, xit->keyword, xit->key );
          for ( value = 0; value <= MAX_EXFLAG; value++ )
            {
              if ( IS_SET( xit->exit_info, 1 << value ) )
                {
                  strcat( buf, exit_flags[value] );
                  strcat( buf, " " );
		}
            }
          strcat( buf, "]\r\n" );
          send_to_char( buf, ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg2 );
          value = get_exitflag( arg2 );
          if ( value < 0 || value > MAX_EXFLAG )
            ch_printf( ch, "Unknown flag: %s\r\n", arg2 );
          else
            TOGGLE_BIT( xit->exit_info, 1 << value );
        }
      return;
    }



  if ( !str_cmp( arg, "ex_flags" ) )
    {
      argument = one_argument( argument, arg2 );
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }

      value = get_exitflag(arg2);
      if ( value < 0 )
        {
          send_to_char("Bad exit flag. \r\n", ch);
          return;
        }
      if ( (xit = get_exit(location,edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
          xit = get_exit(location,edir);
	}
      TOGGLE_BIT( xit->exit_info, value );
      return;
    }


  if ( !str_cmp( arg, "ex_to_room" ) )
    {
      argument = one_argument( argument, arg2 );
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      evnum = atoi(arg2);
      if ( evnum < 1 || evnum > 32766 )
        {
          send_to_char( "Invalid room number.\r\n", ch );
          return;
        }
      if ( (tmp = get_room_index( evnum )) == NULL )
        {
          send_to_char( "Non-existant room.\r\n", ch );
          return;
        }
      if ( (xit = get_exit(location,edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
          xit = get_exit(location,edir);
        }
      xit->vnum = evnum;
      return;
    }

  if ( !str_cmp( arg, "ex_key" ) )
    {
      argument = one_argument( argument, arg2 );
      switch(ch->inter_substate)
        {
	case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      if ( (xit = get_exit(location,edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
          xit = get_exit(location,edir);
        }
      xit->key = atoi( arg2 );
      return;
    }

  if ( !str_cmp( arg, "ex_exdesc" ) )
    {
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      if ( (xit = get_exit(location, edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
        }
      sprintf(buf,"exdesc %c %s",dir,argument);
      do_redit(ch,buf);
      return;
    }

  if ( !str_cmp( arg, "ex_keywords" ) )  /* not called yet */
    {
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
	case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      if ( (xit = get_exit(location, edir)) == NULL )
        {
          sprintf(buf, "exit %c 1", dir);
          do_redit(ch,buf);
          if ( (xit = get_exit(location, edir)) == NULL )
            return;
        }
      sprintf( buf, "%s %s", xit->keyword, argument );
      STRFREE( xit->keyword );
      xit->keyword = STRALLOC( buf );
      return;
    }

  if ( !str_cmp( arg, "exit" ) )
    {
      bool addexit, numnotdir;

      argument = one_argument( argument, arg2 );
      argument = one_argument( argument, arg3 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Create, change or remove an exit.\r\n", ch );
          send_to_char( "Usage: redit exit <dir> [room] [flags] [key] [keywords]\r\n", ch );
          return;
        }
      addexit = numnotdir = FALSE;
      switch( arg2[0] )
        {
        default:        edir = get_dir(arg2);                     break;
        case '+':       edir = get_dir(arg2+1); addexit = TRUE;   break;
        case '#':       edir = atoi(arg2+1);    numnotdir = TRUE; break;
        }
      if ( arg3[0] == '\0' )
        evnum = 0;
      else
        evnum = atoi( arg3 );
      if ( numnotdir )
        {
	  if ( (xit = get_exit_num(location, edir)) != NULL )
            edir = xit->vdir;
        }
      else
        xit = get_exit(location, edir);
      if ( !evnum )
        {
          if ( xit )
            {
              extract_exit(location, xit);
              send_to_char( "Exit removed.\r\n", ch );
              return;
            }
          send_to_char( "No exit in that direction.\r\n", ch );
          return;
        }
      if ( evnum < 1 || evnum > 32766 )
        {
          send_to_char( "Invalid room number.\r\n", ch );
          return;
        }
      if ( (tmp = get_room_index( evnum )) == NULL )
        {
          send_to_char( "Non-existant room.\r\n", ch );
          return;
        }
      if ( get_trust(ch) <= LEVEL_IMMORTAL && tmp->area != location->area )
        {
          send_to_char( "You can't make an exit to that room.\r\n", ch );
          return;
        }
      if ( addexit || !xit )
        {
          if ( numnotdir )
            {
              send_to_char( "Cannot add an exit by number, sorry.\r\n", ch );
              return;
            }
          if ( addexit && xit && get_exit_to(location, edir, tmp->vnum) )
            {
              send_to_char( "There is already an exit in that direction leading to that location.\r\n", ch );
              return;
            }
          xit = make_exit( location, tmp, edir );
	  xit->keyword          = STRALLOC( "" );
          xit->description              = STRALLOC( "" );
          xit->key                      = -1;
          xit->exit_info                = 0;
          act( AT_IMMORT, "$n reveals a hidden passage!", ch, NULL, NULL, TO_ROOM );
        }
      else
        act( AT_IMMORT, "Something is different...", ch, NULL, NULL, TO_ROOM );
      if ( xit->to_room != tmp )
        {
          xit->to_room = tmp;
          xit->vnum = evnum;
          texit = get_exit_to( xit->to_room, get_rev_dir(edir), location->vnum );
          if ( texit )
            {
              texit->rexit = xit;
              xit->rexit = texit;
            }
        }
      argument = one_argument( argument, arg3 );
      if ( arg3[0] != '\0' )
        xit->exit_info = atoi( arg3 );
      if ( argument && argument[0] != '\0' )
        {
          one_argument( argument, arg3 );
          ekey = atoi( arg3 );
          if ( ekey != 0 || arg3[0] == '0' )
            {
              argument = one_argument( argument, arg3 );
              xit->key = ekey;
            }
          if ( argument && argument[0] != '\0' )
            {
              STRFREE( xit->keyword );
              xit->keyword = STRALLOC( argument );
            }
        }
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /*
   * Twisted and evil, but works                                -Thoric
   * Makes an exit, and the reverse in one shot.
   */
  if ( !str_cmp( arg, "bexit" ) )
    {
      EXIT_DATA *this_exit, *rxit;
      char tmpcmd[MAX_INPUT_LENGTH];
      ROOM_INDEX_DATA *tmploc;
      int vnum, exnum;
      char rvnum[MAX_INPUT_LENGTH];
      bool numnotdir;

      argument = one_argument( argument, arg2 );
      argument = one_argument( argument, arg3 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Create, change or remove a two-way exit.\r\n", ch );
          send_to_char( "Usage: redit bexit <dir> [room] [flags] [key] [keywords]\r\n", ch );
          return;
        }
      numnotdir = FALSE;
      switch( arg2[0] )
        {
        default:
          edir = get_dir( arg2 );
          break;
        case '#':
          numnotdir = TRUE;
          edir = atoi( arg2+1 );
          break;
        case '+':
          edir = get_dir( arg2+1 );
          break;
        }
      tmploc = location;
      exnum = edir;
      if ( numnotdir )
        {
          if ( (this_exit = get_exit_num(tmploc, edir)) != NULL )
            edir = this_exit->vdir;
        }
      else
        this_exit = get_exit(tmploc, edir);

      rxit = NULL;
      vnum = 0;
      rvnum[0] = '\0';

      if ( this_exit )
        {
          vnum = this_exit->vnum;
          if ( arg3[0] != '\0' )
            sprintf( rvnum, "%d", tmploc->vnum );
          if ( this_exit->to_room )
            rxit = get_exit(this_exit->to_room, get_rev_dir(edir));
          else
            rxit = NULL;
        }
      sprintf( tmpcmd, "exit %s %s %s", arg2, arg3, argument );
      do_redit( ch, tmpcmd );

      if ( numnotdir )
        this_exit = get_exit_num(tmploc, exnum);
      else
        this_exit = get_exit(tmploc, edir);

      if ( !rxit && this_exit )
        {
          vnum = this_exit->vnum;

          if ( arg3[0] != '\0' )
            sprintf( rvnum, "%d", tmploc->vnum );

          if ( this_exit->to_room )
            rxit = get_exit(this_exit->to_room, get_rev_dir(edir));
          else
            rxit = NULL;
        }

      if ( vnum )
        {
          sprintf( tmpcmd, "%d redit exit %d %s %s",
                   vnum, get_rev_dir(edir), rvnum, argument );
          do_at( ch, tmpcmd );
        }
      return;
    }

  if ( !str_cmp( arg, "exdistance" ) )
    {
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
	  send_to_char( "Set the distance (in rooms) between this room, and the destination room.\r\n", ch );
          send_to_char( "Usage: redit exdistance <dir> [distance]\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( xit )
        {
          xit->distance = URANGE( 1, atoi(argument), 50 );
          send_to_char( "Done.\r\n", ch );
          return;
        }
      send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exdesc" ) )
    {
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Create or clear a description for an exit.\r\n", ch );
          send_to_char( "Usage: redit exdesc <dir> [description]\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( xit )
	{
          STRFREE( xit->description );
          if ( !argument || argument[0] == '\0' )
            xit->description = STRALLOC( "" );
          else
            {
              sprintf( buf, "%s\r\n", argument );
              xit->description = STRALLOC( buf );
            }
          send_to_char( "Done.\r\n", ch );
          return;
        }
      send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_RESTRICTED;
      interpret( ch, origarg );
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = do_redit;
    }
  else
    {
      do_redit( ch, "" );
    }
}