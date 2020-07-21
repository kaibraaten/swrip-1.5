#ifndef _SWRIP_COMMAND_HPP_
#define _SWRIP_COMMAND_HPP_

#include <memory>
#include <functional>
#include <utility/oldrepository.hpp>
#include "types.hpp"
#include "constants.hpp"

class Command
{
public:
    Command();
    std::string Name;
    std::function<void(std::shared_ptr<Character>, std::string)> Function;
    std::string FunctionName;
    PositionType Position = 0;
    int Level = 0;
    LogType Log = LogType::Normal;
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
