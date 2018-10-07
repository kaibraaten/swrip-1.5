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

#include <cassert>
#include <ctime>
#include <cstring>
#include <cctype>
#include <cstdarg>
#include <utility/random.hpp>
#include "mud.hpp"
#include "arena.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "help.hpp"
#include "craft.hpp"
#include "reset.hpp"
#include "shop.hpp"
#include "clan.hpp"
#include "command.hpp"
#include "social.hpp"
#include "skill.hpp"
#include "script.hpp"
#include "spaceobject.hpp"
#include "bounty.hpp"
#include "board.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "badname.hpp"
#include "ban.hpp"
#include "log.hpp"
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
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "exit.hpp"

/*
 * Globals.
 */

Wizard *first_wiz = NULL;
Wizard *last_wiz = NULL;

time_t last_restore_all_time = 0;

TeleportData *FirstTeleport = NULL;
TeleportData *LastTeleport = NULL;

ExtractedCharacter *extracted_char_queue = NULL;

Character *FirstCharacter = NULL;
Character *LastCharacter = NULL;
char log_buf[2*MAX_INPUT_LENGTH];

TimeInfo time_info;
Weather weather_info;

int cur_qobjs = 0;
int cur_qchars = 0;
int nummobsloaded = 0;
int numobjsloaded = 0;
int physicalobjects = 0;

Auction *auction = NULL;

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
ProtoMobile *MobIndexHash[MAX_KEY_HASH];
ProtoObject *ObjectIndexHash[MAX_KEY_HASH];
Room *RoomIndexHash[MAX_KEY_HASH];

int top_affect = 0;
int top_area = 0;
int top_ed = 0;
int top_exit = 0;
int top_mob_index = 0;
int top_obj_index = 0;
int top_reset = 0;
int top_room = 0;
int top_shop = 0;
int top_repair = 0;
int top_vroom = 0;

/*
 * Semi-locals.
 */
bool fBootDb = false;
FILE *fpArea = NULL;
char strArea[MAX_INPUT_LENGTH];

/*
 * Local booting procedures.
 */
static void AllocateRepositories(void);
static void LoadBuildList( void );
static void InitializeEconomy( void );
static void FixExits( void );
#if 0
static int ExitComparator( Exit **xit1, Exit **xit2 );
#endif
static void SortExits( Room *room );
static void ToWizFile( const char *line );
static void AddToWizList( const char *name, int level );

void ShutdownMud( const std::string &reason )
{
  FILE *fp;

  if ( (fp = fopen( SHUTDOWN_FILE, "a" )) != NULL )
    {
      fprintf( fp, "%s\n", reason.c_str() );
      fclose( fp );
    }
}

/*
 * Big mama top level function.
 */
