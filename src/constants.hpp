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

#ifndef _SWRIP_CONSTANTS_HPP_
#define _SWRIP_CONSTANTS_HPP_

#include <climits>
#include "types.hpp"

constexpr vnum_t INVALID_VNUM = 0;

constexpr auto DUR_CONV = 23.333333333333333333333333;
constexpr auto HIDDEN_TILDE = '*';

constexpr auto BV00 = 1 << 0;
constexpr auto BV01 = 1 << 1;
constexpr auto BV02 = 1 << 2;
constexpr auto BV03 = 1 << 3;
constexpr auto BV04 = 1 << 4;
constexpr auto BV05 = 1 << 5;
constexpr auto BV06 = 1 << 6;
constexpr auto BV07 = 1 << 7;
constexpr auto BV08 = 1 << 8;
constexpr auto BV09 = 1 << 9;
constexpr auto BV10 = 1 << 10;
constexpr auto BV11 = 1 << 11;
constexpr auto BV12 = 1 << 12;
constexpr auto BV13 = 1 << 13;
constexpr auto BV14 = 1 << 14;
constexpr auto BV15 = 1 << 15;
constexpr auto BV16 = 1 << 16;
constexpr auto BV17 = 1 << 17;
constexpr auto BV18 = 1 << 18;
constexpr auto BV19 = 1 << 19;
constexpr auto BV20 = 1 << 20;
constexpr auto BV21 = 1 << 21;
constexpr auto BV22 = 1 << 22;
constexpr auto BV23 = 1 << 23;
constexpr auto BV24 = 1 << 24;
constexpr auto BV25 = 1 << 25;
constexpr auto BV26 = 1 << 26;
constexpr auto BV27 = 1 << 27;
constexpr auto BV28 = 1 << 28;
constexpr auto BV29 = 1 << 29;
constexpr auto BV30 = 1 << 30;
constexpr auto BV31 = 1 << 31;
/* 32 USED! DO NOT ADD MORE! SB */
//#define MAX_BIT 32
constexpr size_t MAX_BIT = 32;

namespace Flag
{
    constexpr size_t MAX = 32;

    namespace Wanted
    {
        enum :size_t
        {
            Coruscant,
            Kashyyyk,
            Ryloth,
            _03,
            _04,
            MonCalamari,
            Honoghr,
            Gamorr,
            Tatooine,
            Adari,
            Byss,
            Endor,
            _12,
            _13,
            _14,
            _15,
            Corellia,
            Hoth,
            _18,
            _19,
            Kuat
        };
    }
}

constexpr auto MAX_LAYERS = 8;      /* maximum clothing layers */
constexpr auto MAX_NEST = 100;      /* maximum container nesting */

constexpr auto MAX_KILLTRACK = 20;      /* track mob vnums killed */
constexpr auto MAX_COMMAND = 126; /* Size of CommandTable */
constexpr auto MAX_STAT = 25;

/*
 * Game parameters.
 * Increase the max'es if you add more of something.
 * Adjust the pulse numbers to suit yourself.
 */
constexpr auto MIN_NAME_LENGTH = 3;
constexpr auto MAX_NAME_LENGTH = 12;
constexpr vnum_t MIN_VNUM = 1;
constexpr vnum_t MAX_VNUM = SHRT_MAX;
constexpr auto MAX_EXP_WORTH = 500000;
constexpr auto MIN_EXP_WORTH = 25;

constexpr auto MAX_REXITS = 20;   /* Maximum exits allowed in 1 room */
constexpr auto MAX_SKILL = 276;
constexpr auto MAX_RL_ABILITY = 8;
constexpr auto MAX_NPC_RACE = 91;
constexpr auto MAX_LEVEL = 105;
constexpr auto MAX_ABILITY_LEVEL = 150;
constexpr auto MAX_CLAN = 50;
constexpr auto MAX_PLANET = 100;
constexpr auto MAX_SHIP = 1000;
constexpr auto MAX_BOUNTY = 255;

constexpr auto MAX_HERB = 20;

constexpr auto LEVEL_IMPLEMENTOR = MAX_LEVEL;
constexpr auto LEVEL_SUB_IMPLEM = MAX_LEVEL - 1;
constexpr auto LEVEL_GREATER = MAX_LEVEL - 2;
constexpr auto LEVEL_CREATOR = MAX_LEVEL - 3;
constexpr auto LEVEL_IMMORTAL = MAX_LEVEL - 4;
constexpr auto LEVEL_AVATAR = MAX_LEVEL - 5;

constexpr auto LEVEL_LOG = LEVEL_CREATOR;
constexpr auto LEVEL_HIGOD = LEVEL_GREATER;

constexpr vnum_t MOB_VNUM_VENDOR = 4;  /*vnum of vendor*/
constexpr auto LEVEL_BUY_VENDOR = 50;  /* minimum level to buy a vendor */
constexpr auto COST_BUY_VENDOR = 1000000;  /* cost of a vendor */
constexpr vnum_t OBJ_VNUM_DEED = 4;  /* vnum of deed */
constexpr vnum_t ROOM_VNUM_VENSTOR = 4;  /* where messed up vendors go! */

constexpr auto PULSE_PER_SECOND = 4;
constexpr auto PULSE_MINUTE = 60 * PULSE_PER_SECOND;
constexpr auto PULSE_VIOLENCE = 3 * PULSE_PER_SECOND;
constexpr auto PULSE_MOBILE = 4 * PULSE_PER_SECOND;
constexpr auto PULSE_TICK = 70 * PULSE_PER_SECOND;
constexpr auto PULSE_AREA = 60 * PULSE_PER_SECOND;
constexpr auto PULSE_AUCTION = 10 * PULSE_PER_SECOND;
constexpr auto PULSE_SPACE = 10 * PULSE_PER_SECOND;
constexpr auto PULSE_TAXES = 60 * PULSE_MINUTE;
constexpr auto PULSE_ARENA = 30 * PULSE_PER_SECOND;

constexpr auto MAX_OVAL = 6;

/*
 * Command logging types.
 */
enum
{
    LOG_NORMAL,
    LOG_ALWAYS,
    LOG_NEVER,
    LOG_BUILD,
    LOG_HIGH,
    LOG_COMM,
    LOG_ALL,
    MAX_LOG
};

/*
 * Return types for MoveCharacter, damage, greet_trigger, etc, etc
 * Added by Thoric to get rid of bugs
 */
enum
{
    rNONE,
    rCHAR_DIED,
    rVICT_DIED,
    rBOTH_DIED,
    rCHAR_QUIT,
    rVICT_QUIT,
    rBOTH_QUIT,
    rSPELL_FAILED,
    rOBJ_SCRAPPED,
    rOBJ_EATEN,
    rOBJ_EXPIRED,
    rOBJ_TIMER,
    rOBJ_SACCED,
    rOBJ_QUAFFED,
    rOBJ_USED,
    rOBJ_EXTRACTED,
    rOBJ_DRUNK,
    rCHAR_IMMUNE,
    rVICT_IMMUNE,
    rCHAR_AND_OBJ_EXTRACTED = 128,
    rERROR = 255
};

/* Echo types for EchoToAll */
constexpr auto ECHOTAR_ALL = 0;
constexpr auto ECHOTAR_PC = 1;
constexpr auto ECHOTAR_IMM = 2;

/* defines for new do_who */
constexpr auto WT_MORTAL = 0;
constexpr auto WT_IMM = 2;
constexpr auto WT_AVATAR = 1;
constexpr auto WT_NEWBIE = 3;

/* object saving defines for fread/write_obj. -- Altrag */
constexpr auto OS_CARRY = 0;
constexpr auto OS_CORPSE = 1;

/*
 * Time and weather stuff.
 */
 /* Sun position */
enum
{
    SUN_DARK,
    SUN_RISE,
    SUN_LIGHT,
    SUN_SET
};

/* Sky condition */
enum
{
    SKY_CLOUDLESS,
    SKY_CLOUDY,
    SKY_RAINING,
    SKY_LIGHTNING
};

/*
 * Connected state for a channel.
 */
enum
{
    CON_PLAYING,
    CON_GET_NAME,
    CON_GET_OLD_PASSWORD,
    CON_CONFIRM_NEW_NAME,
    CON_GET_NEW_PASSWORD,
    CON_CONFIRM_NEW_PASSWORD,
    CON_GET_NEW_SEX,
    CON_READ_MOTD,
    CON_GET_NEW_RACE,
    CON_EDITING,
    CON_PRESS_ENTER,
    CON_GET_NEW_CLASS,
    CON_STATS_OK,
    CON_COPYOVER_RECOVER
};

/*
 * Character substates
 */
enum
{
    SUB_NONE,
    SUB_PAUSE,
    SUB_PERSONAL_DESC,
    SUB_OBJ_SHORT,
    SUB_OBJ_LONG,
    SUB_OBJ_EXTRA,
    SUB_MOB_LONG,
    SUB_MOB_DESC,
    SUB_ROOM_DESC,
    SUB_ROOM_EXTRA,
    SUB_ROOM_EXIT_DESC,
    SUB_WRITING_NOTE,
    SUB_MPROG_EDIT,
    SUB_HELP_EDIT,
    SUB_WRITING_MAP,
    SUB_PERSONAL_BIO,
    SUB_REPEATCMD,
    SUB_RESTRICTED,
    SUB_DEITYDESC,
    /* timer types ONLY below this point */
    SUB_TIMER_DO_ABORT = 128, SUB_TIMER_CANT_ABORT
};

