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
struct who_data
{
  WHO_DATA *prev;
  WHO_DATA *next;
  char     *text;
  int       type;
};

/*
 * Site ban structure.
 */
struct Ban
{
  Ban *next;
  Ban *prev;
  char     *name;
  int       level;
  char     *ban_time;
};

struct time_info_data
{
  int hour;
  int day;
  int month;
  int year;
};

struct hour_min_sec
{
  int hour;
  int min;
  int sec;
  int manual;
};

struct weather_data
{
  int mmhg;
  int change;
  int sky;
  int sunlight;
};


/*
 * Structure used to build wizlist
 */
struct wizent
{
  WIZENT *next;
  WIZENT *last;
  char   *name;
  short   level;
};

/*
 * Descriptor (channel) structure.
 */
struct Descriptor
{
  Descriptor *next;
  Descriptor *prev;
  Descriptor *snoop_by;
  Character       *character;
  Character       *original;

  struct
  {
    char *hostname;
    char *hostip;
    short port;
  } remote;

  socket_t  descriptor;
  short     connection_state;
  short     idle;
  bool      fcommand;
  char      inbuf[MAX_INBUF_SIZE];
  char      incomm[MAX_INPUT_LENGTH];
  char      inlast[MAX_INPUT_LENGTH];
  int       repeat;
  char     *outbuf;
  unsigned  long outsize;
  int       outtop;

  struct
  {
    char          *pagebuf;
    unsigned long  pagesize;
    int            pagetop;
    char          *pagepoint;
    signed char    pagecmd;
    char           pagecolor;
  } pager;

  int           newstate;
  unsigned char prevcolor;
};

/*
 * Attribute bonus structures.
 */
struct str_app_type
{
  short tohit;
  short todam;
  short carry;
  short wield;
};

struct int_app_type
{
  short learn;
};

struct wis_app_type
{
  short practice;
};

struct dex_app_type
{
  short defensive;
};

struct con_app_type
{
  short hitp;
  short shock;
};

struct cha_app_type
{
  short charm;
};

struct lck_app_type
{
  short luck;
};

struct frc_app_type
{
  short force;
};

struct shop_data
{
  SHOP_DATA *next;                  /* Next shop in list            */
  SHOP_DATA *prev;                  /* Previous shop in list        */
  vnum_t     keeper;                /* Vnum of shop keeper mob      */
  short      buy_type[MAX_TRADE];   /* Item types shop will buy     */
  short      profit_buy;            /* Cost multiplier for buying   */
  short      profit_sell;           /* Cost multiplier for selling  */

  struct
  {
    short open;              /* First opening hour           */
    short close;             /* First closing hour           */
  } business_hours;
};

struct repairshop_data
{
  REPAIR_DATA *next;                /* Next shop in list            */
  REPAIR_DATA *prev;                /* Previous shop in list        */
  vnum_t       keeper;              /* Vnum of shop keeper mob      */
  short        fix_type[MAX_FIX];   /* Item types shop will fix     */
  short        profit_fix;          /* Cost multiplier for fixing   */
  short       shop_type;            /* Repair shop type             */

  struct
  {
    short open;              /* First opening hour           */
    short close;             /* First closing hour           */
  } business_hours;
};


/* Mob program structures */
struct act_prog_data
{
  struct act_prog_data *next;
  void                 *vo;
};

struct mob_prog_act_list
{
  MPROG_ACT_LIST *next;
  char           *buf;
  Character      *ch;
  Object       *obj;
  void           *vo;
};

struct mob_prog_data
{
  MPROG_DATA *next;
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
  char race_name[20];   /* Race name                    */
  int  affected;               /* Default affect bitvectors    */

  struct
  {
    short mod_str;               /* Str bonus/penalty            */
    short mod_dex;               /* Dex      "                   */
    short mod_wis;               /* Wis      "                   */
    short mod_int;               /* Int      "                   */
    short mod_con;               /* Con      "                   */
    short mod_cha;               /* Cha      "                   */
    short mod_lck;               /* Lck      "                   */
    short mod_frc;               /* Frc      "                   */
  } stats;

  int AbilityMod[MAX_ABILITY];

  short hit;
  short mana;
  int   resist;
  int   suscept;
  int   class_restriction;      /* Flags for illegal classes    */
  int   language;               /* Default racial language      */
};

struct membersort_data
{
  MS_DATA     *next;
  MS_DATA     *prev;
  MEMBER_DATA *member;
};

struct member_data
{
  char         *name;  /* Name of member */
  char         *since; /* Member since */
  int           mclass; /* class of member */
  int           level;  /* level of member */
  int           deaths; /* Pdeaths for clans, mdeaths for guilds/orders */
  int           kills;  /* Pkills for clans, mkills for guilds/orders */
  MEMBER_DATA  *next;  /* Next member */
  MEMBER_DATA  *prev;  /* Prev member */
};

struct member_list
{
  char          *name;          /* Clan name */
  MEMBER_DATA   *first_member;  /* First Member */
  MEMBER_DATA   *last_member;   /* Last Member */
  MEMBER_LIST   *next;          /* Next clan */
  MEMBER_LIST   *prev;          /* Prev clan */
};

struct Spaceobject
{
  Spaceobject  *next;
  Spaceobject  *prev;
  Planet *planet;
  char        *filename;
  char        *name;
  int          type;
  Vector3      pos;
  Vector3      head;
  int          speed;
  int          gravity;
  bool         trainer;

  struct
  {
    char  *locationa;
    char  *locationb;
    char  *locationc;
    vnum_t doca;
    vnum_t docb;
    vnum_t docc;
    bool   seca;
    bool   secb;
    bool   secc;
  } landing_site;
};

struct Bounty
{
  Bounty *next;
  Bounty *prev;
  char        *target;
  long         amount;
  char        *poster;
};

struct GuardData
{
  GuardData      *next;
  GuardData      *prev;
  GuardData      *next_on_planet;
  GuardData      *prev_on_planet;
  Character       *mob;
  Room *reset_loc;
  Planet     *planet;
};

struct Storeroom
{
  Storeroom       *next;
  Storeroom       *prev;
  vnum_t           vnum;
  Room *room;
};

struct Planet
{
  Planet *next;
  Planet *prev;
  Planet *next_in_system;
  Planet *prev_in_system;
  GuardData  *first_guard;
  GuardData  *last_guard;
  Spaceobject  *spaceobject;
  Area   *first_area;
  Area   *last_area;
  char        *name;
  char        *filename;
  long         base_value;
  Clan   *governed_by;
  int          population;
  bool         flags;
  float        pop_support;
};

struct Ship
{
  Ship       *next;
  Ship       *prev;
  Ship       *next_in_spaceobject;
  Ship       *prev_in_spaceobject;
  Ship       *next_in_room;
  Ship       *prev_in_room;
  Room *in_room;
  Spaceobject      *spaceobject;
  Spaceobject      *destin;
  char            *filename;
  char            *name;
  char            *personalname;
  char            *home;
  char            *description;
  char            *owner;
  char            *pilot;
  char            *copilot;
  char            *dest;
  short            type;
  ShipClass        sclass;
  short            comm;
  short            sensor;
  short            astro_array;
  short            hyperspeed;
  int              hyperdistance;
  int              orighyperdistance;
  short            realspeed;
  short            currspeed;
  short            goalspeed;
  short            shipstate;
  short            docking;
  short            statei0; /* ion state */
  short            statet0; /* laser state */
  short            statettractor;
  short            statetdocking;
  short            missiletype;
  short            missilestate;
  short            missiles;
  short            maxmissiles;
  short            torpedos;
  short            maxtorpedos;
  short            rockets;
  short            maxrockets;
  short            lasers;
  short            tractorbeam;
  short            manuever;
  short            dockingports;
  bool             bayopen;
  bool             hatchopen;
  bool             autorecharge;
  bool             autotrack;
  bool             autospeed;
  bool             tracking;
  int              tcount;
  bool             guard;
  Vector3          trackvector;          /* tx, ty, tz */
  Vector3          pos;              /* vx, vy, vz  */
  Vector3          head;               /* hx, hy, hz */
  Vector3          jump;      /* jx, jy, jz */
  Vector3          hyperpos;   /* cx, cy, cz */
  Vector3          originpos;       /* ox, oy, oz */
  int              maneuverdeg;
  int              maxenergy;
  int              energy;
  int              shield;
  int              maxshield;
  int              hull;
  int              maxhull;

  vnum_t           location;
  vnum_t           lastdoc;
  vnum_t           shipyard;

  struct
  {
    vnum_t first;
    vnum_t last;
    vnum_t cockpit;
    vnum_t entrance;
    vnum_t hanger;
    vnum_t engine;
    vnum_t navseat;
    vnum_t pilotseat;
    vnum_t coseat;
    vnum_t gunseat;
  } room;

  long             collision;
  Ship       *target0; /* target of main weapon systems (ie, not turrest) */
  Ship       *tractoredby;
  Ship       *tractored;
  Spaceobject      *currjump;
  Spaceobject      *lastsystem;
  short            chaff;
  short            maxchaff;
  bool             chaff_released;
  bool             autopilot;
  bool             opentube;
  Ship       *docked;
  short            alarm;
  short            ions;
  Character       *ch;
  Spaceobject      *inorbitof;
  int              count;
  Turret *turret[MAX_NUMBER_OF_TURRETS_IN_SHIP];
};

