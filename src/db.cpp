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

#include <filesystem>
namespace fs = std::filesystem;

#include <fstream>
#include <cassert>
#include <ctime>
#include <cstring>
#include <cctype>
#include <utility/random.hpp>
#include "mud.hpp"
#include "arena.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "reset.hpp"
#include "shop.hpp"
#include "command.hpp"
#include "skill.hpp"
#include "script.hpp"
#include "area.hpp"
#include "log.hpp"
#include "pcdata.hpp"
#include "repos/badnamerepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/shiprepository.hpp"
#include "repos/helprepository.hpp"
#include "repos/boardrepository.hpp"
#include "repos/banrepository.hpp"
#include "repos/bountyrepository.hpp"
#include "repos/clanrepository.hpp"
#include "repos/planetrepository.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "repos/socialrepository.hpp"
#include "repos/shuttlerepository.hpp"
#include "repos/shoprepository.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/objectrepository.hpp"
#include "repos/skillrepository.hpp"
#include "repos/arearepository.hpp"
#include "repos/storeroomrepository.hpp"
#include "repos/vendorrepository.hpp"
#include "repos/homerepository.hpp"
#include "repos/macrorepository.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "exit.hpp"

time_t last_restore_all_time = 0;

std::shared_ptr<TeleportData> FirstTeleport;
std::shared_ptr<TeleportData> LastTeleport;

std::shared_ptr<Character> FirstCharacter;
std::shared_ptr<Character> LastCharacter;

TimeInfo time_info;
Weather weather_info;

int cur_qobjs = 0;
int cur_qchars = 0;
int nummobsloaded = 0;
int numobjsloaded = 0;
int physicalobjects = 0;

std::unique_ptr<Auction> OngoingAuction;

/* criminals */
short gsn_torture;
short gsn_disguise;
short gsn_cloak;
short gsn_beg;
short gsn_pickshiplock;
short gsn_hijack;

/* soldiers and officers */
short gsn_reinforcements;
short gsn_postguard;
short gsn_mine;
short gsn_grenades;
short gsn_first_aid;
short gsn_snipe;
short gsn_throw;

short gsn_addpatrol;
short gsn_eliteguard;
short gsn_specialforces;
short gsn_jail;
short gsn_smalltalk;
short gsn_propaganda;
short gsn_bribe;
short gsn_seduce;
short gsn_masspropaganda;
short gsn_gather_intelligence;
short gsn_bind;

/* pilots and smugglers */
short gsn_starfighters;
short gsn_midships;
short gsn_capitalships;
short gsn_weaponsystems;
short gsn_navigation;
short gsn_shipsystems;
short gsn_tractorbeams;
short gsn_shipmaintenance;
short gsn_sabotage;
short gsn_spacecombat;
short gsn_spacecombat2;
short gsn_spacecombat3;
short gsn_shipdocking;
short gsn_jumpvector;
short gsn_speeders;
short gsn_speedercombat;

/* player building skills */
short gsn_lightsaber_crafting;
short gsn_spice_refining;
short gsn_makeblade;
short gsn_makeblaster;
short gsn_makebowcaster;
short gsn_makeglowrod;
short gsn_makecomlink;
short gsn_makegrenade;
short gsn_makelandmine;
short gsn_makearmor;
short gsn_makeshield;
short gsn_makecontainer;
short gsn_makejewelry;
short gsn_fake_signal;
short gsn_slicing;

/* weaponry */
short gsn_blasters;
short gsn_bowcasters;
short gsn_force_pikes;
short gsn_lightsabers;
short gsn_vibro_blades;
short gsn_flexible_arms;
short gsn_talonous_arms;
short gsn_bludgeons;

/* thief */
short gsn_detrap;
short gsn_backstab;
short gsn_circle;
short gsn_dodge;
short gsn_hide;
short gsn_peek;
short gsn_pick_lock;
short gsn_sneak;
short gsn_steal;
short gsn_gouge;
short gsn_poison_weapon;

/* thief & warrior */
short gsn_disarm;
short gsn_enhanced_damage;
short gsn_kick;
short gsn_parry;
short gsn_rescue;
short gsn_second_attack;
short gsn_third_attack;
short gsn_fourth_attack;
short gsn_fifth_attack;
short gsn_dual_wield;
short gsn_punch;
short gsn_bash;
short gsn_stun;
short gsn_bashdoor;
short gsn_skin;
short gsn_cutdoor;
short gsn_grip;
short gsn_berserk;
short gsn_hitall;

/* other   */
short gsn_aid;
short gsn_track;
short gsn_search;
short gsn_dig;
short gsn_mount;
short gsn_study;
short gsn_climb;
short gsn_scan;

/* spells */
short gsn_aqua_breath;
short gsn_blindness;
short gsn_charm_person;
short gsn_invis;
short gsn_mass_invis;
short gsn_poison;
short gsn_sleep;
short gsn_possess;
short gsn_fireball;
short gsn_lightning_bolt;

/* languages */
short gsn_common;
short gsn_falleen;
short gsn_devaronese;
short gsn_antarian;
short gsn_ithorese;
short gsn_wookiee;
short gsn_twilek;
short gsn_rodian;
short gsn_hutt;
short gsn_mon_calamari;
short gsn_noghri;
short gsn_gamorrean;
short gsn_jawa;
short gsn_adarian;
short gsn_ewok;
short gsn_verpine;
short gsn_defel;
short gsn_trandoshan;
short gsn_chadra_fan;
short gsn_quarren;
short gsn_sullustan;
short gsn_barabel;
short gsn_firrerreo;
short gsn_bothan;
short gsn_coynite;
short gsn_duros;
short gsn_gand;
short gsn_kubaz;
short gsn_togorian;
short gsn_yevethan;
short gsn_binary;

