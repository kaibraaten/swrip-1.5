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

#include <time.h>
#include <string.h>
#include <ctype.h>
#include <stdarg.h>
#include "mud.h"
#include "arena.h"
#include "ship.h"
#include "shuttle.h"
#include "character.h"
#include "editor.h"
#include "help.h"
#include "craft.h"
#include "reset.h"
#include "shops.h"
#include "clan.h"
#include "command.h"
#include "social.h"
#include "skill.h"
#include "script.h"
#include "spaceobject.h"
#include "bounty.h"

/*
 * Globals.
 */

Wizard *first_wiz = NULL;
Wizard *last_wiz = NULL;

time_t last_restore_all_time = 0;

Shop *first_shop = NULL;
Shop *last_shop = NULL;

RepairShop *first_repair = NULL;
RepairShop *last_repair = NULL;

TeleportData *first_teleport = NULL;
TeleportData *last_teleport = NULL;

Object *extracted_obj_queue = NULL;
ExtractedCharacter *extracted_char_queue = NULL;

Character *first_char = NULL;
Character *last_char = NULL;
char log_buf[2*MAX_INPUT_LENGTH];

Object *first_object = NULL;
Object *last_object = NULL;
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

/* for searching */
short gsn_first_spell = 0;
short gsn_first_skill = 0;
short gsn_first_weapon = 0;
short gsn_first_tongue = 0;
short gsn_TopSN = 0;

/*
 * Locals.
 */
ProtoMobile *mob_index_hash[MAX_KEY_HASH];
ProtoObject *obj_index_hash[MAX_KEY_HASH];
Room *room_index_hash[MAX_KEY_HASH];

Area *first_area = NULL;
Area *last_area = NULL;
Area *first_build = NULL;
Area *last_build = NULL;
Area *first_asort = NULL;
Area *last_asort = NULL;
Area *first_bsort = NULL;
Area *last_bsort = NULL;

SystemData SysData;

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
static void LoadArea( FILE *fp );
static void LoadAuthor( Area *tarea, FILE *fp );
static void LoadEconomy( Area *tarea, FILE *fp );
static void LoadResetMessage( Area *tarea, FILE *fp ); /* Rennard */
static void LoadFlags( Area *tarea, FILE *fp );
static void LoadMobiles( Area *tarea, FILE *fp );
static void LoadObjects( Area *tarea, FILE *fp );
static void LoadResets( Area *tarea, FILE *fp );
static void LoadRooms( Area *tarea, FILE *fp );
static void LoadShops( Area *tarea, FILE *fp );
static void LoadRepairs( Area *tarea, FILE *fp );
static void LoadSpecials( Area *tarea, FILE *fp );
static void LoadRanges( Area *tarea, FILE *fp );
static void LoadBuildList( void );
static void LoadSystemData( void );
static void LoadBanList( void );
static void InitializeEconomy( void );
static void FixExits( void );
static void ShutdownMud( const char *reason );
static int ExitComparator( Exit **xit1, Exit **xit2 );
static void SortExits( Room *room );
static void ToWizFile( const char *line );
static void AddToWizList( const char *name, int level );
static void PushSystemData( lua_State *L, const void* );

/*
 * MUDprogram locals
 */
static int MudProgNameToType( const char* name );
static MPROG_DATA *MobProgReadFile( const char* f, MPROG_DATA* mprg, ProtoMobile *pMobIndex );
static MPROG_DATA *ObjProgReadFile( const char* f, MPROG_DATA* mprg, ProtoObject *pObjIndex );
static MPROG_DATA *RoomProgReadFile( const char* f, MPROG_DATA* mprg, Room *pRoomIndex );
static void LoadMudProgs( Area *tarea, FILE* fp );
static void LoadObjProgs( Area *tarea, FILE* fp );
static void MobProgReadPrograms( FILE* fp, ProtoMobile *pMobIndex );
static void ObjProgReadPrograms( FILE* fp, ProtoObject *pObjIndex );
static void RoomProgReadPrograms( FILE* fp, Room *pRoomIndex );

static void ShutdownMud( const char *reason )
{
  FILE *fp;

  if ( (fp = fopen( SHUTDOWN_FILE, "a" )) != NULL )
    {
      fprintf( fp, "%s\n", reason );
      fclose( fp );
    }
}

/*
 * Big mama top level function.
 */
void BootDatabase( bool fCopyOver )
{
  short wear, x;

  unlink( BOOTLOG_FILE );
  BootLog( "---------------------[ Boot Log ]--------------------" );

  LogPrintf( "Loading commands" );
  LoadCommands();

  LogPrintf( "Loading SysData.configuration..." );

  /* default values */
  SysData.ReadAllMail             = LEVEL_CREATOR;
  SysData.ReadMailFree            = LEVEL_IMMORTAL;
  SysData.WriteMailFree           = LEVEL_IMMORTAL;
  SysData.TakeOthersMail          = LEVEL_CREATOR;
  SysData.LevelOfBuildChannel     = LEVEL_CREATOR;
  SysData.LevelOfLogChannel       = LEVEL_LOG;
  SysData.LevelToModifyProto      = LEVEL_CREATOR;
  SysData.LevelToOverridePrivateFlag  = LEVEL_GREATER;
  SysData.LevelToMsetPlayers       = LEVEL_CREATOR;
  SysData.StunModPlrVsPlr         = 15;
  SysData.StunRegular            = 15;
  SysData.DamagePlrVsPlr          = 100;
  SysData.DamagePlrVsMob          = 100;
  SysData.DamageMobVsPlr          = 100;
  SysData.DamageMobVsMob          = 100;
  SysData.LevelToGetObjectsWithoutTakeFlag = LEVEL_GREATER;
  SysData.SaveFrequency          = 20;   /* minutes */
  SysData.DisableHunger          = false;
  SysData.SaveFlags              = SV_DEATH | SV_PASSCHG | SV_AUTO
    | SV_PUT | SV_DROP | SV_GIVE
    | SV_AUCTION | SV_ZAPDROP | SV_IDLE;

  LoadSystemData();

  LogPrintf("Loading socials");
  LoadSocials();

  LogPrintf("Loading skill table");
  LoadSkills();
  SortSkillTable();

  gsn_TopSN = TopSN;

  for ( x = 0; x < TopSN; x++ )
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

  LogPrintf("Loading herb table");
  LoadHerbs();

  LogPrintf("Making wizlist");
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
  AllocateMemory( auction, Auction, 1);
  auction->item       = NULL;

  for ( wear = 0; wear < MAX_WEAR; wear++ )
    for ( x = 0; x < MAX_LAYERS; x++ )
      save_equipment[wear][x] = NULL;

  /*
   * Init random number generator.
   */
  LogPrintf("Initializing random number generator");
  InitMM();
  srand( time(0) );

  /*
   * Set time and weather.
   */
  {
    long lhour = 0, lday = 0, lmonth = 0;

    LogPrintf("Setting time and weather");

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
  }


  /*
   * Assign gsn's for skills which need them.
   */
  {
    LogPrintf("Assigning gsn's");
    ASSIGN_GSN( gsn_cloak, "cloak" );
    ASSIGN_GSN( gsn_cutdoor, "cutdoor" );
    ASSIGN_GSN( gsn_bind, "bind" );
    ASSIGN_GSN( gsn_slicing, "slicing" );
    ASSIGN_GSN( gsn_addpatrol , "add_patrol" );
    ASSIGN_GSN( gsn_eliteguard , "elite_guard" );
    ASSIGN_GSN( gsn_gather_intelligence , "gather_intelligence" );
    ASSIGN_GSN( gsn_specialforces , "special_forces" );
    ASSIGN_GSN( gsn_jail , "jail" );
    ASSIGN_GSN( gsn_smalltalk , "smalltalk" );
    ASSIGN_GSN( gsn_propaganda , "propaganda" );
    ASSIGN_GSN( gsn_bribe , "bribe" );
    ASSIGN_GSN( gsn_seduce , "seduce" );
    ASSIGN_GSN( gsn_masspropaganda , "mass_propaganda" );
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
    ASSIGN_GSN( gsn_postguard   , "post guard" );
    ASSIGN_GSN( gsn_torture   , "torture" );
    ASSIGN_GSN( gsn_throw   , "throw" );
    ASSIGN_GSN( gsn_snipe   , "snipe" );
    ASSIGN_GSN( gsn_disguise   , "disguise" );
    ASSIGN_GSN( gsn_mine   , "mine" );
    ASSIGN_GSN( gsn_first_aid   , "first aid" );
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
    ASSIGN_GSN( gsn_poison_weapon,      "poison weapon" );
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
    ASSIGN_GSN( gsn_common,             "common" );
    ASSIGN_GSN( gsn_wookiee,    "wookiee" );
    ASSIGN_GSN( gsn_twilek,     "twilek" );
    ASSIGN_GSN( gsn_rodian,             "rodian" );
    ASSIGN_GSN( gsn_hutt,               "hutt" );
    ASSIGN_GSN( gsn_mon_calamari,       "mon calamari" );
    ASSIGN_GSN( gsn_noghri,     "shistavanen" );
    ASSIGN_GSN( gsn_gamorrean,  "gamorrean" );
    ASSIGN_GSN( gsn_jawa,       "jawa" );
    ASSIGN_GSN( gsn_adarian,        "adarian" );
    ASSIGN_GSN( gsn_ewok,           "ewok" );
    ASSIGN_GSN( gsn_verpine,        "verpine" );
    ASSIGN_GSN( gsn_defel,          "defel" );
    ASSIGN_GSN( gsn_trandoshan,     "trandoshan" );
    ASSIGN_GSN( gsn_chadra_fan,     "chadra-fan" );
    ASSIGN_GSN( gsn_quarren,        "quarren" );
    ASSIGN_GSN( gsn_barabel, "barabel" );
    ASSIGN_GSN( gsn_firrerreo, "firrerreo" );
    ASSIGN_GSN( gsn_bothan, "bothan" );
    ASSIGN_GSN( gsn_coynite, "coynite" );
    ASSIGN_GSN( gsn_duros, "duros" );
    ASSIGN_GSN( gsn_gand, "gand" );
    ASSIGN_GSN( gsn_kubaz, "kubaz" );
    ASSIGN_GSN( gsn_togorian, "togorian" );
    ASSIGN_GSN( gsn_yevethan, "yevethan" );
    ASSIGN_GSN( gsn_sullustan,      "sullustan" );
    ASSIGN_GSN( gsn_shipdocking,    "ship docking" );
  }

  /*
   * Read in all the area files.
   */
  {
    FILE *fpList;

    LogPrintf("Reading in area files...");

    if ( ( fpList = fopen( AREA_DIR AREA_LIST, "r" ) ) == NULL )
      {
        ShutdownMud( "Unable to open area list" );
        exit( 1 );
      }

    for ( ; ; )
      {
        strcpy( strArea, ReadWord( fpList ) );

        if ( strArea[0] == '$' )
          break;

        LoadAreaFile( last_area, strArea );
      }

    fclose( fpList );
  }

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
  LogPrintf( "Fixing exits" );
  FixExits();

  fBootDb     = false;

  LogPrintf( "Initializing economy" );
  InitializeEconomy();

  /*loads vendors on each reboot -Legonas*/
  LogPrintf( "Reading in Vendors" );
  LoadVendors();

  LogPrintf( "Reading in Storerooms" );
  LoadStorerooms();

  LogPrintf( "Loading buildlist" );
  LoadBuildList();

  LogPrintf( "Loading boards" );
  LoadBoards();

  LogPrintf( "Loading clans" );
  /*LoadClans();*/
  NewLoadClans();

  LogPrintf( "Loading bans" );
  LoadBanList();

  LogPrintf( "Loading corpses" );
  LoadCorpses();

  LogPrintf( "Loading spaceobjects" );
  LoadSpaceobjects();

  LogPrintf( "Loading ships" );
  LoadShips();

  LogPrintf( "Loading bounties" );
  LoadBounties();

  LogPrintf( "Loading governments" );
  LoadPlanets();

  LogPrintf( "Loading shuttles" );
  LoadShuttles();

  LogPrintf( "Loading Hall of Fame" );
  LoadHallOfFame();

  LogPrintf( "Loading help files" );
  LoadHelpFiles();

  LogPrintf( "Resetting areas" );
  AreaUpdate();

  MOBtrigger = true;

  if( fCopyOver )
    {
      LogPrintf( "Running RecoverFromCopyover." );
      RecoverFromCopyover();
    }
}

/*
 * Load an 'area' header line.
 */
static void LoadArea( FILE *fp )
{
  Area *pArea;

  AllocateMemory( pArea, Area, 1 );
  pArea->Name           = ReadStringToTilde( fp );
  pArea->Author       = CopyString( "unknown" );
  pArea->Filename       = CopyString( strArea );
  pArea->Age            = 15;
  pArea->LevelRanges.HighSoft  = MAX_LEVEL;
  pArea->LevelRanges.HighHard  = MAX_LEVEL;

  LINK( pArea, first_area, last_area, Next, Previous );
  top_area++;
}

/*
 * Load an author section. Scryn 2/1/96
 */
static void LoadAuthor( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
	{
	  return;
	}
    }

  if ( tarea->Author )
    FreeMemory( tarea->Author );

  tarea->Author = ReadStringToTilde( fp );
}

/*
 * Load an economy section. Thoric
 */
static void LoadEconomy( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
	{
	  return;
	}
    }

  tarea->HighEconomy   = ReadInt( fp );
  tarea->LowEconomy    = ReadInt( fp );
}

/* Reset Message Load, Rennard */
static void LoadResetMessage( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
	{
	  return;
	}
    }

  if ( tarea->ResetMessage )
    FreeMemory( tarea->ResetMessage );

  tarea->ResetMessage = ReadStringToTilde( fp );
}

/*
 * Load area flags. Narn, Mar/96
 */
static void LoadFlags( Area *tarea, FILE *fp )
{
  const char *ln = NULL;
  int x1 = 0, x2 = 0;

  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
	{
	  return;
	}
    }

  ln = ReadLine( fp );
  sscanf( ln, "%d %d", &x1, &x2 );
  tarea->Flags = x1;
  tarea->ResetFrequency = x2;

  if ( x2 )
    tarea->Age = x2;
}

/*
 * Add a character to the list of all characters                -Thoric
 */
void AddCharacter( Character *ch )
{
  LINK( ch, first_char, last_char, Next, Previous );
}

/*
 * Load a mob section.
 */