void BootDatabase( bool fCopyOver )
{
  unlink( BOOTLOG_FILE );
  Log->Boot( "---------------------[ Boot Log ]--------------------" );

  Log->Boot("Allocating repositories");
  AllocateRepositories();

  Log->Boot( "Loading SysData.configuration..." );

  SysData.Load();

  Log->Boot( "Loading commands" );
  LoadCommands();

  Log->Boot("Loading socials");
  Socials->Load();

  Log->Boot("Loading skill table");
  LoadSkills();
  SortSkillTable();

  gsn_TopSN = TopSN;

  for ( int x = 0; x < TopSN; x++ )
    {
      if ( !gsn_first_spell && SkillTable[x]->Type == SKILL_SPELL )
	gsn_first_spell = x;
      else if ( !gsn_first_skill && SkillTable[x]->Type == SKILL_SKILL )
	gsn_first_skill = x;
      else if ( !gsn_first_weapon && SkillTable[x]->Type == SKILL_WEAPON )
	gsn_first_weapon = x;
      else if ( !gsn_first_tongue && SkillTable[x]->Type == SKILL_TONGUE )
	gsn_first_tongue = x;
    }

  Log->Boot("Loading herb table");
  LoadHerbs();

  Log->Boot("Making wizlist");
  MakeWizlist();

  fBootDb             = true;
  SysData.MaxPlayersThisBoot  = 0;

  cur_char            = NULL;
  cur_obj             = 0;
  cur_obj_serial      = 0;
  cur_char_died       = false;
  cur_obj_extracted   = false;
  cur_room            = NULL;
  quitting_char       = NULL;
  loading_char        = NULL;
  saving_char         = NULL;
  auction = new Auction();

  for ( int wear = 0; wear < MAX_WEAR; wear++ )
    for ( int x = 0; x < MAX_LAYERS; x++ )
      save_equipment[wear][x] = NULL;

  /*
   * Set time and weather.
   */
  long lhour = 0, lday = 0, lmonth = 0;

  Log->Boot("Setting time and weather");

  lhour               = (current_time - 650336715) / (PULSE_TICK / PULSE_PER_SECOND);
  time_info.Hour      = lhour  % 24;
  lday                = lhour  / 24;
  time_info.Day       = lday   % 35;
  lmonth              = lday   / 35;
  time_info.Month     = lmonth % 17;
  time_info.Year      = lmonth / 17;

  if ( time_info.Hour <  5 )
    weather_info.Sunlight = SUN_DARK;
  else if ( time_info.Hour <  6 )
    weather_info.Sunlight = SUN_RISE;
  else if ( time_info.Hour < 19 )
    weather_info.Sunlight = SUN_LIGHT;
  else if ( time_info.Hour < 20 )
    weather_info.Sunlight = SUN_SET;
  else
    weather_info.Sunlight = SUN_DARK;

  weather_info.Change = 0;
  weather_info.Mmhg   = 960;

  if ( time_info.Month >= 7 && time_info.Month <=12 )
    weather_info.Mmhg += GetRandomNumberFromRange( 1, 50 );
  else
    weather_info.Mmhg += GetRandomNumberFromRange( 1, 80 );

  if ( weather_info.Mmhg <=  980 )
    weather_info.Sky = SKY_LIGHTNING;
  else if ( weather_info.Mmhg <= 1000 )
    weather_info.Sky = SKY_RAINING;
  else if ( weather_info.Mmhg <= 1020 )
    weather_info.Sky = SKY_CLOUDY;
  else
    weather_info.Sky = SKY_CLOUDLESS;

  /*
   * Assign gsn's for skills which need them.
   */
  Log->Boot("Assigning gsn's");
  ASSIGN_GSN( gsn_cloak, "cloak" );
  ASSIGN_GSN( gsn_cutdoor, "cutdoor" );
  ASSIGN_GSN( gsn_bind, "bind" );
  ASSIGN_GSN( gsn_slicing, "slicing" );
  ASSIGN_GSN( gsn_addpatrol , "addpatrol" );
  ASSIGN_GSN( gsn_eliteguard , "eliteguard" );
  ASSIGN_GSN( gsn_gather_intelligence , "gatherintelligence" );
  ASSIGN_GSN( gsn_specialforces , "specialforces" );
  ASSIGN_GSN( gsn_jail , "jail" );
  ASSIGN_GSN( gsn_smalltalk , "smalltalk" );
  ASSIGN_GSN( gsn_propaganda , "propaganda" );
  ASSIGN_GSN( gsn_bribe , "bribe" );
  ASSIGN_GSN( gsn_seduce , "seduce" );
  ASSIGN_GSN( gsn_masspropaganda , "masspropaganda" );
  ASSIGN_GSN( gsn_beg  , "beg" );
  ASSIGN_GSN( gsn_hijack  , "hijack" );
  ASSIGN_GSN( gsn_makejewelry  , "makejewelry" );
  ASSIGN_GSN( gsn_grenades  , "grenades" );
  ASSIGN_GSN( gsn_makeblade  , "makeblade" );
  ASSIGN_GSN( gsn_makeblaster  , "makeblaster" );
  ASSIGN_GSN( gsn_makebowcaster  , "makebowcaster" );
  ASSIGN_GSN( gsn_makeglowrod   , "makeglowrod" );
  ASSIGN_GSN( gsn_makecomlink   , "makecomlink" );
  ASSIGN_GSN( gsn_makegrenade   , "makegrenade" );
  ASSIGN_GSN( gsn_makelandmine  , "makelandmine" );
  ASSIGN_GSN( gsn_makearmor  , "makearmor" );
  ASSIGN_GSN( gsn_makeshield  , "makeshield" );
  ASSIGN_GSN( gsn_makecontainer  , "makecontainer" );
  ASSIGN_GSN( gsn_reinforcements  , "reinforcements" );
  ASSIGN_GSN( gsn_postguard   , "postguard" );
  ASSIGN_GSN( gsn_torture   , "torture" );
  ASSIGN_GSN( gsn_throw   , "throw" );
  ASSIGN_GSN( gsn_snipe   , "snipe" );
  ASSIGN_GSN( gsn_disguise   , "disguise" );
  ASSIGN_GSN( gsn_mine   , "mine" );
  ASSIGN_GSN( gsn_first_aid   , "firstaid" );
  ASSIGN_GSN( gsn_lightsaber_crafting, "lightsaber crafting" );
  ASSIGN_GSN( gsn_spice_refining,  "spice refining" );
  ASSIGN_GSN( gsn_spacecombat,     "space combat 1" );
  ASSIGN_GSN( gsn_spacecombat2,     "space combat 2" );
  ASSIGN_GSN( gsn_spacecombat3,     "space combat 3" );
  ASSIGN_GSN( gsn_speeders,     "speeders" );
  ASSIGN_GSN( gsn_speedercombat,     "speeder combat" );
  ASSIGN_GSN( gsn_weaponsystems,   "weapon systems" );
  ASSIGN_GSN( gsn_starfighters,    "starfighters" );
  ASSIGN_GSN( gsn_navigation,      "navigation" );
  ASSIGN_GSN( gsn_shipsystems,     "ship systems" );
  ASSIGN_GSN( gsn_midships,        "midships" );
  ASSIGN_GSN( gsn_capitalships,    "capital ships" );
  ASSIGN_GSN( gsn_tractorbeams,    "tractor beams" );
  ASSIGN_GSN( gsn_shipmaintenance, "ship maintenance" );
  ASSIGN_GSN( gsn_sabotage, "sabotage" );
  ASSIGN_GSN( gsn_jumpvector, "jumpvector" );
  ASSIGN_GSN( gsn_fake_signal, "fake signal" );
  ASSIGN_GSN( gsn_blasters,   "blasters" );
  ASSIGN_GSN( gsn_bowcasters, "bowcasters" );
  ASSIGN_GSN( gsn_force_pikes,        "force pikes" );
  ASSIGN_GSN( gsn_lightsabers,        "lightsabers" );
  ASSIGN_GSN( gsn_vibro_blades,       "vibro-blades" );
  ASSIGN_GSN( gsn_flexible_arms,      "flexible arms" );
  ASSIGN_GSN( gsn_talonous_arms,      "talonous arms" );
  ASSIGN_GSN( gsn_bludgeons,  "bludgeons" );
  ASSIGN_GSN( gsn_detrap,             "detrap" );
  ASSIGN_GSN( gsn_backstab,   "backstab" );
  ASSIGN_GSN( gsn_circle,             "circle" );
  ASSIGN_GSN( gsn_dodge,              "dodge" );
  ASSIGN_GSN( gsn_steal,              "lift" );
  ASSIGN_GSN( gsn_hide,               "stealth" );
  ASSIGN_GSN( gsn_peek,               "peek" );
  ASSIGN_GSN( gsn_pick_lock,  "pick lock" );
  ASSIGN_GSN( gsn_pickshiplock  , "pick ship lock" );
  ASSIGN_GSN( gsn_sneak,              "sneak" );
  ASSIGN_GSN( gsn_gouge,              "gouge" );
  ASSIGN_GSN( gsn_poison_weapon,      "poisonweapon" );
  ASSIGN_GSN( gsn_disarm,             "disarm" );
  ASSIGN_GSN( gsn_enhanced_damage, "enhanced damage" );
  ASSIGN_GSN( gsn_kick,               "kick" );
  ASSIGN_GSN( gsn_parry,              "parry" );
  ASSIGN_GSN( gsn_rescue,             "rescue" );
  ASSIGN_GSN( gsn_second_attack,      "second attack" );
  ASSIGN_GSN( gsn_third_attack,       "third attack" );
  ASSIGN_GSN( gsn_fourth_attack,      "fourth attack" );
  ASSIGN_GSN( gsn_fifth_attack,       "fifth attack" );
  ASSIGN_GSN( gsn_dual_wield, "dual wield" );
  ASSIGN_GSN( gsn_punch,              "punch" );
  ASSIGN_GSN( gsn_bash,               "bash" );
  ASSIGN_GSN( gsn_stun,               "stun" );
  ASSIGN_GSN( gsn_skin,               "skin" );
  ASSIGN_GSN( gsn_bashdoor,   "doorbash" );
  ASSIGN_GSN( gsn_grip,               "grip" );
  ASSIGN_GSN( gsn_berserk,    "berserk" );
  ASSIGN_GSN( gsn_hitall,             "hitall" );
  ASSIGN_GSN( gsn_aid,                "aid" );
  ASSIGN_GSN( gsn_track,              "track" );
  ASSIGN_GSN( gsn_search,             "search" );
  ASSIGN_GSN( gsn_dig,                "dig" );
  ASSIGN_GSN( gsn_mount,              "mount" );
  ASSIGN_GSN( gsn_study,              "study" );
  ASSIGN_GSN( gsn_climb,              "climb" );
  ASSIGN_GSN( gsn_scan,               "scan" );
  ASSIGN_GSN( gsn_fireball,   "fireball" );
  ASSIGN_GSN( gsn_lightning_bolt,     "force bolt" );
  ASSIGN_GSN( gsn_aqua_breath,        "aqua breath" );
  ASSIGN_GSN( gsn_blindness,  "blindness" );
  ASSIGN_GSN( gsn_charm_person,       "affect mind" );
  ASSIGN_GSN( gsn_invis,              "mask" );
  ASSIGN_GSN( gsn_mass_invis, "group masking" );
  ASSIGN_GSN( gsn_poison,             "poison" );
  ASSIGN_GSN( gsn_sleep,              "sleep" );
  ASSIGN_GSN( gsn_possess,    "possess" );

  ASSIGN_GSN( gsn_falleen, "falleen" );
  ASSIGN_GSN( gsn_common,             "basic" );
  ASSIGN_GSN( gsn_binary, "binary" );
  ASSIGN_GSN( gsn_antarian, "antarian" );
  ASSIGN_GSN( gsn_wookiee,    "shyriiwook" );
  ASSIGN_GSN( gsn_twilek,     "twileki" );
  ASSIGN_GSN( gsn_ithorese, "ithorese" );
  ASSIGN_GSN( gsn_devaronese, "devaronese" );
  ASSIGN_GSN( gsn_rodian,             "rodese" );
  ASSIGN_GSN( gsn_hutt,               "huttese" );
  ASSIGN_GSN( gsn_mon_calamari,       "mon calamarian" );
  ASSIGN_GSN( gsn_noghri,     "shistavanen" );
  ASSIGN_GSN( gsn_gamorrean,  "gamorrese" );
  ASSIGN_GSN( gsn_jawa,       "jawaese" );
  ASSIGN_GSN( gsn_adarian,        "adarese" );
  ASSIGN_GSN( gsn_ewok,           "ewokese" );
  ASSIGN_GSN( gsn_verpine,        "verpine" );
  ASSIGN_GSN( gsn_defel,          "defel" );
  ASSIGN_GSN( gsn_trandoshan,     "dosh" );
  ASSIGN_GSN( gsn_chadra_fan,     "chadra-fan" );
  ASSIGN_GSN( gsn_quarren,        "quarrenese" );
  ASSIGN_GSN( gsn_barabel, "barabel" );
  ASSIGN_GSN( gsn_firrerreo, "firrerreo" );
  ASSIGN_GSN( gsn_bothan, "bothese" );
  ASSIGN_GSN( gsn_coynite, "coyn" );
  ASSIGN_GSN( gsn_duros, "durese" );
  ASSIGN_GSN( gsn_gand, "gand" );
  ASSIGN_GSN( gsn_kubaz, "kubazian" );
  ASSIGN_GSN( gsn_togorian, "togorian" );
  ASSIGN_GSN( gsn_yevethan, "yevethan" );
  ASSIGN_GSN( gsn_sullustan,      "sullustese" );
  ASSIGN_GSN( gsn_shipdocking,    "ship docking" );

  /*
   * Read in all the area files.
   */
  FILE *fpList = nullptr;

  Log->Boot("Reading in area files...");

  if ( ( fpList = fopen( AREA_DIR AREA_LIST, "r" ) ) == NULL )
    {
      ShutdownMud( "Unable to open area list" );
      exit( 1 );
    }

  for ( ; ; )
    {
      strcpy( strArea, ReadWord( fpList, Log, fBootDb ) );

      if ( strArea[0] == '$' )
        break;

      LoadAreaFile( LastArea, strArea );
    }

  fclose( fpList );

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
  Log->Boot( "Fixing exits" );
  FixExits();

  fBootDb     = false;

  Log->Boot( "Initializing economy" );
  InitializeEconomy();

  /*loads vendors on each reboot -Legonas*/
  Log->Boot( "Reading in Vendors" );
  LoadVendors();

  Log->Boot( "Reading in Storerooms" );
  LoadStorerooms();

  Log->Boot( "Loading buildlist" );
  LoadBuildList();

  Log->Boot( "Loading boards" );
  Boards->Load();

  Log->Boot( "Loading clans" );
  Clans->Load();

  Log->Boot( "Loading bans" );
  Bans->Load();

  Log->Boot( "Loading corpses" );
  LoadCorpses();

  Log->Boot( "Loading spaceobjects" );
  Spaceobjects->Load();

  Log->Boot( "Loading ships" );
  Ships->Load();

  Log->Boot( "Loading bounties" );
  Bounties->Load();

  Log->Boot( "Loading planets" );
  Planets->Load();

  Log->Boot( "Loading shuttles" );
  Shuttles->Load();

  Log->Boot( "Loading Hall of Fame" );
  LoadHallOfFame();

  Log->Boot( "Loading badnames" );
  BadNames->Load();
  
  Log->Boot( "Loading help files" );
  HelpFiles->Load();

  Log->Boot( "Resetting areas" );
  AreaUpdate();

  MOBtrigger = true;

  if( fCopyOver )
    {
      Log->Boot( "Running RecoverFromCopyover." );
      RecoverFromCopyover();
    }
}