/* for searching */
short gsn_first_spell = 0;
short gsn_first_skill = 0;
short gsn_first_weapon = 0;
short gsn_first_tongue = 0;
short gsn_TopSN = 0;

/*
 * Locals.
 */
std::unordered_map<vnum_t, std::shared_ptr<ProtoMobile>> ProtoMobs;
std::unordered_map<vnum_t, std::shared_ptr<ProtoObject>> ProtoObjects;
std::shared_ptr<Room> RoomIndexHash[MAX_KEY_HASH];

int top_affect = 0;
int top_ed = 0;
int top_exit = 0;
int top_reset = 0;
int top_room = 0;
int top_vroom = 0;

/*
 * Semi-locals.
 */
bool fBootDb = false;
FILE *fpArea = nullptr;
std::string strArea;

/*
 * Local booting procedures.
 */
static void AllocateRepositories();
static void InitializeEconomy();
static void FixExits();
#if 0
static int ExitComparator(Exit **xit1, Exit **xit2);
#endif
static void SortExits(std::shared_ptr<Room> room);

void ShutdownMud(const std::string &reason)
{
    FILE *fp = fopen(SHUTDOWN_FILE, "a");

    if(fp != nullptr)
    {
        fprintf(fp, "%s\n", reason.c_str());
        fclose(fp);
    }
}

/*
 * Big mama top level function.
 */
