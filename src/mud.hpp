/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _SWRIP_MUD_HPP_
#define _SWRIP_MUD_HPP_

#include <array>
#include <list>
#include <string>
#include <cstdio>
#include <cstdlib>
#include <climits>
#include <utility/utility.hpp>

#ifdef __cplusplus
extern "C" {
#endif

#if defined(_WIN32)
#define ZLIB_WINAPI 1
#endif

#include <zlib.h>

#ifdef __cplusplus
}
#endif

#include <cmath>

#include "types.hpp"
#include "alias.hpp"
#include "constants.hpp"

/*
 * do_who output structure -- Narn
 */
struct WhoData
{
  WhoData *Previous = nullptr;
  WhoData *Next = nullptr;
  char     *Text = nullptr;
  int       Type = 0;
};

struct TimeInfo
{
  int Hour = 0;
  int Day = 0;
  int Month = 0;
  int Year = 0;
};

struct HourMinSec
{
  int Hour = 0;
  int Minute = 0;
  int Second = 0;
  int Manual = 0;
};

struct Weather
{
  int Mmhg = 0;
  int Change = 0;
  int Sky = 0;
  int Sunlight = 0;
};

/*
 * Structure used to build wizlist
 */
struct Wizard
{
  Wizard *Next = nullptr;
  Wizard *Last = nullptr;
  char   *Name = nullptr;
  short   Level = 0;
};

/*
 * Descriptor (channel) structure.
 */
class Descriptor
{
public:
  Descriptor *Next = nullptr;
  Descriptor *Previous = nullptr;
  Descriptor *SnoopBy = nullptr;
  struct Character *Character = nullptr;
  struct Character *Original = nullptr;

  struct
  {
    char *Hostname = nullptr;
    char *HostIP = nullptr;
    short Port = 0;
  } Remote;

  socket_t  Socket = INVALID_SOCKET;
  short     ConnectionState = 0;
  short     Idle = 0;
  bool      fCommand = false;
  char      InBuffer[MAX_INBUF_SIZE];
  char      InComm[MAX_INPUT_LENGTH];
  char      InLast[MAX_INPUT_LENGTH];
  int       Repeat = 0;
  char     *OutBuffer  = nullptr;
  unsigned  long OutSize = 0;
  int       OutTop = 0;

  int           NewState = 0;
  unsigned char PreviousColor = 0;
};

/*
 * Attribute bonus structures.
 */
class StrengthBonusType
{
public:
  StrengthBonusType(short toHit, short toDamage, short carry, short wield)
    : ToHit(toHit),
      ToDamage(toDamage),
      Carry(carry),
      Wield(wield)
  {

  }

  short ToHit = 0;
  short ToDamage = 0;
  short Carry = 0;
  short Wield = 0;
};

struct IntelligenceBonusType
{
  short Learn = 0;
};

struct WisdomBonusType
{
  short Practice = 0;
};

struct DexterityBonusType
{
  short Defensive = 0;
};

struct ConstitutionBonusType
{
  short HitPoint = 0;
  short Shock = 0;
};

struct CharismaBonusType
{
  short Charm = 0;
};

struct LuckBonusType
{
  short Luck = 0;
};

struct ForceBonusType
{
  short Force = 0;
};

/* Mob program structures */
struct act_prog_data
{
  struct act_prog_data *Next = nullptr;
  void                 *vo = nullptr;
};

struct MPROG_ACT_LIST
{
  MPROG_ACT_LIST *Next = nullptr;
  char           *buf = nullptr;
  Character      *ch = nullptr;
  Object       *obj = nullptr;
  void           *vo = nullptr;
};

struct MPROG_DATA
{
  MPROG_DATA *Next = nullptr;
  int         type = 0;
  bool        triggered = false;
  int         resetdelay = 0;
  char       *arglist = nullptr;
  char       *comlist = nullptr;
};

extern bool MOBtrigger;
extern bool mud_down;
extern bool fBootDb;

/* race dedicated stuff */
struct Race
{
  char Name[20];   /* Race name                    */
  int Affected = 0;               /* Default affect bitvectors    */

  struct
  {
    short ModStr = 0;               /* Str bonus/penalty            */
    short ModDex = 0;               /* Dex      "                   */
    short ModWis = 0;               /* Wis      "                   */
    short ModInt = 0;               /* Int      "                   */
    short ModCon = 0;               /* Con      "                   */
    short ModCha = 0;               /* Cha      "                   */
    short ModLck = 0;               /* Lck      "                   */
    short ModFrc = 0;               /* Frc      "                   */
  } Stats;

  std::array<int, MAX_ABILITY> AbilityMod;

  short Hit = 0;
  short Mana = 0;
  int   Resistant = 0;
  int   Susceptible = 0;
  int   ClassRestriction = 0;       /* Flags for illegal classes    */
  int   Language = 0;               /* Default racial language      */
  bool AvailableForSelection = false;   /* Race can be selected by players */
};

struct Storeroom
{
  Storeroom       *Next = nullptr;
  Storeroom       *Previous = nullptr;
  vnum_t           Vnum = INVALID_VNUM;
  struct Room *Room = nullptr;
};

/*
 * An affect.
 */
struct Affect
{
  Affect *Next = nullptr;
  Affect *Previous = nullptr;
  short Type = 0;
  short Duration = 0;
  short Location = 0;
  int Modifier = 0;
  int AffectedBy = 0;
};

/*
 * A SMAUG spell
 */
struct SmaugAffect
{
  SmaugAffect *Next = nullptr;
  char *Duration = nullptr;
  short Location = 0;
  char *Modifier = nullptr;
  int AffectedBy = 0;
};

struct Timer
{
  Timer  *Previous = nullptr;
  Timer  *Next = nullptr;
  CmdFun *DoFun = nullptr;
  int     Value = 0;
  short   Type = 0;
  short   Count = 0;
};

/*
 * Prototype for a mob.
 * This is the in-memory version of #MOBILES.
 */
struct ProtoMobile
{
  ProtoMobile *Next = nullptr;
  ProtoMobile *NextSort = nullptr;
  SpecFun *spec_fun = nullptr;
  SpecFun *spec_2 = nullptr;
  struct Shop *Shop = nullptr;
  struct RepairShop *RepairShop = nullptr;
  char           *Name = nullptr;
  char           *ShortDescr = nullptr;
  char           *LongDescr = nullptr;
  char           *Description = nullptr;
  vnum_t          Vnum = INVALID_VNUM;
  short           Count = 0;
  short           Killed = 0;
  SexType         Sex = 0;
  short           Level = 0;
  int             Flags = 0;
  int             AffectedBy = 0;
  short           Alignment = 0;
  short           MobThac0 = 0;               /* Unused */
  short           ArmorClass = 0;
  short           HitNoDice = 0;
  short           HitSizeDice = 0;
  short           HitPlus = 0;
  short           DamNoDice = 0;
  short           DamSizeDice = 0;
  short           DamPlus = 0;
  short           NumberOfAttacks = 0;
  int             Gold = 0;
  int             exp = 0;
  int             BodyParts = 0;
  int             Resistant = 0;
  int             Immune = 0;
  int             Susceptible = 0;
  int             AttackFlags = 0;
  int             DefenseFlags = 0;
  int             Speaks = 0;
  int             Speaking = 0;
  PositionType    Position = 0;
  PositionType    DefaultPosition = 0;
  short           Height = 0;
  short           Weight = 0;
  short           Race = 0;
  short           HitRoll = 0;
  short           DamRoll = 0;
  int             VipFlags = 0;

  struct
  {
    MPROG_DATA *mudprogs = nullptr;
    int progtypes = 0;
  } mprog;

  struct
  {
    short PermStr = 0;
    short PermInt = 0;
    short PermWis = 0;
    short PermDex = 0;
    short PermCon = 0;
    short PermCha = 0;
    short PermLck = 0;
    short PermFrc = 0;
  } Stats;

  struct
  {
    short PoisonDeath = 0;
    short Wand = 0;
    short ParaPetri = 0;
    short Breath = 0;
    short SpellStaff = 0;
  } Saving;
};


struct HuntHateFear
{
  char      *Name = nullptr;
  Character *Who = nullptr;
};

struct Fight
{
  Character *Who = nullptr;
  long        Xp = 0;
  short      Align = 0;
  short      Duration = 0;
  short      TimesKilled = 0;
};

struct ExtractedCharacter
{
  ExtractedCharacter *Next = nullptr;
  struct Character *Character = nullptr;
  Room *InRoom = nullptr;
  ch_ret             RetCode = rNONE;
  bool               Extract = false;
};

struct KilledData
{
  vnum_t Vnum = INVALID_VNUM;
  char  Count = 0;
};

/*
 * Liquids.
 */
struct LiquidType
{
  char  *Name = nullptr;
  char  *Color = nullptr;
  std::array<short, 3> Affect;
};

/*
 * Extra description data for a room or object.
 */
struct ExtraDescription
{
  ExtraDescription *Next = nullptr;       /* Next in list                     */
  ExtraDescription *Previous = nullptr;       /* Previous in list                 */
  char             *Keyword = nullptr;              /* Keyword in look/examine          */
  char             *Description = nullptr;          /* What to see                      */
};

/*
 * Prototype for an object.
 */
struct ProtoObject
{
  ProtoObject   *Next = nullptr;
  ProtoObject   *NextSort = nullptr;
  ExtraDescription *FirstExtraDescription = nullptr;
  ExtraDescription *LastExtraDescription = nullptr;
  Affect      *FirstAffect = nullptr;
  Affect      *LastAffect = nullptr;
  char             *Name = nullptr;
  char             *ShortDescr = nullptr;
  char             *Description = nullptr;
  char             *ActionDescription = nullptr;
  vnum_t            Vnum = INVALID_VNUM;
  short             Level = 0;
  ItemTypes         ItemType = 0;
  int               Flags = 0;
  int               WearFlags = 0;
  short             Count = 0;
  short             Weight = 0;
  int               Cost = 0;
  std::array<int, MAX_OVAL> Value;
  int               Serial = 0;
  short             Layers = 0;
  int               Rent = 0;                   /* Unused */

