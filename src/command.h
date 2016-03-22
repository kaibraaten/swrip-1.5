#ifndef _SWRIP_COMMAND_H_
#define _SWRIP_COMMAND_H_

#include "types.h"

#define COMMAND_DATA_FILE    SYSTEM_DIR "commands.lua"

struct Command
{
  Command *next;
  char    *name;
  CmdFun  *do_fun;
  char    *fun_name;
  int      position;
  short    level;
  int      log;
  struct timerset *userec;
};

extern Command *command_hash[126];

Command *CreateCommand( void );
void FreeCommand( Command *command );
void UnlinkCommand( Command *command );
void AddCommand( Command *command );
Command *GetCommand( const char *command );
void LoadCommands( void );
void SaveCommands( void );

#endif