static void LoadMobiles( Area *tarea, FILE *fp )
{
  ProtoMobile *pMobIndex = 0;
  const char *ln = NULL;
  int x1, x2, x3, x4, x5, x6, x7, x8;

  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
	{
	  return;
	}
    }

  for ( ; ; )
    {
      char buf[MAX_STRING_LENGTH];
      vnum_t vnum = INVALID_VNUM;
      int iHash = 0;
      bool oldmob = false;
      bool tmpBootDb = false;
      char letter = ReadChar( fp );

      if ( letter != '#' )
        {
          Bug( "%s: # not found.", __FUNCTION__ );

          if ( fBootDb )
            {
              ShutdownMud( "# not found" );
              exit( 1 );
            }
          else
	    {
	      return;
	    }
        }

      vnum = ReadInt( fp );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetProtoMobile( vnum ) )
        {
          if ( tmpBootDb )
            {
              Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              pMobIndex = GetProtoMobile( vnum );
              sprintf( buf, "Cleaning mobile: %ld", vnum );
              LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
              CleanMobile( pMobIndex );
              oldmob = true;
            }
        }
      else
        {
          oldmob = false;
          AllocateMemory( pMobIndex, ProtoMobile, 1 );
        }

      fBootDb = tmpBootDb;
      pMobIndex->Vnum = vnum;

      if ( fBootDb )
        {
          if ( !tarea->VnumRanges.FirstMob )
            tarea->VnumRanges.FirstMob   = vnum;

          if ( vnum > tarea->VnumRanges.LastMob )
            tarea->VnumRanges.LastMob    = vnum;
        }

      pMobIndex->Name     = ReadStringToTilde( fp );
      pMobIndex->ShortDescr     = ReadStringToTilde( fp );
      pMobIndex->LongDescr      = ReadStringToTilde( fp );
      pMobIndex->Description     = ReadStringToTilde( fp );

      pMobIndex->LongDescr[0]   = CharToUppercase(pMobIndex->LongDescr[0]);
      pMobIndex->Description[0]  = CharToUppercase(pMobIndex->Description[0]);

      pMobIndex->Flags           = ReadInt( fp ) | ACT_NPC;
      pMobIndex->AffectedBy     = ReadInt( fp );
      pMobIndex->Shop           = NULL;
      pMobIndex->RepairShop           = NULL;
      pMobIndex->Alignment       = ReadInt( fp );
      letter                     = ReadChar( fp );
      pMobIndex->Level           = ReadInt( fp );

      pMobIndex->MobThac0        = ReadInt( fp );
      pMobIndex->ArmorClass      = ReadInt( fp );
      pMobIndex->HitNoDice       = ReadInt( fp );
      /* 'd'            */         ReadChar( fp );
      pMobIndex->HitSizeDice     = ReadInt( fp );
      /* '+'            */         ReadChar( fp );
      pMobIndex->HitPlus         = ReadInt( fp );
      pMobIndex->DamNoDice       = ReadInt( fp );
      /* 'd'            */         ReadChar( fp );
      pMobIndex->DamSizeDice     = ReadInt( fp );
      /* '+'            */         ReadChar( fp );
      pMobIndex->DamPlus         = ReadInt( fp );
      pMobIndex->Gold            = ReadInt( fp );
      pMobIndex->exp             = ReadInt( fp );
      pMobIndex->Position        = ReadInt( fp );
      pMobIndex->DefaultPosition     = ReadInt( fp );

      /*
       * Back to meaningful values.
       */
      pMobIndex->Sex             = ReadInt( fp );

      if ( letter != 'S' && letter != 'C' && letter != 'Z' )
        {
          Bug( "%s: vnum %d: letter '%c' not Z, S or C.", __FUNCTION__, vnum,
               letter );
          ShutdownMud( "bad mob data" );
          exit( 1 );
        }

      if ( letter == 'C' || letter == 'Z' ) /* Realms complex mob       -Thoric  */
        {
          pMobIndex->Stats.PermStr       = ReadInt( fp );
          pMobIndex->Stats.PermInt       = ReadInt( fp );
          pMobIndex->Stats.PermWis       = ReadInt( fp );
          pMobIndex->Stats.PermDex       = ReadInt( fp );
          pMobIndex->Stats.PermCon       = ReadInt( fp );
          pMobIndex->Stats.PermCha       = ReadInt( fp );
          pMobIndex->Stats.PermLck       = ReadInt( fp );
          pMobIndex->Saving.PoisonDeath  = ReadInt( fp );
          pMobIndex->Saving.Wand         = ReadInt( fp );
          pMobIndex->Saving.ParaPetri    = ReadInt( fp );
          pMobIndex->Saving.Breath       = ReadInt( fp );
          pMobIndex->Saving.SpellStaff   = ReadInt( fp );

          ln = ReadLine( fp );
          x1=x2=x3=x4=x5=x6=x7=0;
          sscanf( ln, "%d %d %d %d %d %d %d",
                  &x1, &x2, &x3, &x4, &x5, &x6, &x7 );

          pMobIndex->Race               = x1;
          pMobIndex->Height             = x3;
          pMobIndex->Weight             = x4;
          pMobIndex->Speaks             = x5;
          pMobIndex->Speaking           = x6;
          pMobIndex->NumberOfAttacks         = x7;

          if ( !pMobIndex->Speaks )
            pMobIndex->Speaks = RaceTable[pMobIndex->Race].Language | LANG_COMMON;

          if ( !pMobIndex->Speaking )
            pMobIndex->Speaking = RaceTable[pMobIndex->Race].Language;

          ln = ReadLine( fp );
          x1=x2=x3=x4=x5=x6=x7=x8=0;
          sscanf( ln, "%d %d %d %d %d %d %d %d",
                  &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8 );

          pMobIndex->HitRoll            = x1;
          pMobIndex->DamRoll            = x2;
          pMobIndex->BodyParts             = x3;
          pMobIndex->Resistant          = x4;
          pMobIndex->Immune             = x5;
          pMobIndex->Susceptible        = x6;
          pMobIndex->AttackFlags            = x7;
          pMobIndex->DefenseFlags           = x8;
        }
      else
        {
          pMobIndex->Stats.PermStr  = 10;
          pMobIndex->Stats.PermDex  = 10;
          pMobIndex->Stats.PermInt  = 10;
          pMobIndex->Stats.PermWis  = 10;
          pMobIndex->Stats.PermCha  = 10;
          pMobIndex->Stats.PermCon  = 10;
          pMobIndex->Stats.PermLck  = 10;
          pMobIndex->Race            = 0;
          pMobIndex->BodyParts          = 0;
          pMobIndex->Resistant       = 0;
          pMobIndex->Immune          = 0;
          pMobIndex->Susceptible     = 0;
          pMobIndex->NumberOfAttacks      = 0;
          pMobIndex->AttackFlags         = 0;
          pMobIndex->DefenseFlags        = 0;
        }

      if ( letter == 'Z' ) /*  STar Wars Reality Complex Mob  */
        {
          ln = ReadLine( fp );
          x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = 0;
          sscanf( ln, "%d %d %d %d %d %d %d %d",
                  &x1, &x2, &x3, &x4, &x5,  &x6,  &x7,  &x8);
          pMobIndex->VipFlags = x1;
        }

      letter = ReadChar( fp );

      if ( letter == '>' )
        {
          ungetc( letter, fp );
          MobProgReadPrograms( fp, pMobIndex );
        }
      else
	{
	  ungetc( letter,fp );
	}

      if ( !oldmob )
        {
          iHash                 = vnum % MAX_KEY_HASH;
          pMobIndex->Next       = mob_index_hash[iHash];
          mob_index_hash[iHash] = pMobIndex;
          top_mob_index++;
        }
    }
}



/*
 * Load an obj section.
 */
static void LoadObjects( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
	{
	  return;
	}
    }

  for ( ; ; )
    {
      ProtoObject *pObjIndex;
      const char *ln;
      int x1, x2, x3, x4, x5, x6;
      char buf[MAX_STRING_LENGTH];
      vnum_t vnum = INVALID_VNUM;
      int iHash = 0;
      bool tmpBootDb = false;
      bool oldobj = false;
      char letter = ReadChar( fp );

      if ( letter != '#' )
        {
          Bug( "%s: # not found.", __FUNCTION__ );

          if ( fBootDb )
            {
              ShutdownMud( "# not found" );
              exit( 1 );
            }
          else
	    {
	      return;
	    }
        }

      vnum = ReadInt( fp );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetProtoObject( vnum ) )
        {
          if ( tmpBootDb )
            {
              Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              pObjIndex = GetProtoObject( vnum );
              sprintf( buf, "Cleaning object: %ld", vnum );
              LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
              CleanObject( pObjIndex );
              oldobj = true;
            }
        }
      else
        {
          oldobj = false;
          AllocateMemory( pObjIndex, ProtoObject, 1 );
        }

      fBootDb = tmpBootDb;

      pObjIndex->Vnum = vnum;

      if ( fBootDb )
        {
          if ( !tarea->VnumRanges.FirstObject )
            tarea->VnumRanges.FirstObject = vnum;

          if ( vnum > tarea->VnumRanges.LastObject )
            tarea->VnumRanges.LastObject = vnum;
        }

      pObjIndex->Name         = ReadStringToTilde( fp );
      pObjIndex->ShortDescr  = ReadStringToTilde( fp );
      pObjIndex->Description  = ReadStringToTilde( fp );
      pObjIndex->ActionDescription  = ReadStringToTilde( fp );

      /* Commented out by Narn, Apr/96 to allow item short descs like
         Bonecrusher and Oblivion */
      pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);

      ln = ReadLine( fp );
      x1=x2=x3=x4=0;
      sscanf( ln, "%d %d %d %d",
              &x1, &x2, &x3, &x4 );
      pObjIndex->ItemType              = x1;
      pObjIndex->Flags            = x2;
      pObjIndex->WearFlags             = x3;
      pObjIndex->Layers         = x4;

      ln = ReadLine( fp );
      x1=x2=x3=x4=x5=x6=0;
      sscanf( ln, "%d %d %d %d %d %d",
              &x1, &x2, &x3, &x4, &x5, &x6 );
      pObjIndex->Value[0]               = x1;
      pObjIndex->Value[1]               = x2;
      pObjIndex->Value[2]               = x3;
      pObjIndex->Value[3]               = x4;
      pObjIndex->Value[4]               = x5;
      pObjIndex->Value[5]               = x6;
      pObjIndex->Weight         = ReadInt( fp );
      pObjIndex->Weight = umax( 1, pObjIndex->Weight );
      pObjIndex->Cost                   = ReadInt( fp );
      pObjIndex->Rent                   = ReadInt( fp ); /* unused */

      for ( ; ; )
        {
          letter = ReadChar( fp );

          if ( letter == 'A' )
            {
              Affect *paf;

              AllocateMemory( paf, Affect, 1 );
              paf->Type         = -1;
              paf->Duration             = -1;
              paf->Location             = ReadInt( fp );
              if ( paf->Location == APPLY_WEAPONSPELL
                   ||   paf->Location == APPLY_WEARSPELL
                   ||   paf->Location == APPLY_REMOVESPELL
                   ||   paf->Location == APPLY_STRIPSN )
                paf->Modifier           = SkillNumberFromSlot( ReadInt(fp) );
              else
                paf->Modifier           = ReadInt( fp );
              paf->AffectedBy           = 0;
              LINK( paf, pObjIndex->FirstAffect, pObjIndex->LastAffect,
                    Next, Previous );
              top_affect++;
            }

          else if ( letter == 'E' )
            {
              ExtraDescription *ed;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->Keyword               = ReadStringToTilde( fp );
              ed->Description           = ReadStringToTilde( fp );
              LINK( ed, pObjIndex->FirstExtraDescription, pObjIndex->LastExtraDescription,
                    Next, Previous );
              top_ed++;
            }
          else if ( letter == '>' )
            {
              ungetc( letter, fp );
              ObjProgReadPrograms( fp, pObjIndex );
            }

          else
            {
              ungetc( letter, fp );
              break;
            }
        }

      /*
       * Translate spell "slot numbers" to internal "skill numbers."
       */
      switch ( pObjIndex->ItemType )
        {
        case ITEM_PILL:
        case ITEM_POTION:
          pObjIndex->Value[OVAL_PILL_SPELL1] = SkillNumberFromSlot( pObjIndex->Value[OVAL_PILL_SPELL1] );
          pObjIndex->Value[OVAL_PILL_SPELL2] = SkillNumberFromSlot( pObjIndex->Value[OVAL_PILL_SPELL2] );
          pObjIndex->Value[OVAL_PILL_SPELL3] = SkillNumberFromSlot( pObjIndex->Value[OVAL_PILL_SPELL3] );
          break;

        case ITEM_DEVICE:
          pObjIndex->Value[OVAL_DEVICE_SPELL] = SkillNumberFromSlot( pObjIndex->Value[OVAL_DEVICE_SPELL] );
          break;

        case ITEM_SALVE:
          pObjIndex->Value[OVAL_SALVE_SPELL1] = SkillNumberFromSlot( pObjIndex->Value[OVAL_SALVE_SPELL1] );
          pObjIndex->Value[OVAL_SALVE_SPELL2] = SkillNumberFromSlot( pObjIndex->Value[OVAL_SALVE_SPELL2] );
          break;
        }

      if ( !oldobj )
        {
          iHash                 = vnum % MAX_KEY_HASH;
          pObjIndex->Next       = obj_index_hash[iHash];
          obj_index_hash[iHash] = pObjIndex;
          top_obj_index++;
        }
    }
}



/*
 * Load a reset section.
 */