  struct
  {
    MPROG_DATA *mudprogs = nullptr;
    int progtypes = 0;
  } mprog;
};


/*
 * One object.
 */
struct Object
{
  Object         *Next = nullptr;
  Object         *Previous = nullptr;
  Object         *NextContent = nullptr;
  Object         *PreviousContent = nullptr;
  Object         *FirstContent = nullptr;
  Object         *LastContent = nullptr;
  Object         *InObject = nullptr;
  Character        *CarriedBy = nullptr;
  ExtraDescription *FirstExtraDescription = nullptr;
  ExtraDescription *LastExtraDescription = nullptr;
  Affect      *FirstAffect = nullptr;
  Affect      *LastAffect = nullptr;
  ProtoObject   *Prototype = nullptr;
  Room  *InRoom = nullptr;
  char             *ArmedBy = nullptr;
  char             *Name = nullptr;
  char             *ShortDescr = nullptr;
  char             *Description = nullptr;
  char             *ActionDescription = nullptr;
  ItemTypes         ItemType = 0;
  int               Flags = 0;
  int               WearFlags = 0;
  int               BlasterSetting = 0;
  WearLocation      WearLoc = 0;
  short             Weight = 0;
  int               Cost = 0;
  short             Level = 0;
  short             Timer = 0;
  std::array<int, MAX_OVAL> Value;
  short             Count = 0;          /* support for object grouping */
  int               Serial = 0;         /* serial number               */

  struct
  {
    MPROG_ACT_LIST *mpact = nullptr;
    int             mpactnum = 0;
    short           mpscriptpos = 0;
  } mprog;
};

/*
 * Exit data.
 */
struct Exit
{
  Exit       *Previous = nullptr;           /* previous exit in linked list */
  Exit       *Next = nullptr;           /* next exit in linked list     */
  Exit       *ReverseExit = nullptr;          /* Reverse exit pointer         */
  Room *ToRoom = nullptr;        /* Pointer to destination room  */
  char            *Keyword = nullptr;        /* Keywords for exit or door    */
  char            *Description = nullptr;    /* Description of exit          */
  vnum_t           Vnum = INVALID_VNUM;           /* Vnum of room exit leads to   */
  vnum_t           ReverseVnum = INVALID_VNUM;          /* Vnum of room in opposite dir */
  int              Flags = 0;      /* door states & other flags    */
  vnum_t           Key = INVALID_VNUM;            /* Key vnum                     */
  DirectionType    Direction = 0;           /* Physical "direction"         */
  short            Distance = 0;       /* how far to the next room     */
};

/*
 * Used to keep track of system settings and statistics         -Thoric
 */
struct SystemData
{
  int    MaxPlayersThisBoot = 0;             /* Maximum players this boot   */
  int    MaxPlayersEver = 0;             /* Maximum players ever   */
  char  *TimeOfMaxPlayersEver = nullptr;            /* Time of max ever */
  bool   NoNameResolving = false;      /* Hostnames are not resolved  */
  bool   DenyNewPlayers = false;       /* New players cannot connect  */
  bool   NewPlayersMustWaitForAuth = false;          /* New players must be auth'ed */
  short  ReadAllMail = 0;          /* Read all player mail(was 54)*/
  short  ReadMailFree = 0;         /* Read mail for free (was 51) */
  short  WriteMailFree = 0;        /* Write mail for free(was 51) */
  short  TakeOthersMail = 0;       /* Take others mail (was 54)   */
  short  LevelOfBuildChannel = 0;
  short  LevelOfLogChannel = 0;              /* Level of log channel LEVEL LOG*/
  short  LevelToModifyProto = 0;     /* Level to modify prototype stuff LEVEL_CREATOR */
  short  LevelToOverridePrivateFlag = 0; /* override private flag */
  short  LevelToMsetPlayers = 0;      /* Level to mset a player */
  short  StunModPlrVsPlr = 0;        /* Stun mod player vs. player */
  short  StunRegular = 0;           /* Stun difficult */
  short  DamagePlrVsPlr = 0;         /* Damage mod player vs. player */
  short  DamagePlrVsMob = 0;         /* Damage mod player vs. mobile */
  short  DamageMobVsPlr = 0;         /* Damage mod mobile vs. player */
  short  DamageMobVsMob = 0;         /* Damage mod mobile vs. mobile */
  short  LevelToGetObjectsWithoutTakeFlag = 0;     /* Get objects without take flag */
  short  LevelToForcePlayers = 0;          /* The level at which you can use force on players. */
  short  MaxSN = 0;                 /* Max skills */
  int    SaveFlags = 0;             /* Toggles for saving conditions */
  short  SaveFrequency = 0;         /* How old to autosave someone */
  short  Port = 0;
  bool DisableHunger = false;
  bool CanChooseJedi = false;
  bool PermaDeath = false;
  bool ExtendedRaceSelection = false;
#ifdef _WIN32
  HMODULE DlHandle;
#else
  void *DlHandle = nullptr;
#endif
  unsigned char *MCCP_Buffer = nullptr;
};

/*
 * Room type.
 */
struct Room
{
  Room  *Next = nullptr;
  Room  *NextSort = nullptr;
  Character        *FirstPerson = nullptr;
  Character        *LastPerson = nullptr;
  Object         *FirstContent = nullptr;
  Object         *LastContent = nullptr;
  ExtraDescription *FirstExtraDescription = nullptr;
  ExtraDescription *LastExtraDescription = nullptr;
  struct Area        *Area = nullptr;
  Exit        *FirstExit = nullptr;
  Exit        *LastExit = nullptr;
  Ship        *FirstShip = nullptr;
  Ship        *LastShip = nullptr;
  char             *Name = nullptr;
  char             *Description = nullptr;
  vnum_t            Vnum = INVALID_VNUM;
  int               Flags = 0;
  short             Light = 0;
  SectorType Sector = 0;
  vnum_t            TeleVnum = INVALID_VNUM;
  short             TeleDelay = 0;
  short             Tunnel = 0;              /* max people that will fit */
  Shuttle     *FirstShuttle = nullptr;
  Shuttle     *LastShuttle = nullptr;

  struct
  {
    MPROG_ACT_LIST *mpact = nullptr;
    int             mpactnum = 0;
    short           mpscriptpos = 0;
    MPROG_DATA     *mudprogs = nullptr;
    int             progtypes = 0;
  } mprog;
};

/*
 * Delayed teleport type.
 */
struct TeleportData
{
  TeleportData   *Next = nullptr;
  TeleportData   *Previous = nullptr;
  Room *FromRoom = nullptr;
  short            TeleportTimer = 0;
};

struct timerset
{
  int            NumberOfTimesUsed = 0;
  struct timeval TotalTime;
  struct timeval MinTime;
  struct timeval MaxTime;
};

struct Auction
{
  Object  *Item = nullptr;   /* a pointer to the item */
  Character *Seller = nullptr; /* a pointer to the seller - which may NOT quit */
  Character *Buyer = nullptr;  /* a pointer to the buyer - which may NOT quit */
  int        Bet = 0;    /* last bet - or 0 if noone has bet anything */
  short      Going = 0;  /* 1,2, sold */
  short      Pulse = 0;  /* how many pulses (.25 sec) until another call-out ? */
  int        Starting = 0;
};

#define CHECK_SUBRESTRICTED(ch)                                         \
  do                                                                    \
    {                                                                   \
      if ( (ch)->SubState == SUB_RESTRICTED )                           \
        {                                                               \
          ch->Echo( "You cannot use this command from within another command.\r\n" ); \
          return;                                                       \
        }                                                               \
    } while(0)


/*
 * Character macros.
 */
#define IS_OUTSIDE(ch)          (!IsBitSet(                               \
                                         (ch)->InRoom->Flags,     \
                                         ROOM_INDOORS) && !IsBitSet(      \
                                                                  (ch)->InRoom->Flags, \
                                                                  ROOM_SPACECRAFT) )

#define EXIT(ch, door)          ( GetExit( (ch)->InRoom, door ) )

#define CAN_GO(ch, door)        (EXIT((ch),(door))                      \
                                 && (EXIT((ch),(door))->ToRoom != NULL) \
                                 && !IsBitSet(EXIT((ch), (door))->Flags, EX_CLOSED))

/*
 * Object macros.
 */
#define CAN_WEAR(obj, part)     (IsBitSet((obj)->WearFlags,  (part)))
#define IS_OBJ_STAT(obj, stat)  (IsBitSet((obj)->Flags, (stat)))

/*
 * Global constants.
 */
extern time_t last_restore_all_time;
extern time_t boot_time;  /* this should be moved down */
extern HourMinSec * set_boot_time;
extern struct tm *new_boot_time;
extern time_t new_boot_time_t;

extern const std::array<const StrengthBonusType, MAX_STAT + 1> StrengthBonus;
extern const std::array<const IntelligenceBonusType, MAX_STAT + 1> IntelligenceBonus;
extern const std::array<const WisdomBonusType, MAX_STAT + 1> WisdomBonus;
extern const std::array<const DexterityBonusType, MAX_STAT + 1> DexterityBonus;
extern const std::array<const ConstitutionBonusType, MAX_STAT + 1> ConstitutionBonus;
extern const std::array<const CharismaBonusType, MAX_STAT + 1> CharismaBonus;
extern const std::array<const LuckBonusType, MAX_STAT + 1> LuckBonus;
extern const std::array<const ForceBonusType, MAX_STAT + 1> ForceBonus;

extern const std::array<const Race, MAX_RACE> RaceTable;
extern const std::array<const LiquidType, LIQ_MAX> LiquidTable;