void BootDatabase(bool fCopyOver)
{
    unlink(BOOTLOG_FILE);
    Log->Boot("---------------------[ Boot Log ]--------------------");

    Log->Boot("Allocating repositories");
    AllocateRepositories();

    Log->Boot("Loading SysData configuration");

    SysData.Load();

    Log->Boot("Loading commands");
    LoadCommands();

    Log->Boot("Loading socials");
    Socials->Load();

    Log->Boot("Loading skill table");
    LoadSkills();
    SortSkillTable();

    gsn_TopSN = TopSN;

    for(int x = 0; x < TopSN; x++)
    {
        if(!gsn_first_spell && SkillTable[x]->Type == SKILL_SPELL)
            gsn_first_spell = x;
        else if(!gsn_first_skill && SkillTable[x]->Type == SKILL_SKILL)
            gsn_first_skill = x;
        else if(!gsn_first_weapon && SkillTable[x]->Type == SKILL_WEAPON)
            gsn_first_weapon = x;
        else if(!gsn_first_tongue && SkillTable[x]->Type == SKILL_TONGUE)
            gsn_first_tongue = x;
    }

    Log->Boot("Loading herb table");
    LoadHerbs();

    Log->Boot("Making wizlist");
    MakeWizlist();

    fBootDb = true;
    SysData.MaxPlayersThisBoot = 0;

    cur_char = NULL;
    cur_obj = 0;
    cur_obj_serial = 0;
    cur_char_died = false;
    cur_obj_extracted = false;
    cur_room = NULL;
    quitting_char.reset();
    loading_char.reset();
    saving_char.reset();
    OngoingAuction = std::make_unique<Auction>();

    for(int wear = 0; wear < MAX_WEAR; wear++)
        for(int x = 0; x < MAX_LAYERS; x++)
            save_equipment[wear][x].reset();

    /*
     * Set time and weather.
     */
    Log->Boot("Setting time and weather");

    long lhour = (current_time - 650336715) / (PULSE_TICK / PULSE_PER_SECOND);
    time_info.Hour = lhour % 24;
    long lday = lhour / 24;
    time_info.Day = lday % 35;
    long lmonth = lday / 35;
    time_info.Month = lmonth % 17;
    time_info.Year = lmonth / 17;

    if(time_info.Hour < 5)
        weather_info.Sunlight = SUN_DARK;
    else if(time_info.Hour < 6)
        weather_info.Sunlight = SUN_RISE;
    else if(time_info.Hour < 19)
        weather_info.Sunlight = SUN_LIGHT;
    else if(time_info.Hour < 20)
        weather_info.Sunlight = SUN_SET;
    else
        weather_info.Sunlight = SUN_DARK;

    weather_info.Change = 0;
    weather_info.Mmhg = 960;

    if(time_info.Month >= 7 && time_info.Month <= 12)
        weather_info.Mmhg += GetRandomNumberFromRange(1, 50);
    else
        weather_info.Mmhg += GetRandomNumberFromRange(1, 80);

    if(weather_info.Mmhg <= 980)
        weather_info.Sky = SKY_LIGHTNING;
    else if(weather_info.Mmhg <= 1000)
        weather_info.Sky = SKY_RAINING;
    else if(weather_info.Mmhg <= 1020)
        weather_info.Sky = SKY_CLOUDY;
    else
        weather_info.Sky = SKY_CLOUDLESS;

    /*
     * Assign gsn's for skills which need them.
     */
    Log->Boot("Assigning gsn's");
    ASSIGN_GSN(gsn_cloak, "cloak");
    ASSIGN_GSN(gsn_cutdoor, "cutdoor");
    ASSIGN_GSN(gsn_bind, "bind");
    ASSIGN_GSN(gsn_slicing, "slicing");
    ASSIGN_GSN(gsn_addpatrol, "addpatrol");
    ASSIGN_GSN(gsn_eliteguard, "eliteguard");
    ASSIGN_GSN(gsn_gather_intelligence, "gatherintelligence");
    ASSIGN_GSN(gsn_specialforces, "specialforces");
    ASSIGN_GSN(gsn_jail, "jail");
    ASSIGN_GSN(gsn_smalltalk, "smalltalk");
    ASSIGN_GSN(gsn_propaganda, "propaganda");
    ASSIGN_GSN(gsn_bribe, "bribe");
    ASSIGN_GSN(gsn_seduce, "seduce");
    ASSIGN_GSN(gsn_masspropaganda, "masspropaganda");
    ASSIGN_GSN(gsn_beg, "beg");
    ASSIGN_GSN(gsn_hijack, "hijack");
    ASSIGN_GSN(gsn_makejewelry, "makejewelry");
    ASSIGN_GSN(gsn_grenades, "grenades");
    ASSIGN_GSN(gsn_makeblade, "makeblade");
    ASSIGN_GSN(gsn_makeblaster, "makeblaster");
    ASSIGN_GSN(gsn_makebowcaster, "makebowcaster");
    ASSIGN_GSN(gsn_makeglowrod, "makeglowrod");
    ASSIGN_GSN(gsn_makecomlink, "makecomlink");
    ASSIGN_GSN(gsn_makegrenade, "makegrenade");
    ASSIGN_GSN(gsn_makelandmine, "makelandmine");
    ASSIGN_GSN(gsn_makearmor, "makearmor");
    ASSIGN_GSN(gsn_makeshield, "makeshield");
    ASSIGN_GSN(gsn_makecontainer, "makecontainer");
    ASSIGN_GSN(gsn_reinforcements, "reinforcements");
    ASSIGN_GSN(gsn_postguard, "postguard");
    ASSIGN_GSN(gsn_torture, "torture");
    ASSIGN_GSN(gsn_throw, "throw");
    ASSIGN_GSN(gsn_snipe, "snipe");
    ASSIGN_GSN(gsn_disguise, "disguise");
    ASSIGN_GSN(gsn_mine, "mine");
    ASSIGN_GSN(gsn_first_aid, "firstaid");
    ASSIGN_GSN(gsn_lightsaber_crafting, "lightsaber crafting");
    ASSIGN_GSN(gsn_spice_refining, "spice refining");
    ASSIGN_GSN(gsn_spacecombat, "space combat 1");
    ASSIGN_GSN(gsn_spacecombat2, "space combat 2");
    ASSIGN_GSN(gsn_spacecombat3, "space combat 3");
    ASSIGN_GSN(gsn_speeders, "speeders");
    ASSIGN_GSN(gsn_speedercombat, "speeder combat");
    ASSIGN_GSN(gsn_weaponsystems, "weapon systems");
    ASSIGN_GSN(gsn_starfighters, "starfighters");
    ASSIGN_GSN(gsn_navigation, "navigation");
    ASSIGN_GSN(gsn_shipsystems, "ship systems");
    ASSIGN_GSN(gsn_midships, "midships");
    ASSIGN_GSN(gsn_capitalships, "capital ships");
    ASSIGN_GSN(gsn_tractorbeams, "tractor beams");
    ASSIGN_GSN(gsn_shipmaintenance, "ship maintenance");
    ASSIGN_GSN(gsn_sabotage, "sabotage");
    ASSIGN_GSN(gsn_jumpvector, "jumpvector");
    ASSIGN_GSN(gsn_fake_signal, "fake signal");
    ASSIGN_GSN(gsn_blasters, "blasters");
    ASSIGN_GSN(gsn_bowcasters, "bowcasters");
    ASSIGN_GSN(gsn_force_pikes, "force pikes");
    ASSIGN_GSN(gsn_lightsabers, "lightsabers");
    ASSIGN_GSN(gsn_vibro_blades, "vibro-blades");
    ASSIGN_GSN(gsn_flexible_arms, "flexible arms");
    ASSIGN_GSN(gsn_talonous_arms, "talonous arms");
    ASSIGN_GSN(gsn_bludgeons, "bludgeons");
    ASSIGN_GSN(gsn_detrap, "detrap");
    ASSIGN_GSN(gsn_backstab, "backstab");
    ASSIGN_GSN(gsn_circle, "circle");
    ASSIGN_GSN(gsn_dodge, "dodge");
    ASSIGN_GSN(gsn_steal, "lift");
    ASSIGN_GSN(gsn_hide, "stealth");
    ASSIGN_GSN(gsn_peek, "peek");
    ASSIGN_GSN(gsn_pick_lock, "pick lock");
    ASSIGN_GSN(gsn_pickshiplock, "pick ship lock");
    ASSIGN_GSN(gsn_sneak, "sneak");
    ASSIGN_GSN(gsn_gouge, "gouge");
    ASSIGN_GSN(gsn_poison_weapon, "poisonweapon");
    ASSIGN_GSN(gsn_disarm, "disarm");
    ASSIGN_GSN(gsn_enhanced_damage, "enhanced damage");
    ASSIGN_GSN(gsn_kick, "kick");
    ASSIGN_GSN(gsn_parry, "parry");
    ASSIGN_GSN(gsn_rescue, "rescue");
    ASSIGN_GSN(gsn_second_attack, "second attack");
    ASSIGN_GSN(gsn_third_attack, "third attack");
    ASSIGN_GSN(gsn_fourth_attack, "fourth attack");
    ASSIGN_GSN(gsn_fifth_attack, "fifth attack");
    ASSIGN_GSN(gsn_dual_wield, "dual wield");
    ASSIGN_GSN(gsn_punch, "punch");
    ASSIGN_GSN(gsn_bash, "bash");
    ASSIGN_GSN(gsn_stun, "stun");
    ASSIGN_GSN(gsn_skin, "skin");
    ASSIGN_GSN(gsn_bashdoor, "doorbash");
    ASSIGN_GSN(gsn_grip, "grip");
    ASSIGN_GSN(gsn_berserk, "berserk");
    ASSIGN_GSN(gsn_hitall, "hitall");
    ASSIGN_GSN(gsn_aid, "aid");
    ASSIGN_GSN(gsn_track, "track");
    ASSIGN_GSN(gsn_search, "search");
    ASSIGN_GSN(gsn_dig, "dig");
    ASSIGN_GSN(gsn_mount, "mount");
    ASSIGN_GSN(gsn_study, "study");
    ASSIGN_GSN(gsn_climb, "climb");
    ASSIGN_GSN(gsn_scan, "scan");
    ASSIGN_GSN(gsn_fireball, "fireball");
    ASSIGN_GSN(gsn_lightning_bolt, "force bolt");
    ASSIGN_GSN(gsn_aqua_breath, "aqua breath");
    ASSIGN_GSN(gsn_blindness, "blindness");
    ASSIGN_GSN(gsn_charm_person, "affect mind");
    ASSIGN_GSN(gsn_invis, "mask");
    ASSIGN_GSN(gsn_mass_invis, "group masking");
    ASSIGN_GSN(gsn_poison, "poison");
    ASSIGN_GSN(gsn_sleep, "sleep");
    ASSIGN_GSN(gsn_possess, "possess");

    ASSIGN_GSN(gsn_falleen, "falleen");
    ASSIGN_GSN(gsn_common, "basic");
    ASSIGN_GSN(gsn_binary, "binary");
    ASSIGN_GSN(gsn_antarian, "antarian");
    ASSIGN_GSN(gsn_wookiee, "shyriiwook");
    ASSIGN_GSN(gsn_twilek, "twileki");
    ASSIGN_GSN(gsn_ithorese, "ithorese");
    ASSIGN_GSN(gsn_devaronese, "devaronese");
    ASSIGN_GSN(gsn_rodian, "rodese");
    ASSIGN_GSN(gsn_hutt, "huttese");
    ASSIGN_GSN(gsn_mon_calamari, "mon calamarian");
    ASSIGN_GSN(gsn_noghri, "shistavanen");
    ASSIGN_GSN(gsn_gamorrean, "gamorrese");
    ASSIGN_GSN(gsn_jawa, "jawaese");
    ASSIGN_GSN(gsn_adarian, "adarese");
    ASSIGN_GSN(gsn_ewok, "ewokese");
    ASSIGN_GSN(gsn_verpine, "verpine");
    ASSIGN_GSN(gsn_defel, "defel");
    ASSIGN_GSN(gsn_trandoshan, "dosh");
    ASSIGN_GSN(gsn_chadra_fan, "chadra-fan");
    ASSIGN_GSN(gsn_quarren, "quarrenese");
    ASSIGN_GSN(gsn_barabel, "barabel");
    ASSIGN_GSN(gsn_firrerreo, "firrerreo");
    ASSIGN_GSN(gsn_bothan, "bothese");
    ASSIGN_GSN(gsn_coynite, "coyn");
    ASSIGN_GSN(gsn_duros, "durese");
    ASSIGN_GSN(gsn_gand, "gand");
    ASSIGN_GSN(gsn_kubaz, "kubazian");
    ASSIGN_GSN(gsn_togorian, "togorian");
    ASSIGN_GSN(gsn_yevethan, "yevethan");
    ASSIGN_GSN(gsn_sullustan, "sullustese");
    ASSIGN_GSN(gsn_shipdocking, "ship docking");

    Log->Boot("Loading mudprog macros");
    Macros->Load();

    /*
     * Read in all the area files.
     */

    Log->Boot("Loading areas");
    Areas->Load();

    /*
     *   initialize supermob.
     *    must be done before ResetArea!
     *
     */
    InitializeSupermob();

    /*
     * Fix up exits.
     * Declare db booting over.
     * Reset all areas once.
     * Load up the notes file.
     */
    Log->Boot("Fixing exits");
    FixExits();

    fBootDb = false;

    Log->Boot("Initializing economy");
    InitializeEconomy();

    /*loads vendors on each reboot -Legonas*/
    Log->Boot("Loading vendors");
    LoadVendors();

    Log->Boot("Loading storerooms");
    LoadStorerooms();

    Log->Boot("Loading boards");
    Boards->Load();

    Log->Boot("Loading clans");
    Clans->Load();

    Log->Boot("Loading bans");
    Bans->Load();

    Log->Boot("Loading corpses");
    LoadCorpses();

    Log->Boot("Loading spaceobjects");
    Spaceobjects->Load();

    Log->Boot("Loading ships");
    Ships->Load();

    Log->Boot("Loading bounties");
    Bounties->Load();

    Log->Boot("Loading planets");
    Planets->Load();

    Log->Boot("Loading shuttles");
    Shuttles->Load();

    Log->Boot("Loading Hall of Fame");
    LoadHallOfFame();

    Log->Boot("Loading badnames");
    BadNames->Load();

    Log->Boot("Loading help files");
    HelpFiles->Load();

    Log->Boot("Loading player home meta data");
    Homes->Load();

    Log->Boot("Resetting areas");
    AreaUpdate();

    MOBtrigger = true;

    if(fCopyOver)
    {
        Log->Boot("Running RecoverFromCopyover.");
        RecoverFromCopyover();
    }
}

