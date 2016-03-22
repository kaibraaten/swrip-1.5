#include <ctype.h>
#include <string.h>
#include "command.h"
#include "mud.h"
#include "script.h"

static int L_CommandEntry( lua_State *L );
static void PushCommandList( lua_State *L );
static void PushCommand( lua_State *L, const Command *command );

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
  int  hash = command->name[0]%126;

  if ( command == (tmp = command_hash[hash]) )
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

  if ( !command->name )
    {
      Bug( "AddCommand: NULL command->name" );
      return;
    }

  if ( !command->do_fun )
    {
      Bug( "AddCommand: NULL command->do_fun" );
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

static void PushCommandList( lua_State *L )
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
  LuaSaveDataFile( COMMAND_DATA_FILE, PushCommandList, "commands" );
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

  newCommand = CreateCommand();

  if( !lua_isnil( L, ++idx ) )
    {
      newCommand->name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *symbolName = lua_tostring( L, idx );

      newCommand->do_fun = GetSkillFunction( symbolName );

      if( newCommand->do_fun != skill_notfound )
	{
	  newCommand->fun_name = CopyString( symbolName );
	}
      else
	{
	  newCommand->fun_name = CopyString( "" );
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      int position = GetPosition( lua_tostring( L, idx ) );

      if( position == -1 )
	{
	  position = POS_DEAD;
	}

      newCommand->position = position;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      newCommand->level = lua_tointeger( L, idx );
      newCommand->level = newCommand->level > MAX_LEVEL ? MAX_LEVEL : newCommand->level;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      int logType = GetCmdLog( lua_tostring( L, idx ) );

      if( logType == -1 )
	{
	  logType = LOG_NORMAL;
	}

      newCommand->log = logType;
    }

  lua_pop( L, 5 );

  if( IsNullOrEmpty( newCommand->name ) )
    {
      FreeCommand( newCommand );
    }
  else
    {
      AddCommand( newCommand );
    }

  return 0;
}

void LoadCommands( void )
{
  LuaLoadDataFile( COMMAND_DATA_FILE, L_CommandEntry, "CommandEntry" );
}
