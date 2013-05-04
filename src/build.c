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
 *                     Online Building and Editing Module                  *
 ****************************************************************************/

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "mud.h"


extern int top_affect;
extern int top_reset;
extern int top_ed;
extern int top_area;
extern bool fBootDb;

bool can_rmodify( const CHAR_DATA *ch, const ROOM_INDEX_DATA *room )
{
  short vnum = room->vnum;
  AREA_DATA *pArea;

  if ( IS_NPC( ch ) )
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

  if ( IS_NPC( ch ) )
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

  if ( IS_NPC( ch ) )
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

  if ( !IS_NPC( mob ) )
    {
      if ( get_trust( ch ) >= sysdata.level_modify_proto && get_trust(ch) >
           get_trust( mob ) )
        return TRUE;
      else
        send_to_char( "You can't do that.\r\n", ch );
      return FALSE;
    }

  vnum = mob->pIndexData->vnum;

  if ( IS_NPC( ch ) )
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

  if ( IS_NPC( ch ) )
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

  if ( IS_NPC( ch ) )
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
              if ( IS_NPC(victim) )
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

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->author and area->name are cleaned up... it will be easier
 */
void do_installarea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char  arg[MAX_INPUT_LENGTH];
  char  buf[MAX_STRING_LENGTH];
  int           num;
  DESCRIPTOR_DATA *d;

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: installarea <filename> [Area title]\r\n", ch );
      return;
    }

  for ( tarea = first_build; tarea; tarea = tarea->next )
    {
      if ( !str_cmp( tarea->filename, arg ) )
        {
          if ( argument && argument[0] != '\0' )
            {
              DISPOSE( tarea->name );
              tarea->name = str_dup( argument );
            }

          /* Fold area with install flag -- auto-removes prototype flags */
          send_to_char( "Saving and installing file...\r\n", ch );
          fold_area( tarea, tarea->filename, TRUE );

          /* Remove from prototype area list */
          UNLINK( tarea, first_build, last_build, next, prev );

          /* Add to real area list */
          LINK( tarea, first_area, last_area, next, prev );

          /* Fix up author if online */
          for ( d = first_descriptor; d; d = d->next )
            if ( d->character
                 &&   d->character->pcdata
                 &&   d->character->pcdata->area == tarea )
              {
                /* remove area from author */
                d->character->pcdata->area = NULL;
                /* clear out author vnums  */
                d->character->pcdata->r_range_lo = 0;
                d->character->pcdata->r_range_hi = 0;
                d->character->pcdata->o_range_lo = 0;
                d->character->pcdata->o_range_hi = 0;
                d->character->pcdata->m_range_lo = 0;
                d->character->pcdata->m_range_hi = 0;
              }

          top_area++;
          send_to_char( "Writing area.lst...\r\n", ch );
          write_area_list( );
          send_to_char( "Resetting new area.\r\n", ch );
          num = tarea->nplayer;
          tarea->nplayer = 0;
          reset_area( tarea );
          tarea->nplayer = num;
          send_to_char( "Renaming author's building file.\r\n", ch );
          sprintf( buf, "%s%s.installed", BUILD_DIR, tarea->filename );
          sprintf( arg, "%s%s", BUILD_DIR, tarea->filename );
          rename( arg, buf );
          send_to_char( "Done.\r\n", ch );
          return;
        }
    }
  send_to_char( "No such area exists.\r\n", ch );
  return;
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