struct Missile
{
  Missile *next;
  Missile *prev;
  Missile *next_in_spaceobject;
  Missile *prev_in_spaceobject;
  Spaceobject   *spaceobject;
  Ship    *target;
  Ship    *fired_from;
  char         *fired_by;
  short         missiletype;
  short         age;
  int           speed;
  Vector3       pos;
  Vector3       head;
};

/*
 * Data structure for notes.
 */
struct Note
{
  Note *next;
  Note *prev;
  char      *sender;
  char      *date;
  char      *to_list;
  char      *subject;
  int        voting;
  char      *yesvotes;
  char      *novotes;
  char      *abstentions;
  char      *text;
};

struct Board
{
  Board *next;                    /* Next board in list              */
  Board *prev;                    /* Previous board in list          */
  Note  *first_note;              /* First note on board             */
  Note  *last_note;               /* Last note on board              */
  char       *note_file;             /* Filename to save notes to       */
  char       *read_group;            /* Can restrict a board to a       */
  char       *post_group;            /* council, clan, guild etc        */
  char       *extra_readers;         /* Can give read rights to players */
  char       *extra_removers;        /* Can give remove rights to players */
  vnum_t      board_obj;             /* Vnum of board object            */
  short       num_posts;             /* Number of notes on this board   */
  short       min_read_level;        /* Minimum level to read a note    */
  short       min_post_level;        /* Minimum level to post a note    */
  short       min_remove_level;      /* Minimum level to remove a note  */
  short       max_posts;             /* Maximum amount of notes allowed */
  int         type;                  /* Normal board or mail board? */
};


/*
 * An affect.
 */
struct Affect
{
  Affect *next;
  Affect *prev;
  short        type;
  short        duration;
  short        location;
  int          modifier;
  int          bitvector;
};


/*
 * A SMAUG spell
 */
struct SmaugAffect
{
  SmaugAffect *next;
  char      *duration;
  short      location;
  char      *modifier;
  int        bitvector;
};

struct Timer
{
  Timer  *prev;
  Timer  *next;
  DO_FUN *do_fun;
  int     value;
  short   type;
  short   count;
};

/*
 * Prototype for a mob.
 * This is the in-memory version of #MOBILES.
 */
struct ProtoMobile
{
  ProtoMobile *next;
  ProtoMobile *next_sort;
  SPEC_FUN       *spec_fun;
  SPEC_FUN       *spec_2;
  SHOP_DATA      *pShop;
  REPAIR_DATA    *rShop;
  char           *player_name;
  char           *short_descr;
  char           *long_descr;
  char           *description;
  vnum_t          vnum;
  short           count;
  short           killed;
  short           sex;
  short           level;
  int             act;
  int             affected_by;
  short           alignment;
  short           mobthac0;               /* Unused */
  short           ac;
  short           hitnodice;
  short           hitsizedice;
  short           hitplus;
  short           damnodice;
  short           damsizedice;
  short           damplus;
  short           numattacks;
  int             gold;
  int             exp;
  int             xflags;
  int             resistant;
  int             immune;
  int             susceptible;
  int             attacks;
  int             defenses;
  int             speaks;
  int             speaking;
  int             position;
  int             defposition;
  short           height;
  short           weight;
  short           race;
  short           hitroll;
  short           damroll;
  int             vip_flags;

  struct
  {
    MPROG_DATA *mudprogs;
    int progtypes;
  } mprog;

  struct
  {
    short perm_str;
    short perm_int;
    short perm_wis;
    short perm_dex;
    short perm_con;
    short perm_cha;
    short perm_lck;
    short perm_frc;
  } stats;

  struct
  {
    short poison_death;
    short wand;
    short para_petri;
    short breath;
    short spell_staff;
  } saving;
};


struct HuntHateFear
{
  char      *name;
  Character *who;
};

struct Fight
{
  Character *who;
  int        xp;
  short      align;
  short      duration;
  short      timeskilled;
};

struct ExtractedCharacter
{
  ExtractedCharacter *next;
  Character         *ch;
  Room   *room;
  ch_ret             retcode;
  bool               extract;
};

struct KilledData
{
  vnum_t vnum;
  char  count;
};

#ifdef SWRIP_USE_IMC
#include "imc.h"
#endif

/*
 * Data which only PC's have.
 */
struct PCData
{
  char *pwd;

  struct
  {
    struct Clan *Clan;
    char *ClanName;
    int Salary;
    long SalaryDate;
  } ClanInfo;

  char *homepage;
  char *email;

  char *bamfin;
  char *bamfout;

  char *rank;
  char *title;

  char *bestowments;    /* Special bestowed commands       */
  int flags;            /* Whether the player is deadly and whatever else we add.      */

  int pkills;         /* Number of pkills on behalf of clan */
  int pdeaths;        /* Number of times pkilled (legally)  */
  int mkills;         /* Number of mobs killed                   */
  int mdeaths;        /* Number of deaths due to mobs       */
  int illegal_pk;     /* Number of illegal pk's committed   */

  long outcast_time;     /* The time at which the char was outcast */
  long restore_time;     /* The last time the char did a restore all */

  Area *area;
  vnum_t r_range_lo;     /* room range */
  vnum_t r_range_hi;
  vnum_t m_range_lo;     /* mob range  */
  vnum_t m_range_hi;
  vnum_t o_range_lo;     /* obj range  */
  vnum_t o_range_hi;

  short wizinvis;       /* wizinvis level */
  short min_snoop;      /* minimum snoop level */
  short condition[MAX_CONDS];
  short learned[MAX_SKILL];
  KilledData killed[MAX_KILLTRACK];
  int auth_state;
  time_t release_date;   /* Auto-helling.. Altrag */
  vnum_t jail_vnum;
  char *helled_by;
  char *bio;            /* Personal Bio */
  char *authed_by;      /* what crazy imm authed this name ;) */
  char *prompt;         /* User config prompts */
  char *subprompt;      /* Substate prompt */
  short pagerlen;       /* For pager (NOT menus) */
  bool openedtourney;
  short addiction[10];
  short drug_level[10];
  int wanted_flags;
  long bank;
  bool whoCloak;

  char *betted_on;
  int bet_amt;

  Alias *first_alias;
  Alias *last_alias;

  Character *pet;
  char *target;
  Note *pnote;
  Note *comments;
  short clones;
  int played;
  time_t logon;
  time_t save_time;
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
  char  *liq_name;
  char  *liq_color;
  short  liq_affect[3];
};

/*
 * Extra description data for a room or object.
 */
struct ExtraDescription
{
  ExtraDescription *next;       /* Next in list                     */
  ExtraDescription *prev;       /* Previous in list                 */
  char             *keyword;              /* Keyword in look/examine          */
  char             *description;          /* What to see                      */
};



/*
 * Prototype for an object.
 */
struct ProtoObject
{
  ProtoObject   *next;
  ProtoObject   *next_sort;
  ExtraDescription *first_extradesc;
  ExtraDescription *last_extradesc;
  Affect      *first_affect;
  Affect      *last_affect;
  char             *name;
  char             *short_descr;
  char             *description;
  char             *action_desc;
  vnum_t            vnum;
  short             level;
  short             item_type;
  int               extra_flags;
  int               magic_flags; /*Need more bitvectors for spells - Scryn*/
  int               wear_flags;
  short             count;
  short             weight;
  int               cost;
  int               value[MAX_OVAL];
  int               serial;
  short             layers;
  int               rent;                   /* Unused */

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
  Object         *next;
  Object         *prev;
  Object         *next_content;
  Object         *prev_content;
  Object         *first_content;
  Object         *last_content;
  Object         *in_obj;
  Character        *carried_by;
  ExtraDescription *first_extradesc;
  ExtraDescription *last_extradesc;
  Affect      *first_affect;
  Affect      *last_affect;
  ProtoObject   *Prototype;
  Room  *in_room;
  char             *armed_by;
  char             *name;
  char             *short_descr;
  char             *description;
  char             *action_desc;
  short             item_type;
  int               extra_flags;
  int               magic_flags; /*Need more bitvectors for spells - Scryn*/
  int               wear_flags;
  int               blaster_setting;
  short             wear_loc;
  short             weight;
  int               cost;
  short             level;
  short             timer;
  int               value[MAX_OVAL];
  short             count;          /* support for object grouping */
  int               serial;         /* serial number               */

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
  Exit       *prev;           /* previous exit in linked list */
  Exit       *next;           /* next exit in linked list     */
  Exit       *rexit;          /* Reverse exit pointer         */
  Room *to_room;        /* Pointer to destination room  */
  char            *keyword;        /* Keywords for exit or door    */
  char            *description;    /* Description of exit          */
  vnum_t           vnum;           /* Vnum of room exit leads to   */
  vnum_t           rvnum;          /* Vnum of room in opposite dir */
  int              exit_info;      /* door states & other flags    */
  vnum_t           key;            /* Key vnum                     */
  short            vdir;           /* Physical "direction"         */
  short            distance;       /* how far to the next room     */
};

