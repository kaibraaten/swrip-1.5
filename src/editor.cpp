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

#include <vector>
#include <cstdio>
#include <cstring>
#include <cctype>
#include <cstdarg>
#include "mud.hpp"
#include "editor.hpp"
#include "character.hpp"
#include "log.hpp"
#include "descriptor.hpp"

/****************************************************************************
 * Data types and other definitions
 */

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
  char        *Line = nullptr;           /* line text */
  short        LineSize = 0;      /* size allocated in "line" */
  short        LineUsed = 0;      /* bytes used of "line" */
  EditorLine *next = nullptr;
};

struct Editor
{
  EditorLine *first_line = nullptr;     /* list of lines */
  short        LineCount = 0;     /* number of lines allocated */
  EditorLine *OnLine = nullptr;        /* pointer to the line being edited */
  int          TextSize = 0;      /* total size of text (not counting
                                     newlines). */
  int          MaxSize = 0;       /* max size in chars of string being
                                     edited (counting newlines) */
  char        *Description = 0;           /* buffer description */
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
#define TOTAL_BUFFER_SIZE( edd )        (edd->TextSize + edd->LineCount * 2 +1 )



/****************************************************************************
 * Function declarations
 */

/* funcs to manipulate editor datas */
static EditorLine *MakeNewLine( const char *str );
static void DiscardEditData( Editor *edd );
static Editor *CloneEditData( Editor *edd );
static Editor *StringToEditData( const std::string &str, short max_size );
static char *EditDataToString( Editor *edd );

static void StartEditingNoLimit( Character *ch, const std::string &old_text, short max_total );

/* misc functions */
static char *FinerOneArgument( char *argument, char *arg_first );
static char *TextReplace( char *src, char *word_src, char *word_dst, short *pnew_size, short *prepl_count );

/* editor sub functions */
static void EditorPrintInfo( Character *ch, Editor *edd, char *argument );
static void EditorHelp( Character *ch, Editor *edd, char *argument );
static void EditorClearBuffer( Character *ch, Editor *edd, char *argument );
static void EditorSearchAndReplace( Character *ch, Editor *edd, char *argument );
static void EditorInsertLine( Character *ch, Editor *edd, char *argument );
static void EditorDeleteLine( Character *ch, Editor *edd, char *argument );
static void EditorGotoLine( Character *ch, Editor *edd, char *argument );
static void EditorList( Character *ch, Editor *edd, char *argument );
static void EditorAbort( Character *ch, Editor *edd, char *argument );
static void EditorEscapedCommand( Character *ch, Editor *edd, char *argument );
static void EditorSave( Character *ch, Editor *edd, const char *argument );

/****************************************************************************
 * Edit_data manipulation functions
 */

static EditorLine *MakeNewLine( const char *str )
{
  short size = 0;

  size = strlen( str );
  size = BLOCK_ROUNDUP( size );

  if( size == 0 )
    {
      size = CHAR_BLOCK;
    }

  EditorLine *new_line = new EditorLine();
  AllocateMemory(new_line->Line, char, size);
  new_line->LineSize = size;
  new_line->LineUsed = strlen( str );
  strcpy( new_line->Line, str );

  return new_line;
}

static void DiscardEditData( Editor *edd )
{
  EditorLine *eline = edd->first_line;

  while( eline )
    {
      EditorLine *elnext = eline->next;
      FreeMemory( eline->Line );
      delete eline;
      eline = elnext;
    }

  if( edd->Description )
    {
      FreeMemory( edd->Description );
    }

  delete edd;
}

static Editor *CloneEditData( Editor *edd )
{
  EditorLine *eline = NULL;
  EditorLine root_line;
  EditorLine *new_line = &root_line;
  Editor *new_edd = new Editor();

  for( eline = edd->first_line ; eline ; eline = eline->next )
    {
      new_line->next = MakeNewLine( eline->Line );

      if( edd->OnLine == eline )
	{
	  new_edd->OnLine = new_line->next;
	}

      new_line = new_line->next;
    }

  new_edd->MaxSize = edd->MaxSize;
  new_edd->TextSize = edd->TextSize;
  new_edd->LineCount = edd->LineCount;
  new_edd->first_line = root_line.next;
  new_edd->Description = CopyString( edd->Description );

  return new_edd;
}

static Editor *StringToEditData( const std::string &str, short max_size )
{
  const char *p = str.c_str();
  EditorLine *eline = MakeNewLine( "" );
  short i = 0;
  short tsize = 0;
  short line_count = 1;

  Editor *edd = new Editor();

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
          eline->Line[i] = '\0';
          eline->next = MakeNewLine( "" );
          eline = eline->next;
          line_count++;
	  i = 0;
        }
      else
        {
          eline->Line[i] = *p;
          eline->LineUsed++;
          tsize++;
          i++;
          RESIZE_IF_NEEDED( eline->Line, eline->LineSize,
                            eline->LineUsed, 1 );
        }

