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

using ch_ret = int;
using obj_ret = int;

class Affect;
class Alias;
class Area;
class Auction;
class Ban;
class Race;
class Character;
class HuntHateFear;
class Fight;
class Descriptor;
class Exit;
class ExtraDescription;
class HelpFile;
class ProtoMobile;
class Note;
class Board;
class Object;
class ProtoObject;
class PCData;
class Reset;
class Room;
class Shop;
class RepairShop;
class TimeInfo;
class HourMinSec;
class Weather;
class Bounty;
class Planet;
class Spaceobject;
class Ship;
class Turret;
class Missile;
class Tourney;
class mob_prog_data;
class mob_prog_act_list;
class Editor;
class TeleportData;
class Timer;
class SystemData;
class SmaugAffect;
class WhoData;
class Skill;
class Social;
class Command;
class KilledData;
class ClanMember;
class ClanMemberList;
class Shuttle;
class ShuttleStop;
class CraftingSession;
class Clan;
class BadName;
class timerset;
class MPROG_ACT_LIST;
class MPROG_DATA;
class MProg;
class Stats;
class SaveVs;
class Home;
struct Vo;
class MudProgMacroCode;

/*
 * Function types.
 */
using CmdFun = void(std::shared_ptr<Character> ch, std::string argument);
using SpecFun = bool(std::shared_ptr<Character> ch);
using SpellFun = ch_ret(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo);

using vnum_t = long;

using ShipType = int;
using ShipState = int;
using MissileState = int;
using ShipClass = int;
using MissileType = int;
using SpaceobjectType = int;
using SexType = int;
using ItemTypes = int;
using DirectionType = int;
using SectorType = int;
using WearLocation = int;
using PositionType = int;
using SkillTargetType = int;
using SkillType = int;
using SexType = int;

#define DECLARE_CMD_FUN( fun )    extern "C" { CmdFun    fun; } CmdFun fun##_mangled
#define DECLARE_SPEC_FUN( fun )  extern "C" { SpecFun  fun; } SpecFun fun##_mangled
#define DECLARE_SPELL_FUN( fun ) extern "C" { SpellFun fun; } SpellFun fun##_mangled

#endif