extern const std::array<const char * const, MAX_ABILITY> AbilityName;
extern const std::array<const char * const, MAX_SPACEOBJECT_TYPE> SpaceobjectTypeName;
extern const std::array<const short, SECT_MAX> MovementLoss;
extern const std::array<const char * const, MAX_WEAR> WhereName;
extern const std::array<int, MAX_DIR + 1> TrapDoor;
extern const char * const SectorNames[][2];
extern const int SentTotal[];
extern const char * const RoomSents[][25];
extern const std::array<const char * const, MAX_BIT> RoomFlags;
extern const std::array<const char * const, MAX_BIT> WearFlags;
extern const std::array<const char * const, MAX_BIT> ObjectFlags;
extern const std::array<const char * const, MAX_BIT> MobFlags;
extern const std::array<const char * const, MAX_BIT> AffectFlags;
extern const std::array<const char * const, MAX_BIT> WantedFlags;
extern const std::array<const char * const, MAX_BIT> PlanetFlags;
extern const std::array<const char * const, MAX_BIT> PlayerFlags;
extern const std::array<const char * const, MAX_BIT> PcFlags;
extern const std::array<const char * const, MAX_BIT> TrapFlags;
extern const std::array<const char * const, MAX_BIT> RisFlags;
extern const std::array<const char * const, MAX_BIT> TriggerFlags;
extern const std::array<const char * const, MAX_BIT> PartFlags;
extern const std::array<const char * const, MAX_BIT> DefenseFlags;
extern const std::array<const char * const, MAX_BIT> AttackFlags;
extern const std::array<const char * const, MAX_BIT> AreaFlags;
extern const std::array<const char * const, MAX_BIT> ExitFlags;
extern const std::array<const char * const, MAX_BIT> mprog_flags;
extern const std::array<const char * const, MAX_BIT> SaveFlags;
extern const std::array<const char * const, MAX_BIT> ShipFlags;

extern const std::array<const char * const, MAX_ITEM_TYPE + 1> ObjectTypes;
extern const std::array<const char * const, MAX_APPLY_TYPE> AffectTypes;
extern const std::array<const char * const, MAX_NPC_RACE> NpcRace;
extern const std::array<const char * const, MAX_WEAR - 1> WearLocations;
extern const std::array<int, LANG_MAX + 1> LanguageArray;
extern const std::array<const char * const, LANG_MAX + 1> LanguageNames;

extern const std::array<const char * const, MAX_POSITION> PositionName;
extern const std::array<const char * const, MAX_LOG> CmdLogName;
extern const std::array<const char * const, MAX_SHIP_TYPE> ShipTypes;
extern const std::array<const char * const, MAX_SHIP_CLASS> ShipClasses;

/*
 * Global variables.
 */
extern bool bootup;

extern int numobjsloaded;
extern int nummobsloaded;
extern int physicalobjects;
extern int num_descriptors;
extern struct SystemData SysData;
extern int top_vroom;
extern int top_affect;
extern int top_area;
extern int top_ed;
extern int top_exit;
extern int top_mob_index;
extern int top_obj_index;
extern int top_reset;
extern int top_room;
extern int top_shop;
extern int top_repair;
extern int cur_qobjs;
extern int cur_qchars;
extern long long high_galaxy_cash;
extern long long low_galaxy_cash;

extern Character       *cur_char;
extern Room            *cur_room;
extern bool             cur_char_died;
extern ch_ret           global_retcode;

extern int              cur_obj;
extern int              cur_obj_serial;
extern bool             cur_obj_extracted;
extern obj_ret          global_objcode;

extern Shop       *FirstShop;
extern Shop       *LastShop;
extern RepairShop     *FirstRepairShop;
extern RepairShop     *LastRepairShop;
extern Character       *FirstCharacter;
extern Character       *LastCharacter;
extern Descriptor      *FirstDescriptor;
extern Descriptor      *LastDescriptor;
extern Object          *FirstObject;
extern Object          *LastObject;

extern TeleportData    *FirstTeleport;
extern TeleportData    *LastTeleport;
extern Object          *extracted_obj_queue;
extern ExtractedCharacter *extracted_char_queue;
extern Object          *save_equipment[MAX_WEAR][MAX_LAYERS];
extern Character       *quitting_char;
extern Character       *loading_char;
extern Character       *saving_char;
extern Object          *all_obj;
extern time_t           current_time;
extern bool             fLogAll;
extern char             log_buf[];
extern TimeInfo   time_info;
extern Weather     weather_info;
extern Auction         *auction;
extern struct act_prog_data *mob_act_list;
extern ProtoMobile *MobIndexHash[MAX_KEY_HASH];
extern ProtoObject *ObjectIndexHash[MAX_KEY_HASH];
extern Room *RoomIndexHash[MAX_KEY_HASH];

/*
 * Command functions.
 */
