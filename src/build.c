/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                     Online Building and Editing Module                   *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"

bool can_rmodify( const CHAR_DATA *ch, const ROOM_INDEX_DATA *room )
{
  short vnum = room->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;

  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this room.\r\n", ch );
      return FALSE;
    }

  if ( vnum >= pArea->low_r_vnum && vnum <= pArea->hi_r_vnum )
    return TRUE;

  send_to_char( "That room is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_omodify( const CHAR_DATA *ch, const OBJ_DATA *obj )
{
  short vnum = obj->pIndexData->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;

  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this object.\r\n", ch );
      return FALSE;
    }

  if ( vnum >= pArea->low_o_vnum && vnum <= pArea->hi_o_vnum )
    return TRUE;

  send_to_char( "That object is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_oedit( const CHAR_DATA *ch, const OBJ_INDEX_DATA *obj )
{
  short vnum = obj->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;

  if ( get_trust( ch ) >= LEVEL_GOD )
    return TRUE;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this object.\r\n", ch );
      return FALSE;
    }

  if ( vnum >= pArea->low_o_vnum
       &&   vnum <= pArea->hi_o_vnum )
    return TRUE;

  send_to_char( "That object is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_mmodify( const CHAR_DATA *ch, const CHAR_DATA *mob )
{
  short vnum;
  AREA_DATA *pArea;

  if ( mob == ch )
    return TRUE;

  if ( !is_npc( mob ) )
    {
      if ( get_trust( ch ) >= sysdata.level_modify_proto && get_trust(ch) >
           get_trust( mob ) )
        return TRUE;
      else
        send_to_char( "You can't do that.\r\n", ch );
      return FALSE;
    }

  vnum = mob->pIndexData->vnum;

  if ( is_npc( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this mobile.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_m_vnum
       &&   vnum <= pArea->hi_m_vnum )
    return TRUE;

  send_to_char( "That mobile is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_medit( const CHAR_DATA *ch, const MOB_INDEX_DATA *mob )
{
  short vnum = mob->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= LEVEL_GOD )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this mobile.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_m_vnum
       &&   vnum <= pArea->hi_m_vnum )
    return TRUE;

  send_to_char( "That mobile is not in your allocated range.\r\n", ch );
  return FALSE;
}

void start_editing( CHAR_DATA *ch, char *data )
{
  EDITOR_DATA *edit;
  short lines, size, lpos;
  char c;

  if ( !ch->desc )
    {
      bug( "Fatal: start_editing: no desc", 0 );
      return;
    }
  if ( ch->substate == SUB_RESTRICTED )
    bug( "NOT GOOD: start_editing: ch->substate == SUB_RESTRICTED", 0 );

  set_char_color( AT_GREEN, ch );
  send_to_char( "Begin entering your text (/? =help /s =save /c =clear /l =list /f =format)\r\n", ch );
  send_to_char( "--------------------------------------------------------------------------\r\n> ", ch );
  if ( ch->editor )
    stop_editing( ch );

  CREATE( edit, EDITOR_DATA, 1 );
  edit->numlines = 0;
  edit->on_line  = 0;
  edit->size     = 0;
  size = 0;  lpos = 0;  lines = 0;
  if ( !data )
    bug("editor: data is NULL!\r\n",0);
  else
    for ( ;; )
      {
        c = data[size++];
        if ( c == '\0' )
          {
            edit->line[lines][lpos] = '\0';
            break;
          }
        else
          if ( c == '\r' );
          else
            if ( c == '\n' || lpos > 78)
              {
                edit->line[lines][lpos] = '\0';
                lines++;
                lpos = 0;
              }
            else
              edit->line[lines][lpos++] = c;
        if ( lines >= 49 || size > 4096 )
          {
            edit->line[lines][lpos] = '\0';
            break;
          }
      }
  edit->numlines = lines;
  edit->size = size;
  edit->on_line = lines;
  ch->editor = edit;
  ch->desc->connected = CON_EDITING;
}

char *copy_buffer( CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  char tmp[100];
  short x, len;

  if ( !ch )
    {
      bug( "copy_buffer: null ch", 0 );
      return STRALLOC( "" );
    }

  if ( !ch->editor )
    {
      bug( "copy_buffer: null editor", 0 );
      return STRALLOC( "" );
    }

  buf[0] = '\0';
  for ( x = 0; x < ch->editor->numlines; x++ )
    {
      strcpy( tmp, ch->editor->line[x] );
      smush_tilde( tmp );
      len = strlen(tmp);
      if ( tmp[len-1] == '~' )
        tmp[len-1] = '\0';
      else
        strcat( tmp, "\r\n" );
      strcat( buf, tmp );
    }
  return STRALLOC( buf );
}

void stop_editing( CHAR_DATA *ch )
{
  set_char_color( AT_PLAIN, ch );
  DISPOSE( ch->editor );
  ch->editor = NULL;
  send_to_char( "Done.\r\n", ch );
  ch->dest_buf  = NULL;
  ch->spare_ptr = NULL;
  ch->substate  = SUB_NONE;
  if ( !ch->desc )
    {
      bug( "Fatal: stop_editing: no desc", 0 );
      return;
    }
  ch->desc->connected = CON_PLAYING;
}

/*
 * Simple but nice and handle line editor.                      -Thoric
 */
void edit_buffer( CHAR_DATA *ch, char *argument )
{
  DESCRIPTOR_DATA *d = NULL;
  EDITOR_DATA *edit = NULL;
  char cmd[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  short line = 0, max_buf_lines = 0;
  bool save = FALSE;

  if ( (d = ch->desc) == NULL )
    {
      send_to_char( "You have no descriptor.\r\n", ch );
      return;
    }

  if ( d->connected != CON_EDITING )
    {
      send_to_char( "You can't do that!\r\n", ch );
      bug( "Edit_buffer: d->connected != CON_EDITING", 0 );
      return;
    }

  if ( ch->substate <= SUB_PAUSE )
    {
      send_to_char( "You can't do that!\r\n", ch );
      bug( "Edit_buffer: illegal ch->substate (%d)", ch->substate );
      d->connected = CON_PLAYING;
      return;
    }

  if ( !ch->editor )
    {
      send_to_char( "You can't do that!\r\n", ch );
      bug( "Edit_buffer: null editor", 0 );
      d->connected = CON_PLAYING;
      return;
    }

  edit = ch->editor;
  save = FALSE;
  max_buf_lines = 24;

  if ( ch->substate == SUB_MPROG_EDIT || ch->substate == SUB_HELP_EDIT )
    max_buf_lines = 48;

  if ( argument[0] == '/' || argument[0] == '\\' )
    {
      one_argument( argument, cmd );
      if ( !str_cmp( cmd+1, "?" ) )
        {
          send_to_char( "Editing commands\r\n---------------------------------\r\n", ch );
          send_to_char( "/l              list buffer\r\n",      ch );
          send_to_char( "/c              clear buffer\r\n",     ch );
          send_to_char( "/d [line]       delete line\r\n",      ch );
          send_to_char( "/g <line>       goto line\r\n",        ch );
          send_to_char( "/i <line>       insert line\r\n",      ch );
          send_to_char( "/r <old> <new>  global replace\r\n",   ch );
          send_to_char( "/a              abort editing\r\n",    ch );
          send_to_char( "/f              format text ( to fit screen )\r\n",  ch );
          if ( get_trust(ch) > LEVEL_IMMORTAL )
            send_to_char( "/! <command>    execute command (do not use another editing command)\r\n",  ch );
          send_to_char( "/s              save buffer\r\n\r\n> ",ch );
          return;
        }

      if ( !str_cmp( cmd+1, "c" ) )
        {

          memset( edit, '\0', sizeof(EDITOR_DATA) );
          edit->numlines = 0;
          edit->on_line   = 0;
          send_to_char( "Buffer cleared.\r\n> ", ch );
          return;
        }

      if ( !str_cmp( cmd+1, "r" ) )
        {
          char word1[MAX_INPUT_LENGTH];
          char word2[MAX_INPUT_LENGTH];
          char *sptr, *wptr, *lwptr;
          int x, count, wordln, lineln;

          sptr = one_argument( argument, word1 );
          sptr = one_argument( sptr, word1 );
          sptr = one_argument( sptr, word2 );
          if ( word1[0] == '\0' || word2[0] == '\0' )
            {
              send_to_char( "Need word to replace, and replacement.\r\n> ", ch );
              return;
            }
          if ( str_cmp( word1, word2 ) == 0 )
            {
              send_to_char( "Done.\r\n> ", ch );
              return;
            }

          count = 0;
	  wordln = strlen(word1);
          ch_printf( ch, "Replacing all occurrences of %s with %s...\r\n", word1, word2 );
          for ( x = edit->on_line; x < edit->numlines; x++ )
            {
              lwptr = edit->line[x];
              while ( (wptr = strstr( lwptr, word1 )) != NULL )
                {
                  sptr = lwptr;
                  lwptr = wptr + wordln;
                  sprintf( buf, "%s%s", word2, wptr + wordln );
                  lineln = wptr - edit->line[x] - wordln;
                  ++count;
                  if ( strlen(buf) + lineln > 79 )
                    {
                      lineln = UMAX(0, (79 - strlen(buf)));
                      buf[lineln] = '\0';
                      break;
                    }
                  else
                    lineln = strlen(buf);
                  buf[lineln] = '\0';
                  strcpy( wptr, buf );
                }
            }
          ch_printf( ch, "Found and replaced %d occurrence(s).\r\n> ", count );
          return;
        }

      if ( !str_cmp( cmd+1, "f" ) )
        {
          char   temp_buf[5000];
          int    x, ep, old_p, end_mark;
          int    p = 0;

          for ( x = 0; x < edit->numlines; x++ )
            {
              strcpy ( temp_buf+p , edit->line[x] );
              p += strlen( edit->line[x] );
              temp_buf[p] = ' ';
              p++;
            }

          temp_buf[p] = '\0';
          end_mark = p;
          p = 75;
          old_p =0;
          edit->on_line =0;
          edit->numlines =0;

          while ( old_p < end_mark )
            {
              while ( temp_buf[p] != ' ' && temp_buf[p] != '\0' && p > old_p )
                p--;

              if ( p == old_p )
                p +=75;

              if ( p > end_mark )
                p = end_mark;

              ep =0;
              for ( x= old_p ; x < p ; x++ )
                {
                  edit->line[edit->on_line][ep] = temp_buf[x];
                  ep++;
                }
              edit->line[edit->on_line][ep] = '\0';

              edit->on_line++;
              edit->numlines++;

              old_p = p+1 ;
              p += 75;

            }

          send_to_char( "OK.\r\n> ", ch );
          return;
        }

      if ( !str_cmp( cmd+1, "i" ) )
        {
          if ( edit->numlines >= max_buf_lines )
            send_to_char( "Buffer is full.\r\n> ", ch );
          else
            {
              if ( argument[2] == ' ' )
                line = atoi( argument + 2 ) - 1;
              else
                line = edit->on_line;
              if ( line < 0 )
                line = edit->on_line;
              if ( line < 0 || line > edit->numlines )
                send_to_char( "Out of range.\r\n> ", ch );
              else
                {
		  int x = 0;

                  for ( x = ++edit->numlines; x > line; x-- )
                    strcpy( edit->line[x], edit->line[x-1] );
                  strcpy( edit->line[line], "" );
                  send_to_char( "Line inserted.\r\n> ", ch );
                }
            }
          return;
        }
      if ( !str_cmp( cmd+1, "d" ) )
        {
          if ( edit->numlines == 0 )
            send_to_char( "Buffer is empty.\r\n> ", ch );
          else
            {
              if ( argument[2] == ' ' )
                line = atoi( argument + 2 ) - 1;
              else
                line = edit->on_line;
              if ( line < 0 )
                line = edit->on_line;
              if ( line < 0 || line > edit->numlines )
                send_to_char( "Out of range.\r\n> ", ch );
              else
                {
		  int x = 0;

                  if ( line == 0 && edit->numlines == 1 )
                    {
                      memset( edit, '\0', sizeof(EDITOR_DATA) );
                      edit->numlines = 0;
                      edit->on_line   = 0;
                      send_to_char( "Line deleted.\r\n> ", ch );
                      return;
                    }

                  for ( x = line; x < (edit->numlines - 1); x++ )
                    strcpy( edit->line[x], edit->line[x+1] );

                  strcpy( edit->line[edit->numlines--], "" );

                  if ( edit->on_line > edit->numlines )
                    edit->on_line = edit->numlines;

                  send_to_char( "Line deleted.\r\n> ", ch );
                }
            }
          return;
        }
      if ( !str_cmp( cmd+1, "g" ) )
        {
          if ( edit->numlines == 0 )
            send_to_char( "Buffer is empty.\r\n> ", ch );
          else
            {
              if ( argument[2] == ' ' )
                line = atoi( argument + 2 ) - 1;
              else
                {
                  send_to_char( "Goto what line?\r\n> ", ch );
                  return;
                }
              if ( line < 0 )
                line = edit->on_line;
              if ( line < 0 || line > edit->numlines )
                send_to_char( "Out of range.\r\n> ", ch );
              else
                {
                  edit->on_line = line;
                  ch_printf( ch, "(On line %d)\r\n> ", line+1 );
                }
            }
          return;
        }
      if ( !str_cmp( cmd+1, "l" ) )
        {
          if ( edit->numlines == 0 )
            send_to_char( "Buffer is empty.\r\n> ", ch );
          else
            {
	      int x = 0;

              send_to_char( "------------------\r\n", ch );

              for ( x = 0; x < edit->numlines; x++ )
                ch_printf( ch, "%2d> %s\r\n", x+1, edit->line[x] );

              send_to_char( "------------------\r\n> ", ch );
            }
          return;
        }
      if ( !str_cmp( cmd+1, "a" ) )
        {
          send_to_char( "\r\nAborting... ", ch );
          stop_editing( ch );
          return;
        }
      if ( get_trust(ch) > LEVEL_IMMORTAL && !str_cmp( cmd+1, "!" ) )
        {
          DO_FUN *last_cmd;
          int substate = ch->substate;

          last_cmd = ch->last_cmd;
          ch->substate = SUB_RESTRICTED;
          interpret(ch, argument+3);
          ch->substate = substate;
          ch->last_cmd = last_cmd;
          set_char_color( AT_GREEN, ch );
          send_to_char( "\r\n> ", ch );
          return;
        }
      if ( !str_cmp( cmd+1, "s" ) )
        {
          d->connected = CON_PLAYING;
          if ( !ch->last_cmd )
            return;
          (*ch->last_cmd) ( ch, "" );
          return;
        }
    }

  if ( edit->size + strlen(argument) + 1 >= MAX_STRING_LENGTH - 1 )
    send_to_char( "You buffer is full.\r\n", ch );
  else
    {
      int b_end;
      int bm = 75;
      int bp = 0;
      int ep =0;

      strcpy( buf, argument );

      b_end = strlen(buf);

      while ( bp < b_end )
        {
          while ( buf[bm] != ' ' && bm > bp )
            bm--;

          if ( bm == bp )
            bm += 75;

          if ( bm > b_end )
            bm = b_end;

          ep=0;
          while ( bp < bm )
            {
              edit->line[edit->on_line][ep] = buf[bp];
              bp++;
              ep++;
            }

          bm = bp+75;
          bp ++;

          edit->line[edit->on_line][ep] = '\0';
          edit->on_line++;

          if ( edit->on_line > edit->numlines )
            edit->numlines++;
          if ( edit->numlines > max_buf_lines )
            {
              edit->numlines = max_buf_lines;
              send_to_char( "Buffer full.\r\n", ch );
              save = TRUE;
              break;
            }
        }
    }

  if ( save )
    {
      d->connected = CON_PLAYING;
      if ( !ch->last_cmd )
        return;
      (*ch->last_cmd) ( ch, "" );
      return;
    }
  send_to_char( "> ", ch );
}

void free_reset( AREA_DATA *are, RESET_DATA *res )
{
  UNLINK( res, are->first_reset, are->last_reset, next, prev );
  DISPOSE( res );
}

void free_area( AREA_DATA *are )
{
  DISPOSE( are->name );
  DISPOSE( are->filename );
  while ( are->first_reset )
    free_reset( are, are->first_reset );
  DISPOSE( are );
  are = NULL;
}

void assign_area( CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char taf[1024];
  AREA_DATA *tarea, *tmp;
  bool created = FALSE;

  if ( is_npc( ch ) )
    return;
  if ( get_trust( ch ) >= LEVEL_AVATAR
       &&   ch->pcdata->r_range_lo
       &&   ch->pcdata->r_range_hi )
    {
      tarea = ch->pcdata->area;
      sprintf( taf, "%s.are", capitalize( ch->name ) );
      if ( !tarea )
        {
          for ( tmp = first_build; tmp; tmp = tmp->next )
            if ( !str_cmp( taf, tmp->filename ) )
              {
                tarea = tmp;
                break;
              }
        }
      if ( !tarea )
        {
          sprintf( buf, "Creating area entry for %s", ch->name );
          log_string_plus( buf, LOG_NORMAL, ch->top_level );
          CREATE( tarea, AREA_DATA, 1 );
          LINK( tarea, first_build, last_build, next, prev );
          tarea->first_reset    = NULL;
          tarea->last_reset     = NULL;
          sprintf( buf, "{PROTO} %s's area in progress", ch->name );
          tarea->name           = str_dup( buf );
          tarea->filename       = str_dup( taf );
          sprintf( buf2, "%s", ch->name );
          tarea->author         = STRALLOC( buf2 );
          tarea->age            = 0;
          tarea->nplayer        = 0;
          SET_BIT( tarea->flags, AFLAG_NOQUEST );

          created = TRUE;
        }
      else
        {
          sprintf( buf, "Updating area entry for %s", ch->name );
          log_string_plus( buf, LOG_NORMAL, ch->top_level );
        }
      tarea->low_r_vnum = ch->pcdata->r_range_lo;
      tarea->low_o_vnum = ch->pcdata->o_range_lo;
      tarea->low_m_vnum = ch->pcdata->m_range_lo;
      tarea->hi_r_vnum  = ch->pcdata->r_range_hi;
      tarea->hi_o_vnum  = ch->pcdata->o_range_hi;
      tarea->hi_m_vnum  = ch->pcdata->m_range_hi;
      ch->pcdata->area  = tarea;
      if ( created )
        sort_area( tarea, TRUE );
    }
}

EXTRA_DESCR_DATA *SetRExtra( ROOM_INDEX_DATA *room, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = room->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, room->first_extradesc, room->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelRExtra( ROOM_INDEX_DATA *room, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = room->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, room->first_extradesc, room->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

EXTRA_DESCR_DATA *SetOExtra( OBJ_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtra( OBJ_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

EXTRA_DESCR_DATA *SetOExtraProto( OBJ_INDEX_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtraProto( OBJ_INDEX_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

void fold_area( AREA_DATA *tarea, char *filename, bool install )
{
  RESET_DATA            *treset;
  ROOM_INDEX_DATA       *room;
  MOB_INDEX_DATA        *pMobIndex;
  OBJ_INDEX_DATA        *pObjIndex;
  MPROG_DATA            *mprog;
  EXIT_DATA             *xit;
  EXTRA_DESCR_DATA      *ed;
  AFFECT_DATA           *paf;
  SHOP_DATA             *pShop;
  REPAIR_DATA           *pRepair;
  char           buf[MAX_STRING_LENGTH];
  FILE          *fpout;
  int                    vnum;
  int                    val0, val1, val2, val3, val4, val5;
  bool           complexmob;

  sprintf( buf, "Saving %s...", tarea->filename );
  log_string_plus( buf, LOG_NORMAL, LEVEL_GREATER );

  sprintf( buf, "%s.bak", filename );
  rename( filename, buf );

  if ( ( fpout = fopen( filename, "w" ) ) == NULL )
    {
      bug( "fold_area: fopen", 0 );
      perror( filename );
      return;
    }

  fprintf( fpout, "#AREA   %s~\n\n\n\n", tarea->name );

  fprintf( fpout, "#AUTHOR %s~\n\n", tarea->author );
  fprintf( fpout, "#RANGES\n");
  fprintf( fpout, "%d %d %d %d\n", tarea->low_soft_range,
           tarea->hi_soft_range,
           tarea->low_hard_range,
           tarea->hi_hard_range );
  fprintf( fpout, "$\n\n");
  if ( tarea->resetmsg )        /* Rennard */
    fprintf( fpout, "#RESETMSG %s~\n\n", tarea->resetmsg );
  if ( tarea->reset_frequency )
    fprintf( fpout, "#FLAGS\n%d %d\n\n",
             tarea->flags, tarea->reset_frequency );
  else
    fprintf( fpout, "#FLAGS\n%d\n\n", tarea->flags );

  fprintf( fpout, "#ECONOMY %d %d\n\n", tarea->high_economy, tarea->low_economy );

  /* save mobiles */
  fprintf( fpout, "#MOBILES\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( install )
        REMOVE_BIT( pMobIndex->act, ACT_PROTOTYPE );
      if ( pMobIndex->perm_str != 13    ||   pMobIndex->perm_int   != 13
           ||   pMobIndex->perm_wis != 13       ||   pMobIndex->perm_dex   != 13
           ||   pMobIndex->perm_con != 13       ||   pMobIndex->perm_cha   != 13
           ||   pMobIndex->perm_lck != 13
           ||   pMobIndex->hitroll  != 0        ||   pMobIndex->damroll    != 0
           ||   pMobIndex->race  != 0
           ||   pMobIndex->attacks       != 0   ||   pMobIndex->defenses   != 0
           ||   pMobIndex->height        != 0   ||   pMobIndex->weight     != 0
           ||   pMobIndex->speaks        != 0   ||   pMobIndex->speaking   != 0
           ||   pMobIndex->xflags        != 0   ||   pMobIndex->numattacks != 0
           ||   pMobIndex->vip_flags !=0 )
        complexmob = TRUE;
      else
        complexmob = FALSE;
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pMobIndex->player_name          );
      fprintf( fpout,   "%s~\n",        pMobIndex->short_descr          );
      fprintf( fpout,   "%s~\n",        strip_cr(pMobIndex->long_descr) );
      fprintf( fpout, "%s~\n",  strip_cr(pMobIndex->description));
      fprintf( fpout, "%d %d %d %c\n",pMobIndex->act,
               pMobIndex->affected_by,
               pMobIndex->alignment,
               complexmob ? 'Z' : 'S'           );
      /* C changed to Z for swreality vip_flags  */

      fprintf( fpout, "%d %d %d ",      pMobIndex->level,
               pMobIndex->mobthac0,
               pMobIndex->ac                    );
      fprintf( fpout, "%dd%d+%d ",      pMobIndex->hitnodice,
               pMobIndex->hitsizedice,
               pMobIndex->hitplus               );
      fprintf( fpout, "%dd%d+%d\n",     pMobIndex->damnodice,
               pMobIndex->damsizedice,
               pMobIndex->damplus               );
      fprintf( fpout, "%d 0\n", pMobIndex->gold                 );
      fprintf( fpout, "%d %d %d\n",     pMobIndex->position,
               pMobIndex->defposition,
               pMobIndex->sex                   );
      if ( complexmob )
        {
          fprintf( fpout, "%d %d %d %d %d %d %d\n",
                   pMobIndex->perm_str,
                   pMobIndex->perm_int,
                   pMobIndex->perm_wis,
                   pMobIndex->perm_dex,
                   pMobIndex->perm_con,
                   pMobIndex->perm_cha,
                   pMobIndex->perm_lck );
          fprintf( fpout, "%d %d %d %d %d\n",
                   pMobIndex->saving_poison_death,
                   pMobIndex->saving_wand,
                   pMobIndex->saving_para_petri,
                   pMobIndex->saving_breath,
                   pMobIndex->saving_spell_staff );
          fprintf( fpout, "%d 0 %d %d %d %d %d\n",
                   pMobIndex->race,
                   pMobIndex->height,
                   pMobIndex->weight,
                   pMobIndex->speaks,
                   pMobIndex->speaking,
                   pMobIndex->numattacks );
          fprintf( fpout, "%d %d %d %d %d %d %d %d\n",
                   pMobIndex->hitroll,
                   pMobIndex->damroll,
                   pMobIndex->xflags,
                   pMobIndex->resistant,
                   pMobIndex->immune,
                   pMobIndex->susceptible,
                   pMobIndex->attacks,
                   pMobIndex->defenses );
          fprintf( fpout, "%d 0 0 0 0 0 0 0\n",
                   pMobIndex->vip_flags );
        }
      if ( pMobIndex->mudprogs )
        {
          for ( mprog = pMobIndex->mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_m_vnum )
    tarea->hi_m_vnum = vnum - 1;

  /* save objects */
  fprintf( fpout, "#OBJECTS\n" );
  for ( vnum = tarea->low_o_vnum; vnum <= tarea->hi_o_vnum; vnum++ )
    {
      if ( (pObjIndex = get_obj_index( vnum )) == NULL )
        continue;
      if ( install )
        REMOVE_BIT( pObjIndex->extra_flags, ITEM_PROTOTYPE );
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pObjIndex->name                 );
      fprintf( fpout, "%s~\n",  pObjIndex->short_descr          );
      fprintf( fpout, "%s~\n",  pObjIndex->description          );
      fprintf( fpout, "%s~\n",  pObjIndex->action_desc          );
      if ( pObjIndex->layers )
        fprintf( fpout, "%d %d %d %d\n",        pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags,
                 pObjIndex->layers      );
      else
        fprintf( fpout, "%d %d %d\n",   pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags          );

      val0 = pObjIndex->value[0];
      val1 = pObjIndex->value[1];
      val2 = pObjIndex->value[2];
      val3 = pObjIndex->value[3];
      val4 = pObjIndex->value[4];
      val5 = pObjIndex->value[5];
      switch ( pObjIndex->item_type )
        {
        case ITEM_PILL:
        case ITEM_POTION:
        case ITEM_SCROLL:
          if ( IS_VALID_SN(val1) ) val1 = skill_table[val1]->slot;
          if ( IS_VALID_SN(val2) ) val2 = skill_table[val2]->slot;
          if ( IS_VALID_SN(val3) ) val3 = skill_table[val3]->slot;
          break;
        case ITEM_DEVICE:
          if ( IS_VALID_SN(val3) ) val3 = skill_table[val3]->slot;
          break;
        case ITEM_SALVE:
          if ( IS_VALID_SN(val4) ) val4 = skill_table[val4]->slot;
          if ( IS_VALID_SN(val5) ) val5 = skill_table[val5]->slot;
          break;
        }
      if ( val4 || val5 )
        fprintf( fpout, "%d %d %d %d %d %d\n",val0,
                 val1,
                 val2,
                 val3,
                 val4,
                 val5 );
      else
        fprintf( fpout, "%d %d %d %d\n",        val0,
                 val1,
                 val2,
                 val3 );

      fprintf( fpout, "%d %d %d\n",     pObjIndex->weight,
               pObjIndex->cost,
               pObjIndex->rent ? pObjIndex->rent :
               (int) (pObjIndex->cost / 10)             );

      for ( ed = pObjIndex->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, strip_cr( ed->description )       );

      for ( paf = pObjIndex->first_affect; paf; paf = paf->next )
        fprintf( fpout, "A\n%d %d\n", paf->location,
                 ((paf->location == APPLY_WEAPONSPELL
                   || paf->location == APPLY_WEARSPELL
                   || paf->location == APPLY_REMOVESPELL
                   || paf->location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->modifier))
                 ? skill_table[paf->modifier]->slot : paf->modifier             );

      if ( pObjIndex->mudprogs )
        {
          for ( mprog = pObjIndex->mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_o_vnum )
    tarea->hi_o_vnum = vnum - 1;

  /* save rooms   */
  fprintf( fpout, "#ROOMS\n" );
  for ( vnum = tarea->low_r_vnum; vnum <= tarea->hi_r_vnum; vnum++ )
    {
      if ( (room = get_room_index( vnum )) == NULL )
        continue;
      if ( install )
        {
          CHAR_DATA *victim, *vnext;
          OBJ_DATA  *obj, *obj_next;

          /* remove prototype flag from room */
          REMOVE_BIT( room->room_flags, ROOM_PROTOTYPE );
          /* purge room of (prototyped) mobiles */
          for ( victim = room->first_person; victim; victim = vnext )
            {
              vnext = victim->next_in_room;
              if ( is_npc(victim) )
                extract_char( victim, TRUE );
            }
          /* purge room of (prototyped) objects */
          for ( obj = room->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              extract_obj( obj );
            }
        }
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  room->name                      );
      fprintf( fpout, "%s~\n",  strip_cr( room->description )   );
      if ( (room->tele_delay > 0 && room->tele_vnum > 0) || room->tunnel > 0 )
        fprintf( fpout, "0 %d %d %d %d %d\n",   room->room_flags,
                 room->sector_type,
                 room->tele_delay,
                 room->tele_vnum,
                 room->tunnel           );
      else
        fprintf( fpout, "0 %d %d\n",    room->room_flags,
                 room->sector_type      );
      for ( xit = room->first_exit; xit; xit = xit->next )
        {
          if ( IS_SET(xit->exit_info, EX_PORTAL) ) /* don't fold portals */
            continue;
          fprintf( fpout, "D%d\n",              xit->vdir );
          fprintf( fpout, "%s~\n",              strip_cr( xit->description ) );
          fprintf( fpout, "%s~\n",              strip_cr( xit->keyword ) );
          if ( xit->distance > 1 )
            fprintf( fpout, "%d %d %d %d\n",    xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum,
                     xit->distance );
          else
            fprintf( fpout, "%d %d %d\n",       xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum );
        }
      for ( ed = room->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, strip_cr( ed->description ));

      if ( room->mudprogs )
        {
          for ( mprog = room->mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
      fprintf( fpout, "S\n" );
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_r_vnum )
    tarea->hi_r_vnum = vnum - 1;

  /* save resets   */
  fprintf( fpout, "#RESETS\n" );
  for ( treset = tarea->first_reset; treset; treset = treset->next )
    {
      switch( treset->command ) /* extra arg1 arg2 arg3 */
        {
        default:  case '*': break;
        case 'm': case 'M':
        case 'o': case 'O':
        case 'p': case 'P':
        case 'e': case 'E':
        case 'd': case 'D':
        case 't': case 'T':
          fprintf( fpout, "%c %d %d %d %d\n", UPPER(treset->command),
                   treset->extra, treset->arg1, treset->arg2, treset->arg3 );
          break;
        case 'g': case 'G':
        case 'r': case 'R':
          fprintf( fpout, "%c %d %d %d\n", UPPER(treset->command),
                   treset->extra, treset->arg1, treset->arg2 );
          break;
        }
    }
  fprintf( fpout, "S\n\n\n" );

  /* save shops */
  fprintf( fpout, "#SHOPS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( (pShop = pMobIndex->pShop) == NULL )
        continue;
      fprintf( fpout, " %d   %2d %2d %2d %2d %2d   %3d %3d",
               pShop->keeper,
               pShop->buy_type[0],
               pShop->buy_type[1],
               pShop->buy_type[2],
               pShop->buy_type[3],
               pShop->buy_type[4],
               pShop->profit_buy,
               pShop->profit_sell );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pShop->open_hour,
               pShop->close_hour,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save repair shops */
  fprintf( fpout, "#REPAIRS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( (pRepair = pMobIndex->rShop) == NULL )
        continue;
      fprintf( fpout, " %d   %2d %2d %2d         %3d %3d",
               pRepair->keeper,
               pRepair->fix_type[0],
               pRepair->fix_type[1],
               pRepair->fix_type[2],
               pRepair->profit_fix,
               pRepair->shop_type );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pRepair->open_hour,
               pRepair->close_hour,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save specials */
  fprintf( fpout, "#SPECIALS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( pMobIndex->spec_fun )
        fprintf( fpout, "M  %d %s\n",   pMobIndex->vnum,
                 lookup_spec( pMobIndex->spec_fun ) );
      if ( pMobIndex->spec_2 )
        fprintf( fpout, "M  %d %s\n",   pMobIndex->vnum,
                 lookup_spec( pMobIndex->spec_2 ) );
    }
  fprintf( fpout, "S\n\n\n" );

  /* END */
  fprintf( fpout, "#$\n" );
  fclose( fpout );
}

void write_area_list( void )
{
  AREA_DATA *tarea;
  FILE *fpout;

  fpout = fopen( AREA_LIST, "w" );
  if ( !fpout )
    {
      bug( "FATAL: cannot open area.lst for writing!\r\n", 0 );
      return;
    }
  fprintf( fpout, "help.are\n" );
  for ( tarea = first_area; tarea; tarea = tarea->next )
    fprintf( fpout, "%s\n", tarea->filename );
  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void add_reset_nested( AREA_DATA *tarea, OBJ_DATA *obj )
{
  int limit;

  for ( obj = obj->first_content; obj; obj = obj->next_content )
    {
      limit = obj->pIndexData->count;
      if ( limit < 1 )
        limit = 1;
      add_reset( tarea, 'P', 1, obj->pIndexData->vnum, limit,
                 obj->in_obj->pIndexData->vnum );
      if ( obj->first_content )
        add_reset_nested( tarea, obj );
    }
}

/*
 * Parse a reset command string into a reset_data structure
 */
RESET_DATA *parse_reset( AREA_DATA *tarea, char *argument, CHAR_DATA *ch )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];
  char letter;
  int extra, val1, val2, val3;
  int value;
  ROOM_INDEX_DATA *room;
  EXIT_DATA     *pexit;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  argument = one_argument( argument, arg4 );
  extra = 0; letter = '*';
  val1 = atoi( arg2 );
  val2 = atoi( arg3 );
  val3 = atoi( arg4 );
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Reset commands: mob obj give equip door rand trap hide.\r\n", ch );
      return NULL;
    }

  if ( !str_cmp( arg1, "hide" ) )
    {
      if ( arg2[0] != '\0' && !get_obj_index(val1) )
        {
          send_to_char( "Reset: HIDE: no such object\r\n", ch );
          return NULL;
        }
      else
        val1 = 0;
      extra = 1;
      val2 = 0;
      val3 = 0;
      letter = 'H';
    }
  else
    if ( arg2[0] == '\0' )
      {
        send_to_char( "Reset: not enough arguments.\r\n", ch );
        return NULL;
      }
    else
      if ( val1 < 1 || val1 > MAX_VNUM )
        {
          send_to_char( "Reset: value out of range.\r\n", ch );
          return NULL;
        }
      else
        if ( !str_cmp( arg1, "mob" ) )
          {
            if ( !get_mob_index(val1) )
              {
                send_to_char( "Reset: MOB: no such mobile\r\n", ch );
                return NULL;
              }
            if ( !get_room_index(val2) )
              {
                send_to_char( "Reset: MOB: no such room\r\n", ch );
                return NULL;
              }
            if ( val3 < 1 )
              val3 = 1;
            letter = 'M';
          }
        else
          if ( !str_cmp( arg1, "obj" ) )
            {
              if ( !get_obj_index(val1) )
                {
                  send_to_char( "Reset: OBJ: no such object\r\n", ch );
                  return NULL;
                }
              if ( !get_room_index(val2) )
                {
                  send_to_char( "Reset: OBJ: no such room\r\n", ch );
                  return NULL;
                }
              if ( val3 < 1 )
                val3 = 1;
              letter = 'O';
            }
          else
            if ( !str_cmp( arg1, "give" ) )
              {
                if ( !get_obj_index(val1) )
                  {
                    send_to_char( "Reset: GIVE: no such object\r\n", ch );
                    return NULL;
                  }
                if ( val2 < 1 )
                  val2 = 1;
                val3 = val2;
                val2 = 0;
                extra = 1;
                letter = 'G';
              }
            else
              if ( !str_cmp( arg1, "equip" ) )
                {
                  if ( !get_obj_index(val1) )
                    {
                      send_to_char( "Reset: EQUIP: no such object\r\n", ch );
                      return NULL;
                    }
                  if ( !is_number(arg3) )
                    val2 = get_wearloc(arg3);
                  if ( val2 < 0 || val2 >= MAX_WEAR )
                    {
                      send_to_char( "Reset: EQUIP: invalid wear location\r\n", ch );
                      return NULL;
                    }
                  if ( val3 < 1 )
                    val3 = 1;
                  extra  = 1;
                  letter = 'E';
                }
              else
                if ( !str_cmp( arg1, "put" ) )
                  {
                    if ( !get_obj_index(val1) )
                      {
                        send_to_char( "Reset: PUT: no such object\r\n", ch );
                        return NULL;
                      }
                    if ( val2 > 0 && !get_obj_index(val2) )
                      {
                        send_to_char( "Reset: PUT: no such container\r\n", ch );
                        return NULL;
                      }
                    extra = UMAX(val3, 0);
                    argument = one_argument(argument, arg4);
                    val3 = (is_number(argument) ? atoi(arg4) : 0);
                    if ( val3 < 0 )
                      val3 = 0;
                    letter = 'P';
                  }
                else
                  if ( !str_cmp( arg1, "door" ) )
                    {
                      if ( (room = get_room_index(val1)) == NULL )
                        {
                          send_to_char( "Reset: DOOR: no such room\r\n", ch );
                          return NULL;
                        }
                      if ( val2 < 0 || val2 > 9 )
                        {
                          send_to_char( "Reset: DOOR: invalid exit\r\n", ch );
                          return NULL;
                        }
                      if ( (pexit = get_exit(room, val2)) == NULL
                           ||   !IS_SET( pexit->exit_info, EX_ISDOOR ) )
                        {
                          send_to_char( "Reset: DOOR: no such door\r\n", ch );
                          return NULL;
                        }
                      if ( val3 < 0 || val3 > 2 )
                        {
                          send_to_char( "Reset: DOOR: invalid door state (0 = open, 1 = close, 2 = lock)\r\n", ch );
                          return NULL;
                        }
                      letter = 'D';
                      value = val3;
                      val3  = val2;
                      val2  = value;
                    }
                  else
                    if ( !str_cmp( arg1, "rand" ) )
                      {
                        if ( !get_room_index(val1) )
                          {
                            send_to_char( "Reset: RAND: no such room\r\n", ch );
                            return NULL;
                          }
                        if ( val2 < 0 || val2 > 9 )
                          {
                            send_to_char( "Reset: RAND: invalid max exit\r\n", ch );
                            return NULL;
                          }
                        val3 = val2;
                        val2 = 0;
                        letter = 'R';
                      }
                    else
                      if ( !str_cmp( arg1, "trap" ) )
                        {
                          if ( val2 < 1 || val2 > MAX_TRAPTYPE )
                            {
                              send_to_char( "Reset: TRAP: invalid trap type\r\n", ch );
                              return NULL;
                            }
                          if ( val3 < 0 || val3 > 10000 )
                            {
                              send_to_char( "Reset: TRAP: invalid trap charges\r\n", ch );
                              return NULL;
                            }
                          while ( argument[0] != '\0' )
                            {
                              argument = one_argument( argument, arg4 );
                              value = get_trapflag( arg4 );
                              if ( value >= 0 || value < 32 )
                                SET_BIT( extra, 1 << value );
                              else
                                {
                                  send_to_char( "Reset: TRAP: bad flag\r\n", ch );
                                  return NULL;
                                }
                            }
                          if ( IS_SET(extra, TRAP_ROOM) && IS_SET(extra, TRAP_OBJ) )
                            {
                              send_to_char( "Reset: TRAP: Must specify room OR object, not both!\r\n", ch );
                              return NULL;
                            }
                          if ( IS_SET(extra, TRAP_ROOM) && !get_room_index(val1) )
                            {
                              send_to_char( "Reset: TRAP: no such room\r\n", ch );
                              return NULL;
                            }
                          if ( IS_SET(extra, TRAP_OBJ)  && val1>0 && !get_obj_index(val1) )
                            {
                              send_to_char( "Reset: TRAP: no such object\r\n", ch );
                              return NULL;
                            }
                          if (!IS_SET(extra, TRAP_ROOM) && !IS_SET(extra, TRAP_OBJ) )
                            {
                              send_to_char( "Reset: TRAP: Must specify ROOM or OBJECT\r\n", ch );
                              return NULL;
                            }
                          /* fix order */
                          value = val1;
                          val1  = val2;
                          val2  = value;
                          letter = 'T';
                        }
  if ( letter == '*' )
    return NULL;
  else
    return make_reset( letter, extra, val1, val3, val2 );
}

void mpedit( CHAR_DATA *ch, MPROG_DATA *mprg, int mptype, char *argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;
      if ( mprg->arglist )
        STRFREE( mprg->arglist );
      mprg->arglist = STRALLOC( argument );
    }
  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;
  if ( !mprg->comlist )
    mprg->comlist = STRALLOC( "" );
  start_editing( ch, mprg->comlist );
}

/*
 * RoomProg Support
 */
void rpedit( CHAR_DATA *ch, MPROG_DATA *mprg, int mptype, char *argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;
      if ( mprg->arglist )
        STRFREE( mprg->arglist );
      mprg->arglist = STRALLOC( argument );
    }
  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;
  if(!mprg->comlist)
    mprg->comlist = STRALLOC("");
  start_editing( ch, mprg->comlist );
}
