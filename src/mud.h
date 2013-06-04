/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997, 1998 by Sean Cooper                                  *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright (c) Lucasfilm Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                          Main mud header file                           *
 ****************************************************************************/

#ifndef _SWRIP_MUD_H_
#define _SWRIP_MUD_H_

#include <utility.h>
#include <eris/ceris.h>
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
struct ban_data
{
  BAN_DATA *next;
  BAN_DATA *prev;
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
struct descriptor_data
{
  DESCRIPTOR_DATA *next;
  DESCRIPTOR_DATA *prev;
  DESCRIPTOR_DATA *snoop_by;
  CHAR_DATA       *character;
  CHAR_DATA       *original;

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
  int        keeper;                /* Vnum of shop keeper mob      */
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
  int          keeper;              /* Vnum of shop keeper mob      */
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
  CHAR_DATA      *ch;
  OBJ_DATA       *obj;
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
struct race_type
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

  short hit;
  short mana;
  int   resist;
  int   suscept;
  int   class_restriction;      /* Flags for illegal classes    */
  int   language;               /* Default racial language      */
};

struct space_data
{
  SPACE_DATA  *next;
  SPACE_DATA  *prev;
  PLANET_DATA *planet;
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
    char *locationa;
    char *locationb;
    char *locationc;
    int   doca;
    int   docb;
    int   docc;
    bool  seca;
    bool  secb;
    bool  secc;
  } landing_site;
};

struct bounty_data
{
  BOUNTY_DATA *next;
  BOUNTY_DATA *prev;
  char        *target;
  long         amount;
  char        *poster;
};

struct guard_data
{
  GUARD_DATA      *next;
  GUARD_DATA      *prev;
  GUARD_DATA      *next_on_planet;
  GUARD_DATA      *prev_on_planet;
  CHAR_DATA       *mob;
  ROOM_INDEX_DATA *reset_loc;
  PLANET_DATA     *planet;
};

struct storeroom
{
  STOREROOM       *next;
  STOREROOM       *prev;
  int              vnum;
  ROOM_INDEX_DATA *room;
};

struct planet_data
{
  PLANET_DATA *next;
  PLANET_DATA *prev;
  PLANET_DATA *next_in_system;
  PLANET_DATA *prev_in_system;
  GUARD_DATA  *first_guard;
  GUARD_DATA  *last_guard;
  SPACE_DATA  *spaceobject;
  AREA_DATA   *first_area;
  AREA_DATA   *last_area;
  char        *name;
  char        *filename;
  long         base_value;
  Clan   *governed_by;
  int          population;
  bool         flags;
  float        pop_support;
};

struct ship_data
{
  SHIP_DATA       *next;
  SHIP_DATA       *prev;
  SHIP_DATA       *next_in_spaceobject;
  SHIP_DATA       *prev_in_spaceobject;
  SHIP_DATA       *next_in_room;
  SHIP_DATA       *prev_in_room;
  ROOM_INDEX_DATA *in_room;
  SPACE_DATA      *spaceobject;
  SPACE_DATA      *destin;
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
  short            sclass;
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
  SHIP_DATA       *target0; /* target of main weapon systems (ie, not turrest) */
  SHIP_DATA       *tractoredby;
  SHIP_DATA       *tractored;
  SPACE_DATA      *currjump;
  SPACE_DATA      *lastsystem;
  short            chaff;
  short            maxchaff;
  bool             chaff_released;
  bool             autopilot;
  bool             opentube;
  SHIP_DATA       *docked;
  short            alarm;
  short            ions;
  CHAR_DATA       *ch;
  SPACE_DATA      *inorbitof;
  int              count;
  TURRET_DATA *turret[MAX_NUMBER_OF_TURRETS_IN_SHIP];
};