/* ability classes */

enum
{
    ABILITY_NONE = -1,
    COMBAT_ABILITY = 0,
    PILOTING_ABILITY,
    ENGINEERING_ABILITY,
    HUNTING_ABILITY,
    SMUGGLING_ABILITY,
    DIPLOMACY_ABILITY,
    LEADERSHIP_ABILITY,
    FORCE_ABILITY,
    COMMANDO_ABILITY,
    MAX_ABILITY
};

/* the races */
enum
{
    RACE_HUMAN,
    RACE_WOOKIEE,
    RACE_TWI_LEK,
    RACE_RODIAN,
    RACE_HUTT,
    RACE_MON_CALAMARI,
    RACE_SHISTAVANEN,
    RACE_GAMORREAN,
    RACE_JAWA,
    RACE_ADARIAN,
    RACE_EWOK,
    RACE_VERPINE,
    RACE_DEFEL,
    RACE_TRANDOSHAN,
    RACE_CHADRA_FAN,
    RACE_QUARREN,
    RACE_SULLUSTAN,
    RACE_FALLEEN,
    RACE_ITHORIAN,
    RACE_DEVARONIAN,
    RACE_GOTAL,
    RACE_DROID,
    RACE_FIRRERREO,
    RACE_BARABEL,
    RACE_BOTHAN,
    RACE_TOGORIAN,
    RACE_DUG,
    RACE_KUBAZ,
    RACE_SELONIAN,
    RACE_GRAN,
    RACE_YEVETHA,
    RACE_GAND,
    RACE_DUROS,
    RACE_COYNITE,
    RACE_PROTOCOL_DROID,
    RACE_ASSASSIN_DROID,
    RACE_GLADIATOR_DROID,
    RACE_ASTROMECH_DROID,
    RACE_INTERROGATION_DROID,
    RACE_GOD,
    MAX_RACE
};

/*
 * Languages -- Altrag
 */
constexpr auto LANG_COMMON = BV00;  /* Human base language */
constexpr auto LANG_WOOKIEE = BV01;
constexpr auto LANG_TWI_LEK = BV02;
constexpr auto LANG_RODIAN = BV03;
constexpr auto LANG_HUTT = BV04;
constexpr auto LANG_MON_CALAMARI = BV05;
constexpr auto LANG_NOGHRI = BV06;
constexpr auto LANG_SHISTAVANEN = BV06;
constexpr auto LANG_EWOK = BV07;
constexpr auto LANG_ITHORIAN = BV08;
constexpr auto LANG_GOTAL = BV09;
constexpr auto LANG_DEVARONIAN = BV10;
constexpr auto LANG_BARABEL = BV11;
constexpr auto LANG_FIRRERREO = BV12;
constexpr auto LANG_BOTHAN = BV13;
constexpr auto LANG_GAMORREAN = BV14;
constexpr auto LANG_TOGORIAN = BV15;
constexpr auto LANG_KUBAZ = BV16;
constexpr auto LANG_JAWA = BV17;
constexpr auto LANG_CLAN = BV18;
constexpr auto LANG_ADARIAN = BV19;
constexpr auto LANG_VERPINE = BV20;
constexpr auto LANG_DEFEL = BV21;
constexpr auto LANG_TRANDOSHAN = BV22;
constexpr auto LANG_CHADRA_FAN = BV23;
constexpr auto LANG_QUARREN = BV24;
constexpr auto LANG_SULLUSTAN = BV25;
constexpr auto LANG_FALLEEN = BV26;
constexpr auto LANG_BINARY = BV27;
constexpr auto LANG_YEVETHAN = BV28;
constexpr auto LANG_GAND = BV29;
constexpr auto LANG_DUROS = BV30;
constexpr auto LANG_COYNITE = BV31;

constexpr auto LANG_UNKNOWN = 0;  /* Anything that doesnt fit a category */
constexpr auto LANG_MAX = 32;

/*
 * TO types for act.
 */
constexpr auto TO_ROOM = 0;
constexpr auto TO_NOTVICT = 1;
constexpr auto TO_VICT = 2;
constexpr auto TO_CHAR = 3;

/*
 * Real action "TYPES" for act.
 */
constexpr auto AT_BLACK = 0;
constexpr auto AT_BLOOD = 1;
constexpr auto AT_DGREEN = 2;
constexpr auto AT_ORANGE = 3;
constexpr auto AT_DBLUE = 4;
constexpr auto AT_PURPLE = 5;
constexpr auto AT_CYAN = 6;
constexpr auto AT_GREY = 7;
constexpr auto AT_DGREY = 8;
constexpr auto AT_RED = 9;
constexpr auto AT_GREEN = 10;
constexpr auto AT_YELLOW = 11;
constexpr auto AT_BLUE = 12;
constexpr auto AT_PINK = 13;
constexpr auto AT_LBLUE = 14;
constexpr auto AT_WHITE = 15;
constexpr auto AT_BLINK = 16;
constexpr auto AT_PLAIN = AT_GREY;
constexpr auto AT_ACTION = AT_GREY;
constexpr auto AT_SAY = AT_WHITE;
constexpr auto AT_GOSSIP = AT_LBLUE;
constexpr auto AT_YELL = AT_WHITE;
constexpr auto AT_TELL = AT_BLUE;
constexpr auto AT_HIT = AT_WHITE;
constexpr auto AT_HITME = AT_YELLOW;
constexpr auto AT_OOC = AT_YELLOW;
constexpr auto AT_IMMORT = AT_WHITE;
constexpr auto AT_AVATAR = AT_CYAN;
constexpr auto AT_HURT = AT_RED;
constexpr auto AT_FALLING = AT_WHITE + AT_BLINK;
constexpr auto AT_DANGER = AT_RED + AT_BLINK;
constexpr auto AT_MAGIC = AT_BLUE;
constexpr auto AT_CONSIDER = AT_GREY;
constexpr auto AT_REPORT = AT_GREY;
constexpr auto AT_POISON = AT_GREEN;
constexpr auto AT_SOCIAL = AT_GREY;
constexpr auto AT_DYING = AT_YELLOW;
constexpr auto AT_DEAD = AT_RED;
constexpr auto AT_SKILL = AT_GREEN;
constexpr auto AT_CARNAGE = AT_BLOOD;
constexpr auto AT_DAMAGE = AT_WHITE;
constexpr auto AT_FLEE = AT_YELLOW;
constexpr auto AT_RMNAME = AT_WHITE;
constexpr auto AT_RMDESC = AT_GREY;
constexpr auto AT_OBJECT = AT_GREEN;
constexpr auto AT_PERSON = AT_PINK;
constexpr auto AT_LIST = AT_BLUE;
constexpr auto AT_BYE = AT_GREEN;
constexpr auto AT_GOLD = AT_YELLOW;
constexpr auto AT_GTELL = AT_GREEN;
constexpr auto AT_NOTE = AT_GREEN;
constexpr auto AT_HUNGRY = AT_ORANGE;
constexpr auto AT_THIRSTY = AT_BLUE;
constexpr auto AT_FIRE = AT_RED;
constexpr auto AT_SOBER = AT_WHITE;
constexpr auto AT_WEAROFF = AT_YELLOW;
constexpr auto AT_EXITS = AT_WHITE;
constexpr auto AT_SCORE = AT_LBLUE;
constexpr auto AT_RESET = AT_DGREEN;
constexpr auto AT_LOG = AT_PURPLE;
constexpr auto AT_DIEMSG = AT_WHITE;
constexpr auto AT_WARTALK = AT_RED;
constexpr auto AT_SHIP = AT_PINK;
constexpr auto AT_CLAN = AT_PINK;

constexpr auto INIT_WEAPON_CONDITION = 12;
constexpr auto MAX_ITEM_IMPACT = 30;

constexpr auto MAX_NUMBER_OF_FIGHTERS = 8;

/*
 * Shop types.
 */
constexpr auto MAX_TRADE = 5;
constexpr auto MAX_FIX = 3;
constexpr auto SHOP_FIX = 1;
constexpr auto SHOP_RECHARGE = 2;

constexpr auto MAX_COORD = 15000000;
constexpr auto MAX_COORD_S = 13000000;

constexpr auto GOODGUY_CLAN = "The Rebel Alliance";
constexpr auto BADGUY_CLAN = "The Empire";
constexpr auto INDEPENDENT_CLAN = "Independent Faction";

/* Clan type */
enum
{
    CLAN_MAIN,
    CLAN_GUILD
};

/* ShipType */
enum
{
    SHIP_CIVILIAN,
    SHIP_REBEL,
    SHIP_IMPERIAL,
    MOB_SHIP,
    MAX_SHIP_TYPE
};

/* ShipState */
enum
{
    SHIP_LANDED,
    SHIP_READY,
    SHIP_BUSY,
    SHIP_BUSY_2,
    SHIP_BUSY_3,
    SHIP_REFUEL,
    SHIP_LAUNCH,
    SHIP_LAUNCH_2,
    SHIP_LAND,
    SHIP_LAND_2,
    SHIP_HYPERSPACE,
    SHIP_DISABLED,
    SHIP_FLYING,
    SHIP_TRACTORED,
    SHIP_DOCKED,
    SHIP_DOCK,
    SHIP_DOCK_2
};

