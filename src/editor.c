/****************************************************************************
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

/*
 *  New editor code
 *  Author: Cronel (cronel_kal@hotmail.com)
 *  of FrozenMUD (empire.digiunix.net 4000)
 *
 *  Permission to use and distribute this code is granted provided
 *  this header is retained and unaltered, and the distribution
 *  package contains all the original files unmodified.
 *  If you modify this code and use/distribute modified versions
 *  you must give credit to the original author(s).
 */
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdarg.h>
#include "mud.h"
#include "editor.h"
#include "character.h"

/****************************************************************************
 * Data types and other definitions
 */

typedef struct EditorLine EditorLine;

#define CHAR_BLOCK (80)

#define BLOCK_ROUNDUP( size )           (((size)+CHAR_BLOCK-1) / CHAR_BLOCK * CHAR_BLOCK)

#define RESIZE_IF_NEEDED( buf, buf_size, buf_used, added_use )  \
  if( (buf_used) + (added_use) >= (buf_size) )                  \
    {                                                           \
      short added_size;                                        \
      added_size = BLOCK_ROUNDUP( added_use );                  \
      if( added_size == 0 )                                     \
        added_size = CHAR_BLOCK;                                \
      ReAllocateMemory( (buf), char, buf_size + added_size );           \
      (buf_size) += added_size;                                 \
    }

struct EditorLine
{
  char        *line;           /* line text */
  short        line_size;      /* size allocated in "line" */
  short        line_used;      /* bytes used of "line" */
  EditorLine *next;
};

struct Editor
{
  EditorLine *first_line;     /* list of lines */
  short        line_count;     /* number of lines allocated */
  EditorLine *on_line;        /* pointer to the line being edited */
  int          text_size;      /* total size of text (not counting
                                  newlines). */
  int          max_size;       /* max size in chars of string being
                                   edited (counting newlines) */
  char        *desc;           /* buffer description */
};

/* "max_size" is the maximum size of the final text converted to string */
/* "text_size" is equal to the strlen of all lines added up; the actual
 * total length when converted to string is equal to this number plus
 * line_count * 2, because of the trailing "\r\n" that has to be added
 * to each line (of course, plus 1 because of the final \0).
 * Thus, if(total_size + line_count * 2 +1) > max_size, the buffer cant
 * hold more data.
 */
/* Hence, this define: */
#define TOTAL_BUFFER_SIZE( edd )        (edd->text_size + edd->line_count * 2 +1 )



/****************************************************************************
 * Function declarations
 */

/* funcs to manipulate editor datas */
static EditorLine *make_new_line( char *str );
static void discard_editdata( Editor *edd );
static Editor *clone_editdata( Editor *edd );
static Editor *str_to_editdata( char *str, short max_size );
static char *editdata_to_str( Editor *edd );

static void StartEditing_nolimit( Character *ch, char *old_text, short max_total );

/* misc functions */
static char *finer_OneArgument( char *argument, char *arg_first );
static char *text_replace( char *src, char *word_src, char *word_dst, short *pnew_size, short *prepl_count );

/* editor sub functions */
static void editor_print_info( Character *ch, Editor *edd, char *argument );
static void editor_help( Character *ch, Editor *edd, char *argument );
static void editor_clear_buf( Character *ch, Editor *edd, char *argument );
static void editor_search_and_replace( Character *ch, Editor *edd, char *argument );
static void editor_insert_line( Character *ch, Editor *edd, char *argument );
static void editor_delete_line( Character *ch, Editor *edd, char *argument );
static void editor_goto_line( Character *ch, Editor *edd, char *argument );
static void editor_list( Character *ch, Editor *edd, char *argument );
static void editor_abort( Character *ch, Editor *edd, char *argument );
static void editor_escaped_cmd( Character *ch, Editor *edd, char *argument );
static void editor_save( Character *ch, Editor *edd, char *argument );

/****************************************************************************
 * Edit_data manipulation functions
 */

