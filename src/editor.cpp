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

#include <cstdio>
#include <string>
#include <cstdarg>
#include <cstring>
#include <colorparser/colorparser.hpp>
#include "mud.hpp"
#include "editor.hpp"
#include "character.hpp"
#include "log.hpp"
#include "descriptor.hpp"
#include "pcdata.hpp"

/****************************************************************************
 * Data types and other definitions
 */

//typedef struct editor_line EDITOR_LINE;

#define CHAR_BLOCK (80)

#define BLOCK_ROUNDUP( size )           (((size)+CHAR_BLOCK-1) / CHAR_BLOCK * CHAR_BLOCK)

template< typename T >
void RECREATE( T  *&result, size_t number )
{
    if( !( result = static_cast< T * >( realloc( result, sizeof( T ) * number ) ) ) )
    {
        perror( "realloc failure" );
        fprintf( stderr, "Realloc failure @ %s:%d\n", __FILE__, __LINE__ );
        abort();
    }
}

template< typename T >
void RESIZE_IF_NEEDED( T  *&buf, size_t &buf_size,
                       size_t buf_used, size_t added_use )
{
    if( buf_used + added_use >= buf_size )
    {
        size_t added_size = BLOCK_ROUNDUP( added_use );

        if( added_size == 0 )
        {
            added_size = CHAR_BLOCK;
        }

        RECREATE( buf, buf_size + added_size );
        buf_size += added_size;
    }
}

template< typename T >
void DISPOSE( T  *&t )
{
    if( t )
    {
        free( t );
        t = 0;
    }
}

template< typename T >
void CREATE( T  *&result, size_t number )
{
    if( !( result = static_cast< T * >( calloc( number, sizeof( T ) ) ) ) )
    {
        perror( "calloc failure" );
        fprintf( stderr, "Malloc failure @ %s:%d\n", __FILE__, __LINE__ );
        abort();
    }
}

class EditorLine
{
public:
    EditorLine();
    char *line;                 /* line text */
    size_t line_size;           /* size allocated in "line" */
    size_t line_used;           /* bytes used of "line" */
    EditorLine *next;
};

class Editor
{
public:
    Editor();
    Editor( const Editor & );
    static void Discard( Editor * );
    std::string EditDataToStr() const;
    void PrintInfo( const Character* ) const;
    void Help( const Character*, std::string ) const;
    static void ClearBuf( Editor*, Character *, std::string );
    static void SearchAndReplace( Editor *, Character *, std::string );
    void InsertLine( const Character *, std::string );
    void DeleteLine( const Character *, std::string );
    void GotoLine( const Character *, std::string );
    void List( const Character *, std::string ) const;
    void FormatLines( Character *, std::string );
    void Abort( Character* ) const;
    void Save( Character* ) const;