/* MissileState */
enum
{
    MISSILE_READY,
    MISSILE_FIRED,
    MISSILE_RELOAD,
    MISSILE_RELOAD_2,
    MISSILE_DAMAGED
};

/* ShipClass */
enum
{
    FIGHTER_SHIP,
    MIDSIZE_SHIP,
    CAPITAL_SHIP,
    SHIP_PLATFORM,
    CLOUD_CAR,
    OCEAN_SHIP,
    LAND_SPEEDER,
    WHEELED,
    LAND_CRAWLER,
    WALKER,
    SHIP_TRAINER,
    SHIP_DEBRIS,

    MAX_SHIP_CLASS
};

/* MissileType */
enum
{
    INVALID_MISSILE_TYPE = -1,
    CONCUSSION_MISSILE,
    PROTON_TORPEDO,
    HEAVY_ROCKET,
    HEAVY_BOMB
};

/* SpaceobjectType */
enum
{
    SPACE_SUN,
    SPACE_PLANET,
    SPACE_MOVEOBJ,
    SPACE_OBJ,
    MAX_SPACEOBJECT_TYPE
};

constexpr auto LASER_DAMAGED = -1;
constexpr auto LASER_READY = 0;
constexpr auto MAX_NUMBER_OF_TURRETS_IN_SHIP = 10;

/***************************************************************************
 *                                                                         *
 *                   VALUES OF INTEREST TO AREA BUILDERS                   *
 *                   (Start of section ... start here)                     *
 *                                                                         *
 ***************************************************************************/

 /*
  * Well known mob virtual numbers.
  * Defined in #MOBILES.
  */
constexpr vnum_t MOB_VNUM_ANIMATED_CORPSE = 5;
constexpr vnum_t MOB_VNUM_POLY_WOLF = 10;

constexpr vnum_t MOB_VNUM_SUPERMOB = 3;
constexpr vnum_t MOB_VNUM_STORMTROOPER = 20;
constexpr vnum_t MOB_VNUM_IMP_GUARD = 21;
constexpr vnum_t MOB_VNUM_NR_GUARD = 22;
constexpr vnum_t MOB_VNUM_NR_TROOPER = 23;
constexpr vnum_t MOB_VNUM_MERCINARY = 24;
constexpr vnum_t MOB_VNUM_BOUNCER = 25;
constexpr vnum_t MOB_VNUM_IMP_ELITE = 26;
constexpr vnum_t MOB_VNUM_IMP_PATROL = 27;
constexpr vnum_t MOB_VNUM_IMP_FORCES = 28;
constexpr vnum_t MOB_VNUM_NR_ELITE = 29;
constexpr vnum_t MOB_VNUM_NR_PATROL = 30;
constexpr vnum_t MOB_VNUM_NR_FORCES = 31;
constexpr vnum_t MOB_VNUM_MERC_ELITE = 32;
constexpr vnum_t MOB_VNUM_MERC_PATROL = 33;
constexpr vnum_t MOB_VNUM_MERC_FORCES = 34;

/*
 * ACT bits for mobs.
 * Used in #MOBILES.
 */
constexpr auto ACT_NPC = BV00;           /* Auto set for mobs    */
constexpr auto ACT_SENTINEL = BV01;           /* Stays in one room    */
constexpr auto ACT_SCAVENGER = BV02;           /* Picks up objects     */
constexpr auto ACT_UNUSED_03 = BV03;
constexpr auto ACT_UNUSED_04 = BV04;
constexpr auto ACT_AGGRESSIVE = BV05;           /* Attacks PC's         */
constexpr auto ACT_STAY_AREA = BV06;           /* Won't leave area     */
constexpr auto ACT_WIMPY = BV07;           /* Flees when hurt      */
constexpr auto ACT_PET = BV08;           /* Auto set for pets    */
constexpr auto ACT_TRAIN = BV09;           /* Can train PC's       */
constexpr auto ACT_PRACTICE = BV10;           /* Can practice PC's    */
constexpr auto ACT_IMMORTAL = BV11;          /* Cannot be killed     */
constexpr auto ACT_DEADLY = BV12;       /* Has a deadly poison  */
constexpr auto ACT_POLYSELF = BV13;
constexpr auto ACT_META_AGGR = BV14; /* Extremely aggressive */
constexpr auto ACT_GUARDIAN = BV15;     /* Protects master      */
constexpr auto ACT_RUNNING = BV16;         /* Hunts quickly        */
constexpr auto ACT_NOWANDER = BV17;      /* Doesn't wander       */
constexpr auto ACT_MOUNTABLE = BV18;     /* Can be mounted       */
constexpr auto ACT_MOUNTED = BV19;      /* Is mounted           */
constexpr auto ACT_SCHOLAR = BV20;          /* Can teach languages  */
constexpr auto ACT_SECRETIVE = BV21;         /* actions aren't seen  */
constexpr auto ACT_POLYMORPHED = BV22;         /* Mob is a ch          */
constexpr auto ACT_MOBINVIS = BV23;         /* Like wizinvis        */
constexpr auto ACT_NOASSIST = BV24;        /* Doesn't assist mobs  */
constexpr auto ACT_NOKILL = BV25;          /* Mob can't die */
constexpr auto ACT_DROID = BV26;          /* mob is a droid */
constexpr auto ACT_NOCORPSE = BV27;
constexpr auto ACT_UNUSED_28 = BV28;
constexpr auto ACT_UNUSED_29 = BV29;
constexpr auto ACT_PROTOTYPE = BV30;           /* A prototype mob      */
constexpr auto ACT_UNUSED_31 = BV31;
/* 20 acts */

constexpr vnum_t ROOM_JAIL_MON_CALAMARI_1 = 21148;
constexpr vnum_t ROOM_JAIL_MON_CALAMARI_2 = 21149;
constexpr vnum_t ROOM_JAIL_QUARREN_1 = 6931;
constexpr vnum_t ROOM_JAIL_QUARREN_2 = 6932;
constexpr vnum_t ROOM_JAIL_ADARI = 29108;

/*
 * Bits for 'affected_by'.
 / * Used in #MOBILES.
*/
constexpr auto AFF_NONE = 0;

constexpr auto AFF_BLIND = BV00;
constexpr auto AFF_INVISIBLE = BV01;
constexpr auto AFF_DETECT_EVIL = BV02;
constexpr auto AFF_DETECT_INVIS = BV03;
constexpr auto AFF_DETECT_MAGIC = BV04;
constexpr auto AFF_DETECT_HIDDEN = BV05;
constexpr auto AFF_WEAKEN = BV06;
constexpr auto AFF_SANCTUARY = BV07;
constexpr auto AFF_FAERIE_FIRE = BV08;
constexpr auto AFF_INFRARED = BV09;
constexpr auto AFF_CURSE = BV10;
constexpr auto AFF_FLAMING = BV11;          /* Unused       */
constexpr auto AFF_POISON = BV12;
constexpr auto AFF_PROTECT = BV13;
constexpr auto AFF_PARALYSIS = BV14;
constexpr auto AFF_SNEAK = BV15;
constexpr auto AFF_HIDE = BV16;
constexpr auto AFF_SLEEP = BV17;
constexpr auto AFF_CHARM = BV18;
constexpr auto AFF_FLYING = BV19;
constexpr auto AFF_PASS_DOOR = BV20;
constexpr auto AFF_FLOATING = BV21;
constexpr auto AFF_TRUESIGHT = BV22;
constexpr auto AFF_DETECTTRAPS = BV23;
constexpr auto AFF_SCRYING = BV24;
constexpr auto AFF_FIRESHIELD = BV25;
constexpr auto AFF_SHOCKSHIELD = BV26;
constexpr auto AFF_BIND = BV27;
constexpr auto AFF_ICESHIELD = BV28;
constexpr auto AFF_POSSESS = BV29;
constexpr auto AFF_BERSERK = BV30;
constexpr auto AFF_AQUA_BREATH = BV31;

/* 31 aff's (1 left.. :P) */
/* make that none - ugh - time for another field? :P */
/*
 * Resistant Immune Susceptible flags
 */
constexpr auto RIS_FIRE = BV00;
constexpr auto RIS_COLD = BV01;
constexpr auto RIS_ELECTRICITY = BV02;
constexpr auto RIS_ENERGY = BV03;
constexpr auto RIS_BLUNT = BV04;
constexpr auto RIS_PIERCE = BV05;
constexpr auto RIS_SLASH = BV06;
constexpr auto RIS_ACID = BV07;
constexpr auto RIS_POISON = BV08;
constexpr auto RIS_DRAIN = BV09;
constexpr auto RIS_SLEEP = BV10;
constexpr auto RIS_CHARM = BV11;
constexpr auto RIS_HOLD = BV12;
constexpr auto RIS_NONMAGIC = BV13;
constexpr auto RIS_PLUS1 = BV14;
constexpr auto RIS_PLUS2 = BV15;
constexpr auto RIS_PLUS3 = BV16;
constexpr auto RIS_PLUS4 = BV17;
constexpr auto RIS_PLUS5 = BV18;
constexpr auto RIS_PLUS6 = BV19;
constexpr auto RIS_MAGIC = BV20;
constexpr auto RIS_PARALYSIS = BV21;
constexpr auto RIS_STEAL = BV22;
/* 21 RIS's*/

/*
 * Attack types
 */