DECLARE_CMD_FUN( do_test );
DECLARE_CMD_FUN( do_craftingengine );
DECLARE_CMD_FUN( do_copyover );
DECLARE_CMD_FUN( do_nohelps      );
DECLARE_CMD_FUN( do_skin         );
DECLARE_CMD_FUN( do_dismiss      );
DECLARE_CMD_FUN( do_draw );
DECLARE_CMD_FUN( do_focusalias   );
DECLARE_CMD_FUN( do_unfocusalias   );
DECLARE_CMD_FUN( do_members      );
DECLARE_CMD_FUN( do_roster       );
DECLARE_CMD_FUN( do_scatter );
DECLARE_CMD_FUN( do_delay );
DECLARE_CMD_FUN( do_setplanet );
DECLARE_CMD_FUN( do_makeplanet );
DECLARE_CMD_FUN( do_planets );
DECLARE_CMD_FUN( do_showplanet );
DECLARE_CMD_FUN( do_showstatistic );
DECLARE_CMD_FUN( do_showstatistic_web );
DECLARE_CMD_FUN( do_teach );
DECLARE_CMD_FUN( do_gather_intelligence );
DECLARE_CMD_FUN( do_add_patrol );
DECLARE_CMD_FUN( do_special_forces );
DECLARE_CMD_FUN( do_jail );
DECLARE_CMD_FUN( do_unjail );
DECLARE_CMD_FUN( do_elite_guard );
DECLARE_CMD_FUN( do_smalltalk );
DECLARE_CMD_FUN( do_propaganda );
DECLARE_CMD_FUN( do_bribe );
DECLARE_CMD_FUN( do_seduce );
DECLARE_CMD_FUN( do_mass_propaganda );
DECLARE_CMD_FUN( do_copyship  );
DECLARE_CMD_FUN( do_autopilot  );
DECLARE_CMD_FUN( do_allspeeders  );
DECLARE_CMD_FUN( do_speeders  );
DECLARE_CMD_FUN( do_suicide  );
DECLARE_CMD_FUN( do_gain  );
DECLARE_CMD_FUN( do_train  );
DECLARE_CMD_FUN( do_beg  );
DECLARE_CMD_FUN( do_bank  );
DECLARE_CMD_FUN( do_hijack  );
DECLARE_CMD_FUN( do_pickshiplock  );
DECLARE_CMD_FUN( do_shiptalk  );
DECLARE_CMD_FUN( do_clone  );
DECLARE_CMD_FUN( do_systemtalk );
DECLARE_CMD_FUN( do_sabotage );
DECLARE_CMD_FUN( do_spacetalk );
DECLARE_CMD_FUN( do_hail );
DECLARE_CMD_FUN( do_allships );
DECLARE_CMD_FUN( do_appoint );
DECLARE_CMD_FUN( do_demote );
DECLARE_CMD_FUN( do_empower );
DECLARE_CMD_FUN( do_capture );
DECLARE_CMD_FUN( do_arm );
DECLARE_CMD_FUN( do_chaff );
DECLARE_CMD_FUN( do_clan_donate );
DECLARE_CMD_FUN( do_clan_withdraw );
DECLARE_CMD_FUN( do_drive );
DECLARE_CMD_FUN( do_setblaster );
DECLARE_CMD_FUN( do_ammo );
DECLARE_CMD_FUN( do_takedrug );
DECLARE_CMD_FUN( do_use );
DECLARE_CMD_FUN( do_resign );
DECLARE_CMD_FUN( do_pluogus );
DECLARE_CMD_FUN( do_findserin );
DECLARE_CMD_FUN( do_makearmor );
DECLARE_CMD_FUN( do_makejewelry );
DECLARE_CMD_FUN( do_makegrenade );
DECLARE_CMD_FUN( do_makelandmine );
DECLARE_CMD_FUN( do_makeglowrod );
DECLARE_CMD_FUN( do_makecomlink );
DECLARE_CMD_FUN( do_makeshield );
DECLARE_CMD_FUN( do_makecontainer );
DECLARE_CMD_FUN( do_reinforcements );
DECLARE_CMD_FUN( do_postguard );
DECLARE_CMD_FUN( do_torture );
DECLARE_CMD_FUN( do_snipe );
DECLARE_CMD_FUN( do_throw );
DECLARE_CMD_FUN( do_disguise );
DECLARE_CMD_FUN( do_makedisguise );
DECLARE_CMD_FUN( do_mine );
DECLARE_CMD_FUN( do_first_aid);
DECLARE_CMD_FUN( do_makeblade );
DECLARE_CMD_FUN( do_makeblaster );
DECLARE_CMD_FUN( do_makebowcaster );
DECLARE_CMD_FUN( do_makelightsaber );
DECLARE_CMD_FUN( do_makespice );
DECLARE_CMD_FUN( do_closebay );
DECLARE_CMD_FUN( do_openbay );
DECLARE_CMD_FUN( do_autotrack );
DECLARE_CMD_FUN( do_jumpvector );
DECLARE_CMD_FUN( do_reload );
DECLARE_CMD_FUN( do_tractorbeam );
DECLARE_CMD_FUN( do_radar );
DECLARE_CMD_FUN( do_buyship );
DECLARE_CMD_FUN( do_buyhome );
DECLARE_CMD_FUN( do_renameship);
DECLARE_CMD_FUN( do_buzz );
DECLARE_CMD_FUN( do_clanbuyship );
DECLARE_CMD_FUN( do_clansellship );
DECLARE_CMD_FUN( do_sellship );
DECLARE_CMD_FUN( do_autorecharge );
DECLARE_CMD_FUN( do_openhatch );
DECLARE_CMD_FUN( do_closehatch );
DECLARE_CMD_FUN( do_status );
DECLARE_CMD_FUN( do_info );
DECLARE_CMD_FUN( do_hyperspace );
DECLARE_CMD_FUN( do_target );
DECLARE_CMD_FUN( do_fire );
DECLARE_CMD_FUN( do_calculate );
DECLARE_CMD_FUN( do_calculate_diff );
DECLARE_CMD_FUN( do_guard );
DECLARE_CMD_FUN( do_recharge );
DECLARE_CMD_FUN( do_repairship );
DECLARE_CMD_FUN( do_addpilot );
DECLARE_CMD_FUN( do_addresident );
DECLARE_CMD_FUN( do_rempilot);
DECLARE_CMD_FUN( do_remresident);
DECLARE_CMD_FUN( do_trajectory );
DECLARE_CMD_FUN( do_trajectory_actual );
DECLARE_CMD_FUN( do_accelerate );
DECLARE_CMD_FUN( do_launch );
DECLARE_CMD_FUN( do_land );
DECLARE_CMD_FUN( do_leaveship );
DECLARE_CMD_FUN( do_setspaceobject );
DECLARE_CMD_FUN( do_makespaceobject );
DECLARE_CMD_FUN( do_spaceobjects );
DECLARE_CMD_FUN( do_showspaceobject );
DECLARE_CMD_FUN( skill_notfound  );
DECLARE_CMD_FUN( do_aassign      );
DECLARE_CMD_FUN( do_adjusttractorbeam );
DECLARE_CMD_FUN( do_addbounty    );
DECLARE_CMD_FUN( do_rembounty    );
DECLARE_CMD_FUN( do_vassign      );
DECLARE_CMD_FUN( do_rassign      );
DECLARE_CMD_FUN( do_massign      );
DECLARE_CMD_FUN( do_oassign      );
DECLARE_CMD_FUN( do_advance      );
DECLARE_CMD_FUN( do_affected     );
DECLARE_CMD_FUN( do_afk          );
DECLARE_CMD_FUN( do_aid          );
DECLARE_CMD_FUN( do_allow        );
DECLARE_CMD_FUN( do_ansi         );
DECLARE_CMD_FUN( do_answer       );
DECLARE_CMD_FUN( do_apply        );
DECLARE_CMD_FUN( do_appraise     );
DECLARE_CMD_FUN( do_areas        );
DECLARE_CMD_FUN( do_accept       );
DECLARE_CMD_FUN( do_ahall        );
DECLARE_CMD_FUN( do_arena        );
DECLARE_CMD_FUN( do_awho         );
DECLARE_CMD_FUN( do_bet          );
DECLARE_CMD_FUN( do_challenge    );
DECLARE_CMD_FUN( do_chaos        );
DECLARE_CMD_FUN( do_decline      );
DECLARE_CMD_FUN( do_aset         );
DECLARE_CMD_FUN( do_ask          );
DECLARE_CMD_FUN( do_astat        );
DECLARE_CMD_FUN( do_at           );
DECLARE_CMD_FUN( do_auction      );
DECLARE_CMD_FUN( do_authorize    );
DECLARE_CMD_FUN( do_avtalk       );
DECLARE_CMD_FUN( do_backstab     );
DECLARE_CMD_FUN( do_badname      );
DECLARE_CMD_FUN( do_balzhur      );
DECLARE_CMD_FUN( do_bamfin       );
DECLARE_CMD_FUN( do_bamfout      );
DECLARE_CMD_FUN( do_ban          );
DECLARE_CMD_FUN( do_bash         );
DECLARE_CMD_FUN( do_bashdoor     );
DECLARE_CMD_FUN( do_beep         );
DECLARE_CMD_FUN( do_berserk      );
DECLARE_CMD_FUN( do_bestow       );
DECLARE_CMD_FUN( do_bestowarea   );
DECLARE_CMD_FUN( do_bind         );
DECLARE_CMD_FUN( do_bio          );
DECLARE_CMD_FUN( do_board        );
DECLARE_CMD_FUN( do_boards       );
DECLARE_CMD_FUN( do_bodybag      );
DECLARE_CMD_FUN( do_bounties     );
DECLARE_CMD_FUN( do_brandish     );
DECLARE_CMD_FUN( do_bset         );
DECLARE_CMD_FUN( do_bstat        );
DECLARE_CMD_FUN( do_bug          );
DECLARE_CMD_FUN( do_bury         );
DECLARE_CMD_FUN( do_buy          );
DECLARE_CMD_FUN( do_buyvendor    );
DECLARE_CMD_FUN( do_cast         );
DECLARE_CMD_FUN( do_cedit        );
DECLARE_CMD_FUN( do_channels     );
DECLARE_CMD_FUN( do_chat         );
DECLARE_CMD_FUN( do_ooc          );
DECLARE_CMD_FUN( do_check_vnums  );
DECLARE_CMD_FUN( do_circle       );
DECLARE_CMD_FUN( do_clanfunds    );
DECLARE_CMD_FUN( do_clans        );
DECLARE_CMD_FUN( do_ships        );
DECLARE_CMD_FUN( do_shiptrack    );
DECLARE_CMD_FUN( do_clantalk     );
DECLARE_CMD_FUN( do_allclantalk  );
DECLARE_CMD_FUN( do_climb        );
DECLARE_CMD_FUN( do_close        );
DECLARE_CMD_FUN( do_cmdtable     );
DECLARE_CMD_FUN( do_cmenu        );
DECLARE_CMD_FUN( do_color        );
DECLARE_CMD_FUN( do_collectgold  );
DECLARE_CMD_FUN( do_commands     );
DECLARE_CMD_FUN( do_comment      );
DECLARE_CMD_FUN( do_compare      );
DECLARE_CMD_FUN( do_config       );
DECLARE_CMD_FUN( do_consider     );
DECLARE_CMD_FUN( do_cutdoor     );
DECLARE_CMD_FUN( do_credits      );
DECLARE_CMD_FUN( do_cset         );
DECLARE_CMD_FUN( do_degradeship  );
DECLARE_CMD_FUN( do_deities      );
DECLARE_CMD_FUN( do_deny         );
DECLARE_CMD_FUN( do_description  );
DECLARE_CMD_FUN( do_destroy      );
DECLARE_CMD_FUN( do_detrap       );
DECLARE_CMD_FUN( do_devote       );
DECLARE_CMD_FUN( do_dig          );
DECLARE_CMD_FUN( do_disarm       );
DECLARE_CMD_FUN( do_disconnect   );
DECLARE_CMD_FUN( do_dismount     );
DECLARE_CMD_FUN( do_dmesg        );
DECLARE_CMD_FUN( do_down         );
DECLARE_CMD_FUN( do_drag         );
DECLARE_CMD_FUN( do_drink        );
DECLARE_CMD_FUN( do_drop         );
DECLARE_CMD_FUN( do_diagnose     );
DECLARE_CMD_FUN( do_east         );
DECLARE_CMD_FUN( do_eat          );
DECLARE_CMD_FUN( do_echo         );
DECLARE_CMD_FUN( do_emote        );
DECLARE_CMD_FUN( do_empty        );
DECLARE_CMD_FUN( do_enter        );
DECLARE_CMD_FUN( do_equipment    );
DECLARE_CMD_FUN( do_examine      );
DECLARE_CMD_FUN( do_exits        );
DECLARE_CMD_FUN( do_fill         );
DECLARE_CMD_FUN( do_fixchar      );
DECLARE_CMD_FUN( do_flee         );
DECLARE_CMD_FUN( do_foldarea     );
DECLARE_CMD_FUN( do_follow       );
DECLARE_CMD_FUN( do_for          );
DECLARE_CMD_FUN( do_force        );
DECLARE_CMD_FUN( do_forceclose   );
DECLARE_CMD_FUN( do_fuel         );
DECLARE_CMD_FUN( do_fquit        );     /* Gorog */
DECLARE_CMD_FUN( do_form_password);
DECLARE_CMD_FUN( do_freeze       );
DECLARE_CMD_FUN( do_get          );
DECLARE_CMD_FUN( do_give         );
DECLARE_CMD_FUN( do_glance       );
DECLARE_CMD_FUN( do_gold         );
DECLARE_CMD_FUN( do_goto         );
DECLARE_CMD_FUN( do_gouge        );
DECLARE_CMD_FUN( do_group        );
DECLARE_CMD_FUN( do_grub         );
DECLARE_CMD_FUN( do_gtell        );
DECLARE_CMD_FUN( do_hedit        );
DECLARE_CMD_FUN( do_hell         );
DECLARE_CMD_FUN( do_help         );
DECLARE_CMD_FUN( do_hide         );
DECLARE_CMD_FUN( do_hitall       );
DECLARE_CMD_FUN( do_hlist        );
DECLARE_CMD_FUN( do_holylight    );
DECLARE_CMD_FUN( do_homepage     );
DECLARE_CMD_FUN( do_hset         );
DECLARE_CMD_FUN( do_i103         );
DECLARE_CMD_FUN( do_i104         );
DECLARE_CMD_FUN( do_i105         );
DECLARE_CMD_FUN( do_idea         );
DECLARE_CMD_FUN( do_immortalize  );
DECLARE_CMD_FUN( do_immtalk      );
DECLARE_CMD_FUN( do_induct       );
DECLARE_CMD_FUN( do_installarea  );
DECLARE_CMD_FUN( do_instaroom    );
DECLARE_CMD_FUN( do_instazone    );
DECLARE_CMD_FUN( do_inventory    );
DECLARE_CMD_FUN( do_invis        );
DECLARE_CMD_FUN( do_invite       );
DECLARE_CMD_FUN( do_junk         );
DECLARE_CMD_FUN( do_kick         );
DECLARE_CMD_FUN( do_kill         );
DECLARE_CMD_FUN( do_languages    );
DECLARE_CMD_FUN( do_last         );
DECLARE_CMD_FUN( do_leave        );
DECLARE_CMD_FUN( do_level        );
DECLARE_CMD_FUN( do_light        );
DECLARE_CMD_FUN( do_list         );
DECLARE_CMD_FUN( do_litterbug    );
DECLARE_CMD_FUN( do_load );
DECLARE_CMD_FUN( do_unload       );
DECLARE_CMD_FUN( do_loadarea     );
DECLARE_CMD_FUN( do_loadup       );
DECLARE_CMD_FUN( do_lock         );
DECLARE_CMD_FUN( do_log          );
DECLARE_CMD_FUN( do_look         );
DECLARE_CMD_FUN( do_low_purge    );
DECLARE_CMD_FUN( do_mailroom     );
DECLARE_CMD_FUN( do_makeboard    );
DECLARE_CMD_FUN( do_makeclan     );
DECLARE_CMD_FUN( do_makeguild    );
DECLARE_CMD_FUN( do_makeship     );
DECLARE_CMD_FUN( do_makerepair   );
DECLARE_CMD_FUN( do_makeshop     );
DECLARE_CMD_FUN( do_makewizlist  );
DECLARE_CMD_FUN( do_memory       );
DECLARE_CMD_FUN( do_mcreate      );
DECLARE_CMD_FUN( do_mfind        );
DECLARE_CMD_FUN( do_minvoke      );
DECLARE_CMD_FUN( do_mlist        );
DECLARE_CMD_FUN( do_mount        );
DECLARE_CMD_FUN( do_mset         );
DECLARE_CMD_FUN( do_mstat        );
DECLARE_CMD_FUN( do_murder       );
DECLARE_CMD_FUN( do_music        );
DECLARE_CMD_FUN( do_mwhere       );
DECLARE_CMD_FUN( do_name         );
DECLARE_CMD_FUN( do_newbiechat   );
DECLARE_CMD_FUN( do_newbieset    );
DECLARE_CMD_FUN( do_newzones     );
DECLARE_CMD_FUN( do_noemote      );
DECLARE_CMD_FUN( do_noresolve    );
DECLARE_CMD_FUN( do_north        );
DECLARE_CMD_FUN( do_northeast    );
DECLARE_CMD_FUN( do_northwest    );
DECLARE_CMD_FUN( do_notell       );
DECLARE_CMD_FUN( do_notitle      );
DECLARE_CMD_FUN( do_noteroom     );
DECLARE_CMD_FUN( do_ocreate      );
DECLARE_CMD_FUN( do_ofind        );
DECLARE_CMD_FUN( do_ogrub        );
DECLARE_CMD_FUN( do_oinvoke      );
DECLARE_CMD_FUN( do_oldscore     );
DECLARE_CMD_FUN( do_olist        );
DECLARE_CMD_FUN( do_open         );
DECLARE_CMD_FUN( do_opentourney  );
DECLARE_CMD_FUN( do_order        );
DECLARE_CMD_FUN( do_oset         );
DECLARE_CMD_FUN( do_ostat        );
DECLARE_CMD_FUN( do_outcast      );
DECLARE_CMD_FUN( do_override     );
DECLARE_CMD_FUN( do_owhere       );
DECLARE_CMD_FUN( do_pardon       );
DECLARE_CMD_FUN( do_password     );
DECLARE_CMD_FUN( do_peace        );
DECLARE_CMD_FUN( do_pick         );
DECLARE_CMD_FUN( do_placevendor  );
DECLARE_CMD_FUN( do_poison_weapon);
DECLARE_CMD_FUN( do_pose         );
DECLARE_CMD_FUN( do_practice     );
DECLARE_CMD_FUN( do_pricevendor  );
DECLARE_CMD_FUN( do_prompt       );
DECLARE_CMD_FUN( do_pull         );
DECLARE_CMD_FUN( do_punch        );
DECLARE_CMD_FUN( do_purge        );
DECLARE_CMD_FUN( do_push         );
DECLARE_CMD_FUN( do_put          );
DECLARE_CMD_FUN( do_qpset        );
DECLARE_CMD_FUN( do_quaff        );
DECLARE_CMD_FUN( do_quit         );
DECLARE_CMD_FUN( do_rank         );
DECLARE_CMD_FUN( do_rat          );
DECLARE_CMD_FUN( do_rdelete      );
DECLARE_CMD_FUN( do_reboot       );
DECLARE_CMD_FUN( do_recall       );
DECLARE_CMD_FUN( do_recho        );
DECLARE_CMD_FUN( do_redit        );
DECLARE_CMD_FUN( do_regoto       );
DECLARE_CMD_FUN( do_remove       );
DECLARE_CMD_FUN( do_repair       );
DECLARE_CMD_FUN( do_repairset    );
DECLARE_CMD_FUN( do_repairshops  );
DECLARE_CMD_FUN( do_repairstat   );
DECLARE_CMD_FUN( do_reply        );
DECLARE_CMD_FUN( do_report       );
DECLARE_CMD_FUN( do_request      );
DECLARE_CMD_FUN( do_rescue       );
DECLARE_CMD_FUN( do_rest         );
DECLARE_CMD_FUN( do_reset        );
DECLARE_CMD_FUN( do_resetship    );
DECLARE_CMD_FUN( do_restore      );
DECLARE_CMD_FUN( do_restoretime  );
DECLARE_CMD_FUN( do_restrict     );
DECLARE_CMD_FUN( do_retire       );
DECLARE_CMD_FUN( do_retran       );
DECLARE_CMD_FUN( do_return       );
DECLARE_CMD_FUN( do_revert       );
DECLARE_CMD_FUN( do_rgrub        );
DECLARE_CMD_FUN( do_rlist        );
DECLARE_CMD_FUN( do_rreset       );
DECLARE_CMD_FUN( do_rstat        );
DECLARE_CMD_FUN( do_addsalary    );
DECLARE_CMD_FUN( do_save         );
DECLARE_CMD_FUN( do_savearea     );
DECLARE_CMD_FUN( do_say          );
DECLARE_CMD_FUN( do_scan         );
DECLARE_CMD_FUN( do_score        );
DECLARE_CMD_FUN( do_study       );
DECLARE_CMD_FUN( do_search       );
DECLARE_CMD_FUN( do_sedit        );
DECLARE_CMD_FUN( do_sell         );
DECLARE_CMD_FUN( do_sellhome     );
DECLARE_CMD_FUN( do_set_boot_time);
DECLARE_CMD_FUN( do_setclan      );
DECLARE_CMD_FUN( do_setship      );
DECLARE_CMD_FUN( do_shops        );
DECLARE_CMD_FUN( do_shopset      );
DECLARE_CMD_FUN( do_shopstat     );
DECLARE_CMD_FUN( do_shout        );
DECLARE_CMD_FUN( do_shove        );
DECLARE_CMD_FUN( do_showclan     );
DECLARE_CMD_FUN( do_showlayers     );
DECLARE_CMD_FUN( do_showship     );
DECLARE_CMD_FUN( do_shutdow      );
DECLARE_CMD_FUN( do_shutdown     );
DECLARE_CMD_FUN( do_silence      );
DECLARE_CMD_FUN( do_sit          );
DECLARE_CMD_FUN( do_sla          );
DECLARE_CMD_FUN( do_slay         );
DECLARE_CMD_FUN( do_sleep        );
DECLARE_CMD_FUN( do_slist        );
DECLARE_CMD_FUN( do_slookup      );
DECLARE_CMD_FUN( do_smoke        );
DECLARE_CMD_FUN( do_sneak        );
DECLARE_CMD_FUN( do_snoop        );
DECLARE_CMD_FUN( do_sober        );
DECLARE_CMD_FUN( do_socials      );
DECLARE_CMD_FUN( do_south        );
DECLARE_CMD_FUN( do_southeast    );
DECLARE_CMD_FUN( do_southwest    );
DECLARE_CMD_FUN( do_speak        );
DECLARE_CMD_FUN( do_split        );
DECLARE_CMD_FUN( do_sset         );
DECLARE_CMD_FUN( do_stand        );
DECLARE_CMD_FUN( do_starttourney );
DECLARE_CMD_FUN( do_steal        );
DECLARE_CMD_FUN( do_stun         );
DECLARE_CMD_FUN( do_supplicate   );
DECLARE_CMD_FUN( do_switch       );
DECLARE_CMD_FUN( do_tamp         );
DECLARE_CMD_FUN( do_tell         );
DECLARE_CMD_FUN( do_time         );
DECLARE_CMD_FUN( do_timecmd      );
DECLARE_CMD_FUN( do_title        );
DECLARE_CMD_FUN( do_track        );
DECLARE_CMD_FUN( do_toplevel     );
DECLARE_CMD_FUN( do_transfer     );
DECLARE_CMD_FUN( do_transship  );
DECLARE_CMD_FUN( do_trust        );
DECLARE_CMD_FUN( do_typo         );
DECLARE_CMD_FUN( do_unfoldarea   );
DECLARE_CMD_FUN( do_unhell       );
DECLARE_CMD_FUN( do_undock       );
DECLARE_CMD_FUN( do_unlock       );
DECLARE_CMD_FUN( do_unsilence    );
DECLARE_CMD_FUN( do_up           );
DECLARE_CMD_FUN( do_users        );
DECLARE_CMD_FUN( do_value        );
DECLARE_CMD_FUN( do_viewskills   );
DECLARE_CMD_FUN( do_visible      );
DECLARE_CMD_FUN( do_vnums        );
DECLARE_CMD_FUN( do_vsearch      );
DECLARE_CMD_FUN( do_wake         );
DECLARE_CMD_FUN( do_wartalk      );
DECLARE_CMD_FUN( do_wear         );
DECLARE_CMD_FUN( do_weather      );
DECLARE_CMD_FUN( do_west         );
DECLARE_CMD_FUN( do_where        );
DECLARE_CMD_FUN( do_who          );
DECLARE_CMD_FUN( do_whois        );
DECLARE_CMD_FUN( do_wimpy        );
DECLARE_CMD_FUN( do_wizhelp      );
DECLARE_CMD_FUN( do_wizlist      );
DECLARE_CMD_FUN( do_wizlock      );
DECLARE_CMD_FUN( do_yell         );
DECLARE_CMD_FUN( do_zap          );
DECLARE_CMD_FUN( do_zones        );
DECLARE_CMD_FUN( do_dock         );

