#ifndef _SWRIP_CONSTANTS_H_
#define _SWRIP_CONSTANTS_H_

#include <limits.h>

/*
 * String and memory management parameters.
 */
#define MAX_STRING_LENGTH        4096  /* buf */
#define MAX_INPUT_LENGTH         1024  /* arg */
#define MAX_INBUF_SIZE           1024

#define DUR_CONV        23.333333333333333333333333
#define HIDDEN_TILDE    '*'

#define BV00            (1 <<  0)
#define BV01            (1 <<  1)
#define BV02            (1 <<  2)
#define BV03            (1 <<  3)
#define BV04            (1 <<  4)
#define BV05            (1 <<  5)
#define BV06            (1 <<  6)
#define BV07            (1 <<  7)
#define BV08            (1 <<  8)
#define BV09            (1 <<  9)
#define BV10            (1 << 10)
#define BV11            (1 << 11)
#define BV12            (1 << 12)
#define BV13            (1 << 13)
#define BV14            (1 << 14)
#define BV15            (1 << 15)
#define BV16            (1 << 16)
#define BV17            (1 << 17)
#define BV18            (1 << 18)
#define BV19            (1 << 19)
#define BV20            (1 << 20)
#define BV21            (1 << 21)
#define BV22            (1 << 22)
#define BV23            (1 << 23)
#define BV24            (1 << 24)
#define BV25            (1 << 25)
#define BV26            (1 << 26)
#define BV27            (1 << 27)
#define BV28            (1 << 28)
#define BV29            (1 << 29)
#define BV30            (1 << 30)
#define BV31            (1 << 31)
/* 32 USED! DO NOT ADD MORE! SB */

#define MAX_LAYERS               8      /* maximum clothing layers */
#define MAX_NEST               100      /* maximum container nesting */

#define MAX_KILLTRACK           20      /* track mob vnums killed */

/*
 * Game parameters.
 * Increase the max'es if you add more of something.
 * Adjust the pulse numbers to suit yourself.
 */
#define MIN_NAME_LENGTH             3
#define MAX_NAME_LENGTH            12
#define MIN_VNUM                    1
#define MAX_VNUM                SHRT_MAX
#define MAX_EXP_WORTH          500000
#define MIN_EXP_WORTH              25

#define MAX_REXITS                 20   /* Maximum exits allowed in 1 room */
#define MAX_SKILL                 276
#define MAX_ABILITY                 9
#define MAX_RL_ABILITY              8
#define MAX_NPC_RACE               91
#define MAX_LEVEL                 105
#define MAX_ABILITY_LEVEL         150
#define MAX_CLAN                   50
#define MAX_PLANET                100
#define MAX_SHIP                 1000
#define MAX_BOUNTY                255
#define MAX_GOV                   255
#define MAX_RAN_POP                16

#define MAX_HERB                   20

#define LEVEL_HERO                 (MAX_LEVEL - 5)
#define LEVEL_IMMORTAL             (MAX_LEVEL - 4)
#define LEVEL_SUPREME              MAX_LEVEL
#define LEVEL_INFINITE             (MAX_LEVEL - 1)
#define LEVEL_ETERNAL              (MAX_LEVEL - 1)
#define LEVEL_IMPLEMENTOR          (MAX_LEVEL - 1)
#define LEVEL_SUB_IMPLEM           (MAX_LEVEL - 1)
#define LEVEL_ASCENDANT            (MAX_LEVEL - 2)
#define LEVEL_GREATER              (MAX_LEVEL - 2)
#define LEVEL_GOD                  (MAX_LEVEL - 2)
#define LEVEL_LESSER               (MAX_LEVEL - 3)
#define LEVEL_TRUEIMM              (MAX_LEVEL - 3)
#define LEVEL_DEMI                 (MAX_LEVEL - 3)
#define LEVEL_SAVIOR               (MAX_LEVEL - 3)
#define LEVEL_CREATOR              (MAX_LEVEL - 3)
#define LEVEL_ACOLYTE              (MAX_LEVEL - 4)
#define LEVEL_NEOPHYTE             (MAX_LEVEL - 4)
#define LEVEL_AVATAR               (MAX_LEVEL - 5)

#define LEVEL_LOG                   LEVEL_LESSER
#define LEVEL_HIGOD                 LEVEL_GOD

#define MOB_VNUM_VENDOR         4  /*vnum of vendor*/
#define LEVEL_BUY_VENDOR        50   /* minimum level to buy a vendor */
#define COST_BUY_VENDOR         1000000   /* cost of a vendor */
#define OBJ_VNUM_DEED           4   /* vnum of deed */
#define ROOM_VNUM_VENSTOR       4  /* where messed up vendors go! */

/* IMP rooms */
#define IMP_ROOM1 109
#define IMP_ROOM2 122

#define PULSE_PER_SECOND            4
#define PULSE_MINUTE              ( 60 * PULSE_PER_SECOND)
#define PULSE_VIOLENCE            (  3 * PULSE_PER_SECOND)
#define PULSE_MOBILE              (  4 * PULSE_PER_SECOND)
#define PULSE_TICK                ( 70 * PULSE_PER_SECOND)
#define PULSE_AREA                ( 60 * PULSE_PER_SECOND)
#define PULSE_AUCTION             ( 10 * PULSE_PER_SECOND)
#define PULSE_SPACE               ( 10 * PULSE_PER_SECOND)
#define PULSE_TAXES               ( 60 * PULSE_MINUTE)
#define PULSE_ARENA               (30 * PULSE_PER_SECOND)

/*
 * Command logging types.
 */
typedef enum
  {
    LOG_NORMAL, LOG_ALWAYS, LOG_NEVER, LOG_BUILD, LOG_HIGH, LOG_COMM, LOG_ALL
  } log_types;

/*
 * Return types for move_char, damage, greet_trigger, etc, etc
 * Added by Thoric to get rid of bugs
 */
typedef enum
  {
    rNONE, rCHAR_DIED, rVICT_DIED, rBOTH_DIED, rCHAR_QUIT, rVICT_QUIT,
    rBOTH_QUIT, rSPELL_FAILED, rOBJ_SCRAPPED, rOBJ_EATEN, rOBJ_EXPIRED,
    rOBJ_TIMER, rOBJ_SACCED, rOBJ_QUAFFED, rOBJ_USED, rOBJ_EXTRACTED,
    rOBJ_DRUNK, rCHAR_IMMUNE, rVICT_IMMUNE, rCHAR_AND_OBJ_EXTRACTED = 128,
    rERROR = 255
  } ret_types;

/* Echo types for echo_to_all */
#define ECHOTAR_ALL     0
#define ECHOTAR_PC      1
#define ECHOTAR_IMM     2

/* defines for new do_who */
#define WT_MORTAL 0
#define WT_IMM    2
#define WT_AVATAR 1
#define WT_NEWBIE 3

/*
 * Time and weather stuff.
 */
typedef enum
  {
    SUN_DARK, SUN_RISE, SUN_LIGHT, SUN_SET
  } sun_positions;

typedef enum
  {
    SKY_CLOUDLESS, SKY_CLOUDY, SKY_RAINING, SKY_LIGHTNING
  } sky_conditions;

/*
 * Connected state for a channel.
 */
typedef enum
  {
    CON_PLAYING,                CON_GET_NAME,           CON_GET_OLD_PASSWORD,
    CON_CONFIRM_NEW_NAME,       CON_GET_NEW_PASSWORD,   CON_CONFIRM_NEW_PASSWORD,
    CON_GET_NEW_SEX,    CON_READ_MOTD,
    CON_GET_NEW_RACE,   CON_GET_EMULATION,      CON_EDITING,
    CON_GET_WANT_RIPANSI,       CON_TITLE,              CON_PRESS_ENTER,
    CON_WAIT_1,         CON_WAIT_2,             CON_WAIT_3,
    CON_ACCEPTED,         CON_GET_PKILL,                CON_READ_IMOTD,
    CON_GET_NEW_EMAIL,    CON_GET_MSP,            CON_GET_NEW_CLASS,
    CON_ROLL_STATS,     CON_STATS_OK,           CON_COPYOVER_RECOVER
  } connection_types;

/*
 * Character substates
 */
