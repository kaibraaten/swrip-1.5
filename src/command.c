#include <ctype.h>
#include <string.h>
#include "command.h"
#include "mud.h"
#include "script.h"

/*static void OldSaveCommands( void );*/
static void OldLoadCommands( void );
static void ReadCommand( FILE *fp );

Command *command_hash[126];  /* hash table for cmd_table */

Command *GetCommand( const char *command )
{
  Command *cmd = NULL;
  int hash = CharToLowercase(command[0]) % 126;

  for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
    {
      if ( !StringPrefix( command, cmd->name ) )
        {
          return cmd;
        }
    }

  return NULL;
}

Command *CreateCommand( void )
{
  Command *command;
  AllocateMemory( command, Command, 1 );
  AllocateMemory( command->userec, struct timerset, 1 );

  return command;
}

/*
 * Free a command structure                                     -Thoric
 */
void FreeCommand( Command *command )
{
  if ( command->name )
    FreeMemory( command->name );

  if( command->fun_name )
    FreeMemory( command->fun_name );

  FreeMemory( command->userec );
  FreeMemory( command );
}

/*
 * Remove a command from it's hash index                        -Thoric
 */
void UnlinkCommand( Command *command )
{
  Command *tmp, *tmp_next;
  int hash;

  if ( !command )
    {
      Bug( "Unlink_command NULL command", 0 );
      return;
    }

  hash = command->name[0]%126;

  if ( command == (tmp=command_hash[hash]) )
    {
      command_hash[hash] = tmp->next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->next;
      if ( command == tmp_next )
        {
          tmp->next = tmp_next->next;
          return;
        }
    }
}

/*
 * Add a command to the command hash table                      -Thoric
 */
void AddCommand( Command *command )
{
  int hash, x;
  Command *tmp, *prev;

  if ( !command )
    {
      Bug( "Add_command: NULL command", 0 );
      return;
    }

  if ( !command->name )
    {
      Bug( "Add_command: NULL command->name", 0 );
      return;
    }

  if ( !command->do_fun )
    {
      Bug( "Add_command: NULL command->do_fun", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; command->name[x] != '\0'; x++ )
    command->name[x] = CharToLowercase(command->name[x]);

  hash = command->name[0] % 126;

  if ( (prev = tmp = command_hash[hash]) == NULL )
    {
      command->next = command_hash[hash];
      command_hash[hash] = command;
      return;
    }

  /* add to the END of the list */
  for ( ; tmp; tmp = tmp->next )
    {
      if ( !tmp->next )
	{
	  tmp->next = command;
	  command->next = NULL;
	}
    }
}

/*
 * Save the commands to disk
 */
/*
static void OldSaveCommands( void )
{
  FILE *fpout = NULL;
  const Command *command = NULL;
  int x = 0;

  if ( (fpout=fopen( COMMAND_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open commands.dat for writing", 0 );
      perror( COMMAND_FILE );
      return;
    }

  for ( x = 0; x < 126; x++ )
    {
      for ( command = command_hash[x]; command; command = command->next )
        {
          if ( !command->name || command->name[0] == '\0' )
            {
	      Bug( "Save_commands: blank command in hash bucket %d", x );
              continue;
            }

          fprintf( fpout, "#COMMAND\n" );
          fprintf( fpout, "Name        %s~\n", command->name     );
          fprintf( fpout, "Code        %s\n",  command->fun_name );
          fprintf( fpout, "Position    %d\n",  command->position );
          fprintf( fpout, "Level       %d\n",  command->level    );
          fprintf( fpout, "Log         %d\n",  command->log      );
          fprintf( fpout, "End\n\n" );
        }
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}
*/

static void PushCommand( lua_State *L, const Command *command )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", command->name );
  LuaSetfieldString( L, "Function", command->fun_name );
  LuaSetfieldString( L, "Position", PositionName[command->position] );
  LuaSetfieldNumber( L, "Level", command->level );
  LuaSetfieldString( L, "Log", CmdLogName[command->log] );

  lua_settable( L, -3 );
}

static void PushCommands( lua_State *L )
{
  int hash = 0;
  lua_newtable( L );

  for ( hash = 0; hash < 126; hash++ )
    {
      Command *cmd = NULL;

      for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
        {
	  PushCommand( L, cmd );
        }
    }

  lua_setglobal( L, "commands" );
}

void SaveCommands( void )
{
  /*
  OldSaveCommands();
  */
  char filename[MAX_STRING_LENGTH];
  strcpy( filename, FormatString( "%scommands.lua", SYSTEM_DIR ) );
  LuaSaveDataFile( filename, PushCommands, "commands" );
}

static void ReadCommand( FILE *fp )
{
  Command *command = CreateCommand();

  for ( ;; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'C':
          if( !StrCmp( "Code", word ) )
            {
              const char *symbol_name = ReadWord( fp );

              command->do_fun = GetSkillFunction( symbol_name );
              fMatch = true;

              if( command->do_fun != skill_notfound )
                {
                  command->fun_name = CopyString( symbol_name );
                }
              else
                {
                  command->fun_name = CopyString( "" );
                }

              break;
            }
	  break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if ( !command->name )
                {
                  Bug( "%s: Name not found", __FUNCTION__ );
                  FreeCommand( command );
                  return;
                }

              if ( !command->do_fun )
                {
                  Bug( "%s: Function not found", __FUNCTION__ );
                  FreeCommand( command );
                  return;
                }

              AddCommand( command );
              return;
            }
          break;

        case 'L':
          KEY( "Level", command->level,         ReadInt(fp) );
          KEY( "Log",           command->log,           ReadInt(fp) );
          break;

        case 'N':
          KEY( "Name",  command->name,          ReadStringToTilde(fp) );
          break;

        case 'P':
          KEY( "Position",      command->position,      ReadInt(fp) );
	  break;
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

static void OldLoadCommands( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( COMMAND_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "%s: # not found.", __FUNCTION__ );
              break;
            }

	  word = ReadWord( fp );

          if ( !StrCmp( word, "COMMAND" ) )
            {
              ReadCommand( fp );
              continue;
            }
          else if ( !StrCmp( word, "END" ) )
            {
              break;
            }
          else
            {
              Bug( "%s: bad section.", __FUNCTION__ );
              continue;
            }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open commands.dat" );
      exit(0);
    }
}

void LoadCommands( void )
{
  OldLoadCommands();
}