/*
 * Reset commands:
 *   '*': comment
 *   'M': read a mobile
 *   'O': read an object
 *   'P': put object in object
 *   'G': give object to mobile
 *   'E': equip object to mobile
 *   'H': hide an object
 *   'B': set a bitvector
 *   'T': trap an object
 *   'D': set state of door
 *   'R': randomize room exits
 *   'S': stop (end of list)
 */

/*
 * Area-reset definition.
 */
struct Reset
{
  Reset *next;
  Reset *prev;
  char        command;
  int         extra;
  int         arg1;
  int         arg2;
  int         arg3;
};

/*
 * Area definition.
 */
struct Area
{
  Area   *next;
  Area   *prev;
  Area   *next_sort;
  Area   *prev_sort;
  Reset  *first_reset;
  Reset  *last_reset;
  Planet *planet;
  Area   *next_on_planet;
  Area   *prev_on_planet;
  char        *name;
  char        *filename;
  int          flags;
  short        status;  /* h, 8/11 */
  short        age;
  short        nplayer;
  short        reset_frequency;
  vnum_t       low_r_vnum;
  vnum_t       hi_r_vnum;
  vnum_t       low_o_vnum;
  vnum_t       hi_o_vnum;
  vnum_t       low_m_vnum;
  vnum_t       hi_m_vnum;
  int          low_soft_range;
  int          hi_soft_range;
  int          low_hard_range;
  int          hi_hard_range;
  char        *author; /* Scryn */
  char        *resetmsg; /* Rennard */
  Reset  *last_mob_reset;
  Reset  *last_obj_reset;
  short        max_players;
  int          mkills;
  int          mdeaths;
  int          pkills;
  int          pdeaths;
  int          gold_looted;
  int          illegal_pk;
  int          high_economy;
  int          low_economy;
};

/*
 * Load in the gods building data. -- Altrag
 */
struct godlist_data
{
  GOD_DATA *next;
  GOD_DATA *prev;
  int       level;
  vnum_t    low_r_vnum;
  vnum_t    hi_r_vnum;
  vnum_t    low_o_vnum;
  vnum_t    hi_o_vnum;
  vnum_t    low_m_vnum;
  vnum_t    hi_m_vnum;
};

/*
 * Used to keep track of system settings and statistics         -Thoric
 */
struct SystemData
{
  int    maxplayers;             /* Maximum players this boot   */
  int    alltimemax;             /* Maximum players ever   */
  char  *time_of_max;            /* Time of max ever */
  bool   NO_NAME_RESOLVING;      /* Hostnames are not resolved  */
  bool   DENY_NEW_PLAYERS;       /* New players cannot connect  */
  bool   WAIT_FOR_AUTH;          /* New players must be auth'ed */
  short  read_all_mail;          /* Read all player mail(was 54)*/
  short  read_mail_free;         /* Read mail for free (was 51) */
  short  write_mail_free;        /* Write mail for free(was 51) */
  short  take_others_mail;       /* Take others mail (was 54)   */
  short  muse_level;             /* Level of muse channel */
  short  think_level;            /* Level of think channel LEVEL_HIGOD*/
  short  build_level;            /* Level of build channel LEVEL_BUILD*/
  short  log_level;              /* Level of log channel LEVEL LOG*/
  short  level_modify_proto;     /* Level to modify prototype stuff LEVEL_CREATOR */
  short  level_override_private; /* override private flag */
  short  level_mset_player;      /* Level to mset a player */
  short  stun_plr_vs_plr;        /* Stun mod player vs. player */
  short  stun_regular;           /* Stun difficult */
  short  dam_plr_vs_plr;         /* Damage mod player vs. player */
  short  dam_plr_vs_mob;         /* Damage mod player vs. mobile */
  short  dam_mob_vs_plr;         /* Damage mod mobile vs. player */
  short  dam_mob_vs_mob;         /* Damage mod mobile vs. mobile */
  short  level_getobjnotake;     /* Get objects without take flag */
  short  level_forcepc;          /* The level at which you can use force on players. */
  short  max_sn;                 /* Max skills */
  char  *guild_overseer;         /* Pointer to char containing the name of the */
  char  *guild_advisor;            /* guild overseer and advisor. */
  int    save_flags;             /* Toggles for saving conditions */
  short  save_frequency;         /* How old to autosave someone */
  short  port;
  bool disable_hunger;
#ifdef _WIN32
  HMODULE dl_handle;
#else
  void *dl_handle;
#endif
  unsigned char *mccp_buf;
};


/*
 * Room type.
 */
struct Room
{
  Room  *next;
  Room  *next_sort;
  Character        *first_person;
  Character        *last_person;
  Object         *first_content;
  Object         *last_content;
  ExtraDescription *first_extradesc;
  ExtraDescription *last_extradesc;
  Area        *area;
  Exit        *first_exit;
  Exit        *last_exit;
  Ship        *first_ship;
  Ship        *last_ship;
  char             *name;
  char             *description;
  vnum_t            vnum;
  int               room_flags;
  short             light;
  short             sector_type;
  vnum_t            tele_vnum;
  short             tele_delay;
  short             tunnel;              /* max people that will fit */
  Shuttle     *first_shuttle;
  Shuttle     *last_shuttle;

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
  TeleportData   *next;
  TeleportData   *prev;
  Room *room;
  short            timer;
};

struct timerset
{
  int            num_uses;
  struct timeval total_time;
  struct timeval min_time;
  struct timeval max_time;
};

/*
 * Skills include spells as a particular case.
 */
struct Skill
{
  char      *name;                   /* Name of skill                */
  SPELL_FUN *spell_fun;              /* Spell pointer (for spells)   */
  DO_FUN    *skill_fun;              /* Skill pointer (for skills)   */
  char      *fun_name;
  short      target;                 /* Legal targets                */
  int        minimum_position;       /* Position for caster / user   */
  short      slot;                   /* Slot for #OBJECT loading     */
  short      min_mana;               /* Minimum mana used            */
  short      beats;                  /* Rounds required to use skill */
  char      *noun_damage;            /* Damage message               */
  char      *msg_off;                /* Wear off message             */
  short      guild;                  /* Which guild the skill belongs to */
  short      min_level;              /* Minimum level to be able to cast */
  short      type;                   /* Spell/Skill/Weapon/Tongue    */
  int           flags;                  /* extra stuff                  */
  char      *hit_char;               /* Success message to caster    */
  char      *hit_vict;               /* Success message to victim    */
  char      *hit_room;               /* Success message to room      */
  char      *miss_char;              /* Failure message to caster    */
  char      *miss_vict;              /* Failure message to victim    */
  char      *miss_room;              /* Failure message to room      */
  char      *die_char;               /* Victim death msg to caster   */
  char      *die_vict;               /* Victim death msg to victim   */
  char      *die_room;               /* Victim death msg to room     */
  char      *imm_char;               /* Victim immune msg to caster  */
  char      *imm_vict;               /* Victim immune msg to victim  */
  char      *imm_room;               /* Victim immune msg to room    */
  char      *dice;                   /* Dice roll                    */
  int        value;                  /* Misc value                   */
  char       saves;                  /* What saving spell applies    */
  char       difficulty;             /* Difficulty of casting/learning */
  SmaugAffect *affects;                /* Spell affects, if any        */
  char      *components;             /* Spell components, if any     */
  char      *teachers;               /* Skill requires a special teacher */
  char       participants;           /* # of required participants   */
  struct timerset userec; /* Usage record                 */
  int        alignment;              /* for jedi powers */
};


struct Auction
{
  Object  *item;   /* a pointer to the item */
  Character *seller; /* a pointer to the seller - which may NOT quit */
  Character *buyer;  /* a pointer to the buyer - which may NOT quit */
  int        bet;    /* last bet - or 0 if noone has bet anything */
  short      going;  /* 1,2, sold */
  short      pulse;  /* how many pulses (.25 sec) until another call-out ? */
  int        starting;
};


/*
 * These are LookupSkill return values for common skills and spells.
 */
extern short gsn_starfighters;
extern short gsn_midships;
extern short gsn_capitalships;
extern short gsn_weaponsystems;
extern short gsn_navigation;
extern short gsn_shipsystems;
extern short gsn_tractorbeams;
extern short gsn_shipmaintenance;
extern short gsn_sabotage;
extern short gsn_spacecombat;
extern short gsn_spacecombat2;
extern short gsn_spacecombat3;
extern short gsn_shipdocking;
extern short gsn_jumpvector;
extern short gsn_speeders;
extern short gsn_speedercombat;
extern short gsn_reinforcements;
extern short gsn_postguard;
extern short gsn_addpatrol;
extern short gsn_eliteguard;
extern short gsn_specialforces;
extern short gsn_jail;
extern short gsn_smalltalk;
extern short gsn_propaganda;
extern short gsn_bribe;
extern short gsn_seduce;
extern short gsn_masspropaganda;
extern short gsn_gather_intelligence;
extern short gsn_torture;
extern short gsn_snipe;
extern short gsn_throw;
extern short gsn_disguise;
extern short gsn_cloak;
extern short gsn_mine;
extern short gsn_grenades;
extern short gsn_first_aid;
extern short gsn_beg;
extern short gsn_makeblade;
extern short gsn_makejewelry;
extern short gsn_makeblaster;
extern short gsn_makebowcaster;
extern short gsn_makeglowrod;
extern short gsn_makecomlink;
extern short gsn_makegrenade;
extern short gsn_makelandmine;
extern short gsn_makearmor;
extern short gsn_makeshield;
extern short gsn_makecontainer;
extern short gsn_lightsaber_crafting;
extern short gsn_spice_refining;
extern short gsn_fake_signal;
extern short gsn_slicing;
extern short gsn_detrap;
extern short gsn_backstab;
extern short gsn_circle;
extern short gsn_dodge;
extern short gsn_hide;
extern short gsn_peek;
extern short gsn_pick_lock;
extern short gsn_scan;
extern short gsn_skin;
extern short gsn_sneak;
extern short gsn_steal;
extern short gsn_gouge;
extern short gsn_track;
extern short gsn_search;
extern short gsn_dig;
extern short gsn_mount;
extern short gsn_bashdoor;
extern short gsn_cutdoor;
extern short gsn_berserk;
extern short gsn_hitall;
extern short gsn_pickshiplock;
extern short gsn_hijack;
extern short gsn_disarm;
extern short gsn_enhanced_damage;
extern short gsn_kick;
extern short gsn_parry;
extern short gsn_rescue;
extern short gsn_second_attack;
extern short gsn_third_attack;
extern short gsn_fourth_attack;
extern short gsn_fifth_attack;
extern short gsn_dual_wield;
extern short gsn_aid;