static EditorLine *make_new_line( char *str )
{
  EditorLine *new_line = NULL;
  short size = 0;

  size = strlen( str );
  size = BLOCK_ROUNDUP( size );

  if( size == 0 )
    {
      size = CHAR_BLOCK;
    }

  AllocateMemory(new_line, EditorLine, 1);
  AllocateMemory(new_line->line, char, size);
  new_line->line_size = size;
  new_line->line_used = strlen( str );
  strcpy( new_line->line, str );

  return new_line;
}

static void discard_editdata( Editor *edd )
{
  EditorLine *eline = edd->first_line;

  while( eline )
    {
      EditorLine *elnext = eline->next;
      FreeMemory( eline->line );
      FreeMemory( eline );
      eline = elnext;
    }

  if( edd->desc )
    {
      FreeMemory( edd->desc );
    }

  FreeMemory( edd );
}

static Editor *clone_editdata( Editor *edd )
{
  Editor *new_edd = NULL;
  EditorLine *eline = NULL;
  EditorLine root_line;
  EditorLine *new_line = &root_line;

  AllocateMemory( new_edd, Editor, 1 );

  for( eline = edd->first_line ; eline ; eline = eline->next )
    {
      new_line->next = make_new_line( eline->line );

      if( edd->on_line == eline )
	{
	  new_edd->on_line = new_line->next;
	}

      new_line = new_line->next;
    }

  new_edd->max_size = edd->max_size;
  new_edd->text_size = edd->text_size;
  new_edd->line_count = edd->line_count;
  new_edd->first_line = root_line.next;
  new_edd->desc = CopyString( edd->desc );

  return new_edd;
}

static Editor *str_to_editdata( char *str, short max_size )
{
  char *p = str;
  Editor *edd = NULL;
  EditorLine *eline = make_new_line( "" );
  short i = 0;
  short tsize = 0;
  short line_count = 1;

  AllocateMemory(edd, Editor, 1);

  edd->first_line = eline;

  while( *p )
    {
      if( tsize + line_count*2 + 1 >= max_size )
	{
	  break;
	}

      if( *p == '\r' )
	{
	  ;
	}
      else if( *p == '\n' )
        {
          eline->line[i] = '\0';
          eline->next = make_new_line( "" );
          eline = eline->next;
          line_count++;
	  i = 0;
        }
      else
        {
          eline->line[i] = *p;
          eline->line_used++;
          tsize++;
          i++;
          RESIZE_IF_NEEDED( eline->line, eline->line_size,
                            eline->line_used, 1 );
        }

      p++;
    }

  if( eline->line[0] != '\0' )
    {
      eline->line[i] = '\0';
      eline->next = make_new_line( "" );
      line_count++;
      eline = eline->next;
    }

  edd->line_count = line_count;
  edd->on_line = eline;
  edd->max_size = max_size;
  edd->text_size = tsize;

  return edd;
}

static char *editdata_to_str( Editor *edd )
{
  EditorLine *eline = edd->first_line;
  char *buf = NULL;
  char *tmp = NULL;
  short size = MAX_STRING_LENGTH;
  short used = 0;
  short i = 0;

  AllocateMemory(buf, char, MAX_STRING_LENGTH );

  buf[0] = '\0';

  while( eline )
    {
      char *src = NULL;

      /* ignore the last empty line */
      if( eline->next == NULL && eline->line[0] == '\0' )
	{
	  break;
	}

      src = eline->line;

      while( *src )
        {
          buf[i++] = *src++;
          used++;

          if( used >= size-3 )
            {
              ReAllocateMemory(buf, char, size + MAX_STRING_LENGTH );
              size += MAX_STRING_LENGTH;
            }
        }

      buf[i++] = '\n';
      buf[i++] = '\r';
      used += 2;
      eline = eline->next;
    }

  buf[i++] = '\0';
  used++;

  tmp = CopyString( buf );
  FreeMemory(buf);
  SmushTilde(tmp);
  return tmp;
}

/****************************************************************************
 * Main editor functions
 */

void StartEditing( Character *ch, char *data )
{
  StartEditing_nolimit( ch, data, MAX_STRING_LENGTH );
}