constexpr auto ATCK_BITE = BV00;
constexpr auto ATCK_CLAWS = BV01;
constexpr auto ATCK_TAIL = BV02;
constexpr auto ATCK_STING = BV03;
constexpr auto ATCK_PUNCH = BV04;
constexpr auto ATCK_KICK = BV05;
constexpr auto ATCK_TRIP = BV06;
constexpr auto ATCK_BASH = BV07;
constexpr auto ATCK_STUN = BV08;
constexpr auto ATCK_GOUGE = BV09;
constexpr auto ATCK_BACKSTAB = BV10;
constexpr auto ATCK_FEED = BV11;
constexpr auto ATCK_DRAIN = BV12;
constexpr auto ATCK_FIREBREATH = BV13;
constexpr auto ATCK_FROSTBREATH = BV14;
constexpr auto ATCK_ACIDBREATH = BV15;
constexpr auto ATCK_LIGHTNBREATH = BV16;
constexpr auto ATCK_GASBREATH = BV17;
constexpr auto ATCK_POISON = BV18;
constexpr auto ATCK_NASTYPOISON = BV19;
constexpr auto ATCK_GAZE = BV20;
constexpr auto ATCK_BLINDNESS = BV21;
constexpr auto ATCK_CAUSESERIOUS = BV22;
constexpr auto ATCK_EARTHQUAKE = BV23;
constexpr auto ATCK_CAUSECRITICAL = BV24;
constexpr auto ATCK_CURSE = BV25;
constexpr auto ATCK_FLAMESTRIKE = BV26;
constexpr auto ATCK_HARM = BV27;
constexpr auto ATCK_FIREBALL = BV28;
constexpr auto ATCK_COLORSPRAY = BV29;
constexpr auto ATCK_WEAKEN = BV30;
constexpr auto ATCK_SPIRALBLAST = BV31;
/* 32 USED! DO NOT ADD MORE! SB */

/*
 * Defense types
 */
constexpr auto DFND_PARRY = BV00;
constexpr auto DFND_DODGE = BV01;
constexpr auto DFND_HEAL = BV02;
constexpr auto DFND_CURELIGHT = BV03;
constexpr auto DFND_CURESERIOUS = BV04;
constexpr auto DFND_CURECRITICAL = BV05;
constexpr auto DFND_DISPELMAGIC = BV06;
constexpr auto DFND_DISPELEVIL = BV07;
constexpr auto DFND_SANCTUARY = BV08;
constexpr auto DFND_FIRESHIELD = BV09;
constexpr auto DFND_SHOCKSHIELD = BV10;
constexpr auto DFND_SHIELD = BV11;
constexpr auto DFND_BLESS = BV12;
constexpr auto DFND_STONESKIN = BV13;
constexpr auto DFND_TELEPORT = BV14;
constexpr auto DFND_MONSUM1 = BV15;
constexpr auto DFND_MONSUM2 = BV16;
constexpr auto DFND_MONSUM3 = BV17;
constexpr auto DFND_MONSUM4 = BV18;
constexpr auto DFND_DISARM = BV19;
constexpr auto DFND_ICESHIELD = BV20;
constexpr auto DFND_GRIP = BV21;
/* 21 def's */

/*
 * Pipe flags
 */
constexpr auto PIPE_TAMPED = BV01;
constexpr auto PIPE_LIT = BV02;
constexpr auto PIPE_HOT = BV03;
constexpr auto PIPE_DIRTY = BV04;
constexpr auto PIPE_FILTHY = BV05;
constexpr auto PIPE_GOINGOUT = BV06;
constexpr auto PIPE_BURNT = BV07;
constexpr auto PIPE_FULLOFASH = BV08;

/*
 * Skill/Spell flags    The minimum BV *MUST* be 11!
 */
constexpr auto SF_WATER = 11;
constexpr auto SF_EARTH = 12;
constexpr auto SF_AIR = 13;
constexpr auto SF_ASTRAL = 14;
constexpr auto SF_AREA = 15;  /* is an area spell             */
constexpr auto SF_DISTANT = 16;  /* affects something far away   */
constexpr auto SF_REVERSE = 17;
constexpr auto SF_SAVE_HALF_DAMAGE = 18;  /* save for half damage         */
constexpr auto SF_SAVE_NEGATES = 19;  /* save negates affect          */
constexpr auto SF_ACCUMULATIVE = 20;  /* is accumulative              */
constexpr auto SF_RECASTABLE = 21;  /* can be refreshed             */
constexpr auto SF_NOSCRIBE = 22;  /* cannot be scribed            */
constexpr auto SF_NOBREW = 23;  /* cannot be brewed             */
constexpr auto SF_GROUPSPELL = 24;  /* only affects group members   */
constexpr auto SF_OBJECT = 25;  /* directed at an object        */
constexpr auto SF_CHARACTER = 26;  /* directed at a character      */
constexpr auto SF_SECRETSKILL = 27;  /* hidden unless learned        */
constexpr auto SF_PKSENSITIVE = 28;  /* much harder for plr vs. plr  */
constexpr auto SF_STOPONFAIL = 29;  /* stops spell on first failure */

/* SaveTypes */
enum
{
    SS_NONE,
    SS_POISON_DEATH,
    SS_ROD_WANDS,
    SS_PARA_PETRI,
    SS_BREATH,
    SS_SPELL_STAFF,
    SAVETYPE_MAX
};

constexpr auto ALL_BITS = INT_MAX;
constexpr auto SDAM_MASK = ALL_BITS & ~(BV00 | BV01 | BV02);
constexpr auto SACT_MASK = ALL_BITS & ~(BV03 | BV04 | BV05);
constexpr auto SCLA_MASK = ALL_BITS & ~(BV06 | BV07 | BV08);
constexpr auto SPOW_MASK = ALL_BITS & ~(BV09 | BV10);

/* SpellDamageType */
enum
{
    SD_NONE,
    SD_FIRE,
    SD_COLD,
    SD_ELECTRICITY,
    SD_ENERGY,
    SD_ACID,
    SD_POISON,
    SD_DRAIN
};

/* SpellActType */
enum
{
    SA_NONE,
    SA_CREATE,
    SA_DESTROY,
    SA_RESIST,
    SA_SUSCEPT,
    SA_DIVINATE,
    SA_OBSCURE,
    SA_CHANGE
};

/* SpellPowerType */
enum
{
    SP_NONE,
    SP_MINOR,
    SP_GREATER,
    SP_MAJOR
};

/* SpellClassType */
enum
{
    SC_NONE,
    SC_LUNAR,
    SC_SOLAR,
    SC_TRAVEL,
    SC_SUMMON,
    SC_LIFE,
    SC_DEATH,
    SC_ILLUSION
};

/*
 * Sex.
 * Used in #MOBILES.
 */
 /* SexType */
enum
{
    SEX_NEUTRAL,
    SEX_MALE,
    SEX_FEMALE,
    MAX_SEX
};

/* TrapType */
enum
{
    TRAP_TYPE_POISON_GAS = 1,
    TRAP_TYPE_POISON_DART,
    TRAP_TYPE_POISON_NEEDLE,
    TRAP_TYPE_POISON_DAGGER,
    TRAP_TYPE_POISON_ARROW,
    TRAP_TYPE_BLINDNESS_GAS,
    TRAP_TYPE_SLEEPING_GAS,
    TRAP_TYPE_FLAME,
    TRAP_TYPE_EXPLOSION,
    TRAP_TYPE_ACID_SPRAY,
    TRAP_TYPE_ELECTRIC_SHOCK,
    TRAP_TYPE_BLADE,
    TRAP_TYPE_SEX_CHANGE
};

constexpr auto MAX_TRAPTYPE = TRAP_TYPE_SEX_CHANGE;

constexpr auto TRAP_ROOM = BV00;
constexpr auto TRAP_OBJ = BV01;
constexpr auto TRAP_ENTER_ROOM = BV02;
constexpr auto TRAP_LEAVE_ROOM = BV03;
constexpr auto TRAP_OPEN = BV04;
constexpr auto TRAP_CLOSE = BV05;
constexpr auto TRAP_GET = BV06;
constexpr auto TRAP_PUT = BV07;
constexpr auto TRAP_PICK = BV08;
constexpr auto TRAP_UNLOCK = BV09;
constexpr auto TRAP_N = BV10;
constexpr auto TRAP_S = BV11;
constexpr auto TRAP_E = BV12;
constexpr auto TRAP_W = BV13;
constexpr auto TRAP_U = BV14;
constexpr auto TRAP_D = BV15;
constexpr auto TRAP_EXAMINE = BV16;
constexpr auto TRAP_NE = BV17;
constexpr auto TRAP_NW = BV18;
constexpr auto TRAP_SE = BV19;
constexpr auto TRAP_SW = BV20;

/*
 * Well known object virtual numbers.
 * Defined in #OBJECTS.
 */
constexpr vnum_t OBJ_VNUM_MONEY_ONE = 2;
constexpr vnum_t OBJ_VNUM_MONEY_SOME = 3;

constexpr vnum_t OBJ_VNUM_DROID_CORPSE = 9;
constexpr vnum_t OBJ_VNUM_CORPSE_NPC = 10;
constexpr vnum_t OBJ_VNUM_CORPSE_PC = 11;
constexpr vnum_t OBJ_VNUM_BLOODSTAIN = 18;
constexpr vnum_t OBJ_VNUM_SCRAPS = 19;