      p++;
    }

  if( !IsNullOrEmpty( eline->Line ) )
    {
      eline->Line[i] = '\0';
      eline->next = MakeNewLine( "" );
      line_count++;
      eline = eline->next;
    }

  edd->LineCount = line_count;
  edd->OnLine = eline;
  edd->MaxSize = max_size;
  edd->TextSize = tsize;

  return edd;
}

static char *EditDataToString( Editor *edd )
{
  EditorLine *eline = edd->first_line;
  char *buf = NULL;
  short size = MAX_STRING_LENGTH;
  short used = 0;
  short i = 0;

  AllocateMemory(buf, char, MAX_STRING_LENGTH );

  while( eline )
    {
      char *src = NULL;

      /* ignore the last empty line */
      if( eline->next == NULL && IsNullOrEmpty( eline->Line) )
	{
	  break;
	}

      src = eline->Line;

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

  std::string withoutTilde = buf;
  SmushTilde(withoutTilde);
  char *tmp = CopyString( withoutTilde );
  FreeMemory(buf);
  return tmp;
}

/****************************************************************************
 * Main editor functions
 */

void StartEditing( Character *ch, const std::string &data )
{
  StartEditingNoLimit( ch, data, MAX_STRING_LENGTH );
}

void SetEditorDescription( Character *ch, const char *fmt, ... )
{
  if( !ch || !ch->Editor )
    {
      return;
    }

  va_list va;
  va_start( va, fmt );
  std::vector<char> buf = CreateFmtBuffer( fmt, va );
  va_end( va );

  if( ch->Editor->Description )
    {
      FreeMemory( ch->Editor->Description );
    }

  ch->Editor->Description = CopyString( &buf[0] );
}

static void StartEditingNoLimit( Character *ch, const std::string &old_text, short max_total )
{
  if ( !ch->Desc )
    {
      Log->Bug( "Fatal: StartEditing: no desc" );
      return;
    }

  if ( ch->SubState == SUB_RESTRICTED )
    {
      Log->Bug( "NOT GOOD: StartEditing: ch->SubState == SUB_RESTRICTED" );
    }

  SetCharacterColor( AT_GREEN, ch );
  ch->Echo( "Begin entering your text now (/? = help /s = save /c = clear /l = list)\r\n" );
  ch->Echo( "-----------------------------------------------------------------------\r\n" );

  if ( ch->Editor )
    {
      StopEditing( ch );
    }

  ch->Editor = StringToEditData( old_text, max_total );
  ch->Editor->Description = CopyString( "Unknown buffer" );
  ch->Desc->ConnectionState = CON_EDITING;

  ch->Echo( "> " );
}

char *CopyBuffer( Character *ch )
{
  char *buf = NULL;

  if ( !ch )
    {
      Log->Bug( "CopyBuffer: null ch", 0 );
      return CopyString( "" );
    }

  if ( !ch->Editor )
    {
      Log->Bug( "CopyBuffer: null editor", 0 );
      return CopyString( "" );
    }

  buf = EditDataToString( ch->Editor );
  return buf;
}

void StopEditing( Character *ch )
{
  SetCharacterColor( AT_PLAIN, ch );
  DiscardEditData( ch->Editor );
  ch->Editor = NULL;
  ch->Echo( "Done.\r\n" );
  ch->dest_buf  = NULL;
  ch->spare_ptr = NULL;
  ch->SubState  = SUB_NONE;

  if ( !ch->Desc )
    {
      Log->Bug( "Fatal: StopEditing: no desc" );
      return;
    }

  ch->Desc->ConnectionState = CON_PLAYING;
}

void EditBuffer( Character *ch, std::string argument )
{
  Descriptor *d = nullptr;
  Editor *edd = nullptr;
  EditorLine *newline = nullptr;
  std::string cmd;
  short linelen = 0;
  bool cont_line = false;
  char *p = nullptr;
  
  d = ch->Desc;

  if ( d == NULL )
    {
      ch->Echo( "You have no descriptor.\r\n" );
      return;
    }

  if ( d->ConnectionState != CON_EDITING )
    {
      ch->Echo( "You can't do that!\r\n" );
      Log->Bug( "Edit_buffer: d->ConnectionState != CON_EDITING" );
      return;
    }

  if ( ch->SubState <= SUB_PAUSE )
    {
      ch->Echo( "You can't do that!\r\n" );
      Log->Bug( "Edit_buffer: illegal ch->SubState (%d)", ch->SubState );
      d->ConnectionState = CON_PLAYING;
      return;
    }

  if ( !ch->Editor )
    {
      ch->Echo( "You can't do that!\r\n" );
      Log->Bug( "Edit_buffer: null editor" );
      d->ConnectionState = CON_PLAYING;
      return;
    }

  edd = ch->Editor;

  if ( argument[0] == '/' || argument[0] == '\\' )
    {
      char editor_command = 0;

      argument = OneArgument( argument, cmd );
      editor_command = tolower(cmd[1]);
      std::vector<char> vargument = StringToVector(argument);
      
      switch( editor_command )
	{
	case '?':
	  EditorHelp( ch, edd, vargument.data() );
	  break;

	case 'c':
	  EditorClearBuffer( ch, edd, vargument.data() );
	  break;

	case 'r':
	  EditorSearchAndReplace( ch, edd, vargument.data() );
	  break;

	case 'i':
	  EditorInsertLine( ch, edd, vargument.data() );
	  break;

	case 'd':
	  EditorDeleteLine( ch, edd, vargument.data() );
	  break;

	case 'g':
	  EditorGotoLine( ch, edd, vargument.data() );
	  break;

	case 'l':
	  EditorList( ch, edd, vargument.data() );
	  break;

	case 'a':
	  EditorAbort( ch, edd, vargument.data() );
	  break;

	case 's':
	  EditorSave( ch, edd, vargument.data() );
	  break;

	case '!':
	  EditorEscapedCommand( ch, edd, vargument.data() );
	  break;

	case 'p':
	  EditorPrintInfo( ch, edd, vargument.data() );
	  break;

	default:
	  ch->Echo( "Uh? Type '/?' to see the list of valid editor commands.\r\n" );
	  break;
	}

      if( editor_command != 'a' && editor_command != 's' )
	{
	  ch->Echo( "> " );
	}

      return;
    }

  /* Kludgy fix. Read_from_buffer in comm.c adds a space on
   * empty lines. Don't let this fill up usable buffer space.. */
  if( !StrCmp( argument, " " ) )
    {
      argument.erase();
    }

  linelen = argument.size();
  char cargument[MAX_STRING_LENGTH];
  strcpy(cargument, argument.c_str());
  p = cargument + linelen - 1;

  while( p > argument.c_str() && isspace(*p) )
    {
      p--;
    }

  if( p > argument.c_str() && *p == '\\' )
    {
      cont_line = true;
      *p = '\0';
    }
  else
    {
      cont_line = false;
    }

  if( TOTAL_BUFFER_SIZE(edd) + linelen+2 >= edd->MaxSize )
    {
      ch->Echo( "Buffer full.\r\n" );
      EditorSave( ch, edd, "");
    }
  else
    {
      /* add it to the current line */
      RESIZE_IF_NEEDED( edd->OnLine->Line, edd->OnLine->LineSize,
                        edd->OnLine->LineUsed, linelen+1 );
      strcat( edd->OnLine->Line, argument.c_str() );
      edd->OnLine->LineUsed += linelen;
      edd->TextSize += linelen;

      /* create a line and advance to it */
      if( !cont_line )
        {
          newline = MakeNewLine( "" );
          newline->next = edd->OnLine->next;
          edd->OnLine->next = newline;
          edd->OnLine = newline;
          edd->LineCount++;
        }
      else
	{
	  ch->Echo( "(Continued)\r\n" );
	}

      ch->Echo( "> " );
    }
}

static void EditorPrintInfo( Character *ch, Editor *edd, char *argument )
{
  short i = 0;
  EditorLine *eline = edd->first_line;

  while( eline )
    {
      i++;

      if( eline == edd->OnLine )
	{
	  break;
	}

      eline = eline->next;
    }

  ch->Echo( "Currently editing: %s\r\n"
            "Total lines: %4d   On line:  %4d\r\n"
            "Buffer size: %4d   Max size: %4d\r\n",
            edd->Description ? edd->Description : "(Null description)",
            edd->LineCount, i,
            TOTAL_BUFFER_SIZE(edd), edd->MaxSize );
}

static void EditorHelp( Character *ch, Editor *edd, char *argument )
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
      ch->Echo( "No editor help about that.\r\n" );
    }
  else
    {
      ch->Echo( "%s", editor_help_text[i] );
    }
}