typedef enum
  {
    SUB_NONE, SUB_PAUSE, SUB_PERSONAL_DESC, SUB_OBJ_SHORT, SUB_OBJ_LONG,
    SUB_OBJ_EXTRA, SUB_MOB_LONG, SUB_MOB_DESC, SUB_ROOM_DESC, SUB_ROOM_EXTRA,
    SUB_ROOM_EXIT_DESC, SUB_WRITING_NOTE, SUB_MPROG_EDIT, SUB_HELP_EDIT,
    SUB_WRITING_MAP, SUB_PERSONAL_BIO, SUB_REPEATCMD, SUB_RESTRICTED,
    SUB_DEITYDESC,
    /* timer types ONLY below this point */
    SUB_TIMER_DO_ABORT = 128, SUB_TIMER_CANT_ABORT
  } char_substates;

/* ability classes */

#define ABILITY_NONE            -1
#define COMBAT_ABILITY          0
#define PILOTING_ABILITY        1
#define ENGINEERING_ABILITY     2
#define HUNTING_ABILITY         3
#define SMUGGLING_ABILITY       4
#define DIPLOMACY_ABILITY       5
#define LEADERSHIP_ABILITY      6
#define COMMANDO_ABILITY        8
#define FORCE_ABILITY           7

/* the races */
#define RACE_HUMAN                0
#define RACE_WOOKIEE              1
#define RACE_TWI_LEK              2
#define RACE_RODIAN               3
#define RACE_HUTT                 4
#define RACE_MON_CALAMARI         5
#define RACE_SHISTAVANEN          6
#define RACE_GAMORREAN            7
#define RACE_JAWA                 8
#define RACE_ADARIAN              9
#define RACE_EWOK                10
#define RACE_VERPINE             11
#define RACE_DEFEL               12
#define RACE_TRANDOSHAN          13
#define RACE_CHADRA_FAN          14
#define RACE_QUARREN             15
#define RACE_SULLUSTAN           16
#define RACE_FALLEEN             17
#define RACE_ITHORIAN            18
#define RACE_DEVARONIAN          19
#define RACE_GOTAL               20
#define RACE_DROID               21
#define RACE_FIRRERREO           22
#define RACE_BARABEL             23
#define RACE_BOTHAN              24
#define RACE_TOGARIAN            25
#define RACE_DUG                 26
#define RACE_KUBAZ               27
#define RACE_SELONIAN            28
#define RACE_GRAN                29
#define RACE_YEVETHA             30

#define RACE_GAND                31
#define RACE_DUROS               32
#define RACE_COYNITE             33
#define RACE_PROTOCAL_DROID      34
#define RACE_ASSASSIN_DROID      35
#define RACE_GLADIATOR_DROID     36
#define RACE_ASTROMECH_DROID     37
#define RACE_INTERROGATION_DROID 38
#define RACE_GOD                 39
#define MAX_RACE                 40

/*
 * Languages -- Altrag
 */
#define LANG_COMMON       BV00  /* Human base language */
#define LANG_WOOKIEE      BV01
#define LANG_TWI_LEK      BV02
#define LANG_RODIAN       BV03
#define LANG_HUTT         BV04
#define LANG_MON_CALAMARI BV05
#define LANG_NOGHRI       BV06
#define LANG_SHISTAVANEN  BV06
#define LANG_EWOK         BV07
#define LANG_ITHORIAN     BV08
#define LANG_GOTAL        BV09
#define LANG_DEVARONIAN   BV10
#define LANG_BARABEL      BV11
#define LANG_DROID        BV11
#define LANG_FIRRERREO    BV12
#define LANG_SPIRITUAL    BV12
#define LANG_BOTHAN       BV13
#define LANG_MAGICAL      BV13
#define LANG_GAMORREAN    BV14
#define LANG_TOGORIAN     BV15
#define LANG_GOD          BV15
#define LANG_KUBAZ        BV16
#define LANG_ANCIENT      BV16
#define LANG_JAWA         BV17
#define LANG_CLAN         BV18
#define LANG_ADARIAN      BV19
#define LANG_VERPINE      BV20
#define LANG_DEFEL        BV21
#define LANG_TRANDOSHAN   BV22
#define LANG_CHADRA_FAN   BV23
#define LANG_QUARREN      BV24
#define LANG_QUARREN      BV24
#define LANG_SULLUSTAN    BV25
#define LANG_FALLEEN      BV26
#define LANG_BINARY       BV27
#define LANG_YEVETHAN     BV28
#define LANG_GAND         BV29
#define LANG_DUROS        BV30
#define LANG_COYNITE      BV31

#define LANG_UNKNOWN        0  /* Anything that doesnt fit a category */

/*
 * TO types for act.
 */
#define TO_ROOM             0
#define TO_NOTVICT          1
#define TO_VICT             2
#define TO_CHAR             3

/*
 * Real action "TYPES" for act.
 */
#define AT_BLACK            0
#define AT_BLOOD            1
#define AT_DGREEN           2
#define AT_ORANGE           3
#define AT_DBLUE            4
#define AT_PURPLE           5
#define AT_CYAN             6
#define AT_GREY             7
#define AT_DGREY            8
#define AT_RED              9
#define AT_GREEN           10
#define AT_YELLOW          11
#define AT_BLUE            12
#define AT_PINK            13
#define AT_LBLUE           14
#define AT_WHITE           15
#define AT_BLINK           16
#define AT_PLAIN           AT_GREY
#define AT_ACTION          AT_GREY
#define AT_SAY             AT_WHITE
#define AT_GOSSIP          AT_LBLUE
#define AT_YELL    AT_WHITE
#define AT_TELL         AT_BLUE
#define AT_HIT             AT_WHITE
#define AT_HITME           AT_YELLOW
#define AT_OOC       AT_YELLOW
#define AT_IMMORT          AT_WHITE
#define AT_AVATAR          AT_CYAN
#define AT_HURT            AT_RED
#define AT_FALLING         AT_WHITE + AT_BLINK
#define AT_DANGER          AT_RED + AT_BLINK
#define AT_MAGIC           AT_BLUE
#define AT_CONSIDER        AT_GREY
#define AT_REPORT          AT_GREY
#define AT_POISON          AT_GREEN
#define AT_SOCIAL          AT_GREY
#define AT_DYING           AT_YELLOW
#define AT_DEAD         AT_RED
#define AT_SKILL           AT_GREEN
#define AT_CARNAGE      AT_BLOOD
#define AT_DAMAGE          AT_WHITE
#define AT_FLEE         AT_YELLOW
#define AT_RMNAME          AT_WHITE
#define AT_RMDESC          AT_GREY
#define AT_OBJECT          AT_GREEN
#define AT_PERSON          AT_PINK
#define AT_LIST            AT_BLUE
#define AT_BYE             AT_GREEN
#define AT_GOLD            AT_YELLOW
#define AT_GTELL           AT_GREEN
#define AT_NOTE            AT_GREEN
#define AT_HUNGRY          AT_ORANGE
#define AT_THIRSTY         AT_BLUE
#define AT_FIRE            AT_RED
#define AT_SOBER           AT_WHITE
#define AT_WEAROFF         AT_YELLOW
#define AT_EXITS           AT_WHITE
#define AT_SCORE           AT_LBLUE
#define AT_RESET           AT_DGREEN
#define AT_LOG             AT_PURPLE
#define AT_DIEMSG          AT_WHITE
#define AT_WARTALK         AT_RED
#define AT_SHIP            AT_PINK
#define AT_CLAN            AT_PINK

#define INIT_WEAPON_CONDITION    12
#define MAX_ITEM_IMPACT          30

/*
 * Shop types.
 */
#define MAX_TRADE        5
#define MAX_FIX         3
#define SHOP_FIX        1
#define SHOP_RECHARGE   2

#define MAX_COORD 15000000
#define MAX_COORD_S 13000000

#if 0
#define MAX_BUS 7
#endif

typedef enum {
  CLAN_PLAIN, CLAN_CRIME, CLAN_GUILD, CLAN_SUBCLAN
} clan_types;

typedef enum
  {
    SHIP_CIVILIAN,
    SHIP_REBEL,
    SHIP_IMPERIAL,
    MOB_SHIP
  } ship_types;

typedef enum
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
  } ship_states;

typedef enum
  {
    MISSILE_READY,
    MISSILE_FIRED,
    MISSILE_RELOAD,
    MISSILE_RELOAD_2,
    MISSILE_DAMAGED
  } missile_states;

typedef enum
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
    SHIP_DEBRIS
  } ship_classes;

typedef enum
  {
    CONCUSSION_MISSILE,
    PROTON_TORPEDO,
    HEAVY_ROCKET,
    HEAVY_BOMB
  } missile_types;