static void LoadResets( Area *tarea, FILE *fp )
{
  /*bool not01 = false;*/
  int count = 0;

  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        return;
    }

  if ( tarea->FirstReset )
    {
      if ( fBootDb )
        {
          Reset *rtmp;

          Bug( "%s: WARNING: resets already exist for this area.", __FUNCTION__ );

          for ( rtmp = tarea->FirstReset; rtmp; rtmp = rtmp->Next )
            ++count;
        }
      else
        {
          /*
           * Clean out the old resets
           */
	  char buf[MAX_STRING_LENGTH];
          sprintf( buf, "Cleaning resets: %s", tarea->Name );
          LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
          CleanResets( tarea );
        }
    }

  for ( ; ; )
    {
      /*Room *pRoomIndex;
	Exit *pexit;*/
      char letter;
      int extra, arg1, arg2, arg3;

      if ( ( letter = ReadChar( fp ) ) == 'S' )
        break;

      if ( letter == '*' )
        {
          ReadToEndOfLine( fp );
          continue;
        }

      extra     = ReadInt( fp );
      arg1      = ReadInt( fp );
      arg2      = ReadInt( fp );
      arg3      = (letter == 'G' || letter == 'R') ? 0 : ReadInt( fp );
      ReadToEndOfLine( fp );

      ++count;

      /*
       * Validate parameters.
       * We're calling the index functions for the side effect.
       */
      /*
      switch ( letter )
        {
        default:
          Bug( "%s: bad command '%c'.", __FUNCTION__, letter );

          if ( fBootDb )
            BootLog( "%s: %s (%d) bad command '%c'.",
		     __FUNCTION__, tarea->Filename, count, letter );
          return;

        case 'M':
          if ( GetProtoMobile( arg1 ) == NULL && fBootDb )
            BootLog( "%s: %s (%d) 'M': mobile %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, arg1 );

          if ( GetRoom( arg3 ) == NULL && fBootDb )
            BootLog( "%s: %s (%d) 'M': room %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, arg3 );
          break;

        case 'O':
          if ( GetProtoObject(arg1) == NULL && fBootDb )
            BootLog( "%s: %s (%d) '%c': object %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, letter, arg1 );

          if ( GetRoom(arg3) == NULL && fBootDb )
            BootLog( "%s: %s (%d) '%c': room %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, letter, arg3 );
          break;

        case 'P':
          if ( GetProtoObject(arg1) == NULL && fBootDb )
            BootLog( "%s: %s (%d) '%c': object %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, letter, arg1 );

          if ( arg3 > 0 )
            {
              if ( GetProtoObject(arg3) == NULL && fBootDb )
                BootLog( "%s: %s (%d) 'P': destination object %d doesn't exist.",
			 __FUNCTION__, tarea->Filename, count, arg3 );
            }
          else if ( extra > 1 )
            not01 = true;

          break;

        case 'G':
        case 'E':
          if ( GetProtoObject(arg1) == NULL && fBootDb )
            BootLog( "%s: %s (%d) '%c': object %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, letter, arg1 );
          break;

        case 'T':
          break;

        case 'H':
          if ( arg1 > 0 )
            if ( GetProtoObject(arg1) == NULL && fBootDb )
              BootLog( "%s: %s (%d) 'H': object %d doesn't exist.",
		       __FUNCTION__, tarea->Filename, count, arg1 );
          break;

        case 'D':
          pRoomIndex = GetRoom( arg1 );

          if ( !pRoomIndex )
            {
              Bug( "%s: 'D': room %d doesn't exist.", __FUNCTION__, arg1 );
              Bug( "Reset: %c %d %d %d %d", letter, extra, arg1, arg2, arg3 );

              if ( fBootDb )
                BootLog( "%s: %s (%d) 'D': room %d doesn't exist.",
			 __FUNCTION__, tarea->Filename, count, arg1 );
              break;
            }

          if ( arg2 < 0
               ||   arg2 > MAX_DIR+1
               || ( pexit = GetExit(pRoomIndex, arg2)) == NULL
               || !IsBitSet( pexit->Flags, EX_ISDOOR ) )
            {
              Bug( "%s: 'D': exit %d not door.", __FUNCTION__, arg2 );
              Bug( "Reset: %c %d %d %d %d", letter, extra, arg1, arg2, arg3 );

              if ( fBootDb )
                BootLog( "%s: %s (%d) 'D': exit %d not door.",
			 __FUNCTION__, tarea->Filename, count, arg2 );
            }

          if ( arg3 < 0 || arg3 > 2 )
            {
              Bug( "%s: 'D': bad 'locks': %d.", __FUNCTION__, arg3 );

              if ( fBootDb )
                BootLog( "%s: %s (%d) 'D': bad 'locks': %d.",
			 __FUNCTION__, tarea->Filename, count, arg3 );
            }
          break;

        case 'R':
          pRoomIndex = GetRoom( arg1 );

          if ( !pRoomIndex && fBootDb )
            BootLog( "%s: %s (%d) 'R': room %d doesn't exist.",
		     __FUNCTION__, tarea->Filename, count, arg1 );

          if ( arg2 < 0 || arg2 > 6 )
            {
              Bug( "%s: 'R': bad exit %d.", __FUNCTION__, arg2 );

              if ( fBootDb )
                BootLog( "%s: %s (%d) 'R': bad exit %d.",
			 __FUNCTION__, tarea->Filename, count, arg2 );
              break;
            }

          break;
        }
      */
      /* finally, add the reset */
      AddReset( tarea, letter, extra, arg1, arg2, arg3 );
    }

  /*if ( !not01 )*/
  RenumberPutResets(tarea);
}

/*
 * Load a room section.
 */
static void LoadRooms( Area *tarea, FILE *fp )
{
  Room *pRoomIndex;
  const char *ln;

  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );
      ShutdownMud( "No #AREA" );
      exit( 1 );
    }

  for ( ; ; )
    {
      vnum_t vnum = INVALID_VNUM;
      DirectionType door = DIR_NORTH;
      int iHash = 0;
      bool tmpBootDb = false;
      bool oldroom = false;
      int x1, x2, x3, x4, x5, x6;
      char letter = ReadChar( fp );

      if ( letter != '#' )
        {
          Bug( "%s: # not found.", __FUNCTION__ );

          if ( fBootDb )
            {
              ShutdownMud( "# not found" );
              exit( 1 );
            }
          else
	    {
	      return;
	    }
        }

      vnum = ReadInt( fp );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetRoom( vnum ) != NULL )
        {
          if ( tmpBootDb )
            {
              Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
	      char buf[MAX_STRING_LENGTH];
              pRoomIndex = GetRoom( vnum );
              sprintf( buf, "Cleaning room: %ld", vnum );
              LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
              CleanRoom( pRoomIndex );
              oldroom = true;
            }
        }
      else
        {
          oldroom = false;
          AllocateMemory( pRoomIndex, Room, 1 );
        }

      fBootDb = tmpBootDb;
      pRoomIndex->Area          = tarea;
      pRoomIndex->Vnum          = vnum;

      if ( fBootDb )
        {
          if ( !tarea->VnumRanges.FirstRoom )
            tarea->VnumRanges.FirstRoom = vnum;

          if ( vnum > tarea->VnumRanges.LastRoom )
            tarea->VnumRanges.LastRoom = vnum;
        }

      pRoomIndex->Name         = ReadStringToTilde( fp );
      pRoomIndex->Description  = ReadStringToTilde( fp );

      /* Area number                      ReadInt( fp ); */
      ln = ReadLine( fp );
      x1=x2=x3=x4=x5=x6=0;
      sscanf( ln, "%d %d %d %d %d %d",
              &x1, &x2, &x3, &x4, &x5, &x6 );

      pRoomIndex->Flags            = x2;
      pRoomIndex->Sector           = (SectorType) x3;
      pRoomIndex->TeleDelay            = x4;
      pRoomIndex->TeleVnum             = x5;
      pRoomIndex->Tunnel                = x6;

      if (pRoomIndex->Sector <= SECT_INVALID || pRoomIndex->Sector >= SECT_MAX)
        {
          Bug( "%s: vnum %ld has bad sector_type %d.", __FUNCTION__, vnum,
               pRoomIndex->Sector);
          pRoomIndex->Sector = SECT_CITY;
        }

      for ( ; ; )
        {
          letter = ReadChar( fp );

          if ( letter == 'S' )
            break;

          if ( letter == 'D' )
            {
              Exit *pexit;
              int locks;

              door = (DirectionType) ReadInt( fp );

              if ( door < DIR_NORTH || door > DIR_SOMEWHERE )
                {
                  Bug( "%s: vnum %d has bad door number %d.", __FUNCTION__, vnum,
                       door );

                  if ( fBootDb )
                    exit( 1 );
                }
              else
                {
                  pexit = MakeExit( pRoomIndex, NULL, door );
                  pexit->Description    = ReadStringToTilde( fp );
                  pexit->Keyword        = ReadStringToTilde( fp );
                  pexit->Flags      = 0;
                  ln = ReadLine( fp );
                  x1=x2=x3=x4=0;
                  sscanf( ln, "%d %d %d %d",
                          &x1, &x2, &x3, &x4 );

                  locks                 = x1;
                  pexit->Key            = x2;
                  pexit->Vnum           = x3;
                  pexit->Direction           = door;
                  pexit->Distance       = x4;

                  switch ( locks )
                    {
                    case 1:
		      pexit->Flags = EX_ISDOOR;
		      break;

                    case 2:
		      pexit->Flags = EX_ISDOOR | EX_PICKPROOF;
		      break;

                    default:
		      pexit->Flags = locks;
		      break;
                    }
                }
            }
          else if ( letter == 'E' )
            {
              ExtraDescription *ed;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->Keyword               = ReadStringToTilde( fp );
              ed->Description           = ReadStringToTilde( fp );
              LINK( ed, pRoomIndex->FirstExtraDescription, pRoomIndex->LastExtraDescription,
                    Next, Previous );
              top_ed++;
            }
          else if ( letter == '>' )
            {
              ungetc( letter, fp );
              RoomProgReadPrograms( fp, pRoomIndex );
            }
          else
            {
              Bug( "%s: vnum %d has flag '%c' not 'DES'.", __FUNCTION__, vnum,
                   letter );
              ShutdownMud( "Room flag not DES" );
              exit( 1 );
            }
        }

      if ( !oldroom )
        {
          iHash                  = vnum % MAX_KEY_HASH;
          pRoomIndex->Next       = room_index_hash[iHash];
          room_index_hash[iHash] = pRoomIndex;
          top_room++;
        }
    }
}

/*
 * Load a shop section.
 */
static void LoadShops( Area *tarea, FILE *fp )
{
  for ( ; ; )
    {
      ProtoMobile *pMobIndex = NULL;
      int iTrade = 0;
      Shop *pShop = NULL;

      AllocateMemory( pShop, Shop, 1 );
      pShop->Keeper             = ReadInt( fp );

      if ( pShop->Keeper == INVALID_VNUM )
        break;

      for ( iTrade = 0; iTrade < MAX_TRADE; iTrade++ )
        pShop->BuyType[iTrade] = ReadInt( fp );

      pShop->ProfitBuy = ReadInt( fp );
      pShop->ProfitSell        = ReadInt( fp );
      pShop->ProfitBuy = urange( pShop->ProfitSell + 5, pShop->ProfitBuy, 1000 );
      pShop->ProfitSell        = urange( 0, pShop->ProfitSell, pShop->ProfitBuy - 5 );
      pShop->BusinessHours.Open  = ReadInt( fp );
      pShop->BusinessHours.Close = ReadInt( fp );
      ReadToEndOfLine( fp );
      pMobIndex         = GetProtoMobile( pShop->Keeper );
      pMobIndex->Shop  = pShop;

      if ( !first_shop )
        first_shop              = pShop;
      else
        last_shop->Next = pShop;

      pShop->Next               = NULL;
      pShop->Previous               = last_shop;
      last_shop         = pShop;
      top_shop++;
    }
}

/*
 * Load a repair shop section.                                  -Thoric
 */
static void LoadRepairs( Area *tarea, FILE *fp )
{
  for ( ; ; )
    {
      ProtoMobile *pMobIndex;
      int iFix;
      RepairShop *rShop = NULL;

      AllocateMemory( rShop, RepairShop, 1 );
      rShop->Keeper             = ReadInt( fp );

      if ( rShop->Keeper == 0 )
        break;

      for ( iFix = 0; iFix < MAX_FIX; iFix++ )
        rShop->FixType[iFix] = ReadInt( fp );

      rShop->ProfitFix = ReadInt( fp );
      rShop->ShopType  = ReadInt( fp );
      rShop->BusinessHours.Open  = ReadInt( fp );
      rShop->BusinessHours.Close = ReadInt( fp );
      ReadToEndOfLine( fp );
      pMobIndex         = GetProtoMobile( rShop->Keeper );
      pMobIndex->RepairShop  = rShop;

      if ( !first_repair )
        first_repair            = rShop;
      else
        last_repair->Next       = rShop;

      rShop->Next               = NULL;
      rShop->Previous           = last_repair;
      last_repair               = rShop;
      top_repair++;
    }
}

/*
 * Load spec proc declarations.
 */
static void LoadSpecials( Area *tarea, FILE *fp )
{
  for ( ; ; )
    {
      ProtoMobile *pMobIndex;
      char letter;

      switch ( letter = ReadChar( fp ) )
        {
        default:
          Bug( "%s: letter '%c' not *MS.", __FUNCTION__, letter );
          exit( 1 );

        case 'S':
          return;

        case '*':
          break;

        case 'M':
          pMobIndex = GetProtoMobile( ReadInt ( fp ) );

          if ( !pMobIndex->spec_fun )
            {
              pMobIndex->spec_fun = SpecialLookup( ReadWord   ( fp ) );

              if ( pMobIndex->spec_fun == 0 )
                {
                  Bug( "%s: 'M': vnum %d.", __FUNCTION__, pMobIndex->Vnum );
                  exit( 1 );
                }
            }
          else if ( !pMobIndex->spec_2 )
            {
              pMobIndex->spec_2 = SpecialLookup( ReadWord( fp ) );

              if ( pMobIndex->spec_2 == 0 )
                {
                  Bug( "%s: 'M': vnum %ld.", __FUNCTION__, pMobIndex->Vnum );
                  exit( 1 );
                }
            }

          break;
        }

      ReadToEndOfLine( fp );
    }
}


/*
 * Load soft / hard area ranges.
 */
static void LoadRanges( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );
      ShutdownMud( "No #AREA" );
      exit( 1 );
    }

  for ( ; ; )
    {
      int x1, x2, x3, x4;
      const char *ln = ReadLine( fp );

      if (ln[0] == '$')
        break;

      x1=x2=x3=x4=0;
      sscanf( ln, "%d %d %d %d",
              &x1, &x2, &x3, &x4 );

      tarea->LevelRanges.LowSoft = x1;
      tarea->LevelRanges.HighSoft = x2;
      tarea->LevelRanges.LowHard = x3;
      tarea->LevelRanges.HighHard = x4;
    }
}

/*
 * Go through all areas, and set up initial economy based on mob
 * levels and gold
 */