/* mob prog stuff */
DECLARE_CMD_FUN( do_mp_close_passage );
DECLARE_CMD_FUN( do_mp_damage );
DECLARE_CMD_FUN( do_mp_restore );
DECLARE_CMD_FUN( do_mp_open_passage );
DECLARE_CMD_FUN( do_mp_slay);
DECLARE_CMD_FUN( do_mpasound     );
DECLARE_CMD_FUN( do_mpat         );
DECLARE_CMD_FUN( do_mpdream      );
DECLARE_CMD_FUN( do_mp_deposit   );
DECLARE_CMD_FUN( do_mp_withdraw  );
DECLARE_CMD_FUN( do_mpecho       );
DECLARE_CMD_FUN( do_mpechoaround );
DECLARE_CMD_FUN( do_mpechoat     );
DECLARE_CMD_FUN( do_mpedit       );
DECLARE_CMD_FUN( do_mpfind       );
DECLARE_CMD_FUN( do_opedit       );
DECLARE_CMD_FUN( do_opfind       );
DECLARE_CMD_FUN( do_rpedit       );
DECLARE_CMD_FUN( do_rpfind       );
DECLARE_CMD_FUN( do_mpforce      );
DECLARE_CMD_FUN( do_mpinvis      );
DECLARE_CMD_FUN( do_mpgoto       );
DECLARE_CMD_FUN( do_mpjunk       );
DECLARE_CMD_FUN( do_mpkill       );
DECLARE_CMD_FUN( do_mpmload      );
DECLARE_CMD_FUN( do_mpmset       );
DECLARE_CMD_FUN( do_mpnothing    );
DECLARE_CMD_FUN( do_mpoload      );
DECLARE_CMD_FUN( do_mposet       );
DECLARE_CMD_FUN( do_mppurge      );
DECLARE_CMD_FUN( do_mpstat       );
DECLARE_CMD_FUN( do_opstat       );
DECLARE_CMD_FUN( do_rpstat       );
DECLARE_CMD_FUN( do_mptransfer   );
DECLARE_CMD_FUN( do_mpapply      );
DECLARE_CMD_FUN( do_mpapplyb     );
DECLARE_CMD_FUN( do_mpgain       );