typedef enum
  {
    SPACE_SUN,
    SPACE_PLANET,
    SPACE_MOVEOBJ,
    SPACE_OBJ
  } spaceobjtypes;

typedef enum
  {
    GROUP_CLAN,
    GROUP_COUNCIL,
    GROUP_GUILD
  } group_types;

#define LASER_DAMAGED    -1
#define LASER_READY       0
#define MAX_NUMBER_OF_TURRETS_IN_SHIP 10

#define PLANET_NOCAPTURE  BV00

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
#define MOB_VNUM_ANIMATED_CORPSE   5
#define MOB_VNUM_POLY_WOLF         10

#define MOB_VNUM_STORMTROOPER   20
#define MOB_VNUM_IMP_GUARD      21
#define MOB_VNUM_NR_GUARD       22
#define MOB_VNUM_NR_TROOPER     23
#define MOB_VNUM_MERCINARY      24
#define MOB_VNUM_BOUNCER        25
#define MOB_VNUM_IMP_ELITE 26
#define MOB_VNUM_IMP_PATROL 27
#define MOB_VNUM_IMP_FORCES 28
#define MOB_VNUM_NR_ELITE 29
#define MOB_VNUM_NR_PATROL 30
#define MOB_VNUM_NR_FORCES 31
#define MOB_VNUM_MERC_ELITE 32
#define MOB_VNUM_MERC_PATROL 33
#define MOB_VNUM_MERC_FORCES 34

/*
 * ACT bits for mobs.
 * Used in #MOBILES.
 */
#define ACT_is_npc               BV00           /* Auto set for mobs    */
#define ACT_SENTINEL             BV01           /* Stays in one room    */
#define ACT_SCAVENGER            BV02           /* Picks up objects     */
#define ACT_AGGRESSIVE           BV05           /* Attacks PC's         */
#define ACT_STAY_AREA            BV06           /* Won't leave area     */
#define ACT_WIMPY                BV07           /* Flees when hurt      */
#define ACT_PET                  BV08           /* Auto set for pets    */
#define ACT_TRAIN                BV09           /* Can train PC's       */
#define ACT_PRACTICE             BV10           /* Can practice PC's    */
#define ACT_IMMORTAL             BV11           /* Cannot be killed     */
#define ACT_DEADLY               BV12           /* Has a deadly poison  */
#define ACT_POLYSELF             BV13
#define ACT_META_AGGR            BV14           /* Extremely aggressive */
#define ACT_GUARDIAN             BV15           /* Protects master      */
#define ACT_RUNNING              BV16           /* Hunts quickly        */
#define ACT_NOWANDER             BV17           /* Doesn't wander       */
#define ACT_MOUNTABLE            BV18           /* Can be mounted       */
#define ACT_MOUNTED              BV19           /* Is mounted           */
#define ACT_SCHOLAR              BV20           /* Can teach languages  */
#define ACT_SECRETIVE            BV21           /* actions aren't seen  */
#define ACT_POLYMORPHED          BV22           /* Mob is a ch          */
#define ACT_MOBINVIS             BV23           /* Like wizinvis        */
#define ACT_NOASSIST             BV24           /* Doesn't assist mobs  */
#define ACT_NOKILL               BV25           /* Mob can't die */
#define ACT_DROID                BV26           /* mob is a droid */
#define ACT_NOCORPSE             BV27
#define ACT_PROTOTYPE            BV30           /* A prototype mob      */
/* 20 acts */

/* bits for vip flags */

#define VIP_CORUSCANT           BV00
#define VIP_KASHYYYK            BV01
#define VIP_RYLOTH              BV02
#define VIP_RODIA               BV03
#define VIP_NAL_HUTTA           BV04
#define VIP_MON_CALAMARI        BV05
#define VIP_HONOGHR             BV06
#define VIP_GAMORR              BV07
#define VIP_TATOOINE            BV08
#define VIP_ADARI               BV09
#define VIP_BYSS                BV10
#define VIP_ENDOR               BV11
#define VIP_ROCHE               BV12
#define VIP_AF_EL               BV13
#define VIP_TRANDOSH            BV14
#define VIP_CHAD                BV15
#define VIP_CORELLIA            BV16
#define VIP_HOTH                BV17
#define VIP_ASTEROID            BV18
#define VIP_BESPIN              BV19
#define VIP_KUAT                BV20
#define VIP_SOCORRO             BV21
#define VIP_CORULAG             BV22
#define VIP_HAPES               BV23
#define VIP_WROONA              BV24
#define VIP_DATHOMIR            BV25
#define VIP_SULLUST             BV26

/* player wanted bits */

#define WANTED_MON_CALAMARI     VIP_MON_CALAMARI
#define WANTED_CORUSCANT        VIP_CORUSCANT
#define WANTED_ADARI            VIP_ADARI
#define WANTED_RODIA            VIP_RODIA
#define WANTED_RYLOTH           VIP_RYLOTH
#define WANTED_GAMORR           VIP_GAMORR
#define WANTED_TATOOINE         VIP_TATOOINE
#define WANTED_BYSS             VIP_BYSS
#define WANTED_NAL_HUTTA        VIP_NAL_HUTTA
#define WANTED_KASHYYYK         VIP_KASHYYYK
#define WANTED_HONOGHR          VIP_HONOGHR
#define WANTED_ENDOR            BV11
#define WANTED_ROCHE            BV12
#define WANTED_AF_EL            BV13
#define WANTED_TRANDOSH         BV14
#define WANTED_CHAD             BV15
#define WANTED_CORELLIA         VIP_CORELLIA
#define WANTED_HOTH             VIP_HOTH
#define WANTED_ASTEROID         VIP_ASTEROID
#define WANTED_BESPIN   VIP_BESPIN
#define WANTED_KUAT     VIP_KUAT
#define WANTED_SOCORRO  VIP_SOCORRO
#define WANTED_CORULAG  VIP_CORULAG
#define WANTED_HAPES    VIP_HAPES
#define WANTED_WROONA           VIP_WROONA
#define WANTED_DATHOMIR         VIP_DATHOMIR
#define WANTED_SULLUST          VIP_SULLUST

#define ROOM_JAIL_MON_CALAMARI_1   21148
#define ROOM_JAIL_MON_CALAMARI_2   21149
#define ROOM_JAIL_QUARREN_1     6931
#define ROOM_JAIL_QUARREN_2     6932
#define ROOM_JAIL_ADARI        29108

/*
 * Bits for 'affected_by'.
 / * Used in #MOBILES.
*/
#define AFF_NONE                  0

#define AFF_BLIND                 BV00
#define AFF_INVISIBLE             BV01
#define AFF_DETECT_EVIL           BV02
#define AFF_DETECT_INVIS          BV03
#define AFF_DETECT_MAGIC          BV04
#define AFF_DETECT_HIDDEN         BV05
#define AFF_WEAKEN                BV06
#define AFF_SANCTUARY             BV07
#define AFF_FAERIE_FIRE           BV08
#define AFF_INFRARED              BV09
#define AFF_CURSE                 BV10
#define AFF_FLAMING               BV11          /* Unused       */
#define AFF_POISON                BV12
#define AFF_PROTECT               BV13
#define AFF_PARALYSIS             BV14
#define AFF_SNEAK                 BV15
#define AFF_HIDE                  BV16
#define AFF_SLEEP                 BV17
#define AFF_CHARM                 BV18
#define AFF_FLYING                BV19
#define AFF_PASS_DOOR             BV20
#define AFF_FLOATING              BV21
#define AFF_TRUESIGHT             BV22
#define AFF_DETECTTRAPS           BV23
#define AFF_SCRYING               BV24
#define AFF_FIRESHIELD            BV25
#define AFF_SHOCKSHIELD           BV26
#define AFF_BIND                  BV27
#define AFF_ICESHIELD             BV28
#define AFF_POSSESS               BV29
#define AFF_BERSERK               BV30
#define AFF_AQUA_BREATH           BV31

/* 31 aff's (1 left.. :P) */
/* make that none - ugh - time for another field? :P */
/*
 * Resistant Immune Susceptible flags
 */