void SetEditorDescription( Character *ch, const char *desc_fmt, ... )
{
  char buf[ MAX_STRING_LENGTH * 2 ]; /* umpf.. */
  va_list args;

  if( !ch || !ch->editor )
    {
      return;
    }

  va_start(args, desc_fmt);
  vsprintf(buf, desc_fmt, args);
  va_end(args);

  if( ch->editor->desc )
    {
      FreeMemory( ch->editor->desc );
    }

  ch->editor->desc = CopyString( buf );
}

static void StartEditing_nolimit( Character *ch, char *old_text, short max_total )
{
  if ( !ch->desc )
    {
      Bug( "Fatal: StartEditing: no desc", 0 );
      return;
    }

  if ( ch->substate == SUB_RESTRICTED )
    {
      Bug( "NOT GOOD: StartEditing: ch->substate == SUB_RESTRICTED", 0 );
    }

  SetCharacterColor( AT_GREEN, ch );
  ChPrintf( ch, "Begin entering your text now (/? = help /s = save /c = clear /l = list)\r\n" );
  ChPrintf( ch, "-----------------------------------------------------------------------\r\n" );

  if ( ch->editor )
    {
      StopEditing( ch );
    }

  ch->editor = str_to_editdata( old_text, max_total );
  ch->editor->desc = CopyString( "Unknown buffer" );
  ch->desc->connection_state = CON_EDITING;

  SendToCharacter( "> ", ch );
}

char *CopyBuffer( Character *ch )
{
  char *buf = NULL;

  if ( !ch )
    {
      Bug( "CopyBuffer: null ch", 0 );
      return CopyString( "" );
    }

  if ( !ch->editor )
    {
      Bug( "CopyBuffer: null editor", 0 );
      return CopyString( "" );
    }

  buf = editdata_to_str( ch->editor );
  return buf;
}

void StopEditing( Character *ch )
{
  SetCharacterColor( AT_PLAIN, ch );
  discard_editdata( ch->editor );
  ch->editor = NULL;
  SendToCharacter( "Done.\r\n", ch );
  ch->dest_buf  = NULL;
  ch->spare_ptr = NULL;
  ch->substate  = SUB_NONE;

  if ( !ch->desc )
    {
      Bug( "Fatal: StopEditing: no desc" );
      return;
    }

  ch->desc->connection_state = CON_PLAYING;
}

void EditBuffer( Character *ch, char *argument )
{
  Descriptor *d;
  Editor *edd;
  EditorLine *newline;
  char cmd[MAX_INPUT_LENGTH];
  short linelen;
  bool cont_line;
  char *p;

  d = ch->desc;

  if ( d == NULL )
    {
      SendToCharacter( "You have no descriptor.\r\n", ch );
      return;
    }

  if ( d->connection_state != CON_EDITING )
    {
      SendToCharacter( "You can't do that!\r\n", ch );
      Bug( "Edit_buffer: d->connection_state != CON_EDITING" );
      return;
    }

  if ( ch->substate <= SUB_PAUSE )
    {
      SendToCharacter( "You can't do that!\r\n", ch );
      Bug( "Edit_buffer: illegal ch->substate (%d)", ch->substate );
      d->connection_state = CON_PLAYING;
      return;
    }

  if ( !ch->editor )
    {
      SendToCharacter( "You can't do that!\r\n", ch );
      Bug( "Edit_buffer: null editor" );
      d->connection_state = CON_PLAYING;
      return;
    }

  edd = ch->editor;

  if ( argument[0] == '/' || argument[0] == '\\' )
    {
      char editor_command = 0;

      argument = OneArgument( argument, cmd );
      editor_command = tolower(cmd[1]);

      switch( editor_command )
	{
	case '?':
	  editor_help( ch, edd, argument );
	  break;

	case 'c':
	  editor_clear_buf( ch, edd, argument );
	  break;

	case 'r':
	  editor_search_and_replace( ch, edd, argument );
	  break;

	case 'i':
	  editor_insert_line( ch, edd, argument );
	  break;

	case 'd':
	  editor_delete_line( ch, edd, argument );
	  break;

	case 'g':
	  editor_goto_line( ch, edd, argument );
	  break;

	case 'l':
	  editor_list( ch, edd, argument );
	  break;

	case 'a':
	  editor_abort( ch, edd, argument );
	  break;

	case 's':
	  editor_save( ch, edd, argument );
	  break;

	case '!':
	  editor_escaped_cmd( ch, edd, argument );
	  break;

	case 'p':
	  editor_print_info( ch, edd, argument );
	  break;

	default:
	  SendToCharacter( "Uh? Type '/?' to see the list of valid editor commands.\r\n", ch );
	  break;
	}

      if( editor_command != 'a' && editor_command != 's' )
	{
	  SendToCharacter( "> ", ch );
	}

      return;
    }

  /* Kludgy fix. Read_from_buffer in comm.c adds a space on
   * empty lines. Don't let this fill up usable buffer space.. */
  if( !StrCmp( argument, " " ) )
    {
      strcpy( argument, "" );
    }

  linelen = strlen(argument);

  p = argument + linelen - 1;

  while( p > argument && isspace(*p) )
    {
      p--;
    }

  if( p > argument && *p == '\\' )
    {
      cont_line = true;
      *p = '\0';
    }
  else
    {
      cont_line = false;
    }

  if( TOTAL_BUFFER_SIZE(edd) + linelen+2 >= edd->max_size )
    {
      SendToCharacter( "Buffer full.\r\n", ch );
      editor_save( ch, edd, "");
    }
  else
    {
      /* add it to the current line */
      RESIZE_IF_NEEDED( edd->on_line->line, edd->on_line->line_size,
                        edd->on_line->line_used, linelen+1 );
      strcat( edd->on_line->line, argument );
      edd->on_line->line_used += linelen;
      edd->text_size += linelen;

      /* create a line and advance to it */
      if( !cont_line )
        {
          newline = make_new_line( "" );
          newline->next = edd->on_line->next;
          edd->on_line->next = newline;
          edd->on_line = newline;
          edd->line_count++;
        }
      else
	{
	  SendToCharacter( "(Continued)\r\n", ch );
	}

      SendToCharacter( "> ", ch );
    }
}