static void InitializeEconomy( void )
{
  Area *tarea;

  for ( tarea = first_area; tarea; tarea = tarea->Next )
    {
      ProtoMobile *mob = NULL;
      int idx = 0, gold = 0, rng = 0;

      /* skip area if they already got some gold */
      if ( tarea->HighEconomy > 0 || tarea->LowEconomy > 10000 )
        continue;

      rng = tarea->LevelRanges.HighSoft - tarea->LevelRanges.LowSoft;

      if ( rng )
        rng /= 2;
      else
        rng = 25;

      gold = rng * rng * 10000;
      BoostEconomy( tarea, gold );

      for ( idx = tarea->VnumRanges.FirstMob; idx < tarea->VnumRanges.LastMob; idx++ )
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
  int iHash;

  for ( iHash = 0; iHash < MAX_KEY_HASH; iHash++ )
    {
      Room *pRoomIndex;

      for ( pRoomIndex  = room_index_hash[iHash];
            pRoomIndex;
            pRoomIndex  = pRoomIndex->Next )
        {
	  Exit *pexit, *pexit_next;
          bool fexit = false;

          for ( pexit = pRoomIndex->FirstExit; pexit; pexit = pexit_next )
            {
              pexit_next = pexit->Next;
              pexit->ReverseVnum = pRoomIndex->Vnum;

              if ( pexit->Vnum <= 0
                   ||  (pexit->ToRoom=GetRoom(pexit->Vnum)) == NULL )
                {
                  if ( fBootDb )
                    BootLog( "%s: room %ld, exit %s leads to bad vnum (%ld)",
			     __FUNCTION__, 
			     pRoomIndex->Vnum, GetDirectionName(pexit->Direction),
			     pexit->Vnum );

                  Bug( "Deleting %s exit in room %ld",
		       GetDirectionName(pexit->Direction), pRoomIndex->Vnum );
                  ExtractExit( pRoomIndex, pexit );
                }
              else
                fexit = true;
            }

          if ( !fexit )
            SetBit( pRoomIndex->Flags, ROOM_NO_MOB );
        }
    }

  /* Set all the rexit pointers         -Thoric */
  for ( iHash = 0; iHash < MAX_KEY_HASH; iHash++ )
    {
      Room *pRoomIndex;

      for ( pRoomIndex  = room_index_hash[iHash];
            pRoomIndex;
            pRoomIndex  = pRoomIndex->Next )
        {
	  Exit *pexit;

          for ( pexit = pRoomIndex->FirstExit; pexit; pexit = pexit->Next )
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

static void SortExits( Room *room )
{
  Exit *pexit; /* *texit */ /* Unused */
  Exit *exits[MAX_REXITS];
  int x, nexits;

  nexits = 0;
  for ( pexit = room->FirstExit; pexit; pexit = pexit->Next )
    {
      exits[nexits++] = pexit;

      if ( nexits > MAX_REXITS )
        {
          Bug( "%s: more than %d exits in room... fatal", __FUNCTION__, nexits );
          return;
        }
    }

  qsort( &exits[0], nexits, sizeof( Exit * ),
         (int(*)(const void *, const void *)) ExitComparator );

  for ( x = 0; x < nexits; x++ )
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
        exits[x]->Next  = exits[x+1];
    }
}

void RandomizeExits( Room *room, short maxdir )
{
  Exit *pexit;
  int nexits, d0, d1, count; /* Maxd unused */
  DirectionType door;
  DirectionType vdirs[MAX_REXITS];

  nexits = 0;
  for ( pexit = room->FirstExit; pexit; pexit = pexit->Next )
    vdirs[nexits++] = pexit->Direction;

  for ( d0 = 0; d0 < nexits; d0++ )
    {
      if ( vdirs[d0] > maxdir )
        continue;

      count = 0;

      while ( vdirs[(d1 = GetRandomNumberFromRange( d0, nexits - 1 ))] > maxdir
              ||      ++count > 5 )
	;

      if ( vdirs[d1] > maxdir )
        continue;

      door              = vdirs[d0];
      vdirs[d0] = vdirs[d1];
      vdirs[d1] = door;
    }
  count = 0;
  for ( pexit = room->FirstExit; pexit; pexit = pexit->Next )
    pexit->Direction = vdirs[count++];

  SortExits( room );
}

/*
 * Repopulate areas periodically.
 */
void AreaUpdate( void )
{
  Area *pArea;

  for ( pArea = first_area; pArea; pArea = pArea->Next )
    {
      Character *pch;
      int reset_age = pArea->ResetFrequency ? pArea->ResetFrequency : 15;

      if ( (reset_age == -1 && pArea->Age == -1)
           ||    ++pArea->Age < (reset_age-1) )
        continue;

      /*
       * Check for PC's.
       */
      if ( pArea->NumberOfPlayers > 0 && pArea->Age == (reset_age-1) )
        {
          char buf[MAX_STRING_LENGTH];

          /* Rennard */
          if ( pArea->ResetMessage )
            sprintf( buf, "%s\r\n", pArea->ResetMessage );
          else
            strcpy( buf, "You hear some squeaking sounds...\r\n" );
          for ( pch = first_char; pch; pch = pch->Next )
            {
              if ( !IsNpc(pch)
                   &&   IsAwake(pch)
                   &&   pch->InRoom
                   &&   pch->InRoom->Area == pArea )
                {
                  SetCharacterColor( AT_RESET, pch );
                  SendToCharacter( buf, pch );
                }
            }
        }

      /*
       * Check age and reset.
       * Note: Mud Academy resets every 3 minutes (not 15).
       */
      if ( pArea->NumberOfPlayers == 0 || pArea->Age >= reset_age )
        {
          Room *pRoomIndex;

          fprintf( stderr, "Resetting: %s\n", pArea->Filename );
          ResetArea( pArea );
          if ( reset_age == -1 )
            pArea->Age = -1;
          else
            pArea->Age = GetRandomNumberFromRange( 0, reset_age / 5 );
          pRoomIndex = GetRoom( ROOM_VNUM_SCHOOL );
          if ( pRoomIndex != NULL && pArea == pRoomIndex->Area
               &&   pArea->ResetFrequency == 0 )
            pArea->Age = 15 - 3;
        }
    }
}


/*
 * Create an instance of a mobile.
 */
Character *AllocateMobile( ProtoMobile *pMobIndex )
{
  Character *mob = NULL;

  if ( !pMobIndex )
    {
      Bug( "%s: NULL pMobIndex.", __FUNCTION__ );
      exit( 1 );
    }

  AllocateMemory( mob, Character, 1 );
  ClearCharacter( mob );
  mob->Prototype               = pMobIndex;

  mob->Name                     = CopyString( pMobIndex->Name );
  mob->ShortDescr              = CopyString( pMobIndex->ShortDescr );
  mob->LongDescr               = CopyString( pMobIndex->LongDescr  );
  mob->Description              = CopyString( pMobIndex->Description );
  mob->spec_fun         = pMobIndex->spec_fun;
  mob->spec_2           = pMobIndex->spec_2;
  mob->mprog.mpscriptpos              = 0;
  mob->TopLevel                = NumberFuzzy( pMobIndex->Level );

  {
    int ability;
    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      SetAbilityLevel( mob, ability, mob->TopLevel );
  }

  mob->Flags              = pMobIndex->Flags;
  mob->AffectedBy         = pMobIndex->AffectedBy;
  mob->Alignment          = pMobIndex->Alignment;
  mob->Sex                = pMobIndex->Sex;
  mob->MobClan           = CopyString( "" );

  if ( !pMobIndex->ArmorClass )
    {
      mob->ArmorClass = pMobIndex->ArmorClass;
    }
  else
    {
      mob->ArmorClass = 100 - mob->TopLevel*2.5 ;
    }

  if ( !pMobIndex->HitNoDice )
    {
      mob->MaxHit = mob->TopLevel * 10 + GetRandomNumberFromRange( mob->TopLevel ,
								   mob->TopLevel * 10 );
    }
  else
    {
      mob->MaxHit = pMobIndex->HitNoDice * GetRandomNumberFromRange(1, pMobIndex->HitSizeDice )
	+ pMobIndex->HitPlus;
    }

  mob->Hit                      = mob->MaxHit;
  /* lets put things back the way they used to be! -Thoric */
  mob->Gold                     = pMobIndex->Gold;
  mob->Position         = pMobIndex->Position;
  mob->DefaultPosition              = pMobIndex->DefaultPosition;
  mob->BareNumDie               = pMobIndex->DamNoDice;
  mob->BareSizeDie              = pMobIndex->DamSizeDice;
  mob->MobThac0         = pMobIndex->MobThac0;
  mob->HitPlus          = pMobIndex->HitPlus;
  mob->DamPlus          = pMobIndex->DamPlus;

  mob->Stats.PermStr         = pMobIndex->Stats.PermStr;
  mob->Stats.PermDex         = pMobIndex->Stats.PermDex;
  mob->Stats.PermWis         = pMobIndex->Stats.PermWis;
  mob->Stats.PermInt         = pMobIndex->Stats.PermInt;
  mob->Stats.PermCon         = pMobIndex->Stats.PermCon;
  mob->Stats.PermCha         = pMobIndex->Stats.PermCha;
  mob->Stats.PermLck                 = pMobIndex->Stats.PermLck;
  mob->HitRoll          = pMobIndex->HitRoll;
  mob->DamRoll          = pMobIndex->DamRoll;
  mob->Race                     = pMobIndex->Race;
  mob->BodyParts                   = pMobIndex->BodyParts;
  mob->Saving.PoisonDeath      = pMobIndex->Saving.PoisonDeath;
  mob->Saving.Wand              = pMobIndex->Saving.Wand;
  mob->Saving.ParaPetri        = pMobIndex->Saving.ParaPetri;
  mob->Saving.Breath            = pMobIndex->Saving.Breath;
  mob->Saving.SpellStaff       = pMobIndex->Saving.SpellStaff;
  mob->Height                   = pMobIndex->Height;
  mob->Weight                   = pMobIndex->Weight;
  mob->Resistant                = pMobIndex->Resistant;
  mob->Immune                   = pMobIndex->Immune;
  mob->Susceptible              = pMobIndex->Susceptible;
  mob->AttackFlags          = pMobIndex->AttackFlags;
  mob->DefenseFlags         = pMobIndex->DefenseFlags;
  mob->NumberOfAttacks               = pMobIndex->NumberOfAttacks;
  mob->Speaks                   = pMobIndex->Speaks;
  mob->Speaking         = pMobIndex->Speaking;
  mob->VipFlags              = pMobIndex->VipFlags;

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
  Object *obj = NULL;
  int oval = 0;

  if ( !pObjIndex )
    {
      Bug( "%s: NULL pObjIndex.", __FUNCTION__ );
      exit( 1 );
    }

  AllocateMemory( obj, Object, 1 );

  obj->Prototype       = pObjIndex;
  obj->InRoom  = NULL;
  obj->Level            = level;
  obj->WearLoc = -1;
  obj->Count            = 1;
  cur_obj_serial = umax((cur_obj_serial + 1 ) & (BV30-1), 1);
  obj->Serial = obj->Prototype->Serial = cur_obj_serial;

  obj->ArmedBy       = CopyString( "" );
  obj->Name             = CopyString( pObjIndex->Name     );
  obj->ShortDescr      = CopyString( pObjIndex->ShortDescr );
  obj->Description      = CopyString( pObjIndex->Description );
  obj->ActionDescription      = CopyString( pObjIndex->ActionDescription );
  obj->ItemType        = pObjIndex->ItemType;
  obj->Flags      = pObjIndex->Flags;
  obj->WearFlags       = pObjIndex->WearFlags;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      obj->Value[oval] = pObjIndex->Value[oval];
    }

  obj->Weight           = pObjIndex->Weight;
  obj->Cost             = pObjIndex->Cost;

  /*
   * Mess with object properties.
   */
  switch ( obj->ItemType )
    {
    default:
      Bug( "%s: vnum %d bad type.", __FUNCTION__, pObjIndex->Vnum );
      Bug( "------------------------>     ", obj->ItemType );
      break;


    case ITEM_FIGHTERCOMP:
    case ITEM_MIDCOMP:
    case ITEM_CAPITALCOMP:
    case ITEM_GOVERNMENT:
    case ITEM_SPACECRAFT:
    case ITEM_RAWSPICE:
    case ITEM_LENS:
    case ITEM_CRYSTAL:
    case ITEM_DURAPLAST:
    case ITEM_DURASTEEL:
    case ITEM_SUPERCONDUCTOR:
    case ITEM_COMLINK:
    case ITEM_MEDPAC:
    case ITEM_FABRIC:
    case ITEM_RARE_METAL:
    case ITEM_MAGNET:
    case ITEM_THREAD:
    case ITEM_CHEMICAL:
    case ITEM_SPICE:
    case ITEM_SMUT:
    case ITEM_OVEN:
    case ITEM_MIRROR:
    case ITEM_CIRCUIT:
    case ITEM_TOOLKIT:
    case ITEM_LIGHT:
    case ITEM_TREASURE:
    case ITEM_FURNITURE:
    case ITEM_TRASH:
    case ITEM_CONTAINER:
    case ITEM_DRINK_CON:
    case ITEM_KEY:
    case ITEM_STAFF:
    case ITEM_SCOPE:
      break;

    case ITEM_FOOD:
      /*
       * optional food condition (rotting food)         -Thoric
       * value1 is the max condition of the food
       * value4 is the optional initial condition
       */
      if ( obj->Value[OVAL_FOOD_OPTIONAL_INITIAL_CONDITION] )
	{
	  obj->Timer = obj->Value[OVAL_FOOD_OPTIONAL_INITIAL_CONDITION];
	}
      else
	{
	  obj->Timer = obj->Value[OVAL_FOOD_MAX_CONDITION];
	}
      break;

    case ITEM_DROID_CORPSE:
    case ITEM_CORPSE_NPC:
    case ITEM_CORPSE_PC:
    case ITEM_FOUNTAIN:
    case ITEM_SCRAPS:
    case ITEM_GRENADE:
    case ITEM_LANDMINE:
    case ITEM_FIRE:
    case ITEM_BOOK:
    case ITEM_SCROLL:
    case ITEM_ROPE:
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_BUTTON:
    case ITEM_DIAL:
    case ITEM_TRAP:
    case ITEM_MAP:
    case ITEM_PAPER:
    case ITEM_PEN:
    case ITEM_LOCKPICK:
    case ITEM_FUEL:
    case ITEM_MISSILE:
    case ITEM_SHOVEL:
      break;

    case ITEM_SALVE:
      obj->Value[OVAL_SALVE_DELAY] = NumberFuzzy( obj->Value[OVAL_SALVE_DELAY] );
      break;

    case ITEM_DEVICE:
      obj->Value[OVAL_DEVICE_LEVEL] = NumberFuzzy( obj->Value[OVAL_DEVICE_LEVEL] );
      obj->Value[OVAL_DEVICE_MAX_CHARGES] = NumberFuzzy( obj->Value[OVAL_DEVICE_MAX_CHARGES] );
      break;

    case ITEM_BATTERY:
      if ( obj->Value[OVAL_BATTERY_CHARGE] <= 0 )
        obj->Value[OVAL_BATTERY_CHARGE] = NumberFuzzy(95);

      break;


    case ITEM_BOLT:
      if ( obj->Value[OVAL_BOLT_CHARGE] <= 0 )
        obj->Value[OVAL_BOLT_CHARGE] = NumberFuzzy(95);

      break;

    case ITEM_AMMO:
      if ( obj->Value[OVAL_AMMO_CHARGE] <=0 )
        obj->Value[OVAL_AMMO_CHARGE] = NumberFuzzy(495);

      break;

    case ITEM_WEAPON:
      if ( obj->Value[OVAL_WEAPON_NUM_DAM_DIE] && obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] )
	{
	  obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] *= obj->Value[OVAL_WEAPON_NUM_DAM_DIE];
	}
      else
        {
          obj->Value[OVAL_WEAPON_NUM_DAM_DIE] = NumberFuzzy( NumberFuzzy( 1 + level/20 ) );
          obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] = NumberFuzzy( NumberFuzzy( 10 + level/10 ) );
        }

      if ( obj->Value[OVAL_WEAPON_NUM_DAM_DIE] > obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] )
	{
	  obj->Value[OVAL_WEAPON_NUM_DAM_DIE] = obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] / 3;
	}

      if (obj->Value[OVAL_WEAPON_CONDITION] == 0)
	{
	  obj->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
	}

      switch (obj->Value[OVAL_WEAPON_TYPE])
        {
        case WEAPON_BLASTER:
        case WEAPON_LIGHTSABER:
        case WEAPON_VIBRO_BLADE:
        case WEAPON_FORCE_PIKE:
        case WEAPON_BOWCASTER:
          if ( obj->Value[OVAL_WEAPON_MAX_CHARGE] <=0 )
	    {
	      obj->Value[OVAL_WEAPON_MAX_CHARGE] = NumberFuzzy(1000);
	    }
        }

      obj->Value[OVAL_WEAPON_CHARGE] = obj->Value[OVAL_WEAPON_MAX_CHARGE];
      break;

    case ITEM_ARMOR:
      if (obj->Value[OVAL_ARMOR_CONDITION] == 0)
        obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];

      obj->Timer = obj->Value[OVAL_ARMOR_3];
      break;

    case ITEM_POTION:
    case ITEM_PILL:
      obj->Value[OVAL_PILL_LEVEL] = NumberFuzzy( NumberFuzzy( obj->Value[OVAL_PILL_LEVEL] ) );
      break;

    case ITEM_MONEY:
      obj->Value[OVAL_MONEY_AMOUNT] = obj->Cost;
      break;
    }

  return obj;
}