/*
 * Add a character to the list of all characters                -Thoric
 */
void AddCharacter(std::shared_ptr<Character> ch)
{
    LINK(ch, FirstCharacter, LastCharacter, Next, Previous);

    if(!IsNpc(ch))
    {
        PlayerCharacters->Add(ch);
    }
}

/*
 * Go through all areas, and set up initial economy based on mob
 * levels and gold
 */
static void InitializeEconomy()
{
    for(auto tarea : Areas)
    {
        /* skip area if they already got some gold */
        if(tarea->HighEconomy > 0 || tarea->LowEconomy > 10000)
            continue;

        int rng = tarea->LevelRanges.Soft.High - tarea->LevelRanges.Soft.Low;

        if(rng != 0)
            rng /= 2;
        else
            rng = 25;

        int gold = rng * rng * 10000;
        BoostEconomy(tarea, gold);

        for(int idx = tarea->VnumRanges.Mob.First; idx < tarea->VnumRanges.Mob.Last; idx++)
        {
            auto mob = GetProtoMobile(idx);

            if(mob != nullptr)
            {
                BoostEconomy(tarea, mob->Gold * 10);
            }
        }
    }
}

/*
 * Translate all room exits from virtual to real.
 * Has to be done after all rooms are read in.
 * Check for bad reverse exits.
 */