constexpr vnum_t OBJ_VNUM_MUSHROOM = 20;
constexpr vnum_t OBJ_VNUM_LIGHT_BALL = 21;
constexpr vnum_t OBJ_VNUM_SPRING = 22;

constexpr vnum_t OBJ_VNUM_SKIN = 23;

constexpr vnum_t OBJ_VNUM_SLICE = 24;
constexpr vnum_t OBJ_VNUM_SHOPPING_BAG = 25;

constexpr vnum_t OBJ_VNUM_FIRE = 30;
constexpr vnum_t OBJ_VNUM_TRAP = 31;
constexpr vnum_t OBJ_VNUM_PORTAL = 32;


constexpr vnum_t OBJ_VNUM_BLACK_POWDER = 33;

constexpr vnum_t OBJ_VNUM_SCROLL_SCRIBING = 34;
constexpr vnum_t OBJ_VNUM_NOTE = 36;

/* Academy eq */
constexpr vnum_t OBJ_VNUM_SCHOOL_BLADE = 10312;
constexpr vnum_t OBJ_VNUM_SCHOOL_LIGHTSABER = 10323;
constexpr vnum_t OBJ_VNUM_SCHOOL_GLOWROD = 10311;
constexpr vnum_t OBJ_VNUM_SCHOOL_DIPLOMA = 10321;
constexpr vnum_t OBJ_VNUM_SCHOOL_COMLINK = 10424;
constexpr vnum_t OBJ_VNUM_BLASTECH_E11 = 50;

/* Crafting prototypes */
constexpr vnum_t OBJ_VNUM_CRAFTING_BLASTER = 10420;
constexpr vnum_t OBJ_VNUM_CRAFTING_LIGHTSABER = 10421;
constexpr vnum_t OBJ_VNUM_CRAFTING_BLADE = 10422;
constexpr vnum_t OBJ_VNUM_CRAFTING_GRENADE = 10425;
constexpr vnum_t OBJ_VNUM_CRAFTING_LANDMINE = 10427;
constexpr vnum_t OBJ_VNUM_CRAFTING_GLOWROD = 10428;
constexpr vnum_t OBJ_VNUM_CRAFTING_SHIELD = 10429;
constexpr vnum_t OBJ_VNUM_CRAFTING_COMLINK = 10430;
constexpr vnum_t OBJ_VNUM_CRAFTING_BOWCASTER = 10431;
constexpr vnum_t OBJ_VNUM_CRAFTING_CONTAINER = 10432;
constexpr vnum_t OBJ_VNUM_CRAFTING_ARMOR = 10433;
constexpr vnum_t OBJ_VNUM_CRAFTING_DISGUISE = 10434;
constexpr vnum_t OBJ_VNUM_CRAFTING_SPICE = 10435;

constexpr auto NEW_CHARACTER_START_CREDITS = 5000;

/*
 * Item types.
 * Used in #OBJECTS.
 */
 /* ItemTypes */
enum
{
    ITEM_NONE,
    ITEM_LIGHT,
    ITEM_SCROLL,
    ITEM_WAND,
    ITEM_STAFF,
    ITEM_WEAPON,
    ITEM_FIREWEAPON,
    ITEM_MISSILE,
    ITEM_TREASURE,
    ITEM_ARMOR,
    ITEM_POTION,
    ITEM_ROPE,
    ITEM_FURNITURE,
    ITEM_TRASH,
    ITEM_OLDTRAP,
    ITEM_CONTAINER,
    ITEM_NOTE,
    ITEM_DRINK_CON,
    ITEM_KEY,
    ITEM_FOOD,
    ITEM_MONEY,
    ITEM_PEN,
    ITEM_BOAT,
    ITEM_CORPSE_NPC,
    ITEM_CORPSE_PC,
    ITEM_FOUNTAIN,
    ITEM_PILL,
    ITEM_BLOOD,
    ITEM_BLOODSTAIN,
    ITEM_SCRAPS,
    ITEM_PIPE,
    ITEM_HERB_CON,
    ITEM_HERB,
    ITEM_INCENSE,
    ITEM_FIRE,
    ITEM_BOOK,
    ITEM_SWITCH,
    ITEM_LEVER,
    ITEM_PULLCHAIN,
    ITEM_BUTTON,
    ITEM_DIAL,
    ITEM_RUNE,
    ITEM_RUNEPOUCH,
    ITEM_MATCH,
    ITEM_TRAP,
    ITEM_MAP,
    ITEM_PORTAL,
    ITEM_PAPER,
    ITEM_TINDER,
    ITEM_LOCKPICK,
    ITEM_SPIKE,
    ITEM_DISEASE,
    ITEM_OIL,
    ITEM_FUEL,
    ITEM_SHORT_BOW,
    ITEM_LONG_BOW,
    ITEM_CROSSBOW,
    ITEM_AMMO,
    ITEM_QUIVER,
    ITEM_SHOVEL,
    ITEM_SALVE,
    ITEM_RAWSPICE,
    ITEM_LENS,
    ITEM_CRYSTAL,
    ITEM_DURAPLAST,
    ITEM_BATTERY,
    ITEM_TOOLKIT,
    ITEM_DURASTEEL,
    ITEM_OVEN,
    ITEM_MIRROR,
    ITEM_CIRCUIT,
    ITEM_SUPERCONDUCTOR,
    ITEM_COMLINK,
    ITEM_MEDPAC,
    ITEM_FABRIC,
    ITEM_RARE_METAL,
    ITEM_MAGNET,
    ITEM_THREAD,
    ITEM_SPICE,
    ITEM_SMUT,
    ITEM_DEVICE,
    ITEM_SPACECRAFT,
    ITEM_GRENADE,
    ITEM_LANDMINE,
    ITEM_GOVERNMENT,
    ITEM_DROID_CORPSE,
    ITEM_BOLT,
    ITEM_SCOPE,
    ITEM_FIGHTERCOMP,
    ITEM_MIDCOMP,
    ITEM_CAPITALCOMP,
    ITEM_CHEMICAL,
    ITEM_DISGUISE,
    ITEM_DIS_FABRIC,
    ITEM_HAIR
};


constexpr auto MAX_ITEM_TYPE = ITEM_HAIR;

constexpr auto OVAL_WEAPON_CONDITION = 0;
constexpr auto OVAL_WEAPON_NUM_DAM_DIE = 1;
constexpr auto OVAL_WEAPON_SIZE_DAM_DIE = 2;
constexpr auto OVAL_WEAPON_TYPE = 3;
constexpr auto OVAL_WEAPON_CHARGE = 4;
constexpr auto OVAL_WEAPON_MAX_CHARGE = 5;

constexpr auto OVAL_BATTERY_CHARGE = 0;

constexpr auto OVAL_AMMO_CHARGE = 0;

constexpr auto OVAL_BOLT_CHARGE = 0;

constexpr auto OVAL_CRYSTAL_TYPE = 0;

constexpr auto OVAL_CONTAINER_CAPACITY = 0;
constexpr auto OVAL_CONTAINER_FLAGS = 1;
constexpr auto OVAL_CONTAINER_KEY = 2;
constexpr auto OVAL_CONTAINER_CONDITION = 3;

constexpr auto OVAL_DRINK_CON_CAPACITY = 0;
constexpr auto OVAL_DRINK_CON_CURRENT_AMOUNT = 1;
constexpr auto OVAL_DRINK_CON_LIQUID_TYPE = 2;
constexpr auto OVAL_DRINK_CON_POISON_STRENGTH = 3;

constexpr auto OVAL_CHEMICAL_STRENGTH = 0;

constexpr auto OVAL_EXPLOSIVE_MIN_DMG = 0;
constexpr auto OVAL_EXPLOSIVE_MAX_DMG = 1;

constexpr auto OVAL_FABRIC_STRENGTH = 1;

constexpr auto OVAL_ARMOR_CONDITION = 0;
constexpr auto OVAL_ARMOR_AC = 1;
constexpr auto OVAL_ARMOR_3 = 3;
constexpr auto OVAL_ARMOR_SHIELD_CHARGE = 4;
constexpr auto OVAL_ARMOR_SHIELD_MAX_CHARGE = 5;

constexpr auto OVAL_LIGHT_POWER = 2;

constexpr auto OVAL_TRAP_CHARGE = 0;
constexpr auto OVAL_TRAP_TYPE = 1;
constexpr auto OVAL_TRAP_STRENGTH = 2;
constexpr auto OVAL_TRAP_FLAGS = 3;

constexpr auto OVAL_RAWSPICE_TYPE = 0;
constexpr auto OVAL_RAWSPICE_GRADE = 1;
constexpr auto OVAL_SPICE_TYPE = 0;
constexpr auto OVAL_SPICE_GRADE = 1;

constexpr auto OVAL_SALVE_LEVEL = 0;
constexpr auto OVAL_SALVE_MAX_DOSES = 1;
constexpr auto OVAL_SALVE_DOSES = 2;
constexpr auto OVAL_SALVE_DELAY = 3;
constexpr auto OVAL_SALVE_SPELL1 = 4;
constexpr auto OVAL_SALVE_SPELL2 = 5;

constexpr auto OVAL_POTION_LEVEL = 0;
constexpr auto OVAL_POTION_SPELL1 = 1;
constexpr auto OVAL_POTION_SPELL2 = 2;
constexpr auto OVAL_POTION_SPELL3 = 3;