/*
 * Spell functions.
 * Defined in magic.c.
 */
DECLARE_SPELL_FUN( spell_null              );
DECLARE_SPELL_FUN( spell_notfound          );
DECLARE_SPELL_FUN( spell_affect            );
DECLARE_SPELL_FUN( spell_affectchar        );
DECLARE_SPELL_FUN( spell_area_attack       );
DECLARE_SPELL_FUN( spell_attack            );
DECLARE_SPELL_FUN( spell_black_lightning   );
DECLARE_SPELL_FUN( spell_blindness         );
DECLARE_SPELL_FUN( spell_cause_critical    );
DECLARE_SPELL_FUN( spell_cause_light       );
DECLARE_SPELL_FUN( spell_cause_serious     );
DECLARE_SPELL_FUN( spell_charm_person      );
DECLARE_SPELL_FUN( spell_create_mob        );
DECLARE_SPELL_FUN( spell_create_obj        );
DECLARE_SPELL_FUN( spell_cure_blindness    );
DECLARE_SPELL_FUN( spell_cure_poison       );
DECLARE_SPELL_FUN( spell_detect_poison     );
DECLARE_SPELL_FUN( spell_dispel_evil       );
DECLARE_SPELL_FUN( spell_dispel_magic      );
DECLARE_SPELL_FUN( spell_dream             );
DECLARE_SPELL_FUN( spell_earthquake        );
DECLARE_SPELL_FUN( spell_energy_drain      );
DECLARE_SPELL_FUN( spell_farsight          );
DECLARE_SPELL_FUN( spell_fireball          );
DECLARE_SPELL_FUN( spell_flamestrike       );
DECLARE_SPELL_FUN( spell_hand_of_chaos     );
DECLARE_SPELL_FUN( spell_harm              );
DECLARE_SPELL_FUN( spell_identify          );
DECLARE_SPELL_FUN( spell_invis             );
DECLARE_SPELL_FUN( spell_know_alignment    );
DECLARE_SPELL_FUN( spell_lightning_bolt    );
DECLARE_SPELL_FUN( spell_obj_inv           );
DECLARE_SPELL_FUN( spell_poison            );
DECLARE_SPELL_FUN( spell_possess           );
DECLARE_SPELL_FUN( spell_remove_invis      );
DECLARE_SPELL_FUN( spell_remove_trap       );
DECLARE_SPELL_FUN( spell_scorching_surge   );
DECLARE_SPELL_FUN( spell_shocking_grasp    );
DECLARE_SPELL_FUN( spell_sleep             );
DECLARE_SPELL_FUN( spell_smaug             );
DECLARE_SPELL_FUN( spell_ventriloquate     );
DECLARE_SPELL_FUN( spell_weaken            );

DECLARE_SPEC_FUN( spec_jedi );
DECLARE_SPEC_FUN( spec_dark_jedi );
DECLARE_SPEC_FUN( spec_fido );
DECLARE_SPEC_FUN( spec_guardian );
DECLARE_SPEC_FUN( spec_janitor );
DECLARE_SPEC_FUN( spec_poison );
DECLARE_SPEC_FUN( spec_thief );
DECLARE_SPEC_FUN( spec_auth );
DECLARE_SPEC_FUN( spec_stormtrooper );
DECLARE_SPEC_FUN( spec_rebel_trooper );
DECLARE_SPEC_FUN( spec_customs_smut );
DECLARE_SPEC_FUN( spec_customs_alcohol );
DECLARE_SPEC_FUN( spec_customs_weapons );
DECLARE_SPEC_FUN( spec_customs_spice );
DECLARE_SPEC_FUN( spec_police_attack );
DECLARE_SPEC_FUN( spec_police_undercover );
DECLARE_SPEC_FUN( spec_police_jail );
DECLARE_SPEC_FUN( spec_police_fine );
DECLARE_SPEC_FUN( spec_police );
DECLARE_SPEC_FUN( spec_clan_guard );
DECLARE_SPEC_FUN( spec_newbie_pilot );

/*
 * Our function prototypes.
 * One big lump ... this is every function in Merc.
 */

/* copyover.c */
void RecoverFromCopyover( void );

bool IsNameAcceptable( const std::string &name );
const char *DrunkSpeech( const std::string &argument, Character *ch );
void TalkChannel( Character *ch, const std::string &text,
                  int channel, const std::string &verb );
bool IsFollowingInCircle( const Character *ch, const Character *victim );
void StartFollowing( Character *ch, Character *master );
void StopFollowing( Character *ch );
void DieFollower( Character *ch );
bool IsInSameGroup( const Character *ach, const Character *bch );
void ToChannel( const std::string &argument, int channel,
                const std::string &verb, short level );
void TalkAuction( const std::string &argument );
bool CharacterKnowsLanguage( const Character *ch, int language, const Character *cch );
bool CharacterCanLearnLanguage( const Character *ch, int language );
int CountLanguages( int languages );

/* act_info.c */
bool RaceIsAvailableToPlayers( const Race *race );
int GetRaceFromName( const std::string &arg );
int GetClassFromName( const std::string &arg );
void ShowCharacterCondition( const Character *ch, const Character *victim );
char *FormatObjectToCharacter( const Object *obj, const Character *ch, bool fShort );
void ShowObjectListToCharacter( const Object *list, Character *ch,
                                bool fShort, bool fShowNothing );

/* act_move.c */
void SetBExitFlag( Exit *pexit, int flag );
void RemoveBExitFlag( Exit *pexit, int flag );
Room *GenerateExit( Room *in_room, Exit **pexit );
void ClearVirtualRooms( void );
Exit *FindDoor( Character *ch, const std::string &arg, bool quiet );
Exit *GetExit( const Room *room, DirectionType dir );
Exit *GetExitTo( const Room *room, DirectionType dir, vnum_t vnum );
Exit *GetExitNumber( const Room *room, short count );
ch_ret MoveCharacter( Character *ch, Exit *pexit, int fall = 0 );
void Teleport( Character *ch, vnum_t room, int flags );
bool CharacterFallIfNoFloor( Character *ch, int fall );

/* act_obj.c */
char *GetObjectShortDescription( const Object *obj );
bool RemoveObject( Character *ch, WearLocation iWear, bool fReplace );
obj_ret DamageObject( Object *obj );
short GetObjectResistance( const Object *obj );
void ObjectFallIfNoFloor( Object *obj, bool through );

/* act_wiz.c */
Room *FindLocation( const Character *ch, const std::string &arg );
void EchoToRoom( short AT_COLOR, const Room *room, const std::string &argument );
void EchoToRoomNoNewline( int ecolor, const Room *room, const std::string &argument );
void RealEchoToRoom( short color, const Room *room, const std::string &text, bool sendNewline );
void EchoToAll( short AT_COLOR, const std::string &argument, short tar );
void GenerateRebootString();

  /* const.c */
