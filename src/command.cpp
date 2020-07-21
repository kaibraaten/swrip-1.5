#include <cassert>
#include "command.hpp"
#include "mud.hpp"
#include "script.hpp"

#define COMMAND_DATA_FILE    DATA_DIR "commands.lua"

static int L_CommandEntry(lua_State *L);
static void PushCommandTable(lua_State *L);
static void PushCommand(void *command, void *L);

OldRepository *CommandRepository = NULL;

static bool _ExactMatch(void *cmd, const void *n)
{
    const Command *command = static_cast<const Command *>(cmd);
    const char *name = static_cast<const char *>(n);
    return StrCmp(command->Name, name) == 0;
}

static bool _PrefixMatch(void *cmd, const void *n)
{
    const Command *command = static_cast<const Command *>(cmd);
    const char *name = static_cast<const char *>(n);
    return StringPrefix(command->Name, name) == 0;
}

Command::Command()
    : UseRec(std::make_shared<timerset>())
{

}

Command *GetCommand(const std::string &name, bool allowPrefixMatch)
{
    const List *commandList = GetEntities(CommandRepository);
    Command *command = (Command *)FindIfInList(commandList, _ExactMatch, name.c_str());

    if(command == nullptr && allowPrefixMatch)
    {
        command = (Command *)FindIfInList(commandList, _PrefixMatch, name.c_str());
    }

    return command;
}

Command *AllocateCommand()
{
    Command *command = new Command();

    return command;
}

/*
 * Free a command structure                                     -Thoric
 */
void FreeCommand(Command *command)
{
    delete command;
}

/*
 * Remove a command from it's hash index                        -Thoric
 */
void RemoveCommand(Command *command)
{
    RemoveEntity(CommandRepository, command);
}

/*
 * Add a command to the command hash table                      -Thoric
 */
void AddCommand(Command *command)
{
    assert(!command->Name.empty());
    assert(command->Function != NULL);

    /* make sure the name is all lowercase */
    for(size_t i = 0; i < command->Name.size(); ++i)
    {
        command->Name[i] = CharToLowercase(command->Name[i]);
    }

    AddEntity(CommandRepository, command);
}

static void PushCommand(void *cmd, void *state)
{
    const Command *command = static_cast<const Command *>(cmd);
    lua_State *L = static_cast<lua_State *>(state);

    static int idx = 0;
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", command->Name);
    LuaSetfieldString(L, "Function", command->FunctionName);
    LuaSetfieldString(L, "Position", PositionName[command->Position]);
    LuaSetfieldNumber(L, "Level", command->Level);
    LuaSetfieldString(L, "Log", CmdLogName[(int)command->Log]);

    lua_settable(L, -3);
}

static void PushCommandTable(lua_State *L)
{
    const List *commands = GetEntities(CommandRepository);
    lua_newtable(L);
    ForEachInList(commands, PushCommand, L);
    lua_setglobal(L, "commands");
}

void SaveCommands()
{
    SaveEntities(CommandRepository);
}

static void _SaveCommands(const OldRepository *repo)
{
    LuaSaveDataFile(COMMAND_DATA_FILE, PushCommandTable, "commands");
}

static int L_CommandEntry(lua_State *L)
{
    std::string name;
    LuaGetfieldString(L, "Name", &name);

    if(name.empty())
    {
        return 0;
    }

    Command *newCommand = AllocateCommand();
    newCommand->Name = name;

    LuaGetfieldString(L, "Function",
                      [newCommand](const std::string &symbolName)
                      {
                          newCommand->Function = GetSkillFunction(symbolName);
                          const auto funptr = newCommand->Function.target<void(*)(std::shared_ptr<Character>, std::string)>();
                          
                          if(funptr != nullptr && *funptr != skill_notfound)
                          {
                              newCommand->FunctionName = symbolName;
                          }
                      });
    LuaGetfieldString(L, "Position",
                      [newCommand](const std::string &positionName)
                      {
                          PositionType position = GetPosition(positionName);

                          if(position == (PositionType)-1)
                          {
                              position = POS_DEAD;
                          }

                          newCommand->Position = position;
                      });
    LuaGetfieldInt(L, "Level", &newCommand->Level);
    newCommand->Level = newCommand->Level > MAX_LEVEL ? MAX_LEVEL : newCommand->Level;
    LuaGetfieldString(L, "Log",
                      [newCommand](const std::string &logTypeName)
                      {
                          LogType logType = GetCmdLog(logTypeName);

                          if(logType == LogType::Max)
                          {
                              logType = LogType::Normal;
                          }

                          newCommand->Log = logType;
                      });

    AddCommand(newCommand);
    return 0;
}

void LoadCommands(void)
{
    LoadEntities(CommandRepository);
}

static void _LoadCommands(OldRepository *repo)
{
    LuaLoadDataFile(COMMAND_DATA_FILE, L_CommandEntry, "CommandEntry");
}

OldRepository *NewCommandRepository()
{
    return (OldRepository *)NewRepository(_LoadCommands, _SaveCommands);
}
