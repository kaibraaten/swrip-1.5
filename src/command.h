#ifndef _SWRIP_COMMAND_HPP_
#define _SWRIP_COMMAND_HPP_

#include <utility/repository.hpp>
#include "types.h"
#include "constants.h"

struct Command
{
  char    *Name;
  CmdFun  *Function;
  char    *FunctionName;
  PositionType Position;
  short    Level;
  int      Log;
  struct timerset *UseRec;
};

extern Repository *CommandRepository;

Command *AllocateCommand( void );
void FreeCommand( Command *command );
void RemoveCommand( Command *command );
void AddCommand( Command *command );
Command *GetCommand( const char *command );
void LoadCommands( void );
void SaveCommands( void );
Repository *NewCommandRepository();

#endif