constexpr auto OVAL_PILL_LEVEL = 0;
constexpr auto OVAL_PILL_SPELL1 = 1;
constexpr auto OVAL_PILL_SPELL2 = 2;
constexpr auto OVAL_PILL_SPELL3 = 3;
constexpr auto OVAL_PILL_SATISFACTION = 4;

constexpr auto OVAL_DEVICE_LEVEL = 0;
constexpr auto OVAL_DEVICE_MAX_CHARGES = 1;
constexpr auto OVAL_DEVICE_CHARGES = 2;
constexpr auto OVAL_DEVICE_SPELL = 3;

constexpr auto OVAL_STAFF_LEVEL = 0;
constexpr auto OVAL_STAFF_MAX_CHARGES = 1;
constexpr auto OVAL_STAFF_CHARGES = 2;
constexpr auto OVAL_STAFF_SPELL = 3;

constexpr auto OVAL_WAND_LEVEL = 0;
constexpr auto OVAL_WAND_MAX_CHARGES = 1;
constexpr auto OVAL_WAND_CHARGES = 2;
constexpr auto OVAL_WAND_SPELL = 3;

constexpr auto OVAL_SWITCH_TRIGFLAGS = 0;
constexpr auto OVAL_LEVER_TRIGFLAGS = 0;
constexpr auto OVAL_BUTTON_TRIGFLAGS = 0;
constexpr auto OVAL_PULLCHAIN_TRIGFLAGS = 0;

constexpr auto OVAL_BUTTON_TELEPORT_DESTINATION = 1;
constexpr auto OVAL_BUTTON_2 = 2;

constexpr auto OVAL_DISGUISE_MAX_CONDITION = 0;
constexpr auto OVAL_DISGUISE_CONDITION = 1;
constexpr auto OVAL_DISGUISE_RACE = 2;
constexpr auto OVAL_DISGUISE_SEX = 3;

constexpr auto OVAL_FOOD_SATISFACTION = 0;
constexpr auto OVAL_FOOD_MAX_CONDITION = 1;
constexpr auto OVAL_FOOD_POISON = 3;
constexpr auto OVAL_FOOD_OPTIONAL_INITIAL_CONDITION = 4;

constexpr auto OVAL_MONEY_AMOUNT = 0;

constexpr auto OVAL_PIPE_TOBACCO_AMOUNT = 1;
constexpr auto OVAL_PIPE_TOBACCO_HERB = 2;
constexpr auto OVAL_PIPE_FLAGS = 3;

constexpr auto OVAL_CORPSE_0 = 0;
constexpr auto OVAL_CORPSE_SKINNED = 1;
constexpr auto OVAL_CORPSE_DECAY = 2;
constexpr auto OVAL_CORPSE_3 = 3;

constexpr auto OVAL_FOUNTAIN_1 = 1;
constexpr auto OVAL_FOUNTAIN_2 = 2;

constexpr auto OVAL_KEY_UNLOCKS_VNUM = 0;

constexpr auto OVAL_PEN_INK_AMOUNT = 0;

constexpr auto OVAL_PAPER_0 = 0;
constexpr auto OVAL_PAPER_1 = 1;
constexpr auto OVAL_PAPER_2 = 2;

constexpr auto OVAL_MEDPAC_DOSES = 0;

constexpr auto OVAL_FURNITURE_CAPACITY = 0;
constexpr auto OVAL_FURNITURE_1 = 1;
constexpr auto OVAL_FURNITURE_PREPOSITION = 2;

/* Furniture Types - Darrik Vequir 10/23/00 */
constexpr auto STAND_AT = 1;
constexpr auto STAND_ON = 2;
constexpr auto STAND_IN = 3;

constexpr auto SIT_AT = 1;
constexpr auto SIT_ON = 2;
constexpr auto SIT_IN = 3;

constexpr auto REST_AT = 1;
constexpr auto REST_ON = 2;
constexpr auto REST_IN = 3;

constexpr auto SLEEP_AT = 1;
constexpr auto SLEEP_ON = 2;
constexpr auto SLEEP_IN = 3;

constexpr auto PUT_AT = 1;
constexpr auto PUT_ON = 2;
constexpr auto PUT_IN = 3;
constexpr auto PUT_INSIDE = 4;

/*
 * Extra flags.
 * Used in #OBJECTS.
 */
constexpr auto ITEM_GLOW = BV00;
constexpr auto ITEM_HUM = BV01;

constexpr auto ITEM_HUTT_SIZE = BV03;
constexpr auto ITEM_CONTRABAND = BV04;
constexpr auto ITEM_INVIS = BV05;
constexpr auto ITEM_MAGIC = BV06;
constexpr auto ITEM_NODROP = BV07;
constexpr auto ITEM_BLESS = BV08;
constexpr auto ITEM_ANTI_GOOD = BV09;
constexpr auto ITEM_ANTI_EVIL = BV10;
constexpr auto ITEM_ANTI_NEUTRAL = BV11;
constexpr auto ITEM_NOREMOVE = BV12;
constexpr auto ITEM_INVENTORY = BV13;

constexpr auto ITEM_SMALL_SIZE = BV18;
constexpr auto ITEM_LARGE_SIZE = BV19;

constexpr auto ITEM_CLANOBJECT = BV21;

constexpr auto ITEM_HIDDEN = BV25;
constexpr auto ITEM_POISONED = BV26;
constexpr auto ITEM_COVERING = BV27;
constexpr auto ITEM_DEATHROT = BV28;
constexpr auto ITEM_BURRIED = BV29;    /* item is underground */
constexpr auto ITEM_PROTOTYPE = BV30;
constexpr auto ITEM_HUMAN_SIZE = BV31;

/* Blaster settings - only saves on characters */
constexpr auto BLASTER_NORMAL = 0;
constexpr auto BLASTER_LOW = 1;
constexpr auto BLASTER_HALF = 2;
constexpr auto BLASTER_STUN = 3;
constexpr auto BLASTER_HIGH = 4;
constexpr auto BLASTER_FULL = 5;

/* Weapon Types */

enum
{
    WEAPON_NONE = 0,
    WEAPON_VIBRO_AXE = 1,
    WEAPON_VIBRO_BLADE = 2,
    WEAPON_LIGHTSABER = 3,
    WEAPON_WHIP = 4,
    WEAPON_CLAW = 5,
    WEAPON_BLASTER = 6,
    WEAPON_BLUDGEON = 8,
    WEAPON_BOWCASTER = 9,
    WEAPON_FORCE_PIKE = 11
};

/* Lever/dial/switch/button/pullchain flags */
constexpr auto TRIG_UP = BV00;
constexpr auto TRIG_UNLOCK = BV01;
constexpr auto TRIG_LOCK = BV02;
constexpr auto TRIG_D_NORTH = BV03;
constexpr auto TRIG_D_SOUTH = BV04;
constexpr auto TRIG_D_EAST = BV05;
constexpr auto TRIG_D_WEST = BV06;
constexpr auto TRIG_D_UP = BV07;
constexpr auto TRIG_D_DOWN = BV08;
constexpr auto TRIG_DOOR = BV09;
constexpr auto TRIG_CONTAINER = BV10;
constexpr auto TRIG_OPEN = BV11;
constexpr auto TRIG_CLOSE = BV12;
constexpr auto TRIG_PASSAGE = BV13;
constexpr auto TRIG_OLOAD = BV14;
constexpr auto TRIG_MLOAD = BV15;
constexpr auto TRIG_TELEPORT = BV16;
constexpr auto TRIG_TELEPORTALL = BV17;
constexpr auto TRIG_TELEPORTPLUS = BV18;
constexpr auto TRIG_DEATH = BV19;
constexpr auto TRIG_CAST = BV20;
constexpr auto TRIG_FAKEBLADE = BV21;
constexpr auto TRIG_RAND4 = BV22;
constexpr auto TRIG_RAND6 = BV23;
constexpr auto TRIG_TRAPDOOR = BV24;
constexpr auto TRIG_ANOTHEROOM = BV25;
constexpr auto TRIG_USEDIAL = BV26;
constexpr auto TRIG_ABSOLUTEVNUM = BV27;
constexpr auto TRIG_SHOWROOMDESC = BV28;
constexpr auto TRIG_AUTORETURN = BV29;

constexpr auto TELE_SHOWDESC = BV00;
constexpr auto TELE_TRANSALL = BV01;
constexpr auto TELE_TRANSALLPLUS = BV02;

/* drug types */
enum
{
    SPICE_GLITTERSTIM,
    SPICE_CARSANUM,
    SPICE_RYLL,
    SPICE_ANDRIS,
    SPICE_LUMNI
};

/* crystal types */
enum
{
    GEM_NON_ADEGAN,
    GEM_KATHRACITE,
    GEM_RELACITE,
    GEM_DANITE,
    GEM_MEPHITE,
    GEM_PONITE,
    GEM_ILLUM,
    GEM_CORUSCA
};

/*
 * Wear flags.
 * Used in #OBJECTS.
 */
