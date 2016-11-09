#ifndef _SWRIP_SOCIAL_H_
#define _SWRIP_SOCIAL_H_

#include "types.hpp"

struct Social
{
  Social *Next;
  char *Name;
  char *CharNoArg;
  char *OthersNoArg;
  char *CharFound;
  char *OthersFound;
  char *VictimFound;
  char *CharAuto;
  char *OthersAuto;
};

extern Social *SocialTable[27];

void FreeSocial( Social *social );
void UnlinkSocial( Social *social );
void AddSocial( Social *social );
Social *GetSocial( const char *command );
void LoadSocials( void );
void SaveSocials( void );
bool CheckSocial( Character *ch, const char *command, char *argument );

#endif