Object *CreateObject( ProtoObject *proto, int level )
{
  Object *obj = AllocateObject( proto, level );

  LINK( obj, first_object, last_object, Next, Previous );
  ++proto->Count;
  ++numobjsloaded;
  ++physicalobjects;

  return obj;
}


/*
 * Clear a new character.
 */
void ClearCharacter( Character *ch )
{
  ch->Editor                    = NULL;
  ch->HHF.Hunting                   = NULL;
  ch->HHF.Fearing                   = NULL;
  ch->HHF.Hating                    = NULL;
  ch->Name                      = NULL;
  ch->ShortDescr               = NULL;
  ch->LongDescr                = NULL;
  ch->Description               = NULL;
  ch->Next                      = NULL;
  ch->Previous                      = NULL;
  ch->FirstCarrying            = NULL;
  ch->LastCarrying             = NULL;
  ch->NextInRoom              = NULL;
  ch->PreviousInRoom              = NULL;
  ch->Fighting          = NULL;
  ch->Switched          = NULL;
  ch->FirstAffect              = NULL;
  ch->LastAffect               = NULL;
  ch->PreviousCommand          = NULL;    /* maps */
  ch->LastCommand          = NULL;
  ch->dest_buf          = NULL;
  ch->dest_buf_2                = NULL;
  ch->spare_ptr         = NULL;
  ch->Mount                     = NULL;
  ch->AffectedBy               = 0;
  ch->ArmorClass            = 100;
  ch->Position          = POS_STANDING;
  ch->Hit                       = 500;
  ch->MaxHit                   = 500;
  ch->Mana                      = 1000;
  ch->MaxMana          = 0;
  ch->Move                      = 1000;
  ch->MaxMove          = 1000;
  ch->Height                    = 72;
  ch->Weight                    = 180;
  ch->BodyParts                    = 0;
  ch->Race                      = 0;
  ch->Speaking          = LANG_COMMON;
  ch->Speaks                    = LANG_COMMON;
  ch->BareNumDie                = 1;
  ch->BareSizeDie               = 4;
  ch->SubState          = 0;
  ch->tempnum                   = 0;
  ch->Stats.PermStr          = 10;
  ch->Stats.PermDex          = 10;
  ch->Stats.PermInt          = 10;
  ch->Stats.PermWis          = 10;
  ch->Stats.PermCha          = 10;
  ch->Stats.PermCon          = 10;
  ch->Stats.PermLck          = 10;
  ch->Stats.ModStr                   = 0;
  ch->Stats.ModDex                   = 0;
  ch->Stats.ModInt                   = 0;
  ch->Stats.ModWis                   = 0;
  ch->Stats.ModCha                   = 0;
  ch->Stats.ModCon                   = 0;
  ch->Stats.ModLck                   = 0;
  ch->PlayerHome                = NULL;
  ch->On                        = NULL;
}

/*
 * Free a character.
 */
void FreeCharacter( Character *ch )
{
  Object *obj;
  Affect *paf;
  Timer *timer;
  MPROG_ACT_LIST *mpact, *mpact_next;
  Note *comments, *comments_next;

  if ( !ch )
    {
      Bug( "%s: null ch!", __FUNCTION__ );
      return;
    }

  if ( ch->Desc )
    Bug( "%s: char still has descriptor.", __FUNCTION__ );

  while ( (obj = ch->LastCarrying) != NULL )
    ExtractObject( obj );

  while ( (paf = ch->LastAffect) != NULL )
    RemoveAffect( ch, paf );

  while ( (timer = ch->FirstTimer) != NULL )
    ExtractTimer( ch, timer );

  FreeMemory( ch->Name             );
  FreeMemory( ch->ShortDescr      );
  FreeMemory( ch->LongDescr       );
  FreeMemory( ch->Description      );

  if ( ch->Editor )
    StopEditing( ch );

  StopHunting( ch );
  StopHating ( ch );
  StopFearing( ch );
  FreeFight( ch );


  if ( ch->PCData )
    {
      if ( ch->PCData->Note )
	{
	  FreeNote( ch->PCData->Note );
	}

      if( ch->PCData->CraftingSession )
	{
	  FreeCraftingSession( ch->PCData->CraftingSession );
	}

      FreeMemory( ch->PCData->ClanInfo.ClanName    );
      FreeMemory( ch->PCData->Password  );  /* no hash */
      FreeMemory( ch->PCData->Email        );  /* no hash */
      FreeMemory( ch->PCData->BamfIn       );  /* no hash */
      FreeMemory( ch->PCData->BamfOut      );  /* no hash */
      FreeMemory( ch->PCData->Rank );
      FreeMemory( ch->PCData->Title        );
      FreeMemory( ch->PCData->Bio  );
      FreeMemory( ch->PCData->Bestowments ); /* no hash */
      FreeMemory( ch->PCData->HomePage     );  /* no hash */
      FreeMemory( ch->PCData->AuthedBy    );
      FreeMemory( ch->PCData->Prompt       );

      if ( ch->PCData->SubPrompt )
	{
	  FreeMemory( ch->PCData->SubPrompt );
	}

      FreeAliases( ch );
#ifdef SWRIP_USE_IMC
      ImcFreeCharacter( ch );
#endif
      FreeMemory( ch->PCData );
    }

  for ( mpact = ch->mprog.mpact; mpact; mpact = mpact_next )
    {
      mpact_next = mpact->Next;
      FreeMemory( mpact->buf );
      FreeMemory( mpact        );
    }
  if( ch->PCData )
    for ( comments = ch->PCData->Comments; comments; comments = comments_next )
      {
        comments_next = comments->Next;
        FreeMemory( comments->text    );
        FreeMemory( comments->to_list );
        FreeMemory( comments->subject );
        FreeMemory( comments->sender  );
        FreeMemory( comments->date    );
        FreeMemory( comments          );
      }

  FreeMemory( ch );
}



/*
 * Get an extra description from a list.
 */
char *GetExtraDescription( const char *name, ExtraDescription *ed )
{
  for ( ; ed; ed = ed->Next )
    if ( IsName( name, ed->Keyword ) )
      return ed->Description;

  return NULL;
}



/*
 * Translates mob virtual number to its mob index struct.
 * Hash table lookup.
 */
ProtoMobile *GetProtoMobile( vnum_t vnum )
{
  ProtoMobile *pMobIndex;

  if ( vnum < 0 )
    vnum = 0;

  for ( pMobIndex  = mob_index_hash[vnum % MAX_KEY_HASH];
        pMobIndex;
        pMobIndex  = pMobIndex->Next )
    if ( pMobIndex->Vnum == vnum )
      return pMobIndex;

  if ( fBootDb )
    Bug( "%s: bad vnum %d.", __FUNCTION__, vnum );

  return NULL;
}



/*
 * Translates obj virtual number to its obj index struct.
 * Hash table lookup.
 */
ProtoObject *GetProtoObject( vnum_t vnum )
{
  ProtoObject *pObjIndex;

  if ( vnum < 0 )
    vnum = 0;

  for ( pObjIndex  = obj_index_hash[vnum % MAX_KEY_HASH];
        pObjIndex;
        pObjIndex  = pObjIndex->Next )
    if ( pObjIndex->Vnum == vnum )
      return pObjIndex;

  if ( fBootDb )
    Bug( "%s: bad vnum %d.", __FUNCTION__, vnum );

  return NULL;
}

/*
 * Translates room virtual number to its room index struct.
 * Hash table lookup.
 */
Room *GetRoom( vnum_t vnum )
{
  Room *pRoomIndex;

  if ( vnum < 0 )
    vnum = 0;

  for ( pRoomIndex  = room_index_hash[vnum % MAX_KEY_HASH];
        pRoomIndex;
        pRoomIndex  = pRoomIndex->Next )
    if ( pRoomIndex->Vnum == vnum )
      return pRoomIndex;

  if ( fBootDb )
    Bug( "%s: bad vnum %d.", __FUNCTION__, vnum );

  return NULL;
}

/*
 * Reports a bug.
 */
void Bug( const char *str, ... )
{
  char buf[MAX_STRING_LENGTH];
  FILE *fp = NULL;
  struct stat fst;

  if ( fpArea != NULL )
    {
      int iLine = 0;
      int iChar = 0;

      if ( fpArea == stdin )
        {
          iLine = 0;
        }
      else
        {
          iChar = ftell( fpArea );
          fseek( fpArea, 0, 0 );

          for ( iLine = 0; ftell( fpArea ) < iChar; iLine++ )
            {
              while ( getc( fpArea ) != '\n' )
                ;
            }

          fseek( fpArea, iChar, 0 );
        }

      sprintf( buf, "[*****] FILE: %s LINE: %d", strArea, iLine );
      LogPrintf( buf );

      if ( stat( SHUTDOWN_FILE, &fst ) != -1 )  /* file exists */
        {
          if ( ( fp = fopen( SHUTDOWN_FILE, "a" ) ) != NULL )
            {
              fprintf( fp, "[*****] %s\n", buf );
              fclose( fp );
            }
        }
    }

  strcpy( buf, "[*****] BUG: " );

  {
    va_list param;

    va_start(param, str);
    vsprintf( buf + strlen(buf), str, param );
    va_end(param);
  }

  LogPrintf( buf );

  if ( ( fp = fopen( BUG_FILE, "a" ) ) != NULL )
    {
      fprintf( fp, "%s\n", buf );
      fclose( fp );
    }
}

/*
 * Add a string to the boot-up log                              -Thoric
 */
void BootLog( const char *str, ... )
{
  char buf[MAX_STRING_LENGTH];
  FILE *fp;
  va_list param;

  strcpy( buf, "[*****] BOOT: " );
  va_start(param, str);
  vsprintf( buf+strlen(buf), str, param );
  va_end(param);
  LogPrintf( buf );

  if ( ( fp = fopen( BOOTLOG_FILE, "a" ) ) != NULL )
    {
      fprintf( fp, "%s\n", buf );
      fclose( fp );
    }
}

/*
 * Dump a text file to a player, a line at a time               -Thoric
 */
void ShowFile( const Character *ch, const char *filename )
{
  FILE *fp;
  char buf[MAX_STRING_LENGTH];
  int c;
  int num = 0;

  if ( (fp = fopen( filename, "r" )) != NULL )
    {
      while ( !feof(fp) )
        {
          while ( ( buf[ num ] = fgetc( fp ) ) != (char) EOF
		  && buf[num] != '\n'
		  && buf[num] != '\r'
		  && num < (MAX_STRING_LENGTH-2))
            num++;

          c = fgetc(fp);

          if ( (c != '\n' && c != '\r') || c == buf[num] )
            ungetc(c, fp);

          buf[num++] = '\n';
          buf[num++] = '\r';
          buf[num  ] = '\0';
          SendToPager( (const char*) buf, ch );
          num = 0;
        }
    }
}

/*
 * Writes a string to the log, extended version                 -Thoric
 */