constexpr auto ITEM_TAKE = BV00;
constexpr auto ITEM_WEAR_FINGER = BV01;
constexpr auto ITEM_WEAR_NECK = BV02;
constexpr auto ITEM_WEAR_BODY = BV03;
constexpr auto ITEM_WEAR_HEAD = BV04;
constexpr auto ITEM_WEAR_LEGS = BV05;
constexpr auto ITEM_WEAR_FEET = BV06;
constexpr auto ITEM_WEAR_HANDS = BV07;
constexpr auto ITEM_WEAR_ARMS = BV08;
constexpr auto ITEM_WEAR_SHIELD = BV09;
constexpr auto ITEM_WEAR_ABOUT = BV10;
constexpr auto ITEM_WEAR_WAIST = BV11;
constexpr auto ITEM_WEAR_WRIST = BV12;
constexpr auto ITEM_WIELD = BV13;
constexpr auto ITEM_HOLD = BV14;
constexpr auto ITEM_DUAL_WIELD = BV15;
constexpr auto ITEM_WEAR_EARS = BV16;
constexpr auto ITEM_WEAR_EYES = BV17;
constexpr auto ITEM_MISSILE_WIELD = BV18;
constexpr auto ITEM_WEAR_FLOATING = BV19;
constexpr auto ITEM_WEAR_OVER = BV20;
constexpr auto ITEM_WEAR_DISGUISE = BV21;

/*
 * Apply types (for affects).
 * Used in #OBJECTS.
 */
 /* ApplyType */
enum
{
    APPLY_NONE,
    APPLY_STR,
    APPLY_DEX,
    APPLY_INT,
    APPLY_WIS,
    APPLY_CON,
    APPLY_SEX,
    APPLY_NULL,
    APPLY_LEVEL,
    APPLY_AGE,
    APPLY_HEIGHT,
    APPLY_WEIGHT,
    APPLY_MANA,
    APPLY_HIT,
    APPLY_MOVE,
    APPLY_GOLD,
    APPLY_EXP,
    APPLY_AC,
    APPLY_HITROLL,
    APPLY_DAMROLL,
    APPLY_SAVING_POISON,
    APPLY_SAVING_ROD,
    APPLY_SAVING_PARA,
    APPLY_SAVING_BREATH,
    APPLY_SAVING_SPELL,
    APPLY_CHA,
    APPLY_AFFECT,
    APPLY_RESISTANT,
    APPLY_IMMUNE,
    APPLY_SUSCEPTIBLE,
    APPLY_WEAPONSPELL,
    APPLY_LCK,
    APPLY_BACKSTAB,
    APPLY_PICK,
    APPLY_TRACK,
    APPLY_STEAL,
    APPLY_SNEAK,
    APPLY_HIDE,
    APPLY_PALM,
    APPLY_DETRAP,
    APPLY_DODGE,
    APPLY_PEEK,
    APPLY_SCAN,
    APPLY_GOUGE,
    APPLY_SEARCH,
    APPLY_MOUNT,
    APPLY_DISARM,
    APPLY_KICK,
    APPLY_PARRY,
    APPLY_BASH,
    APPLY_STUN,
    APPLY_PUNCH,
    APPLY_CLIMB,
    APPLY_GRIP,
    APPLY_SCRIBE,
    APPLY_BREW,
    APPLY_WEARSPELL,
    APPLY_REMOVESPELL,
    APPLY_EMOTION,
    APPLY_MENTALSTATE,
    APPLY_STRIPSN,
    APPLY_REMOVE,
    APPLY_DIG,
    APPLY_FULL,
    APPLY_THIRST,
    APPLY_DRUNK,
    APPLY_BLOOD,
    APPLY_SNIPE,
    MAX_APPLY_TYPE
};

constexpr auto REVERSE_APPLY = 1000;

/*
 * Values for containers (value[1]).
 * Used in #OBJECTS.
 */
constexpr auto CONT_CLOSEABLE = 1;
constexpr auto CONT_PICKPROOF = 2;
constexpr auto CONT_CLOSED = 4;
constexpr auto CONT_LOCKED = 8;

/*
 * Well known room virtual numbers.
 * Defined in #ROOMS.
 */
constexpr vnum_t ROOM_VNUM_LIMBO = 2;
constexpr vnum_t ROOM_VNUM_POLY = 3;
constexpr vnum_t ROOM_VNUM_HELL = 6;
constexpr vnum_t ROOM_VNUM_CHAT = 32144;
constexpr vnum_t ROOM_VNUM_TEMPLE = 32144;
constexpr vnum_t ROOM_VNUM_ALTAR = 32144;
constexpr vnum_t ROOM_VNUM_SCHOOL = 10300;
constexpr vnum_t ROOM_AUTH_START = 10300;
constexpr vnum_t ROOM_START_PLAYER = 201;
constexpr vnum_t ROOM_START_IMMORTAL = 100;
constexpr vnum_t ROOM_LIMBO_SHIPYARD = 45;
constexpr vnum_t ROOM_PLUOGUS_QUIT = 32148;
constexpr vnum_t ROOM_VNUM_PLACE_BOUNTY = 6604;
constexpr vnum_t ROOM_VNUM_CLONING_CYLINDER = 10000;
constexpr vnum_t ROOM_VNUM_CLONING_PAY_COUNTER = 10001;
constexpr vnum_t ROOM_VNUM_CLONING_CLINIC = 10002;

/*
 * Directions.
 * Used in #ROOMS.
 */
 /* DirectionType */
enum
{
    DIR_INVALID = -1,
    DIR_NORTH = 0, /*  0 */
    DIR_EAST,      /*  1 */
    DIR_SOUTH,     /*  2 */
    DIR_WEST,      /*  3 */
    DIR_UP,        /*  4 */
    DIR_DOWN,      /*  5 */
    DIR_NORTHEAST, /*  6 */
    DIR_NORTHWEST, /*  7 */
    DIR_SOUTHEAST, /*  8 */
    DIR_SOUTHWEST, /*  9 */
    DIR_SOMEWHERE  /* 10 */,
    MAX_DIR = DIR_SOUTHWEST, /* max for normal walking */
    DIR_PORTAL = DIR_SOMEWHERE /* portal direction       */
};

/*
 * Sector types.
 * Used in #ROOMS.
 */
 /* SectorType */
enum
{
    SECT_INVALID = -1,
    SECT_INSIDE = 0,
    SECT_CITY,
    SECT_FIELD,
    SECT_FOREST,
    SECT_HILLS,
    SECT_MOUNTAIN,
    SECT_WATER_SWIM,
    SECT_WATER_NOSWIM,
    SECT_UNDERWATER,
    SECT_AIR,
    SECT_DESERT,
    SECT_DUNNO,
    SECT_OCEANFLOOR,
    SECT_UNDERGROUND,
    SECT_MAX
};

/*
 * Equpiment wear locations.
 * Used in #RESETS.
 */
 /* WearLocation */
enum
{
    WEAR_NONE = -1,
    WEAR_LIGHT = 0,
    WEAR_FINGER_L,
    WEAR_FINGER_R,
    WEAR_NECK_1,
    WEAR_NECK_2,
    WEAR_BODY,
    WEAR_HEAD,
    WEAR_LEGS,
    WEAR_FEET,
    WEAR_HANDS,
    WEAR_ARMS,
    WEAR_SHIELD,
    WEAR_ABOUT,
    WEAR_WAIST,
    WEAR_WRIST_L,
    WEAR_WRIST_R,
    WEAR_WIELD,
    WEAR_HOLD,
    WEAR_DUAL_WIELD,
    WEAR_EARS,
    WEAR_EYES,
    WEAR_MISSILE_WIELD,
    WEAR_FLOATING,
    WEAR_OVER,
    WEAR_DISGUISE,
    MAX_WEAR
};

/* Board Types */
/* BoardType */
enum
{
    BOARD_NOTE,
    BOARD_MAIL
};

/***************************************************************************
 *                                                                         *
 *                   VALUES OF INTEREST TO AREA BUILDERS                   *
 *                   (End of this section ... stop here)                   *
 *                                                                         *
 ***************************************************************************/

 /*
  * Conditions.
  */
  /* ConditionType */
enum
{
    COND_DRUNK,
    COND_FULL,
    COND_THIRST,
    COND_BLOODTHIRST,
    MAX_CONDS
};

/*
 * Positions.
 */
 /* PositionType */
enum
{
    POS_DEAD,
    POS_MORTAL,
    POS_INCAP,
    POS_STUNNED,
    POS_SLEEPING,
    POS_RESTING,
    POS_SITTING,
    POS_FIGHTING,
    POS_STANDING,
    POS_MOUNTED,
    POS_SHOVE,
    POS_DRAG,
    MAX_POSITION,

    DEFAULT_POSITION = POS_STANDING
};

/*
 * ACT bits for players.
 */
constexpr auto PLR_IS_NPC = BV00;      /* Don't EVER set.      */
constexpr auto PLR_BOUGHT_PET = BV01;
constexpr auto PLR_SHOVEDRAG = BV02;
constexpr auto PLR_AUTOEXIT = BV03;
constexpr auto PLR_AUTOLOOT = BV04;
constexpr auto PLR_AUTOSAC = BV05;
constexpr auto PLR_BLANK = BV06;