struct missile_data
{
  MISSILE_DATA *next;
  MISSILE_DATA *prev;
  MISSILE_DATA *next_in_spaceobject;
  MISSILE_DATA *prev_in_spaceobject;
  SPACE_DATA   *spaceobject;
  SHIP_DATA    *target;
  SHIP_DATA    *fired_from;
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
struct note_data
{
  NOTE_DATA *next;
  NOTE_DATA *prev;
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

struct board_data
{
  BOARD_DATA *next;                    /* Next board in list              */
  BOARD_DATA *prev;                    /* Previous board in list          */
  NOTE_DATA  *first_note;              /* First note on board             */
  NOTE_DATA  *last_note;               /* Last note on board              */
  char       *note_file;             /* Filename to save notes to       */
  char       *read_group;            /* Can restrict a board to a       */
  char       *post_group;            /* council, clan, guild etc        */
  char       *extra_readers;         /* Can give read rights to players */
  char       *extra_removers;        /* Can give remove rights to players */
  int         board_obj;             /* Vnum of board object            */
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
struct affect_data
{
  AFFECT_DATA *next;
  AFFECT_DATA *prev;
  short        type;
  short        duration;
  short        location;
  int          modifier;
  int          bitvector;
};


/*
 * A SMAUG spell
 */
struct smaug_affect
{
  SMAUG_AFF *next;
  char      *duration;
  short      location;
  char      *modifier;
  int        bitvector;
};

struct timer_data
{
  TIMER  *prev;
  TIMER  *next;
  DO_FUN *do_fun;
  int     value;
  short   type;
  short   count;
};

/*
 * Prototype for a mob.
 * This is the in-memory version of #MOBILES.
 */
struct mob_index_data
{
  MOB_INDEX_DATA *next;
  MOB_INDEX_DATA *next_sort;
  SPEC_FUN       *spec_fun;
  SPEC_FUN       *spec_2;
  SHOP_DATA      *pShop;
  REPAIR_DATA    *rShop;
  char           *player_name;
  char           *short_descr;
  char           *long_descr;
  char           *description;
  short           vnum;
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


struct hunt_hate_fear
{
  char      *name;
  CHAR_DATA *who;
};

struct fighting_data
{
  CHAR_DATA *who;
  int        xp;
  short      align;
  short      duration;
  short      timeskilled;
};

struct extracted_char_data
{
  EXTRACT_CHAR_DATA *next;
  CHAR_DATA         *ch;
  ROOM_INDEX_DATA   *room;
  ch_ret             retcode;
  bool               extract;
};

struct killed_data
{
  short vnum;
  char  count;
};

#ifdef SWRIP_USE_IMC
#include "imc.h"
#endif

/*
 * Data which only PC's have.
 */
struct pc_data
{
  Clan  *clan;
  AREA_DATA  *area;
  char       *homepage;
  char       *clan_name;
  char       *pwd;
  char       *email;
  char       *bamfin;
  char       *bamfout;
  char       *rank;
  char       *title;
  char       *bestowments;    /* Special bestowed commands       */
  int         flags;            /* Whether the player is deadly and whatever else we add.      */
  int         pkills;         /* Number of pkills on behalf of clan */
  int         pdeaths;        /* Number of times pkilled (legally)  */
  int         mkills;         /* Number of mobs killed                   */
  int         mdeaths;        /* Number of deaths due to mobs       */
  int         illegal_pk;     /* Number of illegal pk's committed   */
  long        outcast_time;     /* The time at which the char was outcast */
  long        restore_time;     /* The last time the char did a restore all */
  short       r_range_lo;     /* room range */
  short       r_range_hi;
  short       m_range_lo;     /* mob range  */
  short       m_range_hi;
  short       o_range_lo;     /* obj range  */
  short       o_range_hi;
  short       wizinvis;       /* wizinvis level */
  short       min_snoop;      /* minimum snoop level */
  short       condition[MAX_CONDS];
  short       learned[MAX_SKILL];
  KILLED_DATA killed[MAX_KILLTRACK];
  short       quest_number;   /* current *QUEST BEING DONE* DON'T REMOVE! */
  short       quest_curr;     /* current number of quest points */
  int         quest_accum;    /* quest points accumulated in players life */
  int         auth_state;
  time_t      release_date;   /* Auto-helling.. Altrag */
  int         jail_vnum;
  char       *helled_by;
  char       *bio;            /* Personal Bio */
  char       *authed_by;      /* what crazy imm authed this name ;) */
  char       *prompt;         /* User config prompts */
  char       *subprompt;      /* Substate prompt */
  short       pagerlen;       /* For pager (NOT menus) */
  bool        openedtourney;
  short       addiction[10];
  short       drug_level[10];
  int         wanted_flags;
  long        bank;
  bool        whoCloak;
  char       *betted_on;
  int         bet_amt;
  int         salary;
  long        salary_date;    /* Auto-Salary Darrik Vequir */
  CerisList  *Aliases;
  CHAR_DATA  *pet;
  char       *target;
  NOTE_DATA  *pnote;
  NOTE_DATA  *comments;
  short       clones;
  int         played;
  time_t      logon;
  time_t      save_time;
#ifdef SWRIP_USE_IMC
  IMC_CHARDATA *imcchardata;
#endif
};

/*
 * Liquids.
 */
struct liq_type
{
  char *        liq_name;
  char *        liq_color;
  short liq_affect[3];
};

/*
 * Extra description data for a room or object.
 */
struct extra_descr_data
{
  EXTRA_DESCR_DATA *next;       /* Next in list                     */
  EXTRA_DESCR_DATA *prev;       /* Previous in list                 */
  char             *keyword;              /* Keyword in look/examine          */
  char             *description;          /* What to see                      */
};



/*
 * Prototype for an object.
 */
struct obj_index_data
{
  OBJ_INDEX_DATA   *next;
  OBJ_INDEX_DATA   *next_sort;
  EXTRA_DESCR_DATA *first_extradesc;
  EXTRA_DESCR_DATA *last_extradesc;
  AFFECT_DATA      *first_affect;
  AFFECT_DATA      *last_affect;
  char             *name;
  char             *short_descr;
  char             *description;
  char             *action_desc;
  int               vnum;
  short             level;
  short             item_type;
  int               extra_flags;
  int               magic_flags; /*Need more bitvectors for spells - Scryn*/
  int               wear_flags;
  short             count;
  short             weight;
  int               cost;
  int               value[6];
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
struct obj_data
{
  OBJ_DATA         *next;
  OBJ_DATA         *prev;
  OBJ_DATA         *next_content;
  OBJ_DATA         *prev_content;
  OBJ_DATA         *first_content;
  OBJ_DATA         *last_content;
  OBJ_DATA         *in_obj;
  CHAR_DATA        *carried_by;
  EXTRA_DESCR_DATA *first_extradesc;
  EXTRA_DESCR_DATA *last_extradesc;
  AFFECT_DATA      *first_affect;
  AFFECT_DATA      *last_affect;
  OBJ_INDEX_DATA   *pIndexData;
  ROOM_INDEX_DATA  *in_room;
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
  int               value[6];
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
struct exit_data
{
  EXIT_DATA       *prev;           /* previous exit in linked list */
  EXIT_DATA       *next;           /* next exit in linked list     */
  EXIT_DATA       *rexit;          /* Reverse exit pointer         */
  ROOM_INDEX_DATA *to_room;        /* Pointer to destination room  */
  char            *keyword;        /* Keywords for exit or door    */
  char            *description;    /* Description of exit          */
  int              vnum;           /* Vnum of room exit leads to   */
  int              rvnum;          /* Vnum of room in opposite dir */
  int              exit_info;      /* door states & other flags    */
  int              key;            /* Key vnum                     */
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
struct reset_data
{
  RESET_DATA *next;
  RESET_DATA *prev;
  char        command;
  int         extra;
  int         arg1;
  int         arg2;
  int         arg3;
};

/*
 * Area definition.
 */
struct area_data
{
  AREA_DATA   *next;
  AREA_DATA   *prev;
  AREA_DATA   *next_sort;
  AREA_DATA   *prev_sort;
  RESET_DATA  *first_reset;
  RESET_DATA  *last_reset;
  PLANET_DATA *planet;
  AREA_DATA   *next_on_planet;
  AREA_DATA   *prev_on_planet;
  char        *name;
  char        *filename;
  int          flags;
  short        status;  /* h, 8/11 */
  short        age;
  short        nplayer;
  short        reset_frequency;
  int          low_r_vnum;
  int          hi_r_vnum;
  int          low_o_vnum;
  int          hi_o_vnum;
  short        low_m_vnum;
  short        hi_m_vnum;
  int          low_soft_range;
  int          hi_soft_range;
  int          low_hard_range;
  int          hi_hard_range;
  char        *author; /* Scryn */
  char        *resetmsg; /* Rennard */
  RESET_DATA  *last_mob_reset;
  RESET_DATA  *last_obj_reset;
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
  int       low_r_vnum;
  int       hi_r_vnum;
  int       low_o_vnum;
  int       hi_o_vnum;
  short     low_m_vnum;
  short     hi_m_vnum;
};

/*
 * Used to keep track of system settings and statistics         -Thoric
 */
struct system_data
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
  short  level_modify_proto;     /* Level to modify prototype stuff LEVEL_LESSER */
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
struct room_index_data
{
  ROOM_INDEX_DATA  *next;
  ROOM_INDEX_DATA  *next_sort;
  CHAR_DATA        *first_person;
  CHAR_DATA        *last_person;
  OBJ_DATA         *first_content;
  OBJ_DATA         *last_content;
  EXTRA_DESCR_DATA *first_extradesc;
  EXTRA_DESCR_DATA *last_extradesc;
  AREA_DATA        *area;
  EXIT_DATA        *first_exit;
  EXIT_DATA        *last_exit;
  SHIP_DATA        *first_ship;
  SHIP_DATA        *last_ship;
  char             *name;
  char             *description;
  int               vnum;
  int               room_flags;
  short             light;
  short             sector_type;
  int               tele_vnum;
  short             tele_delay;
  short             tunnel;              /* max people that will fit */
  SHUTTLE_DATA     *first_shuttle;
  SHUTTLE_DATA     *last_shuttle;

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
struct teleport_data
{
  TELEPORT_DATA   *next;
  TELEPORT_DATA   *prev;
  ROOM_INDEX_DATA *room;
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
struct skill_type
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
  SMAUG_AFF *affects;                /* Spell affects, if any        */
  char      *components;             /* Spell components, if any     */
  char      *teachers;               /* Skill requires a special teacher */
  char       participants;           /* # of required participants   */
  struct timerset userec; /* Usage record                 */
  int        alignment;              /* for jedi powers */
};


struct auction_data
{
  OBJ_DATA  *item;   /* a pointer to the item */
  CHAR_DATA *seller; /* a pointer to the seller - which may NOT quit */
  CHAR_DATA *buyer;  /* a pointer to the buyer - which may NOT quit */
  int        bet;    /* last bet - or 0 if noone has bet anything */
  short      going;  /* 1,2, sold */
  short      pulse;  /* how many pulses (.25 sec) until another call-out ? */
  int        starting;
};


/*
 * These are skill_lookup return values for common skills and spells.
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
extern short gsn_makelight;
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
extern short gsn_bite;
extern short gsn_claw;
extern short gsn_sting;
extern short gsn_tail;
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
extern short gsn_scribe;
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
      if ( ((gsn) = skill_lookup((skill))) == -1 )              \
        fprintf( stderr, "ASSIGN_GSN: Skill %s not found.\n",   \
                 (skill) );                                     \
    } while(0)

#define CHECK_SUBRESTRICTED(ch)                                         \
  do                                                                    \
    {                                                                   \
      if ( (ch)->substate == SUB_RESTRICTED )                           \
        {                                                               \
          send_to_char( "You cannot use this command from within another command.\n\r", ch ); \
          return;                                                       \
        }                                                               \
    } while(0)


/*
 * Character macros.
 */
#define IS_OUTSIDE(ch)          (!IS_SET(                               \
                                         (ch)->in_room->room_flags,     \
                                         ROOM_INDOORS) && !IS_SET(      \
                                                                  (ch)->in_room->room_flags, \
                                                                  ROOM_SPACECRAFT) )

#define EXIT(ch, door)          ( get_exit( (ch)->in_room, door ) )

#define CAN_GO(ch, door)        (EXIT((ch),(door))                      \
                                 && (EXIT((ch),(door))->to_room != NULL) \
                                 && !IS_SET(EXIT((ch), (door))->exit_info, EX_CLOSED))

#define IS_VALID_SN(sn)         ( (sn) >=0 && (sn) < MAX_SKILL  \
                                  && skill_table[(sn)]          \
                                  && skill_table[(sn)]->name )

#define IS_VALID_HERB(sn)       ( (sn) >=0 && (sn) < MAX_HERB   \
                                  && herb_table[(sn)]           \
                                  && herb_table[(sn)]->name )

#define SPELL_FLAG(skill, flag) ( IS_SET((skill)->flags, (flag)) )
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
#define CAN_WEAR(obj, part)     (IS_SET((obj)->wear_flags,  (part)))
#define IS_OBJ_STAT(obj, stat)  (IS_SET((obj)->extra_flags, (stat)))

#define log_string( txt )       ( log_string_plus( (txt), LOG_NORMAL, LEVEL_LOG ) )

/*
 * Structure for a command in the command lookup table.
 */
struct cmd_type
{
  CMDTYPE *next;
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
struct social_type
{
  SOCIALTYPE *next;
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

extern const struct race_type race_table[];
extern const struct liq_type liq_table[];
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
extern struct system_data sysdata;
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

extern CMDTYPE              *command_hash[126];
extern SKILLTYPE            *skill_table[MAX_SKILL];
extern SOCIALTYPE           *social_index[27];
extern CHAR_DATA            *cur_char;
extern ROOM_INDEX_DATA      *cur_room;
extern bool                  cur_char_died;
extern ch_ret                global_retcode;
extern SKILLTYPE            *herb_table[MAX_HERB];

extern int                   cur_obj;
extern int                   cur_obj_serial;
extern bool                  cur_obj_extracted;
extern obj_ret               global_objcode;

extern SHOP_DATA            *first_shop;
extern SHOP_DATA            *last_shop;
extern REPAIR_DATA          *first_repair;
extern REPAIR_DATA          *last_repair;
extern BAN_DATA             *first_ban;
extern BAN_DATA             *last_ban;
extern CHAR_DATA            *first_char;
extern CHAR_DATA            *last_char;
extern DESCRIPTOR_DATA      *first_descriptor;
extern DESCRIPTOR_DATA      *last_descriptor;
extern BOARD_DATA           *first_board;
extern BOARD_DATA           *last_board;
extern OBJ_DATA             *first_object;
extern OBJ_DATA             *last_object;
extern MEMBER_LIST          *first_member_list;
extern MEMBER_LIST          *last_member_list;
extern GUARD_DATA           *first_guard;
extern GUARD_DATA           *last_guard;
extern SHIP_DATA            *first_ship;
extern SHIP_DATA            *last_ship;
extern MISSILE_DATA         *first_missile;
extern MISSILE_DATA         *last_missile;
extern SPACE_DATA           *first_spaceobject;
extern SPACE_DATA           *last_spaceobject;
extern PLANET_DATA          *first_planet;
extern PLANET_DATA          *last_planet;
extern BOUNTY_DATA          *first_bounty;
extern BOUNTY_DATA          *last_bounty;
extern BOUNTY_DATA          *first_disintegration;
extern BOUNTY_DATA          *last_disintegration;
extern AREA_DATA            *first_area;
extern AREA_DATA            *last_area;
extern AREA_DATA            *first_build;
extern AREA_DATA            *last_build;
extern AREA_DATA            *first_asort;
extern AREA_DATA            *last_asort;
extern AREA_DATA            *first_bsort;
extern AREA_DATA            *last_bsort;
extern TELEPORT_DATA        *first_teleport;
extern TELEPORT_DATA        *last_teleport;
extern OBJ_DATA             *extracted_obj_queue;
extern EXTRACT_CHAR_DATA    *extracted_char_queue;
extern OBJ_DATA             *save_equipment[MAX_WEAR][MAX_LAYERS];
extern CHAR_DATA            *quitting_char;
extern CHAR_DATA            *loading_char;
extern CHAR_DATA            *saving_char;
extern OBJ_DATA             *all_obj;
extern time_t                current_time;
extern bool                  fLogAll;
extern char                  log_buf         [];
extern TIME_INFO_DATA        time_info;
extern WEATHER_DATA          weather_info;
extern AUCTION_DATA         *auction;
extern struct act_prog_data *mob_act_list;

/*
 * Command functions.
 * Defined in act_*.c (mostly).
 */


DECLARE_DO_FUN( do_test );
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
DECLARE_DO_FUN( do_sound  );
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
DECLARE_DO_FUN( do_makelight );
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
DECLARE_DO_FUN( do_aquest       );
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
DECLARE_DO_FUN( do_quest        );
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
DECLARE_DO_FUN( do_scribe       );
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
DECLARE_DO_FUN( do_transship    );
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
DECLARE_SPELL_FUN( spell_affect );
DECLARE_SPELL_FUN( spell_affectchar );
DECLARE_SPELL_FUN( spell_area_attack );
DECLARE_SPELL_FUN( spell_create_obj );
DECLARE_SPELL_FUN( spell_create_mob );
DECLARE_SPELL_FUN( spell_attack );
DECLARE_SPELL_FUN( spell_obj_inv );

DECLARE_SPELL_FUN(      spell_null              );
DECLARE_SPELL_FUN(      spell_notfound          );
DECLARE_SPELL_FUN(      spell_acid_blast        );
DECLARE_SPELL_FUN(      spell_animate_dead      );
DECLARE_SPELL_FUN(      spell_blindness         );
DECLARE_SPELL_FUN(      spell_burning_hands     );
DECLARE_SPELL_FUN(      spell_call_lightning    );
DECLARE_SPELL_FUN(      spell_cause_critical    );
DECLARE_SPELL_FUN(      spell_cause_light       );
DECLARE_SPELL_FUN(      spell_cause_serious     );
DECLARE_SPELL_FUN(      spell_change_sex        );
DECLARE_SPELL_FUN(      spell_charm_person      );
DECLARE_SPELL_FUN(      spell_chill_touch       );
DECLARE_SPELL_FUN(      spell_colour_spray      );
DECLARE_SPELL_FUN(      spell_control_weather   );
DECLARE_SPELL_FUN(      spell_create_food       );
DECLARE_SPELL_FUN(      spell_create_water      );
DECLARE_SPELL_FUN(      spell_cure_blindness    );
DECLARE_SPELL_FUN(      spell_cure_poison       );
DECLARE_SPELL_FUN(      spell_curse             );
DECLARE_SPELL_FUN(      spell_detect_poison     );
DECLARE_SPELL_FUN(      spell_dispel_evil       );
DECLARE_SPELL_FUN(      spell_dispel_magic      );
DECLARE_SPELL_FUN(      spell_dream             );
DECLARE_SPELL_FUN(      spell_earthquake        );
DECLARE_SPELL_FUN(      spell_enchant_weapon    );
DECLARE_SPELL_FUN(      spell_energy_drain      );
DECLARE_SPELL_FUN(      spell_faerie_fire       );
DECLARE_SPELL_FUN(      spell_faerie_fog        );
DECLARE_SPELL_FUN(      spell_farsight          );
DECLARE_SPELL_FUN(      spell_fireball          );
DECLARE_SPELL_FUN(      spell_flamestrike       );
DECLARE_SPELL_FUN(      spell_knock             );
DECLARE_SPELL_FUN(      spell_harm              );
DECLARE_SPELL_FUN(      spell_identify          );
DECLARE_SPELL_FUN(      spell_invis             );
DECLARE_SPELL_FUN(      spell_know_alignment    );
DECLARE_SPELL_FUN(      spell_lightning_bolt    );
DECLARE_SPELL_FUN(      spell_locate_object     );
DECLARE_SPELL_FUN(      spell_magic_missile     );
DECLARE_SPELL_FUN(      spell_pass_door         );
DECLARE_SPELL_FUN(      spell_poison            );
DECLARE_SPELL_FUN(      spell_polymorph         );
DECLARE_SPELL_FUN(      spell_possess           );
DECLARE_SPELL_FUN(      spell_recharge          );
DECLARE_SPELL_FUN(      spell_remove_invis      );
DECLARE_SPELL_FUN(      spell_remove_trap       );
DECLARE_SPELL_FUN(      spell_shocking_grasp    );
DECLARE_SPELL_FUN(      spell_sleep             );
DECLARE_SPELL_FUN(      spell_smaug             );
DECLARE_SPELL_FUN(      spell_ventriloquate     );
DECLARE_SPELL_FUN(      spell_weaken            );
DECLARE_SPELL_FUN(      spell_acid_breath       );
DECLARE_SPELL_FUN(      spell_fire_breath       );
DECLARE_SPELL_FUN(      spell_frost_breath      );
DECLARE_SPELL_FUN(      spell_gas_breath        );
DECLARE_SPELL_FUN(      spell_lightning_breath  );
DECLARE_SPELL_FUN(      spell_spiral_blast      );
DECLARE_SPELL_FUN(      spell_scorching_surge   );
DECLARE_SPELL_FUN(      spell_ethereal_fist                 );
DECLARE_SPELL_FUN(      spell_spectral_furor                );
DECLARE_SPELL_FUN(      spell_hand_of_chaos                 );
DECLARE_SPELL_FUN(      spell_disruption                    );
DECLARE_SPELL_FUN(      spell_sonic_resonance               );
DECLARE_SPELL_FUN(      spell_mind_wrack                    );
DECLARE_SPELL_FUN(      spell_mind_wrench                   );
DECLARE_SPELL_FUN(      spell_revive                        );
DECLARE_SPELL_FUN(      spell_sulfurous_spray               );
DECLARE_SPELL_FUN(      spell_caustic_fount                 );
DECLARE_SPELL_FUN(      spell_acetum_primus                 );
DECLARE_SPELL_FUN(      spell_galvanic_whip                 );
DECLARE_SPELL_FUN(      spell_magnetic_thrust               );
DECLARE_SPELL_FUN(      spell_quantum_spike                 );
DECLARE_SPELL_FUN(      spell_black_hand                    );
DECLARE_SPELL_FUN(      spell_black_fist                    );
DECLARE_SPELL_FUN(      spell_black_lightning               );
DECLARE_SPELL_FUN(      spell_midas_touch                   );

/*
 * Our function prototypes.
 * One big lump ... this is every function in Merc.
 */

#ifdef __cplusplus
extern "C" {
#endif

  /* copyover.c */
  void copyover_recover( void );

  /* act_comm.c */
  bool check_parse_name( const char *name );
  char *drunk_speech( const char *argument, CHAR_DATA *ch );
  void talk_channel( CHAR_DATA *ch, const char *argument,
		     int channel, const char *verb );
  void sound_to_room( const ROOM_INDEX_DATA *room, const char *argument );
  bool circle_follow( const CHAR_DATA *ch, const CHAR_DATA *victim );
  void add_follower( CHAR_DATA *ch, CHAR_DATA *master );
  void stop_follower( CHAR_DATA *ch );
  void die_follower( CHAR_DATA *ch );
  bool is_same_group( const CHAR_DATA *ach, const CHAR_DATA *bch );
  void to_channel( const char *argument, int channel,
		   const char *verb, short level );
  void talk_auction( const char *argument );
  bool knows_language( const CHAR_DATA *ch, int language, const CHAR_DATA *cch );
  bool can_learn_lang( const CHAR_DATA *ch, int language );
  int countlangs( int languages );

  /* act_info.c */
  int get_race_from_name( const char *arg );
  int get_class_from_name( const char *arg );
  void show_condition( const CHAR_DATA *ch, const CHAR_DATA *victim );
  bool check_blind( const CHAR_DATA *ch );
  char *format_obj_to_char( const OBJ_DATA *obj, const CHAR_DATA *ch, bool fShort );
  void show_list_to_char( const OBJ_DATA *list, CHAR_DATA *ch,
			  bool fShort, bool fShowNothing );

  /* act_move.c */
  bool has_key( const CHAR_DATA *ch, int key );
  void set_bexit_flag( EXIT_DATA *pexit, int flag );
  void remove_bexit_flag( EXIT_DATA *pexit, int flag );
  ROOM_INDEX_DATA *generate_exit( ROOM_INDEX_DATA *in_room, EXIT_DATA **pexit );
  void  clear_vrooms( void );
  EXIT_DATA *find_door( CHAR_DATA *ch, const char *arg, bool quiet );
  EXIT_DATA *get_exit( const ROOM_INDEX_DATA *room, short dir );
  EXIT_DATA *get_exit_to( const ROOM_INDEX_DATA *room, short dir, int vnum );
  EXIT_DATA *get_exit_num( const ROOM_INDEX_DATA *room, short count );
  ch_ret move_char( CHAR_DATA *ch, EXIT_DATA *pexit, int fall );
  void teleport( CHAR_DATA *ch, short room, int flags );
  short encumbrance( const CHAR_DATA *ch, short move );
  bool will_fall( CHAR_DATA *ch, int fall );
  int wherehome( const CHAR_DATA *ch );

  /* act_obj.c */
  bool remove_obj( CHAR_DATA *ch, int iWear, bool fReplace );
  obj_ret damage_obj( OBJ_DATA *obj );
  short get_obj_resistance( const OBJ_DATA *obj );
  void save_clan_storeroom( CHAR_DATA *ch, const Clan *clan );
  void obj_fall( OBJ_DATA *obj, bool through );

  /* act_wiz.c */
  void save_banlist( void );
  int str_count(const char *psource, const char *ptarget);
  void close_area( AREA_DATA *pArea );
  ROOM_INDEX_DATA *find_location( CHAR_DATA *ch, char *arg );
  void echo_to_room( short AT_COLOR, ROOM_INDEX_DATA *room,
		     const char *argument );
  void echo_to_all( short AT_COLOR, const char *argument, short tar );
  void get_reboot_string( void );
  void free_social( SOCIALTYPE *social );
  void unlink_social( SOCIALTYPE *social );
  void add_social( SOCIALTYPE *social );
  void free_command( CMDTYPE *command );
  void unlink_command( CMDTYPE *command );
  void add_command( CMDTYPE *command );

  /* boards.c */
  void load_boards( void );
  BOARD_DATA *get_board( OBJ_DATA *obj );
  BOARD_DATA *find_board( CHAR_DATA *ch );
  void free_note( NOTE_DATA *pnote );
  void write_boards_txt( void );
  void operate_on_note( CHAR_DATA *ch, char *arg_passed, bool IS_MAIL );

  /* planets.c */
  void write_planet_list( void );
  PLANET_DATA *get_planet( const char *name );
  void  load_planets( void );
  void  save_planet( const PLANET_DATA *planet );
  long get_taxes( const PLANET_DATA *planet );

  /* bounty.c */
  void disintegration( const CHAR_DATA *ch, const CHAR_DATA *victim, long amount );
  BOUNTY_DATA *get_disintegration( const char *target );
  void load_bounties( void );
  void save_bounties( void );
  void save_disintegrations( void );
  void remove_disintegration( BOUNTY_DATA *bounty );
  void claim_disintegration( CHAR_DATA *ch , const CHAR_DATA *victim );
  bool is_disintegration( const CHAR_DATA *victim );

  /* const.c */
  int get_saveflag(const char*);
  const char *get_dir_name( int dir );
  int get_rev_dir( int dir );
  size_t spaceobj_type_size( void );
  const char *get_spaceobj_type(size_t sotype);
  int get_spaceobj_type_from_name(const char *name);
  const char * const *get_spaceobj_type_table( void );
  int get_ability(const char *arg);
  size_t ability_name_size(void);
  size_t spicetable_size(void);
  const char *get_spicetype_name( size_t spicetype );
  size_t crystaltable_size(void);
  const char *get_crystaltype_name( size_t crystaltype );
  int get_crystaltype( const char* );
  size_t weapontable_size( void );
  const char *get_weapontype_name( size_t weapontype );
  int get_weapontype( const char* );
  int get_attacktype( const char *type );
  size_t attacktable_size( void );
  const char *get_attacktype_name( size_t type );
  size_t spelldamage_size( void );
  const char *get_spelldamage_name( size_t type );
  size_t spellaction_size( void );
  const char *get_spellaction_name( size_t type );
  size_t spellpower_size( void );
  const char *get_spellpower_name( size_t type );
  size_t spellclass_size( void );
  const char *get_spellclass_name( size_t type );
  size_t spellflags_size( void );
  const char *get_spellflag_name( size_t type );
  size_t spellsaves_size( void );
  const char *get_spellsaves_name( size_t type );
  size_t spelltarget_size( void );
  const char *get_spelltarget_name( size_t type );
  int get_spicetype( const char* );
  int get_npc_race( const char* );
  int get_actflag( const char* );
  int get_plrflag( const char* );
  int get_pcflag( const char* );
  int get_risflag( const char* );
  int get_partflag( const char* );
  int get_attackflag( const char* );
  int get_defenseflag( const char* );
  int get_langflag( const char* );
  int get_trigflag( const char* );
  int get_roomflag( const char* );
  int get_exitflag( const char* );
  int get_wearloc( const char* );
  int get_trapflag( const char* );
  int get_areaflag( const char* );
  int get_objecttype( const char *type );
  int get_affecttype( const char *type );
  int get_affectedflag( const char *flag );
  int get_objectflag( const char *flag );
  int get_wearflag( const char *flag );
  int get_mpflag( const char *flag );
  int get_dir( const char *txt  );
  int get_vip_flag( const char *flag );
  int get_wanted_flag( const char *flag );
  int get_spelldamage( const char *txt  );
  int get_spellaction( const char *txt  );
  int get_spellclass( const char *txt  );
  int get_spellpower( const char *txt  );
  int get_spellflag( const char *txt  );
  int get_spellsave( const char *txt  );
  int get_spelltarget( const char *txt  );

  /* space.c */
  void echo_to_room_dnr( int ecolor, ROOM_INDEX_DATA *room, const char *argument );
  void         load_spaceobjects( void );
  void         save_spaceobject( SPACE_DATA *spaceobject );
  SPACE_DATA * spaceobject_from_name( const char *name );
  SPACE_DATA * spaceobject_from_vnum( int vnum );
  void update_spaceobjects( void );
  void update_missiles( void );
  void         new_missile( SHIP_DATA *ship, SHIP_DATA *target, CHAR_DATA *ch,
                            int missiletype );
  void         extract_missile( MISSILE_DATA *missile );

  /* comm.c */
  char *obj_short( const OBJ_DATA *obj );
  void close_socket( DESCRIPTOR_DATA *dclose, bool force );
  bool write_to_descriptor( socket_t desc, char *txt, int length );
  void write_to_buffer( DESCRIPTOR_DATA *d, const char *txt, size_t length );
  void write_to_pager( DESCRIPTOR_DATA *d, const char *txt, size_t length );
  void send_to_char( const char *txt, const CHAR_DATA *ch );
  void send_to_pager( const char *txt, const CHAR_DATA *ch );
  void set_char_color( short AType, CHAR_DATA *ch );
  void set_pager_color( short AType, CHAR_DATA *ch );
  void ch_printf( const CHAR_DATA *ch, const char *fmt, ... );
  void pager_printf(const CHAR_DATA *ch, const char *fmt, ...);
  void act( short AType, const char *format, CHAR_DATA *ch,
            const void *arg1, const void *arg2, int type );

  /* reset.c */
  char *sprint_reset( CHAR_DATA *ch, RESET_DATA *pReset, short num, bool rlist );
  RESET_DATA *make_reset( char letter, int extra, int arg1, int arg2, int arg3 );
  RESET_DATA *add_reset( AREA_DATA *tarea, char letter, int extra,
			 int arg1, int arg2, int arg3 );
  RESET_DATA *place_reset( AREA_DATA *tarea, char letter,
			   int extra, int arg1, int arg2, int arg3 );
  void  reset_area( AREA_DATA * pArea );

  /* db.c */
  void show_vnums( CHAR_DATA *ch, int low, int high, bool proto, bool shownl,
		   const char *loadst, const char *notloadst );
  void save_sysdata( SYSTEM_DATA sys );
  void append_file( CHAR_DATA *ch, const char *file, const char *str );
  void  show_file( CHAR_DATA *ch, const char *filename );
  void  boot_db( bool fCopyover );
  void  area_update( void );
  void  add_char( CHAR_DATA *ch );
  CHAR_DATA *create_mobile( MOB_INDEX_DATA *pMobIndex );
  OBJ_DATA *create_object( OBJ_INDEX_DATA *pObjIndex, int level );
  void  clear_char( CHAR_DATA *ch );
  void  free_char( CHAR_DATA *ch );
  char *        get_extra_descr( const char *name, EXTRA_DESCR_DATA *ed );
  MOB_INDEX_DATA *get_mob_index( short vnum );
  OBJ_INDEX_DATA *get_obj_index( int vnum );
  ROOM_INDEX_DATA *get_room_index( int vnum );
  void  bug( const char *str, ... );
  void log_printf( const char *fmt, ... );
  void log_string_plus( const char *str, short log_type, short level );
  ROOM_INDEX_DATA *make_room( int vnum );
  OBJ_INDEX_DATA *make_object( int vnum, int cvnum, char *name );
  MOB_INDEX_DATA *make_mobile( short vnum, short cvnum, char *name );
  EXIT_DATA *make_exit( ROOM_INDEX_DATA *pRoomIndex, ROOM_INDEX_DATA *to_room, short door );
  void  fix_area_exits( AREA_DATA *tarea );
  void  load_area_file( AREA_DATA *tarea, char *filename );
  void  randomize_exits( ROOM_INDEX_DATA *room, short maxdir );
  void  make_wizlist( void );
  bool    delete_room( ROOM_INDEX_DATA *room );
  bool    delete_obj( OBJ_INDEX_DATA *obj );
  bool    delete_mob( MOB_INDEX_DATA *mob );

  void  sort_area( AREA_DATA *pArea, bool proto );

  /* build.c */
  void mpedit( CHAR_DATA *ch, MPROG_DATA *mprg, int mptype, char *argument );
  void rpedit( CHAR_DATA *ch, MPROG_DATA *mprg, int mptype, char *argument );
  void write_area_list( void );

  bool can_rmodify( const CHAR_DATA *ch, const ROOM_INDEX_DATA *room );
  bool can_omodify( const CHAR_DATA *ch, const OBJ_DATA *obj  );
  bool can_mmodify( const CHAR_DATA *ch, const CHAR_DATA *mob );
  bool can_medit( const CHAR_DATA *ch, const MOB_INDEX_DATA *mob );
  void free_reset( AREA_DATA *are, RESET_DATA *res );
  void free_area( AREA_DATA *are );
  void assign_area( CHAR_DATA *ch );
  EXTRA_DESCR_DATA *SetRExtra( ROOM_INDEX_DATA *room, char *keywords );
  bool DelRExtra( ROOM_INDEX_DATA *room, char *keywords );
  EXTRA_DESCR_DATA *SetOExtra( OBJ_DATA *obj, char *keywords );
  bool DelOExtra( OBJ_DATA *obj, char *keywords );
  EXTRA_DESCR_DATA *SetOExtraProto( OBJ_INDEX_DATA *obj, char *keywords );
  bool DelOExtraProto( OBJ_INDEX_DATA *obj, char *keywords );
  void fold_area( AREA_DATA *tarea, char *filename, bool install );

  /* fight.c */
  ch_ret  one_hit( CHAR_DATA *ch, CHAR_DATA *victim, int dt );
  int xp_compute( const CHAR_DATA *gch, const CHAR_DATA *victim );
  int   max_fight( CHAR_DATA *ch );
  void  violence_update( void );
  ch_ret        multi_hit( CHAR_DATA *ch, CHAR_DATA *victim, int dt );
  short ris_damage( CHAR_DATA *ch, short dam, int ris );
  ch_ret        damage( CHAR_DATA *ch, CHAR_DATA *victim, int dam, int dt );
  void  update_pos( CHAR_DATA *victim );
  void  set_fighting( CHAR_DATA *ch, CHAR_DATA *victim );
  void  stop_fighting( CHAR_DATA *ch, bool fBoth );
  void  free_fight( CHAR_DATA *ch );
  CHAR_DATA *who_fighting( CHAR_DATA *ch );
  void  check_killer( CHAR_DATA *ch, CHAR_DATA *victim );
  void  check_attacker( CHAR_DATA *ch, CHAR_DATA *victim );
  void  death_cry( CHAR_DATA *ch );
  void  stop_hunting( CHAR_DATA *ch );
  void  stop_hating( CHAR_DATA *ch );
  void  stop_fearing( CHAR_DATA *ch );
  void  start_hunting( CHAR_DATA *ch, CHAR_DATA *victim );
  void  start_hating( CHAR_DATA *ch, CHAR_DATA *victim );
  void  start_fearing( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  is_hunting( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  is_hating( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  is_fearing( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  is_safe( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  is_safe_nm( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  legal_loot( CHAR_DATA *ch, CHAR_DATA *victim );
  bool    check_illegal_pk( CHAR_DATA *ch, CHAR_DATA *victim );
  void    raw_kill( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  in_arena( CHAR_DATA *ch );


  /* makeobjs.c */
  void  make_corpse( CHAR_DATA *ch, CHAR_DATA *killer );
  void  make_blood( CHAR_DATA *ch );
  void  make_bloodstain( CHAR_DATA *ch );
  void  make_scraps( OBJ_DATA *obj );
  void  make_fire( ROOM_INDEX_DATA *in_room, short timer );
  OBJ_DATA *make_trap( int v0, int v1, int v2, int v3 );
  OBJ_DATA *create_money( int amount );

  /* misc.c */
  bool is_valid_language( int language );
  void pullorpush( CHAR_DATA *ch, OBJ_DATA *obj, bool pull );
  void actiondesc( CHAR_DATA *ch, OBJ_DATA *obj, void *vo );
  void jedi_checks( CHAR_DATA *ch );
  void jedi_bonus( CHAR_DATA *ch );
  void sith_penalty( CHAR_DATA *ch );

  /* mud_comm.c */
  CHAR_DATA *get_char_room_mp( CHAR_DATA *ch, char *argument );
  int get_color(const char *argument);
  char *mprog_type_to_name( int type );

  /* mud_prog.c */
  void mprog_wordlist_check( char * arg, CHAR_DATA *mob,
			     CHAR_DATA* actor, OBJ_DATA* object,
			     void* vo, int type );
  void mprog_percent_check( CHAR_DATA *mob, CHAR_DATA* actor,
			    OBJ_DATA* object, void* vo, int type );
  void mprog_act_trigger( char* buf, CHAR_DATA* mob,
			  CHAR_DATA* ch, OBJ_DATA* obj, void* vo );
  void mprog_bribe_trigger( CHAR_DATA* mob, CHAR_DATA* ch, int amount );
  void mprog_entry_trigger( CHAR_DATA* mob );
  void mprog_give_trigger( CHAR_DATA* mob, CHAR_DATA* ch, OBJ_DATA* obj );
  void mprog_greet_trigger( CHAR_DATA* mob );
  void mprog_fight_trigger( CHAR_DATA* mob, CHAR_DATA* ch );
  void mprog_hitprcnt_trigger( CHAR_DATA* mob, CHAR_DATA* ch );
  void mprog_death_trigger( CHAR_DATA *killer, CHAR_DATA* mob );
  void mprog_random_trigger( CHAR_DATA* mob );
  void mprog_speech_trigger( char* txt, CHAR_DATA* mob );
  void mprog_script_trigger( CHAR_DATA *mob );
  void mprog_hour_trigger( CHAR_DATA *mob );
  void mprog_time_trigger( CHAR_DATA *mob );
  void progbug( char *str, CHAR_DATA *mob );
  void rset_supermob( ROOM_INDEX_DATA *room );
  void release_supermob( void );

  /* player.c */
  void  set_title( CHAR_DATA *ch, const char *title );

  /* skills.c */
  bool  check_skill( CHAR_DATA *ch, char *command, char *argument );
  void  learn_from_success( CHAR_DATA *ch, int sn );
  void  learn_from_failure( CHAR_DATA *ch, int sn );
  bool  check_parry( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  check_dodge( CHAR_DATA *ch, CHAR_DATA *victim );
  bool  check_grip( CHAR_DATA *ch, CHAR_DATA *victim );
  void  disarm( CHAR_DATA *ch, CHAR_DATA *victim );
  void  trip( CHAR_DATA *ch, CHAR_DATA *victim );
  bool permsneak( CHAR_DATA *ch );

  /* handler.c */
  bool can_take_proto( const CHAR_DATA *ch );
  void explode( OBJ_DATA *obj );
  int exp_level( short level );
  void affect_modify( CHAR_DATA *ch, AFFECT_DATA *paf, bool fAdd );
  void affect_to_char( CHAR_DATA *ch, AFFECT_DATA *paf );
  void affect_remove( CHAR_DATA *ch, AFFECT_DATA *paf );
  void affect_strip( CHAR_DATA *ch, int sn );
  void affect_join( CHAR_DATA *ch, AFFECT_DATA *paf );
  void char_from_room( CHAR_DATA *ch );
  void char_to_room( CHAR_DATA *ch, ROOM_INDEX_DATA *pRoomIndex );
  OBJ_DATA *obj_to_char( OBJ_DATA *obj, CHAR_DATA *ch );
  void obj_from_char( OBJ_DATA *obj );
  int apply_ac( const OBJ_DATA *obj, int iWear );
  int count_obj_list( const OBJ_INDEX_DATA *obj, const OBJ_DATA *list );
  void obj_from_room( OBJ_DATA *obj );
  OBJ_DATA *obj_to_room( OBJ_DATA *obj, ROOM_INDEX_DATA *pRoomIndex );
  OBJ_DATA *obj_to_obj( OBJ_DATA *obj, OBJ_DATA *obj_to );
  void obj_from_obj( OBJ_DATA *obj );
  void extract_obj( OBJ_DATA *obj );
  void extract_exit( ROOM_INDEX_DATA *room, EXIT_DATA *pexit );
  void extract_room( ROOM_INDEX_DATA *room );
  void clean_room( ROOM_INDEX_DATA *room );
  void clean_obj( OBJ_INDEX_DATA *obj );
  void clean_mob( MOB_INDEX_DATA *mob );
  void clean_resets( AREA_DATA *tarea );
  void extract_char( CHAR_DATA *ch, bool fPull );
  CHAR_DATA *get_char_room( const CHAR_DATA *ch, const char *argument );
  CHAR_DATA *get_char_world( const CHAR_DATA *ch, const char *argument );
  OBJ_DATA *get_obj_type( const OBJ_INDEX_DATA *pObjIndexData );
  OBJ_DATA *get_obj_list( const CHAR_DATA *ch, const char *argument, OBJ_DATA *list );
  OBJ_DATA *get_obj_list_rev( const CHAR_DATA *ch, const char *argument, OBJ_DATA *list );
  OBJ_DATA *get_obj_here( const CHAR_DATA *ch, const char *argument );
  OBJ_DATA *get_obj_world( const CHAR_DATA *ch, const char *argument );
  int get_obj_number( const OBJ_DATA *obj );
  int get_obj_weight( const OBJ_DATA *obj );
  bool room_is_dark( const ROOM_INDEX_DATA *pRoomIndex );
  bool room_is_private( const CHAR_DATA *ch, const ROOM_INDEX_DATA *pRoomIndex );
  const char *item_type_name( const OBJ_DATA *obj );
  const char *affect_loc_name( int location );
  const char *affect_bit_name( int vector );
  const char *extra_bit_name( int extra_flags );
  const char *magic_bit_name( int magic_flags );
  ch_ret check_for_trap( CHAR_DATA *ch, const OBJ_DATA *obj, int flag );
  ch_ret check_room_for_traps( CHAR_DATA *ch, int flag );
  bool is_trapped( const OBJ_DATA *obj );
  OBJ_DATA *get_trap( const OBJ_DATA *obj );
  ch_ret spring_trap( CHAR_DATA *ch, OBJ_DATA *obj );
  void showaffect( const CHAR_DATA *ch, const AFFECT_DATA *paf );
  void set_cur_obj( OBJ_DATA *obj );
  bool obj_extracted( const OBJ_DATA *obj );
  void queue_extracted_obj( OBJ_DATA *obj );
  void clean_obj_queue( void );
  void set_cur_char( CHAR_DATA *ch );
  bool char_died( const CHAR_DATA *ch );
  void queue_extracted_char( CHAR_DATA *ch, bool extract );
  void clean_char_queue( void );
  void add_timer( CHAR_DATA *ch, short type, short count, DO_FUN *fun, int value );
  TIMER * get_timerptr( const CHAR_DATA *ch, short type );
  short get_timer( const CHAR_DATA *ch, short type );
  void extract_timer( CHAR_DATA *ch, TIMER *timer );
  void remove_timer( CHAR_DATA *ch, short type );
  bool in_soft_range( const CHAR_DATA *ch, const AREA_DATA *tarea );
  bool in_hard_range( const CHAR_DATA *ch, const AREA_DATA *tarea );
  bool chance( const CHAR_DATA *ch, short percent );
  bool chance_attrib( const CHAR_DATA *ch, short percent, short attrib );
  OBJ_DATA *clone_object( const OBJ_DATA *obj );
  void split_obj( OBJ_DATA *obj, int num );
  void separate_obj( OBJ_DATA *obj );
  bool empty_obj( OBJ_DATA *obj,OBJ_DATA *destobj,ROOM_INDEX_DATA *destroom );
  OBJ_DATA *find_obj( CHAR_DATA *ch, const char *argument, bool carryonly );
  void boost_economy( AREA_DATA *tarea, int gold );
  void lower_economy( AREA_DATA *tarea, int gold );
  void economize_mobgold( CHAR_DATA *mob );
  bool economy_has( const AREA_DATA *tarea, int gold );
  int count_users(const OBJ_DATA *obj);

  /* interp.c */
  bool  check_pos( CHAR_DATA *ch, int position );
  void  interpret( CHAR_DATA *ch, char *argument );
  SOCIALTYPE *find_social( char *command );
  CMDTYPE *find_command( char *command );
  void  hash_commands( void );
  void  send_timer( struct timerset *vtime, CHAR_DATA *ch );
  void  update_userec( struct timeval *time_used, struct timerset *userec );

  /* magic.c */
  int ris_save( const CHAR_DATA *ch, int save_chance, int ris );
  void successful_casting( SKILLTYPE *skill, CHAR_DATA *ch,
			   CHAR_DATA *victim, OBJ_DATA *obj );
  void failed_casting( SKILLTYPE *skill, CHAR_DATA *ch,
		       CHAR_DATA *victim, OBJ_DATA *obj );
  bool is_immune( const CHAR_DATA *ch, short damtype );
  bool check_save( int sn, int level, const CHAR_DATA *ch, const CHAR_DATA *victim );
  void immune_casting( SKILLTYPE *skill, CHAR_DATA *ch, CHAR_DATA *victim, OBJ_DATA *obj );
  void *locate_targets( CHAR_DATA *ch, char *arg, int sn, CHAR_DATA **victim, OBJ_DATA **obj );
  bool  process_spell_components( CHAR_DATA *ch, int sn );
  int   ch_slookup( const CHAR_DATA *ch, const char *name );
  int   find_spell( const CHAR_DATA *ch, const char *name, bool know );
  int   find_skill( const CHAR_DATA *ch, const char *name, bool know );
  int   find_weapon( const CHAR_DATA *ch, const char *name, bool know );
  int   find_tongue( const CHAR_DATA *ch, const char *name, bool know );
  int   skill_lookup( const char *name );
  int   herb_lookup( const char *name );
  int   slot_lookup( int slot );
  int   bsearch_skill( const char *name, int first, int top );
  int   bsearch_skill_exact( const char *name, int first, int top );
  bool  saves_poison_death( int level, const CHAR_DATA *victim ) ;
  bool saves_wands( int level, const CHAR_DATA *victim );
  bool  saves_para_petri( int level, const CHAR_DATA *victim );
  bool  saves_breath( int level, const CHAR_DATA *victim );
  bool  saves_spell_staff( int level, const CHAR_DATA *victim );
  ch_ret obj_cast_spell( int sn, int level, CHAR_DATA *ch, CHAR_DATA *victim, OBJ_DATA *obj );
  int dice_parse( const CHAR_DATA *ch, int level, char *exp );
  SKILLTYPE *get_skilltype( int sn );

  /* save.c */
  /* object saving defines for fread/write_obj. -- Altrag */
#define OS_CARRY        0
#define OS_CORPSE       1
  void  save_char_obj( CHAR_DATA *ch );
  void  save_clone( CHAR_DATA *ch );
  bool  load_char_obj( DESCRIPTOR_DATA *d, char *name, bool preload );
  void  set_alarm ( long seconds );
  void  requip_char( CHAR_DATA *ch );
  void fwrite_obj( const CHAR_DATA *ch, const OBJ_DATA *obj, FILE *fp,
		   int iNest, short os_type );
  void  fread_obj( CHAR_DATA *ch,  FILE *fp, short os_type );
  void  de_equip_char( CHAR_DATA *ch );
  void  re_equip_char( CHAR_DATA *ch );
  void  save_home( CHAR_DATA *ch );
  void save_storeroom( ROOM_INDEX_DATA *room );
  void load_storerooms( void );

  /* shops.c */
  int get_cost_quit( CHAR_DATA *ch );

  /* special.c */
  SPEC_FUN *spec_lookup( const char *name );
  const char *lookup_spec( SPEC_FUN *special );

  /* tables.c */
  int   get_skill( char *skilltype );
  char *        spell_name( SPELL_FUN *spell );
  char *        skill_name( DO_FUN *skill );
  void  load_skill_table( void );
  void  save_skill_table( void );
  void  sort_skill_table( void );
  void  load_socials( void );
  void  save_socials( void );
  void  load_commands( void );
  void  save_commands( void );
  SPELL_FUN *spell_function( const char *name );
  DO_FUN *skill_function( const char *name );
  void  load_herb_table( void );
  void  save_herb_table( void );

  /* track.c */
  void  found_prey( CHAR_DATA *ch, CHAR_DATA *victim );
  void  hunt_victim( CHAR_DATA *ch );

  /* swskills.c */
  void add_reinforcements( CHAR_DATA *ch );

  /* update.c */
  void advance_level( CHAR_DATA *ch , int ability );
  void gain_exp( CHAR_DATA *ch, short ability, long gain );
  long lose_exp( CHAR_DATA *ch, short ability, long loss );
  void gain_condition( CHAR_DATA *ch, int iCond, int value );
  void update_handler( void );
  void reboot_check( time_t reset );
  void auction_update( void );
  void remove_portal( OBJ_DATA *portal );
  int max_level( const CHAR_DATA *ch, int ability );
  bool is_droid( const CHAR_DATA *ch );

  /* newscore.c */
  const char *get_race( const CHAR_DATA *ch );

  /* badname functions */
  bool  check_bad_name( const char *name );
  int   add_bad_name( const char *name );

  /* vendor.c*/
  void fwrite_vendor( FILE *fp, CHAR_DATA *mob );
  CHAR_DATA *fread_vendor( FILE *fp );
  void load_vendors( void );
  void save_vendor( CHAR_DATA *ch );

  /*
#define SHORT 1
#define INT 2
#define CHAR 3
#define STRING 4
#define SPECIAL 5


#define NO_PAGE    0
#define MOB_PAGE_A 1
#define MOB_PAGE_B 2
#define MOB_PAGE_C 3
#define MOB_PAGE_D 4
#define MOB_PAGE_E 5
#define MOB_PAGE_F 17
#define MOB_HELP_PAGE 14
#define ROOM_PAGE_A 6
#define ROOM_PAGE_B 7
#define ROOM_PAGE_C 8
#define ROOM_HELP_PAGE 15
#define OBJ_PAGE_A 9
#define OBJ_PAGE_B 10
#define OBJ_PAGE_C 11
#define OBJ_PAGE_D 12
#define OBJ_PAGE_E 13
#define OBJ_HELP_PAGE 16
#define CONTROL_PAGE_A 18
#define CONTROL_HELP_PAGE 19

#define NO_TYPE   0
#define MOB_TYPE  1
#define OBJ_TYPE  2
#define ROOM_TYPE 3
#define CONTROL_TYPE 4

#define SUB_NORTH DIR_NORTH
#define SUB_EAST  DIR_EAST
#define SUB_SOUTH DIR_SOUTH
#define SUB_WEST  DIR_WEST
#define SUB_UP    DIR_UP
#define SUB_DOWN  DIR_DOWN
#define SUB_NE    DIR_NORTHEAST
#define SUB_NW    DIR_NORTHWEST
#define SUB_SE    DIR_SOUTHEAST
#define SUB_SW    DIR_SOUTHWEST
  */
  /*
   * defines for use with this get_affect function
   */

#define RIS_000         BV00
#define RIS_R00         BV01
#define RIS_0I0         BV02
#define RIS_RI0         BV03
#define RIS_00S         BV04
#define RIS_R0S         BV05
#define RIS_0IS         BV06
#define RIS_RIS         BV07

#define GA_AFFECTED     BV09
#define GA_RESISTANT    BV10
#define GA_IMMUNE       BV11
#define GA_SUSCEPTIBLE  BV12
#define GA_RIS          BV30

  /*
   * mudprograms stuff
   */
  extern        CHAR_DATA *supermob;

  void oprog_speech_trigger( char *txt, CHAR_DATA *ch );
  void oprog_random_trigger( OBJ_DATA *obj );
  void oprog_wear_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  bool oprog_use_trigger( CHAR_DATA *ch, OBJ_DATA *obj,
                          CHAR_DATA *vict, OBJ_DATA *targ, void *vo );
  void oprog_remove_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_examine_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_sac_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_damage_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_repair_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_drop_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_zap_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_greet_trigger( CHAR_DATA *ch );
  void oprog_get_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  char *oprog_type_to_name( int type );
  void oprog_pull_trigger( CHAR_DATA *ch, OBJ_DATA *obj );
  void oprog_push_trigger( CHAR_DATA *ch, OBJ_DATA *obj );

  void rprog_leave_trigger( CHAR_DATA *ch );
  void rprog_enter_trigger( CHAR_DATA *ch );
  void rprog_sleep_trigger( CHAR_DATA *ch );
  void rprog_rest_trigger( CHAR_DATA *ch );
  void rprog_rfight_trigger( CHAR_DATA *ch );
  void rprog_death_trigger( CHAR_DATA *killer, CHAR_DATA *ch );
  void rprog_speech_trigger( char *txt, CHAR_DATA *ch );
  void rprog_random_trigger( CHAR_DATA *ch );
  void rprog_time_trigger( CHAR_DATA *ch );
  void rprog_hour_trigger( CHAR_DATA *ch );
  char *rprog_type_to_name(int type );

#define OPROG_ACT_TRIGGER
#ifdef OPROG_ACT_TRIGGER
  void oprog_act_trigger( char *buf, OBJ_DATA *mobj, CHAR_DATA *ch,
                          OBJ_DATA *obj, void *vo );
#endif
#define RPROG_ACT_TRIGGER
#ifdef RPROG_ACT_TRIGGER
  void rprog_act_trigger( char *buf, ROOM_INDEX_DATA *room, CHAR_DATA *ch,
                          OBJ_DATA *obj, void *vo );
#endif

#define GET_BETTED_ON(ch)    ((ch)->betted_on)
#define GET_BET_AMT(ch) ((ch)->bet_amt)
#define IN_ARENA(ch)            (IS_SET((ch)->in_room->room_flags, ROOM_ARENA))

#ifdef __cplusplus
}
#endif

#endif /* include guard */
