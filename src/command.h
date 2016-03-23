#ifndef _SWRIP_COMMAND_H_
#define _SWRIP_COMMAND_H_

#include "types.h"

#define COMMAND_DATA_FILE    SYSTEM_DIR "commands.lua"

struct Command
{
  Command *next;
  char    *Name;
  CmdFun  *Function;
  char    *FunctionName;
  int      Position;
  short    Level;
  int      Log;
  struct timerset *UseRec;
};

extern Command *CommandHash[126];

Command *AllocateCommand( void );
void FreeCommand( Command *command );
void UnlinkCommand( Command *command );
void AddCommand( Command *command );
Command *GetCommand( const char *command );
void LoadCommands( void );
void SaveCommands( void );

#endif