static void FixExits()
{
    for(int iHash = 0; iHash < MAX_KEY_HASH; iHash++)
    {
        for(auto pRoomIndex = RoomIndexHash[iHash];
            pRoomIndex;
            pRoomIndex = pRoomIndex->Next)
        {
            bool fexit = false;
            auto copyOfExitList(pRoomIndex->Exits());

            for(auto pexit : copyOfExitList)
            {
                pexit->ReverseVnum = pRoomIndex->Vnum;

                if(pexit->Vnum <= 0
                   || (pexit->ToRoom = GetRoom(pexit->Vnum)) == NULL)
                {
                    if(fBootDb)
                    {
                        Log->Boot("%s: room %ld, exit %s leads to bad vnum (%ld)",
                                  __FUNCTION__,
                                  pRoomIndex->Vnum, GetDirectionName(pexit->Direction),
                                  pexit->Vnum);
                    }

                    Log->Bug("Deleting %s exit in room %ld",
                             GetDirectionName(pexit->Direction), pRoomIndex->Vnum);
                    ExtractExit(pRoomIndex, pexit);
                }
                else
                {
                    fexit = true;
                }
            }

            if(!fexit)
            {
                pRoomIndex->Flags.set(Flag::Room::NoMob);
            }
        }
    }

    /* Set all the rexit pointers         -Thoric */
    for(int iHash = 0; iHash < MAX_KEY_HASH; iHash++)
    {
        for(auto pRoomIndex = RoomIndexHash[iHash];
            pRoomIndex;
            pRoomIndex = pRoomIndex->Next)
        {
            for(auto pexit : pRoomIndex->Exits())
            {
                if(pexit->ToRoom && !pexit->ReverseExit)
                {
                    auto rev_exit = GetExitTo(pexit->ToRoom, GetReverseDirection(pexit->Direction), pRoomIndex->Vnum);

                    if(rev_exit)
                    {
                        pexit->ReverseExit = rev_exit;
                        rev_exit->ReverseExit = pexit;
                    }
                }
            }
        }
    }
}

/*
 * (prelude...) This is going to be fun... NOT!
 * (conclusion) QSort is f*cked!
 */
#if 0
static int ExitComparator(Exit **xit1, Exit **xit2)
{
    int d1, d2;

    d1 = (*xit1)->Direction;
    d2 = (*xit2)->Direction;

    if(d1 < d2)
        return -1;
    if(d1 > d2)
        return 1;
    return 0;
}
#endif

// TODO: Re-implement this.
static void SortExits(std::shared_ptr<Room> room)
{
#if 0
    Exit *exits[MAX_REXITS];
    int nexits = 0;

    for(Exit *pexit : room->Exits())
    {
        exits[nexits++] = pexit;

        // Check that there are no more exits than allowed.
        assert(nexits <= MAX_REXITS);
    }

    qsort(&exits[0], nexits, sizeof(Exit *),
          (int(*)(const void *, const void *)) ExitComparator);

    for(int x = 0; x < nexits; x++)
    {
        if(x > 0)
        {
            exits[x]->Previous = exits[x - 1];
        }
        else
        {
            exits[x]->Previous = NULL;
            room->FirstExit = exits[x];
        }

        if(x >= (nexits - 1))
        {
            exits[x]->Next = NULL;
            room->LastExit = exits[x];
        }
        else
        {
            exits[x]->Next = exits[x + 1];
        }
    }
#endif
}

void RandomizeExits(std::shared_ptr<Room> room, short maxdir)
{
    int nexits = 0;
    DirectionType vdirs[MAX_REXITS];

    for(std::shared_ptr<Exit> pexit : room->Exits())
    {
        vdirs[nexits++] = pexit->Direction;
    }

    for(int d0 = 0; d0 < nexits; d0++)
    {
        if(vdirs[d0] > maxdir)
            continue;

        int count = 0;
        int d1 = 0;

        while(vdirs[(d1 = GetRandomNumberFromRange(d0, nexits - 1))] > maxdir
              || ++count > 5)
            ;

        if(vdirs[d1] > maxdir)
            continue;

        DirectionType door = vdirs[d0];
        vdirs[d0] = vdirs[d1];
        vdirs[d1] = door;
    }

    int count = 0;

    for(std::shared_ptr<Exit> pexit : room->Exits())
    {
        pexit->Direction = vdirs[count++];
    }

    SortExits(room);
}

/*
 * Create an instance of a mobile.
 */
