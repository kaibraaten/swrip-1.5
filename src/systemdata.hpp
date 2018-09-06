#ifndef _SWRIP_SYSTEMDATA_HPP_
#define _SWRIP_SYSTEMDATA_HPP_

#include "constants.hpp"

class SystemData
{
public:
  void Load();
  void Save() const;
  
  int MaxPlayersThisBoot = 0;             /* Maximum players this boot   */
  int MaxPlayersEver = 0;             /* Maximum players ever   */
  std::string TimeOfMaxPlayersEver;            /* Time of max ever */
  bool NoNameResolving = false;      /* Hostnames are not resolved  */
  bool DenyNewPlayers = false;       /* New players cannot connect  */
  bool NewPlayersMustWaitForAuth = false;          /* New players must be auth'ed */
  short ReadAllMail = LEVEL_CREATOR;          /* Read all player mail(was 54)*/
  short ReadMailFree = LEVEL_IMMORTAL;         /* Read mail for free (was 51) */
  short WriteMailFree = LEVEL_IMMORTAL;        /* Write mail for free(was 51) */
  short TakeOthersMail = LEVEL_CREATOR;       /* Take others mail (was 54)   */
  short LevelOfBuildChannel = LEVEL_CREATOR;
  short LevelOfLogChannel = LEVEL_LOG;              /* Level of log channel LEVEL LOG*/
  short LevelToModifyProto = LEVEL_CREATOR; /* Level to modify prototype stuff LEVEL_CREATOR */
  short LevelToOverridePrivateFlag = LEVEL_GREATER; /* override private flag */
  short LevelToMsetPlayers = LEVEL_CREATOR;      /* Level to mset a player */
  short StunModPlrVsPlr = 15;        /* Stun mod player vs. player */
  short StunRegular = 15;           /* Stun difficult */
  short DamagePlrVsPlr = 100;         /* Damage mod player vs. player */
  short DamagePlrVsMob = 100;         /* Damage mod player vs. mobile */
  short DamageMobVsPlr = 100;         /* Damage mod mobile vs. player */
  short DamageMobVsMob = 100;         /* Damage mod mobile vs. mobile */
  short LevelToGetObjectsWithoutTakeFlag = LEVEL_GREATER; /* Get objects without take flag */
  short LevelToForcePlayers = LEVEL_GREATER; /* The level at which you can use force on players. */
  short MaxSN = 0;                 /* Max skills */
  int SaveFlags = SV_DEATH | SV_PASSCHG | SV_AUTO | SV_PUT | SV_DROP | SV_GIVE | SV_AUCTION | SV_ZAPDROP | SV_IDLE;             /* Toggles for saving conditions */
  short SaveFrequency = 0;         /* How old to autosave someone */
  short Port = 7000;
  bool DisableHunger = false;
  bool CanChooseJedi = false;
  bool PermaDeath = false;
  bool ExtendedRaceSelection = false;
  bool AllowMultiplaying = false;

#ifdef _WIN32
  HMODULE DlHandle;
#else
  void *DlHandle = nullptr;
#endif
  unsigned char *MCCP_Buffer = nullptr;
};

extern SystemData SysData;

#endif
