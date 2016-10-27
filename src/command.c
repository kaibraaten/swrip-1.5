#include <ctype.h>
#include <string.h>
#include "command.h"
#include "mud.h"
#include "script.h"

#define COMMAND_DATA_FILE    SYSTEM_DIR "commands.lua"
#define OLD_COMMAND_DATA_FILE SYSTEM_DIR "commands.dat"

static int L_CommandEntry( lua_State *L );
static void PushCommandTable( lua_State *L, const void *userData );
static void PushCommand( lua_State *L, const Command *command );

Command *CommandTable[126];  /* hash table for cmd_table */

Command *GetCommand( const char *command )
{
  Command *cmd = NULL;
  int hash = CharToLowercase(command[0]) % 126;

  for ( cmd = CommandTable[hash]; cmd; cmd = cmd->Next )
    {
      if ( !StringPrefix( command, cmd->Name ) )
        {
          return cmd;
        }
    }

  return NULL;
}

Command *AllocateCommand( void )
{
  Command *command;
  AllocateMemory( command, Command, 1 );
  AllocateMemory( command->UseRec, struct timerset, 1 );

  return command;
}

/*
 * Free a command structure                                     -Thoric
 */
void FreeCommand( Command *command )
{
  if ( command->Name )
    FreeMemory( command->Name );

  if( command->FunctionName )
    FreeMemory( command->FunctionName );

  FreeMemory( command->UseRec );
  FreeMemory( command );
}

/*
 * Remove a command from it's hash index                        -Thoric
 */
void UnlinkCommand( Command *command )
{
  Command *tmp, *tmp_next;
  int  hash = command->Name[0] % 126;

  if ( command == (tmp = CommandTable[hash]) )
    {
      CommandTable[hash] = tmp->Next;
      return;
    }

  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->Next;

      if ( command == tmp_next )
        {
          tmp->Next = tmp_next->Next;
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

  if ( !command->Name )
    {
      Bug( "AddCommand: NULL command->Name" );
      return;
    }

  if ( !command->Function )
    {
      Bug( "AddCommand: NULL command->Function" );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; command->Name[x] != '\0'; x++ )
    command->Name[x] = CharToLowercase(command->Name[x]);

  hash = command->Name[0] % 126;

  if ( (prev = tmp = CommandTable[hash]) == NULL )
    {
      command->Next = CommandTable[hash];
      CommandTable[hash] = command;
      return;
    }

  /* add to the END of the list */
  for ( ; tmp; tmp = tmp->Next )
    {
      if ( !tmp->Next )
	{
	  tmp->Next = command;
	  command->Next = NULL;
	}
    }
}

static void PushCommand( lua_State *L, const Command *command )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", command->Name );
  LuaSetfieldString( L, "Function", command->FunctionName );
  LuaSetfieldString( L, "Position", PositionName[command->Position] );
  LuaSetfieldNumber( L, "Level", command->Level );
  LuaSetfieldString( L, "Log", CmdLogName[command->Log] );

  lua_settable( L, -3 );
}

static void PushCommandTable( lua_State *L, const void *dummy )
{
  int hash = 0;
  lua_newtable( L );

  for ( hash = 0; hash < 126; hash++ )
    {
      Command *cmd = NULL;

      for ( cmd = CommandTable[hash]; cmd; cmd = cmd->Next )
        {
	  PushCommand( L, cmd );
        }
    }

  lua_setglobal( L, "commands" );
}

void SaveCommands( void )
{
  LuaSaveDataFile( COMMAND_DATA_FILE, PushCommandTable, "commands", NULL );
}

static int L_CommandEntry( lua_State *L )
{
  int idx = 0;
  Command *newCommand = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );
  idx = lua_gettop( L );

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "Function" );
  lua_getfield( L, idx, "Position" );
  lua_getfield( L, idx, "Level" );
  lua_getfield( L, idx, "Log" );

  newCommand = AllocateCommand();

  if( !lua_isnil( L, ++idx ) )
    {
      newCommand->Name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *symbolName = lua_tostring( L, idx );

      newCommand->Function = GetSkillFunction( symbolName );

      if( newCommand->Function != skill_notfound )
	{
	  newCommand->FunctionName = CopyString( symbolName );
	}
      else
	{
	  newCommand->FunctionName = CopyString( "" );
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      PositionType position = GetPosition( lua_tostring( L, idx ) );

      if( position == -1 )
	{
	  position = POS_DEAD;
	}

      newCommand->Position = position;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      newCommand->Level = lua_tointeger( L, idx );
      newCommand->Level = newCommand->Level > MAX_LEVEL ? MAX_LEVEL : newCommand->Level;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      int logType = GetCmdLog( lua_tostring( L, idx ) );

      if( logType == -1 )
	{
	  logType = LOG_NORMAL;
	}

      newCommand->Log = logType;
    }

  lua_pop( L, lua_gettop( L ) - 1 );

  if( IsNullOrEmpty( newCommand->Name ) )
    {
      FreeCommand( newCommand );
    }
  else
    {
      AddCommand( newCommand );
    }

  return 0;
}

void OldLoadCommands( void );

void LoadCommands( void )
{
  /*
  OldLoadCommands();
  return;
  */
  LuaLoadDataFile( COMMAND_DATA_FILE, L_CommandEntry, "CommandEntry" );
}

static void ReadCommand( FILE *fp )
{
  Command *command = NULL;
  AllocateMemory( command, Command, 1 );
  AllocateMemory( command->UseRec, struct timerset, 1 );

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

	      command->Function = GetSkillFunction( symbol_name );
	      fMatch = true;

	      if( command->Function != skill_notfound )
		{
		  command->FunctionName = CopyString( symbol_name );
		}
	      else
		{
		  command->FunctionName = CopyString( "" );
		}

	      break;
	    }
	  break;

	case 'E':
	  if ( !StrCmp( word, "End" ) )
	    {
	      if ( !command->Name )
		{
		  Bug( "%s: Name not found", __FUNCTION__ );
		  FreeCommand( command );
		  return;
		}

	      if ( !command->Function )
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
	  KEY( "Level", command->Level,         ReadInt(fp) );
	  KEY( "Log",           command->Log,           ReadInt(fp) );
	  break;

	case 'N':
	  KEY( "Name",  command->Name,          ReadStringToTilde(fp) );
	  break;

	case 'P':
	  KEY( "Position",      command->Position,      (PositionType)ReadInt(fp) );
	  break;
	}

      if ( !fMatch )
	{
	  Bug( "%s: no match: %s", __FUNCTION__, word );
	}
    }
}

void OldLoadCommands( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( OLD_COMMAND_DATA_FILE, "r" ) ) != NULL )
    {
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