/* used to do specific lookups */
extern short gsn_first_spell;
extern short gsn_first_skill;
extern short gsn_first_weapon;
extern short gsn_first_tongue;
extern short gsn_top_sn;

/* spells */
extern short gsn_blindness;
extern short gsn_charm_person;
extern short gsn_aqua_breath;
extern short gsn_invis;
extern short gsn_mass_invis;
extern short gsn_poison;
extern short gsn_sleep;
extern short gsn_possess;
extern short gsn_fireball;           /* for fireshield  */
extern short gsn_lightning_bolt;     /* for shockshield */
extern short gsn_study;

/* newer attack skills */
extern short gsn_punch;
extern short gsn_bash;
extern short gsn_stun;
extern short gsn_bind;
extern short gsn_poison_weapon;
extern short gsn_climb;
extern short gsn_blasters;
extern short gsn_force_pikes;
extern short gsn_bowcasters;
extern short gsn_lightsabers;
extern short gsn_vibro_blades;
extern short gsn_flexible_arms;
extern short gsn_talonous_arms;
extern short gsn_bludgeons;
extern short gsn_grip;

/* languages */
extern short gsn_common;
extern short gsn_wookiee;
extern short gsn_twilek;
extern short gsn_rodian;
extern short gsn_hutt;
extern short gsn_mon_calamari;
extern short gsn_noghri;
extern short gsn_gamorrean;
extern short gsn_jawa;
extern short gsn_adarian;
extern short gsn_ewok;
extern short gsn_verpine;
extern short gsn_defel;
extern short gsn_trandoshan;
extern short gsn_chadra_fan;
extern short gsn_quarren;
extern short gsn_duinduogwuin;
extern short gsn_barabel;
extern short gsn_firrerreo;
extern short gsn_bothan;
extern short gsn_coynite;
extern short gsn_duros;
extern short gsn_gand;
extern short gsn_kubaz;
extern short gsn_togorian;
extern short gsn_yevethan;

#define ASSIGN_GSN(gsn, skill)                                  \
  do                                                            \
    {                                                           \
      if ( ((gsn) = LookupSkill((skill))) == -1 )              \
        fprintf( stderr, "ASSIGN_GSN: Skill %s not found.\n",   \
                 (skill) );                                     \
    } while(0)

#define CHECK_SUBRESTRICTED(ch)                                         \
  do                                                                    \
    {                                                                   \
      if ( (ch)->substate == SUB_RESTRICTED )                           \
        {                                                               \
          SendToCharacter( "You cannot use this command from within another command.\n\r", ch ); \
          return;                                                       \
        }                                                               \
    } while(0)


/*
 * Character macros.
 */
#define IS_OUTSIDE(ch)          (!IsBitSet(                               \
                                         (ch)->in_room->room_flags,     \
                                         ROOM_INDOORS) && !IsBitSet(      \
                                                                  (ch)->in_room->room_flags, \
                                                                  ROOM_SPACECRAFT) )

#define EXIT(ch, door)          ( GetExit( (ch)->in_room, door ) )

#define CAN_GO(ch, door)        (EXIT((ch),(door))                      \
                                 && (EXIT((ch),(door))->to_room != NULL) \
                                 && !IsBitSet(EXIT((ch), (door))->exit_info, EX_CLOSED))

#define IS_VALID_SN(sn)         ( (sn) >=0 && (sn) < MAX_SKILL  \
                                  && skill_table[(sn)]          \
                                  && skill_table[(sn)]->name )

#define IS_VALID_HERB(sn)       ( (sn) >=0 && (sn) < MAX_HERB   \
                                  && herb_table[(sn)]           \
                                  && herb_table[(sn)]->name )

#define SPELL_FLAG(skill, flag) ( IsBitSet((skill)->flags, (flag)) )
#define SPELL_DAMAGE(skill)     ( ((skill)->flags     ) & 7 )
#define SPELL_ACTION(skill)     ( ((skill)->flags >> 3) & 7 )
#define SPELL_CLASS(skill)      ( ((skill)->flags >> 6) & 7 )
#define SPELL_POWER(skill)      ( ((skill)->flags >> 9) & 3 )
#define SET_SDAM(skill, val)    ( (skill)->flags =  ((skill)->flags & SDAM_MASK) + ((val) & 7) )
#define SET_SACT(skill, val)    ( (skill)->flags =  ((skill)->flags & SACT_MASK) + (((val) & 7) << 3) )
#define SET_SCLA(skill, val)    ( (skill)->flags =  ((skill)->flags & SCLA_MASK) + (((val) & 7) << 6) )
#define SET_SPOW(skill, val)    ( (skill)->flags =  ((skill)->flags & SPOW_MASK) + (((val) & 3) << 9) )

/* RIS by gsn lookups. -- Altrag.
   Will need to add some || stuff for spells that need a special GSN. */

#define IS_FIRE(dt)             ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_FIRE )
#define IS_COLD(dt)             ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_COLD )
#define IS_ACID(dt)             ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_ACID )
#define IS_ELECTRICITY(dt)      ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_ELECTRICITY )
#define IS_ENERGY(dt)           ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_ENERGY )

#define IS_DRAIN(dt)            ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_DRAIN )

#define IS_POISON(dt)           ( IS_VALID_SN(dt) &&                    \
                                  SPELL_DAMAGE(skill_table[(dt)]) == SD_POISON )

/*
 * Object macros.
 */
#define CAN_WEAR(obj, part)     (IsBitSet((obj)->wear_flags,  (part)))
#define IS_OBJ_STAT(obj, stat)  (IsBitSet((obj)->extra_flags, (stat)))

/*
 * Structure for a command in the command lookup table.
 */
struct Command
{
  Command *next;
  char    *name;
  DO_FUN  *do_fun;
  char    *fun_name;
  int      position;
  short    level;
  int      log;
  struct timerset userec;
};

/*
 * Structure for a social in the socials table.
 */
struct Social
{
  Social *next;
  char       *name;
  char       *char_no_arg;
  char       *others_no_arg;
  char       *char_found;
  char       *others_found;
  char       *vict_found;
  char       *char_auto;
  char       *others_auto;
};

/*
 * Global constants.
 */
extern time_t last_restore_all_time;
extern time_t boot_time;  /* this should be moved down */
extern HOUR_MIN_SEC * set_boot_time;
extern struct tm *new_boot_time;
extern time_t new_boot_time_t;

extern const struct str_app_type str_app[];
extern const struct int_app_type int_app[];
extern const struct wis_app_type wis_app[];
extern const struct dex_app_type dex_app[];
extern const struct con_app_type con_app[];
extern const struct cha_app_type cha_app[];
extern const struct lck_app_type lck_app[];
extern const struct frc_app_type frc_app[];

extern const struct Race RaceTable[];
extern const struct LiquidType LiquidTable[];
extern const char* const ability_name[];

extern const char * const skill_tname[];
extern short const movement_loss[];
/*extern const char * const dir_name[];*/
extern const char * const where_name[];
/*extern const short rev_dir[];*/
extern const int trap_door[];
extern const char * const sect_names[][2];
extern const int sent_total[];
extern const char * const room_sents[][25];
extern const char * const mag_flags[];
extern const char * const room_flags[];
extern const char * const wear_flags[];
extern const char * const object_flags[];
extern const char * const object_types[];
extern const char * const affect_types[];
extern const char * const affected_flags[];
extern const char * const act_flags[];
extern const char * const planet_flags[];
extern const char * const plr_flags[];
extern const char * const pc_flags[];
extern const char * const trap_flags[];
extern const char * const ris_flags[];
extern const char * const trig_flags[];
extern const char * const part_flags[];
extern const char * const npc_race[];
extern const char * const defense_flags[];
extern const char * const attack_flags[];
extern const char * const area_flags[];
extern const char * const wear_locs[];
extern const char * const exit_flags[];
extern int const lang_array[];
extern const char * const lang_names[];
extern const char * const mprog_flags[];
extern const char * const save_flag[];

