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

#ifndef _SWRIP_TYPES_HPP_
#define _SWRIP_TYPES_HPP_

#include <utility/utility.hpp>

typedef int ch_ret;
typedef int obj_ret;

struct Affect;
struct Alias;
struct Area;
struct Auction;
struct Ban;
struct Race;
struct ExtractedCharacter;
class Character;
struct HuntHateFear;
struct Fight;
class Descriptor;
struct Exit;
struct ExtraDescription;
struct HelpFile;
struct ProtoMobile;
struct Note;
class Board;
struct Object;
struct ProtoObject;
class PCData;
struct Reset;
struct Room;
struct Shop;
struct RepairShop;
struct TimeInfo;
struct HourMinSec;
struct Weather;
struct Bounty;
struct Planet;
struct Storeroom;
struct Spaceobject;
class Ship;
class Turret;
struct Missile;
struct Tourney;
struct mob_prog_data;
struct mob_prog_act_list;
struct Editor;
struct TeleportData;
struct Timer;
struct SystemData;
struct SmaugAffect;
struct WhoData;
struct Skill;
struct Social;
struct Command;
struct KilledData;
struct Wizard;
struct ClanMember;
struct ClanMemberList;
struct Shuttle;
struct ShuttleStop;
struct CraftingSession;
class Clan;
struct BadName;
struct timerset;
struct MPROG_ACT_LIST;

/*
 * Function types.
 */
typedef void CmdFun( Character *ch, char *argument );
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