#define RIS_FIRE                  BV00
#define RIS_COLD                  BV01
#define RIS_ELECTRICITY           BV02
#define RIS_ENERGY                BV03
#define RIS_BLUNT                 BV04
#define RIS_PIERCE                BV05
#define RIS_SLASH                 BV06
#define RIS_ACID                  BV07
#define RIS_POISON                BV08
#define RIS_DRAIN                 BV09
#define RIS_SLEEP                 BV10
#define RIS_CHARM                 BV11
#define RIS_HOLD                  BV12
#define RIS_NONMAGIC              BV13
#define RIS_PLUS1                 BV14
#define RIS_PLUS2                 BV15
#define RIS_PLUS3                 BV16
#define RIS_PLUS4                 BV17
#define RIS_PLUS5                 BV18
#define RIS_PLUS6                 BV19
#define RIS_MAGIC                 BV20
#define RIS_PARALYSIS             BV21
#define RIS_STEAL                 BV22
/* 21 RIS's*/

/*
 * Attack types
 */
#define ATCK_BITE                 BV00
#define ATCK_CLAWS                BV01
#define ATCK_TAIL                 BV02
#define ATCK_STING                BV03
#define ATCK_PUNCH                BV04
#define ATCK_KICK                 BV05
#define ATCK_TRIP                 BV06
#define ATCK_BASH                 BV07
#define ATCK_STUN                 BV08
#define ATCK_GOUGE                BV09
#define ATCK_BACKSTAB             BV10
#define ATCK_FEED                 BV11
#define ATCK_DRAIN                BV12
#define ATCK_FIREBREATH           BV13
#define ATCK_FROSTBREATH          BV14
#define ATCK_ACIDBREATH           BV15
#define ATCK_LIGHTNBREATH         BV16
#define ATCK_GASBREATH            BV17
#define ATCK_POISON               BV18
#define ATCK_NASTYPOISON          BV19
#define ATCK_GAZE                 BV20
#define ATCK_BLINDNESS            BV21
#define ATCK_CAUSESERIOUS         BV22
#define ATCK_EARTHQUAKE           BV23
#define ATCK_CAUSECRITICAL        BV24
#define ATCK_CURSE                BV25
#define ATCK_FLAMESTRIKE          BV26
#define ATCK_HARM                 BV27
#define ATCK_FIREBALL             BV28
#define ATCK_COLORSPRAY           BV29
#define ATCK_WEAKEN               BV30
#define ATCK_SPIRALBLAST          BV31
/* 32 USED! DO NOT ADD MORE! SB */

/*
 * Defense types
 */
#define DFND_PARRY                BV00
#define DFND_DODGE                BV01
#define DFND_HEAL                 BV02
#define DFND_CURELIGHT            BV03
#define DFND_CURESERIOUS          BV04
#define DFND_CURECRITICAL         BV05
#define DFND_DISPELMAGIC          BV06
#define DFND_DISPELEVIL           BV07
#define DFND_SANCTUARY            BV08
#define DFND_FIRESHIELD           BV09
#define DFND_SHOCKSHIELD          BV10
#define DFND_SHIELD               BV11
#define DFND_BLESS                BV12
#define DFND_STONESKIN            BV13
#define DFND_TELEPORT             BV14
#define DFND_MONSUM1              BV15
#define DFND_MONSUM2              BV16
#define DFND_MONSUM3              BV17
#define DFND_MONSUM4              BV18
#define DFND_DISARM               BV19
#define DFND_ICESHIELD            BV20
#define DFND_GRIP                 BV21
/* 21 def's */

/*
 * Body parts
 */
#define PART_HEAD                 BV00
#define PART_ARMS                 BV01
#define PART_LEGS                 BV02
#define PART_HEART                BV03
#define PART_BRAINS               BV04
#define PART_GUTS                 BV05
#define PART_HANDS                BV06
#define PART_FEET                 BV07
#define PART_FINGERS              BV08
#define PART_EAR                  BV09
#define PART_EYE                  BV10
#define PART_LONG_TONGUE          BV11
#define PART_EYESTALKS            BV12
#define PART_TENTACLES            BV13
#define PART_FINS                 BV14
#define PART_WINGS                BV15
#define PART_TAIL                 BV16
#define PART_SCALES               BV17
/* for combat */
#define PART_CLAWS                BV18
#define PART_FANGS                BV19
#define PART_HORNS                BV20
#define PART_TUSKS                BV21
#define PART_TAILATTACK           BV22
#define PART_SHARPSCALES          BV23
#define PART_BEAK                 BV24

#define PART_HAUNCH               BV25
#define PART_HOOVES               BV26
#define PART_PAWS                 BV27
#define PART_FORELEGS             BV28
#define PART_FEATHERS             BV29

/*
 * Autosave flags
 */
#define SV_DEATH                  BV00
#define SV_KILL                   BV01
#define SV_PASSCHG                BV02
#define SV_DROP                   BV03
#define SV_PUT                    BV04
#define SV_GIVE                   BV05
#define SV_AUTO                   BV06
#define SV_ZAPDROP                BV07
#define SV_AUCTION                BV08
#define SV_GET                    BV09
#define SV_RECEIVE                BV10
#define SV_IDLE                   BV11
#define SV_BACKUP                 BV12

/*
 * Pipe flags
 */
#define PIPE_TAMPED               BV01
#define PIPE_LIT                  BV02
#define PIPE_HOT                  BV03
#define PIPE_DIRTY                BV04
#define PIPE_FILTHY               BV05
#define PIPE_GOINGOUT             BV06
#define PIPE_BURNT                BV07
#define PIPE_FULLOFASH            BV08

/*
 * Skill/Spell flags    The minimum BV *MUST* be 11!
 */
#define SF_WATER                  BV11
#define SF_EARTH                  BV12
#define SF_AIR                    BV13
#define SF_ASTRAL                 BV14
#define SF_AREA                   BV15  /* is an area spell             */
#define SF_DISTANT                BV16  /* affects something far away   */
#define SF_REVERSE                BV17
#define SF_SAVE_HALF_DAMAGE       BV18  /* save for half damage         */
#define SF_SAVE_NEGATES           BV19  /* save negates affect          */
#define SF_ACCUMULATIVE           BV20  /* is accumulative              */
#define SF_RECASTABLE             BV21  /* can be refreshed             */
#define SF_NOSCRIBE               BV22  /* cannot be scribed            */
#define SF_NOBREW                 BV23  /* cannot be brewed             */
#define SF_GROUPSPELL             BV24  /* only affects group members   */
#define SF_OBJECT                 BV25  /* directed at an object        */
#define SF_CHARACTER              BV26  /* directed at a character      */
#define SF_SECRETSKILL            BV27  /* hidden unless learned        */
#define SF_PKSENSITIVE            BV28  /* much harder for plr vs. plr  */
#define SF_STOPONFAIL             BV29  /* stops spell on first failure */

typedef enum { SS_NONE, SS_POISON_DEATH, SS_ROD_WANDS, SS_PARA_PETRI,
               SS_BREATH, SS_SPELL_STAFF } save_types;

#define ALL_BITS                INT_MAX
#define SDAM_MASK               ALL_BITS & ~(BV00 | BV01 | BV02)
#define SACT_MASK               ALL_BITS & ~(BV03 | BV04 | BV05)
#define SCLA_MASK               ALL_BITS & ~(BV06 | BV07 | BV08)
#define SPOW_MASK               ALL_BITS & ~(BV09 | BV10)

typedef enum { SD_NONE, SD_FIRE, SD_COLD, SD_ELECTRICITY, SD_ENERGY, SD_ACID,
               SD_POISON, SD_DRAIN } spell_dam_types;

typedef enum { SA_NONE, SA_CREATE, SA_DESTROY, SA_RESIST, SA_SUSCEPT,
               SA_DIVINATE, SA_OBSCURE, SA_CHANGE } spell_act_types;

typedef enum { SP_NONE, SP_MINOR, SP_GREATER, SP_MAJOR } spell_power_types;

typedef enum { SC_NONE, SC_LUNAR, SC_SOLAR, SC_TRAVEL, SC_SUMMON,
               SC_LIFE, SC_DEATH, SC_ILLUSION } spell_class_types;

/*
 * Sex.
 * Used in #MOBILES.
 */
typedef enum { SEX_NEUTRAL, SEX_MALE, SEX_FEMALE } sex_types;

typedef enum {
  TRAP_TYPE_POISON_GAS = 1, TRAP_TYPE_POISON_DART,    TRAP_TYPE_POISON_NEEDLE,
  TRAP_TYPE_POISON_DAGGER,  TRAP_TYPE_POISON_ARROW,   TRAP_TYPE_BLINDNESS_GAS,
  TRAP_TYPE_SLEEPING_GAS,   TRAP_TYPE_FLAME,          TRAP_TYPE_EXPLOSION,
  TRAP_TYPE_ACID_SPRAY,     TRAP_TYPE_ELECTRIC_SHOCK, TRAP_TYPE_BLADE,
  TRAP_TYPE_SEX_CHANGE } trap_types;