/*
 * Global variables.
 */
extern bool bootup;

extern int numobjsloaded;
extern int nummobsloaded;
extern int physicalobjects;
extern int num_descriptors;
extern struct SystemData sysdata;
extern int top_sn;
extern int top_vroom;
extern int top_herb;
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

extern Command         *command_hash[126];
extern Skill           *skill_table[MAX_SKILL];
extern Social          *social_index[27];
extern Character       *cur_char;
extern Room            *cur_room;
extern bool             cur_char_died;
extern ch_ret           global_retcode;
extern Skill           *herb_table[MAX_HERB];

extern int              cur_obj;
extern int              cur_obj_serial;
extern bool             cur_obj_extracted;
extern obj_ret          global_objcode;

extern SHOP_DATA       *first_shop;
extern SHOP_DATA       *last_shop;
extern REPAIR_DATA     *first_repair;
extern REPAIR_DATA     *last_repair;
extern Ban             *first_ban;
extern Ban             *last_ban;
extern Character       *first_char;
extern Character       *last_char;
extern Descriptor      *first_descriptor;
extern Descriptor      *last_descriptor;
extern Board           *first_board;
extern Board           *last_board;
extern Object          *first_object;
extern Object          *last_object;
extern MEMBER_LIST     *first_member_list;
extern MEMBER_LIST     *last_member_list;
extern GuardData       *first_guard;
extern GuardData       *last_guard;
extern Ship            *first_ship;
extern Ship            *last_ship;
extern Spaceobject     *first_spaceobject;
extern Spaceobject     *last_spaceobject;
extern Planet          *first_planet;
extern Planet          *last_planet;
extern Bounty          *first_bounty;
extern Bounty          *last_bounty;
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
extern TIME_INFO_DATA   time_info;
extern WEATHER_DATA     weather_info;
extern Auction         *auction;
extern struct act_prog_data *mob_act_list;

/*
 * Command functions.
 */