void LogStringPlus( const char *str, short log_type, short level )
{
  char *strtime = ctime( &current_time );
  int offset = 0;
  bool lognone = false;
  char buf[MAX_STRING_LENGTH];

  strtime[strlen(strtime)-1] = '\0';
  fprintf( stderr, "%s :: %s\n", strtime, str );

  if( strncmp( str, "Log ", 4 ) == 0 )
    {
      offset = 4;
    }
  else
    {
      offset = 0;
    }

  sprintf( buf, "%s&R&w", str + offset );

  switch( log_type )
    {
    case LOG_BUILD:
      ToChannel( buf, CHANNEL_BUILD, "Build", level );
      break;

    case LOG_COMM:
      ToChannel( buf, CHANNEL_COMM, "Comm", level );
      break;

    case LOG_ALL:
      break;

    default:
      /* ToChannel( str + offset, CHANNEL_LOG, "Log", level ); */
      lognone = true;
      break;
    }

  if (lognone)
    {
      Descriptor *d = NULL;

      for ( d = FirstDescriptor; d; d = d->Next )
	{
	  Character *och = d->Original ? d->Original : d->Character;
	  Character *vch = d->Character;

	  if ( !och || !vch )
	    {
	      continue;
	    }

	  if ( ( vch->TopLevel < SysData.LevelOfLogChannel )
	       || ( vch->TopLevel < level ) )
	    {
	      continue;
	    }

	  if ( d->ConnectionState == CON_PLAYING
	       && !IsBitSet(och->Deaf, CHANNEL_LOG)
	       && vch->TopLevel >= level )
	    {
	      SetCharacterColor( AT_LOG, vch );
	      SendToCharacter( "Log: ", vch );
	      SendToCharacter( str + offset, vch );
	      SendToCharacter( "&R&w\r\n", vch );
	    }
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
  Wizard *wiz, *tmp;

#ifdef DEBUG
  LogPrintf( "Adding to wizlist..." );
#endif

  AllocateMemory( wiz, Wizard, 1 );
  wiz->Name     = CopyString( name );
  wiz->Level    = level;

  if ( !first_wiz )
    {
      first_wiz = wiz;
      last_wiz  = wiz;
      return;
    }

  /* insert sort, of sorts */
  for ( tmp = first_wiz; tmp; tmp = tmp->Next )
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
  DIR *dp;
  struct dirent *dentry;
  FILE *gfp;
  const char *word;
  int ilevel, iflags;
  Wizard *wiz, *wiznext;
  char buf[MAX_STRING_LENGTH];

  first_wiz = NULL;
  last_wiz  = NULL;

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
              word = feof( gfp ) ? "End" : ReadWord( gfp );
              ilevel = ReadInt( gfp );
              ReadToEndOfLine( gfp );
              word = feof( gfp ) ? "End" : ReadWord( gfp );

              if ( !StrCmp( word, "Pcflags" ) )
                iflags = ReadInt( gfp );
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

          if ( strlen( buf ) + strlen( wiz->Name ) > 76 )
            {
              ToWizFile( buf );
              buf[0] = '\0';
            }

	  strcat( buf, " " );
          strcat( buf, wiz->Name );

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
      FreeMemory(wiz->Name);
      FreeMemory(wiz);
    }
  first_wiz = NULL;
  last_wiz = NULL;

}

/* mud prog functions */

/* This routine reads in scripts of MUDprograms from a file */

static int MudProgNameToType( const char *name )
{
  if ( !StrCmp( name, "in_file_prog"   ) )     return IN_FILE_PROG;
  if ( !StrCmp( name, "act_prog"       ) )    return ACT_PROG;
  if ( !StrCmp( name, "speech_prog"    ) )     return SPEECH_PROG;
  if ( !StrCmp( name, "rand_prog"      ) )     return RAND_PROG;
  if ( !StrCmp( name, "fight_prog"     ) )     return FIGHT_PROG;
  if ( !StrCmp( name, "hitprcnt_prog"  ) )     return HITPRCNT_PROG;
  if ( !StrCmp( name, "death_prog"     ) )     return DEATH_PROG;
  if ( !StrCmp( name, "entry_prog"     ) )     return ENTRY_PROG;
  if ( !StrCmp( name, "greet_prog"     ) )     return GREET_PROG;
  if ( !StrCmp( name, "all_greet_prog" ) )     return ALL_GREET_PROG;
  if ( !StrCmp( name, "give_prog"      ) )     return GIVE_PROG;
  if ( !StrCmp( name, "bribe_prog"     ) )     return BRIBE_PROG;
  if ( !StrCmp( name, "time_prog"     ) )      return TIME_PROG;
  if ( !StrCmp( name, "hour_prog"     ) )      return HOUR_PROG;
  if ( !StrCmp( name, "wear_prog"     ) )      return WEAR_PROG;
  if ( !StrCmp( name, "remove_prog"   ) )      return REMOVE_PROG;
  if ( !StrCmp( name, "sac_prog"      ) )      return SAC_PROG;
  if ( !StrCmp( name, "look_prog"     ) )      return LOOK_PROG;
  if ( !StrCmp( name, "exa_prog"      ) )      return EXA_PROG;
  if ( !StrCmp( name, "zap_prog"      ) )      return ZAP_PROG;
  if ( !StrCmp( name, "get_prog"      ) )      return GET_PROG;
  if ( !StrCmp( name, "drop_prog"     ) )      return DROP_PROG;
  if ( !StrCmp( name, "damage_prog"   ) )      return DAMAGE_PROG;
  if ( !StrCmp( name, "repair_prog"   ) )      return REPAIR_PROG;
  if ( !StrCmp( name, "greet_prog"    ) )      return GREET_PROG;
  if ( !StrCmp( name, "randiw_prog"   ) )      return RANDIW_PROG;
  if ( !StrCmp( name, "speechiw_prog" ) )      return SPEECHIW_PROG;
  if ( !StrCmp( name, "pull_prog"      ) )     return PULL_PROG;
  if ( !StrCmp( name, "push_prog"      ) )     return PUSH_PROG;
  if ( !StrCmp( name, "sleep_prog"    ) )      return SLEEP_PROG;
  if ( !StrCmp( name, "rest_prog"      ) )     return REST_PROG;
  if ( !StrCmp( name, "rfight_prog"   ) )      return FIGHT_PROG;
  if ( !StrCmp( name, "enter_prog"    ) )      return ENTRY_PROG;
  if ( !StrCmp( name, "leave_prog"    ) )      return LEAVE_PROG;
  if ( !StrCmp( name, "rdeath_prog"    ) )     return DEATH_PROG;
  if ( !StrCmp( name, "script_prog"    ) )     return SCRIPT_PROG;
  if ( !StrCmp( name, "use_prog"       ) )     return USE_PROG;
  return( ERROR_PROG );
}

static MPROG_DATA *MobProgReadFile( const char *f, MPROG_DATA *mprg, ProtoMobile *pMobIndex )
{
  char        MUDProgfile[ MAX_INPUT_LENGTH ];
  FILE       *progfile;
  char        letter;
  MPROG_DATA *mprg_next, *mprg2;
  bool        done = false;

  sprintf( MUDProgfile, "%s%s", PROG_DIR, f );

  progfile = fopen( MUDProgfile, "r" );
  if ( !progfile )
    {
      Bug( "Mob: %d couldn't open mudprog file", pMobIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile ) )
    {
    case '>':
      break;
    case '|':
      Bug( "empty mudprog file." );
      exit( 1 );
      break;
    default:
      Bug( "in mudprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Bug( "mudprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Bug( "mprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile );
          mprg2->comlist       = ReadStringToTilde( progfile );
          switch ( letter = ReadChar( progfile ) )
            {
            case '>':
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              mprg_next->Next = mprg2;
              mprg2 = mprg_next;
              break;
            case '|':
              done = true;
              break;
            default:
              Bug( "in mudprog file syntax error." );
              exit( 1 );
              break;
            }
          break;
        }
    }
  fclose( progfile );
  return mprg2;
}

/* Load a MUDprogram section from the area file.
 */
static void LoadMudProgs( Area *tarea, FILE *fp )
{
  ProtoMobile *iMob;
  MPROG_DATA     *original;
  MPROG_DATA     *working;
  char            letter;
  int             value;

  for ( ; ; )
    switch ( letter = ReadChar( fp ) )
      {
      default:
        Bug( "%s: bad command '%c'.", __FUNCTION__, letter);
        exit(1);
        break;
      case 'S':
      case 's':
        ReadToEndOfLine( fp );
        return;
      case '*':
        ReadToEndOfLine( fp );
        break;
      case 'M':
      case 'm':
        value = ReadInt( fp );
        if ( ( iMob = GetProtoMobile( value ) ) == NULL )
          {
            Bug( "%s: vnum %d doesnt exist", __FUNCTION__, value );
            exit( 1 );
          }

        /* Go to the end of the prog command list if other commands
           exist */

        if ( (original = iMob->mprog.mudprogs) != NULL )
          for ( ; original->Next; original = original->Next );

        AllocateMemory( working, MPROG_DATA, 1 );
        if ( original )
          original->Next = working;
        else
          iMob->mprog.mudprogs = working;
        working = MobProgReadFile( ReadWord( fp ), working, iMob );
        working->Next = NULL;
        ReadToEndOfLine( fp );
        break;
      }

  return;

}

/* This procedure is responsible for reading any in_file MUDprograms.
 */

static void MobProgReadPrograms( FILE *fp, ProtoMobile *pMobIndex)
{
  MPROG_DATA *mprg;
  char        letter;
  bool        done = false;

  if ( ( letter = ReadChar( fp ) ) != '>' )
    {
      Bug( "%s: vnum %d MUDPROG char", __FUNCTION__, pMobIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pMobIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Bug( "%s: vnum %d MUDPROG type.", __FUNCTION__, pMobIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = MobProgReadFile( ReadStringToTilde( fp ), mprg,pMobIndex );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          mprg->comlist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        }
    }

  return;

}



/*************************************************************/
/* obj prog functions */
/* This routine transfers between alpha and numeric forms of the
 *  mob_prog bitvector types. This allows the use of the words in the
 *  mob/script files.
 */

/* This routine reads in scripts of OBJprograms from a file */


static MPROG_DATA *ObjProgReadFile( const char *f, MPROG_DATA *mprg, ProtoObject *pObjIndex )
{
  char        MUDProgfile[ MAX_INPUT_LENGTH ];
  FILE       *progfile;
  char        letter;
  MPROG_DATA *mprg_next, *mprg2;
  bool        done = false;

  sprintf( MUDProgfile, "%s%s", PROG_DIR, f );

  progfile = fopen( MUDProgfile, "r" );
  if ( !progfile )
    {
      Bug( "Obj: %d couldnt open mudprog file", pObjIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile ) )
    {
    case '>':
      break;
    case '|':
      Bug( "empty objprog file." );
      exit( 1 );
      break;
    default:
      Bug( "in objprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Bug( "objprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Bug( "objprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile );
          mprg2->comlist       = ReadStringToTilde( progfile );
          switch ( letter = ReadChar( progfile ) )
            {
            case '>':
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              mprg_next->Next = mprg2;
              mprg2 = mprg_next;
              break;
            case '|':
              done = true;
              break;
            default:
              Bug( "in objprog file syntax error." );
              exit( 1 );
              break;
            }
          break;
        }
    }
  fclose( progfile );
  return mprg2;
}

/* Load a MUDprogram section from the area file.
 */
static void LoadObjProgs( Area *tarea, FILE *fp )
{
  ProtoObject *iObj;
  MPROG_DATA     *original;
  MPROG_DATA     *working;
  char            letter;
  int             value;

  for ( ; ; )
    switch ( letter = ReadChar( fp ) )
      {
      default:
        Bug( "%s: bad command '%c'.", __FUNCTION__, letter);
        exit(1);
        break;
      case 'S':
      case 's':
        ReadToEndOfLine( fp );
        return;
      case '*':
        ReadToEndOfLine( fp );
        break;
      case 'M':
      case 'm':
        value = ReadInt( fp );
        if ( ( iObj = GetProtoObject( value ) ) == NULL )
          {
            Bug( "%s: vnum %d doesnt exist", __FUNCTION__, value );
            exit( 1 );
          }

        /* Go to the end of the prog command list if other commands
           exist */

        if ( (original = iObj->mprog.mudprogs) != NULL )
          for ( ; original->Next; original = original->Next );

        AllocateMemory( working, MPROG_DATA, 1 );
        if ( original )
          original->Next = working;
        else
          iObj->mprog.mudprogs = working;
        working = ObjProgReadFile( ReadWord( fp ), working, iObj );
        working->Next = NULL;
        ReadToEndOfLine( fp );
        break;
      }

  return;

}

/* This procedure is responsible for reading any in_file OBJprograms.
 */

static void ObjProgReadPrograms( FILE *fp, ProtoObject *pObjIndex)
{
  MPROG_DATA *mprg;
  char        letter;
  bool        done = false;

  if ( ( letter = ReadChar( fp ) ) != '>' )
    {
      Bug( "%s: vnum %d OBJPROG char", __FUNCTION__, pObjIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pObjIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Bug( "%s: vnum %d OBJPROG type.", __FUNCTION__, pObjIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = ObjProgReadFile( ReadStringToTilde( fp ), mprg,pObjIndex );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          mprg->comlist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        }
    }

  return;

}


/*************************************************************/
/* room prog functions */
/* This routine transfers between alpha and numeric forms of the
 *  mob_prog bitvector types. This allows the use of the words in the
 *  mob/script files.
 */

/* This routine reads in scripts of OBJprograms from a file */
static MPROG_DATA *RoomProgReadFile( const char *f, MPROG_DATA *mprg, Room *RoomIndex )
{
  char        MUDProgfile[ MAX_INPUT_LENGTH ];
  FILE       *progfile;
  char        letter;
  MPROG_DATA *mprg_next, *mprg2;
  bool        done = false;

  sprintf( MUDProgfile, "%s%s", PROG_DIR, f );

  progfile = fopen( MUDProgfile, "r" );
  if ( !progfile )
    {
      Bug( "Room: %d couldnt open roomprog file", RoomIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile ) )
    {
    case '>':
      break;
    case '|':
      Bug( "empty roomprog file." );
      exit( 1 );
      break;
    default:
      Bug( "in roomprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Bug( "roomprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Bug( "roomprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          RoomIndex->mprog.progtypes = RoomIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile );
          mprg2->comlist       = ReadStringToTilde( progfile );
          switch ( letter = ReadChar( progfile ) )
            {
            case '>':
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              mprg_next->Next = mprg2;
              mprg2 = mprg_next;
              break;
            case '|':
              done = true;
              break;
            default:
              Bug( "in roomprog file syntax error." );
              exit( 1 );
              break;
            }
          break;
        }
    }
  fclose( progfile );
  return mprg2;
}

/* This procedure is responsible for reading any in_file ROOMprograms.
 */

static void RoomProgReadPrograms( FILE *fp, Room *pRoomIndex)
{
  MPROG_DATA *mprg;
  char        letter;
  bool        done = false;

  if ( ( letter = ReadChar( fp ) ) != '>' )
    {
      Bug( "%s: vnum %d ROOMPROG char", __FUNCTION__, pRoomIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pRoomIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Bug( "%s: vnum %d ROOMPROG type.", __FUNCTION__, pRoomIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = RoomProgReadFile( ReadStringToTilde( fp ), mprg,pRoomIndex );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pRoomIndex->mprog.progtypes = pRoomIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          mprg->comlist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        }
    }

  return;

}


/*************************************************************/
/* Function to delete a room index.  Called from do_rdelete in build.c
   Narn, May/96
*/
bool DeleteRoom( Room *room )
{
  int iHash;
  Room *tmp, *prev;

  iHash = room->Vnum % MAX_KEY_HASH;

  /* Take the room index out of the hash list. */
  for( tmp = room_index_hash[iHash]; tmp && tmp != room; tmp = tmp->Next )
    {
      prev = tmp;
    }

  if( !tmp )
    {
      Bug( "%s: room not found", __FUNCTION__ );
      return false;
    }

  if( prev )
    {
      prev->Next = room->Next;
    }
  else
    {
      room_index_hash[iHash] = room->Next;
    }

  /* Free up the ram for all strings attached to the room. */
  FreeMemory( room->Name );
  FreeMemory( room->Description );

  /* Free up the ram held by the room index itself. */
  free( room );

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
  Room *pRoomIndex;
  int   iHash;

  AllocateMemory( pRoomIndex, Room, 1 );
  pRoomIndex->Vnum              = vnum;
  pRoomIndex->Name              = CopyString("Floating in a void");
  pRoomIndex->Description               = CopyString("");
  pRoomIndex->Flags                = ROOM_PROTOTYPE;
  pRoomIndex->Sector               = SECT_INSIDE;

  iHash                 = vnum % MAX_KEY_HASH;
  pRoomIndex->Next      = room_index_hash[iHash];
  room_index_hash[iHash]        = pRoomIndex;
  top_room++;

  return pRoomIndex;
}

/*
 * Create a new INDEX object (for online building)              -Thoric
 * Option to clone an existing index object.
 */
ProtoObject *MakeObject( vnum_t vnum, vnum_t cvnum, char *name )
{
  ProtoObject *pObjIndex = NULL, *cObjIndex = NULL;
  char buf[MAX_STRING_LENGTH];
  int iHash = 0;

  if ( cvnum > 0 )
    {
      cObjIndex = GetProtoObject( cvnum );
    }

  AllocateMemory( pObjIndex, ProtoObject, 1 );

  pObjIndex->Vnum = vnum;
  pObjIndex->Name = CopyString( name );

  if ( !cObjIndex )
    {
      sprintf( buf, "A %s", name );
      pObjIndex->ShortDescr    = CopyString( buf  );
      sprintf( buf, "A %s is here.", name );
      pObjIndex->Description    = CopyString( buf );
      pObjIndex->ActionDescription    = CopyString( "" );
      pObjIndex->ShortDescr[0] = CharToLowercase(pObjIndex->ShortDescr[0]);
      pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);
      pObjIndex->ItemType      = ITEM_TRASH;
      pObjIndex->Flags    = ITEM_PROTOTYPE;
      pObjIndex->Weight         = 1;
    }
  else
    {
      ExtraDescription *ed = NULL, *ced = NULL;
      Affect *paf = NULL, *cpaf = NULL;
      int oval = 0;

      pObjIndex->ShortDescr    = CopyString( cObjIndex->ShortDescr );
      pObjIndex->Description    = CopyString( cObjIndex->Description );
      pObjIndex->ActionDescription    = CopyString( cObjIndex->ActionDescription );
      pObjIndex->ItemType      = cObjIndex->ItemType;
      pObjIndex->Flags    = cObjIndex->Flags | ITEM_PROTOTYPE;
      pObjIndex->WearFlags     = cObjIndex->WearFlags;

      for( oval = 0; oval < MAX_OVAL; ++oval )
        {
          pObjIndex->Value[oval] = 0;
        }

      pObjIndex->Weight         = cObjIndex->Weight;
      pObjIndex->Cost           = cObjIndex->Cost;

      for ( ced = cObjIndex->FirstExtraDescription; ced; ced = ced->Next )
        {
          AllocateMemory( ed, ExtraDescription, 1 );
          ed->Keyword           = CopyString( ced->Keyword );
          ed->Description               = CopyString( ced->Description );
          LINK( ed, pObjIndex->FirstExtraDescription, pObjIndex->LastExtraDescription,
                Next, Previous );
          top_ed++;
        }

      for ( cpaf = cObjIndex->FirstAffect; cpaf; cpaf = cpaf->Next )
        {
          AllocateMemory( paf, Affect, 1 );
          paf->Type         = cpaf->Type;
          paf->Duration     = cpaf->Duration;
          paf->Location     = cpaf->Location;
          paf->Modifier     = cpaf->Modifier;
          paf->AffectedBy   = cpaf->AffectedBy;
          LINK( paf, pObjIndex->FirstAffect, pObjIndex->LastAffect,
                Next, Previous );
          top_affect++;
        }
    }

  iHash                  = vnum % MAX_KEY_HASH;
  pObjIndex->Next        = obj_index_hash[iHash];
  obj_index_hash[iHash]  = pObjIndex;
  top_obj_index++;

  return pObjIndex;
}

/*
 * Create a new INDEX mobile (for online building)              -Thoric
 * Option to clone an existing index mobile.
 */
ProtoMobile *MakeMobile( vnum_t vnum, vnum_t cvnum, char *name )
{
  ProtoMobile *pMobIndex, *cMobIndex;
  char buf[MAX_STRING_LENGTH];
  int   iHash;

  if ( cvnum > 0 )
    cMobIndex = GetProtoMobile( cvnum );
  else
    cMobIndex = NULL;

  AllocateMemory( pMobIndex, ProtoMobile, 1 );
  pMobIndex->Vnum                       = vnum;
  pMobIndex->Name                = CopyString( name );

  if ( !cMobIndex )
    {
      sprintf( buf, "A newly created %s", name );
      pMobIndex->ShortDescr    = CopyString( buf  );
      sprintf( buf, "Some god abandoned a newly created %s here.\r\n", name );
      pMobIndex->LongDescr             = CopyString( buf );
      pMobIndex->Description    = CopyString( "" );
      pMobIndex->ShortDescr[0] = CharToLowercase(pMobIndex->ShortDescr[0]);
      pMobIndex->LongDescr[0]  = CharToUppercase(pMobIndex->LongDescr[0]);
      pMobIndex->Description[0] = CharToUppercase(pMobIndex->Description[0]);
      pMobIndex->Flags          = ACT_NPC | ACT_PROTOTYPE;
      pMobIndex->Level          = 1;
      pMobIndex->Position       = DEFAULT_POSITION;
      pMobIndex->DefaultPosition    = DEFAULT_POSITION;
      pMobIndex->Sex            = SEX_NEUTRAL;
      pMobIndex->Stats.PermStr               = 10;
      pMobIndex->Stats.PermDex               = 10;
      pMobIndex->Stats.PermInt               = 10;
      pMobIndex->Stats.PermWis               = 10;
      pMobIndex->Stats.PermCha               = 10;
      pMobIndex->Stats.PermCon               = 10;
      pMobIndex->Stats.PermLck               = 10;
      pMobIndex->Race           = RACE_HUMAN;
    }
  else
    {
      pMobIndex->ShortDescr    = CopyString( cMobIndex->ShortDescr );
      pMobIndex->LongDescr             = CopyString( cMobIndex->LongDescr  );
      pMobIndex->Description    = CopyString( cMobIndex->Description );
      pMobIndex->Flags            = cMobIndex->Flags | ACT_PROTOTYPE;
      pMobIndex->AffectedBy    = cMobIndex->AffectedBy;
      pMobIndex->spec_fun               = cMobIndex->spec_fun;
      pMobIndex->spec_2         = cMobIndex->spec_2;
      pMobIndex->Alignment              = cMobIndex->Alignment;
      pMobIndex->Level          = cMobIndex->Level;
      pMobIndex->MobThac0               = cMobIndex->MobThac0;
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
      pMobIndex->Stats.PermStr               = cMobIndex->Stats.PermStr;
      pMobIndex->Stats.PermDex               = cMobIndex->Stats.PermDex;
      pMobIndex->Stats.PermInt               = cMobIndex->Stats.PermInt;
      pMobIndex->Stats.PermWis               = cMobIndex->Stats.PermWis;
      pMobIndex->Stats.PermCha               = cMobIndex->Stats.PermCha;
      pMobIndex->Stats.PermCon               = cMobIndex->Stats.PermCon;
      pMobIndex->Stats.PermLck               = cMobIndex->Stats.PermLck;
      pMobIndex->Race           = cMobIndex->Race;
      pMobIndex->BodyParts         = cMobIndex->BodyParts;
      pMobIndex->Resistant              = cMobIndex->Resistant;
      pMobIndex->Immune         = cMobIndex->Immune;
      pMobIndex->Susceptible    = cMobIndex->Susceptible;
      pMobIndex->NumberOfAttacks             = cMobIndex->NumberOfAttacks;
      pMobIndex->AttackFlags                = cMobIndex->AttackFlags;
      pMobIndex->DefenseFlags               = cMobIndex->DefenseFlags;
    }

  iHash                         = vnum % MAX_KEY_HASH;
  pMobIndex->Next                       = mob_index_hash[iHash];
  mob_index_hash[iHash]         = pMobIndex;
  top_mob_index++;

  return pMobIndex;
}

/*
 * Creates a simple exit with no fields filled but rvnum and optionally
 * to_room and vnum.                                            -Thoric
 * Exits are inserted into the linked list based on vdir.
 */
Exit *MakeExit( Room *pRoomIndex, Room *to_room, DirectionType door )
{
  Exit *pexit = NULL, *texit = NULL;
  bool broke = false;

  AllocateMemory( pexit, Exit, 1 );
  pexit->Direction           = door;
  pexit->ReverseVnum          = pRoomIndex->Vnum;
  pexit->ToRoom                = to_room;
  pexit->Distance               = 1;
  
  if ( to_room )
    {
      pexit->Vnum = to_room->Vnum;
      texit = GetExitTo( to_room, GetReverseDirection(door), pRoomIndex->Vnum );

      if ( texit )      /* assign reverse exit pointers */
        {
          texit->ReverseExit = pexit;
          pexit->ReverseExit = texit;
        }
    }
  
  for ( texit = pRoomIndex->FirstExit; texit; texit = texit->Next )
    {
      if ( door < texit->Direction )
	{
	  broke = true;
	  break;
	}
    }
  
  if ( !pRoomIndex->FirstExit )
    {
      pRoomIndex->FirstExit      = pexit;
    }
  else
    {
      /* keep exits in incremental order - insert exit into list */
      if ( broke && texit )
        {
          if ( !texit->Previous )
            pRoomIndex->FirstExit      = pexit;
          else
            texit->Previous->Next           = pexit;
          pexit->Previous                   = texit->Previous;
          pexit->Next                   = texit;
          texit->Previous                   = pexit;
          top_exit++;
          return pexit;
        }
      pRoomIndex->LastExit->Next       = pexit;
    }

  pexit->Next                   = NULL;
  pexit->Previous                   = pRoomIndex->LastExit;
  pRoomIndex->LastExit         = pexit;
  top_exit++;
  return pexit;
}

void FixAreaExits( Area *tarea )
{
  Room *pRoomIndex;
  Exit *pexit, *rev_exit;
  int rnum;

  for ( rnum = tarea->VnumRanges.FirstRoom; rnum <= tarea->VnumRanges.LastRoom; rnum++ )
    {
      bool fexit = false;
      
      if ( (pRoomIndex = GetRoom( rnum )) == NULL )
        continue;

      for ( pexit = pRoomIndex->FirstExit; pexit; pexit = pexit->Next )
        {
          fexit = true;
          pexit->ReverseVnum = pRoomIndex->Vnum;

          if ( pexit->Vnum <= 0 )
            pexit->ToRoom = NULL;
          else
            pexit->ToRoom = GetRoom( pexit->Vnum );
        }

      if ( !fexit )
        SetBit( pRoomIndex->Flags, ROOM_NO_MOB );
    }


  for ( rnum = tarea->VnumRanges.FirstRoom; rnum <= tarea->VnumRanges.LastRoom; rnum++ )
    {
      if ( (pRoomIndex = GetRoom( rnum )) == NULL )
        continue;

      for ( pexit = pRoomIndex->FirstExit; pexit; pexit = pexit->Next )
        {
          if ( pexit->ToRoom && !pexit->ReverseExit )
            {
              rev_exit = GetExitTo( pexit->ToRoom, GetReverseDirection(pexit->Direction), pRoomIndex->Vnum );
              if ( rev_exit )
                {
                  pexit->ReverseExit  = rev_exit;
                  rev_exit->ReverseExit       = pexit;
                }
            }
        }
    }
}

void LoadAreaFile( Area *tarea, const char *filename )
{
  char buf[MAX_STRING_LENGTH];

  if ( fBootDb )
    tarea = last_area;

  if ( !fBootDb && !tarea )
    {
      Bug( "%s: null area!", __FUNCTION__ );
      return;
    }

  sprintf( buf, "%s%s", AREA_DIR, filename );

  if ( ( fpArea = fopen( buf, "r" ) ) == NULL )
    {
      Bug( "%s: error loading file (can't open)", __FUNCTION__ );
      Bug( filename );
      return;
    }

  for ( ; ; )
    {
      const char *word;

      if ( ReadChar( fpArea ) != '#' )
        {
          Bug( tarea->Filename );
          Bug( "%s: # not found.", __FUNCTION__ );
          exit( 1 );
        }

      word = ReadWord( fpArea );

      if ( word[0] == '$'               )
	{
	  break;
	}
      else if ( !StrCmp( word, "AREA"     ) )
        {
          if ( fBootDb )
            {
              LoadArea(fpArea);
              tarea = last_area;
            }
          else
            {
              FreeMemory( tarea->Name );
              tarea->Name = ReadStringToTilde( fpArea );
            }
        }
      else if ( !StrCmp( word, "AUTHOR"   ) ) LoadAuthor  (tarea, fpArea);
      else if ( !StrCmp( word, "FLAGS"    ) ) LoadFlags   (tarea, fpArea);
      else if ( !StrCmp( word, "RANGES"   ) ) LoadRanges  (tarea, fpArea);
      else if ( !StrCmp( word, "ECONOMY"  ) ) LoadEconomy (tarea, fpArea);
      else if ( !StrCmp( word, "RESETMSG" ) ) LoadResetMessage(tarea, fpArea);
      /* Rennard */
      else if ( !StrCmp( word, "MOBILES"  ) ) LoadMobiles (tarea, fpArea);
      else if ( !StrCmp( word, "MUDPROGS" ) ) LoadMudProgs(tarea, fpArea);
      else if ( !StrCmp( word, "OBJECTS"  ) ) LoadObjects (tarea, fpArea);
      else if ( !StrCmp( word, "OBJPROGS" ) ) LoadObjProgs(tarea, fpArea);
      else if ( !StrCmp( word, "RESETS"   ) ) LoadResets  (tarea, fpArea);
      else if ( !StrCmp( word, "ROOMS"    ) ) LoadRooms   (tarea, fpArea);
      else if ( !StrCmp( word, "SHOPS"    ) ) LoadShops   (tarea, fpArea);
      else if ( !StrCmp( word, "REPAIRS"  ) ) LoadRepairs (tarea, fpArea);
      else if ( !StrCmp( word, "SPECIALS" ) ) LoadSpecials(tarea, fpArea);
      else
        {
          Bug( tarea->Filename );
          Bug( "%s: bad section name.", __FUNCTION__ );

          if ( fBootDb )
	    {
	      exit( 1 );
	    }
          else
            {
              fclose( fpArea );
              fpArea = NULL;
              return;
            }
        }
    }

  fclose( fpArea );
  fpArea = NULL;

  if ( tarea )
    {
      if ( fBootDb )
        SortArea( tarea, false );

      fprintf( stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld Mobs: %5ld - %ld\n",
               tarea->Filename,
               tarea->VnumRanges.FirstRoom, tarea->VnumRanges.LastRoom,
               tarea->VnumRanges.FirstObject, tarea->VnumRanges.LastObject,
               tarea->VnumRanges.FirstMob, tarea->VnumRanges.LastMob );
      if ( !tarea->Author )
        tarea->Author = CopyString( "" );
      SetBit( tarea->Status, AREA_LOADED );
    }
  else
    fprintf( stderr, "(%s)\n", filename );
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
              Bug( "%s: invalid file", __FUNCTION__ );
              dentry = readdir(dp);
              continue;
            }

          LogPrintf( buf );
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
                  Bug( "%s: cannot open area file for read", __FUNCTION__ );
                  dentry = readdir(dp);
                  continue;
                }
#if !defined(READ_AREA)  /* Dont always want to read stuff.. dunno.. shrug */

              strcpy( word, ReadWord( fp ) );

              if ( word[0] != '#' || StrCmp( &word[1], "AREA" ) )
                {
                  sprintf( buf, "%s: %s.are: no #AREA found.",
                           __FUNCTION__, dentry->d_name );
                  fclose( fp );
                  dentry = readdir(dp);
                  continue;
                }
#endif
              AllocateMemory( pArea, Area, 1 );
              sprintf( buf, "%s.are", dentry->d_name );
              pArea->Author = CopyString( dentry->d_name );
              pArea->Filename = CopyString( buf );
#if !defined(READ_AREA)
              pArea->Name = ReadStringToTilde( fp );
#else
              sprintf( buf, "{PROTO} %s's area in progress", dentry->d_name );
              pArea->Name = CopyString( buf );
#endif
              fclose( fp );
              pArea->VnumRanges.FirstRoom = rlow; pArea->VnumRanges.LastRoom = rhi;
              pArea->VnumRanges.FirstMob = mlow; pArea->VnumRanges.LastMob = mhi;
              pArea->VnumRanges.FirstObject = olow; pArea->VnumRanges.LastObject = ohi;
              pArea->LevelRanges.LowSoft = -1; pArea->LevelRanges.HighSoft = -1;
              pArea->LevelRanges.LowHard = -1; pArea->LevelRanges.HighHard = -1;
              LINK( pArea, first_build, last_build, Next, Previous );
              fprintf( stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld "
                       "Mobs: %5ld - %-5ld\n",
                       pArea->Filename,
                       pArea->VnumRanges.FirstRoom, pArea->VnumRanges.LastRoom,
                       pArea->VnumRanges.FirstObject, pArea->VnumRanges.LastObject,
                       pArea->VnumRanges.FirstMob, pArea->VnumRanges.LastMob );
              SortArea( pArea, true );
            }
        }
      dentry = readdir(dp);
    }
  closedir(dp);
}


/*
 * Sort by room vnums                                   -Altrag & Thoric
 */
void SortArea( Area *pArea, bool proto )
{
  Area *area = NULL;
  Area *first_sort, *last_sort;
  bool found = false;

  if ( !pArea )
    {
      Bug( "%s: NULL pArea", __FUNCTION__ );
      return;
    }

  if ( proto )
    {
      first_sort = first_bsort;
      last_sort  = last_bsort;
    }
  else
    {
      first_sort = first_asort;
      last_sort  = last_asort;
    }

  pArea->NextSort = NULL;
  pArea->PreviousSort = NULL;

  if ( !first_sort )
    {
      pArea->PreviousSort = NULL;
      pArea->NextSort = NULL;
      first_sort = pArea;
      last_sort = pArea;
      found = true;
    }
  else
    for ( area = first_sort; area; area = area->NextSort )
      if ( pArea->VnumRanges.FirstRoom < area->VnumRanges.FirstRoom )
        {
          if ( !area->PreviousSort )
            first_sort  = pArea;
          else
            area->PreviousSort->NextSort = pArea;
          pArea->PreviousSort = area->PreviousSort;
          pArea->NextSort = area;
          area->PreviousSort  = pArea;
          found = true;
          break;
        }

  if ( !found )
    {
      pArea->PreviousSort     = last_sort;
      pArea->NextSort     = NULL;
      last_sort->NextSort = pArea;
      last_sort      = pArea;
    }

  if ( proto )
    {
      first_bsort = first_sort;
      last_bsort  = last_sort;
    }
  else
    {
      first_asort = first_sort;
      last_asort  = last_sort;
    }
}


/*
 * Display vnums currently assigned to areas            -Altrag & Thoric
 * Sorted, and flagged if loaded.
 */
void ShowVnums( const Character *ch, vnum_t low, vnum_t high, bool proto, bool shownl,
		const char *loadst, const char *notloadst )
{
  const Area *pArea = NULL;
  const Area *first_sort = NULL;
  int count = 0;
  int loaded = 0;

  SetPagerColor( AT_PLAIN, ch );

  if ( proto )
    first_sort = first_bsort;
  else
    first_sort = first_asort;

  for ( pArea = first_sort; pArea; pArea = pArea->NextSort )
    {
      if ( IsBitSet( pArea->Status, AREA_DELETED ) )
        continue;

      if ( pArea->VnumRanges.FirstRoom < low )
        continue;

      if ( pArea->VnumRanges.LastRoom > high )
        break;

      if ( IsBitSet(pArea->Status, AREA_LOADED) )
        loaded++;
      else if ( !shownl )
          continue;

      PagerPrintf(ch, "%-22s| Rooms: %10d - %-10d"
                   " Objs: %10d - %-10d Mobs: %10d - %-10d%s\r\n",
                   (pArea->Filename ? pArea->Filename : "(invalid)"),
                   pArea->VnumRanges.FirstRoom, pArea->VnumRanges.LastRoom,
                   pArea->VnumRanges.FirstObject, pArea->VnumRanges.LastObject,
                   pArea->VnumRanges.FirstMob, pArea->VnumRanges.LastMob,
                   IsBitSet(pArea->Status, AREA_LOADED) ? loadst : notloadst );
      count++;
    }

  PagerPrintf( ch, "Areas listed: %d  Loaded: %d\r\n", count, loaded );
}

/*
 * Save system info to data file
 */
void SaveSystemData( const SystemData sys )
{
  LuaSaveDataFile( SYSTEMDATA_FILE, PushSystemData, "systemdata", NULL );
}

static void PushSystemData( lua_State *L, const void *userData )
{
  lua_newtable( L );

  LuaSetfieldNumber( L, "AllTimeMaxPlayers", SysData.MaxPlayersEver );

  if( !IsNullOrEmpty( SysData.TimeOfMaxPlayersEver ) )
    {
      LuaSetfieldString( L, "AllTimeMaxPlayersTime", SysData.TimeOfMaxPlayersEver );
    }

  LuaSetfieldNumber( L, "NoNameResolving", SysData.NoNameResolving );
  LuaSetfieldNumber( L, "WaitForAuth", SysData.NewPlayersMustWaitForAuth );
  LuaSetfieldNumber( L, "ReadAllMail", SysData.ReadAllMail );
  LuaSetfieldNumber( L, "ReadMailFree", SysData.ReadMailFree );
  LuaSetfieldNumber( L, "WriteMailFree", SysData.WriteMailFree );
  LuaSetfieldNumber( L, "TakeOthersMail", SysData.TakeOthersMail );
  LuaSetfieldNumber( L, "BuildChannelLevel", SysData.LevelOfBuildChannel );
  LuaSetfieldNumber( L, "LogChannelLevel", SysData.LevelOfLogChannel );
  LuaSetfieldNumber( L, "ModifyProto", SysData.LevelToModifyProto );
  LuaSetfieldNumber( L, "OverridePrivateFlag", SysData.LevelToOverridePrivateFlag );
  LuaSetfieldNumber( L, "MsetPlayer", SysData.LevelToMsetPlayers );
  LuaSetfieldNumber( L, "StunModPvP", SysData.StunModPlrVsPlr );
  LuaSetfieldNumber( L, "StunRegular", SysData.StunRegular );
  LuaSetfieldNumber( L, "DamModPvP", SysData.DamagePlrVsPlr );
  LuaSetfieldNumber( L, "DamModPvE", SysData.DamagePlrVsMob );
  LuaSetfieldNumber( L, "DamModEvP", SysData.DamageMobVsPlr );
  LuaSetfieldNumber( L, "DamModEvE", SysData.DamageMobVsMob );
  LuaSetfieldNumber( L, "ForcePc", SysData.LevelToForcePlayers );
  LuaSetfieldNumber( L, "SaveFlags", SysData.SaveFlags );
  LuaSetfieldNumber( L, "SaveFrequency", SysData.SaveFrequency );
  LuaSetfieldNumber( L, "DisableHunger", SysData.DisableHunger );

  lua_setglobal( L, "systemdata" );
}

static int L_SystemDataEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "AllTimeMaxPlayers" );
  lua_getfield( L, idx, "AllTimeMaxPlayersTime" );
  lua_getfield( L, idx, "NoNameResolving" );
  lua_getfield( L, idx, "WaitForAuth" );
  lua_getfield( L, idx, "ReadAllMail" );
  lua_getfield( L, idx, "ReadMailFree" );
  lua_getfield( L, idx, "WriteMailFree" );
  lua_getfield( L, idx, "TakeOthersMail" );
  lua_getfield( L, idx, "BuildChannelLevel" );
  lua_getfield( L, idx, "LogChannelLevel" );
  lua_getfield( L, idx, "ModifyProto" );
  lua_getfield( L, idx, "OverridePrivateFlag" );
  lua_getfield( L, idx, "MsetPlayer" );
  lua_getfield( L, idx, "StunModPvP" );
  lua_getfield( L, idx, "StunRegular" );
  lua_getfield( L, idx, "DamModPvP" );
  lua_getfield( L, idx, "DamModPvE" );
  lua_getfield( L, idx, "DamModEvP" );
  lua_getfield( L, idx, "DamModEvE" );
  lua_getfield( L, idx, "ForcePc" );
  lua_getfield( L, idx, "SaveFlags" );
  lua_getfield( L, idx, "SaveFrequency" );
  lua_getfield( L, idx, "DisableHunger" );

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.MaxPlayersEver = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.TimeOfMaxPlayersEver = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      SysData.TimeOfMaxPlayersEver = CopyString( "(not recorded)" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.NoNameResolving = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.NewPlayersMustWaitForAuth = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.ReadAllMail = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.ReadMailFree = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.WriteMailFree = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.TakeOthersMail = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelOfBuildChannel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelOfLogChannel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToModifyProto = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToOverridePrivateFlag = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToMsetPlayers = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.StunModPlrVsPlr = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.StunRegular = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamagePlrVsPlr = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamagePlrVsMob = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamageMobVsPlr = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamageMobVsMob = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToForcePlayers = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.SaveFlags = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.SaveFrequency = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DisableHunger = lua_tointeger( L, idx );
    }

  lua_pop( L, lua_gettop( L ) - 1 );

  return 0;
}