#define MAX_TRAPTYPE               TRAP_TYPE_SEX_CHANGE

#define TRAP_ROOM                  BV00
#define TRAP_OBJ                   BV01
#define TRAP_ENTER_ROOM            BV02
#define TRAP_LEAVE_ROOM            BV03
#define TRAP_OPEN                  BV04
#define TRAP_CLOSE                 BV05
#define TRAP_GET                   BV06
#define TRAP_PUT                   BV07
#define TRAP_PICK                  BV08
#define TRAP_UNLOCK                BV09
#define TRAP_N                     BV10
#define TRAP_S                     BV11
#define TRAP_E                     BV12
#define TRAP_W                     BV13
#define TRAP_U                     BV14
#define TRAP_D                     BV15
#define TRAP_EXAMINE               BV16
#define TRAP_NE                    BV17
#define TRAP_NW                    BV18
#define TRAP_SE                    BV19
#define TRAP_SW                    BV20

/*
 * Well known object virtual numbers.
 * Defined in #OBJECTS.
 */
#define OBJ_VNUM_MONEY_ONE            2
#define OBJ_VNUM_MONEY_SOME           3

#define OBJ_VNUM_DROID_CORPSE        9
#define OBJ_VNUM_CORPSE_NPC          10
#define OBJ_VNUM_CORPSE_PC           11
#define OBJ_VNUM_SEVERED_HEAD        12
#define OBJ_VNUM_TORN_HEART          13
#define OBJ_VNUM_SLICED_ARM          14
#define OBJ_VNUM_SLICED_LEG          15
#define OBJ_VNUM_SPILLED_GUTS        16
#define OBJ_VNUM_BLOOD               17
#define OBJ_VNUM_BLOODSTAIN          18
#define OBJ_VNUM_SCRAPS              19

#define OBJ_VNUM_MUSHROOM            20
#define OBJ_VNUM_LIGHT_BALL          21
#define OBJ_VNUM_SPRING              22

#define OBJ_VNUM_SKIN                23

#define OBJ_VNUM_SLICE               24
#define OBJ_VNUM_SHOPPING_BAG        25

#define OBJ_VNUM_FIRE                30
#define OBJ_VNUM_TRAP                31
#define OBJ_VNUM_PORTAL              32

#define OBJ_VNUM_BLACK_POWDER        33
#define OBJ_VNUM_SCROLL_SCRIBING     34
#define OBJ_VNUM_FLASK_BREWING       35
#define OBJ_VNUM_NOTE                36

/* Academy eq */
#define OBJ_VNUM_SCHOOL_MACE      10315
#define OBJ_VNUM_SCHOOL_DAGGER    10312
#define OBJ_VNUM_SCHOOL_SWORD     10313
#define OBJ_VNUM_SCHOOL_VEST      10308
#define OBJ_VNUM_SCHOOL_SHIELD    10310
#define OBJ_VNUM_SCHOOL_BANNER    10311
#define OBJ_VNUM_SCHOOL_DIPLOMA   10321
#define OBJ_VNUM_SCHOOL_COMLINK   10424
#define OBJ_VNUM_BLASTECH_E11     50

/* Crafting prototypes */
#define OBJ_VNUM_CRAFTING_BLASTER    10420
#define OBJ_VNUM_CRAFTING_LIGHTSABER 10421
#define OBJ_VNUM_CRAFTING_BLADE      10422
#define OBJ_VNUM_CRAFTING_GRENADE    10425
#define OBJ_VNUM_CRAFTING_LANDMINE   10427
#define OBJ_VNUM_CRAFTING_GLOWROD    10428
#define OBJ_VNUM_CRAFTING_SHIELD     10429
#define OBJ_VNUM_CRAFTING_COMLINK    10430
#define OBJ_VNUM_CRAFTING_BOWCASTER  10431

#define OBJ_VNUM_CRAFTING_DISGUISE   10420 /* THIS IS REALLY BLASTER!!! */

#define NEW_CHARACTER_START_CREDITS 5000

/*
 * Item types.
 * Used in #OBJECTS.
 */
typedef enum
  {
    ITEM_NONE, ITEM_LIGHT, ITEM_SCROLL, ITEM_WAND, ITEM_STAFF, ITEM_WEAPON,
    ITEM_FIREWEAPON, ITEM_MISSILE, ITEM_TREASURE, ITEM_ARMOR, ITEM_POTION,
    ITEM_ROPE, ITEM_FURNITURE, ITEM_TRASH, ITEM_OLDTRAP, ITEM_CONTAINER,
    ITEM_NOTE, ITEM_DRINK_CON, ITEM_KEY, ITEM_FOOD, ITEM_MONEY, ITEM_PEN,
    ITEM_BOAT, ITEM_CORPSE_NPC, ITEM_CORPSE_PC, ITEM_FOUNTAIN, ITEM_PILL,
    ITEM_BLOOD, ITEM_BLOODSTAIN, ITEM_SCRAPS, ITEM_PIPE, ITEM_HERB_CON,
    ITEM_HERB, ITEM_INCENSE, ITEM_FIRE, ITEM_BOOK, ITEM_SWITCH, ITEM_LEVER,
    ITEM_PULLCHAIN, ITEM_BUTTON, ITEM_DIAL, ITEM_RUNE, ITEM_RUNEPOUCH,
    ITEM_MATCH, ITEM_TRAP, ITEM_MAP, ITEM_PORTAL, ITEM_PAPER,
    ITEM_TINDER, ITEM_LOCKPICK, ITEM_SPIKE, ITEM_DISEASE, ITEM_OIL, ITEM_FUEL,
    ITEM_SHORT_BOW, ITEM_LONG_BOW, ITEM_CROSSBOW, ITEM_AMMO, ITEM_QUIVER,
    ITEM_SHOVEL, ITEM_SALVE, ITEM_RAWSPICE, ITEM_LENS, ITEM_CRYSTAL, ITEM_DURAPLAST,
    ITEM_BATTERY, ITEM_TOOLKIT, ITEM_DURASTEEL, ITEM_OVEN, ITEM_MIRROR,
    ITEM_CIRCUIT, ITEM_SUPERCONDUCTOR, ITEM_COMLINK, ITEM_MEDPAC, ITEM_FABRIC,
    ITEM_RARE_METAL, ITEM_MAGNET, ITEM_THREAD, ITEM_SPICE, ITEM_SMUT, ITEM_DEVICE, ITEM_SPACECRAFT,
    ITEM_GRENADE, ITEM_LANDMINE, ITEM_GOVERNMENT, ITEM_DROID_CORPSE, ITEM_BOLT, ITEM_SCOPE,
    ITEM_FIGHTERCOMP, ITEM_MIDCOMP, ITEM_CAPITALCOMP, ITEM_CHEMICAL,
    ITEM_DISGUISE, ITEM_DIS_FABRIC, ITEM_HAIR
  } item_types;


#define MAX_ITEM_TYPE                ITEM_CHEMICAL
/*
 * Extra flags.
 * Used in #OBJECTS.
 */
#define ITEM_GLOW               BV00
#define ITEM_HUM                BV01
#define ITEM_DARK               BV02
#define ITEM_HUTT_SIZE          BV03
#define ITEM_CONTRABAND         BV04
#define ITEM_INVIS              BV05
#define ITEM_MAGIC              BV06
#define ITEM_NODROP             BV07
#define ITEM_BLESS              BV08
#define ITEM_ANTI_GOOD          BV09
#define ITEM_ANTI_EVIL          BV10
#define ITEM_ANTI_NEUTRAL       BV11
#define ITEM_NOREMOVE           BV12
#define ITEM_INVENTORY          BV13
#define ITEM_ANTI_SOLDIER       BV14
#define ITEM_ANTI_THIEF         BV15
#define ITEM_ANTI_HUNTER        BV16
#define ITEM_ANTI_JEDI          BV17
#define ITEM_SMALL_SIZE         BV18
#define ITEM_LARGE_SIZE         BV19
#define ITEM_DONATION           BV20
#define ITEM_CLANOBJECT         BV21
#define ITEM_ANTI_CITIZEN       BV22
#define ITEM_ANTI_SITH          BV23
#define ITEM_ANTI_PILOT         BV24
#define ITEM_HIDDEN             BV25
#define ITEM_POISONED           BV26
#define ITEM_COVERING           BV27
#define ITEM_DEATHROT           BV28
#define ITEM_BURRIED            BV29    /* item is underground */
#define ITEM_PROTOTYPE          BV30
#define ITEM_HUMAN_SIZE         BV31