static void EditorClearBuffer( Character *ch, Editor *edd, char *argument )
{
  char *desc = CopyString( edd->Description );
  short max_size = edd->MaxSize;

  DiscardEditData( edd );
  ch->Editor = StringToEditData( "", max_size );
  ch->Editor->Description = desc;
  ch->Echo( "Buffer cleared.\r\n" );
}

static void EditorSearchAndReplace( Character *ch, Editor *edd, char *argument )
{
  char word_src[ MAX_INPUT_LENGTH];
  char word_dst[ MAX_INPUT_LENGTH];
  Editor *cloned_edd = NULL;
  EditorLine *eline = NULL;
  short repl_count = 0;

  argument = FinerOneArgument( argument, word_src );
  argument = FinerOneArgument( argument, word_dst );

  if ( IsNullOrEmpty( word_src ) || IsNullOrEmpty( word_dst ) )
    {
      ch->Echo( "Need word to replace, and replacement.\r\n" );
      return;
    }

  if ( strcmp( word_src, word_dst ) == 0 )
    {
      ch->Echo( "Done.\r\n" );
      return;
    }

  /* Warning: the replacement of the word can result in the buffer growing
   * larger than its maximum allowed size. To control this, the buffer is
   * cloned, the replacement is applied to the clone, and if the size results
   * legal after the operation, the original buffer is discarded and the
   * clone is assigned as the current editing buffer. If the clone's size
   * results too large after the replacement, the clone is simply discarded
   * and a warning is given to the user */

  cloned_edd = CloneEditData( edd );

  eline = cloned_edd->first_line;

  while( eline )
    {
      short new_size = 0;
      short line_repl = 0;
      char *new_text = TextReplace( eline->Line, word_src, word_dst, &new_size, &line_repl );

      FreeMemory( eline->Line );
      eline->Line = new_text;
      cloned_edd->TextSize -= eline->LineUsed;
      eline->LineUsed = strlen( eline->Line );
      cloned_edd->TextSize += eline->LineUsed;
      eline->LineSize = new_size;
      repl_count += line_repl;
      eline = eline->next;
    }

  if( TOTAL_BUFFER_SIZE( cloned_edd ) >= cloned_edd->MaxSize )
    {
      ch->Echo( "As a result of this operation, the buffer would grow\r\n"
                "larger than its maximum allowed size. Operation has been\r\n"
                "cancelled.\r\n" );
      DiscardEditData( cloned_edd );
    }
  else
    {
      ch->Echo( "Replacing all occurrences of '%s' with '%s'...\r\n", word_src, word_dst );
      DiscardEditData( edd );
      ch->Editor = cloned_edd;
      ch->Echo( "Found and replaced %d occurrence(s).\r\n", repl_count );
    }
}

