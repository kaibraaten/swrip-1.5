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

#ifndef _SWRIP_MUD_H_
#define _SWRIP_MUD_H_

#include <utility.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

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

#ifndef __MORPHOS__
#include <math.h> /* built-in */
#endif

#include "types.h"
#include "alias.h"
#include "constants.h"

/*
 * do_who output structure -- Narn
 */
struct WhoData
{
  WhoData *Previous;
  WhoData *Next;
  char     *Text;
  int       Type;
};

/*
 * Site ban structure.
 */
struct Ban
{
  Ban *Next;
  Ban *Previous;
  char     *Name;
  int       Level;
  char     *BanTime;
};

struct TimeInfo
{
  int Hour;
  int Day;
  int Month;
  int Year;
};

struct HourMinSec
{
  int Hour;
  int Minute;
  int Second;
  int Manual;
};

struct Weather
{
  int Mmhg;
  int Change;
  int Sky;
  int Sunlight;
};

/*
 * Structure used to build wizlist
 */
struct Wizard
{
  Wizard *Next;
  Wizard *Last;
  char   *Name;
  short   Level;
};

/*
 * Descriptor (channel) structure.
 */
struct Descriptor
{
  Descriptor *Next;
  Descriptor *Previous;
  Descriptor *SnoopBy;
  struct Character *Character;
  struct Character *Original;

  struct
  {
    char *Hostname;
    char *HostIP;
    short Port;
  } Remote;

  socket_t  Socket;
  short     ConnectionState;
  short     Idle;
  bool      fCommand;
  char      InBuffer[MAX_INBUF_SIZE];
  char      InComm[MAX_INPUT_LENGTH];
  char      InLast[MAX_INPUT_LENGTH];
  int       Repeat;
  char     *OutBuffer;
  unsigned  long OutSize;
  int       OutTop;

  struct
  {
    char          *PageBuffer;
    unsigned long  PageSize;
    int            PageTop;
    char          *PagePoint;
    signed char    PageCommand;
    char           PageColor;
  } Pager;

  int           NewState;
  unsigned char PreviousColor;
};

/*
 * Attribute bonus structures.
 */
struct StrengthBonusType
{
  short ToHit;
  short ToDamage;
  short Carry;
  short Wield;
};

struct IntelligenceBonusType
{
  short Learn;
};

struct WisdomBonusType
{
  short Practice;
};

struct DexterityBonusType
{
  short Defensive;
};

struct ConstitutionBonusType
{
  short HitPoint;
  short Shock;
};

struct CharismaBonusType
{
  short Charm;
};

struct LuckBonusType
{
  short Luck;
};

struct ForceBonusType
{
  short Force;
};

struct Shop
{
  Shop *Next;                  /* Next shop in list            */
  Shop *Previous;                  /* Previous shop in list        */
  vnum_t     Keeper;                /* Vnum of shop keeper mob      */
  ItemTypes  BuyType[MAX_TRADE];   /* Item types shop will buy     */
  short      ProfitBuy;            /* Cost multiplier for buying   */
  short      ProfitSell;           /* Cost multiplier for selling  */

  struct
  {
    short Open;              /* First opening hour           */
    short Close;             /* First closing hour           */
  } BusinessHours;
};

struct RepairShop
{
  RepairShop *Next;                /* Next shop in list            */
  RepairShop *Previous;                /* Previous shop in list        */
  vnum_t       Keeper;              /* Vnum of shop keeper mob      */
  ItemTypes FixType[MAX_FIX];   /* Item types shop will fix     */
  short        ProfitFix;          /* Cost multiplier for fixing   */
  short       ShopType;            /* Repair shop type             */

  struct
  {
    short Open;              /* First opening hour           */
    short Close;             /* First closing hour           */
  } BusinessHours;
};


/* Mob program structures */
struct act_prog_data
{
  struct act_prog_data *Next;
  void                 *vo;
};

struct mob_prog_act_list
{
  MPROG_ACT_LIST *Next;
  char           *buf;
  Character      *ch;
  Object       *obj;
  void           *vo;
};

struct mob_prog_data
{
  MPROG_DATA *Next;
  int         type;
  bool        triggered;
  int         resetdelay;
  char       *arglist;
  char       *comlist;
};

extern bool MOBtrigger;
extern bool mud_down;

/* race dedicated stuff */
struct Race
{
  char Name[20];   /* Race name                    */
  int Affected;               /* Default affect bitvectors    */

  struct
  {
    short ModStr;               /* Str bonus/penalty            */
    short ModDex;               /* Dex      "                   */
    short ModWis;               /* Wis      "                   */
    short ModInt;               /* Int      "                   */
    short ModCon;               /* Con      "                   */
    short ModCha;               /* Cha      "                   */
    short ModLck;               /* Lck      "                   */
    short ModFrc;               /* Frc      "                   */
  } Stats;

  int AbilityMod[MAX_ABILITY];