/* Magic flags - extra extra_flags for objects that are used in spells */
#define ITEM_RETURNING          BV00
#define ITEM_BACKSTABBER        BV01
#define ITEM_BANE               BV02
#define ITEM_LOYAL              BV03
#define ITEM_HASTE              BV04
#define ITEM_DRAIN              BV05
#define ITEM_LIGHTNING_BLADE    BV06

/* Blaster settings - only saves on characters */
#define BLASTER_NORMAL          0
#define BLASTER_HALF            2
#define BLASTER_FULL            5
#define BLASTER_LOW             1
#define BLASTER_STUN            3
#define BLASTER_HIGH            4

/* Weapon Types */

#define WEAPON_NONE             0
#define WEAPON_VIBRO_AXE        1
#define WEAPON_VIBRO_BLADE      2
#define WEAPON_LIGHTSABER       3
#define WEAPON_WHIP             4
#define WEAPON_CLAW             5
#define WEAPON_BLASTER          6
#define WEAPON_BLUDGEON         8
#define WEAPON_BOWCASTER        9
#define WEAPON_FORCE_PIKE       11

/* Furniture Types - Darrik Vequir 10/23/00 */

#define STAND_AT                1
#define STAND_ON                2
#define STAND_IN                3
#define SIT_AT                  1
#define SIT_ON                  2
#define SIT_IN                  3
#define REST_AT                 1
#define REST_ON                 2
#define REST_IN                 3
#define SLEEP_AT                1
#define SLEEP_ON                2
#define SLEEP_IN                3
#define PUT_AT                  1
#define PUT_ON                  2
#define PUT_IN                  3
#define PUT_INSIDE              4

/* Lever/dial/switch/button/pullchain flags */
#define TRIG_UP                 BV00
#define TRIG_UNLOCK             BV01
#define TRIG_LOCK               BV02
#define TRIG_D_NORTH            BV03
#define TRIG_D_SOUTH            BV04
#define TRIG_D_EAST             BV05
#define TRIG_D_WEST             BV06
#define TRIG_D_UP               BV07
#define TRIG_D_DOWN             BV08
#define TRIG_DOOR               BV09
#define TRIG_CONTAINER          BV10
#define TRIG_OPEN               BV11
#define TRIG_CLOSE              BV12
#define TRIG_PASSAGE            BV13
#define TRIG_OLOAD              BV14
#define TRIG_MLOAD              BV15
#define TRIG_TELEPORT           BV16
#define TRIG_TELEPORTALL        BV17
#define TRIG_TELEPORTPLUS       BV18
#define TRIG_DEATH              BV19
#define TRIG_CAST               BV20
#define TRIG_FAKEBLADE          BV21
#define TRIG_RAND4              BV22
#define TRIG_RAND6              BV23
#define TRIG_TRAPDOOR           BV24
#define TRIG_ANOTHEROOM         BV25
#define TRIG_USEDIAL            BV26
#define TRIG_ABSOLUTEVNUM       BV27
#define TRIG_SHOWROOMDESC       BV28
#define TRIG_AUTORETURN         BV29

#define TELE_SHOWDESC           BV00
#define TELE_TRANSALL           BV01
#define TELE_TRANSALLPLUS       BV02

/* drug types */
#define SPICE_GLITTERSTIM        0
#define SPICE_CARSANUM           1
#define SPICE_RYLL               2
#define SPICE_ANDRIS             3
#define SPICE_LUMNI              4

/* crystal types */
#define GEM_NON_ADEGEN          0
#define GEM_KATHRACITE          1
#define GEM_RELACITE            2
#define GEM_DANITE              3
#define GEM_MEPHITE             4
#define GEM_PONITE              5
#define GEM_ILLUM               6
#define GEM_CORUSCA             7

/*
 * Wear flags.
 * Used in #OBJECTS.
 */
#define ITEM_TAKE               BV00
#define ITEM_WEAR_FINGER        BV01
#define ITEM_WEAR_NECK          BV02
#define ITEM_WEAR_BODY          BV03
#define ITEM_WEAR_HEAD          BV04
#define ITEM_WEAR_LEGS          BV05
#define ITEM_WEAR_FEET          BV06
#define ITEM_WEAR_HANDS         BV07
#define ITEM_WEAR_ARMS          BV08
#define ITEM_WEAR_SHIELD        BV09
#define ITEM_WEAR_ABOUT         BV10
#define ITEM_WEAR_WAIST         BV11
#define ITEM_WEAR_WRIST         BV12
#define ITEM_WIELD              BV13
#define ITEM_HOLD               BV14
#define ITEM_DUAL_WIELD         BV15
#define ITEM_WEAR_EARS          BV16
#define ITEM_WEAR_EYES          BV17
#define ITEM_MISSILE_WIELD      BV18
#define ITEM_WEAR_FLOATING      BV19
#define ITEM_WEAR_OVER          BV20
#define ITEM_WEAR_DISGUISE      BV21

/*
 * Apply types (for affects).
 * Used in #OBJECTS.
 */
typedef enum
  {
    APPLY_NONE, APPLY_STR, APPLY_DEX, APPLY_INT, APPLY_WIS, APPLY_CON,
    APPLY_SEX, APPLY_NULL , APPLY_LEVEL, APPLY_AGE, APPLY_HEIGHT, APPLY_WEIGHT,
    APPLY_MANA, APPLY_HIT, APPLY_MOVE, APPLY_GOLD, APPLY_EXP, APPLY_AC,
    APPLY_HITROLL, APPLY_DAMROLL, APPLY_SAVING_POISON, APPLY_SAVING_ROD,
    APPLY_SAVING_PARA, APPLY_SAVING_BREATH, APPLY_SAVING_SPELL, APPLY_CHA,
    APPLY_AFFECT, APPLY_RESISTANT, APPLY_IMMUNE, APPLY_SUSCEPTIBLE,
    APPLY_WEAPONSPELL, APPLY_LCK, APPLY_BACKSTAB, APPLY_PICK, APPLY_TRACK,
    APPLY_STEAL, APPLY_SNEAK, APPLY_HIDE, APPLY_PALM, APPLY_DETRAP, APPLY_DODGE,
    APPLY_PEEK, APPLY_SCAN, APPLY_GOUGE, APPLY_SEARCH, APPLY_MOUNT, APPLY_DISARM,
    APPLY_KICK, APPLY_PARRY, APPLY_BASH, APPLY_STUN, APPLY_PUNCH, APPLY_CLIMB,
    APPLY_GRIP, APPLY_SCRIBE, APPLY_BREW, APPLY_WEARSPELL, APPLY_REMOVESPELL,
    APPLY_EMOTION, APPLY_MENTALSTATE, APPLY_STRIPSN, APPLY_REMOVE, APPLY_DIG,
    APPLY_FULL, APPLY_THIRST, APPLY_DRUNK, APPLY_BLOOD, APPLY_SNIPE, MAX_APPLY_TYPE
  } apply_types;

#define REVERSE_APPLY              1000

/*
 * Values for containers (value[1]).
 * Used in #OBJECTS.
 */
#define CONT_CLOSEABLE                1
#define CONT_PICKPROOF                2
#define CONT_CLOSED                   4
#define CONT_LOCKED                   8

/*
 * Well known room virtual numbers.
 * Defined in #ROOMS.
 */
#define ROOM_VNUM_LIMBO               2
#define ROOM_VNUM_POLY                3
#define ROOM_VNUM_HELL                6
#define ROOM_VNUM_CHAT            32144
#define ROOM_VNUM_TEMPLE          32144
#define ROOM_VNUM_ALTAR           32144
#define ROOM_VNUM_SCHOOL          10300
#define ROOM_AUTH_START           10300
#define ROOM_START_HUMAN            211
#define ROOM_START_WOOKIEE        28600
#define ROOM_START_TWILEK         32148
#define ROOM_START_RODIAN         32148
#define ROOM_START_HUTT           32148
#define ROOM_START_MON_CALAMARIAN 21069
#define ROOM_START_NOGHRI          1015
#define ROOM_START_GAMORREAN      28100
#define ROOM_START_JAWA           31819
#define ROOM_START_ADARIAN        29000
#define ROOM_START_EWOK           32148
#define ROOM_START_VERPINE        32148
#define ROOM_START_DEFEL          32148
#define ROOM_START_TRANDOSHAN     32148
#define ROOM_START_CHADRA_FAN     32148
#define ROOM_START_SULLUSTAN      32148
#define ROOM_START_QUARREN        21069
#define ROOM_START_IMMORTAL         100
#define ROOM_LIMBO_SHIPYARD          45
#define ROOM_DEFAULT_CRASH        28025

