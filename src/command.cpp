#include <ctype.h>
#include <string.h>
#include <assert.h>
#include "command.hpp"
#include "mud.hpp"
#include "script.hpp"

#define COMMAND_DATA_FILE    DATA_DIR "commands.lua"

static int L_CommandEntry( lua_State *L );
static void PushCommandTable( lua_State *L, const void *userData );
static void PushCommand( const Command *command, lua_State *L );

OldRepository *CommandRepository = NULL;

static bool _ExactMatch(const Command *command, const char *name)
{
  return StrCmp(command->Name, name) == 0;
}

static bool _PrefixMatch(const Command *command, const char *name)
{
  return StringPrefix(command->Name, name) == 0;
}

Command *GetCommand( const char *name )
{
  const List *commandList = GetEntities(CommandRepository);
  Command *command = (Command*) FindIfInList(commandList, (Predicate*)_ExactMatch, name);

  if(command == NULL)
    {
      command = (Command*) FindIfInList(commandList, (Predicate*)_PrefixMatch, name);
    }

  return command;
}

Command *AllocateCommand( void )
{
  Command *command = NULL;
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
void RemoveCommand( Command *command )
{
  RemoveEntity(CommandRepository, command);
}

/*
 * Add a command to the command hash table                      -Thoric
 */
void AddCommand( Command *command )
{
  int i = 0;
  assert(!IsNullOrEmpty(command->Name));
  assert(command->Function != NULL);

  /* make sure the name is all lowercase */
  for ( i = 0; command->Name[i] != '\0'; i++ )
    {
      command->Name[i] = CharToLowercase(command->Name[i]);
    }

  AddEntity(CommandRepository, command);
}

static void PushCommand(const Command *command, lua_State *L)
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
  const List *commands = GetEntities(CommandRepository);
  lua_newtable( L );
  ForEachInList(commands, (ForEachFunc*) PushCommand, L);
  lua_setglobal( L, "commands" );
}

void SaveCommands( void )
{
  SaveEntities(CommandRepository);
}

static void _SaveCommands(const OldRepository *repo)
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

      if( position == (PositionType)-1 )
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

void LoadCommands(void)
{
  LoadEntities(CommandRepository);
}

static void _LoadCommands(OldRepository *repo)
{
  LuaLoadDataFile( COMMAND_DATA_FILE, L_CommandEntry, "CommandEntry" );
}

OldRepository *NewCommandRepository()
{
  return (OldRepository*) NewRepository(_LoadCommands, _SaveCommands);
}

