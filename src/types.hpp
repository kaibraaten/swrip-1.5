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

#include <string>
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

struct Race;
typedef struct Race Race;

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
typedef struct HelpFile                HelpFile;

struct ProtoMobile;
typedef struct ProtoMobile             ProtoMobile;

struct Note;
typedef struct Note                    Note;

struct Board;
typedef struct Board                   Board;

struct Object;
typedef struct Object                  Object;

struct ProtoObject;
typedef struct ProtoObject             ProtoObject;

struct PCData;
typedef struct PCData                  PCData;

struct Reset;
typedef struct Reset                   Reset;

struct Room;
typedef struct Room                    Room;

struct Shop;
typedef struct Shop               Shop;

struct RepairShop;
typedef struct RepairShop         RepairShop;

struct TimeInfo;
typedef struct TimeInfo          TimeInfo;

struct HourMinSec;
typedef struct HourMinSec            HourMinSec;

struct Weather;
typedef struct Weather            Weather;

struct Bounty;
typedef struct Bounty                  Bounty;

struct Planet;
typedef struct Planet                  Planet;

struct Storeroom;
typedef struct Storeroom               Storeroom;

struct Spaceobject;
typedef struct Spaceobject             Spaceobject;

struct Ship;
typedef struct Ship                    Ship;

struct Turret;
typedef struct Turret                  Turret;

struct Missile;
typedef struct Missile                 Missile;

struct Tourney;
typedef struct Tourney            Tourney;

struct mob_prog_data;
typedef struct mob_prog_data           MPROG_DATA;

struct mob_prog_act_list;
typedef struct mob_prog_act_list       MPROG_ACT_LIST;

struct Editor;
typedef struct Editor                  Editor;

struct TeleportData;
typedef struct TeleportData            TeleportData;

struct Timer;
typedef struct Timer                   Timer;

struct SystemData;
typedef struct SystemData              SystemData;

struct SmaugAffect;
typedef struct SmaugAffect             SmaugAffect;

struct WhoData;
typedef struct WhoData                WhoData;

struct Skill;
typedef struct Skill                   Skill;

struct Social;
typedef struct Social                  Social;

struct Command;
typedef struct Command                 Command;

struct KilledData;
typedef struct KilledData              KilledData;

struct Wizard;
typedef struct Wizard                  Wizard;

struct ClanMember;
typedef struct ClanMember             ClanMember; /* Individual member data */

struct ClanMemberList;
typedef struct ClanMemberList             ClanMemberList; /* List of members in clan */

struct SortedClanMemberListEntry;
typedef struct SortedClanMemberListEntry         SortedClanMemberListEntry;     /* List for sorted roster list */

struct Shuttle;
typedef struct Shuttle Shuttle;

struct ShuttleStop;
typedef struct ShuttleStop ShuttleStop;

struct CraftingSession;
typedef struct CraftingSession CraftingSession;

struct Clan;
typedef struct Clan Clan;

struct BadName;
typedef struct BadName BadName;

struct timerset;

/*
 * Function types.
 */
typedef void CmdFun( Character *ch, std::string argument );
typedef bool SpecFun( Character *ch );
typedef ch_ret SpellFun( int sn, int level, Character *ch, void *vo );

typedef long vnum_t;
typedef int LogType;
typedef int ReturnType;
typedef int SunPosition;
typedef int SkyCondition;
typedef int ConnectionType;
typedef int CharacterSubState;
typedef int ClanType;
typedef int ShipType;
typedef int ShipState;
typedef int MissileState;
typedef int ShipClass;
typedef int MissileType;
typedef int SpaceobjectType;
typedef int SexType;
typedef int TrapType;
typedef int ItemTypes;
typedef int ApplyType;
typedef int DirectionType;
typedef int SectorType;
typedef int WearLocation;
typedef int BoardType;
typedef int PositionType;
typedef int SkillTargetType;
typedef int SkillType;

#define DECLARE_CMD_FUN( fun )    extern "C" { CmdFun    fun; } CmdFun fun##_mangled
#define DECLARE_SPEC_FUN( fun )  extern "C" { SpecFun  fun; } SpecFun fun##_mangled
#define DECLARE_SPELL_FUN( fun ) extern "C" { SpellFun fun; } SpellFun fun##_mangled

#endif
