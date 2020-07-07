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

#include <memory>
#include <array>
#include <list>
#include <string>
#include <unordered_map>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <climits>
#include <bitset>
#include <utility/utility.hpp>

#ifdef HAVE_ZLIB
#include <zlib.h>
#endif

#include <cmath>

#include "types.hpp"
#include "constants.hpp"
#include "vo.hpp"

class TimeInfo
{
public:
    int Hour = 0;
    int Day = 0;
    int Month = 0;
    int Year = 0;
};

class HourMinSec
{
public:
    int Hour = 0;
    int Minute = 0;
    int Second = 0;
    int Manual = 0;
};

class Weather
{
public:
    int Mmhg = 0;
    int Change = 0;
    int Sky = 0;
    int Sunlight = 0;
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

class IntelligenceBonusType
{
public:
    short Learn = 0;
};

class WisdomBonusType
{
public:
    short Practice = 0;
};

class DexterityBonusType
{
public:
    short Defensive = 0;
};

class ConstitutionBonusType
{
public:
    short HitPoint = 0;
    short Shock = 0;
};

class CharismaBonusType
{
public:
    short Charm = 0;
};

class LuckBonusType
{
public:
    short Luck = 0;
};

class ForceBonusType
{
public:
    short Force = 0;
};

extern bool mud_down;
extern bool fBootDb;

/*
 * An affect.
 */
class Affect
{
public:
    int Type = 0;
    int Duration = 0;
    int Location = 0;
    int Modifier = 0;
    std::bitset<Flag::MAX> AffectedBy;
};

/*
 * A SMAUG spell
 */
class SmaugAffect
{
public:
    std::string Duration;
    int Location = 0;
    std::string Modifier;
    std::bitset<Flag::MAX> AffectedBy;
};

class Timer
{
public:
    CmdFun *DoFun = nullptr;
    int     Value = 0;
    short   Type = 0;
    short   Count = 0;
};

class HuntHateFear
{
public:
    std::string Name;
    std::shared_ptr<Character> Who;
};

class KilledData
{
public:
    vnum_t Vnum = INVALID_VNUM;
    char  Count = 0;
};

/*
 * Liquids.
 */
class LiquidType
{
public:
    const char *Name;
    const char *Color;
    std::array<short, 3> Affect;
};

/*
 * Extra description data for a room or object.
 */
class ExtraDescription
{
public:
    std::string Keyword;
    std::string Description;
};

/*
 * Delayed teleport type.
 */
class TeleportData
{
public:
    std::shared_ptr<TeleportData> Next;
    std::shared_ptr<TeleportData> Previous;
    std::shared_ptr<Room> FromRoom;
    short TeleportTimer = 0;
};

class timerset
{
public:
    timerset()
    {
        memset(&TotalTime, 0, sizeof(TotalTime));
        memset(&MinTime, 0, sizeof(MinTime));
        memset(&MaxTime, 0, sizeof(MaxTime));
    }