/*
 * Add a character to the list of all characters                -Thoric
 */
void AddCharacter( Character *ch )
{
  LINK( ch, FirstCharacter, LastCharacter, Next, Previous );

  if(!IsNpc(ch))
    {
      PlayerCharacters->Add(ch);
    }
}

/*
 * Go through all areas, and set up initial economy based on mob
 * levels and gold
 */
static void InitializeEconomy( void )
{
  Area *tarea;

  for ( tarea = FirstArea; tarea; tarea = tarea->Next )
    {
      ProtoMobile *mob = NULL;
      int idx = 0, gold = 0, rng = 0;

      /* skip area if they already got some gold */
      if ( tarea->HighEconomy > 0 || tarea->LowEconomy > 10000 )
        continue;

      rng = tarea->LevelRanges.Soft.High - tarea->LevelRanges.Soft.Low;

      if ( rng )
        rng /= 2;
      else
        rng = 25;

      gold = rng * rng * 10000;
      BoostEconomy( tarea, gold );

      for ( idx = tarea->VnumRanges.Mob.First; idx < tarea->VnumRanges.Mob.Last; idx++ )
        if ( (mob=GetProtoMobile(idx)) != NULL )
          BoostEconomy( tarea, mob->Gold * 10 );
    }
}

/*
 * Translate all room exits from virtual to real.
 * Has to be done after all rooms are read in.
 * Check for bad reverse exits.
 */