  short Hit;
  short Mana;
  int   Resistant;
  int   Susceptible;
  int   ClassRestriction;      /* Flags for illegal classes    */
  int   Language;               /* Default racial language      */
};

struct Storeroom
{
  Storeroom       *Next;
  Storeroom       *Previous;
  vnum_t           Vnum;
  struct Room *Room;
};

struct Planet
{
  Planet *Next;
  Planet *Previous;
  struct Spaceobject *Spaceobject;
  Area *FirstArea;
  Area *LastArea;
  char *Name;
  long BaseValue;
  Clan *GovernedBy;
  int Population;
  int Flags;
  float PopularSupport;
};

/*
 * Data structure for notes.
 */
struct Note
{
  Note *Next;
  Note *Previous;
  char *Sender;
  char *Date;
  char *ToList;
  char *Subject;
  bool Voting;
  char *YesVotes;
  char *NoVotes;
  char *Abstentions;
  char *Text;
};

struct Board
{
  Board *Next;                    /* Next board in list              */
  Board *Previous;                    /* Previous board in list          */
  Note *FirstNote;              /* First note on board             */
  Note *LastNote;               /* Last note on board              */
  char *Name;             /* Filename to save notes to       */
  char *ReadGroup;            /* Can restrict a board to a       */
  char *PostGroup;            /* council, clan, guild etc        */
  char *ExtraReaders;         /* Can give read rights to players */
  char *ExtraRemovers;        /* Can give remove rights to players */
  vnum_t BoardObject;             /* Vnum of board object            */
  short NumberOfPosts;             /* Number of notes on this board   */
  short MinReadLevel;        /* Minimum level to read a note    */
  short MinPostLevel;        /* Minimum level to post a note    */
  short MinRemoveLevel;      /* Minimum level to remove a note  */
  short MaxPosts;             /* Maximum amount of notes allowed */
  int Type;                  /* Normal board or mail board? */
};


/*
 * An affect.
 */
struct Affect
{
  Affect *Next;
  Affect *Previous;
  short Type;
  short Duration;
  short Location;
  int   Modifier;
  int   AffectedBy;
};


/*
 * A SMAUG spell
 */
struct SmaugAffect
{
  SmaugAffect *Next;
  char *Duration;
  short Location;
  char *Modifier;
  int   AffectedBy;
};

struct Timer
{
  Timer  *Previous;
  Timer  *Next;
  CmdFun *DoFun;
  int     Value;
  short   Type;
  short   Count;
};

/*
 * Prototype for a mob.
 * This is the in-memory version of #MOBILES.
 */
struct ProtoMobile
{
  ProtoMobile *Next;
  ProtoMobile *NextSort;
  SpecFun *spec_fun;
  SpecFun *spec_2;
  struct Shop *Shop;
  struct RepairShop *RepairShop;
  char           *Name;
  char           *ShortDescr;
  char           *LongDescr;
  char           *Description;
  vnum_t          Vnum;
  short           Count;
  short           Killed;
  SexType           Sex;
  short           Level;
  int             Flags;
  int             AffectedBy;
  short           Alignment;
  short           MobThac0;               /* Unused */
  short           ArmorClass;
  short           HitNoDice;
  short           HitSizeDice;
  short           HitPlus;
  short           DamNoDice;
  short           DamSizeDice;
  short           DamPlus;
  short           NumberOfAttacks;
  int             Gold;
  int             exp;
  int             BodyParts;
  int             Resistant;
  int             Immune;
  int             Susceptible;
  int             AttackFlags;
  int             DefenseFlags;
  int             Speaks;
  int             Speaking;
  PositionType    Position;
  PositionType    DefaultPosition;
  short           Height;
  short           Weight;
  short           Race;
  short           HitRoll;
  short           DamRoll;
  int             VipFlags;

  struct
  {
    MPROG_DATA *mudprogs;
    int progtypes;
  } mprog;

  struct
  {
    short PermStr;
    short PermInt;
    short PermWis;
    short PermDex;
    short PermCon;
    short PermCha;
    short PermLck;
    short PermFrc;
  } Stats;

  struct
  {
    short PoisonDeath;
    short Wand;
    short ParaPetri;
    short Breath;
    short SpellStaff;
  } Saving;
};


struct HuntHateFear
{
  char      *Name;
  Character *Who;
};

struct Fight
{
  Character *Who;
  long        Xp;
  short      Align;
  short      Duration;
  short      TimesKilled;
};

struct ExtractedCharacter
{
  ExtractedCharacter *Next;
  struct Character         *Character;
  Room *InRoom;
  ch_ret             RetCode;
  bool               Extract;
};

struct KilledData
{
  vnum_t Vnum;
  char  Count;
};

#ifdef SWRIP_USE_IMC
#include "imc.h"
#endif

/*
 * Data which only PC's have.
 */
struct PCData
{
  char *Password;

  struct
  {
    struct Clan *Clan;
    char *ClanName;
    int Salary;
    long SalaryDate;
  } ClanInfo;

  char *HomePage;
  char *Email;

  char *BamfIn;
  char *BamfOut;

