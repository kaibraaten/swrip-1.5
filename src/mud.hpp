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
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <climits>
#include <utility/utility.hpp>

#ifdef HAVE_ZLIB
#include <zlib.h>
#endif

#include <cmath>

#include "types.hpp"
#include "constants.hpp"

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
    int AffectedBy = 0;
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
    int AffectedBy = 0;
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
    Character *Who = nullptr;
};

class Fight
{
public:
    Character *Who = nullptr;
    long Xp = 0;
    short Align = 0;
    short Duration = 0;
    short TimesKilled = 0;
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
    Object  *Item = nullptr;   /* a pointer to the item */
    Character *Seller = nullptr; /* a pointer to the seller - which may NOT quit */
    Character *Buyer = nullptr;  /* a pointer to the buyer - which may NOT quit */
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
extern HourMinSec * set_boot_time;
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

extern const std::array<const char * const, MAX_ABILITY> AbilityName;
extern const std::array<const char * const, MAX_SPACEOBJECT_TYPE> SpaceobjectTypeName;
extern const std::array<const short, SECT_MAX> MovementLoss;
extern const std::array<const char * const, MAX_WEAR> WhereName;
extern const std::array<int, MAX_DIR + 1> TrapDoor;
extern const char * const SectorNames[][2];
extern const int SentTotal[];
extern const char * const RoomSents[][25];
extern const std::array<const char * const, MAX_BIT> RoomFlags;
extern const std::array<const char * const, MAX_BIT> WearFlags;
extern const std::array<const char * const, MAX_BIT> ObjectFlags;
extern const std::array<const char * const, MAX_BIT> MobFlags;
extern const std::array<const char * const, MAX_BIT> AffectFlags;
extern const std::array<const char * const, MAX_BIT> WantedFlags;
extern const std::array<const char * const, MAX_BIT> PlanetFlags;
extern const std::array<const char * const, MAX_BIT> PlayerFlags;
extern const std::array<const char * const, MAX_BIT> TrapFlags;
extern const std::array<const char * const, MAX_BIT> RisFlags;
extern const std::array<const char * const, MAX_BIT> TriggerFlags;
extern const std::array<const char * const, MAX_BIT> DefenseFlags;
extern const std::array<const char * const, MAX_BIT> AttackFlags;
extern const std::array<const char * const, MAX_BIT> AreaFlags;
extern const std::array<const char * const, Flag::MAX> ExitFlags;
extern const std::array<const char * const, MAX_BIT> mprog_flags;
extern const std::array<const char * const, MAX_BIT> SaveFlags;
extern const std::array<const char * const, MAX_BIT> ShipFlags;

extern const std::array<const char * const, MAX_ITEM_TYPE + 1> ObjectTypes;
extern const std::array<const char * const, MAX_APPLY_TYPE> AffectTypes;
extern const std::array<const char * const, MAX_NPC_RACE> NpcRace;
extern const std::array<const char * const, MAX_WEAR - 1> WearLocations;
extern const std::array<int, LANG_MAX + 1> LanguageArray;
extern const std::array<const char * const, LANG_MAX + 1> LanguageNames;

extern const std::array<const char * const, MAX_POSITION> PositionName;
extern const std::array<const char * const, MAX_LOG> CmdLogName;
extern const std::array<const char * const, MAX_SHIP_TYPE> ShipTypes;
extern const std::array<const char * const, MAX_SHIP_CLASS> ShipClasses;
extern const std::array<const char * const, MAX_BIT> ChannelNames;
extern const std::array<const char * const, MAX_CONDS> ConditionNames;
extern const std::array<const char * const, MAX_SEX> SexNames;

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
extern int top_area;
extern int top_ed;
extern int top_exit;
extern int top_mob_index;
extern int top_obj_index;
extern int top_reset;
extern int top_room;
extern int top_repair;
extern int cur_qobjs;
extern int cur_qchars;
extern long long high_galaxy_cash;
extern long long low_galaxy_cash;

extern Character       *cur_char;
extern std::shared_ptr<Room>             cur_room;
extern bool             cur_char_died;
extern ch_ret           global_retcode;

extern int              cur_obj;
extern int              cur_obj_serial;
extern bool             cur_obj_extracted;
extern obj_ret          global_objcode;

extern Character       *FirstCharacter;
extern Character       *LastCharacter;

extern std::shared_ptr<TeleportData> FirstTeleport;
extern std::shared_ptr<TeleportData> LastTeleport;
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
extern std::unique_ptr<Auction> OngoingAuction;
extern std::shared_ptr<ProtoMobile> MobIndexHash[MAX_KEY_HASH];
extern std::shared_ptr<ProtoObject> ObjectIndexHash[MAX_KEY_HASH];
extern std::shared_ptr<Room> RoomIndexHash[MAX_KEY_HASH];

/*
 * Command functions.
 */
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
DECLARE_CMD_FUN(do_buyhome);
DECLARE_CMD_FUN(do_renameship);
DECLARE_CMD_FUN(do_buzz);
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
DECLARE_CMD_FUN(do_addresident);
DECLARE_CMD_FUN(do_rempilot);
DECLARE_CMD_FUN(do_remresident);
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
DECLARE_CMD_FUN(do_invite);
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
DECLARE_CMD_FUN(do_sellhome);
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
std::string DrunkSpeech(const std::string &argument, Character *ch);
void TalkChannel(Character *ch, const std::string &text,
    int channel, const std::string &verb);
bool IsFollowingInCircle(const Character *ch, const Character *victim);
void StartFollowing(Character *ch, Character *master);
void StopFollowing(Character *ch);
void DieFollower(Character *ch);
bool IsInSameGroup(const Character *ach, const Character *bch);
void ToChannel(const std::string &argument, int channel,
    const std::string &verb, short level);
void TalkAuction(const std::string &argument);
bool CharacterKnowsLanguage(const Character *ch, int language, const Character *cch);
bool CharacterCanLearnLanguage(const Character *ch, int language);
int CountLanguages(int languages);

/* act_info.c */
bool RaceIsAvailableToPlayers(const Race *race);
int GetRaceFromName(const std::string &arg);
int GetClassFromName(const std::string &arg);
void ShowCharacterCondition(const Character *ch, const Character *victim);
std::string FormatObjectToCharacter(const Object *obj, const Character *ch, bool fShort);
void ShowObjectListToCharacter(const std::list<Object*> &list, Character *ch,
    bool fShort, bool fShowNothing);
/* act_move.c */
void SetBExitFlag(std::shared_ptr<Exit> pexit, size_t flag);
void RemoveBExitFlag(std::shared_ptr<Exit> pexit, size_t flag);
std::shared_ptr<Room> GenerateExit(std::shared_ptr<Room> in_room, std::shared_ptr<Exit> &pexit);
void ClearVirtualRooms();
std::shared_ptr<Exit> FindDoor(Character *ch, const std::string &arg, bool quiet);
std::shared_ptr<Exit> GetExit(std::shared_ptr<Room> room, DirectionType dir);
std::shared_ptr<Exit> GetExitTo(std::shared_ptr<Room> room, DirectionType dir, vnum_t vnum);
std::shared_ptr<Exit> GetExitNumber(std::shared_ptr<Room> room, short count);
ch_ret MoveCharacter(Character *ch, std::shared_ptr<Exit> pexit, int fall = 0);
void Teleport(Character *ch, vnum_t room, int flags);
bool CharacterFallIfNoFloor(Character *ch, int fall);

/* act_obj.c */
std::string GetObjectShortDescription(const Object *obj);
bool RemoveObject(Character *ch, WearLocation iWear, bool fReplace);
obj_ret DamageObject(Object *obj);
short GetObjectResistance(const Object *obj);
void ObjectFallIfNoFloor(Object *obj, bool through);

/* act_wiz.c */
std::shared_ptr<Room> FindLocation(const Character *ch, const std::string &arg);
void EchoToRoom(short AT_COLOR, std::shared_ptr<Room> room, const std::string &argument);
void EchoToRoomNoNewline(int ecolor, std::shared_ptr<Room> room, const std::string &argument);
void RealEchoToRoom(short color, std::shared_ptr<Room> room, const std::string &text, bool sendNewline);
void EchoToAll(short AT_COLOR, const std::string &argument, short tar);
void GenerateRebootString();

/* const.c */
std::string FlagString(const std::bitset<Flag::MAX> &flags,
    const std::array<const char * const, Flag::MAX> &nameArray);
std::string FlagString(int bitvector,
    const std::array<const char * const, Flag::MAX> &nameArray);
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

/* nanny.c */
void Nanny(std::shared_ptr<Descriptor> d, std::string argument);

/* comm.cpp */
void DisplayPrompt(Descriptor *d);
void CloseDescriptor(std::shared_ptr<Descriptor> dclose, bool force);
bool WriteToDescriptor(Descriptor *desc, const std::string &txt, int length = 0);
void SetCharacterColor(short AType, const Character *ch);
void Act(short AType, const std::string &format, Character *ch,
    const void *arg1, const void *arg2, int type);
socket_t InitializeSocket(unsigned short port);
void FreeDescriptor(std::shared_ptr<Descriptor> d);

/* comments.c */
void ReadComment(Character *ch, FILE *fp);
void WriteComments(const Character *ch, FILE *fp);

/* db.c */
void ShutdownMud(const std::string &reason);
void ShowVnums(const Character *ch, vnum_t low, vnum_t high, bool proto, bool shownl,
    const std::string &loadst, const std::string &notloadst);
void AppendFile(const Character *ch, const std::string &file, const std::string &str);
void ShowFile(const Character *ch, const std::string &filename);
void BootDatabase(bool fCopyover);
void AddCharacter(Character *ch);
Character *AllocateMobile(std::shared_ptr<ProtoMobile> pMobIndex);
Character *CreateMobile(std::shared_ptr<ProtoMobile> pMobIndex);
Object *CreateObject(std::shared_ptr<ProtoObject> pObjIndex, int level);
Object *AllocateObject(std::shared_ptr<ProtoObject> pObjIndex, int level);
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
void MakeWizlist();
bool DeleteRoom(std::shared_ptr<Room> room);
bool DeleteObject(std::shared_ptr<ProtoObject> obj);
bool DeleteMobile(std::shared_ptr<ProtoMobile> mob);

/* build.c */
void EditMobProg(Character *ch, std::shared_ptr<MPROG_DATA> mprg, int mptype, const std::string &argument);
void EditRoomProg(Character *ch, std::shared_ptr<MPROG_DATA> mprg, int mptype, const std::string &argument);
void EditObjProg(Character *ch, std::shared_ptr<MPROG_DATA> mprg, int mptype, const std::string &argument);
void WriteAreaList();

bool CanModifyRoom(const Character *ch, std::shared_ptr<Room> room);
bool CanModifyObject(const Character *ch, const Object *obj);
bool CanModifyCharacter(const Character *ch, const Character *mob);

bool CanMedit(const Character *ch, std::shared_ptr<ProtoMobile> mob);
void FreeReset(std::shared_ptr<Area> are, std::shared_ptr<Reset> res);
std::shared_ptr<ExtraDescription> SetRExtra(std::shared_ptr<Room> room, const std::string &keywords);
bool DelRExtra(std::shared_ptr<Room> room, const std::string &keywords);
std::shared_ptr<ExtraDescription> SetOExtra(Object *obj, const std::string &keywords);
bool DelOExtra(Object *obj, const std::string &keywords);
std::shared_ptr<ExtraDescription> SetOExtraProto(std::shared_ptr<ProtoObject> obj, const std::string &keywords);
bool DelOExtraProto(std::shared_ptr<ProtoObject> obj, const std::string &keywords);
std::shared_ptr<Reset> ParseReset(std::shared_ptr<Area> tarea, std::string argument, const Character *ch);

/* fight.c */
ch_ret HitOnce(Character *ch, Character *victim, int dt);
long ComputeXP(const Character *gch, const Character *victim);
void ViolenceUpdate(void);
ch_ret HitMultipleTimes(Character *ch, Character *victim, int dt);
short ModifyDamageBasedOnResistance(const Character *ch, short dam, int ris);
ch_ret InflictDamage(Character *ch, Character *victim, int dam, int dt);
void UpdatePosition(Character *victim);
void StartFighting(Character *ch, Character *victim);
void StopFighting(Character *ch, bool fBoth);
void FreeFight(Character *ch);
Character *GetFightingOpponent(const Character *ch);
void StopHunting(Character *ch);
void StopHating(Character *ch);
void StopFearing(Character *ch);
void StartHunting(Character *ch, Character *victim);
void StartHating(Character *ch, Character *victim);
void StartFearing(Character *ch, Character *victim);
bool IsHunting(const Character *ch, const Character *victim);
bool IsHating(const Character *ch, const Character *victim);
bool IsFearing(const Character *ch, const Character *victim);
bool IsSafe(const Character *ch, const Character *victim);
bool CanLootVictim(const Character *ch, const Character *victim);
void RawKill(Character *killer, Character *victim);

/* makeobjs.c */
void MakeCorpse(Character *ch);
void MakeBloodstain(Character *ch);
void MakeScraps(Object *obj);
void MakeFire(std::shared_ptr<Room> in_room, short timer);
Object *MakeTrap(int v0, int v1, int v2, int v3);
Object *CreateMoney(int amount);

/* mapper.c */
void DrawMap(const Character *ch, const std::string &desc);

/* misc.c */
bool IsValidLanguage(int language);
void PullOrPush(Character *ch, Object *obj, bool pull);
void ActionDescription(Character *ch, Object *obj, void *vo);
std::string FormatDate(const time_t*);

/* mud_comm.c */
Character *GetCharacterInRoomMudProg(Character *ch, std::string argument);
int GetColor(const std::string &argument);
const char *MobProgTypeToName(int type);
int MobProgNameToType(const std::string &name);

/* skills.c */
bool CheckParry(Character *ch, Character *victim);
bool CheckDodge(Character *ch, Character *victim);
bool CheckGrip(Character *ch, Character *victim);
void Disarm(Character *ch, Character *victim);
void Trip(Character *ch, Character *victim);

/* handler.c */
bool CharacterCanTakePrototype(const Character *ch);
void Explode(Object *obj);
long GetRequiredXpForLevel(short level);
void ModifyAffect(Character *ch, std::shared_ptr<Affect> paf, bool fAdd);
void AffectToCharacter(Character *ch, std::shared_ptr<Affect> paf);
void RemoveAffect(Character *ch, std::shared_ptr<Affect> paf);
void StripAffect(Character *ch, int sn);
void JoinAffect(Character *ch, std::shared_ptr<Affect> paf);
void CharacterFromRoom(Character *ch);
void CharacterToRoom(Character *ch, std::shared_ptr<Room> pRoomIndex);
Object *ObjectToCharacter(Object *obj, Character *ch);
void ObjectFromCharacter(Object *obj);
int GetObjectArmorClass(const Object *obj, int iWear);
int CountOccurrencesOfObjectInList(std::shared_ptr<ProtoObject> protoobj, const std::list<Object*> &list);
void ObjectFromRoom(Object *obj);
Object *ObjectToRoom(Object *obj, std::shared_ptr<Room> pRoomIndex);
Object *ObjectToObject(Object *obj, Object *obj_to);
void ObjectFromObject(Object *obj);
void ExtractObject(Object *obj);
void ExtractExit(std::shared_ptr<Room> room, std::shared_ptr<Exit> pexit);
void CleanRoom(std::shared_ptr<Room> room);
void CleanObject(std::shared_ptr<ProtoObject> obj);
void CleanMobile(std::shared_ptr<ProtoMobile> mob);
void ExtractCharacter(Character *ch, bool fPull);
Character *GetCharacterInRoom(const Character *ch, std::string argument);
Character *GetCharacterAnywhere(const Character *ch, std::string argument);
Object *GetInstanceOfObject(std::shared_ptr<ProtoObject> pObjIndexData);
Object *GetObjectInList(const Character *ch, std::string objName,
    const std::list<Object*> &list);
Object *GetObjectInListReverse(const Character *ch, std::string objName,
    const std::list<Object*> &list);
Object *GetObjectHere(const Character *ch, std::string argument);
Object *GetObjectAnywhere(const Character *ch, std::string argument);
int GetObjectCount(const Object *obj);
int GetObjectWeight(const Object *obj);
bool IsRoomDark(std::shared_ptr<Room> pRoomIndex);
bool IsRoomPrivate(const Character *ch, std::shared_ptr<Room> pRoomIndex);
const char *GetItemTypeName(const Object *obj);
const char *GetAffectLocationName(int location);
ch_ret CheckObjectForTrap(Character *ch, const Object *obj, int flag);
ch_ret CheckRoomForTraps(Character *ch, int flag);
bool IsObjectTrapped(const Object *obj);
Object *GetTrap(const Object *obj);
ch_ret SpringTrap(Character *ch, Object *obj);
void ShowAffectToCharacter(const Character *ch, std::shared_ptr<Affect> paf);
void SetCurrentGlobalObject(Object *obj);
bool IsObjectExtracted(const Object *obj);
void QueueExtractedObject(Object *obj);
void CleanObjectQueue(void);
void SetCurrentGlobalCharacter(Character *ch);
bool CharacterDiedRecently(const Character *ch);
void QueueExtractedCharacter(Character *ch, bool extract);
void CleanCharacterQueue(void);
void AddTimerToCharacter(Character *ch, short type, short count, CmdFun *fun, int value);
std::shared_ptr<Timer> GetTimerPointer(const Character *ch, short type);
short GetTimer(const Character *ch, short type);
void ExtractTimer(Character *ch, std::shared_ptr<Timer> timer);
void RemoveTimer(Character *ch, short type);
bool InSoftRange(const Character *ch, std::shared_ptr<Area> tarea);
bool InHardRange(const Character *ch, std::shared_ptr<Area> tarea);
bool Chance(const Character *ch, short percent);
Object *CopyObject(const Object *obj);
void SplitGroupedObject(Object *obj, int num);
void SeparateOneObjectFromGroup(Object *obj);
bool EmptyObjectContents(Object *obj, Object *destobj, std::shared_ptr<Room> destroom);
Object *FindObject(Character *ch, std::string argument, bool carryonly);
void BoostEconomy(std::shared_ptr<Area> tarea, int gold);
void LowerEconomy(std::shared_ptr<Area> tarea, int gold);
void EconomizeMobileGold(Character *mob);
bool EconomyHas(std::shared_ptr<Area> tarea, int gold);
int CountCharactersOnObject(const Object *obj);

/* interp.c */
bool CheckPosition(const Character *ch, PositionType position);
void Interpret(Character *ch, std::string argument);
void SendTimer(std::shared_ptr<timerset> vtime, Character *ch);
void UpdateNumberOfTimesUsed(timeval *time_used, std::shared_ptr<timerset> userec);

/* magic.c */
int ModifySavingThrowBasedOnResistance(const Character *ch, int save_chance, int ris);
void SuccessfulCasting(std::shared_ptr<Skill> skill, Character *ch,
    Character *victim, Object *obj);
void FailedCasting(std::shared_ptr<Skill> skill, Character *ch,
    Character *victim, Object *obj);
bool IsImmuneToDamageType(const Character *ch, short damtype);
bool CheckSavingThrow(int sn, int level, const Character *ch, const Character *victim);
void ImmuneCasting(std::shared_ptr<Skill> skill, Character *ch, Character *victim, Object *obj);
void *LocateSpellTargets(Character *ch, const std::string &arg,
    int sn, Character **victim, Object **obj);
int FindSpell(const Character *ch, const std::string &name, bool know);
bool SaveVsPoisonDeath(int level, const Character *victim);
bool SaveVsWands(int level, const Character *victim);
bool SaveVsParalyze(int level, const Character *victim);
bool SaveVsBreath(int level, const Character *victim);
bool SaveVsSpellStaff(int level, const Character *victim);
ch_ret CastSpellWithObject(int sn, int level, Character *ch, Character *victim, Object *obj);
int ParseDice(const Character *ch, int level, const std::string &exp);

/* save.c */
void SaveClone(Character *ch);
void SetAlarm(long seconds);
void WriteObject(const Character *ch, const Object *obj, FILE *fp,
    int iNest, short os_type);
void ReadObject(Character *ch, FILE *fp, short os_type);
void DeEquipCharacter(Character *ch);
void ReEquipCharacter(Character *ch);
void SaveHome(Character *ch);
void SaveStoreroom(std::shared_ptr<Room> room);
void LoadStorerooms();
void LoadCorpses();
void WriteCorpses(const Character *ch, std::string name);

/* special.c */
SpecFun *SpecialLookup(const std::string &name);
std::string LookupSpecial(SpecFun *special);

/* tables.c */
SpellFun *GetSpellFunction(const std::string &name);
CmdFun *GetSkillFunction(const std::string &name);

/* update.c */
void AdvanceLevel(Character *ch, int ability);
void GainXP(Character *ch, short ability, long gain);
long LoseXP(Character *ch, short ability, long loss);
void GainCondition(Character *ch, int iCond, int value);
void UpdateHandler(void);
void RebootCheck(time_t reset);
void RemovePortal(Object *portal);
int GetMaxAbilityLevel(const Character *ch, int ability);

/* newscore.c */
const char *GetCharacterRace(const Character *ch);

#define GET_BETTED_ON(ch)    ((ch)->BettedOn)
#define GET_BET_AMT(ch) ((ch)->BetAmount)
#define IN_ARENA(ch)            (IsBitSet((ch)->InRoom->Flags, ROOM_ARENA))

#endif /* include guard */