static std::shared_ptr<Character> AllocateMobile(std::shared_ptr<ProtoMobile> pMobIndex)
{
    assert(pMobIndex != nullptr);
    return std::make_shared<Character>(pMobIndex);
}

std::shared_ptr<Character> CreateMobile(std::shared_ptr<ProtoMobile> proto)
{
    auto mob = AllocateMobile(proto);

    /*
     * Insert in list.
     */
    AddCharacter(mob);
    proto->Count++;
    nummobsloaded++;
    return mob;
}

std::shared_ptr<Object> CreateObject(std::shared_ptr<ProtoObject> proto, int level)
{
    auto obj = std::make_shared<Object>(proto, level);
    Objects->Add(obj);
    ++proto->Count;
    ++numobjsloaded;
    ++physicalobjects;

    return obj;
}

/*
 * Get an extra description from a list.
 */
std::string GetExtraDescription(const std::string &name,
                                const std::list<std::shared_ptr<ExtraDescription>> &extras)
{
    for(auto ed : extras)
    {
        if(IsName(name, ed->Keyword))
        {
            return ed->Description;
        }
    }

    return "";
}

/*
 * Translates mob virtual number to its mob index struct.
 * Hash table lookup.
 */
std::shared_ptr<ProtoMobile> GetProtoMobile(vnum_t vnum)
{
    assert(vnum > 0);
    const auto &i = ProtoMobs.find(vnum);

    if(i != ProtoMobs.end())
    {
        return i->second;
    }
    else
    {
        if(fBootDb)
        {
            Log->Bug("%s: bad vnum %ld.", __FUNCTION__, vnum);
        }

        return nullptr;
    }
}

/*
 * Translates obj virtual number to its obj index struct.
 * Hash table lookup.
 */
std::shared_ptr<ProtoObject> GetProtoObject(vnum_t vnum)
{
    assert(vnum > 0);
    const auto &i = ProtoObjects.find(vnum);

    if(i != ProtoObjects.end())
    {
        return i->second;
    }
    else
    {
        if(fBootDb)
        {
            Log->Bug("%s: bad vnum %ld.", __FUNCTION__, vnum);
        }

        return nullptr;
    }
}

/*
 * Translates room virtual number to its room index struct.
 * Hash table lookup.
 */
std::shared_ptr<Room> GetRoom(vnum_t vnum)
{
    assert(vnum > 0);

    for(std::shared_ptr<Room> pRoomIndex = RoomIndexHash[vnum % MAX_KEY_HASH];
        pRoomIndex;
        pRoomIndex = pRoomIndex->Next)
    {
        if(pRoomIndex->Vnum == vnum)
        {
            return pRoomIndex;
        }
    }

    if(fBootDb)
    {
        Log->Bug("%s: bad vnum %ld.", __FUNCTION__, vnum);
    }

    return nullptr;
}

/*
 * Dump a text file to a player, a line at a time               -Thoric
 */
void ShowFile(std::shared_ptr<Character> ch, const std::string &filename)
{
    FILE *fp = fopen(filename.c_str(), "r");

    if(fp != nullptr)
    {
        int num = 0;
        char buf[MAX_STRING_LENGTH];

        while(!feof(fp))
        {
            while((buf[num] = fgetc(fp)) != (char)EOF
                  && buf[num] != '\n'
                  && buf[num] != '\r'
                  && num < (MAX_STRING_LENGTH - 2))
            {
                num++;
            }

            int c = fgetc(fp);

            if((c != '\n' && c != '\r') || c == buf[num])
                ungetc(c, fp);

            buf[num++] = '\n';
            buf[num++] = '\r';
            buf[num] = '\0';
            ch->Echo("%s", buf);
            num = 0;
        }
    }
}

/*************************************************************/
/* Function to delete a room index.  Called from do_rdelete in build.c
   Narn, May/96
*/
bool DeleteRoom(std::shared_ptr<Room> room)
{
    int iHash = 0;
    std::shared_ptr<Room> tmp, prev;

    iHash = room->Vnum % MAX_KEY_HASH;

    /* Take the room index out of the hash list. */
    for(tmp = RoomIndexHash[iHash]; tmp && tmp != room; tmp = tmp->Next)
    {
        prev = tmp;
    }

    if(tmp == nullptr)
    {
        Log->Bug("%s: room not found", __FUNCTION__);
        return false;
    }

    if(prev != nullptr)
    {
        prev->Next = room->Next;
    }
    else
    {
        RoomIndexHash[iHash] = room->Next;
    }

    top_room--;
    return true;
}

/* See comment on DeleteRoom. */
bool DeleteObject(std::shared_ptr<ProtoObject> obj)
{
    return true;
}

/* See comment on DeleteRoom. */
bool DeleteMobile(std::shared_ptr<ProtoMobile> mob)
{
    return true;
}

/*
 * Creat a new room (for online building)                       -Thoric
 */
std::shared_ptr<Room> MakeRoom(vnum_t vnum)
{
    std::shared_ptr<Room> pRoomIndex = std::make_shared<Room>();

    pRoomIndex->Vnum = vnum;
    pRoomIndex->Name = "Floating in a void";
    pRoomIndex->Flags = CreateBitSet<Flag::MAX>({ Flag::Room::Prototype });
    pRoomIndex->Sector = SECT_INSIDE;

    int iHash = vnum % MAX_KEY_HASH;
    pRoomIndex->Next = RoomIndexHash[iHash];
    RoomIndexHash[iHash] = pRoomIndex;
    top_room++;

    return pRoomIndex;
}