static void FixExits( void )
{
  for ( int iHash = 0; iHash < MAX_KEY_HASH; iHash++ )
    {
      for ( Room *pRoomIndex  = RoomIndexHash[iHash];
            pRoomIndex;
            pRoomIndex  = pRoomIndex->Next )
        {
          bool fexit = false;
          std::list<Exit*> copyOfExitList(pRoomIndex->Exits());

          for(Exit *pexit : copyOfExitList)
            {
              pexit->ReverseVnum = pRoomIndex->Vnum;

              if ( pexit->Vnum <= 0
                   ||  (pexit->ToRoom=GetRoom(pexit->Vnum)) == NULL )
                {
                  if ( fBootDb )
                    {
                      Log->Boot( "%s: room %ld, exit %s leads to bad vnum (%ld)",
                                 __FUNCTION__, 
                                 pRoomIndex->Vnum, GetDirectionName(pexit->Direction),
                                 pexit->Vnum );
                    }

                  Log->Bug( "Deleting %s exit in room %ld",
                            GetDirectionName(pexit->Direction), pRoomIndex->Vnum );
                  ExtractExit( pRoomIndex, pexit );
                }
              else
                {
                  fexit = true;
                }
            }

          if ( !fexit )
            {
              pRoomIndex->Flags.set( Flag::Room::NoMob );
            }
        }
    }

  /* Set all the rexit pointers         -Thoric */
  for ( int iHash = 0; iHash < MAX_KEY_HASH; iHash++ )
    {
      for ( Room *pRoomIndex  = RoomIndexHash[iHash];
            pRoomIndex;
            pRoomIndex  = pRoomIndex->Next )
        {
          for ( Exit *pexit : pRoomIndex->Exits())
            {
              if ( pexit->ToRoom && !pexit->ReverseExit )
                {
                  Exit *rev_exit = GetExitTo( pexit->ToRoom, GetReverseDirection(pexit->Direction), pRoomIndex->Vnum );
                  if ( rev_exit )
                    {
                      pexit->ReverseExit      = rev_exit;
                      rev_exit->ReverseExit   = pexit;
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
static int ExitComparator( Exit **xit1, Exit **xit2 )
{
  int d1, d2;

  d1 = (*xit1)->Direction;
  d2 = (*xit2)->Direction;

  if ( d1 < d2 )
    return -1;
  if ( d1 > d2 )
    return 1;
  return 0;
}
#endif

// TODO: Re-implement this.
static void SortExits( Room *room )
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

  qsort( &exits[0], nexits, sizeof( Exit * ),
         (int(*)(const void *, const void *)) ExitComparator );

  for ( int x = 0; x < nexits; x++ )
    {
      if ( x > 0 )
	{
	  exits[x]->Previous  = exits[x-1];
	}
      else
        {
          exits[x]->Previous        = NULL;
          room->FirstExit      = exits[x];
        }

      if ( x >= (nexits - 1) )
        {
          exits[x]->Next        = NULL;
          room->LastExit       = exits[x];
        }
      else
        {
          exits[x]->Next  = exits[x+1];
        ]
    }
#endif
}

void RandomizeExits( Room *room, short maxdir )
{
  int nexits = 0;
  DirectionType vdirs[MAX_REXITS];

  for(Exit *pexit : room->Exits())
    {
      vdirs[nexits++] = pexit->Direction;
    }
  
  for ( int d0 = 0; d0 < nexits; d0++ )
    {
      if ( vdirs[d0] > maxdir )
        continue;

      int count = 0;
      int d1 = 0;
      
      while ( vdirs[(d1 = GetRandomNumberFromRange( d0, nexits - 1 ))] > maxdir
              ||      ++count > 5 )
	;

      if ( vdirs[d1] > maxdir )
        continue;

      DirectionType door = vdirs[d0];
      vdirs[d0] = vdirs[d1];
      vdirs[d1] = door;
    }

  int count = 0;
  
  for(Exit *pexit : room->Exits())
    {
      pexit->Direction = vdirs[count++];
    }
  
  SortExits( room );
}

/*
 * Create an instance of a mobile.
 */
Character *AllocateMobile( ProtoMobile *pMobIndex )
{
  assert(pMobIndex != nullptr);

  Character *mob = new Character(pMobIndex);

  return mob;
}

Character *CreateMobile( ProtoMobile *proto )
{
  Character *mob = AllocateMobile( proto );

  /*
   * Insert in list.
   */
  AddCharacter( mob );
  proto->Count++;
  nummobsloaded++;
  return mob;
}

/*
 * Create an instance of an object.
 */
Object *AllocateObject( ProtoObject *pObjIndex, int level )
{
  assert(pObjIndex != nullptr);
  Object *obj = new Object(pObjIndex, level);
  return obj;
}

Object *CreateObject( ProtoObject *proto, int level )
{
  Object *obj = AllocateObject( proto, level );
  Objects->Add(obj);
  ++proto->Count;
  ++numobjsloaded;
  ++physicalobjects;

  return obj;
}

/*
 * Get an extra description from a list.
 */
std::string GetExtraDescription( const std::string &name,
                                 const std::list<ExtraDescription*> &extras )
{
  for(const ExtraDescription *ed : extras)
    {
      if ( IsName( name, ed->Keyword ) )
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
ProtoMobile *GetProtoMobile( vnum_t vnum )
{
  assert(vnum > 0);
  ProtoMobile *pMobIndex;

  for ( pMobIndex  = MobIndexHash[vnum % MAX_KEY_HASH];
        pMobIndex;
        pMobIndex  = pMobIndex->Next )
    {
      if ( pMobIndex->Vnum == vnum )
        {
          return pMobIndex;
        }
    }

  if ( fBootDb )
    {
      Log->Bug( "%s: bad vnum %d.", __FUNCTION__, vnum );
    }

  return NULL;
}

/*
 * Translates obj virtual number to its obj index struct.
 * Hash table lookup.
 */
ProtoObject *GetProtoObject( vnum_t vnum )
{
  assert(vnum > 0);
  ProtoObject *pObjIndex;

  for ( pObjIndex  = ObjectIndexHash[vnum % MAX_KEY_HASH];
        pObjIndex;
        pObjIndex  = pObjIndex->Next )
    if ( pObjIndex->Vnum == vnum )
      return pObjIndex;

  if ( fBootDb )
    Log->Bug( "%s: bad vnum %d.", __FUNCTION__, vnum );

  return NULL;
}

/*
 * Translates room virtual number to its room index struct.
 * Hash table lookup.
 */
Room *GetRoom( vnum_t vnum )
{
  assert(vnum > 0);
  Room *pRoomIndex;

  for ( pRoomIndex  = RoomIndexHash[vnum % MAX_KEY_HASH];
        pRoomIndex;
        pRoomIndex  = pRoomIndex->Next )
    if ( pRoomIndex->Vnum == vnum )
      return pRoomIndex;

  if ( fBootDb )
    Log->Bug( "%s: bad vnum %d.", __FUNCTION__, vnum );

  return NULL;
}

/*
 * Dump a text file to a player, a line at a time               -Thoric
 */
void ShowFile( const Character *ch, const std::string &filename )
{
  FILE *fp = nullptr;

  if ( (fp = fopen( filename.c_str(), "r" )) != NULL )
    {
      int num = 0;
      char buf[MAX_STRING_LENGTH];
      
      while ( !feof(fp) )
        {
          while ( ( buf[ num ] = fgetc( fp ) ) != (char) EOF
		  && buf[num] != '\n'
		  && buf[num] != '\r'
		  && num < (MAX_STRING_LENGTH-2))
            {
              num++;
            }
          
          int c = fgetc(fp);

          if ( (c != '\n' && c != '\r') || c == buf[num] )
            ungetc(c, fp);

          buf[num++] = '\n';
          buf[num++] = '\r';
          buf[num  ] = '\0';
          ch->Echo( buf );
          num = 0;
        }
    }
}

/*
 * wizlist builder!                                             -Thoric
 */
static void ToWizFile( const char *line )
{
  int filler, xx;
  char outline[MAX_STRING_LENGTH] = {'\0'};
  FILE *wfp;

  if ( !IsNullOrEmpty( line ) )
    {
      filler = ( 78-strlen( line ) );

      if ( filler < 1 )
        filler = 1;

      filler /= 2;

      for ( xx = 0; xx < filler; xx++ )
        strcat( outline, " " );

      strcat( outline, line );
    }

  strcat( outline, "\r\n" );
  wfp = fopen( WIZLIST_FILE, "a" );

  if ( wfp )
    {
      fputs( outline, wfp );
      fclose( wfp );
    }
}

static void AddToWizList( const char *name, int level )
{
#ifdef DEBUG
  Log->Info( "Adding to wizlist..." );
#endif

  Wizard *wiz = new Wizard();
  wiz->Name     = name;
  wiz->Level    = level;

  if ( !first_wiz )
    {
      first_wiz = wiz;
      last_wiz  = wiz;
      return;
    }

  /* insert sort, of sorts */
  for ( Wizard *tmp = first_wiz; tmp; tmp = tmp->Next )
    {
      if ( level > tmp->Level )
        {
          if ( !tmp->Last )
            first_wiz     = wiz;
          else
            tmp->Last->Next = wiz;
          
          wiz->Last = tmp->Last;
          wiz->Next = tmp;
          tmp->Last = wiz;
          return;
        }
    }
  
  wiz->Last             = last_wiz;
  wiz->Next             = NULL;
  last_wiz->Next        = wiz;
  last_wiz              = wiz;
}

/*
 * Wizlist builder                                              -Thoric
 */
void MakeWizlist( void )
{
  DIR *dp = nullptr;
  struct dirent *dentry;
  FILE *gfp = nullptr;
  const char *word = nullptr;
  int ilevel = 0, iflags = 0;
  Wizard *wiz = nullptr, *wiznext = nullptr;
  char buf[MAX_STRING_LENGTH];

  first_wiz = nullptr;
  last_wiz  = nullptr;

  dp = opendir( GOD_DIR );

  ilevel = 0;
  dentry = readdir( dp );

  while ( dentry )
    {
      if ( dentry->d_name[0] != '.' )
        {
          sprintf( buf, "%s%s", GOD_DIR, dentry->d_name );
          gfp = fopen( buf, "r" );

          if ( gfp )
            {
              word = feof( gfp ) ? "End" : ReadWord( gfp, Log, fBootDb );
              ilevel = ReadInt( gfp, Log, fBootDb );
              ReadToEndOfLine( gfp, Log, fBootDb );
              word = feof( gfp ) ? "End" : ReadWord( gfp, Log, fBootDb );

              if ( !StrCmp( word, "Pcflags" ) )
                iflags = ReadInt( gfp, Log, fBootDb );
              else
                iflags = 0;

              fclose( gfp );

              if ( IsBitSet( iflags, PCFLAG_RETIRED ) )
                ilevel = MAX_LEVEL - 4;

              if ( IsBitSet( iflags, PCFLAG_GUEST ) )
                ilevel = MAX_LEVEL - 4;

              AddToWizList( dentry->d_name, ilevel );
            }
        }

      dentry = readdir( dp );
    }

  closedir( dp );

  buf[0] = '\0';
  unlink( WIZLIST_FILE );
  ToWizFile( " Masters of Star Wars: Rise in Power!" );
  ilevel = 65535;

  for ( wiz = first_wiz; wiz; wiz = wiz->Next )
    {
      if ( wiz->Level > LEVEL_AVATAR )
        {
          if ( wiz->Level < ilevel )
            {
              if ( buf[0] )
                {
                  ToWizFile( buf );
                  buf[0] = '\0';
                }
	      
              ToWizFile( "" );
              ilevel = wiz->Level;

              switch(ilevel)
                {
                case MAX_LEVEL - 0:
		  ToWizFile( " Implementors " );
		  break;

		case MAX_LEVEL - 1:
		  ToWizFile( " Head Administrator " );
		  break;

		case MAX_LEVEL - 2:
		  ToWizFile( " Administrators " );
		  break;

		case MAX_LEVEL - 4:
		  ToWizFile( " Lower Immortals " );
		  break;

		default:
		  ToWizFile( " Builders" );
		  break;
                }
            }

          if ( strlen( buf ) + wiz->Name.size() > 76 )
            {
              ToWizFile( buf );
              buf[0] = '\0';
            }

	  strcat( buf, " " );
          strcat( buf, wiz->Name.c_str() );

          if ( strlen( buf ) > 70 )
            {
              ToWizFile( buf );
              buf[0] = '\0';
            }
        }
    }

  if ( buf[0] )
    ToWizFile( buf );

  for ( wiz = first_wiz; wiz; wiz = wiznext )
    {
      wiznext = wiz->Next;
      delete wiz;
    }
  
  first_wiz = NULL;
  last_wiz = NULL;
}

/*************************************************************/
/* Function to delete a room index.  Called from do_rdelete in build.c
   Narn, May/96
*/
bool DeleteRoom( Room *room )
{
  int iHash = 0;
  Room *tmp = nullptr, *prev = nullptr;

  iHash = room->Vnum % MAX_KEY_HASH;

  /* Take the room index out of the hash list. */
  for( tmp = RoomIndexHash[iHash]; tmp && tmp != room; tmp = tmp->Next )
    {
      prev = tmp;
    }

  if( !tmp )
    {
      Log->Bug( "%s: room not found", __FUNCTION__ );
      return false;
    }

  if( prev )
    {
      prev->Next = room->Next;
    }
  else
    {
      RoomIndexHash[iHash] = room->Next;
    }

  delete room;

  top_room--;
  return true;
}

/* See comment on DeleteRoom. */
bool DeleteObject( ProtoObject *obj )
{
  return true;
}

/* See comment on DeleteRoom. */
bool DeleteMobile( ProtoMobile *mob )
{
  return true;
}

/*
 * Creat a new room (for online building)                       -Thoric
 */
Room *MakeRoom( vnum_t vnum )
{
  Room *pRoomIndex = new Room();

  pRoomIndex->Vnum = vnum;
  pRoomIndex->Name = "Floating in a void";
  pRoomIndex->Flags = CreateBitSet<Flag::MAX>( { Flag::Room::Prototype } );
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
ProtoObject *MakeObject( vnum_t vnum, vnum_t cvnum, const std::string &name )
{
  ProtoObject *cObjIndex = nullptr;
  char buf[MAX_STRING_LENGTH];

  if ( cvnum > 0 )
    {
      cObjIndex = GetProtoObject( cvnum );
    }

  ProtoObject *pObjIndex = new ProtoObject(vnum);

  pObjIndex->Name = name;

  if ( !cObjIndex )
    {
      sprintf( buf, "A %s", name.c_str() );
      pObjIndex->ShortDescr    = buf;
      sprintf( buf, "A %s is here.", name.c_str() );
      pObjIndex->Description    = buf;
      pObjIndex->ShortDescr[0] = CharToLowercase(pObjIndex->ShortDescr[0]);
      pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);
      pObjIndex->ItemType      = ITEM_TRASH;
      pObjIndex->Flags    = ITEM_PROTOTYPE;
      pObjIndex->Weight         = 1;
    }
  else
    {
      pObjIndex->ShortDescr    = cObjIndex->ShortDescr;
      pObjIndex->Description    = cObjIndex->Description;
      pObjIndex->ActionDescription    = cObjIndex->ActionDescription;
      pObjIndex->ItemType      = cObjIndex->ItemType;
      pObjIndex->Flags    = cObjIndex->Flags | ITEM_PROTOTYPE;
      pObjIndex->WearFlags     = cObjIndex->WearFlags;

      pObjIndex->Weight         = cObjIndex->Weight;
      pObjIndex->Cost           = cObjIndex->Cost;

      for(ExtraDescription *ced : cObjIndex->ExtraDescriptions() )
        {
          ExtraDescription *ed = new ExtraDescription();
          ed->Keyword           = ced->Keyword;
          ed->Description               = ced->Description;
          pObjIndex->Add(ed);
          top_ed++;
        }

      for(const Affect *cpaf : cObjIndex->Affects())
        {
          Affect *paf = new Affect();
          paf->Type         = cpaf->Type;
          paf->Duration     = cpaf->Duration;
          paf->Location     = cpaf->Location;
          paf->Modifier     = cpaf->Modifier;
          paf->AffectedBy   = cpaf->AffectedBy;
          pObjIndex->Add(paf);
          top_affect++;
        }
    }

  int iHash                  = vnum % MAX_KEY_HASH;
  pObjIndex->Next        = ObjectIndexHash[iHash];
  ObjectIndexHash[iHash]  = pObjIndex;
  top_obj_index++;

  return pObjIndex;
}

/*
 * Create a new INDEX mobile (for online building)              -Thoric
 * Option to clone an existing index mobile.
 */
ProtoMobile *MakeMobile( vnum_t vnum, vnum_t cvnum, const std::string &name )
{
  ProtoMobile *cMobIndex = nullptr;
  char buf[MAX_STRING_LENGTH];

  if ( cvnum > 0 )
    {
      cMobIndex = GetProtoMobile( cvnum );
    }

  ProtoMobile *pMobIndex = new ProtoMobile(vnum);
  pMobIndex->Name = name;

  if ( !cMobIndex )
    {
      sprintf( buf, "A newly created %s", name.c_str() );
      pMobIndex->ShortDescr = buf;
      sprintf( buf, "Some god abandoned a newly created %s here.\r\n", name.c_str() );
      pMobIndex->LongDescr = buf;
      pMobIndex->ShortDescr[0] = CharToLowercase(pMobIndex->ShortDescr[0]);
      pMobIndex->LongDescr[0]  = CharToUppercase(pMobIndex->LongDescr[0]);
      pMobIndex->Flags          = ACT_NPC | ACT_PROTOTYPE;
      pMobIndex->Level          = 1;
      pMobIndex->Position       = DEFAULT_POSITION;
      pMobIndex->DefaultPosition    = DEFAULT_POSITION;
      pMobIndex->Sex            = SEX_NEUTRAL;
      pMobIndex->Stats.Str               = 10;
      pMobIndex->Stats.Dex               = 10;
      pMobIndex->Stats.Int               = 10;
      pMobIndex->Stats.Wis               = 10;
      pMobIndex->Stats.Cha               = 10;
      pMobIndex->Stats.Con               = 10;
      pMobIndex->Stats.Lck               = 10;
      pMobIndex->Race           = RACE_HUMAN;
    }
  else
    {
      pMobIndex->ShortDescr    = cMobIndex->ShortDescr;
      pMobIndex->LongDescr             = cMobIndex->LongDescr;
      pMobIndex->Description    = cMobIndex->Description;
      pMobIndex->Flags            = cMobIndex->Flags | ACT_PROTOTYPE;
      pMobIndex->AffectedBy    = cMobIndex->AffectedBy;
      pMobIndex->spec_fun               = cMobIndex->spec_fun;
      pMobIndex->spec_2         = cMobIndex->spec_2;
      pMobIndex->Alignment              = cMobIndex->Alignment;
      pMobIndex->Level          = cMobIndex->Level;
      pMobIndex->ArmorClass             = cMobIndex->ArmorClass;
      pMobIndex->HitNoDice              = cMobIndex->HitNoDice;
      pMobIndex->HitSizeDice    = cMobIndex->HitSizeDice;
      pMobIndex->HitPlus                = cMobIndex->HitPlus;
      pMobIndex->DamNoDice              = cMobIndex->DamNoDice;
      pMobIndex->DamSizeDice    = cMobIndex->DamSizeDice;
      pMobIndex->DamPlus                = cMobIndex->DamPlus;
      pMobIndex->Gold           = cMobIndex->Gold;
      pMobIndex->exp            = cMobIndex->exp;
      pMobIndex->Position               = cMobIndex->Position;
      pMobIndex->DefaultPosition    = cMobIndex->DefaultPosition;
      pMobIndex->Sex            = cMobIndex->Sex;
      pMobIndex->Stats.Str               = cMobIndex->Stats.Str;
      pMobIndex->Stats.Dex               = cMobIndex->Stats.Dex;
      pMobIndex->Stats.Int               = cMobIndex->Stats.Int;
      pMobIndex->Stats.Wis               = cMobIndex->Stats.Wis;
      pMobIndex->Stats.Cha               = cMobIndex->Stats.Cha;
      pMobIndex->Stats.Con               = cMobIndex->Stats.Con;
      pMobIndex->Stats.Lck               = cMobIndex->Stats.Lck;
      pMobIndex->Race           = cMobIndex->Race;
      pMobIndex->Resistant              = cMobIndex->Resistant;
      pMobIndex->Immune         = cMobIndex->Immune;
      pMobIndex->Susceptible    = cMobIndex->Susceptible;
      pMobIndex->NumberOfAttacks             = cMobIndex->NumberOfAttacks;
      pMobIndex->AttackFlags                = cMobIndex->AttackFlags;
      pMobIndex->DefenseFlags               = cMobIndex->DefenseFlags;
    }

  int iHash                         = vnum % MAX_KEY_HASH;
  pMobIndex->Next                       = MobIndexHash[iHash];
  MobIndexHash[iHash]         = pMobIndex;
  top_mob_index++;

  return pMobIndex;
}

/*
 * Creates a simple exit with no fields filled but rvnum and optionally
 * to_room and vnum.                                            -Thoric
 * Exits are inserted into the linked list based on vdir.
 */
Exit *MakeExit( Room *pRoomIndex, Room *to_room, DirectionType door, const std::string &keyword )
{
  Exit *pexit = new Exit();
  pexit->Direction           = door;
  pexit->ReverseVnum          = pRoomIndex->Vnum;
  pexit->ToRoom                = to_room;
  pexit->Distance               = 1;
  pexit->Keyword = keyword;
  
  if ( to_room )
    {
      pexit->Vnum = to_room->Vnum;
      Exit *texit = GetExitTo( to_room, GetReverseDirection(door), pRoomIndex->Vnum );

      if ( texit != nullptr )      /* assign reverse exit pointers */
        {
          texit->ReverseExit = pexit;
          pexit->ReverseExit = texit;
        }
    }

  pRoomIndex->Add(pexit);
  top_exit++;
  return pexit;
}

/* Build list of in_progress areas.  Do not load areas.
 * define AREA_READ if you want it to build area names rather than reading
 * them out of the area files. -- Altrag */
static void LoadBuildList( void )
{
  DIR *dp;
  struct dirent *dentry;
  FILE *fp;
  char buf[MAX_STRING_LENGTH];
  Area *pArea;
  char line[81];
  char word[81];
  int low, hi;
  int mlow, mhi, olow, ohi, rlow, rhi;
  bool badfile = false;
  int temp;

  dp = opendir( GOD_DIR );
  dentry = readdir( dp );

  while ( dentry )
    {
      if ( dentry->d_name[0] != '.' )
        {
          sprintf( buf, "%s%s", GOD_DIR, dentry->d_name );

          if ( !(fp = fopen( buf, "r" )) )
            {
              Log->Bug( "%s: invalid file", __FUNCTION__ );
              dentry = readdir(dp);
              continue;
            }

          Log->Info( buf );
          badfile = false;
          rlow=rhi=olow=ohi=mlow=mhi=0;

          while ( !feof(fp) && !ferror(fp) )
            {
              low = 0; hi = 0; word[0] = 0; line[0] = 0;

              if ( (temp = fgetc(fp)) != EOF )
                ungetc( temp, fp );
              else
                break;

              fgets(line, 80, fp);
              sscanf( line, "%s %d %d", word, &low, &hi );
              if ( !StrCmp( word, "Level" ) )
                {
                  if ( low < LEVEL_AVATAR )
                    {
                      sprintf( buf, "%s: God file with level %d < %d",
                               dentry->d_name, low, LEVEL_AVATAR );
                      badfile = true;
                    }
                }
              if ( !StrCmp( word, "RoomRange" ) )
                rlow = low, rhi = hi;
              else if ( !StrCmp( word, "MobRange" ) )
                mlow = low, mhi = hi;
              else if ( !StrCmp( word, "ObjRange" ) )
                olow = low, ohi = hi;
            }

          fclose( fp );

          if ( rlow && rhi && !badfile )
            {
              sprintf( buf, "%s%s.are", BUILD_DIR, dentry->d_name );

              if ( !(fp = fopen( buf, "r" )) )
                {
                  Log->Bug( "%s: cannot open area file for read", __FUNCTION__ );
                  dentry = readdir(dp);
                  continue;
                }

              strcpy( word, ReadWord( fp, Log, fBootDb ) );

              if ( word[0] != '#' || StrCmp( &word[1], "AREA" ) )
                {
                  sprintf( buf, "%s: %s.are: no #AREA found.",
                           __FUNCTION__, dentry->d_name );
                  fclose( fp );
                  dentry = readdir(dp);
                  continue;
                }

              pArea = new Area();
              sprintf( buf, "%s.are", dentry->d_name );
              pArea->Author = dentry->d_name;
              pArea->Filename = buf;
              pArea->Name = ReadStringToTilde( fp, Log, fBootDb );

              sprintf( buf, "{PROTO} %s's area in progress", dentry->d_name );
              pArea->Name = buf;

              fclose( fp );
              pArea->VnumRanges.Room.First = rlow;
              pArea->VnumRanges.Room.Last = rhi;
              pArea->VnumRanges.Mob.First = mlow;
              pArea->VnumRanges.Mob.Last = mhi;
              pArea->VnumRanges.Object.First = olow;
              pArea->VnumRanges.Object.Last = ohi;
              pArea->LevelRanges.Soft.Low = -1;
              pArea->LevelRanges.Soft.High = -1;
              pArea->LevelRanges.Hard.Low = -1;
              pArea->LevelRanges.Hard.High = -1;
              LINK( pArea, FirstBuild, LastBuild, Next, Previous );
              fprintf( stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld "
                       "Mobs: %5ld - %-5ld\n",
                       pArea->Filename.c_str(),
                       pArea->VnumRanges.Room.First, pArea->VnumRanges.Room.Last,
                       pArea->VnumRanges.Object.First, pArea->VnumRanges.Object.Last,
                       pArea->VnumRanges.Mob.First, pArea->VnumRanges.Mob.Last );
              SortArea( pArea, true );
            }
        }

      dentry = readdir(dp);
    }

  closedir(dp);
}

/*
 * Display vnums currently assigned to areas            -Altrag & Thoric
 * Sorted, and flagged if loaded.
 */
void ShowVnums( const Character *ch, vnum_t low, vnum_t high, bool proto, bool shownl,
		const std::string &loadst, const std::string &notloadst )
{
  const Area *pArea = NULL;
  const Area *first_sort = NULL;
  int count = 0;
  int loaded = 0;

  SetCharacterColor( AT_PLAIN, ch );

  if ( proto )
    first_sort = FirstBSort;
  else
    first_sort = FirstASort;

  for ( pArea = first_sort; pArea; pArea = pArea->NextSort )
    {
      if ( IsBitSet( pArea->Status, AREA_DELETED ) )
        continue;

      if ( pArea->VnumRanges.Room.First < low )
        continue;

      if ( pArea->VnumRanges.Room.Last > high )
        break;

      if ( IsBitSet(pArea->Status, AREA_LOADED) )
        loaded++;
      else if ( !shownl )
          continue;

      ch->Echo( "%-22s| Rooms: %10d - %-10d"
                " Objs: %10d - %-10d Mobs: %10d - %-10d%s\r\n",
                (!pArea->Filename.empty() ? pArea->Filename.c_str() : "(invalid)"),
                pArea->VnumRanges.Room.First, pArea->VnumRanges.Room.Last,
                pArea->VnumRanges.Object.First, pArea->VnumRanges.Object.Last,
                pArea->VnumRanges.Mob.First, pArea->VnumRanges.Mob.Last,
                IsBitSet(pArea->Status, AREA_LOADED) ? loadst.c_str() : notloadst.c_str() );
      count++;
    }

  ch->Echo( "Areas listed: %d  Loaded: %d\r\n", count, loaded );
}

/*
 * Append a string to a file.
 */
void AppendFile( const Character *ch, const std::string &file, const std::string &str )
{
  FILE *fp;

  if ( IsNpc(ch) || str.empty() )
    return;

  if ( ( fp = fopen( file.c_str(), "a" ) ) == NULL )
    {
      ch->Echo( "Could not open the file!\n\r" );
    }
  else
    {
      fprintf( fp, "[%5ld] %s: %s\n",
	       ch->InRoom ? ch->InRoom->Vnum : 0, ch->Name.c_str(), str.c_str() );
      fclose( fp );
    }
}

void AllocateRepositories(void)
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
}