static void EditorInsertLine( Character *ch, Editor *edd, char *argument )
{
  short lineindex = 0;
  EditorLine *newline = NULL;

  if( IsNullOrEmpty( argument ) || !IsNumber(argument) )
    {
      ch->Echo( "Must supply the line number.\r\n" );
      return;
    }

  lineindex = atoi(argument);

  if( lineindex < 1 || lineindex > edd->LineCount )
    {
      ch->Echo( "Line number is out of range (1-%d).\r\n", edd->LineCount );
      return;
    }

  newline = MakeNewLine( "" );

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

  edd->LineCount++;

  ch->Echo( "Inserted line at %d.\r\n", lineindex );
}

static void EditorDeleteLine( Character *ch, Editor *edd, char *argument )
{
  short lineindex = 0;
  EditorLine *prev_line = NULL;
  EditorLine *del_line = NULL;

  if( IsNullOrEmpty( argument ) || !IsNumber(argument) )
    {
      ch->Echo( "Must supply the line number.\r\n" );
      return;
    }

  lineindex = atoi(argument);

  if( lineindex < 1 || lineindex > edd->LineCount )
    {
      ch->Echo( "Line number is out of range (1-%d).\r\n", edd->LineCount );
      return;
    }

  if( lineindex == 1 )
    {
      if( edd->LineCount == 1 )
        {
          if( !IsNullOrEmpty( edd->first_line->Line ) )
            {
              edd->first_line->Line[0] = '\0';
              edd->first_line->LineUsed = 0;
              edd->TextSize = 0;
              ch->Echo( "Deleted line 1.\r\n" );
            }
          else
	    {
	      ch->Echo( "The buffer is empty.\r\n" );
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

  if( edd->OnLine == del_line )
    {
      if( del_line->next )
	{
	  edd->OnLine = del_line->next;
	}
      else if( prev_line != NULL )
	{
	  edd->OnLine = prev_line;
	}
      else
	{
	  edd->OnLine = edd->first_line;
	}
    }

  edd->LineCount--;
  FreeMemory(del_line->Line);
  delete del_line;

  ch->Echo( "Deleted line %d.\r\n", lineindex);
}

static void EditorGotoLine( Character *ch, Editor *edd, char *argument )
{
  short lineindex = 0;
  short num = 0;

  if( IsNullOrEmpty( argument ) || !IsNumber(argument) )
    {
      ch->Echo( "Must supply the line number.\r\n" );
      return;
    }

  lineindex = atoi(argument);

  if( lineindex < 1 || lineindex > edd->LineCount )
    {
      ch->Echo( "Line number is out of range (1-%d).\r\n", edd->LineCount );
      return;
    }

  edd->OnLine = edd->first_line;
  num = 1;

  while( num < lineindex )
    {
      edd->OnLine = edd->OnLine->next;
      num++;
    }

  ch->Echo( "On line %d.\r\n", lineindex);
}

static void EditorList( Character *ch, Editor *edd, char *cargument )
{
  EditorLine *eline = NULL;
  short line_num = 1;
  short from = 0;
  short to = 0;
  std::string argument = cargument;
  std::string arg1;

  argument = OneArgument( argument, arg1 );

  if( !arg1.empty() && IsNumber(arg1) )
    {
      from = ToLong(arg1);
    }
  else
    {
      from = 1;
    }

  argument = OneArgument( argument, arg1 );

  if( !arg1.empty() && IsNumber(arg1) )
    {
      to = ToLong(arg1);
    }
  else
    {
      to = edd->LineCount;
    }

  ch->Echo( "------------------\r\n" );
  eline = edd->first_line;

  while( eline )
    {
      if( line_num >= from && line_num <= to )
	{
	  ch->Echo( "%2d>%c%s\r\n",
                    line_num,
                    eline == edd->OnLine ? '*' : ' ',
                    eline->Line );
	}

      eline = eline->next;
      line_num++;
    }

  ch->Echo( "------------------\r\n" );
}

static void EditorAbort( Character *ch, Editor *edd, char *argument )
{
  ch->Echo( "\r\nAborting... " );
  StopEditing( ch );
}

static void EditorEscapedCommand( Character *ch, Editor *edd, char *argument )
{
  if ( IsGreater( ch ) )
    {
      CmdFun *last_cmd = ch->LastCommand;
      CharacterSubState substate = ch->SubState;

      ch->SubState = SUB_RESTRICTED;
      Interpret(ch, argument);

      ch->SubState = substate;
      ch->LastCommand = last_cmd;

      SetCharacterColor( AT_GREEN, ch );
      ch->Echo( "\r\n" );
    }
  else
    {
      ch->Echo( "You can't use '/!'.\r\n" );
    }
}

static void EditorSave( Character *ch, Editor *edd, const char *argument )
{
  Descriptor *d = ch->Desc;

  d->ConnectionState = CON_PLAYING;

  if ( !ch->LastCommand )
    {
      return;
    }

  ch->LastCommand( ch, "" );
}

/****************************************************************************
 * Misc functions
 */

static char *TextReplace( char *src, char *word_src, char *word_dst, short *pnew_size, short *prepl_count )
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
      len = next_found - last_found + strlen(word_dst);
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
static char *FinerOneArgument( char *argument, char *arg_first )
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

  while ( !IsNullOrEmpty( argument ) || ++count >= MAX_INPUT_LENGTH )
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