#define ROOM_PLUOGUS_QUIT         32148

#if 0
#define ROOM_SHUTTLE_BUS           32140  /*PLUOGUS*/
#define ROOM_SHUTTLE_BUS_2         32410  /*TOCCA*/
#define ROOM_SHUTTLE_BUS_3         32425  /*Cassia*/
#define ROOM_SHUTTLE_BUS_4         32435  /*Siego*/

#define ROOM_CORUSCANT_SHUTTLE     199
#define ROOM_SENATE_SHUTTLE      10197
#define ROOM_CORUSCANT_TURBOCAR    226
#endif

/*
 * Room flags.
 * Used in #ROOMS.
 */

#define ROOM_DARK               BV00
/* BV01 now reserved for track  BV01  and hunt */
#define ROOM_NO_MOB             BV02
#define ROOM_INDOORS            BV03
#define ROOM_CAN_LAND           BV04
#define ROOM_CAN_FLY            BV05
#define ROOM_NO_DRIVING         BV06
#define ROOM_NO_MAGIC           BV07
#define ROOM_BANK               BV08
#define ROOM_PRIVATE            BV09
#define ROOM_SAFE               BV10
#define ROOM_SOLITARY           BV11
#define ROOM_PET_SHOP           BV12
#define ROOM_ARENA              BV13
#define ROOM_DONATION           BV14
#define ROOM_NODROPALL          BV15
#define ROOM_SILENCE            BV16
#define ROOM_LOGSPEECH          BV17
#define ROOM_NODROP             BV18
#define ROOM_CLANSTOREROOM      BV19
#define ROOM_PLR_HOME           BV20
#define ROOM_EMPTY_HOME         BV21
#define ROOM_TELEPORT           BV22
#define ROOM_HOTEL              BV23
#define ROOM_NOFLOOR            BV24
#define ROOM_REFINERY           BV25
#define ROOM_FACTORY            BV26
#define ROOM_RECRUIT          BV27
#define ROOM_PLR_SHOP           BV28
#define ROOM_SPACECRAFT         BV29
#define ROOM_PROTOTYPE          BV30
#define ROOM_AUCTION            BV31

/*
 * Directions.
 * Used in #ROOMS.
 */
typedef enum
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
    DIR_SOMEWHERE  /* 10 */
  } dir_types;

#define MAX_DIR                 DIR_SOUTHWEST   /* max for normal walking */
#define DIR_PORTAL              DIR_SOMEWHERE   /* portal direction       */

/*
 * Exit flags.
 * Used in #ROOMS.
 */
#define EX_ISDOOR                 BV00
#define EX_CLOSED                 BV01
#define EX_LOCKED                 BV02
#define EX_SECRET                 BV03
#define EX_SWIM                   BV04
#define EX_PICKPROOF              BV05
#define EX_FLY                    BV06
#define EX_CLIMB                  BV07
#define EX_DIG                    BV08
#define EX_RES1                   BV09  /* are these res[1-4] important? */
#define EX_NOPASSDOOR             BV10
#define EX_HIDDEN                 BV11
#define EX_PASSAGE                BV12
#define EX_PORTAL                 BV13
#define EX_RES2                   BV14
#define EX_RES3                   BV15
#define EX_xCLIMB                 BV16
#define EX_xENTER                 BV17
#define EX_xLEAVE                 BV18
#define EX_xAUTO                  BV19
#define EX_RES4                   BV20
#define EX_xSEARCHABLE            BV21
#define EX_BASHED                 BV22
#define EX_BASHPROOF              BV23
#define EX_NOMOB                  BV24
#define EX_WINDOW                 BV25
#define EX_xLOOK                  BV26
#define MAX_EXFLAG                26

/*
 * Sector types.
 * Used in #ROOMS.
 */
typedef enum
  {
    SECT_INSIDE,
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
  } sector_types;

/*
 * Equpiment wear locations.
 * Used in #RESETS.
 */
typedef enum
  {
    WEAR_NONE = -1, WEAR_LIGHT = 0, WEAR_FINGER_L, WEAR_FINGER_R, WEAR_NECK_1,
    WEAR_NECK_2, WEAR_BODY, WEAR_HEAD, WEAR_LEGS, WEAR_FEET, WEAR_HANDS,
    WEAR_ARMS, WEAR_SHIELD, WEAR_ABOUT, WEAR_WAIST, WEAR_WRIST_L, WEAR_WRIST_R,
    WEAR_WIELD, WEAR_HOLD, WEAR_DUAL_WIELD, WEAR_EARS, WEAR_EYES,
    WEAR_MISSILE_WIELD, WEAR_FLOATING, WEAR_OVER, WEAR_DISGUISE, MAX_WEAR
  } wear_locations;

/* Board Types */
typedef enum { BOARD_NOTE, BOARD_MAIL } board_types;

/***************************************************************************
 *                                                                         *
 *                   VALUES OF INTEREST TO AREA BUILDERS                   *
 *                   (End of this section ... stop here)                   *
 *                                                                         *
 ***************************************************************************/

/*
 * Conditions.
 */
typedef enum
  {
    COND_DRUNK, COND_FULL, COND_THIRST, COND_BLOODTHIRST, MAX_CONDS
  } conditions;

/*
 * Positions.
 */
typedef enum
  {
    POS_DEAD, POS_MORTAL, POS_INCAP, POS_STUNNED, POS_SLEEPING, POS_RESTING,
    POS_SITTING, POS_FIGHTING, POS_STANDING, POS_MOUNTED, POS_SHOVE, POS_DRAG
  } positions;

/*
 * ACT bits for players.
 */
#define PLR_is_npc                    BV00      /* Don't EVER set.      */
#define PLR_BOUGHT_PET                BV01
#define PLR_SHOVEDRAG                 BV02
#define PLR_AUTOEXIT                  BV03
#define PLR_AUTOLOOT                  BV04
#define PLR_AUTOSAC                   BV05
#define PLR_BLANK                     BV06
#define PLR_QUESTOR                   BV07
#define PLR_BRIEF                     BV08
#define PLR_COMBINE                   BV09
#define PLR_PROMPT                    BV10
#define PLR_TELNET_GA                 BV11

#define PLR_HOLYLIGHT              BV12
#define PLR_WIZINVIS               BV13
#define PLR_ROOMVNUM               BV14

#define PLR_SILENCE                BV15
#define PLR_NO_EMOTE               BV16
#define PLR_DONTAUTOFUEL           BV17
#define PLR_NO_TELL                BV18
#define PLR_LOG                    BV19
#define PLR_DENY                   BV20
#define PLR_FREEZE                 BV21
#define PLR_KILLER                 BV22
#define PLR_HOME_RESIDENT          BV23
#define PLR_LITTERBUG              BV24
#define PLR_ANSI                   BV25
#define PLR_SOUND                  BV26
#define PLR_NICE                   BV27
#define PLR_FLEE                   BV28
#define PLR_AUTOGOLD               BV29
#define PLR_AUTOMAP                BV30
#define PLR_AFK                    BV31

/* Bits for pc_data->flags. */
#define PCFLAG_R1                  BV00
#define PCFLAG_UNAUTHED            BV02
#define PCFLAG_NORECALL            BV03
#define PCFLAG_NOINTRO             BV04
#define PCFLAG_GAG                 BV05
#define PCFLAG_RETIRED             BV06
#define PCFLAG_GUEST               BV07
#define PCFLAG_NOSUMMON            BV08
#define PCFLAG_PAGERON             BV09
#define PCFLAG_NOTITLE             BV10
#define PCFLAG_ROOM                BV11
#define PCFLAG_DND                 BV12

typedef enum
  {
    TIMER_NONE, TIMER_RECENTFIGHT, TIMER_SHOVEDRAG, TIMER_DO_FUN,
    TIMER_APPLIED, TIMER_PKILLED
  } timer_types;

/*
 * Channel bits.
 */
