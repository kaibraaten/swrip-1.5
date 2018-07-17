#ifndef _SWRIP_COMMAND_HPP_
#define _SWRIP_COMMAND_HPP_

#include <utility/oldrepository.hpp>
#include "types.hpp"
#include "constants.hpp"

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