  char *Rank;
  char *Title;

  char *Bestowments;    /* Special bestowed commands       */
  int Flags;            /* Whether the player is deadly and whatever else we add.      */

  int PKills;         /* Number of pkills on behalf of clan */
  int PDeaths;        /* Number of times pkilled (legally)  */
  int MKills;         /* Number of mobs killed                   */
  int MDeaths;        /* Number of deaths due to mobs       */
  int IllegalPk;     /* Number of illegal pk's committed   */

  long OutcastTime;     /* The time at which the char was outcast */
  long RestoreTime;     /* The last time the char did a restore all */

  struct
  {
    struct Area *Area;

    struct
    {
      struct
      {
	vnum_t First;
	vnum_t Last;
      } Room, Mob, Object;
    } VnumRanges;
  } Build;
  
  short WizInvis;       /* wizinvis level */
  short MinSnoop;      /* minimum snoop level */
  int Condition[MAX_CONDS];
  short Learned[MAX_SKILL];
  KilledData Killed[MAX_KILLTRACK];
  int AuthState;
  time_t ReleaseDate;   /* Auto-helling.. Altrag */
  vnum_t JailVnum;
  char *HelledBy;
  char *Bio;            /* Personal Bio */
  char *AuthedBy;      /* what crazy imm authed this name ;) */
  char *Prompt;         /* User config prompts */
  char *SubPrompt;      /* Substate prompt */
  short PagerLength;       /* For pager (NOT menus) */
  bool OpenedTourney;
  short Addiction[10];
  short DrugLevel[10];
  int WantedFlags;
  long Bank;
  bool WhoCloak;

  char *BettedOn;
  int BetAmount;

  Alias *FirstAlias;
  Alias *LastAlias;

  Character *Pet;
  char *Target;
  struct Note *Note;
  struct Note *Comments;
  short Clones;
  int Played;
  time_t Logon;
  time_t SaveTime;
  struct CraftingSession *CraftingSession;
#ifdef SWRIP_USE_IMC
  IMC_CHARDATA *imcchardata;
#endif
};

/*
 * Liquids.
 */
struct LiquidType
{
  char  *Name;
  char  *Color;
  short  Affect[3];
};

/*
 * Extra description data for a room or object.
 */
struct ExtraDescription
{
  ExtraDescription *Next;       /* Next in list                     */
  ExtraDescription *Previous;       /* Previous in list                 */
  char             *Keyword;              /* Keyword in look/examine          */
  char             *Description;          /* What to see                      */
};

/*
 * Prototype for an object.
 */
struct ProtoObject
{
  ProtoObject   *Next;
  ProtoObject   *NextSort;
  ExtraDescription *FirstExtraDescription;
  ExtraDescription *LastExtraDescription;
  Affect      *FirstAffect;
  Affect      *LastAffect;
  char             *Name;
  char             *ShortDescr;
  char             *Description;
  char             *ActionDescription;
  vnum_t            Vnum;
  short             Level;
  ItemTypes         ItemType;
  int               Flags;
  int               WearFlags;
  short             Count;
  short             Weight;
  int               Cost;
  int               Value[MAX_OVAL];
  int               Serial;
  short             Layers;
  int               Rent;                   /* Unused */

  struct
  {
    MPROG_DATA *mudprogs;
    int progtypes;
  } mprog;
};


/*
 * One object.
 */
struct Object
{
  Object         *Next;
  Object         *Previous;
  Object         *NextContent;
  Object         *PreviousContent;
  Object         *FirstContent;
  Object         *LastContent;
  Object         *InObject;
  Character        *CarriedBy;
  ExtraDescription *FirstExtraDescription;
  ExtraDescription *LastExtraDescription;
  Affect      *FirstAffect;
  Affect      *LastAffect;
  ProtoObject   *Prototype;
  Room  *InRoom;
  char             *ArmedBy;
  char             *Name;
  char             *ShortDescr;
  char             *Description;
  char             *ActionDescription;
  ItemTypes         ItemType;
  int               Flags;
  int               WearFlags;
  int               BlasterSetting;
  WearLocation      WearLoc;
  short             Weight;
  int               Cost;
  short             Level;
  short             Timer;
  int               Value[MAX_OVAL];
  short             Count;          /* support for object grouping */
  int               Serial;         /* serial number               */

  struct
  {
    MPROG_ACT_LIST *mpact;
    int             mpactnum;
    short           mpscriptpos;
  } mprog;
};

/*
 * Exit data.
 */
struct Exit
{
  Exit       *Previous;           /* previous exit in linked list */
  Exit       *Next;           /* next exit in linked list     */
  Exit       *ReverseExit;          /* Reverse exit pointer         */
  Room *ToRoom;        /* Pointer to destination room  */
  char            *Keyword;        /* Keywords for exit or door    */
  char            *Description;    /* Description of exit          */
  vnum_t           Vnum;           /* Vnum of room exit leads to   */
  vnum_t           ReverseVnum;          /* Vnum of room in opposite dir */
  int              Flags;      /* door states & other flags    */
  vnum_t           Key;            /* Key vnum                     */
  DirectionType    Direction;           /* Physical "direction"         */
  short            Distance;       /* how far to the next room     */
};