std::string FlagString(int bitvector,
                       const std::array<const char * const, MAX_BIT> &nameArray);
int GetSaveFlag(const std::string &txt);
const char *GetDirectionName( DirectionType dir );
DirectionType GetReverseDirection( DirectionType dir );
SpaceobjectType GetSpaceobjectType(const std::string &name);
SectorType GetSectorType(const std::string &type);
int GetAbility(const std::string &name);
size_t GetSpiceTableSize(void);
const char *GetSpiceTypeName( size_t spicetype );
size_t GetCrystalTableSize(void);
const char *GetCrystalTypeName( size_t crystaltype );
int GetCrystalType(const std::string &txt);
size_t GetWeaponTableSize( void );
const char *GetWeaponTypeName( size_t weapontype );
int GetWeaponType(const std::string &txt);
int GetAttackType(const std::string &txt);
size_t GetAttackTableSize( void );
const char *GetAttackTypeName( size_t type );
size_t GetSpellDamageSize( void );
const char *GetSpellDamageName( size_t type );
size_t GetSpellActionSize( void );
const char *GetSpellActionName( size_t type );
size_t GetSpellPowerSize( void );
const char *GetSpellPowerName( size_t type );
size_t GetSpellClassSize( void );
const char *GetSpellClassName( size_t type );
const char *GetSpellSavesName( size_t type );
const char *GetSpellTargetName( size_t type );
int GetSpiceType(const std::string &txt);
int GetNpcRace(const std::string &txt);
int GetMobFlag(const std::string &txt);
int GetPlayerFlag(const std::string &txt);
int GetPcFlag(const std::string &txt);
int GetResistanceFlag(const std::string &txt);
int GetBodyPartFlag(const std::string &txt);
int GetAttackFlag(const std::string &txt);
int GetDefenseFlag(const std::string &txt);
int GetLanguage(const std::string &txt);
int GetTrapTriggerFlag(const std::string &txt);
int GetRoomFlag(const std::string &txt);
int GetExitFlag(const std::string &txt);
int GetWearLocation(const std::string &txt);
int GetTrapFlag(const std::string &txt);
int GetAreaFlag(const std::string &txt);
ItemTypes GetObjectType(const std::string &txt);
int GetAffectType(const std::string &txt);
int GetAffectFlag(const std::string &txt);
int GetObjectFlag(const std::string &txt);
int GetWearFlag(const std::string &txt);
int GetMudProgFlag(const std::string &txt);
DirectionType GetDirection(const std::string &directionName);
int GetVipFlag(const std::string &txt);
int GetWantedFlag(const std::string &txt);
int GetPlanetFlag(const std::string &txt);
int GetSpellDamage(const std::string &txt);
int GetSpellAction(const std::string &txt);
int GetSpellClass(const std::string &txt);
int GetSpellPower(const std::string &txt);
int GetSpellFlag(const std::string &txt);
int GetSpellSave(const std::string &txt);
SkillTargetType GetSpellTarget(const std::string &txt);
PositionType GetPosition(const std::string &txt);
int GetCmdLog(const std::string &txt);
ShipClass GetShipClass(const std::string &txt);
ShipType GetShipType(const std::string &txt);
int GetShipFlag(const std::string &txt);
  
/* nanny.c */
void Nanny( Descriptor *d, char *argument );

/* comm.c */
int MakeColorSequence( const char *col, char *buf, Descriptor *d );
void CloseDescriptor( Descriptor *dclose, bool force );
bool WriteToDescriptor( socket_t desc, const std::string &txt, int length );
void WriteToBuffer( Descriptor *d, const std::string &txt, size_t length );
void SetCharacterColor( short AType, const Character *ch );
void Act( short AType, const std::string &format, Character *ch,
          const void *arg1, const void *arg2, int type );
socket_t InitializeSocket( short port );
bool CheckReconnect( Descriptor *d, const std::string &name, bool fConn );
unsigned char CheckPlaying( Descriptor *d, const std::string &name, bool kick );
bool CheckMultiplaying( Descriptor *d, const std::string &name );
void InitializeDescriptor(Descriptor *dnew, socket_t desc);
void FreeDescriptor( Descriptor *d );

/* comments.c */
void ReadComment( Character *ch, FILE *fp );
void WriteComments( const Character *ch, FILE *fp );

/* db.c */
void ShutdownMud( const std::string &reason );
void ShowVnums( const Character *ch, vnum_t low, vnum_t high, bool proto, bool shownl,
                const std::string &loadst, const std::string &notloadst );
void SaveSystemData( const SystemData sys );
void AppendFile( const Character *ch, const std::string &file, const std::string &str );
void ShowFile( const Character *ch, const std::string &filename );
void BootDatabase( bool fCopyover );
void AddCharacter( Character *ch );
Character *AllocateMobile( ProtoMobile *pMobIndex );
Character *CreateMobile( ProtoMobile *pMobIndex );
Object *CreateObject( ProtoObject *pObjIndex, int level );
Object *AllocateObject( ProtoObject *pObjIndex, int level );
char *GetExtraDescription( const std::string &name, ExtraDescription *ed );
ProtoMobile *GetProtoMobile( vnum_t vnum );
ProtoObject *GetProtoObject( vnum_t vnum );
Room *GetRoom( vnum_t vnum );
Room *MakeRoom( vnum_t vnum );
ProtoObject *MakeObject( vnum_t vnum, vnum_t cvnum, const std::string &name );
ProtoMobile *MakeMobile( vnum_t vnum, vnum_t cvnum, const std::string &name );
Exit *MakeExit( Room *pRoomIndex, Room *to_room, DirectionType door );
void RandomizeExits( Room *room, short maxdir );
void MakeWizlist( void );
bool DeleteRoom( Room *room );
bool DeleteObject( ProtoObject *obj );
bool DeleteMobile( ProtoMobile *mob );

/* build.c */
void EditMobProg( Character *ch, MPROG_DATA *mprg, int mptype, const std::string &argument );
void EditRoomProg( Character *ch, MPROG_DATA *mprg, int mptype, const std::string &argument );
void WriteAreaList( void );

bool CanModifyRoom( const Character *ch, const Room *room );
bool CanModifyObject( const Character *ch, const Object *obj  );
bool CanModifyCharacter( const Character *ch, const Character *mob );

bool CanMedit( const Character *ch, const ProtoMobile *mob );
void FreeReset( Area *are, Reset *res );
ExtraDescription *SetRExtra( Room *room, const std::string &keywords );
bool DelRExtra( Room *room, const std::string &keywords );
ExtraDescription *SetOExtra( Object *obj, const std::string &keywords );
bool DelOExtra( Object *obj, const std::string &keywords );
ExtraDescription *SetOExtraProto( ProtoObject *obj, const std::string &keywords );
bool DelOExtraProto( ProtoObject *obj, const std::string &keywords );
Reset *ParseReset( const Area *tarea, char *argument, const Character *ch );

/* fight.c */
ch_ret HitOnce( Character *ch, Character *victim, int dt );
long ComputeXP( const Character *gch, const Character *victim );
void ViolenceUpdate( void );
ch_ret HitMultipleTimes( Character *ch, Character *victim, int dt );
short ModifyDamageBasedOnResistance( const Character *ch, short dam, int ris );
ch_ret InflictDamage( Character *ch, Character *victim, int dam, int dt );
void UpdatePosition( Character *victim );
void StartFighting( Character *ch, Character *victim );
void StopFighting( Character *ch, bool fBoth );
void FreeFight( Character *ch );
Character *GetFightingOpponent( const Character *ch );
void StopHunting( Character *ch );
void StopHating( Character *ch );
void StopFearing( Character *ch );
void StartHunting( Character *ch, Character *victim );
void StartHating( Character *ch, Character *victim );
void StartFearing( Character *ch, Character *victim );
bool IsHunting( const Character *ch, const Character *victim );
bool IsHating( const Character *ch, const Character *victim );
bool IsFearing( const Character *ch, const Character *victim );
bool IsSafe( const Character *ch, const Character *victim );
bool CanLootVictim( const Character *ch, const Character *victim );
void RawKill( Character *killer, Character *victim );

/* makeobjs.c */
void MakeCorpse( Character *ch );
void MakeBloodstain( Character *ch );
void MakeScraps( Object *obj );
void MakeFire( Room *in_room, short timer );
Object *MakeTrap( int v0, int v1, int v2, int v3 );
Object *CreateMoney( int amount );

/* mapper.c */
void DrawMap( const Character *ch, const char *desc );

/* misc.c */
bool IsValidLanguage( int language );
void PullOrPush( Character *ch, Object *obj, bool pull );
void ActionDescription( Character *ch, Object *obj, void *vo );
const char *FormatDate( const time_t* );

/* mud_comm.c */
Character *GetCharacterInRoomMudProg( Character *ch, char *argument );
int GetColor(const char *argument);
const char *MobProgTypeToName( int type );

/* mud_prog.c */
void InitializeSupermob( void );
void MobProgWordlistCheck( const std::string &arg, Character *mob,
                           Character* actor, Object* object,
                           void* vo, int type );
void MobProgPercentCheck( Character *mob, Character* actor,
                          Object* object, void* vo, int type );
void MobProgActTrigger( const std::string &buf, Character* mob,
                        Character* ch, Object* obj, void* vo );