static void editor_print_info( Character *ch, Editor *edd, char *argument )
{
  short i = 0;
  EditorLine *eline = edd->first_line;

  while( eline )
    {
      i++;

      if( eline == edd->on_line )
	{
	  break;
	}

      eline = eline->next;
    }

  ChPrintf( ch,
             "Currently editing: %s\r\n"
             "Total lines: %4d   On line:  %4d\r\n"
             "Buffer size: %4d   Max size: %4d\r\n",
             edd->desc ? edd->desc : "(Null description)",
             edd->line_count, i,
             TOTAL_BUFFER_SIZE(edd), edd->max_size );
}

static void editor_help( Character *ch, Editor *edd, char *argument )
{
  size_t i = 0;
  static const char *arg[] = {"", "l", "c", "d", "g", "i", "r", "a", "p", "!", "s", NULL};
  static const char *editor_help_text[] = {
    /* general help */
    "Editing commands\r\n"
    "---------------------------------\r\n"
    "/l [range]      list buffer\r\n"
    "/c              clear buffer\r\n"
    "/d <line>       delete line\r\n"
    "/g <line>       goto line\r\n"
    "/i <line>       insert line\r\n"
    "/r <old> <new>  global replace\r\n"
    "/a              abort editing\r\n"
    "/p              print information\r\n"
    "/! <command>    execute command (do not use another editing command)\r\n"
    "/s              save buffer\r\n"
    "Type /? <command>  to get more information on each command.\r\n\r\n",

    "/l [range]: Lists the buffer. Shows what you've written. Optionaly\r\n"
    "   takes a range of lines as argument.\r\n",

    "/c: Clears the buffer, leaving only one empty line.\r\n",

    "/d <line>: Deletes a line. If you delete the line currently being\r\n"
    "   edited, the insertion point is moved down if possible, if not, up.\r\n",

    "/g <line>: Moves the insertion point to a given line.\r\n",

    "/i <line>: Inserts an empty line before the given line.\r\n",

    "/r <old text> <new text>: Global search and replace text. The arguments\r\n"
    "  are case-sensitive. To replace a multi-word text, surround it with\r\n"
    "  single quotes. When inside quotes, you must escape the single quote\r\n"
    "  character, double quote character, and the bar: (') becomes (\\'),\r\n"
    "  (\") becomes (\\\") and (\\) becomes (\\\\)\r\n",

    "/a: Aborts edition, terminating the edition session and throwing\r\n"
    "   away what you've edited.\r\n",

    "/p: Prints information about the current editing session.\r\n",

    "/!: Escaped command. Executes the given command as if you were\r\n"
    "   outside the editor. This is only allowed to imms, since it can\r\n"
    "   potentialy crash the mud.\r\n",

    "/s: Saves the current buffer, terminating the edition session.\r\n",
  };

  for( i = 0; arg[i] != NULL ; i++ )
    {
      if( !StrCmp( argument, arg[i] ) )
	{
	  break;
	}
    }

  if( arg[i] == NULL )
    {
      SendToCharacter( "No editor help about that.\r\n", ch );
    }
  else
    {
      SendToCharacter( editor_help_text[i], ch );
    }
}