/*
 * Area definition.
 */
struct Area
{
  Area   *Next;
  Area   *Previous;
  Area   *NextSort;
  Area   *PreviousSort;
  Reset  *FirstReset;
  Reset  *LastReset;
  struct Planet *Planet;
  Area   *NextOnPlanet;
  Area   *PreviousOnPlanet;
  char        *Name;
  char        *Filename;
  int          Flags;
  short        Status;  /* h, 8/11 */
  short        Age;
  short        NumberOfPlayers;
  short        ResetFrequency;

  struct
  {
    struct
    {
      vnum_t First;
      vnum_t Last;
    } Room, Mob, Object;
  } VnumRanges;

  struct
  {
    struct
    {
      int Low;
      int High;
    } Soft, Hard;
  } LevelRanges;

  char        *Author; /* Scryn */
  char        *ResetMessage; /* Rennard */
  Reset  *LastMobReset;
  Reset  *LastObjectReset;
  short        MaxPlayers;
  int          MKills;
  int          MDeaths;
  int          PKills;
  int          PDeaths;
  int          GoldLooted;
  int          IllegalPk;
  int          HighEconomy;
  int          LowEconomy;
};

/*
 * Used to keep track of system settings and statistics         -Thoric
 */
struct SystemData
{
  int    MaxPlayersThisBoot;             /* Maximum players this boot   */
  int    MaxPlayersEver;             /* Maximum players ever   */
  char  *TimeOfMaxPlayersEver;            /* Time of max ever */
  bool   NoNameResolving;      /* Hostnames are not resolved  */
  bool   DenyNewPlayers;       /* New players cannot connect  */
  bool   NewPlayersMustWaitForAuth;          /* New players must be auth'ed */
  short  ReadAllMail;          /* Read all player mail(was 54)*/
  short  ReadMailFree;         /* Read mail for free (was 51) */
  short  WriteMailFree;        /* Write mail for free(was 51) */
  short  TakeOthersMail;       /* Take others mail (was 54)   */
  short  LevelOfBuildChannel;
  short  LevelOfLogChannel;              /* Level of log channel LEVEL LOG*/
  short  LevelToModifyProto;     /* Level to modify prototype stuff LEVEL_CREATOR */
  short  LevelToOverridePrivateFlag; /* override private flag */
  short  LevelToMsetPlayers;      /* Level to mset a player */
  short  StunModPlrVsPlr;        /* Stun mod player vs. player */
  short  StunRegular;           /* Stun difficult */
  short  DamagePlrVsPlr;         /* Damage mod player vs. player */
  short  DamagePlrVsMob;         /* Damage mod player vs. mobile */
  short  DamageMobVsPlr;         /* Damage mod mobile vs. player */
  short  DamageMobVsMob;         /* Damage mod mobile vs. mobile */
  short  LevelToGetObjectsWithoutTakeFlag;     /* Get objects without take flag */
  short  LevelToForcePlayers;          /* The level at which you can use force on players. */
  short  MaxSN;                 /* Max skills */
  int    SaveFlags;             /* Toggles for saving conditions */
  short  SaveFrequency;         /* How old to autosave someone */
  short  Port;
  bool DisableHunger;
  bool CanChooseJedi;
#ifdef _WIN32
  HMODULE DlHandle;
#else
  void *DlHandle;
#endif
  unsigned char *MCCP_Buffer;
};

/*
 * Room type.
 */
struct Room
{
  Room  *Next;
  Room  *NextSort;
  Character        *FirstPerson;
  Character        *LastPerson;
  Object         *FirstContent;
  Object         *LastContent;
  ExtraDescription *FirstExtraDescription;
  ExtraDescription *LastExtraDescription;
  struct Area        *Area;
  Exit        *FirstExit;
  Exit        *LastExit;
  Ship        *FirstShip;
  Ship        *LastShip;
  char             *Name;
  char             *Description;
  vnum_t            Vnum;
  int               Flags;
  short             Light;
  SectorType Sector;
  vnum_t            TeleVnum;
  short             TeleDelay;
  short             Tunnel;              /* max people that will fit */
  Shuttle     *FirstShuttle;
  Shuttle     *LastShuttle;

  struct
  {
    MPROG_ACT_LIST *mpact;
    int             mpactnum;
    short           mpscriptpos;
    MPROG_DATA     *mudprogs;
    int             progtypes;
  } mprog;
};

/*
 * Delayed teleport type.
 */
struct TeleportData
{
  TeleportData   *Next;
  TeleportData   *Previous;
  Room *FromRoom;
  short            TeleportTimer;
};

struct timerset
{
  int            NumberOfTimesUsed;
  struct timeval TotalTime;
  struct timeval MinTime;
  struct timeval MaxTime;
};