constexpr auto PLR_BRIEF = BV08;
constexpr auto PLR_COMBINE = BV09;
constexpr auto PLR_PROMPT = BV10;
constexpr auto PLR_TELNET_GA = BV11;
constexpr auto PLR_HOLYLIGHT = BV12;
constexpr auto PLR_WIZINVIS = BV13;
constexpr auto PLR_ROOMVNUM = BV14;
constexpr auto PLR_SILENCE = BV15;
constexpr auto PLR_NO_EMOTE = BV16;
constexpr auto PLR_DONTAUTOFUEL = BV17;
constexpr auto PLR_NO_TELL = BV18;
constexpr auto PLR_LOG = BV19;
constexpr auto PLR_DENY = BV20;
constexpr auto PLR_FREEZE = BV21;
constexpr auto PLR_KILLER = BV22;
constexpr auto PLR_HOME_RESIDENT = BV23;
constexpr auto PLR_LITTERBUG = BV24;
constexpr auto PLR_ANSI = BV25;

constexpr auto PLR_NICE = BV27;
constexpr auto PLR_FLEE = BV28;
constexpr auto PLR_AUTOGOLD = BV29;
constexpr auto PLR_AUTOMAP = BV30;
constexpr auto PLR_AFK = BV31;

/* TimerType */
enum
{
    TIMER_NONE,
    TIMER_RECENTFIGHT,
    TIMER_SHOVEDRAG,
    TIMER_CMD_FUN,
    TIMER_APPLIED,
    TIMER_PKILLED
};

/*
 * Channel bits.
 */
constexpr auto CHANNEL_AUCTION = BV00;
constexpr auto CHANNEL_CHAT = BV01;

constexpr auto CHANNEL_IMMTALK = BV03;
constexpr auto CHANNEL_MUSIC = BV04;
constexpr auto CHANNEL_ASK = BV05;
constexpr auto CHANNEL_SHOUT = BV06;
constexpr auto CHANNEL_YELL = BV07;
constexpr auto CHANNEL_MONITOR = BV08;
constexpr auto CHANNEL_LOG = BV09;
constexpr auto CHANNEL_104 = BV10;
constexpr auto CHANNEL_CLAN = BV11;
constexpr auto CHANNEL_BUILD = BV12;
constexpr auto CHANNEL_105 = BV13;
constexpr auto CHANNEL_AVTALK = BV14;
constexpr auto CHANNEL_PRAY = BV15;

constexpr auto CHANNEL_GUILD = BV17;
constexpr auto CHANNEL_COMM = BV18;
constexpr auto CHANNEL_TELLS = BV19;
constexpr auto CHANNEL_ORDER = BV20;
constexpr auto CHANNEL_NEWBIE = BV21;
constexpr auto CHANNEL_WARTALK = BV22;
constexpr auto CHANNEL_OOC = BV23;
constexpr auto CHANNEL_SHIP = BV24;
constexpr auto CHANNEL_SYSTEM = BV25;
constexpr auto CHANNEL_SPACE = BV26;
constexpr auto CHANNEL_103 = BV27;
constexpr auto CHANNEL_ARENA = BV28;
constexpr auto CHANNEL_ALLCLAN = BV29;

constexpr auto CHANNEL_CLANTALK = CHANNEL_CLAN;

/* Area defines - Scryn 8/11
 *
 */
constexpr auto AREA_DELETED = BV00;
constexpr auto AREA_LOADED = BV01;

/*
 * Liquids.
 */
constexpr auto LIQ_WATER = 0;
constexpr auto LIQ_MAX = 39;

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
 /* Constants for arg2 of 'B' resets. */

constexpr auto BIT_RESET_DOOR = 0;
constexpr auto BIT_RESET_OBJECT = 1;
constexpr auto BIT_RESET_MOBILE = 2;
constexpr auto BIT_RESET_ROOM = 3;
constexpr auto BIT_RESET_TYPE_MASK = 0xFF;    /* 256 should be enough */
constexpr auto BIT_RESET_DOOR_THRESHOLD = 8;
constexpr auto BIT_RESET_DOOR_MASK = 0xFF00;  /* 256 should be enough */
constexpr auto BIT_RESET_SET = BV30;
constexpr auto BIT_RESET_TOGGLE = BV31;
constexpr auto BIT_RESET_FREEBITS = 0x3FFF0000;    /* For reference */

/*
 * Types of skill numbers.  Used to keep separate lists of sn's
 * Must be non-overlapping with spell/skill types,
 * but may be arbitrary beyond that.
 */
constexpr auto TYPE_UNDEFINED = -1;
constexpr auto TYPE_HIT = 1000;  /* allows for 1000 skills/spells */
constexpr auto TYPE_HERB = 2000; /* allows for 1000 attack types  */
constexpr auto TYPE_PERSONAL = 3000; /* allows for 1000 herb types    */

 /*
  *  Target types.
  */
  /* SkillTargetType */
enum
{
    TAR_IGNORE,
    TAR_CHAR_OFFENSIVE,
    TAR_CHAR_DEFENSIVE,
    TAR_CHAR_SELF,
    TAR_OBJ_INV,
    SKILLTARGETTYPE_MAX
};

/* SkillType */
enum
{
    SKILL_UNKNOWN,
    SKILL_SPELL,
    SKILL_SKILL,
    SKILL_WEAPON,
    SKILL_TONGUE,
    SKILL_HERB,
    SKILLTYPE_MAX
};

/*
 * Place any skill types you don't want them to be able to practice
 * normally in this list.  Separate each with a space.
 * (Uses an is_name check). -- Altrag
 */
constexpr auto CANT_PRAC = "Tongue";
constexpr const char *Concat(const char *a, const char *b)
{
    return "";
}

/*
 * Data files used by the server.
 *
 * AREA_LIST contains a list of areas to boot.
 * All files are read in completely at bootup.
 * Most output files (bug, idea, typo, shutdown) are append-only.
 */
#define DATA_DIR        "./data/"
#define AREA_DIR        DATA_DIR "areas/"
#define PLAYER_DIR      DATA_DIR "players/"   /* Player files                 */
#define BACKUP_DIR      DATA_DIR "backup/"    /* Backup Player files          */
#define GOD_DIR         DATA_DIR "gods/"      /* God Info Dir                 */
#define BUILD_DIR       DATA_DIR "building/"  /* Online building save dir     */
#define VENDOR_DIR      DATA_DIR "vendor/"
#define STOREROOM_DIR   DATA_DIR "storeroom/"
#define CORPSE_DIR      DATA_DIR "corpses/"   /* Corpses                      */
#define SCRIPT_DIR      "./scripts/"
#define LOG_DIR         "./log/"

#define AREA_LIST       "area.lst"      /* List of areas                */
#define SHUTDOWN_FILE   "shutdown.txt"          /* For 'shutdown'        */

#define COPYOVER_FILE   DATA_DIR "copyover.dat"
#define BOOTLOG_FILE    LOG_DIR "boot.txt"     /* Boot up error file  */
#define BUG_FILE        LOG_DIR "bugs.txt"     /* For 'bug' and Bug() */
#define IDEA_FILE       DATA_DIR "ideas.txt"    /* For 'idea'          */
#define TYPO_FILE       DATA_DIR "typos.txt"    /* For 'typo'          */
#define LOG_FILE        LOG_DIR "log.txt"      /* For talking in logged rooms */
#define WIZLIST_FILE    DATA_DIR "WIZLIST"      /* Wizlist             */
#define WHO_FILE        DATA_DIR "WHO"          /* Who output file     */
#define WEBWHO_FILE     DATA_DIR "WEBWHO"       /* WWW Who output file */
#define USAGE_FILE      LOG_DIR "usage.txt"    /* How many people are on
                                                     every half hour - trying to
                                                     determine best reboot time */

constexpr auto ERROR_PROG = -1;
constexpr auto ACT_PROG = BV00;
constexpr auto SPEECH_PROG = BV01;
constexpr auto RAND_PROG = BV02;
constexpr auto FIGHT_PROG = BV03;
constexpr auto RFIGHT_PROG = BV03;
constexpr auto DEATH_PROG = BV04;
constexpr auto RDEATH_PROG = BV04;
constexpr auto HITPRCNT_PROG = BV05;
constexpr auto ENTRY_PROG = BV06;
constexpr auto ENTER_PROG = BV06;
constexpr auto GREET_PROG = BV07;
constexpr auto RGREET_PROG = BV07;
constexpr auto OGREET_PROG = BV07;
constexpr auto ALL_GREET_PROG = BV08;
constexpr auto GIVE_PROG = BV09;
constexpr auto BRIBE_PROG = BV10;
constexpr auto HOUR_PROG = BV11;
constexpr auto TIME_PROG = BV12;
constexpr auto WEAR_PROG = BV13;
constexpr auto REMOVE_PROG = BV14;
constexpr auto SAC_PROG = BV15;
constexpr auto LOOK_PROG = BV16;
constexpr auto EXA_PROG = BV17;
constexpr auto ZAP_PROG = BV18;
constexpr auto GET_PROG = BV19;
constexpr auto DROP_PROG = BV20;
constexpr auto DAMAGE_PROG = BV21;
constexpr auto REPAIR_PROG = BV22;
constexpr auto RANDIW_PROG = BV23;
constexpr auto SPEECHIW_PROG = BV24;
constexpr auto PULL_PROG = BV25;
constexpr auto PUSH_PROG = BV26;
constexpr auto SLEEP_PROG = BV27;
constexpr auto REST_PROG = BV28;
constexpr auto LEAVE_PROG = BV29;
constexpr auto SCRIPT_PROG = BV30;
constexpr auto USE_PROG = BV31;

#endif