void do_astat( CHAR_DATA *ch, char *argument )
{
  AREA_DATA *tarea;
  bool proto, found;


  found = FALSE; proto = FALSE;
  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !str_cmp( tarea->filename, argument ) )
      {
        found = TRUE;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !str_cmp( tarea->filename, argument ) )
        {
          found = TRUE;
          proto = TRUE;
          break;
        }

  if ( !found )
    {
      if ( argument && argument[0] != '\0' )
        {
          send_to_char( "Area not found.  Check 'zones'.\r\n", ch );
          return;
        }
      else
        {
          tarea = ch->in_room->area;
        }
    }

  ch_printf( ch, "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
             tarea->name,
             tarea->filename,
             proto ? "yes" : "no" );
  if ( !proto )
    {
      ch_printf( ch, "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                 tarea->max_players,
                 tarea->illegal_pk,
                 tarea->gold_looted );
      if ( tarea->high_economy )
        ch_printf( ch, "Area economy: %d billion and %d credits.\r\n",
                   tarea->high_economy,
                   tarea->low_economy );
      else
        ch_printf( ch, "Area economy: %d credits.\r\n",
                   tarea->low_economy );
      if ( tarea->planet )
        ch_printf( ch, "Planet: %s.\r\n",
                   tarea->planet->name );
      ch_printf( ch, "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                 tarea->mdeaths,
                 tarea->mkills,
                 tarea->pdeaths,
                 tarea->pkills );
    }
  ch_printf( ch, "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->author,
             tarea->age,
             tarea->nplayer );
  ch_printf( ch, "Area flags: %s\r\n", flag_string(tarea->flags, area_flags) );
  ch_printf( ch, "low_room: %5d  hi_room: %d\r\n",
             tarea->low_r_vnum,
             tarea->hi_r_vnum );
  ch_printf( ch, "low_obj : %5d  hi_obj : %d\r\n",
             tarea->low_o_vnum,
             tarea->hi_o_vnum );
  ch_printf( ch, "low_mob : %5d  hi_mob : %d\r\n",
             tarea->low_m_vnum,
             tarea->hi_m_vnum );
  ch_printf( ch, "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->low_soft_range,
             tarea->hi_soft_range,
             tarea->low_hard_range,
             tarea->hi_hard_range );
  ch_printf( ch, "Resetmsg: %s\r\n", tarea->resetmsg ? tarea->resetmsg
             : "(default)" ); /* Rennard */
  ch_printf( ch, "Reset frequency: %d minutes.\r\n",
             tarea->reset_frequency ? tarea->reset_frequency : 15 );
}


void do_aset( CHAR_DATA *ch, char *argument )
{
  AREA_DATA *tarea;
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
      write_area_list( );
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
  return;
}


void do_rlist( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA       *room;
  int                    vnum;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  AREA_DATA             *tarea;
  int lrange;
  int trange;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       || ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }

  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_r_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_r_vnum;
      else
        trange = atoi(arg2);

      if ( ( lrange < tarea->low_r_vnum || trange > tarea->hi_r_vnum )
           && get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 1 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (room = get_room_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "&w%5d) %s\r\n", vnum, room->name );
    }
  return;
}

void do_olist( CHAR_DATA *ch, char *argument )
{
  OBJ_INDEX_DATA        *obj;
  int                    vnum;
  AREA_DATA             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  /*
   * Greater+ can list out of assigned range - Tri (mlist/rlist as well)
   */
  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_CREATOR || !ch->pcdata
       || ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }
  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_o_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_o_vnum;
      else
        trange = atoi(arg2);

      if ((lrange < tarea->low_o_vnum || trange > tarea->hi_o_vnum)
          &&   get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 3 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (obj = get_obj_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "%5d) %-20s (%s)\r\n", vnum,
                    obj->name,
                    obj->short_descr );
    }
  return;
}

void do_mlist( CHAR_DATA *ch, char *argument )
{
  MOB_INDEX_DATA        *mob;
  int                    vnum;
  AREA_DATA             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_CREATOR || !ch->pcdata
       ||  ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }

  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_m_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_m_vnum;
      else
        trange = atoi( arg2 );

      if ( ( lrange < tarea->low_m_vnum || trange > tarea->hi_m_vnum )
           && get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 1 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (mob = get_mob_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "%5d) %-20s '%s'\r\n", vnum,
                    mob->player_name,
                    mob->short_descr );
    }
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
  return;
}

/*
 * Mobprogram editing - cumbersome                              -Thoric
 */
