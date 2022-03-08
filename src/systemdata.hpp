#ifndef _SWRIP_SYSTEMDATA_HPP_
#define _SWRIP_SYSTEMDATA_HPP_

#include <bitset>
#include "constants.hpp"

namespace Flag::AutoSave {
enum : size_t
{
    Death,
    Kill,
    ChangePassword,
    Drop,
    Put,
    Give,
    Auto,
    Zap,
    Auction,
    Get,
    Receive,
    Idle,
    Backup
};
}

class SystemData
{
public:
    SystemData();
    void Load();
    void Save() const;

    int MaxPlayersThisBoot = 0;             /* Maximum players this boot   */
    int MaxPlayersEver = 0;             /* Maximum players ever   */
    std::string TimeOfMaxPlayersEver = "(not recorded)"; /* Time of max ever */
    bool NoNameResolving = false;      /* Hostnames are not resolved  */
    bool NewPlayersMustWaitForAuth = false;          /* New players must be auth'ed */
    int ReadAllMail = LEVEL_CREATOR;          /* Read all player mail(was 54)*/
    int ReadMailFree = LEVEL_IMMORTAL;         /* Read mail for free (was 51) */
    int WriteMailFree = LEVEL_IMMORTAL;        /* Write mail for free(was 51) */
    int TakeOthersMail = LEVEL_CREATOR;       /* Take others mail (was 54)   */
    int LevelOfBuildChannel = LEVEL_CREATOR;
    int LevelOfLogChannel = LEVEL_LOG;              /* Level of log channel LEVEL LOG*/
    int LevelToModifyProto = LEVEL_CREATOR; /* Level to modify prototype stuff LEVEL_CREATOR */
    int LevelToOverridePrivateFlag = LEVEL_GREATER; /* override private flag */
    int LevelToMsetPlayers = LEVEL_CREATOR;      /* Level to mset a player */
    int StunModPlrVsPlr = 15;        /* Stun mod player vs. player */
    int StunRegular = 15;           /* Stun difficult */
    int DamagePlrVsPlr = 100;         /* Damage mod player vs. player */
    int DamagePlrVsMob = 100;         /* Damage mod player vs. mobile */
    int DamageMobVsPlr = 100;         /* Damage mod mobile vs. player */
    int DamageMobVsMob = 100;         /* Damage mod mobile vs. mobile */
    int LevelToGetObjectsWithoutTakeFlag = LEVEL_GREATER; /* Get objects without take flag */
    int LevelToForcePlayers = LEVEL_GREATER; /* The level at which you can use force on players. */
    std::bitset<Flag::MAX> SaveFlags;
    int SaveFrequency = 0;         /* How old to autosave someone */
    unsigned short Port = 7000;
    bool DisableHunger = false;
    bool CanChooseJedi = false;
    bool PermaDeath = false;
    bool ExtendedRaceSelection = false;
    bool AllowMultiplaying = false;
    bool DropOnDefeat = true;
    bool TopLevelFromAbility = false;
};

inline SystemData SysData;

#endif
