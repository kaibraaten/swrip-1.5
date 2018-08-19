#ifndef _SWRIP_COMMAND_HPP_
#define _SWRIP_COMMAND_HPP_

#include <utility/oldrepository.hpp>
#include "types.hpp"
#include "constants.hpp"

class Command
{
public:
  char    *Name = nullptr;
  CmdFun  *Function = nullptr;
  char    *FunctionName = nullptr;
  PositionType Position = 0;
  short    Level = 0;
  int      Log = 0;
  timerset *UseRec = nullptr;
};

extern OldRepository *CommandRepository;

Command *AllocateCommand( void );
void FreeCommand( Command *command );
void RemoveCommand( Command *command );
void AddCommand( Command *command );
Command *GetCommand( const char *command );
void LoadCommands( void );
void SaveCommands( void );
OldRepository *NewCommandRepository();

#endif