/*
 * Create a new INDEX object (for online building)              -Thoric
 * Option to clone an existing index object.
 */
std::shared_ptr<ProtoObject> MakeObject(vnum_t vnum, vnum_t cvnum, const std::string &name)
{
    std::shared_ptr<ProtoObject> cObjIndex;
    char buf[MAX_STRING_LENGTH];

    if(cvnum > 0)
    {
        cObjIndex = GetProtoObject(cvnum);
    }

    std::shared_ptr<ProtoObject> pObjIndex = std::make_shared<ProtoObject>(vnum);

    pObjIndex->Name = name;

    if(!cObjIndex)
    {
        sprintf(buf, "A %s", name.c_str());
        pObjIndex->ShortDescr = buf;
        sprintf(buf, "A %s is here.", name.c_str());
        pObjIndex->Description = buf;
        pObjIndex->ShortDescr[0] = CharToLowercase(pObjIndex->ShortDescr[0]);
        pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);
        pObjIndex->ItemType = ITEM_TRASH;
        pObjIndex->Weight = 1;
    }
    else
    {
        pObjIndex->ShortDescr = cObjIndex->ShortDescr;
        pObjIndex->Description = cObjIndex->Description;
        pObjIndex->ActionDescription = cObjIndex->ActionDescription;
        pObjIndex->ItemType = cObjIndex->ItemType;
        pObjIndex->Flags = cObjIndex->Flags;
        pObjIndex->WearFlags = cObjIndex->WearFlags;

        pObjIndex->Weight = cObjIndex->Weight;
        pObjIndex->Cost = cObjIndex->Cost;

        for(auto ced : cObjIndex->ExtraDescriptions())
        {
            auto ed = std::make_shared<ExtraDescription>();
            ed->Keyword = ced->Keyword;
            ed->Description = ced->Description;
            pObjIndex->Add(ed);
            top_ed++;
        }

        for(auto cpaf : cObjIndex->Affects())
        {
            std::shared_ptr<Affect> paf = std::make_shared<Affect>();
            paf->Type = cpaf->Type;
            paf->Duration = cpaf->Duration;
            paf->Location = cpaf->Location;
            paf->Modifier = cpaf->Modifier;
            paf->AffectedBy = cpaf->AffectedBy;
            pObjIndex->Add(paf);
            top_affect++;
        }
    }

    pObjIndex->Flags.set(Flag::Obj::Prototype);
    ProtoObjects.insert(std::make_pair(vnum, pObjIndex));

    return pObjIndex;
}

/*
 * Create a new INDEX mobile (for online building)              -Thoric
 * Option to clone an existing index mobile.
 */
std::shared_ptr<ProtoMobile> MakeMobile(vnum_t vnum, vnum_t cvnum, const std::string &name)
{
    std::shared_ptr<ProtoMobile> cMobIndex;
    char buf[MAX_STRING_LENGTH];

    if(cvnum > 0)
    {
        cMobIndex = GetProtoMobile(cvnum);
    }

    std::shared_ptr<ProtoMobile> pMobIndex = std::make_shared<ProtoMobile>(vnum);
    pMobIndex->Name = name;

    if(!cMobIndex)
    {
        sprintf(buf, "A newly created %s", name.c_str());
        pMobIndex->ShortDescr = buf;
        sprintf(buf, "Some god abandoned a newly created %s here.\r\n", name.c_str());
        pMobIndex->LongDescr = buf;
        pMobIndex->ShortDescr[0] = CharToLowercase(pMobIndex->ShortDescr[0]);
        pMobIndex->LongDescr[0] = CharToUppercase(pMobIndex->LongDescr[0]);
        pMobIndex->Flags = CreateBitSet<Flag::MAX>({ Flag::Mob::Npc, Flag::Mob::Prototype });
        pMobIndex->Level = 1;
        pMobIndex->Position = DEFAULT_POSITION;
        pMobIndex->DefaultPosition = DEFAULT_POSITION;
        pMobIndex->Sex = SEX_NEUTRAL;
        pMobIndex->Stats.Str = 10;
        pMobIndex->Stats.Dex = 10;
        pMobIndex->Stats.Int = 10;
        pMobIndex->Stats.Wis = 10;
        pMobIndex->Stats.Cha = 10;
        pMobIndex->Stats.Con = 10;
        pMobIndex->Stats.Lck = 10;
        pMobIndex->Race = RACE_HUMAN;
    }
    else
    {
        pMobIndex->ShortDescr = cMobIndex->ShortDescr;
        pMobIndex->LongDescr = cMobIndex->LongDescr;
        pMobIndex->Description = cMobIndex->Description;
        pMobIndex->Flags = cMobIndex->Flags;
        pMobIndex->Flags.set(Flag::Mob::Prototype);
        pMobIndex->AffectedBy = cMobIndex->AffectedBy;
        pMobIndex->spec_fun = cMobIndex->spec_fun;
        pMobIndex->spec_2 = cMobIndex->spec_2;
        pMobIndex->Alignment = cMobIndex->Alignment;
        pMobIndex->Level = cMobIndex->Level;
        pMobIndex->ArmorClass = cMobIndex->ArmorClass;
        pMobIndex->HitNoDice = cMobIndex->HitNoDice;
        pMobIndex->HitSizeDice = cMobIndex->HitSizeDice;
        pMobIndex->HitPlus = cMobIndex->HitPlus;
        pMobIndex->DamNoDice = cMobIndex->DamNoDice;
        pMobIndex->DamSizeDice = cMobIndex->DamSizeDice;
        pMobIndex->DamPlus = cMobIndex->DamPlus;
        pMobIndex->Gold = cMobIndex->Gold;
        pMobIndex->exp = cMobIndex->exp;
        pMobIndex->Position = cMobIndex->Position;
        pMobIndex->DefaultPosition = cMobIndex->DefaultPosition;
        pMobIndex->Sex = cMobIndex->Sex;
        pMobIndex->Stats.Str = cMobIndex->Stats.Str;
        pMobIndex->Stats.Dex = cMobIndex->Stats.Dex;
        pMobIndex->Stats.Int = cMobIndex->Stats.Int;
        pMobIndex->Stats.Wis = cMobIndex->Stats.Wis;
        pMobIndex->Stats.Cha = cMobIndex->Stats.Cha;
        pMobIndex->Stats.Con = cMobIndex->Stats.Con;
        pMobIndex->Stats.Lck = cMobIndex->Stats.Lck;
        pMobIndex->Race = cMobIndex->Race;
        pMobIndex->Resistant = cMobIndex->Resistant;
        pMobIndex->Immune = cMobIndex->Immune;
        pMobIndex->Susceptible = cMobIndex->Susceptible;
        pMobIndex->NumberOfAttacks = cMobIndex->NumberOfAttacks;
        pMobIndex->AttackFlags = cMobIndex->AttackFlags;
        pMobIndex->DefenseFlags = cMobIndex->DefenseFlags;
    }

    ProtoMobs.insert(std::make_pair(vnum, pMobIndex));

    return pMobIndex;
}