struct Auction
{
  Object  *Item;   /* a pointer to the item */
  Character *Seller; /* a pointer to the seller - which may NOT quit */
  Character *Buyer;  /* a pointer to the buyer - which may NOT quit */
  int        Bet;    /* last bet - or 0 if noone has bet anything */
  short      Going;  /* 1,2, sold */
  short      Pulse;  /* how many pulses (.25 sec) until another call-out ? */
  int        Starting;
};

#define CHECK_SUBRESTRICTED(ch)                                         \
  do                                                                    \
    {                                                                   \
      if ( (ch)->SubState == SUB_RESTRICTED )                           \
        {                                                               \
          SendToCharacter( "You cannot use this command from within another command.\n\r", ch ); \
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

extern const struct StrengthBonusType StrengthBonus[];
extern const struct IntelligenceBonusType IntelligenceBonus[];
extern const struct WisdomBonusType WisdomBonus[];
extern const struct DexterityBonusType DexterityBonus[];
extern const struct ConstitutionBonusType ConstitutionBonus[];
extern const struct CharismaBonusType CharismaBonus[];
extern const struct LuckBonusType LuckBonus[];
extern const struct ForceBonusType ForceBonus[];

extern const struct Race RaceTable[];
extern const struct LiquidType LiquidTable[];
extern const char * const AbilityName[];
extern const char * const SpaceobjectTypeName[];
extern short const MovementLoss[];
/*extern const char * const dir_name[];*/
extern const char * const WhereName[];
/*extern const short rev_dir[];*/
extern const int TrapDoor[];
extern const char * const SectorNames[][2];
extern const int SentTotal[];
extern const char * const RoomSents[][25];
extern const char * const RoomFlags[];
extern const char * const WearFlags[];
extern const char * const ObjectFlags[];
extern const char * const ObjectTypes[];
extern const char * const AffectTypes[];
extern const char * const AffectFlags[];
extern const char * const MobFlags[];
extern const char * const WantedFlags[];
extern const char * const PlanetFlags[];
extern const char * const PlayerFlags[];
extern const char * const PcFlags[];
extern const char * const TrapFlags[];
extern const char * const RisFlags[];
extern const char * const TriggerFlags[];
extern const char * const PartFlags[];
extern const char * const NpcRace[];
extern const char * const DefenseFlags[];
extern const char * const AttackFlags[];
extern const char * const AreaFlags[];
extern const char * const WearLocations[];
extern const char * const ExitFlags[];
extern int const LanguageArray[];
extern const char * const LanguageNames[];
extern const char * const mprog_flags[];
extern const char * const SaveFlags[];
extern const char * const PositionName[MAX_POSITION];
extern const char * const CmdLogName[MAX_LOG];

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

extern Shop       *first_shop;
extern Shop       *last_shop;
extern RepairShop     *first_repair;
extern RepairShop     *last_repair;
extern Ban             *FirstBan;
extern Ban             *LastBan;
extern Character       *first_char;
extern Character       *last_char;
extern Descriptor      *FirstDescriptor;
extern Descriptor      *LastDescriptor;
extern Board           *FirstBoard;
extern Board           *LastBoard;
extern Object          *first_object;
extern Object          *last_object;
extern Ship            *first_ship;
extern Ship            *last_ship;
extern Planet          *FirstPlanet;
extern Planet          *LastPlanet;
extern Area            *first_area;
extern Area            *last_area;
extern Area            *first_build;
extern Area            *last_build;
extern Area            *first_asort;
extern Area            *last_asort;
extern Area            *first_bsort;
extern Area            *last_bsort;
extern TeleportData    *first_teleport;
extern TeleportData    *last_teleport;
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
DECLARE_CMD_FUN( do_pager        );
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
DECLARE_CMD_FUN( do_transfeship  );
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

#ifdef __cplusplus
extern "C" {
#endif

  /* copyover.c */
  void RecoverFromCopyover( void );

  bool IsNameAcceptable( const char *name );
  char *DrunkSpeech( const char *argument, Character *ch );
  void TalkChannel( Character *ch, const char *argument,
		     int channel, const char *verb );
  bool IsFollowingInCircle( const Character *ch, const Character *victim );
  void StartFollowing( Character *ch, Character *master );
  void StopFollowing( Character *ch );
  void DieFollower( Character *ch );
  bool IsInSameGroup( const Character *ach, const Character *bch );
  void ToChannel( const char *argument, int channel,
		   const char *verb, short level );
  void TalkAuction( const char *argument );
  bool CharacterKnowsLanguage( const Character *ch, int language, const Character *cch );
  bool CharacterCanLearnLanguage( const Character *ch, int language );
  int CountLanguages( int languages );

  /* act_info.c */
  int GetRaceFromName( const char *arg );
  int GetClassFromName( const char *arg );
  void ShowCharacterCondition( const Character *ch, const Character *victim );
  bool IsBlind( const Character *ch );
  char *FormatObjectToCharacter( const Object *obj, const Character *ch, bool fShort );
  void ShowObjectListToCharacter( const Object *list, Character *ch,
				  bool fShort, bool fShowNothing );

  /* act_move.c */
  bool HasKey( const Character *ch, vnum_t key );
  void SetBExitFlag( Exit *pexit, int flag );
  void RemoveBExitFlag( Exit *pexit, int flag );
  Room *GenerateExit( Room *in_room, Exit **pexit );
  void ClearVirtualRooms( void );
  Exit *FindDoor( Character *ch, const char *arg, bool quiet );
  Exit *GetExit( const Room *room, DirectionType dir );
  Exit *GetExitTo( const Room *room, DirectionType dir, vnum_t vnum );
  Exit *GetExitNumber( const Room *room, short count );
  ch_ret MoveCharacter( Character *ch, Exit *pexit, int fall );
  void Teleport( Character *ch, vnum_t room, int flags );
  short GetCarryEncumbrance( const Character *ch, short move );
  bool CharacterFallIfNoFloor( Character *ch, int fall );
  vnum_t WhereHome( const Character *ch );

  /* act_obj.c */
  char *GetObjectShortDescription( const Object *obj );
  bool RemoveObject( Character *ch, WearLocation iWear, bool fReplace );
  obj_ret DamageObject( Object *obj );
  short GetObjectResistance( const Object *obj );
  void ObjectFallIfNoFloor( Object *obj, bool through );

  /* act_wiz.c */
  void SaveBanlist( void );
  void CloseArea( Area *pArea );
  Room *FindLocation( const Character *ch, const char *arg );
  void EchoToRoom( short AT_COLOR, const Room *room, const char *argument );
  void EchoToRoomNoNewline( int ecolor, const Room *room, const char *argument );
  void RealEchoToRoom( short color, const Room *room, const char *text, bool sendNewline );
  void EchoToAll( short AT_COLOR, const char *argument, short tar );
  void GenerateRebootString( void );

  /* boards.c */
  void LoadBoards( void );
  Board *GetBoardFromObject( const Object *obj );
  Board *FindBoardHere( const Character *ch );
  void FreeNote( Note *pnote );
  void SaveBoards( void );
  bool SaveBoard( const Board *board, char dummyUserData );
  void OperateOnNote( Character *ch, char *arg_passed, bool IS_MAIL );
  void AttachNote(Character *ch);
  void CountMailMessages(const Character *ch);

  /* planets.c */
  Planet *GetPlanet( const char *name );
  void LoadPlanets( void );
  void SavePlanet( const Planet *planet );
  bool NewSavePlanet( const Planet *planet, int );
  long GetTaxes( const Planet *planet );

  /* const.c */
  int GetSaveFlag(const char*);
  const char *GetDirectionName( DirectionType dir );
  DirectionType GetReverseDirection( DirectionType dir );
  size_t GetSpaceobjectTypeSize( void );
  SpaceobjectType GetSpaceobjectType(const char *name);
  SectorType GetSectorType( const char *type );
  size_t GetSkillTypeNameSize( void );
  int GetSkillTypeName( const char *type );
  int GetAbility(const char *arg);
  size_t GetAbilityNameSize(void);
  size_t GetSpiceTableSize(void);
  const char *GetSpiceTypeName( size_t spicetype );
  size_t GetCrystalTableSize(void);
  const char *GetCrystalTypeName( size_t crystaltype );
  int GetCrystalType( const char* );
  size_t GetWeaponTableSize( void );
  const char *GetWeaponTypeName( size_t weapontype );
  int GetWeaponType( const char* );
  int GetAttackType( const char *type );
  size_t GetAttackTableSize( void );
  const char *GetAttackType_name( size_t type );
  size_t GetSpellDamageSize( void );
  const char *GetSpellDamageName( size_t type );
  size_t GetSpellActionSize( void );
  const char *GetSpellActionName( size_t type );
  size_t GetSpellPowerSize( void );
  const char *GetSpellPowerName( size_t type );
  size_t GetSpellClassSize( void );
  const char *GetSpellClassName( size_t type );
  size_t GetSpellFlagsSize( void );
  size_t GetSpellSavesSize( void );
  const char *GetSpellSavesName( size_t type );
  size_t GetSpellTargetSize( void );
  const char *GetSpellTargetName( size_t type );
  int GetSpiceType( const char* );
  int GetNpcRace( const char* );
  int GetMobFlag( const char* );
  int GetPlayerFlag( const char* );
  int GetPcFlag( const char* );
  int GetResistanceFlag( const char* );
  int GetBodyPartFlag( const char* );
  int GetAttackFlag( const char* );
  int GetDefenseFlag( const char* );
  int GetLanguage( const char* );
  int GetTrapTriggerFlag( const char* );
  int GetRoomFlag( const char* );
  int GetExitFlag( const char* );
  int GetWearLocation( const char* );
  int GetTrapFlag( const char* );
  int GetAreaFlag( const char* );
  ItemTypes GetObjectType( const char *type );
  int GetAffectType( const char *type );
  int GetAffectFlag( const char *flag );
  int GetObjectFlag( const char *flag );
  int GetWearFlag( const char *flag );
  int GetMudProgFlag( const char *flag );
  DirectionType GetDirection( const char *txt );
  int GetVipFlag( const char *flag );
  int GetWantedFlag( const char *flag );
  int GetPlanetFlag( const char *flag );
  int GetSpellDamage( const char *txt );
  int GetSpellAction( const char *txt );
  int GetSpellClass( const char *txt );
  int GetSpellPower( const char *txt );
  int GetSpellFlag( const char *txt );
  int GetSpellSave( const char *txt );
  SkillTargetType GetSpellTarget( const char *txt );
  PositionType GetPosition( const char *txt );
  int GetCmdLog( const char *txt );

  /* nanny.c */
  void Nanny( Descriptor *d, char *argument );

  /* comm.c */
  void CloseSocket( Descriptor *dclose, bool force );
  bool WriteToDescriptor( socket_t desc, char *txt, int length );
  void WriteToBuffer( Descriptor *d, const char *txt, size_t length );
  void WriteToPager( Descriptor *d, const char *txt, size_t length );
  void SendToCharacter( const char *txt, const Character *ch );
  void SendToPager( const char *txt, const Character *ch );
  void SetCharacterColor( short AType, const Character *ch );
  void SetPagerColor( short AType, const Character *ch );
  void Echo( const Character *ch, const char *fmt, ... );
  void PagerPrintf(const Character *ch, const char *fmt, ...);
  void Act( short AType, const char *format, Character *ch,
            const void *arg1, const void *arg2, int type );
  socket_t InitializeSocket( short port );
  bool CheckReconnect( Descriptor *d, const char *name, bool fConn );
  unsigned char CheckPlaying( Descriptor *d, const char *name, bool kick );
  bool CheckMultiplaying( Descriptor *d, const char *name );
  void InitializeDescriptor(Descriptor *dnew, socket_t desc);
  void FreeDescriptor( Descriptor *d );

  /* comments.c */
  void ReadComment( Character *ch, FILE *fp );
  void WriteComments( const Character *ch, FILE *fp );

  /* db.c */
  Area *GetArea( const char *nameOrFile );
  void ShowVnums( const Character *ch, vnum_t low, vnum_t high, bool proto, bool shownl,
		  const char *loadst, const char *notloadst );
  void SaveSystemData( const SystemData sys );
  void AppendFile( const Character *ch, const char *file, const char *str );
  void ShowFile( const Character *ch, const char *filename );
  void BootDatabase( bool fCopyover );
  void AreaUpdate( void );
  void AddCharacter( Character *ch );
  Character *AllocateMobile( ProtoMobile *pMobIndex );
  Character *CreateMobile( ProtoMobile *pMobIndex );
  Object *CreateObject( ProtoObject *pObjIndex, int level );
  Object *AllocateObject( ProtoObject *pObjIndex, int level );
  void ClearCharacter( Character *ch );
  void FreeCharacter( Character *ch );
  char *GetExtraDescription( const char *name, ExtraDescription *ed );
  ProtoMobile *GetProtoMobile( vnum_t vnum );
  ProtoObject *GetProtoObject( vnum_t vnum );
  Room *GetRoom( vnum_t vnum );
  void Bug( const char *str, ... );
  void BootLog( const char *str, ... );
  void LogPrintf( const char *fmt, ... );
  void LogStringPlus( const char *str, short log_type, short level );
  Room *MakeRoom( vnum_t vnum );
  ProtoObject *MakeObject( vnum_t vnum, vnum_t cvnum, char *name );
  ProtoMobile *MakeMobile( vnum_t vnum, vnum_t cvnum, char *name );
  Exit *MakeExit( Room *pRoomIndex, Room *to_room, DirectionType door );
  void FixAreaExits( Area *tarea );
  void LoadAreaFile( Area *tarea, const char *filename );
  void RandomizeExits( Room *room, short maxdir );
  void MakeWizlist( void );
  bool DeleteRoom( Room *room );
  bool DeleteObject( ProtoObject *obj );
  bool DeleteMobile( ProtoMobile *mob );

  void SortArea( Area *pArea, bool proto );

  /* build.c */
  void EditMobProg( Character *ch, MPROG_DATA *mprg, int mptype, char *argument );
  void EditRoomProg( Character *ch, MPROG_DATA *mprg, int mptype, char *argument );
  void WriteAreaList( void );

  bool CanModifyRoom( const Character *ch, const Room *room );
  bool CanModifyObject( const Character *ch, const Object *obj  );
  bool CanModifyCharacter( const Character *ch, const Character *mob );

  /*
   * This poorly named function is used in commands for setting
   * shops (do_makerepair, do_makeshop, do_repairset, do_shopset).
   * It's nearly identical to CanModifyCharacter() except that it
   * on the ProtoMobile structure.
   *
   * TODO: Find some way to avoid this duplicaton and/or
   *       rename the function.
   */
  bool CanMedit( const Character *ch, const ProtoMobile *mob );
  void FreeReset( Area *are, Reset *res );
  void FreeArea( Area *are );
  void AssignAreaTo( Character *ch );
  ExtraDescription *SetRExtra( Room *room, char *keywords );
  bool DelRExtra( Room *room, char *keywords );
  ExtraDescription *SetOExtra( Object *obj, char *keywords );
  bool DelOExtra( Object *obj, char *keywords );
  ExtraDescription *SetOExtraProto( ProtoObject *obj, char *keywords );
  bool DelOExtraProto( ProtoObject *obj, char *keywords );
  void FoldArea( Area *tarea, char *filename, bool install );
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
  bool IsInArena( const Character *ch );

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
  void ApplyJediBonus( Character *ch );
  void ApplySithPenalty( Character *ch );
  const char *HeSheIt( const Character *ch );
  const char *HimHerIt( const Character *ch );
  const char *HisHersIts( const Character *ch );
  const char *FormatDate( const time_t* );
  
  /* mud_comm.c */
  Character *GetCharacterInRoomMudProg( Character *ch, char *argument );
  int GetColor(const char *argument);
  const char *MobProgTypeToName( int type );

  /* mud_prog.c */
  void InitializeSupermob( void );
  void MobProgWordlistCheck( char * arg, Character *mob,
			     Character* actor, Object* object,
			     void* vo, int type );
  void MobProgPercentCheck( Character *mob, Character* actor,
			    Object* object, void* vo, int type );
  void MobProgActTrigger( char* buf, Character* mob,
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
  void ProgBug( const char *str, const Character *mob );
  void RoomProgSetSupermob( Room *room );
  void ReleaseSupermob( void );
  void RoomActUpdate( void );
  void ObjectActUpdate( void );

  /* player.c */
  void  SetCharacterTitle( Character *ch, const char *title );

  /* skills.c */
  bool CheckParry( Character *ch, Character *victim );
  bool CheckDodge( Character *ch, Character *victim );
  bool CheckGrip( Character *ch, Character *victim );
  void Disarm( Character *ch, Character *victim );
  void Trip( Character *ch, Character *victim );
  bool HasPermanentSneak( const Character *ch );

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
  void CleanResets( Area *tarea );
  void ExtractCharacter( Character *ch, bool fPull );
  Character *GetCharacterInRoom( const Character *ch, const char *argument );
  Character *GetCharacterAnywhere( const Character *ch, const char *argument );
  Object *GetInstanceOfObject( const ProtoObject *pObjIndexData );
  Object *GetObjectInList( const Character *ch, const char *argument, Object *list );
  Object *GetObjectInListReverse( const Character *ch, const char *argument, Object *list );
  Object *GetObjectHere( const Character *ch, const char *argument );
  Object *GetObjectAnywhere( const Character *ch, const char *argument );
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
  Object *FindObject( Character *ch, const char *argument, bool carryonly );
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
  int FindSpell( const Character *ch, const char *name, bool know );
  bool SaveVsPoisonDeath( int level, const Character *victim ) ;
  bool SaveVsWands( int level, const Character *victim );
  bool SaveVsParalyze( int level, const Character *victim );
  bool SaveVsBreath( int level, const Character *victim );
  bool SaveVsSpellStaff( int level, const Character *victim );
  ch_ret CastSpellWithObject( int sn, int level, Character *ch, Character *victim, Object *obj );
  int ParseDice( const Character *ch, int level, const char *exp );

  /* save.c */
  void SaveCharacter( Character *ch );
  void SaveClone( Character *ch );
  bool LoadCharacter( Descriptor *d, const char *name, bool preload );
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
  void WriteCorpses( const Character *ch, const char *name );

  /* shops.c */
  int GetCostToQuit( const Character *ch );

  /* special.c */
  SpecFun *SpecialLookup( const char *name );
  const char *LookupSpecial( SpecFun *special );

  /* tables.c */
  SpellFun *GetSpellFunction( const char *name );
  CmdFun *GetSkillFunction( const char *name );

  /* swskills.c */
  void AddReinforcements( Character *ch );

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

  void ObjProgSpeechTrigger( char *txt, Character *ch );
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

#define OPROG_ACT_TRIGGER
#ifdef OPROG_ACT_TRIGGER
  void ObjProgActTrigger( char *buf, Object *mobj, Character *ch,
                          Object *obj, void *vo );
#endif
#define RPROG_ACT_TRIGGER
#ifdef RPROG_ACT_TRIGGER
  void RoomProgActTrigger( char *buf, Room *room, Character *ch,
                          Object *obj, void *vo );
#endif

#define GET_BETTED_ON(ch)    ((ch)->BettedOn)
#define GET_BET_AMT(ch) ((ch)->BetAmount)
#define IN_ARENA(ch)            (IsBitSet((ch)->InRoom->Flags, ROOM_ARENA))

#ifdef __cplusplus
}
#endif

#endif /* include guard */