static void editor_clear_buf( Character *ch, Editor *edd, char *argument )
{
  char *desc = CopyString( edd->desc );
  short max_size = edd->max_size;

  discard_editdata( edd );
  ch->editor = str_to_editdata( "", max_size );
  ch->editor->desc = desc;
  SendToCharacter( "Buffer cleared.\r\n", ch );
}

static void editor_search_and_replace( Character *ch, Editor *edd, char *argument )
{
  char word_src[ MAX_INPUT_LENGTH];
  char word_dst[ MAX_INPUT_LENGTH];
  Editor *cloned_edd = NULL;
  EditorLine *eline = NULL;
  short repl_count = 0;

  argument = finer_OneArgument( argument, word_src );
  argument = finer_OneArgument( argument, word_dst );

  if ( word_src[0] == '\0' || word_dst[0] == '\0' )
    {
      SendToCharacter( "Need word to replace, and replacement.\r\n", ch );
      return;
    }

  if ( strcmp( word_src, word_dst ) == 0 )
    {
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /* Warning: the replacement of the word can result in the buffer growing
   * larger than its maximum allowed size. To control this, the buffer is
   * cloned, the replacement is applied to the clone, and if the size results
   * legal after the operation, the original buffer is discarded and the
   * clone is assigned as the current editing buffer. If the clone's size
   * results too large after the replacement, the clone is simply discarded
   * and a warning is given to the user */

  cloned_edd = clone_editdata( edd );

  eline = cloned_edd->first_line;

  while( eline )
    {
      short new_size = 0;
      short line_repl = 0;
      char *new_text = text_replace( eline->line, word_src, word_dst, &new_size, &line_repl );

      FreeMemory( eline->line );
      eline->line = new_text;
      cloned_edd->text_size -= eline->line_used;
      eline->line_used = strlen( eline->line );
      cloned_edd->text_size += eline->line_used;
      eline->line_size = new_size;
      repl_count += line_repl;
      eline = eline->next;
    }

  if( TOTAL_BUFFER_SIZE( cloned_edd ) >= cloned_edd->max_size )
    {
      SendToCharacter( "As a result of this operation, the buffer would grow\r\n"
                    "larger than its maximum allowed size. Operation has been\r\n"
                    "cancelled.\r\n", ch );
      discard_editdata( cloned_edd );
    }
  else
    {
      ChPrintf( ch, "Replacing all occurrences of '%s' with '%s'...\r\n", word_src, word_dst );
      discard_editdata( edd );
      ch->editor = cloned_edd;
      ChPrintf( ch, "Found and replaced %d occurrence(s).\r\n", repl_count );
    }
}

static void editor_insert_line( Character *ch, Editor *edd, char *argument )
{
  short lineindex = 0;
  EditorLine *newline = NULL;

  if( argument[0] == '\0' || !IsNumber(argument) )
    {
      SendToCharacter( "Must supply the line number.\r\n", ch );
      return;
    }

  lineindex = atoi(argument);

  if( lineindex < 1 || lineindex > edd->line_count )
    {
      ChPrintf( ch, "Line number is out of range (1-%d).\r\n", edd->line_count );
      return;
    }

  newline = make_new_line( "" );

  if( lineindex == 1 )
    {
      newline->next = edd->first_line;
      edd->first_line = newline;
    }
  else
    {
      short num = 1;
      EditorLine *eline = edd->first_line;

      while( num < lineindex-1 )
        {
          eline = eline->next;
          num++;
        }

      newline->next = eline->next;
      eline->next = newline;
    }

  edd->line_count++;

  ChPrintf( ch, "Inserted line at %d.\r\n", lineindex );
}

static void editor_delete_line( Character *ch, Editor *edd, char *argument )
{
  short lineindex = 0;
  EditorLine *prev_line = NULL;
  EditorLine *del_line = NULL;

  if( argument[0] == '\0' || !IsNumber(argument) )
    {
      SendToCharacter( "Must supply the line number.\r\n", ch );
      return;
    }

  lineindex = atoi(argument);

  if( lineindex < 1 || lineindex > edd->line_count )
    {
      ChPrintf( ch, "Line number is out of range (1-%d).\r\n", edd->line_count );
      return;
    }

  if( lineindex == 1 )
    {
      if( edd->line_count == 1 )
        {
          if( edd->first_line->line[0] != '\0' )
            {
              edd->first_line->line[0] = '\0';
              edd->first_line->line_used = 0;
              edd->text_size = 0;
              SendToCharacter( "Deleted line 1.\r\n", ch );
            }
          else
	    {
	      SendToCharacter( "The buffer is empty.\r\n", ch );
	    }

          return;
        }

      del_line = edd->first_line;
      edd->first_line = del_line->next;
    }
  else
    {
      short num = 1;

      prev_line = edd->first_line;

      while( num < lineindex-1 )
        {
          prev_line = prev_line->next;
          num++;
        }

      del_line = prev_line->next;
      prev_line->next = del_line->next;
    }

  if( edd->on_line == del_line )
    {
      if( del_line->next )
	{
	  edd->on_line = del_line->next;
	}
      else if( prev_line != NULL )
	{
	  edd->on_line = prev_line;
	}
      else
	{
	  edd->on_line = edd->first_line;
	}
    }

  edd->line_count--;
  FreeMemory(del_line->line);
  FreeMemory(del_line);

  ChPrintf( ch, "Deleted line %d.\r\n", lineindex);
}

static void editor_goto_line( Character *ch, Editor *edd, char *argument )
{
  short lineindex = 0;
  short num = 0;

  if( argument[0] == '\0' || !IsNumber(argument) )
    {
      SendToCharacter( "Must supply the line number.\r\n", ch );
      return;
    }

  lineindex = atoi(argument);

  if( lineindex < 1 || lineindex > edd->line_count )
    {
      ChPrintf( ch, "Line number is out of range (1-%d).\r\n", edd->line_count );
      return;
    }

  edd->on_line = edd->first_line;
  num = 1;

  while( num < lineindex )
    {
      edd->on_line = edd->on_line->next;
      num++;
    }

  ChPrintf( ch, "On line %d.\r\n", lineindex);
}

static void editor_list( Character *ch, Editor *edd, char *argument )
{
  EditorLine *eline = NULL;
  short line_num = 1;
  short from = 0;
  short to = 0;
  char arg1[ MAX_INPUT_LENGTH ];

  argument = OneArgument( argument, arg1 );

  if( arg1[0] != '\0' && IsNumber(arg1) )
    {
      from = atoi(arg1);
    }
  else
    {
      from = 1;
    }

  argument = OneArgument( argument, arg1 );

  if( arg1[0] != '\0' && IsNumber(arg1) )
    {
      to = atoi(arg1);
    }
  else
    {
      to = edd->line_count;
    }

  SendToPager( "------------------\r\n", ch );
  eline = edd->first_line;

  while( eline )
    {
      if( line_num >= from && line_num <= to )
	{
	  PagerPrintf( ch, "%2d>%c%s\r\n",
			line_num,
			eline == edd->on_line ? '*' : ' ',
			eline->line );
	}

      eline = eline->next;
      line_num++;
    }

  SendToPager( "------------------\r\n", ch );
}

static void editor_abort( Character *ch, Editor *edd, char *argument )
{
  SendToCharacter( "\r\nAborting... ", ch );
  StopEditing( ch );
}

static void editor_escaped_cmd( Character *ch, Editor *edd, char *argument )
{
  if ( IsGreater( ch ) )
    {
      DO_FUN *last_cmd = ch->last_cmd;
      int substate = ch->substate;

      ch->substate = SUB_RESTRICTED;
      interpret(ch, argument);

      ch->substate = substate;
      ch->last_cmd = last_cmd;

      SetCharacterColor( AT_GREEN, ch );
      SendToCharacter( "\r\n", ch );
    }
  else
    {
      SendToCharacter( "You can't use '/!'.\r\n", ch );
    }
}

static void editor_save( Character *ch, Editor *edd, char *argument )
{
  Descriptor *d = ch->desc;

  d->connection_state = CON_PLAYING;

  if ( !ch->last_cmd )
    {
      return;
    }

  ch->last_cmd( ch, "" );
}

/****************************************************************************
 * Misc functions
 */

static char *text_replace( char *src, char *word_src, char *word_dst, short *pnew_size, short *prepl_count )
/* Replaces a word word_src in src for word_dst. Returns a pointer to a newly
 * allocated buffer containing the line with the replacements. Stores in
 * pnew_size the size of the allocated buffer, wich may be different from the
 * length of the string and is a multiple of CHAR_BLOCK. Stores in prepl_count
 * the number of replacements it made */
{
  char *dst_buf = NULL;
  char *last_found = src;
  short dst_used = 0;
  short dst_size = CHAR_BLOCK;
  short repl_count = 0;

  /* prepare the destination buffer */
  AllocateMemory( dst_buf, char, CHAR_BLOCK );

  dst_buf[0] = '\0';

  for(;;)
    {
      /* look for next instance of word */
      char *next_found = strstr( last_found, word_src );
      short len = 0;

      if( next_found == NULL )
        {
          /* if theres no more instances of word,
           * copy the rest of the src */
          len = strlen( last_found );
          RESIZE_IF_NEEDED( dst_buf, dst_size, dst_used, len+1 );
          strcat( dst_buf, last_found );
          dst_used += len;
          break;
        }

      /* copy the buffer up to this instance of the word
       * and then copy the replacement word */
      len = next_found-last_found + strlen(word_dst);
      RESIZE_IF_NEEDED( dst_buf, dst_size, dst_used, len+1 );
      strncat( dst_buf, last_found, next_found-last_found );
      strcat( dst_buf, word_dst );
      dst_used += len;

      last_found = next_found + strlen(word_src);
      repl_count ++;
    }

  *pnew_size = dst_size;
  *prepl_count = repl_count;
  return dst_buf;
}

/*
 * Pick off one argument from a string and return the rest.
 * Understands quotes.
 * A pickier version than regular OneArgument, it will not
 * convert to lowercase, and it can handle the (') character
 * when it's escaped inside '.
 */
static char *finer_OneArgument( char *argument, char *arg_first )
{
  char cEnd = ' ';
  short count = 0;
  bool escaped = false;

  while ( isspace(*argument) )
    {
      argument++;
    }

  if ( *argument == '\'' || *argument == '"' )
    {
      cEnd = *argument++;
    }

  while ( *argument != '\0' || ++count >= MAX_INPUT_LENGTH )
    {
      if( cEnd != ' ' && escaped )
        {
          if( *argument == '\\' )
	    {
	      *arg_first = '\\';
	    }
          else if( *argument == '\'' )
	    {
	      *arg_first = '\'';
	    }
          else if( *argument == '"' )
	    {
	      *arg_first = '"';
	    }
          else
	    {
	      *arg_first = *argument;
	    }

          arg_first++;
          argument++;
          escaped = false;
          continue;
        }

      if( cEnd != ' ' && *argument == '\\' && !escaped )
        {
          escaped = true;
          argument++;
          continue;
        }

      if ( *argument == cEnd )
        {
          argument++;
          break;
        }

      *arg_first = *argument;
      arg_first++;
      argument++;
    }

  *arg_first = '\0';

  while ( isspace(*argument) )
    {
      argument++;
    }

  return argument;
}

