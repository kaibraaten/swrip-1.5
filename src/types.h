/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _SWRIP_TYPES_H_
#define _SWRIP_TYPES_H_

#include <utility/utility.h>

typedef int ch_ret;
typedef int obj_ret;

struct Affect;
typedef struct Affect             Affect;

struct Area;
typedef struct Area               Area;

struct Auction;
typedef struct Auction            Auction;

struct Ban;
typedef struct Ban                Ban;

struct ExtractedCharacter;
typedef struct ExtractedCharacter     ExtractedCharacter;

struct Character;
typedef struct Character               Character;

struct HuntHateFear;
typedef struct HuntHateFear          HuntHateFear;

struct Fight;
typedef struct Fight           Fight;

struct Descriptor;
typedef struct Descriptor         Descriptor;

struct Exit;
typedef struct Exit               Exit;

struct ExtraDescription;
typedef struct ExtraDescription        ExtraDescription;

struct HelpFile;
typedef struct HelpFile               HelpFile;

struct ProtoMobile;
typedef struct ProtoMobile          ProtoMobile;

struct note_data;
typedef struct note_data               NOTE_DATA;

struct comment_data;
typedef struct comment_data            COMMENT_DATA;

struct board_data;
typedef struct board_data              BOARD_DATA;

struct obj_data;
typedef struct obj_data                OBJ_DATA;

struct obj_index_data;
typedef struct obj_index_data          OBJ_INDEX_DATA;

struct pc_data;
typedef struct pc_data                 PC_DATA;

struct Reset;
typedef struct Reset                   Reset;

struct Room;
typedef struct Room                    Room;

struct shop_data;
typedef struct shop_data               SHOP_DATA;

struct repairshop_data;
typedef struct repairshop_data         REPAIR_DATA;

struct time_info_data;
typedef struct time_info_data          TIME_INFO_DATA;

struct hour_min_sec;
typedef struct hour_min_sec            HOUR_MIN_SEC;

struct weather_data;
typedef struct weather_data            WEATHER_DATA;

struct Bounty;
typedef struct Bounty                  Bounty;

struct planet_data;
typedef struct planet_data             PLANET_DATA;

struct Storeroom;
typedef struct Storeroom               Storeroom;

struct guard_data;
typedef struct guard_data              GUARD_DATA;

struct Spaceobject;
typedef struct Spaceobject             Spaceobject;

struct clan_data;
typedef struct clan_data               CLAN_DATA;

struct Ship;
typedef struct Ship                    Ship;

struct Turret;
typedef struct Turret                  Turret;

struct Missile;
typedef struct Missile                 Missile;

struct tourney_data;
typedef struct tourney_data            TOURNEY_DATA;

struct mob_prog_data;
typedef struct mob_prog_data           MPROG_DATA;

struct mob_prog_act_list;
typedef struct mob_prog_act_list       MPROG_ACT_LIST;

struct Editor;
typedef struct Editor                  Editor;

struct teleport_data;
typedef struct teleport_data           TELEPORT_DATA;

struct timer_data;
typedef struct timer_data              TIMER;

struct godlist_data;
typedef struct godlist_data            GOD_DATA;

struct system_data;
typedef struct system_data             SYSTEM_DATA;

struct smaug_affect;
typedef struct smaug_affect            SMAUG_AFF;

struct who_data;
typedef struct who_data                WHO_DATA;

struct skill_type;
typedef struct skill_type              SKILLTYPE;

struct social_type;
typedef struct social_type             SOCIALTYPE;

struct cmd_type;
typedef struct cmd_type                CMDTYPE;

struct killed_data;
typedef struct killed_data             KILLED_DATA;

struct wizent;
typedef struct wizent                  WIZENT;

struct member_data;
typedef struct member_data             MEMBER_DATA; /* Individual member data */

struct member_list;
typedef struct member_list             MEMBER_LIST; /* List of members in clan */

struct membersort_data;
typedef struct membersort_data         MS_DATA;     /* List for sorted roster list */

struct Shuttle;
typedef struct Shuttle Shuttle;

struct ShuttleStop;
typedef struct ShuttleStop ShuttleStop;

struct CraftingSession;
typedef struct CraftingSession CraftingSession;

/*
 * Function types.
 */
typedef void DO_FUN( Character *ch, char *argument );
typedef bool SPEC_FUN( Character *ch );
typedef ch_ret SPELL_FUN( int sn, int level, Character *ch, void *vo );

typedef long vnum_t;

#ifdef __cplusplus
#define DECLARE_DO_FUN( fun )    extern "C" { DO_FUN    fun; } DO_FUN fun##_mangled
#define DECLARE_SPEC_FUN( fun )  extern "C" { SPEC_FUN  fun; } SPEC_FUN fun##_mangled
#define DECLARE_SPELL_FUN( fun ) extern "C" { SPELL_FUN fun; } SPELL_FUN fun##_mangled
#else
#define DECLARE_DO_FUN( fun )           DO_FUN    fun
#define DECLARE_SPEC_FUN( fun )         SPEC_FUN  fun
#define DECLARE_SPELL_FUN( fun )        SPELL_FUN fun
#endif

#endif