void MobProgBribeTrigger( Character* mob, Character* ch, int amount );
void MobProgEntryTrigger( Character* mob );
void MobProgGiveTrigger( Character* mob, Character* ch, Object* obj );
void MobProgGreetTrigger( Character* mob );
void MobProgFightTrigger( Character* mob, Character* ch );
void MobProgHitPercentTrigger( Character* mob, Character* ch );
void MobProgDeathTrigger( Character *killer, Character* mob );
void MobProgRandomTrigger( Character* mob );
void MobProgSpeechTrigger( char* txt, Character* mob );
void MobProgScriptTrigger( Character *mob );
void MobProgHourTrigger( Character *mob );
void MobProgTimeTrigger( Character *mob );
void ProgBug( const std::string &str, const Character *mob );
void RoomProgSetSupermob( Room *room );
void ReleaseSupermob( void );
void RoomActUpdate( void );
void ObjectActUpdate( void );

/* skills.c */
bool CheckParry( Character *ch, Character *victim );
bool CheckDodge( Character *ch, Character *victim );
bool CheckGrip( Character *ch, Character *victim );
void Disarm( Character *ch, Character *victim );
void Trip( Character *ch, Character *victim );

/* handler.c */
bool CharacterCanTakePrototype( const Character *ch );
void Explode( Object *obj );
long GetRequiredXpForLevel( short level );
void ModifyAffect( Character *ch, Affect *paf, bool fAdd );
void AffectToCharacter( Character *ch, Affect *paf );
void RemoveAffect( Character *ch, Affect *paf );
void StripAffect( Character *ch, int sn );
void JoinAffect( Character *ch, Affect *paf );
void CharacterFromRoom( Character *ch );
void CharacterToRoom( Character *ch, Room *pRoomIndex );
Object *ObjectToCharacter( Object *obj, Character *ch );
void ObjectFromCharacter( Object *obj );
int GetObjectArmorClass( const Object *obj, int iWear );
int CountOccurancesOfObjectInList( const ProtoObject *obj, const Object *list );
void ObjectFromRoom( Object *obj );
Object *ObjectToRoom( Object *obj, Room *pRoomIndex );
Object *ObjectToObject( Object *obj, Object *obj_to );
void ObjectFromObject( Object *obj );
void ExtractObject( Object *obj );
void ExtractExit( Room *room, Exit *pexit );
void ExtractRoom( Room *room );
void CleanRoom( Room *room );
void CleanObject( ProtoObject *obj );
void CleanMobile( ProtoMobile *mob );
void ExtractCharacter( Character *ch, bool fPull );
Character *GetCharacterInRoom( const Character *ch, const std::string &argument );
Character *GetCharacterAnywhere( const Character *ch, const std::string &argument );
Object *GetInstanceOfObject( const ProtoObject *pObjIndexData );
Object *GetObjectInList( const Character *ch, const std::string &argument, Object *list );
Object *GetObjectInListReverse( const Character *ch, const std::string &argument, Object *list );
Object *GetObjectHere( const Character *ch, const std::string &argument );
Object *GetObjectAnywhere( const Character *ch, const std::string &argument );
int GetObjectCount( const Object *obj );
int GetObjectWeight( const Object *obj );
bool IsRoomDark( const Room *pRoomIndex );
bool IsRoomPrivate( const Character *ch, const Room *pRoomIndex );
const char *GetItemTypeName( const Object *obj );
const char *GetAffectLocationName( int location );
ch_ret CheckObjectForTrap( Character *ch, const Object *obj, int flag );
ch_ret CheckRoomForTraps( Character *ch, int flag );
bool IsObjectTrapped( const Object *obj );
Object *GetTrap( const Object *obj );
ch_ret SpringTrap( Character *ch, Object *obj );
void ShowAffectToCharacter( const Character *ch, const Affect *paf );
void SetCurrentGlobalObject( Object *obj );
bool IsObjectExtracted( const Object *obj );
void QueueExtractedObject( Object *obj );
void CleanObjectQueue( void );
void SetCurrentGlobalCharacter( Character *ch );
bool CharacterDiedRecently( const Character *ch );
void QueueExtractedCharacter( Character *ch, bool extract );
void CleanCharacterQueue( void );
void AddTimerToCharacter( Character *ch, short type, short count, CmdFun *fun, int value );
Timer *GetTimerPointer( const Character *ch, short type );
short GetTimer( const Character *ch, short type );
void ExtractTimer( Character *ch, Timer *timer );
void RemoveTimer( Character *ch, short type );
bool InSoftRange( const Character *ch, const Area *tarea );
bool InHardRange( const Character *ch, const Area *tarea );
bool Chance( const Character *ch, short percent );
Object *CopyObject( const Object *obj );
void SplitGroupedObject( Object *obj, int num );
void SeparateOneObjectFromGroup( Object *obj );
bool EmptyObjectContents( Object *obj,Object *destobj,Room *destroom );
Object *FindObject( Character *ch, const std::string &argument, bool carryonly );
void BoostEconomy( Area *tarea, int gold );
void LowerEconomy( Area *tarea, int gold );
void EconomizeMobileGold( Character *mob );
bool EconomyHas( const Area *tarea, int gold );
int CountCharactersOnObject(const Object *obj);

/* interp.c */
bool CheckPosition( const Character *ch, PositionType position );
void Interpret( Character *ch, char *argument );
void SendTimer( struct timerset *vtime, Character *ch );
void UpdateNumberOfTimesUsed( struct timeval *time_used, struct timerset *userec );

/* magic.c */
int ModifySavingThrowBasedOnResistance( const Character *ch, int save_chance, int ris );
void SuccessfulCasting( Skill *skill, Character *ch,
                        Character *victim, Object *obj );
void FailedCasting( Skill *skill, Character *ch,
                    Character *victim, Object *obj );
bool IsImmuneToDamageType( const Character *ch, short damtype );
bool CheckSavingThrow( int sn, int level, const Character *ch, const Character *victim );
void ImmuneCasting( Skill *skill, Character *ch, Character *victim, Object *obj );
void *LocateSpellTargets( Character *ch, char *arg, int sn, Character **victim, Object **obj );
int FindSpell( const Character *ch, const std::string &name, bool know );
bool SaveVsPoisonDeath( int level, const Character *victim ) ;
bool SaveVsWands( int level, const Character *victim );
bool SaveVsParalyze( int level, const Character *victim );
bool SaveVsBreath( int level, const Character *victim );
bool SaveVsSpellStaff( int level, const Character *victim );
ch_ret CastSpellWithObject( int sn, int level, Character *ch, Character *victim, Object *obj );
int ParseDice( const Character *ch, int level, const std::string &exp );

/* save.c */
void SaveCharacter( Character *ch );
void SaveClone( Character *ch );
bool LoadCharacter( Descriptor *d, const std::string &name, bool preload );
void SetAlarm( long seconds );
void WriteObject( const Character *ch, const Object *obj, FILE *fp,
                  int iNest, short os_type );
void ReadObject( Character *ch,  FILE *fp, short os_type );
void DeEquipCharacter( Character *ch );
void ReEquipCharacter( Character *ch );
void SaveHome( Character *ch );
void SaveStoreroom( const Room *room );
void LoadStorerooms( void );
void LoadCorpses( void );
void WriteCorpses( const Character *ch, std::string name );

/* special.c */
SpecFun *SpecialLookup( const std::string &name );
const char *LookupSpecial( SpecFun *special );

/* tables.c */
SpellFun *GetSpellFunction( const std::string &name );
CmdFun *GetSkillFunction( const std::string &name );

/* update.c */
void AdvanceLevel( Character *ch , int ability );
void GainXP( Character *ch, short ability, long gain );
long LoseXP( Character *ch, short ability, long loss );
void GainCondition( Character *ch, int iCond, int value );
void UpdateHandler( void );
void RebootCheck( time_t reset );
void RemovePortal( Object *portal );
int GetMaxAbilityLevel( const Character *ch, int ability );

/* newscore.c */
const char *GetCharacterRace( const Character *ch );

/*
 * mudprograms stuff
 */
extern Character *supermob;

void ObjProgSpeechTrigger( const std::string &txt, Character *ch );
void ObjProgRandomTrigger( Object *obj );
void ObjProgWearTrigger( Character *ch, Object *obj );
bool ObjProgUseTrigger( Character *ch, Object *obj,
                        Character *vict, Object *targ, void *vo );
void ObjProgRemoveTrigger( Character *ch, Object *obj );
void ObjProgExamineTrigger( Character *ch, Object *obj );
void ObjProgSacTrigger( Character *ch, Object *obj );
void ObjProgDamageTrigger( Character *ch, Object *obj );
void ObjProgRepairTrigger( Character *ch, Object *obj );
void ObjProgDropTrigger( Character *ch, Object *obj );
void ObjProgZapTrigger( Character *ch, Object *obj );
void ObjProgGreetTrigger( Character *ch );
void ObjProgGetTrigger( Character *ch, Object *obj );
char *ObjProgTypeToName( int type );
void ObjProgPullTrigger( Character *ch, Object *obj );
void ObjProgPushTrigger( Character *ch, Object *obj );

void RoomProgLeaveTrigger( Character *ch );
void RoomProgEnterTrigger( Character *ch );
void RoomProgSleepTrigger( Character *ch );
void RoomProgRestTrigger( Character *ch );
void RoomProgFightTrigger( Character *ch );
void RoomProgDeathTrigger( Character *killer, Character *ch );
void RoomProgSpeechTrigger( char *txt, Character *ch );
void RoomProgRandomTrigger( Character *ch );
void RoomProgTimeTrigger( Character *ch );
void RoomProgHourTrigger( Character *ch );
char *RoomProgTypeToName(int type );

void ObjProgActTrigger( const std::string &buf, Object *mobj, Character *ch,
                        Object *obj, void *vo );
void RoomProgActTrigger( const std::string &buf, Room *room, Character *ch,
                         Object *obj, void *vo );

#define GET_BETTED_ON(ch)    ((ch)->BettedOn)
#define GET_BET_AMT(ch) ((ch)->BetAmount)
#define IN_ARENA(ch)            (IsBitSet((ch)->InRoom->Flags, ROOM_ARENA))

#endif /* include guard */