DECLARE_DO_FUN( do_test );
DECLARE_DO_FUN( do_craftingengine );
DECLARE_DO_FUN( do_copyover );
DECLARE_DO_FUN( do_nohelps      );
DECLARE_DO_FUN( do_skin         );
DECLARE_DO_FUN( do_dismiss      );
DECLARE_DO_FUN( do_draw );
DECLARE_DO_FUN( do_focusalias   );
DECLARE_DO_FUN( do_unfocusalias   );
DECLARE_DO_FUN( do_members      );
DECLARE_DO_FUN( do_roster       );
DECLARE_DO_FUN( do_scatter );
DECLARE_DO_FUN( do_delay );
DECLARE_DO_FUN( do_setplanet );
DECLARE_DO_FUN( do_makeplanet );
DECLARE_DO_FUN( do_planets );
DECLARE_DO_FUN( do_showplanet );
DECLARE_DO_FUN( do_showstatistic );
DECLARE_DO_FUN( do_showstatistic_web );
DECLARE_DO_FUN( do_teach );
DECLARE_DO_FUN( do_gather_intelligence );
DECLARE_DO_FUN( do_add_patrol );
DECLARE_DO_FUN( do_special_forces );
DECLARE_DO_FUN( do_jail );
DECLARE_DO_FUN( do_unjail );
DECLARE_DO_FUN( do_elite_guard );
DECLARE_DO_FUN( do_smalltalk );
DECLARE_DO_FUN( do_propaganda );
DECLARE_DO_FUN( do_bribe );
DECLARE_DO_FUN( do_seduce );
DECLARE_DO_FUN( do_mass_propaganda );
DECLARE_DO_FUN( do_copyship  );
DECLARE_DO_FUN( do_autopilot  );
DECLARE_DO_FUN( do_allspeeders  );
DECLARE_DO_FUN( do_speeders  );
DECLARE_DO_FUN( do_suicide  );
DECLARE_DO_FUN( do_gain  );
DECLARE_DO_FUN( do_train  );
DECLARE_DO_FUN( do_beg  );
DECLARE_DO_FUN( do_bank  );
DECLARE_DO_FUN( do_hijack  );
DECLARE_DO_FUN( do_pickshiplock  );
DECLARE_DO_FUN( do_shiptalk  );
DECLARE_DO_FUN( do_clone  );
DECLARE_DO_FUN( do_systemtalk );
DECLARE_DO_FUN( do_sabotage );
DECLARE_DO_FUN( do_spacetalk );
DECLARE_DO_FUN( do_hail );
DECLARE_DO_FUN( do_allships );
DECLARE_DO_FUN( do_appoint );
DECLARE_DO_FUN( do_demote );
DECLARE_DO_FUN( do_empower );
DECLARE_DO_FUN( do_capture );
DECLARE_DO_FUN( do_arm );
DECLARE_DO_FUN( do_chaff );
DECLARE_DO_FUN( do_clan_donate );
DECLARE_DO_FUN( do_clan_withdraw );
DECLARE_DO_FUN( do_drive );
DECLARE_DO_FUN( do_setblaster );
DECLARE_DO_FUN( do_ammo );
DECLARE_DO_FUN( do_takedrug );
DECLARE_DO_FUN( do_use );
DECLARE_DO_FUN( do_enlist );
DECLARE_DO_FUN( do_resign );
DECLARE_DO_FUN( do_pluogus );
DECLARE_DO_FUN( do_findserin );
DECLARE_DO_FUN( do_makearmor );
DECLARE_DO_FUN( do_makejewelry );
DECLARE_DO_FUN( do_makegrenade );
DECLARE_DO_FUN( do_makelandmine );
DECLARE_DO_FUN( do_makeglowrod );
DECLARE_DO_FUN( do_makecomlink );
DECLARE_DO_FUN( do_makeshield );
DECLARE_DO_FUN( do_makecontainer );
DECLARE_DO_FUN( do_reinforcements );
DECLARE_DO_FUN( do_postguard );
DECLARE_DO_FUN( do_torture );
DECLARE_DO_FUN( do_snipe );
DECLARE_DO_FUN( do_throw );
DECLARE_DO_FUN( do_disguise );
DECLARE_DO_FUN( do_makedisguise );
DECLARE_DO_FUN( do_mine );
DECLARE_DO_FUN( do_first_aid);
DECLARE_DO_FUN( do_makeblade );
DECLARE_DO_FUN( do_makeblaster );
DECLARE_DO_FUN( do_makebowcaster );
DECLARE_DO_FUN( do_makelightsaber );
DECLARE_DO_FUN( do_makespice );
DECLARE_DO_FUN( do_closebay );
DECLARE_DO_FUN( do_openbay );
DECLARE_DO_FUN( do_autotrack );
DECLARE_DO_FUN( do_jumpvector );
DECLARE_DO_FUN( do_reload );
DECLARE_DO_FUN( do_tractorbeam );
DECLARE_DO_FUN( do_radar );
DECLARE_DO_FUN( do_buyship );
DECLARE_DO_FUN( do_buyhome );
DECLARE_DO_FUN( do_renameship);
DECLARE_DO_FUN( do_buzz );
DECLARE_DO_FUN( do_clanbuyship );
DECLARE_DO_FUN( do_clansellship );
DECLARE_DO_FUN( do_sellship );
DECLARE_DO_FUN( do_autorecharge );
DECLARE_DO_FUN( do_openhatch );
DECLARE_DO_FUN( do_closehatch );
DECLARE_DO_FUN( do_status );
DECLARE_DO_FUN( do_info );
DECLARE_DO_FUN( do_hyperspace );
DECLARE_DO_FUN( do_target );
DECLARE_DO_FUN( do_fire );
DECLARE_DO_FUN( do_calculate );
DECLARE_DO_FUN( do_calculate_diff );
DECLARE_DO_FUN( do_guard );
DECLARE_DO_FUN( do_recharge );
DECLARE_DO_FUN( do_repairship );
DECLARE_DO_FUN( do_addpilot );
DECLARE_DO_FUN( do_addresident );
DECLARE_DO_FUN( do_rempilot);
DECLARE_DO_FUN( do_remresident);
DECLARE_DO_FUN( do_trajectory );
DECLARE_DO_FUN( do_trajectory_actual );
DECLARE_DO_FUN( do_accelerate );
DECLARE_DO_FUN( do_launch );
DECLARE_DO_FUN( do_land );
DECLARE_DO_FUN( do_leaveship );
DECLARE_DO_FUN( do_setspaceobject );
DECLARE_DO_FUN( do_makespaceobject );
DECLARE_DO_FUN( do_spaceobjects );
DECLARE_DO_FUN( do_showspaceobject );
DECLARE_DO_FUN( skill_notfound  );
DECLARE_DO_FUN( do_aassign      );
DECLARE_DO_FUN( do_adjusttractorbeam );
DECLARE_DO_FUN( do_addbounty    );
DECLARE_DO_FUN( do_rembounty    );
DECLARE_DO_FUN( do_vassign      );
DECLARE_DO_FUN( do_rassign      );
DECLARE_DO_FUN( do_massign      );
DECLARE_DO_FUN( do_oassign      );
DECLARE_DO_FUN( do_advance      );
DECLARE_DO_FUN( do_affected     );
DECLARE_DO_FUN( do_afk          );
DECLARE_DO_FUN( do_aid          );
DECLARE_DO_FUN( do_allow        );
DECLARE_DO_FUN( do_ansi         );
DECLARE_DO_FUN( do_answer       );
DECLARE_DO_FUN( do_apply        );
DECLARE_DO_FUN( do_appraise     );
DECLARE_DO_FUN( do_areas        );
DECLARE_DO_FUN( do_accept       );
DECLARE_DO_FUN( do_ahall        );
DECLARE_DO_FUN( do_arena        );
DECLARE_DO_FUN( do_awho         );
DECLARE_DO_FUN( do_bet          );
DECLARE_DO_FUN( do_challenge    );
DECLARE_DO_FUN( do_chaos        );
DECLARE_DO_FUN( do_decline      );
DECLARE_DO_FUN( do_aset         );
DECLARE_DO_FUN( do_ask          );
DECLARE_DO_FUN( do_astat        );
DECLARE_DO_FUN( do_at           );
DECLARE_DO_FUN( do_auction      );
DECLARE_DO_FUN( do_authorize    );
DECLARE_DO_FUN( do_avtalk       );
DECLARE_DO_FUN( do_backstab     );
DECLARE_DO_FUN( do_badname      );
DECLARE_DO_FUN( do_balzhur      );
DECLARE_DO_FUN( do_bamfin       );
DECLARE_DO_FUN( do_bamfout      );
DECLARE_DO_FUN( do_ban          );
DECLARE_DO_FUN( do_bash         );
DECLARE_DO_FUN( do_bashdoor     );
DECLARE_DO_FUN( do_beep         );
DECLARE_DO_FUN( do_berserk      );
DECLARE_DO_FUN( do_bestow       );
DECLARE_DO_FUN( do_bestowarea   );
DECLARE_DO_FUN( do_bind         );
DECLARE_DO_FUN( do_bio          );
DECLARE_DO_FUN( do_board        );
DECLARE_DO_FUN( do_boards       );
DECLARE_DO_FUN( do_bodybag      );
DECLARE_DO_FUN( do_bounties     );
DECLARE_DO_FUN( do_brandish     );
DECLARE_DO_FUN( do_bset         );
DECLARE_DO_FUN( do_bstat        );
DECLARE_DO_FUN( do_bug          );
DECLARE_DO_FUN( do_bury         );
DECLARE_DO_FUN( do_buy          );
DECLARE_DO_FUN( do_buyvendor    );
DECLARE_DO_FUN( do_cast         );
DECLARE_DO_FUN( do_cedit        );
DECLARE_DO_FUN( do_channels     );
DECLARE_DO_FUN( do_chat         );
DECLARE_DO_FUN( do_ooc          );
DECLARE_DO_FUN( do_check_vnums  );
DECLARE_DO_FUN( do_circle       );
DECLARE_DO_FUN( do_clanfunds    );
DECLARE_DO_FUN( do_clans        );
DECLARE_DO_FUN( do_ships        );
DECLARE_DO_FUN( do_shiptrack    );
DECLARE_DO_FUN( do_clantalk     );
DECLARE_DO_FUN( do_allclantalk  );
DECLARE_DO_FUN( do_climb        );
DECLARE_DO_FUN( do_close        );
DECLARE_DO_FUN( do_cmdtable     );
DECLARE_DO_FUN( do_cmenu        );
DECLARE_DO_FUN( do_color        );
DECLARE_DO_FUN( do_collectgold  );
DECLARE_DO_FUN( do_commands     );
DECLARE_DO_FUN( do_comment      );
DECLARE_DO_FUN( do_compare      );
DECLARE_DO_FUN( do_config       );
DECLARE_DO_FUN( do_consider     );
DECLARE_DO_FUN( do_cutdoor     );
DECLARE_DO_FUN( do_credits      );
DECLARE_DO_FUN( do_cset         );
DECLARE_DO_FUN( do_degradeship  );
DECLARE_DO_FUN( do_deities      );
DECLARE_DO_FUN( do_deny         );
DECLARE_DO_FUN( do_description  );
DECLARE_DO_FUN( do_destroy      );
DECLARE_DO_FUN( do_detrap       );
DECLARE_DO_FUN( do_devote       );
DECLARE_DO_FUN( do_dig          );
DECLARE_DO_FUN( do_disarm       );
DECLARE_DO_FUN( do_disconnect   );
DECLARE_DO_FUN( do_dismount     );
DECLARE_DO_FUN( do_dmesg        );
DECLARE_DO_FUN( do_down         );
DECLARE_DO_FUN( do_drag         );
DECLARE_DO_FUN( do_drink        );
DECLARE_DO_FUN( do_drop         );
DECLARE_DO_FUN( do_diagnose     );
DECLARE_DO_FUN( do_east         );
DECLARE_DO_FUN( do_eat          );
DECLARE_DO_FUN( do_echo         );
DECLARE_DO_FUN( do_emote        );
DECLARE_DO_FUN( do_empty        );
DECLARE_DO_FUN( do_enter        );
DECLARE_DO_FUN( do_equipment    );
DECLARE_DO_FUN( do_examine      );
DECLARE_DO_FUN( do_exits        );
DECLARE_DO_FUN( do_fill         );
DECLARE_DO_FUN( do_fixchar      );
DECLARE_DO_FUN( do_flee         );
DECLARE_DO_FUN( do_foldarea     );
DECLARE_DO_FUN( do_follow       );
DECLARE_DO_FUN( do_for          );
DECLARE_DO_FUN( do_force        );
DECLARE_DO_FUN( do_forceclose   );
DECLARE_DO_FUN( do_fuel         );
DECLARE_DO_FUN( do_fquit        );     /* Gorog */
DECLARE_DO_FUN( do_form_password);
DECLARE_DO_FUN( do_freeze       );
DECLARE_DO_FUN( do_get          );
DECLARE_DO_FUN( do_give         );
DECLARE_DO_FUN( do_glance       );
DECLARE_DO_FUN( do_gold         );
DECLARE_DO_FUN( do_goto         );
DECLARE_DO_FUN( do_gouge        );
DECLARE_DO_FUN( do_group        );
DECLARE_DO_FUN( do_grub         );
DECLARE_DO_FUN( do_gtell        );
DECLARE_DO_FUN( do_hedit        );
DECLARE_DO_FUN( do_hell         );
DECLARE_DO_FUN( do_help         );
DECLARE_DO_FUN( do_hide         );
DECLARE_DO_FUN( do_hitall       );
DECLARE_DO_FUN( do_hlist        );
DECLARE_DO_FUN( do_holylight    );
DECLARE_DO_FUN( do_homepage     );
DECLARE_DO_FUN( do_hset         );
DECLARE_DO_FUN( do_i103         );
DECLARE_DO_FUN( do_i104         );
DECLARE_DO_FUN( do_i105         );
DECLARE_DO_FUN( do_idea         );
DECLARE_DO_FUN( do_immortalize  );
DECLARE_DO_FUN( do_immtalk      );
DECLARE_DO_FUN( do_induct       );
DECLARE_DO_FUN( do_installarea  );
DECLARE_DO_FUN( do_instaroom    );
DECLARE_DO_FUN( do_instazone    );
DECLARE_DO_FUN( do_inventory    );
DECLARE_DO_FUN( do_invis        );
DECLARE_DO_FUN( do_invite       );
DECLARE_DO_FUN( do_junk         );
DECLARE_DO_FUN( do_kick         );
DECLARE_DO_FUN( do_kill         );
DECLARE_DO_FUN( do_languages    );
DECLARE_DO_FUN( do_last         );
DECLARE_DO_FUN( do_leave        );
DECLARE_DO_FUN( do_level        );
DECLARE_DO_FUN( do_light        );
DECLARE_DO_FUN( do_list         );
DECLARE_DO_FUN( do_litterbug    );
DECLARE_DO_FUN( do_load );
DECLARE_DO_FUN( do_unload       );
DECLARE_DO_FUN( do_loadarea     );
DECLARE_DO_FUN( do_loadup       );
DECLARE_DO_FUN( do_lock         );
DECLARE_DO_FUN( do_log          );
DECLARE_DO_FUN( do_look         );
DECLARE_DO_FUN( do_low_purge    );
DECLARE_DO_FUN( do_mailroom     );
DECLARE_DO_FUN( do_makeboard    );
DECLARE_DO_FUN( do_makeclan     );
DECLARE_DO_FUN( do_makeship     );
DECLARE_DO_FUN( do_makeguild    );
DECLARE_DO_FUN( do_makerepair   );
DECLARE_DO_FUN( do_makeshop     );
DECLARE_DO_FUN( do_makewizlist  );
DECLARE_DO_FUN( do_memory       );
DECLARE_DO_FUN( do_mcreate      );
DECLARE_DO_FUN( do_mfind        );
DECLARE_DO_FUN( do_minvoke      );
DECLARE_DO_FUN( do_mlist        );
DECLARE_DO_FUN( do_mount        );
DECLARE_DO_FUN( do_mset         );
DECLARE_DO_FUN( do_mstat        );
DECLARE_DO_FUN( do_murder       );
DECLARE_DO_FUN( do_music        );
DECLARE_DO_FUN( do_mwhere       );
DECLARE_DO_FUN( do_name         );
DECLARE_DO_FUN( do_newbiechat   );
DECLARE_DO_FUN( do_newbieset    );
DECLARE_DO_FUN( do_newzones     );
DECLARE_DO_FUN( do_noemote      );
DECLARE_DO_FUN( do_noresolve    );
DECLARE_DO_FUN( do_north        );
DECLARE_DO_FUN( do_northeast    );
DECLARE_DO_FUN( do_northwest    );
DECLARE_DO_FUN( do_notell       );
DECLARE_DO_FUN( do_notitle      );
DECLARE_DO_FUN( do_noteroom     );
DECLARE_DO_FUN( do_ocreate      );
DECLARE_DO_FUN( do_ofind        );
DECLARE_DO_FUN( do_ogrub        );
DECLARE_DO_FUN( do_oinvoke      );
DECLARE_DO_FUN( do_oldscore     );
DECLARE_DO_FUN( do_olist        );
DECLARE_DO_FUN( do_open         );
DECLARE_DO_FUN( do_opentourney  );
DECLARE_DO_FUN( do_order        );
DECLARE_DO_FUN( do_oset         );
DECLARE_DO_FUN( do_ostat        );
DECLARE_DO_FUN( do_outcast      );
DECLARE_DO_FUN( do_override     );
DECLARE_DO_FUN( do_owhere       );
DECLARE_DO_FUN( do_pager        );
DECLARE_DO_FUN( do_pardon       );
DECLARE_DO_FUN( do_password     );
DECLARE_DO_FUN( do_peace        );
DECLARE_DO_FUN( do_pick         );
DECLARE_DO_FUN( do_placevendor  );
DECLARE_DO_FUN( do_poison_weapon);
DECLARE_DO_FUN( do_pose         );
DECLARE_DO_FUN( do_practice     );
DECLARE_DO_FUN( do_pricevendor  );
DECLARE_DO_FUN( do_prompt       );
DECLARE_DO_FUN( do_pull         );
DECLARE_DO_FUN( do_punch        );
DECLARE_DO_FUN( do_purge        );
DECLARE_DO_FUN( do_push         );
DECLARE_DO_FUN( do_put          );
DECLARE_DO_FUN( do_qpset        );
DECLARE_DO_FUN( do_quaff        );
DECLARE_DO_FUN( do_quit         );
DECLARE_DO_FUN( do_rank         );
DECLARE_DO_FUN( do_rat          );
DECLARE_DO_FUN( do_rdelete      );
DECLARE_DO_FUN( do_reboot       );
DECLARE_DO_FUN( do_recall       );
DECLARE_DO_FUN( do_recho        );
DECLARE_DO_FUN( do_redit        );
DECLARE_DO_FUN( do_regoto       );
DECLARE_DO_FUN( do_remove       );
DECLARE_DO_FUN( do_repair       );
DECLARE_DO_FUN( do_repairset    );
DECLARE_DO_FUN( do_repairshops  );
DECLARE_DO_FUN( do_repairstat   );
DECLARE_DO_FUN( do_reply        );
DECLARE_DO_FUN( do_report       );
DECLARE_DO_FUN( do_request      );
DECLARE_DO_FUN( do_rescue       );
DECLARE_DO_FUN( do_rest         );
DECLARE_DO_FUN( do_reset        );
DECLARE_DO_FUN( do_resetship    );
DECLARE_DO_FUN( do_restore      );
DECLARE_DO_FUN( do_restoretime  );
DECLARE_DO_FUN( do_restrict     );
DECLARE_DO_FUN( do_retire       );
DECLARE_DO_FUN( do_retran       );
DECLARE_DO_FUN( do_return       );
DECLARE_DO_FUN( do_revert       );
DECLARE_DO_FUN( do_rgrub        );
DECLARE_DO_FUN( do_rlist        );
DECLARE_DO_FUN( do_rreset       );
DECLARE_DO_FUN( do_rset         );
DECLARE_DO_FUN( do_rstat        );
DECLARE_DO_FUN( do_addsalary    );
DECLARE_DO_FUN( do_save         );
DECLARE_DO_FUN( do_savearea     );
DECLARE_DO_FUN( do_say          );
DECLARE_DO_FUN( do_scan         );
DECLARE_DO_FUN( do_score        );
DECLARE_DO_FUN( do_study       );
DECLARE_DO_FUN( do_search       );
DECLARE_DO_FUN( do_sedit        );
DECLARE_DO_FUN( do_sell         );
DECLARE_DO_FUN( do_sellhome     );
DECLARE_DO_FUN( do_set_boot_time);
DECLARE_DO_FUN( do_setclan      );
DECLARE_DO_FUN( do_setship      );
DECLARE_DO_FUN( do_shops        );
DECLARE_DO_FUN( do_shopset      );
DECLARE_DO_FUN( do_shopstat     );
DECLARE_DO_FUN( do_shout        );
DECLARE_DO_FUN( do_shove        );
DECLARE_DO_FUN( do_showclan     );
DECLARE_DO_FUN( do_showlayers     );
DECLARE_DO_FUN( do_showship     );
DECLARE_DO_FUN( do_shutdow      );
DECLARE_DO_FUN( do_shutdown     );
DECLARE_DO_FUN( do_silence      );
DECLARE_DO_FUN( do_sit          );
DECLARE_DO_FUN( do_sla          );
DECLARE_DO_FUN( do_slay         );
DECLARE_DO_FUN( do_sleep        );
DECLARE_DO_FUN( do_slist        );
DECLARE_DO_FUN( do_slookup      );
DECLARE_DO_FUN( do_smoke        );
DECLARE_DO_FUN( do_sneak        );
DECLARE_DO_FUN( do_snoop        );
DECLARE_DO_FUN( do_sober        );
DECLARE_DO_FUN( do_socials      );
DECLARE_DO_FUN( do_south        );
DECLARE_DO_FUN( do_southeast    );
DECLARE_DO_FUN( do_southwest    );
DECLARE_DO_FUN( do_speak        );
DECLARE_DO_FUN( do_split        );
DECLARE_DO_FUN( do_sset         );
DECLARE_DO_FUN( do_stand        );
DECLARE_DO_FUN( do_starttourney );
DECLARE_DO_FUN( do_steal        );
DECLARE_DO_FUN( do_stun         );
DECLARE_DO_FUN( do_supplicate   );
DECLARE_DO_FUN( do_switch       );
DECLARE_DO_FUN( do_tamp         );
DECLARE_DO_FUN( do_tell         );
DECLARE_DO_FUN( do_time         );
DECLARE_DO_FUN( do_timecmd      );
DECLARE_DO_FUN( do_title        );
DECLARE_DO_FUN( do_track        );
DECLARE_DO_FUN( do_toplevel     );
DECLARE_DO_FUN( do_transfer     );
DECLARE_DO_FUN( do_transfeship  );
DECLARE_DO_FUN( do_trust        );
DECLARE_DO_FUN( do_typo         );
DECLARE_DO_FUN( do_unfoldarea   );
DECLARE_DO_FUN( do_unhell       );
DECLARE_DO_FUN( do_undock       );
DECLARE_DO_FUN( do_unlock       );
DECLARE_DO_FUN( do_unsilence    );
DECLARE_DO_FUN( do_up           );
DECLARE_DO_FUN( do_users        );
DECLARE_DO_FUN( do_value        );
DECLARE_DO_FUN( do_viewskills   );
DECLARE_DO_FUN( do_visible      );
DECLARE_DO_FUN( do_vnums        );
DECLARE_DO_FUN( do_vsearch      );
DECLARE_DO_FUN( do_wake         );
DECLARE_DO_FUN( do_wartalk      );
DECLARE_DO_FUN( do_wear         );
DECLARE_DO_FUN( do_weather      );
DECLARE_DO_FUN( do_west         );
DECLARE_DO_FUN( do_where        );
DECLARE_DO_FUN( do_who          );
DECLARE_DO_FUN( do_whois        );
DECLARE_DO_FUN( do_wimpy        );
DECLARE_DO_FUN( do_wizhelp      );
DECLARE_DO_FUN( do_wizlist      );
DECLARE_DO_FUN( do_wizlock      );
DECLARE_DO_FUN( do_yell         );
DECLARE_DO_FUN( do_zap          );
DECLARE_DO_FUN( do_zones        );
DECLARE_DO_FUN( do_dock         );