/*
 * Creates a simple exit with no fields filled but rvnum and optionally
 * ActTarget::Room and vnum.                                            -Thoric
 * Exits are inserted into the linked list based on vdir.
 */
std::shared_ptr<Exit> MakeExit(std::shared_ptr<Room> pRoomIndex, std::shared_ptr<Room> to_room, DirectionType door, const std::string &keyword)
{
    std::shared_ptr<Exit> pexit = std::make_shared<Exit>();
    pexit->Direction = door;
    pexit->ReverseVnum = pRoomIndex->Vnum;
    pexit->ToRoom = to_room;
    pexit->Distance = 1;
    pexit->Keyword = keyword;

    if(to_room)
    {
        pexit->Vnum = to_room->Vnum;
        std::shared_ptr<Exit> texit = GetExitTo(to_room, GetReverseDirection(door), pRoomIndex->Vnum);

        if(texit != nullptr)      /* assign reverse exit pointers */
        {
            texit->ReverseExit = pexit;
            pexit->ReverseExit = texit;
        }
    }

    pRoomIndex->Add(pexit);
    top_exit++;
    return pexit;
}

/*
 * Display vnums currently assigned to areas            -Altrag & Thoric
 * Sorted, and flagged if loaded.
 */
void ShowVnums(std::shared_ptr<Character> ch, vnum_t low, vnum_t high, bool proto, bool shownl)
{
    auto listToUse = proto ? Areas->AreasInProgress() : Areas->Entities();
    int count = 0;

    SetCharacterColor(AT_PLAIN, ch);

    for(auto pArea : listToUse)
    {
        if(pArea->VnumRanges.Room.First < low)
            continue;

        if(pArea->VnumRanges.Room.Last > high)
            break;

        if(!shownl)
            continue;

        ch->Echo("%-22s| Rooms: %10ld - %-10ld"
                 " Objs: %10ld - %-10ld Mobs: %10ld - %-10ld\r\n",
                 (!pArea->Filename.empty() ? pArea->Filename.c_str() : "(invalid)"),
                 pArea->VnumRanges.Room.First, pArea->VnumRanges.Room.Last,
                 pArea->VnumRanges.Object.First, pArea->VnumRanges.Object.Last,
                 pArea->VnumRanges.Mob.First, pArea->VnumRanges.Mob.Last);
        count++;
    }

    ch->Echo("Areas listed: %d\r\n", count);
}

/*
 * Append a string to a file.
 */
void AppendFile(std::shared_ptr<Character> ch, const std::string &filename, const std::string &str)
{
    if(IsNpc(ch) || str.empty())
        return;

    std::ofstream file(filename);

    if(file.is_open())
    {
        file << "[" << (ch->InRoom ? ch->InRoom->Vnum : INVALID_VNUM) << "] " << ch->Name << ": " << str << '\n';
    }
    else
    {
        ch->Echo("Could not open the file!\n\r");
    }
}

void AllocateRepositories()
{
    Ships = NewShipRepository();
    HelpFiles = NewHelpFileRepository();
    BadNames = NewBadNameRepository();
    Bans = NewBanRepository();
    Boards = NewBoardRepository();
    Bounties = NewBountyRepository();
    Clans = NewClanRepository();
    CommandRepository = NewCommandRepository();
    Planets = NewPlanetRepository();
    Spaceobjects = NewSpaceobjectRepository();
    Socials = NewSocialRepository();
    Shuttles = NewShuttleRepository();
    PlayerCharacters = NewPlayerRepository();
    Shops = NewShopRepository();
    RepairShops = NewRepairShopRepository();
    Descriptors = NewDescriptorRepository();
    Objects = NewObjectRepository();
    Skills = NewSkillRepository();
    Areas = NewAreaRepository();
    Storerooms = NewStoreroomRepository();
    Vendors = NewVendorRepository();
    Homes = NewHomeRepository();
    Macros = NewMacroRepository();
}

void MakeWizlist()
{
    std::string wizlist = PlayerCharacters->MakeWizlist();
    std::error_code ec;
    fs::remove(WIZLIST_FILE, ec);
    AppendToFile(WIZLIST_FILE, wizlist);
}