/*
 * Load the SysData.file
 */
static void LoadSystemData( void )
{
  LuaLoadDataFile( SYSTEMDATA_FILE, L_SystemDataEntry, "SystemDataEntry" );
}

static void LoadBanList( void )
{
  Ban *pban;
  FILE *fp;
  int number;
  char letter;

  if ( !(fp = fopen( BAN_LIST, "r" )) )
    return;

  for ( ; ; )
    {
      if ( feof( fp ) )
        {
          Bug( "%s: no -1 found.", __FUNCTION__ );
          fclose( fp );
          return;
        }

      number = ReadInt( fp );

      if ( number == -1 )
        {
          fclose( fp );
          return;
        }

      AllocateMemory( pban, Ban, 1 );
      pban->Level = number;
      pban->Name = ReadStringToTilde( fp );

      if ( (letter = ReadChar(fp)) == '~' )
	{
	  pban->BanTime = ReadStringToTilde( fp );
	}
      else
        {
          ungetc(letter, fp);
          pban->BanTime = CopyString( "(unrecorded)" );
        }

      LINK( pban, FirstBan, LastBan, Next, Previous );
    }
}

/*
 * Append a string to a file.
 */
void AppendFile( const Character *ch, const char *file, const char *str )
{
  FILE *fp;

  if ( IsNpc(ch) || IsNullOrEmpty( str ) )
    return;

  if ( ( fp = fopen( file, "a" ) ) == NULL )
    {
      SendToCharacter( "Could not open the file!\n\r", ch );
    }
  else
    {
      fprintf( fp, "[%5ld] %s: %s\n",
	       ch->InRoom ? ch->InRoom->Vnum : 0, ch->Name, str );
      fclose( fp );
    }
}

/* From Erwin */
void LogPrintf( const char *fmt, ... )
{
  char buf[MAX_STRING_LENGTH * 2];
  va_list args;
  va_start( args, fmt );
  vsprintf( buf, fmt, args );
  va_end( args );

  LogStringPlus( buf, LOG_NORMAL, LEVEL_LOG );
}