/* mob prog stuff */
DECLARE_DO_FUN( do_mp_close_passage );
DECLARE_DO_FUN( do_mp_damage );
DECLARE_DO_FUN( do_mp_restore );
DECLARE_DO_FUN( do_mp_open_passage );
DECLARE_DO_FUN( do_mp_slay);
DECLARE_DO_FUN( do_mpasound     );
DECLARE_DO_FUN( do_mpat         );
DECLARE_DO_FUN( do_mpdream      );
DECLARE_DO_FUN( do_mp_deposit   );
DECLARE_DO_FUN( do_mp_withdraw  );
DECLARE_DO_FUN( do_mpecho       );
DECLARE_DO_FUN( do_mpechoaround );
DECLARE_DO_FUN( do_mpechoat     );
DECLARE_DO_FUN( do_mpedit       );
DECLARE_DO_FUN( do_mpfind       );
DECLARE_DO_FUN( do_opedit       );
DECLARE_DO_FUN( do_opfind       );
DECLARE_DO_FUN( do_rpedit       );
DECLARE_DO_FUN( do_rpfind       );
DECLARE_DO_FUN( do_mpforce      );
DECLARE_DO_FUN( do_mpinvis      );
DECLARE_DO_FUN( do_mpgoto       );
DECLARE_DO_FUN( do_mpjunk       );
DECLARE_DO_FUN( do_mpkill       );
DECLARE_DO_FUN( do_mpmload      );
DECLARE_DO_FUN( do_mpmset       );
DECLARE_DO_FUN( do_mpnothing    );
DECLARE_DO_FUN( do_mpoload      );
DECLARE_DO_FUN( do_mposet       );
DECLARE_DO_FUN( do_mppurge      );
DECLARE_DO_FUN( do_mpstat       );
DECLARE_DO_FUN( do_opstat       );
DECLARE_DO_FUN( do_rpstat       );
DECLARE_DO_FUN( do_mptransfer   );
DECLARE_DO_FUN( do_mpapply      );
DECLARE_DO_FUN( do_mpapplyb     );
DECLARE_DO_FUN( do_mpgain       );

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
  Exit *GetExit( const Room *room, short dir );
  Exit *GetExitTo( const Room *room, short dir, vnum_t vnum );
  Exit *GetExitNumber( const Room *room, short count );
  ch_ret MoveCharacter( Character *ch, Exit *pexit, int fall );
  void Teleport( Character *ch, vnum_t room, int flags );
  short GetCarryEncumbrance( const Character *ch, short move );
  bool CharacterFallIfNoFloor( Character *ch, int fall );
  vnum_t WhereHome( const Character *ch );

  /* act_obj.c */
  bool RemoveObject( Character *ch, int iWear, bool fReplace );
  obj_ret DamageObject( Object *obj );
  short GetObjectResistance( const Object *obj );
  void SaveClanStoreroom( Character *ch, const Clan *clan );
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
  void FreeSocial( Social *social );
  void UnlinkSocial( Social *social );
  void AddSocial( Social *social );
  void FreeCommand( Command *command );
  void UnlinkCommand( Command *command );
  void AddCommand( Command *command );

  /* boards.c */
  void LoadBoards( void );
  Board *GetBoardFromObject( const Object *obj );
  Board *FindBoardHere( const Character *ch );
  void FreeNote( Note *pnote );
  void WriteBoardFile( void );
  void OperateOnNote( Character *ch, char *arg_passed, bool IS_MAIL );
  void AttachNote(Character *ch);
  void CountMailMessages(const Character *ch);

  /* clans.c */
  void SaveClanMemberList( const MEMBER_LIST *members_list );
  void ShowClanMembers( const Character *ch, const char *argument, const char *format );
  void WriteClanList( void );
  Clan *GetClan( const char *name );
  void LoadClans( void );
  void SaveClan( const Clan *clan );
  void UpdateClanMember( const Character *ch );
  void RemoveClanMember( const Character *ch );

  /* planets.c */
  void WritePlanetList( void );
  Planet *GetPlanet( const char *name );
  void LoadPlanets( void );
  void SavePlanet( const Planet *planet );
  long GetTaxes( const Planet *planet );

  /* bounty.c */
  void AddBounty( const Character *ch, const Character *victim, long amount );
  Bounty *GetBounty( const char *target );
  void LoadBounties( void );
  void SaveBounties( void );
  void RemoveBounty( Bounty *bounty );
  void ClaimBounty( Character *ch , const Character *victim );
  bool IsBountyOn( const Character *victim );

  /* const.c */
  int GetSaveFlag(const char*);
  const char *GetDirectionName( DirectionType dir );
  DirectionType GetReverseDirection( DirectionType dir );
  size_t GetSpaceobjectTypeSize( void );
  const char *GetSpaceobjectTypeName(size_t sotype);
  int GetSpaceobjectType(const char *name);
  const char * const *GetSpaceobjectTypeTable( void );
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
  const char *GetSpellFlagName( size_t type );
  size_t GetSpellSavesSize( void );
  const char *GetSpellSavesName( size_t type );
  size_t GetSpellTargetSize( void );
  const char *GetSpellTargetName( size_t type );
  int GetSpiceType( const char* );
  int GetNpcRace( const char* );
  int GetActFlag( const char* );
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
  int GetObjectType( const char *type );
  int GetAffectType( const char *type );
  int GetAffectedFlag( const char *flag );
  int GetObjectFlag( const char *flag );
  int GetWearFlag( const char *flag );
  int GetMudProgFlag( const char *flag );
  DirectionType GetDirection( const char *txt );
  int GetVipFlag( const char *flag );
  int GetWantedFlag( const char *flag );
  int GetSpellDamage( const char *txt );
  int GetSpellAction( const char *txt );
  int GetSpellClass( const char *txt );
  int GetSpellPower( const char *txt );
  int GetSpellFlag( const char *txt );
  int GetSpellSave( const char *txt );
  int GetSpellTarget( const char *txt );

  /* space.c */
  void LoadSpaceobjects( void );
  void SaveSpaceobject( Spaceobject *spaceobject );
  Spaceobject *GetSpaceobjectFromName( const char *name );
  Spaceobject *GetSpaceobjectFromVnum( vnum_t vnum );
  void SpaceobjectUpdate( void );

  /* nanny.c */
  void Nanny( Descriptor *d, char *argument );

  /* comm.c */
  char *GetObjectShortDescription( const Object *obj );
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
  bool CheckPlaying( Descriptor *d, const char *name, bool kick );
  bool CheckMultiplaying( Descriptor *d, const char *name );
  void InitializeDescriptor(Descriptor *dnew, socket_t desc);
  void FreeDescriptor( Descriptor *d );

  /* comments.c */
  void ReadComment( Character *ch, FILE *fp );
  void WriteComments( const Character *ch, FILE *fp );

  /* db.c */
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
  void LogPrintf( const char *fmt, ... );
  void LogStringPlus( const char *str, short log_type, short level );
  Room *MakeRoom( vnum_t vnum );
  ProtoObject *MakeObject( vnum_t vnum, vnum_t cvnum, char *name );
  ProtoMobile *MakeMobile( vnum_t vnum, vnum_t cvnum, char *name );
  Exit *MakeExit( Room *pRoomIndex, Room *to_room, short door );
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
  int ComputeXP( const Character *gch, const Character *victim );
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
  bool CheckSkill( Character *ch, const char *command, char *argument );
  void LearnFromSuccess( Character *ch, int sn );
  void LearnFromFailure( Character *ch, int sn );
  bool CheckParry( Character *ch, Character *victim );
  bool CheckDodge( Character *ch, Character *victim );
  bool CheckGrip( Character *ch, Character *victim );
  void Disarm( Character *ch, Character *victim );
  void Trip( Character *ch, Character *victim );
  bool HasPermanentSneak( const Character *ch );

  /* handler.c */
  bool CharacterCanTakePrototype( const Character *ch );
  void Explode( Object *obj );
  int GetRequiredXpForLevel( short level );
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
  void AddTimerToCharacter( Character *ch, short type, short count, DO_FUN *fun, int value );
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
  bool CheckSocial( Character *ch, const char *command, char *argument );
  bool CheckPosition( const Character *ch, int position );
  void Interpret( Character *ch, char *argument );
  Social *GetSocial( const char *command );
  Command *GetCommand( const char *command );
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
  int ChLookupSkill( const Character *ch, const char *name );
  int LookupSkill( const char *name );
  int LookupHerb( const char *name );
  int SkillNumberFromSlot( int slot );
  int BSearchSkill( const char *name, int first, int top );
  int BSearchSkillExact( const char *name, int first, int top );
  bool SaveVsPoisonDeath( int level, const Character *victim ) ;
  bool SaveVsWands( int level, const Character *victim );
  bool SaveVsParalyze( int level, const Character *victim );
  bool SaveVsBreath( int level, const Character *victim );
  bool SaveVsSpellStaff( int level, const Character *victim );
  ch_ret CastSpellWithObject( int sn, int level, Character *ch, Character *victim, Object *obj );
  int ParseDice( const Character *ch, int level, const char *exp );
  Skill *GetSkill( int sn );

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
  SPEC_FUN *SpecialLookup( const char *name );
  const char *LookupSpecial( SPEC_FUN *special );

  /* tables.c */
  skill_types GetSkillType( const char *skilltype );
  void LoadSkillTable( void );
  void SaveSkillTable( void );
  void SortSkillTable( void );
  void LoadSocials( void );
  void SaveSocials( void );
  void LoadCommands( void );
  void SaveCommands( void );
  SPELL_FUN *GetSpellFunction( const char *name );
  DO_FUN *GetSkillFunction( const char *name );
  void LoadHerbTable( void );
  void SaveHerbTable( void );

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

  /* badname functions */
  bool IsBadName( const char *name );
  int AddBadName( const char *name );

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

#define GET_BETTED_ON(ch)    ((ch)->betted_on)
#define GET_BET_AMT(ch) ((ch)->bet_amt)
#define IN_ARENA(ch)            (IsBitSet((ch)->in_room->room_flags, ROOM_ARENA))

#ifdef __cplusplus
}
#endif

#endif /* include guard */