#define CHANNEL_AUCTION            BV00
#define CHANNEL_CHAT               BV01
#define CHANNEL_QUEST              BV02
#define CHANNEL_IMMTALK            BV03
#define CHANNEL_MUSIC              BV04
#define CHANNEL_ASK                BV05
#define CHANNEL_SHOUT              BV06
#define CHANNEL_YELL               BV07
#define CHANNEL_MONITOR            BV08
#define CHANNEL_LOG                BV09
#define CHANNEL_104                BV10
#define CHANNEL_CLAN               BV11
#define CHANNEL_BUILD              BV12
#define CHANNEL_105                BV13
#define CHANNEL_AVTALK             BV14
#define CHANNEL_PRAY               BV15
#define CHANNEL_COUNCIL            BV16
#define CHANNEL_GUILD              BV17
#define CHANNEL_COMM               BV18
#define CHANNEL_TELLS              BV19
#define CHANNEL_ORDER              BV20
#define CHANNEL_NEWBIE             BV21
#define CHANNEL_WARTALK            BV22
#define CHANNEL_OOC                BV23
#define CHANNEL_SHIP               BV24
#define CHANNEL_SYSTEM             BV25
#define CHANNEL_SPACE              BV26
#define CHANNEL_103                BV27
#define CHANNEL_ARENA               BV28
#define CHANNEL_ALLCLAN            BV29

#define CHANNEL_CLANTALK           CHANNEL_CLAN

/* Area defines - Scryn 8/11
 *
 */
#define AREA_DELETED               BV00
#define AREA_LOADED                BV01

/* Area flags - Narn Mar/96 */
#define AFLAG_NOPKILL               BV00
#define AFLAG_NOQUEST               BV01
#define AFLAG_CHANGED               BV02

/*
 * Liquids.
 */
#define LIQ_WATER        0
#define LIQ_MAX         39

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

#define BIT_RESET_DOOR                  0
#define BIT_RESET_OBJECT                1
#define BIT_RESET_MOBILE                2
#define BIT_RESET_ROOM                  3
#define BIT_RESET_TYPE_MASK             0xFF    /* 256 should be enough */
#define BIT_RESET_DOOR_THRESHOLD        8
#define BIT_RESET_DOOR_MASK             0xFF00  /* 256 should be enough */
#define BIT_RESET_SET                   BV30
#define BIT_RESET_TOGGLE                BV31
#define BIT_RESET_FREEBITS        0x3FFF0000    /* For reference */

/*
 * Types of skill numbers.  Used to keep separate lists of sn's
 * Must be non-overlapping with spell/skill types,
 * but may be arbitrary beyond that.
 */
#define TYPE_UNDEFINED               -1
#define TYPE_HIT                     1000  /* allows for 1000 skills/spells */
#define TYPE_HERB                    2000  /* allows for 1000 attack types  */
#define TYPE_PERSONAL                3000  /* allows for 1000 herb types    */

/*
 *  Target types.
 */
typedef enum
  {
    TAR_IGNORE, TAR_CHAR_OFFENSIVE, TAR_CHAR_DEFENSIVE, TAR_CHAR_SELF,
    TAR_OBJ_INV
  } target_types;

typedef enum
  {
    SKILL_UNKNOWN, SKILL_SPELL, SKILL_SKILL, SKILL_WEAPON, SKILL_TONGUE,
    SKILL_HERB
  } skill_types;

/*
 * Place any skill types you don't want them to be able to practice
 * normally in this list.  Separate each with a space.
 * (Uses an is_name check). -- Altrag
 */
#define CANT_PRAC "Tongue"

/*
 * Data files used by the server.
 *
 * AREA_LIST contains a list of areas to boot.
 * All files are read in completely at bootup.
 * Most output files (bug, idea, typo, shutdown) are append-only.
 */
#define PLAYER_DIR      "../player/"    /* Player files                 */
#define BACKUP_DIR      "../backup/"    /* Backup Player files          */
#define GOD_DIR         "../gods/"      /* God Info Dir                 */
#define BOARD_DIR       "../boards/"    /* Board data dir               */
#define CLAN_DIR        "../clans/"     /* Clan data dir                */
#define SHIP_DIR        "../ships/"
#define SPACE_DIR       "../space/"
#define PLANET_DIR      "../planets/"
#define GUARD_DIR       "../planets/"
#define BUILD_DIR       "../building/"  /* Online building save dir     */
#define SYSTEM_DIR      "../system/"    /* Main system files            */
#define VENDOR_DIR      "../vendor/"
#define STOREROOM_DIR   "../storeroom/"
#define PROG_DIR        "mudprogs/"     /* MUDProg files                */
#define CORPSE_DIR      "../corpses/"   /* Corpses                      */
#define AREA_LIST       "area.lst"      /* List of areas                */
#define BAN_LIST        "ban.lst"       /* List of bans                 */
#define CLAN_LIST       "clan.lst"      /* List of clans                */
#define SHIP_LIST       "ship.lst"
#define PLANET_LIST      "planet.lst"
#define SPACE_LIST      "space.lst"
#define BOUNTY_LIST     "bounty.lst"
#define DISINTEGRATION_LIST     "disintegration.lst"
#define GOD_LIST        "gods.lst"      /* List of gods                 */
#define GUARD_LIST      "guard.lst"

#define BOARD_FILE      "boards.txt"            /* For bulletin boards   */
#define SHUTDOWN_FILE   "shutdown.txt"          /* For 'shutdown'        */

#define BAD_NAME_FILE   SYSTEM_DIR "badnames.lst"
#define COPYOVER_FILE   SYSTEM_DIR "copyover.dat"
#define TEMP_FILE       SYSTEM_DIR "charsave.tmp"
#define BOOTLOG_FILE    SYSTEM_DIR "boot.txt"     /* Boot up error file  */
#define BUG_FILE        SYSTEM_DIR "bugs.txt"     /* For 'bug' and bug( )*/
#define IDEA_FILE       SYSTEM_DIR "ideas.txt"    /* For 'idea'          */
#define TYPO_FILE       SYSTEM_DIR "typos.txt"    /* For 'typo'          */
#define LOG_FILE        SYSTEM_DIR "log.txt"      /* For talking in logged rooms */
#define WIZLIST_FILE    SYSTEM_DIR "WIZLIST"      /* Wizlist             */
#define WHO_FILE        SYSTEM_DIR "WHO"          /* Who output file     */
#define WEBWHO_FILE     SYSTEM_DIR "WEBWHO"       /* WWW Who output file */
#define SKILL_FILE      SYSTEM_DIR "skills.dat"   /* Skill table         */
#define HERB_FILE       SYSTEM_DIR "herbs.dat"    /* Herb table          */
#define SOCIAL_FILE     SYSTEM_DIR "socials.dat"  /* Socials             */
#define COMMAND_FILE    SYSTEM_DIR "commands.dat" /* Commands            */
#define USAGE_FILE      SYSTEM_DIR "usage.txt"    /* How many people are on
                                                     every half hour - trying to
                                                     determine best reboot time */

#define ERROR_PROG        -1
#define IN_FILE_PROG       0
#define ACT_PROG           BV00
#define SPEECH_PROG        BV01
#define RAND_PROG          BV02
#define FIGHT_PROG         BV03
#define RFIGHT_PROG        BV03
#define DEATH_PROG         BV04
#define RDEATH_PROG        BV04
#define HITPRCNT_PROG      BV05
#define ENTRY_PROG         BV06
#define ENTER_PROG         BV06
#define GREET_PROG         BV07
#define RGREET_PROG        BV07
#define OGREET_PROG        BV07
#define ALL_GREET_PROG     BV08
#define GIVE_PROG          BV09
#define BRIBE_PROG         BV10
#define HOUR_PROG          BV11
#define TIME_PROG          BV12
#define WEAR_PROG          BV13
#define REMOVE_PROG        BV14
#define SAC_PROG           BV15
#define LOOK_PROG          BV16
#define EXA_PROG           BV17
#define ZAP_PROG           BV18
#define GET_PROG           BV19
#define DROP_PROG          BV20
#define DAMAGE_PROG        BV21
#define REPAIR_PROG        BV22
#define RANDIW_PROG        BV23
#define SPEECHIW_PROG      BV24
#define PULL_PROG          BV25
#define PUSH_PROG          BV26
#define SLEEP_PROG         BV27
#define REST_PROG          BV28
#define LEAVE_PROG         BV29
#define SCRIPT_PROG        BV30
#define USE_PROG           BV31

#endif