void do_mpedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  CHAR_DATA  *victim;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't mpedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_mpedit: sub_mprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }

      mprog = (MPROG_DATA*)ch->dest_buf;

      if ( mprog->comlist )
        STRFREE( mprog->comlist );

      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  value = atoi( arg3 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: mpedit <victim> <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand fight hitprcnt greet allgreet\r\n", ch );
      send_to_char( "  entry give bribe death time hour script\r\n",    ch );
      return;
    }

  if ( get_trust( ch ) < LEVEL_GOD )
    {
      if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
        {
          send_to_char( "No one like that in all the realms.\r\n", ch );
          return;
        }
    }

  if ( get_trust( ch ) < get_trust( victim ) || !IS_NPC(victim) )
    {
      send_to_char( "You can't do that!\r\n", ch );
      return;
    }

  if ( !can_mmodify( ch, victim ) )
    return;

  if ( !IS_SET( victim->act, ACT_PROTOTYPE ) )
    {
      send_to_char( "A mobile must have a prototype flag to be mpset.\r\n", ch );
      return;
    }

  mprog = victim->pIndexData->mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( arg4[0] != '\0' )
        {
          mptype = get_mpflag( arg4 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              victim->pIndexData->progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                victim->pIndexData->progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = victim->pIndexData->mudprogs;
          victim->pIndexData->mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
              }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( victim->pIndexData->progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      mptype = get_mpflag( arg4 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          victim->pIndexData->progtypes |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          victim->pIndexData->mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              victim->pIndexData->progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "add" ) )
    {
      mptype = get_mpflag( arg3 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next                     = mprg;
      else
        victim->pIndexData->mudprogs    = mprg;
      victim->pIndexData->progtypes     |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_mpedit( ch, "" );
}

void do_opedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  OBJ_DATA   *obj;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't opedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }

      mprog = (MPROG_DATA*)ch->dest_buf;

      if ( mprog->comlist )
        STRFREE( mprog->comlist );

      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  value = atoi( arg3 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: opedit <object> <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand wear remove sac zap get\r\n",  ch );
      send_to_char( "  drop damage repair greet exa use\r\n",ch );
      send_to_char( "  pull push (for levers,pullchains,buttons)\r\n",ch );
      send_to_char( "\r\n", ch);
      send_to_char( "Object should be in your inventory to edit.\r\n",ch);
      return;
    }

  if ( get_trust( ch ) < LEVEL_GOD )
    {
      if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You aren't carrying that.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj = get_obj_world( ch, arg1 ) ) == NULL )
        {
          send_to_char( "Nothing like that in all the realms.\r\n", ch );
          return;
        }
    }

  if ( !can_omodify( ch, obj ) )
    return;

  if ( !IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      send_to_char( "An object must have a prototype flag to be opset.\r\n", ch );
      return;
    }

  mprog = obj->pIndexData->mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( arg4[0] != '\0' )
        {
          mptype = get_mpflag( arg4 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              obj->pIndexData->progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                obj->pIndexData->progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = obj->pIndexData->mudprogs;
          obj->pIndexData->mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
              }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( obj->pIndexData->progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      mptype = get_mpflag( arg4 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          obj->pIndexData->progtypes    |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          obj->pIndexData->mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              obj->pIndexData->progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "add" ) )
    {
      mptype = get_mpflag( arg3 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next                      = mprg;
      else
        obj->pIndexData->mudprogs        = mprg;
      obj->pIndexData->progtypes        |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_opedit( ch, "" );
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
  return;
}

void do_rpedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't rpedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }

      mprog = (MPROG_DATA*)ch->dest_buf;

      if ( mprog->comlist )
        STRFREE( mprog->comlist );

      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  value = atoi( arg2 );
  /* argument = one_argument( argument, arg3 ); */

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: rpedit <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand sleep rest rfight enter\r\n",  ch );
      send_to_char( "  leave death\r\n",                              ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "You should be standing in room you wish to edit.\r\n",ch);
      return;
    }

  if ( !can_rmodify( ch, ch->in_room ) )
    return;

  mprog = ch->in_room->mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg1, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "This room has no room programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg1, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "This room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      if ( arg3[0] != '\0' )
        {
          mptype = get_mpflag( arg3 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              ch->in_room->progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                ch->in_room->progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = ch->in_room->mudprogs;
          ch->in_room->mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
              }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( ch->in_room->progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      mptype = get_mpflag( arg2 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          ch->in_room->progtypes |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          ch->in_room->mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              ch->in_room->progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "add" ) )
    {
      mptype = get_mpflag( arg2 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next             = mprg;
      else
        ch->in_room->mudprogs   = mprg;
      ch->in_room->progtypes |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_rpedit( ch, "" );
}

void do_rdelete( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Delete which room?\r\n", ch );
      return;
    }

  /* Find the room. */
  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  /* Does the player have the right to delete this room? */
  if ( get_trust( ch ) < sysdata.level_modify_proto
       && ( location->vnum < ch->pcdata->r_range_lo ||
            location->vnum > ch->pcdata->r_range_hi ) )
    {
      send_to_char( "That room is not in your assigned range.\r\n", ch );
      return;
    }

  /* We could go to the trouble of clearing out the room, but why? */
  if ( location->first_person || location->first_content )
    {
      send_to_char( "The room must be empty first.\r\n", ch );
      return;
    }

  /* Ok, we've determined that the room exists, it is empty and the
     player has the authority to delete it, so let's dump the thing.
     The function to do it is in db.c so it can access the top-room
     variable. */
  delete_room( location );

  send_to_char( "Room deleted.\r\n", ch );
  return;
}

