#ifndef _SWRIP_COMMAND_HPP_
#define _SWRIP_COMMAND_HPP_

#include <memory>
#include <utility/oldrepository.hpp>
#include "types.hpp"
#include "constants.hpp"

class Command
{
public:
    Command();
    std::string Name;
    CmdFun *Function = nullptr;
    std::string FunctionName;
    PositionType Position = 0;
    int Level = 0;
    int Log = 0;
    std::shared_ptr<timerset> UseRec;
};

extern OldRepository *CommandRepository;

Command *AllocateCommand();
void FreeCommand(Command *command);
void RemoveCommand(Command *command);
void AddCommand(Command *command);
Command *GetCommand(const std::string &command, bool allowPrefixMatch = true);
void LoadCommands();
void SaveCommands();
OldRepository *NewCommandRepository();

#endif