    int            NumberOfTimesUsed = 0;
    timeval TotalTime;
    timeval MinTime;
    timeval MaxTime;
};

class Auction
{
public:
    std::weak_ptr<Object> Item;   /* a pointer to the item */
    std::shared_ptr<Character> Seller = nullptr; /* a pointer to the seller - which may NOT quit */
    std::shared_ptr<Character> Buyer = nullptr;  /* a pointer to the buyer - which may NOT quit */
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
 * Global constants.
 */
extern time_t last_restore_all_time;
extern time_t boot_time;  /* this should be moved down */
extern HourMinSec *set_boot_time;
extern tm *new_boot_time;
extern time_t new_boot_time_t;

extern const std::array<const StrengthBonusType, MAX_STAT + 1> StrengthBonus;
extern const std::array<const IntelligenceBonusType, MAX_STAT + 1> IntelligenceBonus;
extern const std::array<const WisdomBonusType, MAX_STAT + 1> WisdomBonus;
extern const std::array<const DexterityBonusType, MAX_STAT + 1> DexterityBonus;
extern const std::array<const ConstitutionBonusType, MAX_STAT + 1> ConstitutionBonus;
extern const std::array<const CharismaBonusType, MAX_STAT + 1> CharismaBonus;
extern const std::array<const LuckBonusType, MAX_STAT + 1> LuckBonus;
extern const std::array<const ForceBonusType, MAX_STAT + 1> ForceBonus;

extern const std::array<const LiquidType, LIQ_MAX> LiquidTable;

extern const std::array<const char *const, MAX_ABILITY> AbilityName;
extern const std::array<const char *const, MAX_SPACEOBJECT_TYPE> SpaceobjectTypeName;
extern const std::array<const short, SECT_MAX> MovementLoss;
extern const std::array<const char *const, MAX_WEAR> WhereName;
extern const std::array<int, MAX_DIR + 1> TrapDoor;
extern const char *const SectorNames[][2];
extern const int SentTotal[];
extern const char *const RoomSents[][25];
extern const std::array<const char *const, Flag::MAX> RoomFlags;
extern const std::array<const char *const, Flag::MAX> WearFlags;
extern const std::array<const char *const, Flag::MAX> ObjectFlags;
extern const std::array<const char *const, Flag::MAX> MobFlags;
extern const std::array<const char *const, Flag::MAX> AffectFlags;
extern const std::array<const char *const, Flag::MAX> WantedFlags;
extern const std::array<const char *const, Flag::MAX> PlanetFlags;
extern const std::array<const char *const, Flag::MAX> PlayerFlags;
extern const std::array<const char *const, Flag::MAX> TrapFlags;
extern const std::array<const char *const, Flag::MAX> RisFlags;
extern const std::array<const char *const, Flag::MAX> TriggerFlags;
extern const std::array<const char *const, Flag::MAX> DefenseFlags;
extern const std::array<const char *const, Flag::MAX> AttackFlags;
extern const std::array<const char *const, Flag::MAX> AreaFlags;
extern const std::array<const char *const, Flag::MAX> ExitFlags;
extern const std::array<const char *const, Flag::MAX> mprog_flags;
extern const std::array<const char *const, Flag::MAX> SaveFlags;
extern const std::array<const char *const, Flag::MAX> ShipFlags;
extern const std::array<const char *const, Flag::MAX> ResidentFlags;
extern const std::array<const char *const, Flag::MAX> HomeFlags;

extern const std::array<const char *const, MAX_ITEM_TYPE + 1> ObjectTypes;
extern const std::array<const char *const, MAX_APPLY_TYPE> AffectTypes;
extern const std::array<const char *const, MAX_NPC_RACE> NpcRace;
extern const std::array<const char *const, MAX_WEAR - 1> WearLocations;
extern const std::array<int, LANG_MAX + 1> LanguageArray;
extern const std::array<const char *const, LANG_MAX + 1> LanguageNames;

extern const std::array<const char *const, MAX_POSITION> PositionName;
extern const std::array<const char *const, MAX_LOG> CmdLogName;
extern const std::array<const char *const, MAX_SHIP_TYPE> ShipTypes;
extern const std::array<const char *const, MAX_SHIP_CLASS> ShipClasses;
extern const std::array<const char *const, Flag::MAX> ChannelNames;
extern const std::array<const char *const, MAX_CONDS> ConditionNames;
extern const std::array<const char *const, MAX_SEX> SexNames;

/*
 * Global variables.
 */
extern bool bootup;

extern int numobjsloaded;
extern int nummobsloaded;
extern int physicalobjects;
extern int num_descriptors;
extern int top_vroom;
extern int top_affect;
extern int top_ed;
extern int top_exit;
extern int top_reset;
extern int top_room;
extern int cur_qobjs;
extern int cur_qchars;
extern long long high_galaxy_cash;
extern long long low_galaxy_cash;

extern std::shared_ptr<Character> cur_char;
extern std::shared_ptr<Room>             cur_room;
extern bool             cur_char_died;
extern ch_ret           global_retcode;

extern int              cur_obj;
extern int              cur_obj_serial;
extern bool             cur_obj_extracted;
extern obj_ret          global_objcode;

extern std::shared_ptr<Character> FirstCharacter;
extern std::shared_ptr<Character> LastCharacter;

extern std::shared_ptr<TeleportData> FirstTeleport;
extern std::shared_ptr<TeleportData> LastTeleport;
extern std::weak_ptr<Object> save_equipment[MAX_WEAR][MAX_LAYERS];
extern std::weak_ptr<Character> quitting_char;
extern std::weak_ptr<Character> loading_char;
extern std::weak_ptr<Character> saving_char;
extern time_t           current_time;
extern bool             fLogAll;
extern TimeInfo   time_info;
extern Weather     weather_info;
extern std::unique_ptr<Auction> OngoingAuction;
extern std::unordered_map<vnum_t, std::shared_ptr<ProtoMobile>> ProtoMobs;
extern std::unordered_map<vnum_t, std::shared_ptr<ProtoObject>> ProtoObjects;
extern std::shared_ptr<Room> RoomIndexHash[MAX_KEY_HASH];

/*
 * Command functions.
 */
DECLARE_CMD_FUN(do_upgradehome);
DECLARE_CMD_FUN(do_addresident);
DECLARE_CMD_FUN(do_remresident);
DECLARE_CMD_FUN(do_buyhome);
DECLARE_CMD_FUN(do_sellhome);
DECLARE_CMD_FUN(do_buzz);
DECLARE_CMD_FUN(do_invite);
DECLARE_CMD_FUN(do_homestat);
DECLARE_CMD_FUN(do_decorate);

DECLARE_CMD_FUN(do_showshuttle);
DECLARE_CMD_FUN(do_makeshuttle);
DECLARE_CMD_FUN(do_setshuttle);
DECLARE_CMD_FUN(do_alias);
DECLARE_CMD_FUN(do_test);
DECLARE_CMD_FUN(do_craftingengine);
DECLARE_CMD_FUN(do_copyover);
DECLARE_CMD_FUN(do_nohelps);
DECLARE_CMD_FUN(do_skin);
DECLARE_CMD_FUN(do_dismiss);
DECLARE_CMD_FUN(do_draw);
DECLARE_CMD_FUN(do_focusalias);
DECLARE_CMD_FUN(do_unfocusalias);
DECLARE_CMD_FUN(do_members);
DECLARE_CMD_FUN(do_roster);
DECLARE_CMD_FUN(do_scatter);
DECLARE_CMD_FUN(do_delay);
DECLARE_CMD_FUN(do_setplanet);
DECLARE_CMD_FUN(do_makeplanet);
DECLARE_CMD_FUN(do_planets);
DECLARE_CMD_FUN(do_showplanet);
DECLARE_CMD_FUN(do_showstatistic);
DECLARE_CMD_FUN(do_teach);
DECLARE_CMD_FUN(do_gather_intelligence);
DECLARE_CMD_FUN(do_add_patrol);
DECLARE_CMD_FUN(do_special_forces);
DECLARE_CMD_FUN(do_jail);
DECLARE_CMD_FUN(do_unjail);
DECLARE_CMD_FUN(do_elite_guard);
DECLARE_CMD_FUN(do_smalltalk);
DECLARE_CMD_FUN(do_propaganda);
DECLARE_CMD_FUN(do_bribe);
DECLARE_CMD_FUN(do_seduce);
DECLARE_CMD_FUN(do_mass_propaganda);
DECLARE_CMD_FUN(do_copyship);
DECLARE_CMD_FUN(do_autopilot);
DECLARE_CMD_FUN(do_allspeeders);
DECLARE_CMD_FUN(do_speeders);
DECLARE_CMD_FUN(do_suicide);
DECLARE_CMD_FUN(do_train);
DECLARE_CMD_FUN(do_beg);
DECLARE_CMD_FUN(do_bank);
DECLARE_CMD_FUN(do_hijack);
DECLARE_CMD_FUN(do_pickshiplock);
DECLARE_CMD_FUN(do_shiptalk);
DECLARE_CMD_FUN(do_clone);
DECLARE_CMD_FUN(do_systemtalk);
DECLARE_CMD_FUN(do_sabotage);
DECLARE_CMD_FUN(do_spacetalk);
DECLARE_CMD_FUN(do_hail);
DECLARE_CMD_FUN(do_allships);
DECLARE_CMD_FUN(do_appoint);
DECLARE_CMD_FUN(do_demote);
DECLARE_CMD_FUN(do_empower);
DECLARE_CMD_FUN(do_capture);
DECLARE_CMD_FUN(do_arm);
DECLARE_CMD_FUN(do_chaff);
DECLARE_CMD_FUN(do_clan_donate);
DECLARE_CMD_FUN(do_clan_withdraw);
DECLARE_CMD_FUN(do_drive);
DECLARE_CMD_FUN(do_setblaster);
DECLARE_CMD_FUN(do_ammo);
DECLARE_CMD_FUN(do_takedrug);
DECLARE_CMD_FUN(do_use);
DECLARE_CMD_FUN(do_resign);
DECLARE_CMD_FUN(do_pluogus);
DECLARE_CMD_FUN(do_makearmor);
DECLARE_CMD_FUN(do_makejewelry);
DECLARE_CMD_FUN(do_makegrenade);
DECLARE_CMD_FUN(do_makelandmine);
DECLARE_CMD_FUN(do_makeglowrod);
DECLARE_CMD_FUN(do_makecomlink);
DECLARE_CMD_FUN(do_makeshield);
DECLARE_CMD_FUN(do_makecontainer);
DECLARE_CMD_FUN(do_reinforcements);
DECLARE_CMD_FUN(do_postguard);
DECLARE_CMD_FUN(do_torture);
DECLARE_CMD_FUN(do_snipe);
DECLARE_CMD_FUN(do_throw);
DECLARE_CMD_FUN(do_disguise);
DECLARE_CMD_FUN(do_makedisguise);
DECLARE_CMD_FUN(do_mine);
DECLARE_CMD_FUN(do_first_aid);
DECLARE_CMD_FUN(do_makeblade);
DECLARE_CMD_FUN(do_makeblaster);
DECLARE_CMD_FUN(do_makebowcaster);
DECLARE_CMD_FUN(do_makelightsaber);
DECLARE_CMD_FUN(do_makespice);
DECLARE_CMD_FUN(do_closebay);
DECLARE_CMD_FUN(do_openbay);
DECLARE_CMD_FUN(do_autotrack);
DECLARE_CMD_FUN(do_jumpvector);
DECLARE_CMD_FUN(do_reload);
DECLARE_CMD_FUN(do_tractorbeam);
DECLARE_CMD_FUN(do_radar);
DECLARE_CMD_FUN(do_buyship);
DECLARE_CMD_FUN(do_renameship);
DECLARE_CMD_FUN(do_clanbuyship);
DECLARE_CMD_FUN(do_clansellship);
DECLARE_CMD_FUN(do_sellship);
DECLARE_CMD_FUN(do_autorecharge);
DECLARE_CMD_FUN(do_openhatch);
DECLARE_CMD_FUN(do_closehatch);
DECLARE_CMD_FUN(do_status);
DECLARE_CMD_FUN(do_info);
DECLARE_CMD_FUN(do_hyperspace);
DECLARE_CMD_FUN(do_target);
DECLARE_CMD_FUN(do_fire);
DECLARE_CMD_FUN(do_calculate);
DECLARE_CMD_FUN(do_calculate_diff);
DECLARE_CMD_FUN(do_guard);
DECLARE_CMD_FUN(do_recharge);
DECLARE_CMD_FUN(do_repairship);
DECLARE_CMD_FUN(do_addpilot);
DECLARE_CMD_FUN(do_rempilot);
DECLARE_CMD_FUN(do_trajectory);
DECLARE_CMD_FUN(do_trajectory_actual);
DECLARE_CMD_FUN(do_accelerate);
DECLARE_CMD_FUN(do_launch);
DECLARE_CMD_FUN(do_land);
DECLARE_CMD_FUN(do_leaveship);
DECLARE_CMD_FUN(do_setspaceobject);
DECLARE_CMD_FUN(do_makespaceobject);
DECLARE_CMD_FUN(do_spaceobjects);
DECLARE_CMD_FUN(do_showspaceobject);
DECLARE_CMD_FUN(skill_notfound);
DECLARE_CMD_FUN(do_aassign);
DECLARE_CMD_FUN(do_adjusttractorbeam);
DECLARE_CMD_FUN(do_addbounty);
DECLARE_CMD_FUN(do_rembounty);
DECLARE_CMD_FUN(do_vassign);
DECLARE_CMD_FUN(do_rassign);
DECLARE_CMD_FUN(do_massign);
DECLARE_CMD_FUN(do_oassign);
DECLARE_CMD_FUN(do_advance);
DECLARE_CMD_FUN(do_affected);
DECLARE_CMD_FUN(do_afk);
DECLARE_CMD_FUN(do_aid);
DECLARE_CMD_FUN(do_allow);
DECLARE_CMD_FUN(do_ansi);
DECLARE_CMD_FUN(do_answer);
DECLARE_CMD_FUN(do_apply);
DECLARE_CMD_FUN(do_appraise);
DECLARE_CMD_FUN(do_areas);
DECLARE_CMD_FUN(do_accept);
DECLARE_CMD_FUN(do_ahall);
DECLARE_CMD_FUN(do_arena);
DECLARE_CMD_FUN(do_awho);
DECLARE_CMD_FUN(do_bet);
DECLARE_CMD_FUN(do_challenge);
DECLARE_CMD_FUN(do_chaos);
DECLARE_CMD_FUN(do_decline);
DECLARE_CMD_FUN(do_aset);
DECLARE_CMD_FUN(do_ask);
DECLARE_CMD_FUN(do_astat);
DECLARE_CMD_FUN(do_at);
DECLARE_CMD_FUN(do_auction);
DECLARE_CMD_FUN(do_authorize);
DECLARE_CMD_FUN(do_avtalk);
DECLARE_CMD_FUN(do_backstab);
DECLARE_CMD_FUN(do_badname);
DECLARE_CMD_FUN(do_balzhur);
DECLARE_CMD_FUN(do_bamfin);
DECLARE_CMD_FUN(do_bamfout);
DECLARE_CMD_FUN(do_ban);
DECLARE_CMD_FUN(do_bash);
DECLARE_CMD_FUN(do_bashdoor);
DECLARE_CMD_FUN(do_beep);
DECLARE_CMD_FUN(do_berserk);
DECLARE_CMD_FUN(do_bestow);
DECLARE_CMD_FUN(do_bestowarea);
DECLARE_CMD_FUN(do_bind);
DECLARE_CMD_FUN(do_bio);
DECLARE_CMD_FUN(do_board);
DECLARE_CMD_FUN(do_boards);
DECLARE_CMD_FUN(do_bodybag);
DECLARE_CMD_FUN(do_bounties);
DECLARE_CMD_FUN(do_brandish);
DECLARE_CMD_FUN(do_bset);
DECLARE_CMD_FUN(do_bstat);
DECLARE_CMD_FUN(do_bug);
DECLARE_CMD_FUN(do_bury);
DECLARE_CMD_FUN(do_buy);
DECLARE_CMD_FUN(do_buyvendor);
DECLARE_CMD_FUN(do_cast);
DECLARE_CMD_FUN(do_cedit);
DECLARE_CMD_FUN(do_channels);
DECLARE_CMD_FUN(do_chat);
DECLARE_CMD_FUN(do_ooc);
DECLARE_CMD_FUN(do_check_vnums);
DECLARE_CMD_FUN(do_circle);
DECLARE_CMD_FUN(do_clanfunds);
DECLARE_CMD_FUN(do_clans);
DECLARE_CMD_FUN(do_ships);
DECLARE_CMD_FUN(do_shiptrack);
DECLARE_CMD_FUN(do_clantalk);
DECLARE_CMD_FUN(do_allclantalk);
DECLARE_CMD_FUN(do_climb);
DECLARE_CMD_FUN(do_close);
DECLARE_CMD_FUN(do_cmdtable);
DECLARE_CMD_FUN(do_collectgold);
DECLARE_CMD_FUN(do_commands);
DECLARE_CMD_FUN(do_comment);
DECLARE_CMD_FUN(do_compare);
DECLARE_CMD_FUN(do_config);
DECLARE_CMD_FUN(do_consider);
DECLARE_CMD_FUN(do_cutdoor);
DECLARE_CMD_FUN(do_credits);
DECLARE_CMD_FUN(do_cset);
DECLARE_CMD_FUN(do_deny);
DECLARE_CMD_FUN(do_description);
DECLARE_CMD_FUN(do_destroy);
DECLARE_CMD_FUN(do_detrap);
DECLARE_CMD_FUN(do_dig);
DECLARE_CMD_FUN(do_disarm);
DECLARE_CMD_FUN(do_disconnect);
DECLARE_CMD_FUN(do_dismount);
DECLARE_CMD_FUN(do_dmesg);
DECLARE_CMD_FUN(do_down);
DECLARE_CMD_FUN(do_drag);
DECLARE_CMD_FUN(do_drink);
DECLARE_CMD_FUN(do_drop);
DECLARE_CMD_FUN(do_diagnose);
DECLARE_CMD_FUN(do_east);
DECLARE_CMD_FUN(do_eat);
DECLARE_CMD_FUN(do_echo);
DECLARE_CMD_FUN(do_emote);
DECLARE_CMD_FUN(do_empty);
DECLARE_CMD_FUN(do_enter);
DECLARE_CMD_FUN(do_equipment);
DECLARE_CMD_FUN(do_examine);
DECLARE_CMD_FUN(do_exits);
DECLARE_CMD_FUN(do_fill);
DECLARE_CMD_FUN(do_fixchar);
DECLARE_CMD_FUN(do_flee);
DECLARE_CMD_FUN(do_foldarea);
DECLARE_CMD_FUN(do_follow);
DECLARE_CMD_FUN(do_for);
DECLARE_CMD_FUN(do_force);
DECLARE_CMD_FUN(do_forceclose);
DECLARE_CMD_FUN(do_fuel);
DECLARE_CMD_FUN(do_fquit);     /* Gorog */
DECLARE_CMD_FUN(do_form_password);
DECLARE_CMD_FUN(do_freeze);
DECLARE_CMD_FUN(do_get);
DECLARE_CMD_FUN(do_give);
DECLARE_CMD_FUN(do_glance);
DECLARE_CMD_FUN(do_gold);
DECLARE_CMD_FUN(do_goto);
DECLARE_CMD_FUN(do_gouge);
DECLARE_CMD_FUN(do_group);
DECLARE_CMD_FUN(do_grub);
DECLARE_CMD_FUN(do_gtell);
DECLARE_CMD_FUN(do_hedit);
DECLARE_CMD_FUN(do_hell);
DECLARE_CMD_FUN(do_help);
DECLARE_CMD_FUN(do_hide);
DECLARE_CMD_FUN(do_hitall);
DECLARE_CMD_FUN(do_hlist);
DECLARE_CMD_FUN(do_holylight);
DECLARE_CMD_FUN(do_homepage);
DECLARE_CMD_FUN(do_hset);
DECLARE_CMD_FUN(do_i103);
DECLARE_CMD_FUN(do_i104);
DECLARE_CMD_FUN(do_i105);
DECLARE_CMD_FUN(do_idea);
DECLARE_CMD_FUN(do_immortalize);
DECLARE_CMD_FUN(do_immtalk);
DECLARE_CMD_FUN(do_induct);
DECLARE_CMD_FUN(do_installarea);
DECLARE_CMD_FUN(do_instaroom);
DECLARE_CMD_FUN(do_instazone);
DECLARE_CMD_FUN(do_inventory);
DECLARE_CMD_FUN(do_invis);
DECLARE_CMD_FUN(do_junk);
DECLARE_CMD_FUN(do_kick);
DECLARE_CMD_FUN(do_kill);
DECLARE_CMD_FUN(do_languages);
DECLARE_CMD_FUN(do_last);
DECLARE_CMD_FUN(do_leave);
DECLARE_CMD_FUN(do_level);
DECLARE_CMD_FUN(do_light);
DECLARE_CMD_FUN(do_list);
DECLARE_CMD_FUN(do_litterbug);
DECLARE_CMD_FUN(do_loadarea);
DECLARE_CMD_FUN(do_loadup);
DECLARE_CMD_FUN(do_lock);
DECLARE_CMD_FUN(do_log);
DECLARE_CMD_FUN(do_look);
DECLARE_CMD_FUN(do_low_purge);
DECLARE_CMD_FUN(do_mailroom);
DECLARE_CMD_FUN(do_makeboard);
DECLARE_CMD_FUN(do_makeclan);
DECLARE_CMD_FUN(do_makeguild);
DECLARE_CMD_FUN(do_makeship);
DECLARE_CMD_FUN(do_makerepair);
DECLARE_CMD_FUN(do_makeshop);
DECLARE_CMD_FUN(do_makewizlist);
DECLARE_CMD_FUN(do_memory);
DECLARE_CMD_FUN(do_mcreate);
DECLARE_CMD_FUN(do_mfind);
DECLARE_CMD_FUN(do_minvoke);
DECLARE_CMD_FUN(do_mlist);
DECLARE_CMD_FUN(do_mount);
DECLARE_CMD_FUN(do_mset);
DECLARE_CMD_FUN(do_mstat);
DECLARE_CMD_FUN(do_murder);
DECLARE_CMD_FUN(do_music);
DECLARE_CMD_FUN(do_mwhere);
DECLARE_CMD_FUN(do_name);
DECLARE_CMD_FUN(do_newbiechat);
DECLARE_CMD_FUN(do_newbieset);
DECLARE_CMD_FUN(do_newzones);
DECLARE_CMD_FUN(do_noemote);
DECLARE_CMD_FUN(do_noresolve);
DECLARE_CMD_FUN(do_north);
DECLARE_CMD_FUN(do_northeast);
DECLARE_CMD_FUN(do_northwest);
DECLARE_CMD_FUN(do_notell);
DECLARE_CMD_FUN(do_notitle);
DECLARE_CMD_FUN(do_noteroom);
DECLARE_CMD_FUN(do_ocreate);
DECLARE_CMD_FUN(do_ofind);
DECLARE_CMD_FUN(do_ogrub);
DECLARE_CMD_FUN(do_oinvoke);
DECLARE_CMD_FUN(do_oldscore);
DECLARE_CMD_FUN(do_olist);
DECLARE_CMD_FUN(do_open);
DECLARE_CMD_FUN(do_order);
DECLARE_CMD_FUN(do_oset);
DECLARE_CMD_FUN(do_ostat);
DECLARE_CMD_FUN(do_outcast);
DECLARE_CMD_FUN(do_override);
DECLARE_CMD_FUN(do_owhere);
DECLARE_CMD_FUN(do_pardon);
DECLARE_CMD_FUN(do_password);
DECLARE_CMD_FUN(do_peace);
DECLARE_CMD_FUN(do_pick);
DECLARE_CMD_FUN(do_placevendor);
DECLARE_CMD_FUN(do_poison_weapon);
DECLARE_CMD_FUN(do_practice);
DECLARE_CMD_FUN(do_pricevendor);
DECLARE_CMD_FUN(do_prompt);
DECLARE_CMD_FUN(do_pull);
DECLARE_CMD_FUN(do_punch);
DECLARE_CMD_FUN(do_purge);
DECLARE_CMD_FUN(do_push);
DECLARE_CMD_FUN(do_put);
DECLARE_CMD_FUN(do_quaff);
DECLARE_CMD_FUN(do_quit);
DECLARE_CMD_FUN(do_rank);
DECLARE_CMD_FUN(do_rat);
DECLARE_CMD_FUN(do_rdelete);
DECLARE_CMD_FUN(do_reboot);
DECLARE_CMD_FUN(do_recall);
DECLARE_CMD_FUN(do_recho);
DECLARE_CMD_FUN(do_redit);
DECLARE_CMD_FUN(do_regoto);
DECLARE_CMD_FUN(do_remove);
DECLARE_CMD_FUN(do_repair);
DECLARE_CMD_FUN(do_repairset);
DECLARE_CMD_FUN(do_repairshops);
DECLARE_CMD_FUN(do_repairstat);
DECLARE_CMD_FUN(do_reply);
DECLARE_CMD_FUN(do_report);
DECLARE_CMD_FUN(do_request);
DECLARE_CMD_FUN(do_rescue);
DECLARE_CMD_FUN(do_rest);
DECLARE_CMD_FUN(do_reset);
DECLARE_CMD_FUN(do_resetship);
DECLARE_CMD_FUN(do_restore);
DECLARE_CMD_FUN(do_restoretime);
DECLARE_CMD_FUN(do_restrict);
DECLARE_CMD_FUN(do_retire);
DECLARE_CMD_FUN(do_retran);
DECLARE_CMD_FUN(do_return);
DECLARE_CMD_FUN(do_revert);
DECLARE_CMD_FUN(do_rgrub);
DECLARE_CMD_FUN(do_rlist);
DECLARE_CMD_FUN(do_rreset);
DECLARE_CMD_FUN(do_rstat);
DECLARE_CMD_FUN(do_addsalary);
DECLARE_CMD_FUN(do_save);
DECLARE_CMD_FUN(do_savearea);
DECLARE_CMD_FUN(do_say);
DECLARE_CMD_FUN(do_scan);
DECLARE_CMD_FUN(do_score);
DECLARE_CMD_FUN(do_study);
DECLARE_CMD_FUN(do_search);
DECLARE_CMD_FUN(do_sedit);
DECLARE_CMD_FUN(do_sell);
DECLARE_CMD_FUN(do_set_boot_time);
DECLARE_CMD_FUN(do_setclan);
DECLARE_CMD_FUN(do_setship);
DECLARE_CMD_FUN(do_shops);
DECLARE_CMD_FUN(do_shopset);
DECLARE_CMD_FUN(do_shopstat);
DECLARE_CMD_FUN(do_shout);
DECLARE_CMD_FUN(do_shove);
DECLARE_CMD_FUN(do_showclan);
DECLARE_CMD_FUN(do_showlayers);
DECLARE_CMD_FUN(do_showship);
DECLARE_CMD_FUN(do_shutdown);
DECLARE_CMD_FUN(do_silence);
DECLARE_CMD_FUN(do_sit);
DECLARE_CMD_FUN(do_sla);
DECLARE_CMD_FUN(do_slay);
DECLARE_CMD_FUN(do_sleep);
DECLARE_CMD_FUN(do_slist);
DECLARE_CMD_FUN(do_slookup);
DECLARE_CMD_FUN(do_smoke);
DECLARE_CMD_FUN(do_sneak);
DECLARE_CMD_FUN(do_snoop);
DECLARE_CMD_FUN(do_sober);
DECLARE_CMD_FUN(do_socials);
DECLARE_CMD_FUN(do_south);
DECLARE_CMD_FUN(do_southeast);
DECLARE_CMD_FUN(do_southwest);
DECLARE_CMD_FUN(do_speak);
DECLARE_CMD_FUN(do_split);
DECLARE_CMD_FUN(do_sset);
DECLARE_CMD_FUN(do_stand);
DECLARE_CMD_FUN(do_steal);
DECLARE_CMD_FUN(do_stun);
DECLARE_CMD_FUN(do_switch);
DECLARE_CMD_FUN(do_tamp);
DECLARE_CMD_FUN(do_tell);
DECLARE_CMD_FUN(do_time);
DECLARE_CMD_FUN(do_timecmd);
DECLARE_CMD_FUN(do_title);
DECLARE_CMD_FUN(do_track);
DECLARE_CMD_FUN(do_toplevel);
DECLARE_CMD_FUN(do_transfer);
DECLARE_CMD_FUN(do_transship);
DECLARE_CMD_FUN(do_trust);
DECLARE_CMD_FUN(do_typo);
DECLARE_CMD_FUN(do_unhell);
DECLARE_CMD_FUN(do_undock);
DECLARE_CMD_FUN(do_unlock);
DECLARE_CMD_FUN(do_unsilence);
DECLARE_CMD_FUN(do_up);
DECLARE_CMD_FUN(do_users);
DECLARE_CMD_FUN(do_value);
DECLARE_CMD_FUN(do_viewskills);
DECLARE_CMD_FUN(do_visible);
DECLARE_CMD_FUN(do_vnums);
DECLARE_CMD_FUN(do_vsearch);
DECLARE_CMD_FUN(do_wake);
DECLARE_CMD_FUN(do_wartalk);
DECLARE_CMD_FUN(do_wear);
DECLARE_CMD_FUN(do_weather);
DECLARE_CMD_FUN(do_west);
DECLARE_CMD_FUN(do_where);
DECLARE_CMD_FUN(do_who);
DECLARE_CMD_FUN(do_whois);
DECLARE_CMD_FUN(do_wimpy);
DECLARE_CMD_FUN(do_wizhelp);
DECLARE_CMD_FUN(do_wizlist);
DECLARE_CMD_FUN(do_wizlock);
DECLARE_CMD_FUN(do_yell);
DECLARE_CMD_FUN(do_zap);
DECLARE_CMD_FUN(do_zones);
DECLARE_CMD_FUN(do_dock);

/* mob prog stuff */
DECLARE_CMD_FUN(do_macro);
DECLARE_CMD_FUN(do_mp_close_passage);
DECLARE_CMD_FUN(do_mp_damage);
DECLARE_CMD_FUN(do_mp_restore);
DECLARE_CMD_FUN(do_mp_open_passage);
DECLARE_CMD_FUN(do_mp_slay);
DECLARE_CMD_FUN(do_mpasound);
DECLARE_CMD_FUN(do_mpat);
DECLARE_CMD_FUN(do_mpdream);
DECLARE_CMD_FUN(do_mp_deposit);
DECLARE_CMD_FUN(do_mp_withdraw);
DECLARE_CMD_FUN(do_mpecho);
DECLARE_CMD_FUN(do_mpechoaround);
DECLARE_CMD_FUN(do_mpechoat);
DECLARE_CMD_FUN(do_mpedit);
DECLARE_CMD_FUN(do_mpfind);
DECLARE_CMD_FUN(do_opedit);
DECLARE_CMD_FUN(do_opfind);
DECLARE_CMD_FUN(do_rpedit);
DECLARE_CMD_FUN(do_rpfind);
DECLARE_CMD_FUN(do_mpforce);
DECLARE_CMD_FUN(do_mpinvis);
DECLARE_CMD_FUN(do_mpgoto);
DECLARE_CMD_FUN(do_mpjunk);
DECLARE_CMD_FUN(do_mpkill);
DECLARE_CMD_FUN(do_mpmload);
DECLARE_CMD_FUN(do_mpnothing);
DECLARE_CMD_FUN(do_mpoload);
DECLARE_CMD_FUN(do_opoload);
DECLARE_CMD_FUN(do_mppurge);
DECLARE_CMD_FUN(do_mpstat);
DECLARE_CMD_FUN(do_opstat);
DECLARE_CMD_FUN(do_rpstat);
DECLARE_CMD_FUN(do_mptransfer);
DECLARE_CMD_FUN(do_mpapply);
DECLARE_CMD_FUN(do_mpapplyb);
DECLARE_CMD_FUN(do_mpgain);

/*
 * Spell functions.
 * Defined in magic.c.
 */
DECLARE_SPELL_FUN(spell_null);
DECLARE_SPELL_FUN(spell_notfound);
DECLARE_SPELL_FUN(spell_affect);
DECLARE_SPELL_FUN(spell_affectchar);
DECLARE_SPELL_FUN(spell_area_attack);
DECLARE_SPELL_FUN(spell_attack);
DECLARE_SPELL_FUN(spell_black_lightning);
DECLARE_SPELL_FUN(spell_blindness);
DECLARE_SPELL_FUN(spell_cause_critical);
DECLARE_SPELL_FUN(spell_cause_light);
DECLARE_SPELL_FUN(spell_cause_serious);
DECLARE_SPELL_FUN(spell_charm_person);
DECLARE_SPELL_FUN(spell_create_mob);
DECLARE_SPELL_FUN(spell_create_obj);
DECLARE_SPELL_FUN(spell_cure_blindness);
DECLARE_SPELL_FUN(spell_cure_poison);
DECLARE_SPELL_FUN(spell_detect_poison);
DECLARE_SPELL_FUN(spell_dispel_evil);
DECLARE_SPELL_FUN(spell_dispel_magic);
DECLARE_SPELL_FUN(spell_dream);
DECLARE_SPELL_FUN(spell_earthquake);
DECLARE_SPELL_FUN(spell_energy_drain);
DECLARE_SPELL_FUN(spell_farsight);
DECLARE_SPELL_FUN(spell_fireball);
DECLARE_SPELL_FUN(spell_flamestrike);
DECLARE_SPELL_FUN(spell_hand_of_chaos);
DECLARE_SPELL_FUN(spell_harm);
DECLARE_SPELL_FUN(spell_identify);
DECLARE_SPELL_FUN(spell_invis);
DECLARE_SPELL_FUN(spell_know_alignment);
DECLARE_SPELL_FUN(spell_lightning_bolt);
DECLARE_SPELL_FUN(spell_obj_inv);
DECLARE_SPELL_FUN(spell_poison);
DECLARE_SPELL_FUN(spell_possess);
DECLARE_SPELL_FUN(spell_remove_invis);
DECLARE_SPELL_FUN(spell_remove_trap);
DECLARE_SPELL_FUN(spell_scorching_surge);
DECLARE_SPELL_FUN(spell_shocking_grasp);
DECLARE_SPELL_FUN(spell_sleep);
DECLARE_SPELL_FUN(spell_smaug);
DECLARE_SPELL_FUN(spell_ventriloquate);
DECLARE_SPELL_FUN(spell_weaken);

DECLARE_SPEC_FUN(spec_jedi);
DECLARE_SPEC_FUN(spec_dark_jedi);
DECLARE_SPEC_FUN(spec_fido);
DECLARE_SPEC_FUN(spec_guardian);
DECLARE_SPEC_FUN(spec_janitor);
DECLARE_SPEC_FUN(spec_poison);
DECLARE_SPEC_FUN(spec_thief);
DECLARE_SPEC_FUN(spec_auth);
DECLARE_SPEC_FUN(spec_stormtrooper);
DECLARE_SPEC_FUN(spec_rebel_trooper);
DECLARE_SPEC_FUN(spec_customs_smut);
DECLARE_SPEC_FUN(spec_customs_alcohol);
DECLARE_SPEC_FUN(spec_customs_weapons);
DECLARE_SPEC_FUN(spec_customs_spice);
DECLARE_SPEC_FUN(spec_police_attack);
DECLARE_SPEC_FUN(spec_police_undercover);
DECLARE_SPEC_FUN(spec_police_jail);
DECLARE_SPEC_FUN(spec_police_fine);
DECLARE_SPEC_FUN(spec_police);
DECLARE_SPEC_FUN(spec_clan_guard);
DECLARE_SPEC_FUN(spec_newbie_pilot);

/*
 * Our function prototypes.
 * One big lump ... this is every function in Merc.
 */