    EditorLine *first_line;     /* list of lines */
    int line_count;             /* number of lines allocated */
    EditorLine *on_line;                /* pointer to the line being edited */
    int text_size;              /* total size of text (not counting
                                 * newlines). */
    int max_size;                       /* max size in chars of string being
                                         * edited (counting newlines) */
    std::string desc;           /* buffer description */
    void *UserData;
    CmdFun *CalledFrom;
    std::function<void(const std::string&)> OnSave;
    
private:

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
static EditorLine *make_new_line( const char * );
static Editor *str_to_editdata( const std::string &, int );

/* misc functions */
static char *finer_OneArgument( char *, char * );
static char *text_replace( char *, char *, char *, size_t *, size_t * );

EditorLine::EditorLine()
    : line( 0 ),
      line_size( 0 ),
      line_used( 0 ),
      next( 0 )
{

}

Editor::Editor()
    : first_line( 0 ),
      line_count( 0 ),
      on_line( 0 ),
      text_size( 0 ),
      max_size( 0 ),
      UserData( NULL ),
      CalledFrom( NULL )
{

}

static std::string NumberedRuler()
{
    return "&G--------10--------20--------30--------40--------50--------60--------70--------80&d\r\n";
}

/****************************************************************************
 * Edit_data manipulation functions
 */

EditorLine *make_new_line( const char *str )
{
    size_t size = strlen( str );
    size = BLOCK_ROUNDUP( size );

    if( size == 0 )
    {
        size = CHAR_BLOCK;
    }

    EditorLine *new_line = new EditorLine();
    CREATE( new_line->line, size );
    new_line->line_size = size;
    new_line->line_used = strlen( str );
    strcpy( new_line->line, str );

    return new_line;
}

void Editor::Discard( Editor *edd )
{
    EditorLine *eline = 0;
    EditorLine *elnext = 0;

    eline = edd->first_line;

    while( eline )
    {
        elnext = eline->next;
        DISPOSE( eline->line );
        delete eline;
        eline = elnext;
    }

    delete edd;
}

Editor::Editor( const Editor &edd )
{
    EditorLine root_line;
    EditorLine *new_line = &root_line;

    for( EditorLine *eline = edd.first_line; eline; eline = eline->next )
    {
        new_line->next = make_new_line( eline->line );

        if( edd.on_line == eline )
        {
            this->on_line = new_line->next;
        }

        new_line = new_line->next;
    }

    max_size = edd.max_size;
    text_size = edd.text_size;
    line_count = edd.line_count;
    first_line = root_line.next;
    desc = edd.desc;
    UserData = edd.UserData;
    CalledFrom = edd.CalledFrom;
}

Editor *str_to_editdata( const std::string &str, int max_size )
{
    const char *p = str.c_str();
    int i = 0;
    int tsize = 0, line_count = 1;
    Editor *edd = new Editor();
    EditorLine *eline = make_new_line( "" );

    edd->first_line = eline;

    while( *p )
    {
        if( tsize + line_count * 2 + 1 >= max_size )
        {
            break;
        }

        if( *p == '\r' )
            ;
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
            RESIZE_IF_NEEDED( eline->line, eline->line_size, eline->line_used,
                              1 );
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

std::string Editor::EditDataToStr() const
{
    EditorLine *eline = first_line;
    std::ostringstream buf;

    while( eline )
    {
        /*
         * ignore the last empty line
         */
        if( !eline->next && eline->line[0] == '\0' )
        {
            break;
        }

        buf << eline->line << std::string( "\n" );
        eline = eline->next;
    }

    return buf.str();
}

/****************************************************************************
 * Main editor functions
 */

void SetEditorDesc( Character *ch, const std::string &new_desc )
{
    if( !ch || !ch->PCData || !ch->PCData->TextEditor )
    {
        return;
    }

    ch->PCData->TextEditor->desc = new_desc;
}

void EditorDescPrintf( Character *ch, const char *desc_fmt, ... )
{
    va_list args;
    va_start( args, desc_fmt );
    std::vector<char> buf = CreateFmtBuffer( desc_fmt, args );
    va_end( args );

    SetEditorDesc( ch, &buf[0] );
}

static void StartEditingNoLimit( Character *ch, const std::string &old_text,
                                 int max_total, void *userdata, CmdFun *caller )
{
    if( !ch->Desc )
    {
        Log->Bug( "Fatal: start_editing: no desc" );
        return;
    }

    ch->Echo( "&GBegin entering your text now (/? = help /s = save /c = clear /l = list)\r\n" );
    ch->Echo( NumberedRuler() + "&d" );

    if( ch->PCData->TextEditor )
    {
        StopEditing( ch );
    }

    ch->PCData->TextEditor = str_to_editdata( old_text, max_total );
    ch->PCData->TextEditor->desc = "Unknown buffer";
    ch->Desc->ConnectionState = CON_EDITING;
    ch->PCData->TextEditor->CalledFrom = caller;
    ch->PCData->TextEditor->UserData = userdata;
    ch->Echo( "&G> &d" );
}

void StartEditing(Character *ch, const std::string &old_text,
                  void *userData, CmdFun *caller)
{
    StartEditingNoLimit(ch, old_text, MAX_STRING_LENGTH * 4, userData, caller);
}

void StartEditing(Character *ch, const std::string &old_text,
                  std::function<void(const std::string&)> onSave)
{
    if( !ch->Desc )
    {
        Log->Bug( "Fatal: start_editing: no desc" );
        return;
    }

    ch->Echo( "&GBegin entering your text now (/? = help /s = save /c = clear /l = list)\r\n" );
    ch->Echo( NumberedRuler() + "&d" );

    if( ch->PCData->TextEditor )
    {
        StopEditing( ch );
    }

    ch->PCData->TextEditor = str_to_editdata( old_text, MAX_STRING_LENGTH * 4);
    ch->PCData->TextEditor->desc = "Unknown buffer";
    ch->Desc->ConnectionState = CON_EDITING;
    ch->PCData->TextEditor->OnSave = onSave;
    ch->Echo( "&G> &d" );
}

std::string CopyEditBuffer( const Character *ch )
{
    if( !ch )
    {
        Log->Bug( "%s: null ch", __FUNCTION__ );
        return "";
    }

    if( !ch->PCData->TextEditor )
    {
        Log->Bug( "%s: null editor", __FUNCTION__ );
        return "";
    }

    return ch->PCData->TextEditor->EditDataToStr();
}

void *EditorUserData( Character *ch )
{
    if( !ch )
    {
        Log->Bug( "%s: null ch", __FUNCTION__ );
        return NULL;
    }

    if( !ch->PCData->TextEditor )
    {
        Log->Bug( "%s: null editor", __FUNCTION__ );
        return NULL;
    }

    return ch->PCData->TextEditor->UserData;
}

void StopEditing( Character *ch )
{
    Editor::Discard( ch->PCData->TextEditor );
    ch->PCData->TextEditor = NULL;
    ch->Echo( "Done.\r\n" );
    ch->SubState = SUB_NONE;
    ch->Desc->ConnectionState = CON_PLAYING;
}

void EditBuffer( Character *ch, std::string argument )
{
    auto d = ch->Desc;
    Editor *edd = 0;
    EditorLine *newline = 0;
    std::string cmd;
    int linelen = 0;
    bool cont_line = false;

    if( !d )
    {
        return;
    }

    if( d->ConnectionState != CON_EDITING )
    {
        ch->Echo( "You can't do that!\r\n" );
        Log->Bug( "%s: d->ConnectionState != CON_EDITING", __FUNCTION__ );
        return;
    }

    if( !ch->PCData->TextEditor )
    {
        ch->Echo( "You can't do that!\r\n" );
        Log->Bug( "%s: null editor", __FUNCTION__ );
        d->ConnectionState = CON_PLAYING;
        ch->SubState = SUB_NONE;
        return;
    }

    edd = ch->PCData->TextEditor;

    if( argument[0] == '/' || argument[0] == '\\' )
    {
        argument = OneArgument( argument, cmd );
        cmd.erase( 0, 1 );

        if( !StrCmp( cmd, "?" ) )
        {
            edd->Help( ch, argument );
        }
        else if( !StrCmp( cmd, "c" ) )
        {
            Editor::ClearBuf( edd, ch, argument );
        }
        else if( !StrCmp( cmd, "r" ) )
        {
            Editor::SearchAndReplace( edd, ch, argument );
        }
        else if( !StrCmp( cmd, "i" ) )
        {
            edd->InsertLine( ch, argument );
        }
        else if( !StrCmp( cmd, "d" ) )
        {
            edd->DeleteLine( ch, argument );
        }
        else if( !StrCmp( cmd, "g" ) )
        {
            edd->GotoLine( ch, argument );
        }
        else if( !StrCmp( cmd, "l" ) )
        {
            ch->Echo( "\r\n    " + NumberedRuler() );
            auto originalColorParser = ch->Desc->ParseColors;
            ch->Desc->ParseColors = ColorParser::Passthrough;
            edd->List( ch, argument );
            ch->Desc->ParseColors = originalColorParser;
            ch->Echo( "    " + NumberedRuler() );
        }
        else if( !StrCmp( cmd, "v" ) )
        {
            ch->Echo( "\r\n    " + NumberedRuler() );
            edd->List( ch, argument );
            ch->Echo( "    " + NumberedRuler() );
        }
        else if( !StrCmp( cmd, "a" ) )
        {
            edd->Abort( ch );
        }
        else if( !StrCmp( cmd, "s" ) )
        {
            edd->Save( ch );
        }
        else if( !StrCmp( cmd, "p" ) )
        {
            edd->PrintInfo( ch );
        }
        else if( !StrCmp( cmd, "f" ) )
        {
            edd->FormatLines( ch, argument );
        }
        else
        {
            ch->Echo( "Uh? Type '/?' to see the list of valid editor commands.\r\n" );
        }

        if( StrCmp( cmd, "a" ) && StrCmp( cmd, "s" ) )
        {
            ch->Echo( "&G> &d" );
        }

        return;
    }

    /*
     * Kludgy fix. Read_from_buffer in comm.c adds a space on
     * * empty lines. Don't let this fill up usable buffer space..
     */
    if( !StrCmp( argument, " " ) )
    {
        argument.erase();
    }

    linelen = argument.size();
    cont_line = false;

    if( TOTAL_BUFFER_SIZE( edd ) + linelen + 2 >= edd->max_size )
    {
        ch->Echo( "Buffer full.\r\n" );
        edd->Save( ch );
    }
    else
    {
        /*
         * add it to the current line
         */
        RESIZE_IF_NEEDED( edd->on_line->line, edd->on_line->line_size,
                          edd->on_line->line_used, linelen + 1 );
        strcat( edd->on_line->line, argument.c_str() );
        edd->on_line->line_used += linelen;
        edd->text_size += linelen;

        /*
         * create a line and advance to it
         */
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
            ch->Echo( "(Continued)\r\n" );
        }

        ch->Echo( "&G> &d" );
    }
}

void Editor::FormatLines( Character *ch, std::string argument )
{
    EditorLine *eline = first_line;
    int srclen = 0, x = 0, inp = 0;
    char src[MAX_STRING_LENGTH];
    char newsrc[MAX_STRING_LENGTH];
    char newsrc2[MAX_STRING_LENGTH];

    while( eline )
    {
        srclen = strlen( eline->line );

        for( x = 0; x < srclen; x++ )
        {
            src[inp++] = eline->line[x];
        }

        if( src[inp - 1] != ' ' /*&& src[inp - 1] != '.' && src[inp - 1] != '!'*/ )
        {
            src[inp++] = ' ';
        }

        eline = eline->next;
    }

    int width = strtol( argument.c_str(), 0, 10 );
    width = width == 0 ? 70 : width;
    width = urange( 20, width, 70 );
    src[inp] = '\0';
    std::string tmp( src );
    ReplaceAll( tmp, "(NL)", "\r\n" );
    strcpy( newsrc, tmp.c_str() );
    strcpy( newsrc, WordWrap( newsrc, width ).c_str() );
    EditBuffer( ch, "/c" );
    inp = 0;
    srclen = strlen( newsrc );

    for( x = 0; x < srclen; x++ )
    {
        if( newsrc[x] == '\r' || newsrc[x] == '\n' )
        {
            x++;
            newsrc2[inp] = '\0';
            inp = 0;
            tmp = newsrc2;
            tmp.erase( 0, tmp.find_first_not_of( " " ) );
            EditBuffer( ch, tmp );
            continue;
        }

        newsrc2[inp++] = newsrc[x];
    }

    ch->Echo( "\r\nOk - Reformatted.\r\n" );
}

void Editor::PrintInfo( const Character *ch ) const
{
    int i = 0;
    EditorLine *eline = first_line;

    while( eline )
    {
        i++;

        if( eline == on_line )
        {
            break;
        }

        eline = eline->next;
    }

    ch->Echo( "&GCurrently editing: &W%s\r\n"
              "&GTotal lines: &W%4d   &GOn line:  &W%4d\r\n"
              "&GBuffer size: &W%4d   &GMax size: &W%4d&d\r\n",
              !desc.empty() ? desc.c_str() : "(Null description)",
              line_count, i,
              TOTAL_BUFFER_SIZE( this ), max_size );
}

void Editor::Help( const Character *ch, std::string argument ) const
{
    int i = 0;

    static const char *const arg[] =
        { "", "l", "v", "c", "d", "g", "i", "r", "a", "f", "p", "s", NULL };
    static const char *const ceditor_help[] =
        {

            /*
             * general help
             */
            "Editing commands\r\n"
            "---------------------------------\r\n"
            "/l [range]      list buffer with escaped color codes\r\n"
            "/v [range]      list buffer with rendered colors\r\n"
            "/c              clear buffer\r\n"
            "/d <line>       delete line\r\n"
            "/g <line>       goto line\r\n"
            "/i <line>       insert line\r\n"
            "/r <old> <new>  global replace\r\n"
            "/a              abort editing\r\n"
            "/f [width]      format buffer\r\n"
            "/p              print information\r\n"
            "/s              save buffer\r\n"

            "Type /? <command>  to get more information on each command.\r\n\r\n",

            "/l [range]: Lists the buffer. Shows what you've written. Optionaly\r\n"
            "   takes a range of lines as argument. Color codes are escaped.\r\n",

            "/v [range]: Lists the buffer. Shows what you've written. Optionaly\r\n"
            "   takes a range of lines as argument. Colors are rendered.\r\n",

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

            "/f [width]: Format the buffer. The optional argument specifies the\r\n"
            "   max width of a line. Defaults to 70. To preserve paragraphs and\r\n"
            "   newlines you may insert the (NL) token where appropriate.\r\n",


            "/p: Prints information about the current editing session.\r\n",

            "/s: Saves the current buffer, terminating the edition session.\r\n",
        };

    for( i = 0; arg[i] != NULL; i++ )
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
        ch->Echo( "&G%s&d", ceditor_help[i] );
    }
}

void Editor::ClearBuf( Editor *edd, Character *ch, std::string )
{
    int edd_max_size = edd->max_size;
    std::string desc = edd->desc;
    CmdFun *caller = edd->CalledFrom;
    void *ud = edd->UserData;
    auto onSave = edd->OnSave;
    
    Editor::Discard( edd );
    ch->PCData->TextEditor = str_to_editdata( "", edd_max_size );
    ch->PCData->TextEditor->desc = desc;
    ch->PCData->TextEditor->CalledFrom = caller;
    ch->PCData->TextEditor->UserData = ud;
    ch->PCData->TextEditor->OnSave = onSave;
    ch->Echo( "Buffer cleared.\r\n" );
}

void Editor::SearchAndReplace( Editor *edd, Character *ch, std::string a )
{
    char argBuf[MAX_INPUT_LENGTH];
    snprintf( argBuf, MAX_STRING_LENGTH, "%s", a.c_str() );
    char *argument = argBuf;
    char word_src[MAX_INPUT_LENGTH];
    char word_dst[MAX_INPUT_LENGTH];
    Editor *cloned_edd = 0;
    EditorLine *eline = 0;
    char *new_text = 0;
    size_t new_size = 0;
    size_t repl_count = 0, line_repl = 0;

    argument = finer_OneArgument( argument, word_src );
    argument = finer_OneArgument( argument, word_dst );

    if( word_src[0] == '\0' || word_dst[0] == '\0' )
    {
        ch->Echo( "Need word to replace, and replacement.\r\n" );
        return;
    }

    if( strcmp( word_src, word_dst ) == 0 )
    {
        ch->Echo( "Done.\r\n" );
        return;
    }

    /*
     * Warning: the replacement of the word can result in the buffer growing
     * * larger than its maximum allowed size. To control this, the buffer is
     * * cloned, the replacement is applied to the clone, and if the size results
     * * legal after the operation, the original buffer is discarded and the
     * * clone is assigned as the current editing buffer. If the clone's size
     * * results too large after the replacement, the clone is simply discarded
     * * and a warning is given to the user
     */

    cloned_edd = new Editor( *edd );

    eline = cloned_edd->first_line;
    repl_count = 0;

    while( eline )
    {
        new_text =
            text_replace( eline->line, word_src, word_dst, &new_size,
                          &line_repl );
        DISPOSE( eline->line );
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
        ch->Echo( "&RAs a result of this operation, the buffer would grow\r\n"
                  "larger than its maximum allowed size. Operation has been\r\n"
                  "cancelled.&d\r\n" );
        Editor::Discard( cloned_edd );
    }
    else
    {
        ch->Echo( "Replacing all occurrences of '%s' with '%s'...\r\n",
                  word_src, word_dst );
        Editor::Discard( edd );
        ch->PCData->TextEditor = cloned_edd;
        ch->Echo( "Found and replaced %lu occurrence(s).\r\n", repl_count );
    }
}

void Editor::InsertLine( const Character *ch, std::string arg )
{
    if( arg.empty() || !IsNumber( arg ) )
    {
        ch->Echo( "Must supply the line number.\r\n" );
        return;
    }

    int lineindex = strtol( arg.c_str(), 0, 10 );

    if( lineindex < 1 || lineindex > line_count )
    {
        ch->Echo( "Line number is out of range (1-%d).\r\n", line_count );
        return;
    }

    EditorLine *newline = make_new_line( "" );

    if( lineindex == 1 )
    {
        newline->next = first_line;
        first_line = newline;
    }
    else
    {
        int num = 1;
        EditorLine *eline = first_line;

        while( num < lineindex - 1 )
        {
            eline = eline->next;
            num++;
        }

        newline->next = eline->next;
        eline->next = newline;
    }

    line_count++;
    ch->Echo( "Inserted line at %d.\r\n", lineindex );
}

void Editor::DeleteLine( const Character *ch, std::string arg )
{
    int lineindex = 0, num = 0;
    EditorLine *prev_line = 0, *del_line = 0;

    if( arg.empty() || !IsNumber( arg ) )
    {
        ch->Echo( "Must supply the line number.\r\n" );
        return;
    }

    lineindex = strtol( arg.c_str(), 0, 10 );

    if( lineindex < 1 || lineindex > line_count )
    {
        ch->Echo( "Line number is out of range (1-%d).\r\n", line_count );
        return;
    }

    if( lineindex == 1 )
    {
        if( line_count == 1 )
        {
            if( first_line->line[0] != '\0' )
            {
                first_line->line[0] = '\0';
                first_line->line_used = 0;
                text_size = 0;
                ch->Echo( "Deleted line 1.\r\n" );
            }
            else
            {
                ch->Echo( "The buffer is empty.\r\n" );
            }

            return;
        }

        del_line = first_line;
        first_line = del_line->next;
    }
    else
    {
        num = 1;
        prev_line = first_line;

        while( num < lineindex - 1 )
        {
            prev_line = prev_line->next;
            num++;
        }

        del_line = prev_line->next;
        prev_line->next = del_line->next;
    }

    if( on_line == del_line )
    {
        if( del_line->next )
        {
            on_line = del_line->next;
        }
        else if( prev_line != NULL )
        {
            on_line = prev_line;
        }
        else
        {
            on_line = first_line;
        }
    }

    line_count--;
    DISPOSE( del_line->line );
    delete del_line;

    ch->Echo( "Deleted line %d.\r\n", lineindex );
}

void Editor::GotoLine( const Character *ch, std::string arg )
{
    if( arg.empty() || !IsNumber( arg ) )
    {
        ch->Echo( "Must supply the line number.\r\n" );
        return;
    }

    int lineindex = strtol( arg.c_str(), 0, 10 );

    if( lineindex < 1 || lineindex > line_count )
    {
        ch->Echo( "Line number is out of range (1-%d).\r\n", line_count );
        return;
    }

    on_line = first_line;
    int num = 1;

    while( num < lineindex )
    {
        on_line = on_line->next;
        num++;
    }

    ch->Echo( "On line %d.\r\n", lineindex );
}

void Editor::List( const Character *ch, std::string argument ) const
{
    int from = 0, to = 0;
    std::string arg1;

    argument = OneArgument( argument, arg1 );

    if( !arg1.empty() && IsNumber( arg1 ) )
    {
        from = strtol( arg1.c_str(), 0, 10 );
    }
    else
    {
        from = 1;
    }

    argument = OneArgument( argument, arg1 );

    if( !arg1.empty() && IsNumber( arg1 ) )
    {
        to = strtol( arg1.c_str(), 0, 10 );
    }
    else
    {
        to = line_count;
    }

    int line_num = 1;
    EditorLine *eline = first_line;

    while( eline )
    {
        if( line_num >= from && line_num <= to )
        {
            ch->Echo( "%2d>%c%s\r\n", line_num,
                      eline == on_line ? '*' : ' ', eline->line );
        }

        eline = eline->next;
        line_num++;
    }
}

void Editor::Abort( Character *ch ) const
{
    ch->Echo( "\r\n&RAborting... &d" );
    StopEditing( ch );
}

void Editor::Save( Character *ch ) const
{
    ch->Desc->ConnectionState = CON_PLAYING;

    if(OnSave)
    {
        OnSave(CopyEditBuffer(ch));
        StopEditing(ch);
    }
    else if( CalledFrom )
    {
        CalledFrom( ch, "" );
    }
}

/****************************************************************************
 * Misc functions
 */

char *text_replace( char *src, char *word_src, char *word_dst,
                    size_t *pnew_size, size_t *prepl_count )
/* Replaces a word word_src in src for word_dst. Returns a pointer to a newly
 * allocated buffer containing the line with the replacements. Stores in
 * pnew_size the size of the allocated buffer, wich may be different from the
 * length of the string and is a multiple of CHAR_BLOCK. Stores in prepl_count
 * the number of replacements it made */
{
    char *dst_buf = 0;
    char *next_found = 0, *last_found = 0;
    size_t dst_used = 0, dst_size = 0, len = 0;
    size_t repl_count = 0;

    /*
     * prepare the destination buffer
     */
    CREATE( dst_buf, CHAR_BLOCK );
    dst_size = CHAR_BLOCK;
    dst_used = 0;
    dst_buf[0] = '\0';

    last_found = src;
    repl_count = 0;

    for( ;; )
    {
        /*
         * look for next instance of word
         */
        next_found = strstr( last_found, word_src );

        if( next_found == NULL )
        {
            /*
             * if theres no more instances of word,
             * * copy the rest of the src
             */
            len = strlen( last_found );
            RESIZE_IF_NEEDED( dst_buf, dst_size, dst_used, len + 1 );
            strcat( dst_buf, last_found );
            dst_used += len;
            break;
        }

        /*
         * copy the buffer up to this instance of the word
         * * and then copy the replacement word
         */
        len = next_found - last_found + strlen( word_dst );
        RESIZE_IF_NEEDED( dst_buf, dst_size, dst_used, len + 1 );
        strncat( dst_buf, last_found, next_found - last_found );
        strcat( dst_buf, word_dst );
        dst_used += len;

        last_found = next_found + strlen( word_src );
        repl_count++;
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
char *finer_OneArgument( char *argument, char *arg_first )
{
    char cEnd = ' ';
    u_long count = 0;
    bool escaped = false;

    while( isspace( *argument ) )
    {
        argument++;
    }

    if( *argument == '\'' || *argument == '"' )
    {
        cEnd = *argument++;
    }

    escaped = false;

    while( *argument != '\0' || ++count >= MAX_INPUT_LENGTH )
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

        if( *argument == cEnd )
        {
            argument++;
            break;
        }

        *arg_first = *argument;
        arg_first++;
        argument++;
    }

    *arg_first = '\0';

    while( isspace( *argument ) )
    {
        argument++;
    }

    return argument;
}