 /* copyover.c */
void RecoverFromCopyover();

bool IsNameAcceptable(const std::string &name);
std::string DrunkSpeech(const std::string &argument, std::shared_ptr<Character> ch);
void TalkChannel(std::shared_ptr<Character> ch, const std::string &text,
                 int channel, const std::string &verb);
bool IsFollowingInCircle(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void StartFollowing(std::shared_ptr<Character> ch, std::shared_ptr<Character> master);
void StopFollowing(std::shared_ptr<Character> ch);
void DieFollower(std::shared_ptr<Character> ch);
bool IsInSameGroup(std::shared_ptr<Character> ach, std::shared_ptr<Character> bch);
void ToChannel(const std::string &argument, int channel,
               const std::string &verb, short level);
void TalkAuction(const std::string &argument);
bool CharacterKnowsLanguage(std::shared_ptr<Character> ch, int language, std::shared_ptr<Character> cch);
bool CharacterCanLearnLanguage(std::shared_ptr<Character> ch, int language);
int CountLanguages(int languages);

/* act_info.c */
bool RaceIsAvailableToPlayers(const Race *race);
int GetRaceFromName(const std::string &arg);
int GetClassFromName(const std::string &arg);
void ShowCharacterCondition(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
std::string FormatObjectToCharacter(std::shared_ptr<Object> obj, std::shared_ptr<Character> ch, bool fShort);
void ShowObjectListToCharacter(const std::list<std::shared_ptr<Object>> &list, std::shared_ptr<Character> ch,
                               bool fShort, bool fShowNothing);
/* act_move.c */
void SetBExitFlag(std::shared_ptr<Exit> pexit, size_t flag);
void RemoveBExitFlag(std::shared_ptr<Exit> pexit, size_t flag);
std::shared_ptr<Room> GenerateExit(std::shared_ptr<Room> in_room, std::shared_ptr<Exit> &pexit);
void ClearVirtualRooms();
std::shared_ptr<Exit> FindDoor(std::shared_ptr<Character> ch, const std::string &arg, bool quiet);
std::shared_ptr<Exit> GetExit(std::shared_ptr<Room> room, DirectionType dir);
std::shared_ptr<Exit> GetExitTo(std::shared_ptr<Room> room, DirectionType dir, vnum_t vnum);
std::shared_ptr<Exit> GetExitNumber(std::shared_ptr<Room> room, short count);
ch_ret MoveCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Exit> pexit, int fall = 0);
void Teleport(std::shared_ptr<Character> ch, vnum_t room, int flags);
bool CharacterFallIfNoFloor(std::shared_ptr<Character> ch, int fall);

/* act_obj.c */
std::string GetObjectShortDescription(std::shared_ptr<Object> obj);
bool RemoveObject(std::shared_ptr<Character> ch, WearLocation iWear, bool fReplace);
obj_ret DamageObject(std::shared_ptr<Object> obj);
short GetObjectResistance(std::shared_ptr<Object> obj);
void ObjectFallIfNoFloor(std::shared_ptr<Object> obj, bool through);

/* act_wiz.c */
std::shared_ptr<Room> FindLocation(std::shared_ptr<Character> ch, const std::string &arg);
void EchoToRoom(short AT_COLOR, std::shared_ptr<Room> room, const std::string &argument);
void EchoToRoomNoNewline(int ecolor, std::shared_ptr<Room> room, const std::string &argument);
void RealEchoToRoom(short color, std::shared_ptr<Room> room, const std::string &text, bool sendNewline);
void EchoToAll(short AT_COLOR, const std::string &argument, short tar);
void GenerateRebootString();

/* const.c */
std::string FlagString(const std::bitset<Flag::MAX> &flags,
                       const std::array<const char *const, Flag::MAX> &nameArray);
std::string FlagString(int bitvector,
                       const std::array<const char *const, Flag::MAX> &nameArray);
int GetSaveFlag(const std::string &txt);
const char *GetDirectionName(DirectionType dir);
DirectionType GetReverseDirection(DirectionType dir);
SpaceobjectType GetSpaceobjectType(const std::string &name);
SectorType GetSectorType(const std::string &type);
int GetAbility(const std::string &name);
size_t GetSpiceTableSize(void);
const char *GetSpiceTypeName(size_t spicetype);
size_t GetCrystalTableSize(void);
const char *GetCrystalTypeName(size_t crystaltype);
int GetCrystalType(const std::string &txt);
size_t GetWeaponTableSize(void);
const char *GetWeaponTypeName(size_t weapontype);
int GetWeaponType(const std::string &txt);
int GetAttackType(const std::string &txt);
size_t GetAttackTableSize(void);
const char *GetAttackTypeName(size_t type);
size_t GetSpellDamageSize(void);
const char *GetSpellDamageName(size_t type);
size_t GetSpellActionSize(void);
const char *GetSpellActionName(size_t type);
size_t GetSpellPowerSize(void);
const char *GetSpellPowerName(size_t type);
size_t GetSpellClassSize(void);
const char *GetSpellClassName(size_t type);
const char *GetSpellSavesName(size_t type);
const char *GetSpellTargetName(size_t type);
int GetSpiceType(const std::string &txt);
int GetNpcRace(const std::string &txt);
int GetMobFlag(const std::string &txt);
int GetPlayerFlag(const std::string &txt);
int GetPcFlag(const std::string &txt);
int GetResistanceFlag(const std::string &txt);
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
SexType GetSex(const std::string &txt);
int GetCmdLog(const std::string &txt);
ShipClass GetShipClass(const std::string &txt);
ShipType GetShipType(const std::string &txt);
int GetShipFlag(const std::string &txt);
int GetCondition(const std::string &conditionName);
int GetResidentFlag(const std::string &flag);
int GetHomeFlag(const std::string &flag);

/* nanny.c */
void Nanny(std::shared_ptr<Descriptor> d, std::string argument);

/* comm.cpp */
void DisplayPrompt(Descriptor *d);
void CloseDescriptor(std::shared_ptr<Descriptor> dclose, bool force);
bool WriteToDescriptor(Descriptor *desc, const std::string &txt, int length = 0);
void SetCharacterColor(short AType, std::shared_ptr<Character> ch);
socket_t InitializeSocket(unsigned short port);
void FreeDescriptor(std::shared_ptr<Descriptor> d);

/* comments.c */
void ReadComment(std::shared_ptr<Character> ch, FILE *fp);
void WriteComments(std::shared_ptr<Character> ch, FILE *fp);

/* db.c */
void MakeWizlist();
void ShutdownMud(const std::string &reason);
void ShowVnums(std::shared_ptr<Character> ch, vnum_t low, vnum_t high, bool proto, bool shownl);
void AppendFile(std::shared_ptr<Character> ch, const std::string &file, const std::string &str);
void ShowFile(std::shared_ptr<Character> ch, const std::string &filename);
void BootDatabase(bool fCopyover);
void AddCharacter(std::shared_ptr<Character> ch);
std::shared_ptr<Character> CreateMobile(std::shared_ptr<ProtoMobile> pMobIndex);
std::shared_ptr<Object> CreateObject(std::shared_ptr<ProtoObject> pObjIndex, int level);
std::string GetExtraDescription(const std::string &name, const std::list<std::shared_ptr<ExtraDescription>> &extras);
std::shared_ptr<ProtoMobile> GetProtoMobile(vnum_t vnum);
std::shared_ptr<ProtoObject> GetProtoObject(vnum_t vnum);
std::shared_ptr<Room> GetRoom(vnum_t vnum);
std::shared_ptr<Room> MakeRoom(vnum_t vnum);
std::shared_ptr<ProtoObject> MakeObject(vnum_t vnum, vnum_t cvnum, const std::string &name);
std::shared_ptr<ProtoMobile> MakeMobile(vnum_t vnum, vnum_t cvnum, const std::string &name);
std::shared_ptr<Exit> MakeExit(std::shared_ptr<Room> pRoomIndex, std::shared_ptr<Room> to_room, DirectionType door,
                               const std::string &keyword = "");
void RandomizeExits(std::shared_ptr<Room> room, short maxdir);
bool DeleteRoom(std::shared_ptr<Room> room);
bool DeleteObject(std::shared_ptr<ProtoObject> obj);
bool DeleteMobile(std::shared_ptr<ProtoMobile> mob);

/* build.c */
void EditMobProg(std::shared_ptr<Character> ch, std::shared_ptr<MPROG_DATA> mprg, int mptype, const std::string &argument);
void EditRoomProg(std::shared_ptr<Character> ch, std::shared_ptr<MPROG_DATA> mprg, int mptype, const std::string &argument);
void EditObjProg(std::shared_ptr<Character> ch, std::shared_ptr<MPROG_DATA> mprg, int mptype, const std::string &argument);

bool CanModifyRoom(std::shared_ptr<Character> ch, std::shared_ptr<Room> room);
bool CanModifyObject(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
bool CanModifyCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Character> mob);

bool CanMedit(std::shared_ptr<Character> ch, std::shared_ptr<ProtoMobile> mob);
void FreeReset(std::shared_ptr<Area> are, std::shared_ptr<Reset> res);
std::shared_ptr<ExtraDescription> SetRExtra(std::shared_ptr<Room> room, const std::string &keywords);
bool DelRExtra(std::shared_ptr<Room> room, const std::string &keywords);
std::shared_ptr<ExtraDescription> SetOExtra(std::shared_ptr<Object> obj, const std::string &keywords);
bool DelOExtra(std::shared_ptr<Object> obj, const std::string &keywords);
std::shared_ptr<ExtraDescription> SetOExtraProto(std::shared_ptr<ProtoObject> obj, const std::string &keywords);
bool DelOExtraProto(std::shared_ptr<ProtoObject> obj, const std::string &keywords);
std::shared_ptr<Reset> ParseReset(std::shared_ptr<Area> tarea, std::string argument, std::shared_ptr<Character> ch);

/* fight.cpp */
ch_ret HitOnce(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dt);
long ComputeXP(std::shared_ptr<Character> gch, std::shared_ptr<Character> victim);
void ViolenceUpdate(void);
ch_ret HitMultipleTimes(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dt);
short ModifyDamageBasedOnResistance(std::shared_ptr<Character> ch, short dam, int ris);
ch_ret InflictDamage(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dam, int dt);
void UpdatePosition(std::shared_ptr<Character> victim);
void StartFighting(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void StopFighting(std::shared_ptr<Character> ch, bool fBoth);
void FreeFight(std::shared_ptr<Character> ch);
void StopHunting(std::shared_ptr<Character> ch);
void StopHating(std::shared_ptr<Character> ch);
void StopFearing(std::shared_ptr<Character> ch);
void StartHunting(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void StartHating(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void StartFearing(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool IsHunting(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool IsHating(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool IsFearing(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool IsSafe(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool CanLootVictim(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void RawKill(std::shared_ptr<Character> killer, std::shared_ptr<Character> victim);
bool IsFighting(const std::shared_ptr<Character> &ch);
std::shared_ptr<Character> WhoFighting(const std::shared_ptr<Character> &ch);
int NumFighting(const std::shared_ptr<Character> &ch);

/* makeobjs.c */
void MakeCorpse(std::shared_ptr<Character> ch);
void MakeBloodstain(std::shared_ptr<Character> ch);
void MakeScraps(std::shared_ptr<Object> obj);
void MakeFire(std::shared_ptr<Room> in_room, short timer);
std::shared_ptr<Object> MakeTrap(int v0, int v1, int v2, int v3);
std::shared_ptr<Object> CreateMoney(int amount);

/* mapper.c */
void DrawMap(std::shared_ptr<Character> ch, const std::string &desc);

/* misc.c */
bool IsValidLanguage(int language);
void PullOrPush(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, bool pull);
std::string FormatDate(const time_t *);
void ActionDescription(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);

/* mud_comm.c */
std::shared_ptr<Character> GetCharacterInRoomMudProg(std::shared_ptr<Character> ch, std::string argument);
int GetColor(const std::string &argument);
const char *MobProgTypeToName(int type);
int MobProgNameToType(const std::string &name);

/* skills.c */
bool CheckParry(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool CheckDodge(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
bool CheckGrip(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void Disarm(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void Trip(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);

/* handler.c */
bool CharacterCanTakePrototype(std::shared_ptr<Character> ch);
void Explode(std::shared_ptr<Object> obj);
long GetRequiredXpForLevel(short level);
void ModifyAffect(std::shared_ptr<Character> ch, std::shared_ptr<Affect> paf, bool fAdd);
void AffectToCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Affect> paf);
void RemoveAffect(std::shared_ptr<Character> ch, std::shared_ptr<Affect> paf);
void StripAffect(std::shared_ptr<Character> ch, int sn);
void JoinAffect(std::shared_ptr<Character> ch, std::shared_ptr<Affect> paf);
void CharacterFromRoom(std::shared_ptr<Character> ch);
void CharacterToRoom(std::shared_ptr<Character> ch, std::shared_ptr<Room> pRoomIndex);
std::shared_ptr<Object> ObjectToCharacter(std::shared_ptr<Object> obj, std::shared_ptr<Character> ch);
void ObjectFromCharacter(std::shared_ptr<Object> obj);
int GetObjectArmorClass(std::shared_ptr<Object> obj, int iWear);
int CountOccurrencesOfObjectInList(std::shared_ptr<ProtoObject> protoobj, const std::list<std::shared_ptr<Object>> &list);
void ObjectFromRoom(std::shared_ptr<Object> obj);
std::shared_ptr<Object> ObjectToRoom(std::shared_ptr<Object> obj, std::shared_ptr<Room> pRoomIndex);
std::shared_ptr<Object> ObjectToObject(std::shared_ptr<Object> obj, std::shared_ptr<Object> obj_to);
void ObjectFromObject(std::shared_ptr<Object> obj);
void ExtractObject(std::shared_ptr<Object> obj);
void ExtractExit(std::shared_ptr<Room> room, std::shared_ptr<Exit> pexit);
void CleanRoom(std::shared_ptr<Room> room);
void CleanObject(std::shared_ptr<ProtoObject> obj);
void CleanMobile(std::shared_ptr<ProtoMobile> mob);
void ExtractCharacter(std::shared_ptr<Character> ch, bool fPull);
std::shared_ptr<Character> GetCharacterInRoom(std::shared_ptr<Character> ch, std::string argument);
std::shared_ptr<Character> GetCharacterAnywhere(std::shared_ptr<Character> ch, std::string argument);
std::shared_ptr<Object> GetInstanceOfObject(std::shared_ptr<ProtoObject> pObjIndexData);
std::shared_ptr<Object> GetObjectInList(std::shared_ptr<Character> ch, std::string objName,
                                        const std::list<std::shared_ptr<Object>> &list);
std::shared_ptr<Object> GetObjectInListReverse(std::shared_ptr<Character> ch, std::string objName,
                                               const std::list<std::shared_ptr<Object>> &list);
std::shared_ptr<Object> GetObjectHere(std::shared_ptr<Character> ch, std::string argument);
std::shared_ptr<Object> GetObjectAnywhere(std::shared_ptr<Character> ch, std::string argument);
int GetObjectCount(std::shared_ptr<Object> obj);
int GetObjectWeight(std::shared_ptr<Object> obj);
bool IsRoomDark(std::shared_ptr<Room> pRoomIndex);
bool IsRoomPrivate(std::shared_ptr<Character> ch, std::shared_ptr<Room> pRoomIndex);
const char *GetItemTypeName(std::shared_ptr<Object> obj);
const char *GetAffectLocationName(int location);
ch_ret CheckObjectForTrap(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, int flag);
ch_ret CheckRoomForTraps(std::shared_ptr<Character> ch, int flag);
bool IsObjectTrapped(std::shared_ptr<Object> obj);
std::shared_ptr<Object> GetTrap(std::shared_ptr<Object> obj);
ch_ret SpringTrap(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ShowAffectToCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Affect> paf);
void SetCurrentGlobalObject(std::shared_ptr<Object> obj);
bool IsObjectExtracted(std::shared_ptr<Object> obj);
void QueueExtractedObject(std::shared_ptr<Object> obj);
void CleanObjectQueue();
void SetCurrentGlobalCharacter(std::shared_ptr<Character> ch);
bool CharacterDiedRecently(std::shared_ptr<Character> ch);
void QueueExtractedCharacter(std::shared_ptr<Character> ch, bool extract);
void CleanCharacterQueue(void);
void AddTimerToCharacter(std::shared_ptr<Character> ch, short type, short count, CmdFun *fun, int value);
std::shared_ptr<Timer> GetTimerPointer(std::shared_ptr<Character> ch, short type);
short GetTimer(std::shared_ptr<Character> ch, short type);
void ExtractTimer(std::shared_ptr<Character> ch, std::shared_ptr<Timer> timer);
void RemoveTimer(std::shared_ptr<Character> ch, short type);
bool InSoftRange(std::shared_ptr<Character> ch, std::shared_ptr<Area> tarea);
bool InHardRange(std::shared_ptr<Character> ch, std::shared_ptr<Area> tarea);
bool Chance(std::shared_ptr<Character> ch, short percent);
std::shared_ptr<Object> CopyObject(std::shared_ptr<Object> obj);
void SplitGroupedObject(std::shared_ptr<Object> obj, int num);
void SeparateOneObjectFromGroup(std::shared_ptr<Object> obj);
bool EmptyObjectContents(std::shared_ptr<Object> obj, std::shared_ptr<Object> destobj, std::shared_ptr<Room> destroom);
std::shared_ptr<Object> FindObject(std::shared_ptr<Character> ch, std::string argument, bool carryonly);
void BoostEconomy(std::shared_ptr<Area> tarea, int gold);
void LowerEconomy(std::shared_ptr<Area> tarea, int gold);
void EconomizeMobileGold(std::shared_ptr<Character> mob);
bool EconomyHas(std::shared_ptr<Area> tarea, int gold);
int CountCharactersOnObject(std::shared_ptr<Object> obj);
std::string GetRoomName(std::shared_ptr<Room> room);
std::string GetRoomDescription(std::shared_ptr<Room> room);
bool CheckRoomFlag(std::shared_ptr<Room> room, size_t flag);

/* interp.c */
bool CheckPosition(std::shared_ptr<Character> ch, PositionType position);
void Interpret(std::shared_ptr<Character> ch, std::string argument);
void SendTimer(std::shared_ptr<timerset> vtime, std::shared_ptr<Character> ch);
void UpdateNumberOfTimesUsed(timeval *time_used, std::shared_ptr<timerset> userec);

/* magic.c */
int ModifySavingThrowBasedOnResistance(std::shared_ptr<Character> ch, int save_chance, int ris);
void SuccessfulCasting(std::shared_ptr<Skill> skill, std::shared_ptr<Character> ch,
                       std::shared_ptr<Character> victim, std::shared_ptr<Object> obj);
void FailedCasting(std::shared_ptr<Skill> skill, std::shared_ptr<Character> ch,
                   std::shared_ptr<Character> victim, std::shared_ptr<Object> obj);
bool IsImmuneToDamageType(std::shared_ptr<Character> ch, short damtype);
bool CheckSavingThrow(int sn, int level, std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
void ImmuneCasting(std::shared_ptr<Skill> skill, std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, std::shared_ptr<Object> obj);
Vo LocateSpellTargets(std::shared_ptr<Character> ch, const std::string &arg,
                      int sn, std::shared_ptr<Character> *victim, std::shared_ptr<Object> *obj);
int FindSpell(std::shared_ptr<Character> ch, const std::string &name, bool know);
bool SaveVsPoisonDeath(int level, std::shared_ptr<Character> victim);
bool SaveVsWands(int level, std::shared_ptr<Character> victim);
bool SaveVsParalyze(int level, std::shared_ptr<Character> victim);
bool SaveVsBreath(int level, std::shared_ptr<Character> victim);
bool SaveVsSpellStaff(int level, std::shared_ptr<Character> victim);
ch_ret CastSpellWithObject(int sn, int level, std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, std::shared_ptr<Object> obj);
int ParseDice(std::shared_ptr<Character> ch, int level, const std::string &exp);

/* save.c */
void SaveClone(std::shared_ptr<Character> ch);
void SetAlarm(long seconds);
void WriteObject(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, FILE *fp,
                 int iNest, short os_type);
void ReadObject(std::shared_ptr<Character> ch, FILE *fp, short os_type);
void DeEquipCharacter(std::shared_ptr<Character> ch);
void ReEquipCharacter(std::shared_ptr<Character> ch);
void SaveStoreroom(std::shared_ptr<Room> room);
void LoadStorerooms();
void LoadCorpses();
void WriteCorpses(std::shared_ptr<Character> ch, std::string name);
void SaveHome(std::shared_ptr<Character> ch);

/* special.c */
SpecFun *SpecialLookup(const std::string &name);
std::string LookupSpecial(SpecFun *special);

/* tables.c */
SpellFun *GetSpellFunction(const std::string &name);
CmdFun *GetSkillFunction(const std::string &name);

/* update.c */
void AdvanceLevel(std::shared_ptr<Character> ch, int ability);
void GainXP(std::shared_ptr<Character> ch, short ability, long gain);
long LoseXP(std::shared_ptr<Character> ch, short ability, long loss);
void GainCondition(std::shared_ptr<Character> ch, int iCond, int value);
void UpdateHandler(void);
void RebootCheck(time_t reset);
void RemovePortal(std::shared_ptr<Object> portal);
int GetMaxAbilityLevel(std::shared_ptr<Character> ch, int ability);

/* newscore.c */
const char *GetCharacterRace(std::shared_ptr<Character> ch);

#define GET_BETTED_ON(ch)    ((ch)->BettedOn)
#define GET_BET_AMT(ch) ((ch)->BetAmount)
#define IN_ARENA(ch)            (IsBitSet((ch)->InRoom->Flags, ROOM_ARENA))

#endif /* include guard */
