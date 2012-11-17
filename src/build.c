/***************************************************************************
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
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                     Online Building and Editing Module                  *
 ****************************************************************************/

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "mud.h"


extern int      top_affect;
extern int      top_reset;
extern int      top_ed;
extern bool     fBootDb;


/* planet constants for vip and wanted flags */

const char *  const   planet_flags [] =
  {
    "coruscant", "kashyyyk", "ryloth", "rodia", "nal hutta", "mon calamari",
    "honoghr", "gamorr", "tatooine", "adari", "byss", "endor", "roche", "af'el", "trandosh",
    "chad", "", "corellia", "hoth", "asteroid", "bespin", "kuat", "socorro", "corulag", "hapes", "wroona",
    "roche", "dathomir", "sullust", "p28", "p29", "p30", "p31"
  };

const char *  const   weapon_table    [13] =
  {
    "none",
    "vibro-axe",  "vibro-blade",  "lightsaber", "whip", "claw",
    "blaster",  "w7", "bludgeon", "bowcaster", "w10",
    "force pike", "w12"
  };

const char *  const   spice_table    [] =
  {
    "glitterstim", "carsanum", "ryll","andris","lumni","s5","s6","s7","s8","s9"
  };

const char *  const   crystal_table    [8] =
  {
    "non-adegan", "kathracite", "relacite", "danite", "mephite", "ponite", "illum", "corusca"
  };


const char *  const   ex_flags [] =
  {
    "isdoor", "closed", "locked", "secret", "swim", "pickproof", "fly", "climb",
    "dig", "r1", "nopassdoor", "hidden", "passage", "portal", "r2", "r3",
    "can_climb", "can_enter", "can_leave", "auto", "r4", "searchable",
    "bashed", "bashproof", "nomob", "window", "can_look" };

const char *  const   r_flags [] =
  {
    "dark", "reserved", "nomob", "indoors", "can_land", "can_fly", "no_drive",
    "nomagic", "bank", "private", "safe", "remove_this_flag", "petshop", "arena",
    "donation", "nodropall", "silence", "logspeech", "nodrop", "clanstoreroom",
    "plr_home", "empty_home", "teleport", "hotel", "nofloor", "refinery", "factory",
    "recruit", "plr_shop", "spacecraft", "prototype", "auction"
  };

const char *  const   o_flags [] =
  {
    "glow", "hum", "dark", "hutt_size", "contraband", "invis", "magic", "nodrop", "bless",
    "antigood", "antievil", "antineutral", "noremove", "inventory",
    "antisoldier", "antithief", "antihunter", "antijedi", "small_size", "large_size",
    "donation", "clanobject", "anticitizen", "antisith", "antipilot",
    "hidden", "poisoned", "covering", "deathrot", "burried", "prototype", "human_size"
  };

const char *  const   mag_flags       [] =
  {
    "returning", "backstabber", "bane", "loyal", "haste", "drain",
    "lightning_blade"
  };

const char *  const   w_flags [] =
  {
    "take", "finger", "neck", "body", "head", "legs", "feet", "hands", "arms",
    "shield", "about", "waist", "wrist", "wield", "hold", "_dual_", "ears", "eyes",
    "_missile_", "floating","over","disguise","maxwear","r5","r6",
    "r7","r8","r9","r10","r11","r12","r13"
  };

const char *  const   area_flags      [] =
  {
    "nopkill", "noquest", "changed", "r3", "r4", "r5", "r6", "r7", "r8",
    "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16", "r17",
    "r18", "r19","r20","r21","r22","r23","r24",
    "r25","r26","r27","r28","r29","r30","r31"
  };

const char *  const   o_types [] =
  {
    "none", "light", "scroll", "_wand", "staff", "weapon", "_fireweapon", "missile",
    "treasure", "armor", "potion", "rope", "furniture", "trash", "_oldtrap",
    "container", "_note", "drinkcon", "key", "food", "money", "pen", "_boat",
    "corpse", "corpse_pc", "fountain", "pill", "_blood", "_bloodstain",
    "scraps", "_pipe", "_herbcon", "_herb", "_incense", "fire", "book", "switch",
    "lever", "_pullchain", "button", "dial", "_rune", "_runepouch", "_match", "trap",
    "map", "_portal", "paper", "_tinder", "lockpick", "_spike", "_disease", "_oil",
    "fuel", "_shortbow", "_longbow", "_crossbow", "ammo", "_quiver", "shovel",
    "salve", "rawspice", "lens", "crystal", "duraplast", "battery",
    "toolkit", "durasteel", "oven", "mirror", "circuit", "superconductor", "comlink", "medpac",
    "fabric", "rare_metal", "magnet",  "thread", "spice", "smut", "device", "spacecraft",
    "grenade", "landmine", "government", "droid_corpse", "bolt", "scope",
    "fightercomp", "midcomp", "capitalcomp","chemical", "disguise",
    "disguise_fabric", "hair"
  };

const char *  const   a_types [] =
  {
    "none", "strength", "dexterity", "intelligence", "wisdom", "constitution",
    "sex", "null", "level", "age", "height", "weight", "force", "hit", "move",
    "credits", "experience", "armor", "hitroll", "damroll", "save_poison", "save_rod",
    "save_para", "save_breath", "save_spell", "charisma", "affected", "resistant",
    "immune", "susceptible", "weaponspell", "luck", "backstab", "pick", "track",
    "steal", "sneak", "hide", "palm", "detrap", "dodge", "peek", "scan", "gouge",
    "search", "mount", "disarm", "kick", "parry", "bash", "stun", "punch", "climb",
    "grip", "scribe", "brew", "wearspell", "removespell", "mentalstate", "emotion",
    "stripsn", "remove", "dig", "full", "thirst", "drunk", "blood", "snipe"
  };

const char *  const   a_flags [] =
  {
    "blind", "invisible", "detect_evil", "detect_invis", "detect_magic",
    "detect_hidden", "weaken", "sanctuary", "faerie_fire", "infrared", "curse",
    "_flaming", "poison", "protect", "paralysis", "sneak", "hide", "sleep",
    "charm", "flying", "pass_door", "floating", "truesight", "detect_traps",
    "scrying", "fireshield", "shockshield", "r1", "iceshield", "possess",
    "berserk", "aqua_breath" };

const char *  const   act_flags [] =
  {
    "npc", "sentinel", "scavenger", "r3", "r3", "aggressive", "stayarea",
    "wimpy", "pet", "train", "practice", "immortal", "deadly", "polyself",
    "meta_aggr", "guardian", "running", "nowander", "mountable", "mounted", "scholar",
    "secretive", "polymorphed", "mobinvis", "noassist", "nokill", "droid", "nocorpse",
    "r28", "r29", "prototype", "r31" };

const char *  const   pc_flags [] =
  {
    "r1", "deadly", "unauthed", "norecall", "nointro", "gag", "retired", "guest",
    "nosummon", "pageron", "notitled", "room", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13",
    "r14", "r15", "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23", "r24",
    "r25"
  };

const char *  const   plr_flags [] =
  {
    "npc", "boughtpet", "shovedrag", "autoexits", "autoloot", "autosac", "blank",
    "outcast", "brief", "combine", "prompt", "telnet_ga", "holylight",
    "wizinvis", "roomvnum","silence", "noemote", "attacker", "notell", "log",
    "deny", "freeze", "killer","homeresident", "litterbug", "ansi", "rip", "nice",
    "flee" ,"autocred", "automap", "afk"
  };

const char *  const   trap_flags [] =
  {
    "room", "obj", "enter", "leave", "open", "close", "get", "put", "pick",
    "unlock", "north", "south", "east", "r1", "west", "up", "down", "examine",
    "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13",
    "r14", "r15"
  };

const char *  const   wear_locs [] =
  {
    "light", "finger1", "finger2", "neck1", "neck2", "body", "head", "legs",
    "feet", "hands", "arms", "shield", "about", "waist", "wrist1", "wrist2",
    "wield", "hold", "dual_wield", "ears", "eyes", "missile_wield", "floating",
    "over"
  };

const char *  const   ris_flags [] =
  {
    "fire", "cold", "electricity", "energy", "blunt", "pierce", "slash", "acid",
    "poison", "drain", "sleep", "charm", "hold", "nonmagic", "plus1", "plus2",
    "plus3", "plus4", "plus5", "plus6", "magic", "paralysis", "steal", "r2", "r3",
    "r4", "r5", "r6", "r7", "r8", "r9", "r10"
  };

const char *  const   trig_flags [] =
  {
    "up", "unlock", "lock", "d_north", "d_south", "d_east", "d_west", "d_up",
    "d_down", "door", "container", "open", "close", "passage", "oload", "mload",
    "teleport", "teleportall", "teleportplus", "death", "cast", "fakeblade",
    "rand4", "rand6", "trapdoor", "anotherroom", "usedial", "absolutevnum",
    "showroomdesc", "autoreturn", "r2", "r3"
  };

const char *  const   part_flags [] =
  {
    "head", "arms", "legs", "heart", "brains", "guts", "hands", "feet", "fingers",
    "ear", "eye", "long_tongue", "eyestalks", "tentacles", "fins", "wings",
    "tail", "scales", "claws", "fangs", "horns", "tusks", "tailattack",
    "sharpscales", "beak", "haunches", "hooves", "paws", "forelegs", "feathers",
    "r1", "r2"
  };

const char *  const   attack_flags [] =
  {
    "bite", "claws", "tail", "sting", "punch", "kick",
    "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16", "r17",
    "r18", "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", "r27", "r28", "r29",
    "r30", "r31"
  };

const char *  const   defense_flags [] =
  {
    "parry", "dodge", "r2", "r3", "r4" ,"r5",
    "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16", "r17",
    "r18", "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", "r27", "r28", "r29",
    "r30", "r31"
  };

/*
 * Note: I put them all in one big set of flags since almost all of these
 * can be shared between mobs, objs and rooms for the exception of
 * bribe and hitprcnt, which will probably only be used on mobs.
 * ie: drop -- for an object, it would be triggered when that object is
 * dropped; -- for a room, it would be triggered when anything is dropped
 *          -- for a mob, it would be triggered when anything is dropped
 *
 * Something to consider: some of these triggers can be grouped together,
 * and differentiated by different arguments... for example:
 *  hour and time, rand and randiw, speech and speechiw
 *
 */
const char *  const   mprog_flags [] =
  {
    "act", "speech", "rand", "fight", "death", "hitprcnt", "entry", "greet",
    "allgreet", "give", "bribe", "hour", "time", "wear", "remove", "sac",
    "look", "exa", "zap", "get", "drop", "damage", "repair", "randiw",
    "speechiw", "pull", "push", "sleep", "rest", "leave", "script", "use"
  };

bool can_rmodify( CHAR_DATA *ch, ROOM_INDEX_DATA *room )
{
  short vnum = room->vnum;
  AREA_DATA *pArea;

  if ( IS_NPC( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this room.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_r_vnum
       &&   vnum <= pArea->hi_r_vnum )
    return TRUE;

  send_to_char( "That room is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_omodify( CHAR_DATA *ch, OBJ_DATA *obj )
{
  short vnum = obj->pIndexData->vnum;
  AREA_DATA *pArea;

  if ( IS_NPC( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this object.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_o_vnum
       &&   vnum <= pArea->hi_o_vnum )
    return TRUE;

  send_to_char( "That object is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_oedit( CHAR_DATA *ch, OBJ_INDEX_DATA *obj )
{
  short vnum = obj->vnum;
  AREA_DATA *pArea;

  if ( IS_NPC( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= LEVEL_GOD )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this object.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_o_vnum
       &&   vnum <= pArea->hi_o_vnum )
    return TRUE;

  send_to_char( "That object is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_mmodify( CHAR_DATA *ch, CHAR_DATA *mob )
{
  short vnum;
  AREA_DATA *pArea;

  if ( mob == ch )
    return TRUE;

  if ( !IS_NPC( mob ) )
    {
      if ( get_trust( ch ) >= sysdata.level_modify_proto && get_trust(ch) >
           get_trust( mob ) )
        return TRUE;
      else
        send_to_char( "You can't do that.\r\n", ch );
      return FALSE;
    }

  vnum = mob->pIndexData->vnum;

  if ( IS_NPC( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this mobile.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_m_vnum
       &&   vnum <= pArea->hi_m_vnum )
    return TRUE;

  send_to_char( "That mobile is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_medit( CHAR_DATA *ch, MOB_INDEX_DATA *mob )
{
  short vnum = mob->vnum;
  AREA_DATA *pArea;

  if ( IS_NPC( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= LEVEL_GOD )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this mobile.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_m_vnum
       &&   vnum <= pArea->hi_m_vnum )
    return TRUE;

  send_to_char( "That mobile is not in your allocated range.\r\n", ch );
  return FALSE;
}

int get_otype( char *type )
{
  size_t x;

  for ( x = 0; x < (sizeof(o_types) / sizeof(o_types[0]) ); x++ )
    if ( !str_cmp( type, o_types[x] ) )
      return x;
  return -1;
}

int get_aflag( char *flag )
{
  size_t x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, a_flags[x] ) )
      return x;
  return -1;
}

int get_trapflag( char *flag )
{
  size_t x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, trap_flags[x] ) )
      return x;
  return -1;
}

int get_atype( char *type )
{
  size_t x;

  for ( x = 0; x < MAX_APPLY_TYPE; x++ )
    if ( !str_cmp( type, a_types[x] ) )
      return x;
  return -1;
}

int get_npc_race( char *type )
{
  size_t x;

  for ( x = 0; x < MAX_NPC_RACE; x++ )
    if ( !str_cmp( type, npc_race[x] ) )
      return x;
  return -1;
}

int get_wearloc( char *type )
{
  int x;

  for ( x = 0; x < MAX_WEAR; x++ )
    if ( !str_cmp( type, wear_locs[x] ) )
      return x;
  return -1;
}

int get_exflag( char *flag )
{
  int x;

  for ( x = 0; x <= MAX_EXFLAG; x++ )
    if ( !str_cmp( flag, ex_flags[x] ) )
      return x;
  return -1;
}

int get_rflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, r_flags[x] ) )
      return x;
  return -1;
}

int get_mpflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, mprog_flags[x] ) )
      return x;
  return -1;
}

int get_oflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, o_flags[x] ) )
      return x;
  return -1;
}

int get_areaflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, area_flags[x] ) )
      return x;
  return -1;
}

int get_wflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, w_flags[x] ) )
      return x;
  return -1;
}

int get_actflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, act_flags[x] ) )
      return x;
  return -1;
}

int get_vip_flag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, planet_flags[x] ) )
      return x;
  return -1;
}

int get_wanted_flag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, planet_flags[x] ) )
      return x;
  return -1;
}

int get_pcflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, pc_flags[x] ) )
      return x;
  return -1;
}
int get_plrflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, plr_flags[x] ) )
      return x;
  return -1;
}

int get_risflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, ris_flags[x] ) )
      return x;
  return -1;
}

int get_trigflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, trig_flags[x] ) )
      return x;
  return -1;
}

int get_partflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, part_flags[x] ) )
      return x;
  return -1;
}

int get_attackflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, attack_flags[x] ) )
      return x;
  return -1;
}

int get_defenseflag( char *flag )
{
  int x;

  for ( x = 0; x < 32; x++ )
    if ( !str_cmp( flag, defense_flags[x] ) )
      return x;
  return -1;
}

int get_langflag( char *flag )
{
  int x;

  for ( x = 0; lang_array[x] != LANG_UNKNOWN; x++ )
    if ( !str_cmp( flag, lang_names[x] ) )
      return lang_array[x];
  return LANG_UNKNOWN;
}

void start_editing( CHAR_DATA *ch, char *data )
{
  EDITOR_DATA *edit;
  short lines, size, lpos;
  char c;

  if ( !ch->desc )
    {
      bug( "Fatal: start_editing: no desc", 0 );
      return;
    }
  if ( ch->substate == SUB_RESTRICTED )
    bug( "NOT GOOD: start_editing: ch->substate == SUB_RESTRICTED", 0 );

  set_char_color( AT_GREEN, ch );
  send_to_char( "Begin entering your text (/? =help /s =save /c =clear /l =list /f =format)\r\n", ch );
  send_to_char( "--------------------------------------------------------------------------\r\n> ", ch );
  if ( ch->editor )
    stop_editing( ch );

  CREATE( edit, EDITOR_DATA, 1 );
  edit->numlines = 0;
  edit->on_line  = 0;
  edit->size     = 0;
  size = 0;  lpos = 0;  lines = 0;
  if ( !data )
    bug("editor: data is NULL!\r\n",0);
  else
    for ( ;; )
      {
        c = data[size++];
        if ( c == '\0' )
          {
            edit->line[lines][lpos] = '\0';
            break;
          }
        else
          if ( c == '\r' );
          else
            if ( c == '\n' || lpos > 78)
              {
                edit->line[lines][lpos] = '\0';
                lines++;
                lpos = 0;
              }
            else
              edit->line[lines][lpos++] = c;
        if ( lines >= 49 || size > 4096 )
          {
            edit->line[lines][lpos] = '\0';
            break;
          }
      }
  edit->numlines = lines;
  edit->size = size;
  edit->on_line = lines;
  ch->editor = edit;
  ch->desc->connected = CON_EDITING;
}

char *copy_buffer( CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  char tmp[100];
  short x, len;

  if ( !ch )
    {
      bug( "copy_buffer: null ch", 0 );
      return STRALLOC( "" );
    }

  if ( !ch->editor )
    {
      bug( "copy_buffer: null editor", 0 );
      return STRALLOC( "" );
    }

  buf[0] = '\0';
  for ( x = 0; x < ch->editor->numlines; x++ )
    {
      strcpy( tmp, ch->editor->line[x] );
      smush_tilde( tmp );
      len = strlen(tmp);
      if ( tmp[len-1] == '~' )
        tmp[len-1] = '\0';
      else
        strcat( tmp, "\r\n" );
      strcat( buf, tmp );
    }
  return STRALLOC( buf );
}

void stop_editing( CHAR_DATA *ch )
{
  set_char_color( AT_PLAIN, ch );
  DISPOSE( ch->editor );
  ch->editor = NULL;
  send_to_char( "Done.\r\n", ch );
  ch->dest_buf  = NULL;
  ch->spare_ptr = NULL;
  ch->substate  = SUB_NONE;
  if ( !ch->desc )
    {
      bug( "Fatal: stop_editing: no desc", 0 );
      return;
    }
  ch->desc->connected = CON_PLAYING;
}

void do_goto( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  CHAR_DATA *fch;
  CHAR_DATA *fch_next;
  ROOM_INDEX_DATA *in_room;
  AREA_DATA *pArea;
  short vnum;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Goto where?\r\n", ch );
      return;
    }

  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      vnum = atoi( arg );
      if ( vnum < 0 || get_room_index( vnum ) )
        {
          send_to_char( "You cannot find that...\r\n", ch );
          return;
        }

      if ( vnum < 1 || IS_NPC(ch) || !ch->pcdata->area )
        {
          send_to_char( "No such location.\r\n", ch );
          return;
        }
      if ( get_trust( ch ) < sysdata.level_modify_proto &&
           !( ch->pcdata->bestowments && is_name( "intergoto", ch->pcdata->bestowments) ))

        {
          if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
            {
              send_to_char( "You must have an assigned area to create rooms.\r\n", ch );
              return;
            }
          if ( vnum < pArea->low_r_vnum
               ||   vnum > pArea->hi_r_vnum  )
            {
              send_to_char( "That room is not within your assigned range.\r\n", ch );
              return;
            }
        }
      location = make_room( vnum );
      if ( !location )
        {
          bug( "Goto: make_room failed", 0 );
          return;
        }
      location->area = ch->pcdata->area;
      set_char_color( AT_WHITE, ch );
      send_to_char( "Waving your hand, you form order from swirling chaos,\r\nand step into a new reality...\r\n", ch );
    }

  if ( room_is_private(ch, location ) )
    {
      if ( get_trust( ch ) < sysdata.level_override_private || (ch->top_level == 105 ? 0: (location->vnum == IMP_ROOM1?1:(location->vnum == IMP_ROOM2?1:0))))
        {
          send_to_char( "That room is private right now.\r\n", ch );

          return;
        }
      else
        send_to_char( "Overriding private flag!\r\n", ch );
    }

  if ( get_trust( ch ) < LEVEL_GOD &&
       !( ch->pcdata->bestowments && is_name( "intergoto", ch->pcdata->bestowments) ))
    {
      vnum = atoi( arg );

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( vnum < pArea->low_r_vnum
           ||  vnum > pArea->hi_r_vnum )
        {
          send_to_char( "That room is not within your assigned range.\r\n", ch );
          return;
        }

      if ( ( ch->in_room->vnum < pArea->low_r_vnum
             ||   ch->in_room->vnum > pArea->hi_r_vnum ) && !IS_SET(ch->in_room->room_flags , ROOM_HOTEL) )
        {
          send_to_char( "Builders can only use goto from a hotel or in their zone.\r\n", ch );
          return;
        }

    }

  in_room = ch->in_room;
  if ( ch->fighting )
    stop_fighting( ch, TRUE );

  if ( !IS_SET(ch->act, PLR_WIZINVIS) )
    {
      if (ch->pcdata && ch->pcdata->bamfout[0] != '\0')
        act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfout ,  TO_ROOM );
      else
        act( AT_IMMORT, "$n $T", ch, NULL, "leaves in a swirl of the force.",  TO_ROOM );
    }


  ch->regoto = ch->in_room->vnum;
  char_from_room( ch );
  if ( ch->mount )
    {
      char_from_room( ch->mount );
      char_to_room( ch->mount, location );
    }
  char_to_room( ch, location );

  if ( !IS_SET(ch->act, PLR_WIZINVIS) )
    {
      if (ch->pcdata && ch->pcdata->bamfin[0] != '\0')
        act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfin ,  TO_ROOM );
      else
        act( AT_IMMORT, "$n $T", ch, NULL, "enters in a swirl of the Force.",  TO_ROOM );
    }



  do_look( ch, "auto" );

  if ( ch->in_room == in_room )
    return;
  for ( fch = in_room->first_person; fch; fch = fch_next )
    {
      fch_next = fch->next_in_room;
      if ( fch->master == ch && IS_IMMORTAL(fch) )
        {
          act( AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR );
          do_goto( fch, argument );
        }
    }
  return;
}

void do_mset( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char buf  [MAX_STRING_LENGTH];
  char outbuf[MAX_STRING_LENGTH];
  int  num,size,plus;
  char char1,char2;
  CHAR_DATA *victim;
  int value;
  int minattr, maxattr;
  bool lockvictim;
  char *origarg = argument;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't mset\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MOB_DESC:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Darrik.\r\n", ch );
          bug( "do_mset: sub_mob_desc: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      victim = ch->dest_buf;
      if ( char_died(victim) )
        {
          send_to_char( "Your victim died!\r\n", ch );
          stop_editing( ch );
          return;
        }
      STRFREE( victim->description );
      victim->description = copy_buffer( ch );
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        {
          STRFREE( victim->pIndexData->description );
          victim->pIndexData->description = QUICKLINK( victim->description );
        }
      stop_editing( ch );
      ch->substate = ch->tempnum;
      return;
    }

  victim = NULL;
  lockvictim = FALSE;
  smash_tilde( argument );

  if ( ch->substate == SUB_REPEATCMD )
    {
      victim = ch->dest_buf;
      if ( char_died(victim) )
        {
          send_to_char( "Your victim died!\r\n", ch );
          victim = NULL;
          argument = "done";
        }
      if ( argument[0] == '\0' || !str_cmp( argument, " " )
           ||   !str_cmp( argument, "stat" ) )
        {
          if ( victim )
            do_mstat( ch, victim->name );
          else
            send_to_char( "No victim selected.  Type '?' for help.\r\n", ch );
          return;
        }
      if ( !str_cmp( argument, "done" ) || !str_cmp( argument, "off" ) )
        {
          send_to_char( "Mset mode off.\r\n", ch );
          ch->substate = SUB_NONE;
          DISPOSE(ch->dest_buf);
          if ( ch->pcdata && ch->pcdata->subprompt )
            STRFREE( ch->pcdata->subprompt );
          return;
        }
    }
  if ( victim )
    {
      lockvictim = TRUE;
      strcpy( arg1, victim->name );
      argument = one_argument( argument, arg2 );
      strcpy( arg3, argument );
    }
  else
    {
      lockvictim = FALSE;
      argument = one_argument( argument, arg1 );
      argument = one_argument( argument, arg2 );
      strcpy( arg3, argument );
    }
  /*
    if ( !str_cmp( arg1, "on" ) )
    {
    send_to_char( "Syntax: mset <victim|vnum> on.\r\n", ch );
    return;
    }
  */
  if ( arg1[0] == '\0' || (arg2[0] == '\0' && ch->substate != SUB_REPEATCMD)
       ||   !str_cmp( arg1, "?" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        {
          if ( victim )
            send_to_char( "Syntax: <field>  <value>\r\n",               ch );
          else
            send_to_char( "Syntax: <victim> <field>  <value>\r\n",      ch );
        }
      else
        send_to_char( "Syntax: mset <victim> <field>  <value>\r\n",     ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  str int wis dex con cha lck frc sex\r\n",        ch );
      send_to_char( "  credits hp force move align race\r\n",ch );
      send_to_char( "  hitroll damroll armor affected level\r\n",       ch );
      send_to_char( "  thirst drunk full blood flags\r\n",              ch );
      send_to_char( "  pos defpos part (see BODYPARTS)\r\n",            ch );
      send_to_char( "  sav1 sav2 sav4 sav4 sav5 (see SAVINGTHROWS)\r\n", ch );
      send_to_char( "  resistant immune susceptible (see RIS)\r\n",     ch );
      send_to_char( "  attack defense numattacks\r\n",          ch );
      send_to_char( "  speaking speaks (see LANGUAGES)\r\n",            ch );
      send_to_char( "  name short long description title spec spec2\r\n", ch );
      send_to_char( "  clan vip wanted\r\n",                  ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "For editing index/prototype mobiles:\r\n", ch );
      send_to_char( "  hitnumdie hitsizedie hitplus (hit points)\r\n",ch );
      send_to_char( "  damnumdie damsizedie damplus (damage roll)\r\n",ch );
      send_to_char( "To toggle area flag: aloaded\r\n",ch);
      return;
    }

  if ( !victim && get_trust( ch ) <= LEVEL_IMMORTAL )
    {
      if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }
    }
  else
    if ( !victim )
      {
        if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
          {
            send_to_char( "No one like that in all the realms.\r\n", ch );
            return;
          }
      }
  if ( get_trust(ch) < sysdata.level_mset_player && (victim != ch) && !IS_NPC( victim ) )
    {
      send_to_char( "You can't do that!\r\n", ch );
      DISPOSE(ch->dest_buf);
      return;
    }
  if ( get_trust( ch ) < get_trust( victim ) && !IS_NPC( victim ) )
    {
      send_to_char( "You can't do that!\r\n", ch );
      DISPOSE(ch->dest_buf);
      return;
    }
  if ( lockvictim )
    ch->dest_buf = victim;

  if ( IS_NPC(victim) )
    {
      minattr = 1;
      maxattr = 25;
    }
  else
    {
      minattr = 3;
      maxattr = 25;
    }

  /*
    if ( !str_cmp( arg2, "on" ) )
    {
    CHECK_SUBRESTRICTED( ch );
    ch_printf( ch, "Mset mode on. (Editing %s).\r\n",
    victim->name );
    ch->substate = SUB_REPEATCMD;
    ch->dest_buf = victim;
    if ( ch->pcdata )
    {
    if ( ch->pcdata->subprompt )
    STRFREE( ch->pcdata->subprompt );
    if ( IS_NPC(victim) )
    sprintf( buf, "<&CMset &W#%d&w> %%i", victim->pIndexData->vnum );
    else
    sprintf( buf, "<&CMset &W%s&w> %%i", victim->name );
    ch->pcdata->subprompt = STRALLOC( buf );
    }
    return;
    }
  */

  value = is_number( arg3 ) ? atoi( arg3 ) : -1;

  if ( atoi(arg3) < -1 && value == -1 )
    value = atoi(arg3);

  if ( !str_cmp( arg2, "str" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Strength range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_str = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_str = value;
      return;
    }

  if ( !str_cmp( arg2, "int" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Intelligence range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_int = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_int = value;
      return;
    }

  if ( !str_cmp( arg2, "wis" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Wisdom range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_wis = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_wis = value;
      return;
    }

  if ( !str_cmp( arg2, "dex" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Dexterity range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_dex = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_dex = value;
      return;
    }

  if ( !str_cmp( arg2, "con" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Constitution range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_con = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_con = value;
      return;
    }

  if ( !str_cmp( arg2, "cha" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Charisma range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_cha = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_cha = value;
      return;
    }

  if ( !str_cmp( arg2, "lck" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          ch_printf( ch, "Luck range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_lck = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_lck = value;
      return;
    }

  if ( !str_cmp( arg2, "frc" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 20 )
        {
          ch_printf( ch, "Frc range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->perm_frc = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->perm_frc = value;
      return;
    }

  if ( !str_cmp( arg2, "sav1" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          send_to_char( "Saving throw range vs poison is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving_poison_death = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->saving_poison_death = value;
      return;
    }

  if ( !str_cmp( arg2, "sav2" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          send_to_char( "Saving throw range vs wands is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving_wand = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->saving_wand = value;
      return;
    }

  if ( !str_cmp( arg2, "sav3" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          send_to_char( "Saving throw range vs para is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving_para_petri = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->saving_para_petri = value;
      return;
    }

  if ( !str_cmp( arg2, "sav4" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          send_to_char( "Saving throw range vs bad breath is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving_breath = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->saving_breath = value;
      return;
    }

  if ( !str_cmp( arg2, "sav5" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          send_to_char( "Saving throw range vs force powers is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving_spell_staff = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->saving_spell_staff = value;
      return;
    }

  if ( !str_cmp( arg2, "sex" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 2 )
        {
          send_to_char( "Sex range is 0 to 2.\r\n", ch );
          return;
        }
      victim->sex = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->sex = value;
      return;
    }

  if ( !str_cmp( arg2, "race" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      value = get_npc_race( arg3 );
      if ( value < 0 )
        value = atoi( arg3 );
      if ( !IS_NPC(victim) && (value < 0 || value >= MAX_RACE) )
        {
          ch_printf( ch, "Race range is 0 to %d.\n", MAX_RACE-1 );
          return;
        }
      if ( IS_NPC(victim) && (value < 0 || value >= MAX_NPC_RACE) )
        {
          ch_printf( ch, "Race range is 0 to %d.\n", MAX_NPC_RACE-1 );
          return;
        }
      victim->race = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->race = value;
      return;
    }

  if ( !str_cmp( arg2, "armor" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -300 || value > 300 )
        {
          send_to_char( "AC range is -300 to 300.\r\n", ch );
          return;
        }
      victim->armor = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->ac = value;
      return;
    }

  if ( !str_cmp( arg2, "level" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Not on PC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > LEVEL_AVATAR + 5 )
        {
          ch_printf( ch, "Level range is 0 to %d.\r\n", LEVEL_AVATAR + 5 );
          return;
        }
      {
        int ability;
        for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
          victim->skill_level[ability] = value;
      }
      victim->top_level = value;
      victim->armor = 100-value*2.5;
      victim->hitroll = value/5;
      victim->damroll = value/5;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        {
          victim->pIndexData->level = value;
          victim->pIndexData->ac = 100-value*2.5;
          victim->pIndexData->hitroll = victim->hitroll;
          victim->pIndexData->damroll = victim->damroll;
        }
      sprintf(outbuf,"%s damnumdie %d",arg1, value/10);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damsizedie %d",arg1, 4);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damplus %d",arg1, 2);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s hitnumdie %d",arg1, value/5);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s hitsizedie %d",arg1, 10);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s hitplus %d",arg1, value*10 );
      do_mset( ch, outbuf );

      return;
    }

  if ( !str_cmp( arg2, "numattacks" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Not on PC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 20 )
        {
          send_to_char( "Attacks range is 0 to 20.\r\n", ch );
          return;
        }
      victim->numattacks = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->numattacks = value;
      return;
    }

  if ( !str_cmp( arg2, "credits" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      victim->gold = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->gold = value;
      return;
    }

  if ( !str_cmp( arg2, "hitroll" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      victim->hitroll = URANGE(0, value, 85);
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->hitroll = victim->hitroll;
      return;
    }

  if ( !str_cmp( arg2, "damroll" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      victim->damroll = URANGE(0, value, 65);
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->damroll = victim->damroll;
      return;
    }

  if ( !str_cmp( arg2, "hp" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 1 || value > 32700 )
        {
          send_to_char( "Hp range is 1 to 32,700 hit points.\r\n", ch );
          return;
        }
      victim->max_hit = value;
      return;
    }

  if ( !str_cmp( arg2, "nextquest" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 100 )
        {
          send_to_char( "Let's be responible, hmm?", ch );
          victim->nextquest = 0;
          return;
        }
      victim->nextquest = value;
      return;
    }

  if ( !str_cmp( arg2, "questpoints" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 2000 )
        {
          send_to_char( "Let's be responible, hmm?", ch );
          victim->questpoints = 0;
          return;
        }
      victim->questpoints = value;
      return;
    }

  if ( !str_cmp( arg2, "force" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 30000 )
        {
          send_to_char( "Force range is 0 to 30,000 force points.\r\n", ch );
          return;
        }
      victim->max_mana = value;
      return;
    }

  if ( !str_cmp( arg2, "move" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 30000 )
        {
          send_to_char( "Move range is 0 to 30,000 move points.\r\n", ch );
          return;
        }
      victim->max_move = value;
      return;
    }

  if ( !str_cmp( arg2, "align" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < -1000 || value > 1000 )
        {
          send_to_char( "Alignment range is -1000 to 1000.\r\n", ch );
          return;
        }
      victim->alignment = value;
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->alignment = value;
      return;
    }

  if ( !str_cmp( arg2, "password" ) )
    {
      char *pwdnew;
      char *p;

      if ( get_trust( ch ) < LEVEL_SUB_IMPLEM )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return;
        }
      if ( IS_NPC( victim ) )
        {
          send_to_char( "Mobs don't have passwords.\r\n", ch );
          return;
        }

      if ( strlen(arg3) < 5 )
        {
          send_to_char(
                       "New password must be at least five characters long.\r\n", ch );
          return;
        }

      /*
       * No tilde allowed because of player file format.
       */
      pwdnew = encode_string( arg3 );
      for ( p = pwdnew; *p != '\0'; p++ )
        {
          if ( *p == '~' )
            {
              send_to_char(
                           "New password not acceptable, try again.\r\n", ch );
              return;
            }
        }

      DISPOSE( victim->pcdata->pwd );
      victim->pcdata->pwd = str_dup( pwdnew );
      if ( IS_SET(sysdata.save_flags, SV_PASSCHG) )
        save_char_obj( victim );
      send_to_char( "Ok.\r\n", ch );
      ch_printf( victim, "Your password has been changed by %s.\r\n", ch->name );
      return;
    }

  if ( !str_cmp( arg2, "quest" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 500 )
        {
          send_to_char( "The current quest range is 0 to 500.\r\n", ch );
          return;
        }

      victim->pcdata->quest_number = value;
      return;
    }

  if ( !str_cmp( arg2, "qpa" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      victim->pcdata->quest_accum = value;
      return;
    }

  if ( !str_cmp( arg2, "qp" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 5000 )
        {
          send_to_char( "The current quest point range is 0 to 5000.\r\n", ch );
          return;
        }

      victim->pcdata->quest_curr = value;
      return;
    }

  if ( !str_cmp( arg2, "mentalstate" ) )
    {
      if ( value < -100 || value > 100 )
        {
          send_to_char( "Value must be in range -100 to +100.\r\n", ch );
          return;
        }
      victim->mental_state = value;
      return;
    }

  if ( !str_cmp( arg2, "emotion" ) )
    {
      if ( value < -100 || value > 100 )
        {
          send_to_char( "Value must be in range -100 to +100.\r\n", ch );
          return;
        }
      victim->emotional_state = value;
      return;
    }

  if ( !str_cmp( arg2, "thirst" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 100 )
        {
          send_to_char( "Thirst range is 0 to 100.\r\n", ch );
          return;
        }

      victim->pcdata->condition[COND_THIRST] = value;
      return;
    }

  if ( !str_cmp( arg2, "drunk" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 100 )
        {
          send_to_char( "Drunk range is 0 to 100.\r\n", ch );
          return;
        }

      victim->pcdata->condition[COND_DRUNK] = value;
      return;
    }

  if ( !str_cmp( arg2, "full" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 100 )
        {
          send_to_char( "Full range is 0 to 100.\r\n", ch );
          return;
        }

      victim->pcdata->condition[COND_FULL] = value;
      return;
    }

  if ( !str_cmp( arg2, "blood" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > MAX_LEVEL+10 )
        {
          ch_printf( ch, "Blood range is 0 to %d.\r\n", MAX_LEVEL+10 );
          return;
        }

      victim->pcdata->condition[COND_BLOODTHIRST] = value;
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !IS_NPC(victim) && get_trust( ch ) < LEVEL_SUPREME )
        {
          send_to_char( "Not on PC's.\r\n", ch );
          return;
        }

      STRFREE( victim->name );
      victim->name = STRALLOC( arg3 );
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        {
          STRFREE( victim->pIndexData->player_name );
          victim->pIndexData->player_name = QUICKLINK( victim->name );
        }
      return;
    }

  if ( !str_cmp( arg2, "minsnoop" ) )
    {
      if ( get_trust( ch ) < LEVEL_SUB_IMPLEM )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return;
        }
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }
      if ( victim->pcdata )
        {
          victim->pcdata->min_snoop = value;
          return;
        }
    }

  if ( !str_cmp( arg2, "clan" ) )
    {
      CLAN_DATA *clan;

      if ( get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return;
        }
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( arg3[0] == '\0' )
        {
          STRFREE( victim->pcdata->clan_name );
          victim->pcdata->clan_name     = STRALLOC( "" );
          victim->pcdata->clan  = NULL;
          send_to_char( "Removed from clan.\r\nPlease make sure you adjust that clan's members accordingly.\r\nAlso be sure to remove any bestowments they have been given.\r\n", ch );
          return;
        }
      clan = get_clan( arg3 );
      if ( !clan )
        {
          send_to_char( "No such clan.\r\n", ch );
          return;
        }
      STRFREE( victim->pcdata->clan_name );
      victim->pcdata->clan_name = QUICKLINK( clan->name );
      victim->pcdata->clan = clan;
      send_to_char( "Done.\r\nPlease make sure you adjust that clan's members accordingly.\r\n", ch );
      return;
    }


  if ( !str_cmp( arg2, "short" ) )
    {
      STRFREE( victim->short_descr );
      victim->short_descr = STRALLOC( arg3 );
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        {
          STRFREE( victim->pIndexData->short_descr );
          victim->pIndexData->short_descr = QUICKLINK( victim->short_descr );
        }
      return;
    }

  if ( !str_cmp( arg2, "long" ) )
    {
      STRFREE( victim->long_descr );
      strcpy( buf, arg3 );
      strcat( buf, "\r\n" );
      victim->long_descr = STRALLOC( buf );
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        {
          STRFREE( victim->pIndexData->long_descr );
          victim->pIndexData->long_descr = QUICKLINK( victim->long_descr );
        }
      return;
    }

  if ( !str_cmp( arg2, "description" ) )
    {
      if ( arg3[0] )
        {
          STRFREE( victim->description );
          victim->description = STRALLOC( arg3 );
          if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
            {
              STRFREE(victim->pIndexData->description );
              victim->pIndexData->description = QUICKLINK( victim->description );
            }
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      ch->substate = SUB_MOB_DESC;
      ch->dest_buf = victim;
      start_editing( ch, victim->description );
      return;
    }

  if ( !str_cmp( arg2, "title" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      set_title( victim, arg3 );
      return;
    }

  if ( !str_cmp( arg2, "spec" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Not on PC's.\r\n", ch );
          return;
        }

      if ( !str_cmp( arg3, "none" ) )
        {
          victim->spec_fun = NULL;
          send_to_char( "Special function removed.\r\n", ch );
          if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
            victim->pIndexData->spec_fun = victim->spec_fun;
          return;
        }

      if ( ( victim->spec_fun = spec_lookup( arg3 ) ) == 0 )
        {
          send_to_char( "No such spec fun.\r\n", ch );
          return;
        }
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->spec_fun = victim->spec_fun;
      return;
    }

  if ( !str_cmp( arg2, "spec2" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Not on PC's.\r\n", ch );
          return;
        }

      if ( !str_cmp( arg3, "none" ) )
        {
          victim->spec_2 = NULL;
          send_to_char( "Special function removed.\r\n", ch );
          if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
            victim->pIndexData->spec_2 = victim->spec_2;
          return;
        }

      if ( ( victim->spec_2 = spec_lookup( arg3 ) ) == 0 )
        {
          send_to_char( "No such spec fun.\r\n", ch );
          return;
        }
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->spec_2 = victim->spec_2;
      return;
    }
  if ( !str_cmp( arg2, "whoCloak" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( (victim->pcdata) && (victim->pcdata->whoCloak) )
        {
          victim->pcdata->whoCloak = FALSE;
          send_to_char( "This user will no longer be cloaked.\r\n", ch);
          return;
        }
      if ( (victim->pcdata) && (!(victim->pcdata->whoCloak)) )
        {
          victim->pcdata->whoCloak = TRUE;
          send_to_char( "This user will now be cloaked on the who list!\r\n", ch);
          return;
        }
      send_to_char( "Error setting whoCloak.", ch);
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      bool pcflag;
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char( "You can only modify a mobile's flags.\r\n", ch );
          return;
        }

      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> flags <flag> [flag]...\r\n", ch );
          send_to_char( "sentinal, scavenger, aggressive, stayarea, wimpy, practice, immortal,\r\n", ch );
          send_to_char( "deadly, mountable, guardian, nokill, scholar, noassist, droid, nocorpse,\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          pcflag = FALSE;
          argument = one_argument( argument, arg3 );
          value = IS_NPC( victim) ? get_actflag( arg3 ) : get_plrflag( arg3 );

          if ( !IS_NPC( victim ) && ( value < 0 || value > 31 ) )
            {
              pcflag = TRUE;
              value = get_pcflag( arg3 );
            }
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              if ( IS_NPC(victim) && 1 << value == ACT_IS_NPC )
                send_to_char( "If that could be changed, it would cause many problems.\r\n", ch );
              else
                if ( IS_NPC(victim) && 1 << value == ACT_POLYMORPHED )
                  send_to_char( "Changing that would be a _bad_ thing.\r\n", ch);
                else
                  {
                    if ( pcflag )
                      TOGGLE_BIT( victim->pcdata->flags, 1 << value );
                    else
                      {
                        TOGGLE_BIT( victim->act, 1 << value );
                        /* NPC check added by Gorog */
                        if ( IS_NPC(victim) && (1 << value == ACT_PROTOTYPE) )
                          victim->pIndexData->act = victim->act;
                      }
                  }
            }
        }
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->act = victim->act;
      return;
    }

  if ( !str_cmp( arg2, "wanted" ) )
    {
      if ( IS_NPC( victim ) )
        {
          send_to_char( "Wanted flags are for players only.\r\n", ch );
          return;
        }

      if ( get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char( "You are not a high enough level to do that.\r\n", ch );
          return;
        }

      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> wanted <planet> [planet]...\r\n", ch );
          return;
        }

      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_wanted_flag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->pcdata->wanted_flags, 1 << value );
        }
      return;
    }

  if ( !str_cmp( arg2, "vip" ) )
    {
      if ( !IS_NPC( victim ))
        {
          send_to_char( "VIP flags are for mobs only.\r\n", ch );
          return;
        }

      if ( !can_mmodify( ch, victim ) )
        return;

      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> vip <planet> [planet]...\r\n", ch );
          return;
        }

      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_vip_flag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->vip_flags, 1 << value );
        }
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->vip_flags = victim->vip_flags;
      return;
    }


  if ( !str_cmp( arg2, "affected" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's flags.\r\n", ch );
          return;
        }

      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> affected <flag> [flag]...\r\n", ch);
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_aflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->affected_by, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->affected_by = victim->affected_by;
      return;
    }

  /*
   * save some more finger-leather for setting RIS stuff
   */
  if ( !str_cmp( arg2, "r" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "i" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;


      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "s" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "ri" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "rs" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "is" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "ris" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "resistant" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's resistancies.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> resistant <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_risflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->resistant, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->resistant = victim->resistant;
      return;
    }

  if ( !str_cmp( arg2, "immune" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's immunities.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> immune <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_risflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->immune, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->immune = victim->immune;
      return;
    }

  if ( !str_cmp( arg2, "susceptible" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's susceptibilities.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> susceptible <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_risflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->susceptible, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->susceptible = victim->susceptible;
      return;
    }

  if ( !str_cmp( arg2, "part" ) )
    {
      if ( !IS_NPC( victim ) && get_trust( ch ) < LEVEL_LESSER )
        {
          send_to_char( "You can only modify a mobile's parts.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> part <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_partflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->xflags, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->xflags = victim->xflags;
      return;
    }

  if ( !str_cmp( arg2, "attack" ) )
    {
      if ( !IS_NPC( victim ) )
        {
          send_to_char( "You can only modify a mobile's attacks.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> attack <flag> [flag]...\r\n", ch );
          send_to_char( "bite          claws        tail        sting      punch        kick\r\n", ch );
          send_to_char( "trip          bash         stun        gouge      backstab\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_attackflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->attacks, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->attacks = victim->attacks;
      return;
    }

  if ( !str_cmp( arg2, "defense" ) )
    {
      if ( !IS_NPC( victim ) )
        {
          send_to_char( "You can only modify a mobile's defenses.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> defense <flag> [flag]...\r\n", ch );
          send_to_char( "parry        dodge\r\n",ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_defenseflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->defenses, 1 << value );
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->defenses = victim->defenses;
      return;
    }

  if ( !str_cmp( arg2, "pos" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > POS_STANDING )
        {
          ch_printf( ch, "Position range is 0 to %d.\r\n", POS_STANDING );
          return;
        }
      victim->position = value;
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->position = victim->position;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "defpos" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > POS_STANDING )
        {
          ch_printf( ch, "Position range is 0 to %d.\r\n", POS_STANDING );
          return;
        }
      victim->defposition = value;
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->defposition = victim->defposition;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /*
   * save some finger-leather
   */
  if ( !str_cmp( arg2, "hitdie" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sscanf(arg3,"%d %c %d %c %d",&num,&char1,&size,&char2,&plus);
      sprintf(outbuf,"%s hitnumdie %d",arg1, num);
      do_mset( ch, outbuf );

      sprintf(outbuf,"%s hitsizedie %d",arg1, size);
      do_mset( ch, outbuf );

      sprintf(outbuf,"%s hitplus %d",arg1, plus);
      do_mset( ch, outbuf );
      return;
    }
  /*
   * save some more finger-leather
   */
  if ( !str_cmp( arg2, "damdie" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;

      sscanf(arg3,"%d %c %d %c %d",&num,&char1,&size,&char2,&plus);
      sprintf(outbuf,"%s damnumdie %d",arg1, num);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damsizedie %d",arg1, size);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damplus %d",arg1, plus);
      do_mset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "hitnumdie" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 32767 )
        {
          send_to_char( "Number of hitpoint dice range is 0 to 30000.\r\n", ch );
          return;
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->hitnodice = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hitsizedie" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 32767 )
        {
          send_to_char( "Hitpoint dice size range is 0 to 30000.\r\n", ch );
          return;
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->hitsizedice = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hitplus" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 32767 )
        {
          send_to_char( "Hitpoint bonus range is 0 to 30000.\r\n", ch );
          return;
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->hitplus = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "damnumdie" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 100 )
        {
          send_to_char( "Number of damage dice range is 0 to 100.\r\n", ch );
          return;
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->damnodice = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "damsizedie" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 100 )
        {
          send_to_char( "Damage dice size range is 0 to 100.\r\n", ch );
          return;
        }
      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->damsizedice = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "damplus" ) )
    {
      if ( !IS_NPC(victim) )
        {
          send_to_char( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( value < 0 || value > 1000 )
        {
          send_to_char( "Damage bonus range is 0 to 1000.\r\n", ch );
          return;
        }

      if ( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->damplus = value;
      send_to_char( "Done.\r\n", ch );
      return;

    }


  if ( !str_cmp( arg2, "aloaded" ) )
    {
      if ( IS_NPC(victim) )
        {
          send_to_char( "Player Characters only.\r\n", ch );
          return;
        }


      if ( !can_mmodify( ch, victim ) )
        return;

      if ( !IS_SET(victim->pcdata->area->status, AREA_LOADED ) )
        {
          SET_BIT( victim->pcdata->area->status, AREA_LOADED );
          send_to_char( "Your area set to LOADED!\r\n", victim );
          if ( ch != victim )
            send_to_char( "Area set to LOADED!\r\n", ch );
          return;
        }
      else
        {
          REMOVE_BIT( victim->pcdata->area->status, AREA_LOADED );
          send_to_char( "Your area set to NOT-LOADED!\r\n", victim );
          if ( ch != victim )
            send_to_char( "Area set to NON-LOADED!\r\n", ch );
          return;
        }
    }

  if ( !str_cmp( arg2, "speaks" ) )
    {
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> speaks <language> [language] ...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_langflag( arg3 );
          if ( value == LANG_UNKNOWN )
            ch_printf( ch, "Unknown language: %s\r\n", arg3 );
          else
            if ( !IS_NPC( victim ) )
              {
                int valid_langs = LANG_COMMON | LANG_WOOKIEE | LANG_TWI_LEK | LANG_RODIAN
                  | LANG_HUTT | LANG_MON_CALAMARI | LANG_NOGHRI | LANG_GAMORREAN
                  | LANG_JAWA | LANG_ADARIAN | LANG_EWOK | LANG_VERPINE | LANG_DEFEL
                  | LANG_TRANDOSHAN | LANG_CHADRA_FAN | LANG_QUARREN | LANG_SULLUSTAN
                  | LANG_FALLEEN | LANG_DEVARONIAN | LANG_GOTAL | LANG_ITHORIAN | LANG_BINARY;

                if ( !(value &= valid_langs) )
                  {
                    ch_printf( ch, "Players may not know %s.\r\n", arg3 );
                    continue;
                  }
              }
          TOGGLE_BIT( victim->speaks, value );
        }
      if ( !IS_NPC( victim ) )
        {
          REMOVE_BIT( victim->speaks, race_table[victim->race].language );
          if ( !knows_language( victim, victim->speaking, victim ) )
            victim->speaking = race_table[victim->race].language;
        }
      else
        if ( IS_SET( victim->act, ACT_PROTOTYPE ) )
          victim->pIndexData->speaks = victim->speaks;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "speaking" ) )
    {
      if ( !IS_NPC( victim ) )
        {
          send_to_char( "Players must choose the language they speak themselves.\r\n", ch );
          return;
        }
      if ( !can_mmodify( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: mset <victim> speaking <language> [language]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_langflag( arg3 );
          if ( value == LANG_UNKNOWN )
            ch_printf( ch, "Unknown language: %s\r\n", arg3 );
          else
            TOGGLE_BIT( victim->speaking, value );
        }
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_PROTOTYPE ) )
        victim->pIndexData->speaking = victim->speaking;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_RESTRICTED;
      interpret( ch, origarg );
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = do_mset;
    }
  else
    do_mset( ch, "" );
  return;
}


void do_oset( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char buf  [MAX_STRING_LENGTH];
  char outbuf  [MAX_STRING_LENGTH];
  OBJ_DATA *obj, *tmpobj;
  EXTRA_DESCR_DATA *ed;
  bool lockobj;
  char *origarg = argument;

  int value, tmp;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't oset\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;

    case SUB_OBJ_EXTRA:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_oset: sub_obj_extra: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      /*
       * hopefully the object didn't get extracted...
       * if you're REALLY paranoid, you could always go through
       * the object and index-object lists, searching through the
       * extra_descr lists for a matching pointer...
       */
      ed  = ch->dest_buf;
      STRFREE( ed->description );
      ed->description = copy_buffer( ch );
      tmpobj = ch->spare_ptr;
      stop_editing( ch );
      ch->dest_buf = tmpobj;
      ch->substate = ch->tempnum;
      return;

    case SUB_OBJ_LONG:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_oset: sub_obj_long: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      obj = ch->dest_buf;
      if ( obj && obj_extracted(obj) )
        {
          send_to_char( "Your object was extracted!\r\n", ch );
          stop_editing( ch );
          return;
        }
      STRFREE( obj->description );
      obj->description = copy_buffer( ch );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE( obj->pIndexData->description );
          obj->pIndexData->description = QUICKLINK( obj->description );
        }
      tmpobj = ch->spare_ptr;
      stop_editing( ch );
      ch->substate = ch->tempnum;
      ch->dest_buf = tmpobj;
      return;
    }

  obj = NULL;
  smash_tilde( argument );

  if ( ch->substate == SUB_REPEATCMD )
    {
      obj = ch->dest_buf;
      if ( obj && obj_extracted(obj) )
        {
          send_to_char( "Your object was extracted!\r\n", ch );
          obj = NULL;
          argument = "done";
        }
      if ( argument[0] == '\0' || !str_cmp( argument, " " )
           ||   !str_cmp( argument, "stat" ) )
        {
          if ( obj )
            do_ostat( ch, obj->name );
          else
            send_to_char( "No object selected.  Type '?' for help.\r\n", ch );
          return;
        }
      if ( !str_cmp( argument, "done" ) || !str_cmp( argument, "off" ) )
        {
          send_to_char( "Oset mode off.\r\n", ch );
          ch->substate = SUB_NONE;
          DISPOSE(ch->dest_buf);
          if ( ch->pcdata && ch->pcdata->subprompt )
            STRFREE( ch->pcdata->subprompt );
          return;
        }
    }
  if ( obj )
    {
      lockobj = TRUE;
      strcpy( arg1, obj->name );
      argument = one_argument( argument, arg2 );
      strcpy( arg3, argument );
    }
  else
    {
      lockobj = FALSE;
      argument = one_argument( argument, arg1 );
      argument = one_argument( argument, arg2 );
      strcpy( arg3, argument );
    }

  /*
    if ( !str_cmp( arg1, "on" ) )
    {
    send_to_char( "Syntax: oset <object|vnum> on.\r\n", ch );
    return;
    }
  */

  if ( arg1[0] == '\0' || arg2[0] == '\0' || !str_cmp( arg1, "?" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        {
          if ( obj )
            send_to_char( "Syntax: <field>  <value>\r\n",               ch );
          else
            send_to_char( "Syntax: <object> <field>  <value>\r\n",      ch );
        }
      else
        send_to_char( "Syntax: oset <object> <field>  <value>\r\n",     ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  flags wear level weight cost rent timer\r\n",    ch );
      send_to_char( "  name short long desc ed rmed actiondesc\r\n",    ch );
      send_to_char( "  type value0 value1 value2 value3 value4 value5\r\n",     ch );
      send_to_char( "  affect rmaffect layers\r\n",                             ch );
      send_to_char( "For weapons:             For armor:\r\n",  ch );
      send_to_char( "  weapontype condition     ac condition\r\n",      ch );
      send_to_char( "  numdamdie sizedamdie                  \r\n",   ch );
      send_to_char( "  charges   maxcharges                  \r\n",   ch );
      send_to_char( "For potions, pills:\r\n",          ch );
      send_to_char( "  slevel spell1 spell2 spell3\r\n",                ch );
      send_to_char( "For devices:\r\n",                 ch );
      send_to_char( "  slevel spell maxcharges charges\r\n",            ch );
      send_to_char( "For salves:\r\n",                  ch );
      send_to_char( "  slevel spell1 spell2 maxdoses delay (keep low - delay is anoying)\r\n",          ch );
      send_to_char( "For containers:          For levers and switches:\r\n", ch );
      send_to_char( "  cflags key capacity      tflags\r\n",            ch );
      send_to_char( "For rawspice:            For ammo and batteries:\r\n",             ch );
      send_to_char( "  spicetype  grade         charges (at least 1000 for ammo)\r\n",          ch );
      send_to_char( "For crystals:\r\n",                ch );
      send_to_char( "  gemtype\r\n",            ch );
      return;
    }

  if ( !obj && get_trust(ch) <= LEVEL_IMMORTAL )
    {
      if ( ( obj = get_obj_here( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You can't find that here.\r\n", ch );
          return;
        }
    }
  else
    if ( !obj )
      {
        if ( ( obj = get_obj_world( ch, arg1 ) ) == NULL )
          {
            send_to_char( "There is nothing like that in all the realms.\r\n", ch );
            return;
          }
      }
  if ( lockobj )
    ch->dest_buf = obj;
  else
    DISPOSE(ch->dest_buf);

  separate_obj( obj );
  value = atoi( arg3 );

  /*
    if ( !str_cmp( arg2, "on" ) )
    {
    ch_printf( ch, "Oset mode on. (Editing '%s' vnum %d).\r\n",
    obj->name, obj->pIndexData->vnum );
    ch->substate = SUB_REPEATCMD;
    ch->dest_buf = obj;
    if ( ch->pcdata )
    {
    if ( ch->pcdata->subprompt )
    STRFREE( ch->pcdata->subprompt );
    sprintf( buf, "<&COset &W#%d&w> %%i", obj->pIndexData->vnum );
    ch->pcdata->subprompt = STRALLOC( buf );
    }
    return;
    }
  */

  if ( !str_cmp( arg2, "value0" ) || !str_cmp( arg2, "v0" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[0] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[0] = value;
      return;
    }

  if ( !str_cmp( arg2, "value1" ) || !str_cmp( arg2, "v1" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[1] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[1] = value;
      return;
    }

  if ( !str_cmp( arg2, "value2" ) || !str_cmp( arg2, "v2" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[2] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          obj->pIndexData->value[2] = value;
          if ( obj->item_type == ITEM_WEAPON && value != 0 )
            obj->value[2] = obj->pIndexData->value[1] * obj->pIndexData->value[2];
        }
      return;
    }

  if ( !str_cmp( arg2, "value3" ) || !str_cmp( arg2, "v3" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[3] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[3] = value;
      return;
    }

  if ( !str_cmp( arg2, "value4" ) || !str_cmp( arg2, "v4" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[4] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[4] = value;
      return;
    }

  if ( !str_cmp( arg2, "value5" ) || !str_cmp( arg2, "v5" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[5] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[5] = value;
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> type <type>\r\n", ch );
          send_to_char( "Possible Types:\r\n", ch );
          send_to_char( "None        Light\r\n", ch );
          send_to_char( "Treasure    Armor      Comlink    Fabric      Grenade\r\n", ch );
          send_to_char( "Furniture   Trash      Container  Drink_con   Landmine\r\n", ch );
          send_to_char( "Key         Food       Money      Pen         Fuel\r\n", ch );
          send_to_char( "Fountain    Pill       Weapon     Medpac      Missile\r\n", ch );
          send_to_char( "Fire        Book       Superconductor         Rare_metal\r\n", ch );
          send_to_char( "Switch      Lever      Button     Dial        Government\r\n", ch );
          send_to_char( "Trap        Map        Portal     Paper       Magnet\r\n", ch );
          send_to_char( "Lockpick    Shovel     Thread     Smut        Ammo\r\n", ch );
          send_to_char( "Rawspice    Lens       Crystal    Duraplast   Battery\r\n", ch );
          send_to_char( "Toolkit     Durasteel  Oven       Mirror      Circuit\r\n", ch );
          send_to_char( "Potion      Salve      Pill       Device      Spacecraft\r\n", ch );
          send_to_char( "Bolt        Chemical\r\n", ch );
          return;
        }
      value = get_otype( argument );
      if ( value < 1 )
        {
          ch_printf( ch, "Unknown type: %s\r\n", arg3 );
          return;
        }
      obj->item_type = (short) value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->item_type = obj->item_type;
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> flags <flag> [flag]...\r\n", ch );
          send_to_char( "glow, dark, magic, bless, antievil, noremove, antisith, antisoldier,\r\n", ch );
          send_to_char( "donation, covering, hum, invis, nodrop, antigood, antipilot, anticitizen\r\n", ch );
          send_to_char( "antineutral, inventory, antithief, antijedi, clanobject, antihunter\r\n", ch );
          send_to_char( "small_size, human_size, large_size, hutt_size, contraband\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_oflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              TOGGLE_BIT(obj->extra_flags, 1 << value);
              if ( 1 << value == ITEM_PROTOTYPE )
                obj->pIndexData->extra_flags = obj->extra_flags;
            }
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->extra_flags = obj->extra_flags;
      return;
    }

  if ( !str_cmp( arg2, "wear" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> wear <flag> [flag]...\r\n", ch );
          send_to_char( "Possible locations:\r\n", ch );
          send_to_char( "take   finger   neck    body    head   legs\r\n", ch );
          send_to_char( "feet   hands    arms    shield  about  waist\r\n", ch );
          send_to_char( "wrist  wield    hold    ears    eyes   floating\r\n", ch );
          send_to_char( "over\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_wflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( obj->wear_flags, 1 << value );
        }

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->wear_flags = obj->wear_flags;
      return;
    }

  if ( !str_cmp( arg2, "level" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->level = value;
      return;
    }

  if ( !str_cmp( arg2, "weight" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->weight = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->weight = value;
      return;
    }

  if ( !str_cmp( arg2, "cost" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->cost = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->cost = value;
      return;
    }

  if ( !str_cmp( arg2, "rent" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->rent = value;
      else
        send_to_char( "Item must have prototype flag to set this value.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "layers" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->layers = value;
      else
        send_to_char( "Item must have prototype flag to set this value.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "timer" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->timer = value;
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      STRFREE( obj->name );
      obj->name = STRALLOC( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE(obj->pIndexData->name );
          obj->pIndexData->name = QUICKLINK( obj->name );
        }
      return;
    }

  if ( !str_cmp( arg2, "short" ) )
    {
      STRFREE( obj->short_descr );
      obj->short_descr = STRALLOC( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE(obj->pIndexData->short_descr );
          obj->pIndexData->short_descr = QUICKLINK( obj->short_descr );
        }
      else
        /* Feature added by Narn, Apr/96
         * If the item is not proto, add the word 'rename' to the keywords
         * if it is not already there.
         */
        {
          if ( str_infix( "rename", obj->name ) )
            {
              sprintf( buf, "%s %s", obj->name, "rename" );
              STRFREE( obj->name );
              obj->name = STRALLOC( buf );
            }
        }
      return;
    }

  if ( !str_cmp( arg2, "actiondesc" ) )
    {
      if ( strstr( arg3, "%n" )
           ||   strstr( arg3, "%d" )
           ||   strstr( arg3, "%l" ) )
        {
          send_to_char( "Illegal characters!\r\n", ch );
          return;
        }
      STRFREE( obj->action_desc );
      obj->action_desc = STRALLOC( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE(obj->pIndexData->action_desc );
          obj->pIndexData->action_desc = QUICKLINK( obj->action_desc );
        }
      return;
    }

  if ( !str_cmp( arg2, "long" ) )
    {
      if ( arg3[0] )
        {
          STRFREE( obj->description );
          obj->description = STRALLOC( arg3 );
          if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
            {
              STRFREE(obj->pIndexData->description );
              obj->pIndexData->description = QUICKLINK( obj->description );
            }
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->substate = SUB_OBJ_LONG;
      ch->dest_buf = obj;
      start_editing( ch, obj->description );
      return;
    }

  if ( !str_cmp( arg2, "affect" ) )
    {
      AFFECT_DATA *paf;
      short loc;
      int bitv;

      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' || !argument || argument[0] == 0 )
        {
          send_to_char( "Usage: oset <object> affect <field> <value>\r\n", ch );
          send_to_char( "Affect Fields:\r\n", ch );
          send_to_char( "none        strength    dexterity   intelligence  wisdom       constitution\r\n", ch );
          send_to_char( "sex         level       age         height        weight       force\r\n", ch );
          send_to_char( "hit         move        credits     experience    armor        hitroll\r\n", ch );
          send_to_char( "damroll     save_para   save_rod    save_poison   save_breath  save_power\r\n", ch );
          send_to_char( "charisma    resistant   immune      susceptible   affected     luck\r\n", ch );
          send_to_char( "backstab    pick        track       steal         sneak        hide\r\n", ch );
          send_to_char( "detrap      dodge       peek        scan          gouge        search\r\n", ch );
          send_to_char( "mount       disarm      kick        parry         bash         stun\r\n", ch );
          send_to_char( "punch       climb       grip        scribe        brew\r\n", ch );
          return;
        }
      loc = get_atype( arg2 );
      if ( loc < 1 )
        {
          ch_printf( ch, "Unknown field: %s\r\n", arg2 );
          return;
        }
      if ( loc >= APPLY_AFFECT && loc < APPLY_WEAPONSPELL )
        {
          bitv = 0;
          while ( argument[0] != '\0' )
            {
              argument = one_argument( argument, arg3 );
              if ( loc == APPLY_AFFECT )
                value = get_aflag( arg3 );
              else
                value = get_risflag( arg3 );
              if ( value < 0 || value > 31 )
                ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
              else
                SET_BIT( bitv, 1 << value );
            }
          if ( !bitv )
            return;
          value = bitv;
        }
      else
        {
          argument = one_argument( argument, arg3 );
          value = atoi( arg3 );
        }
      CREATE( paf, AFFECT_DATA, 1 );
      paf->type         = -1;
      paf->duration             = -1;
      paf->location             = loc;
      paf->modifier             = value;
      paf->bitvector            = 0;
      paf->next         = NULL;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        LINK( paf, obj->pIndexData->first_affect,
              obj->pIndexData->last_affect, next, prev );
      else
        LINK( paf, obj->first_affect, obj->last_affect, next, prev );
      ++top_affect;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "rmaffect" ) )
    {
      AFFECT_DATA *paf;
      short loc, count;

      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> rmaffect <affect#>\r\n", ch );
          return;
        }
      loc = atoi( argument );
      if ( loc < 1 )
        {
          send_to_char( "Invalid number.\r\n", ch );
          return;
        }

      count = 0;

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          OBJ_INDEX_DATA *pObjIndex;

          pObjIndex = obj->pIndexData;
          for ( paf = pObjIndex->first_affect; paf; paf = paf->next )
            {
              if ( ++count == loc )
                {
                  UNLINK( paf, pObjIndex->first_affect, pObjIndex->last_affect, next, prev );
                  DISPOSE( paf );
                  send_to_char( "Removed.\r\n", ch );
                  --top_affect;
                  return;
                }
            }
          send_to_char( "Not found.\r\n", ch );
          return;
        }
      else
        {
          for ( paf = obj->first_affect; paf; paf = paf->next )
            {
              if ( ++count == loc )
                {
                  UNLINK( paf, obj->first_affect, obj->last_affect, next, prev );
                  DISPOSE( paf );
                  send_to_char( "Removed.\r\n", ch );
                  --top_affect;
                  return;
                }
            }
          send_to_char( "Not found.\r\n", ch );
          return;
        }
    }

  if ( !str_cmp( arg2, "ed" ) )
    {
      if ( arg3[0] == '\0' )
        {
          send_to_char( "Syntax: oset <object> ed <keywords>\r\n",
                        ch );
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( obj->timer )
        {
          send_to_char("It's not safe to edit an extra description on an object with a timer.\r\nTurn it off first.\r\n", ch );
          return;
        }
      if ( obj->item_type == ITEM_PAPER )
        {
          send_to_char("You can not add an extra description to a note paper at the moment.\r\n", ch);
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        ed = SetOExtraProto( obj->pIndexData, arg3 );
      else
        ed = SetOExtra( obj, arg3 );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->substate = SUB_OBJ_EXTRA;
      ch->dest_buf = ed;
      start_editing( ch, ed->description );
      return;
    }

  if ( !str_cmp( arg2, "desc" ) )
    {
      CHECK_SUBRESTRICTED( ch );
      if ( obj->timer )
        {
          send_to_char("It's not safe to edit a description on an object with a timer.\r\nTurn it off first.\r\n", ch );
          return;
        }
      if ( obj->item_type == ITEM_PAPER )
        {
          send_to_char("You can not add a description to a note paper at the moment.\r\n", ch);
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        ed = SetOExtraProto( obj->pIndexData, obj->name );
      else
        ed = SetOExtra( obj, obj->name );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->substate = SUB_OBJ_EXTRA;
      ch->dest_buf = ed;
      start_editing( ch, ed->description );
      return;
    }



  if ( !str_cmp( arg2, "rmed" ) )
    {
      if ( arg3[0] == '\0' )
        {
          send_to_char( "Syntax: oset <object> rmed <keywords>\r\n", ch );
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          if ( DelOExtraProto( obj->pIndexData, arg3 ) )
            send_to_char( "Deleted.\r\n", ch );
          else
            send_to_char( "Not found.\r\n", ch );
          return;
        }
      if ( DelOExtra( obj, arg3 ) )
        send_to_char( "Deleted.\r\n", ch );
      else
        send_to_char( "Not found.\r\n", ch );
      return;
    }
  /*
   * save some finger-leather
   */
  if ( !str_cmp( arg2, "ris" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "r" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "i" ) )
    {
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "s" ) )
    {
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "ri" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "rs" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "is" ) )
    {
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  /*
   * Make it easier to set special object values by name than number
   *                                            -Thoric
   */
  tmp = -1;
  switch( obj->item_type )
    {
    case ITEM_WEAPON:
      if ( !str_cmp( arg2, "weapontype" ) )
        {
          int x;

          value = -1;
          for ( x = 0; x < (int)(sizeof( weapon_table ) / sizeof( weapon_table[0] )); x++ )
            if ( !str_cmp( arg3, weapon_table[x] ) )
              value = x;
          if ( value < 0 )
            {
              send_to_char( "Unknown weapon type.\r\n", ch );
              send_to_char( "\r\nChoices:\r\n", ch );
              send_to_char( "   none, lightsaber, vibro-blade, blaster, force pike, bowcaster, bludgeon\r\n", ch );
              return;
            }
          tmp = 3;
          break;
        }
      if ( !str_cmp( arg2, "condition" ) )      tmp = 0;
      if ( !str_cmp( arg2, "numdamdie" ) )        tmp = 1;
      if ( !str_cmp( arg2, "sizedamdie" ) )       tmp = 2;
      if ( !str_cmp( arg2, "charges" ) )          tmp = 4;
      if ( !str_cmp( arg2, "maxcharges" ) )       tmp = 5;
      if ( !str_cmp( arg2, "charge" ) )          tmp = 4;
      if ( !str_cmp( arg2, "maxcharge" ) )       tmp = 5;
      break;
    case ITEM_BOLT:
    case ITEM_AMMO:
      if ( !str_cmp( arg2, "charges" ) )          tmp = 0;
      if ( !str_cmp( arg2, "charge" ) )          tmp = 0;
      break;
    case ITEM_BATTERY:
      if ( !str_cmp( arg2, "charges" ) )          tmp = 0;
      if ( !str_cmp( arg2, "charge" ) )          tmp = 0;
      break;
    case ITEM_RAWSPICE:
    case ITEM_SPICE:
      if ( !str_cmp( arg2, "grade" ) )          tmp = 1;
      if ( !str_cmp( arg2, "spicetype" ) )
        {
          int x;

          value = -1;
          for ( x = 0; x < (int)(sizeof( spice_table ) / sizeof( spice_table[0] )); x++ )
            if ( !str_cmp( arg3, spice_table[x] ) )
              value = x;
          if ( value < 0 )
            {
              send_to_char( "Unknown spice type.\r\n", ch );
              send_to_char( "\r\nChoices:\r\n", ch );
              send_to_char( "   glitterstim, carsanum, ryll, andris\r\n", ch );
              return;
            }
          tmp = 0;
          break;
        }
      break;
    case ITEM_CRYSTAL:
      if ( !str_cmp( arg2, "gemtype" ) )
        {
          int x;

          value = -1;
          for ( x = 0; x < (int)(sizeof( crystal_table ) / sizeof( crystal_table[0] )); x++ )
            if ( !str_cmp( arg3, crystal_table[x] ) )
              value = x;
          if ( value < 0 )
            {
              send_to_char( "Unknown gem type.\r\n", ch );
              send_to_char( "\r\nChoices:\r\n", ch );
              send_to_char( "   non-adegan, kathracite, relacite, danite, mephite, ponite, illum, corusca\r\n", ch );
              return;
            }
          tmp = 0;
          break;
        }
      break;
    case ITEM_ARMOR:
      if ( !str_cmp( arg2, "condition" ) )      tmp = 0;
      if ( !str_cmp( arg2, "ac" )       )               tmp = 1;
      break;
    case ITEM_SALVE:
      if ( !str_cmp( arg2, "slevel"   ) )               tmp = 0;
      if ( !str_cmp( arg2, "maxdoses" ) )               tmp = 1;
      if ( !str_cmp( arg2, "doses"    ) )               tmp = 2;
      if ( !str_cmp( arg2, "delay"    ) )               tmp = 3;
      if ( !str_cmp( arg2, "spell1"   ) )               tmp = 4;
      if ( !str_cmp( arg2, "spell2"   ) )               tmp = 5;
      if ( tmp >=4 && tmp <= 5 )                        value = skill_lookup(arg3);
      break;
    case ITEM_POTION:
    case ITEM_PILL:
      if ( !str_cmp( arg2, "slevel" ) )         tmp = 0;
      if ( !str_cmp( arg2, "spell1" ) )         tmp = 1;
      if ( !str_cmp( arg2, "spell2" ) )         tmp = 2;
      if ( !str_cmp( arg2, "spell3" ) )         tmp = 3;
      if ( tmp >=1 && tmp <= 3 )                        value = skill_lookup(arg3);
      break;
    case ITEM_DEVICE:
      if ( !str_cmp( arg2, "slevel" ) )         tmp = 0;
      if ( !str_cmp( arg2, "spell" ) )
        {
          tmp = 3;
          value = skill_lookup(arg3);
        }
      if ( !str_cmp( arg2, "maxcharges" )       )       tmp = 1;
      if ( !str_cmp( arg2, "charges" ) )                tmp = 2;
      break;
    case ITEM_CONTAINER:
      if ( !str_cmp( arg2, "capacity" ) )               tmp = 0;
      if ( !str_cmp( arg2, "cflags" ) )         tmp = 1;
      if ( !str_cmp( arg2, "key" ) )            tmp = 2;
      break;
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_BUTTON:
      if ( !str_cmp( arg2, "tflags" ) )
        {
          tmp = 0;
          value = get_trigflag(arg3);
        }
      break;
    }
  if ( tmp >= 0 && tmp <= 5 )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[tmp] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[tmp] = value;
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_RESTRICTED;
      interpret( ch, origarg );
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = do_oset;
    }
  else
    do_oset( ch, "" );
  return;
}


/*
 * Obsolete Merc room editing routine
 */
void do_rset( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  int value;
  bool proto;

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  strcpy( arg3, argument );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' )
    {
      send_to_char( "Syntax: rset <location> <field> value\r\n",        ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  flags sector\r\n",                               ch );
      return;
    }

  if ( ( location = find_location( ch, arg1 ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  if ( !can_rmodify( ch, location ) )
    return;

  if ( !is_number( arg3 ) )
    {
      send_to_char( "Value must be numeric.\r\n", ch );
      return;
    }
  value = atoi( arg3 );

  /*
   * Set something.
   */
  if ( !str_cmp( arg2, "flags" ) )
    {
      /*
       * Protect from messing up prototype flag
       */
      if ( IS_SET( location->room_flags, ROOM_PROTOTYPE ) )
        proto = TRUE;
      else
        proto = FALSE;
      location->room_flags      = value;
      if ( proto )
        SET_BIT( location->room_flags, ROOM_PROTOTYPE );
      return;
    }

  if ( !str_cmp( arg2, "sector" ) )
    {
      location->sector_type     = value;
      return;
    }

  /*
   * Generate usage message.
   */
  do_rset( ch, "" );
  return;
}

/*
 * Returns value 0 - 9 based on directional text.
 */
int get_dir( char *txt )
{
  int edir;
  char c1,c2;

  if ( !str_cmp( txt, "northeast" ) )
    return DIR_NORTHEAST;
  if ( !str_cmp( txt, "northwest" ) )
    return DIR_NORTHWEST;
  if ( !str_cmp( txt, "southeast" ) )
    return DIR_SOUTHEAST;
  if ( !str_cmp( txt, "southwest" ) )
    return DIR_SOUTHWEST;
  if ( !str_cmp( txt, "somewhere" ) )
    return 10;

  c1 = txt[0];
  if ( c1 == '\0' )
    return 0;
  c2 = txt[1];
  edir = 0;
  switch ( c1 )
    {
    case 'n':
      switch ( c2 )
        {
        default:   edir = 0; break;     /* north */
        case 'e':  edir = 6; break; /* ne        */
        case 'w':  edir = 7; break; /* nw        */
        }
      break;    case '0':  edir = 0; break; /* north */
    case 'e': case '1':  edir = 1; break; /* east  */
    case 's':
      switch ( c2 )
        {
        default:   edir = 2; break; /* south */
        case 'e':  edir = 8; break; /* se        */
        case 'w':  edir = 9; break; /* sw        */
        }
      break;    case '2':  edir = 2; break; /* south */
    case 'w': case '3':  edir = 3; break; /* west        */
    case 'u': case '4':  edir = 4; break; /* up  */
    case 'd': case '5':  edir = 5; break; /* down        */
    case '6':  edir = 6; break; /* ne    */
    case '7':  edir = 7; break; /* nw    */
    case '8':  edir = 8; break; /* se    */
    case '9':  edir = 9; break; /* sw    */
    case '?':  edir = 10;break; /* somewhere */
    }
  return edir;
}

char *sprint_reset( CHAR_DATA *ch, RESET_DATA *pReset, short num, bool rlist )
{
  static char buf[MAX_STRING_LENGTH];
  char mobname[MAX_STRING_LENGTH];
  char roomname[MAX_STRING_LENGTH];
  char objname[MAX_STRING_LENGTH];
  static ROOM_INDEX_DATA *room;
  static OBJ_INDEX_DATA *obj, *obj2;
  static MOB_INDEX_DATA *mob;
  int rvnum;

  if ( ch->in_room )
    rvnum = ch->in_room->vnum;
  if ( num == 1 )
    {
      room = NULL;
      obj  = NULL;
      obj2 = NULL;
      mob  = NULL;
    }

  switch( pReset->command )
    {
    default:
      sprintf( buf, "%2d) *** BAD RESET: %c %d %d %d %d ***\r\n",
               num,
               pReset->command,
               pReset->extra,
               pReset->arg1,
               pReset->arg2,
               pReset->arg3 );
      break;
    case 'M':
      mob = get_mob_index( pReset->arg1 );
      room = get_room_index( pReset->arg3 );
      if ( mob )
        strcpy( mobname, mob->player_name );
      else
        strcpy( mobname, "Mobile: *BAD VNUM*" );
      if ( room )
        strcpy( roomname, room->name );
      else
        strcpy( roomname, "Room: *BAD VNUM*" );
      sprintf( buf, "%2d) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               mobname,
               pReset->arg1,
               roomname,
               pReset->arg3,
               pReset->arg2 );
      break;
    case 'E':
      if ( !mob )
        strcpy( mobname, "* ERROR: NO MOBILE! *" );
      if ( (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );
      sprintf( buf, "%2d) %s (%d) -> %s (%s) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               mobname,
               wear_locs[pReset->arg3],
               pReset->arg2 );
      break;
    case 'H':
      if ( pReset->arg1 > 0
           &&  (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        if ( !obj )
          strcpy( objname, "Object: *NULL obj*" );
      sprintf( buf, "%2d) Hide %s (%d)\r\n",
               num,
               objname,
               obj ? obj->vnum : pReset->arg1 );
      break;
    case 'G':
      if ( !mob )
        strcpy( mobname, "* ERROR: NO MOBILE! *" );
      if ( (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );
      sprintf( buf, "%2d) %s (%d) -> %s (carry) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               mobname,
               pReset->arg2 );
      break;
    case 'O':
      if ( (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );
      room = get_room_index( pReset->arg3 );
      if ( !room )
        strcpy( roomname, "Room: *BAD VNUM*" );
      else
        strcpy( roomname, room->name );
      sprintf( buf, "%2d) (object) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               roomname,
               pReset->arg3,
               pReset->arg2 );
      break;
    case 'P':
      if ( (obj2 = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object1: *BAD VNUM*" );
      else
        strcpy( objname, obj2->name );
      if ( pReset->arg3 > 0
           &&  (obj = get_obj_index( pReset->arg3 )) == NULL )
        strcpy( roomname, "Object2: *BAD VNUM*" );
      else
        if ( !obj )
          strcpy( roomname, "Object2: *NULL obj*" );
        else
          strcpy( roomname, obj->name );
      sprintf( buf, "%2d) (Put) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               roomname,
               obj ? obj->vnum : pReset->arg3,
               pReset->arg2 );
      break;
    case 'D':
      if ( pReset->arg2 < 0 || pReset->arg2 > MAX_DIR+1 )
        pReset->arg2 = 0;
      if ( (room = get_room_index( pReset->arg1 )) == NULL )
        {
          strcpy( roomname, "Room: *BAD VNUM*" );
          sprintf( objname, "%s (no exit)",
                   dir_name[pReset->arg2] );
        }
      else
        {
          strcpy( roomname, room->name );
          sprintf( objname, "%s%s",
                   dir_name[pReset->arg2],
                   get_exit(room,pReset->arg2) ? "" : " (NO EXIT!)" );
        }
      switch( pReset->arg3 )
        {
        default:        strcpy( mobname, "(* ERROR *)" );       break;
        case 0: strcpy( mobname, "Open" );              break;
        case 1: strcpy( mobname, "Close" );             break;
        case 2: strcpy( mobname, "Close and lock" );    break;
        }
      sprintf( buf, "%2d) %s [%d] the %s [%d] door %s (%d)\r\n",
               num,
               mobname,
               pReset->arg3,
               objname,
               pReset->arg2,
               roomname,
               pReset->arg1 );
      break;
    case 'R':
      if ( (room = get_room_index( pReset->arg1 )) == NULL )
        strcpy( roomname, "Room: *BAD VNUM*" );
      else
        strcpy( roomname, room->name );
      sprintf( buf, "%2d) Randomize exits 0 to %d -> %s (%d)\r\n",
               num,
               pReset->arg2,
               roomname,
               pReset->arg1 );
      break;
    case 'T':
      sprintf( buf, "%2d) TRAP: %d %d %d %d (%s)\r\n",
               num,
               pReset->extra,
               pReset->arg1,
               pReset->arg2,
               pReset->arg3,
               flag_string(pReset->extra, trap_flags) );
      break;
    }
  if ( rlist && (!room || (room && room->vnum != rvnum)) )
    return NULL;
  return buf;
}

void do_redit( CHAR_DATA *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf [MAX_STRING_LENGTH];
  ROOM_INDEX_DATA       *location = NULL, *tmp = NULL;
  EXTRA_DESCR_DATA      *ed = NULL;
  char          dir = '\0';
  EXIT_DATA             *xit = NULL, *texit = NULL;
  int                   value = 0;
  int                   edir = 0, ekey = 0, evnum = 0;
  char          *origarg = argument;

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor.\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_ROOM_DESC:
      location = ch->dest_buf;
      if ( !location )
        {
          bug( "redit: sub_room_desc: NULL ch->dest_buf", 0 );
          location = ch->in_room;
        }
      STRFREE( location->description );
      location->description = copy_buffer( ch );
      stop_editing( ch );
      ch->substate = ch->tempnum;
      return;
    case SUB_ROOM_EXTRA:
      ed = ch->dest_buf;
      if ( !ed )
        {
          bug( "redit: sub_room_extra: NULL ch->dest_buf", 0 );
          stop_editing( ch );
          return;
        }
      STRFREE( ed->description );
      ed->description = copy_buffer( ch );
      stop_editing( ch );
      ch->substate = ch->tempnum;
      return;
    }

  location = ch->in_room;

  smash_tilde( argument );
  argument = one_argument( argument, arg );
  if ( ch->substate == SUB_REPEATCMD )
    {
      if ( arg[0] == '\0' )
        {
          do_rstat( ch, "" );
          return;
        }
      if ( !str_cmp( arg, "done" ) || !str_cmp( arg, "off" ) )
        {
          send_to_char( "Redit mode off.\r\n", ch );
          if ( ch->pcdata && ch->pcdata->subprompt )
            STRFREE( ch->pcdata->subprompt );
          ch->substate = SUB_NONE;
          return;
        }
    }
  if ( arg[0] == '\0' || !str_cmp( arg, "?" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        send_to_char( "Syntax: <field> value\r\n",                      ch );
      else
        send_to_char( "Syntax: redit <field> value\r\n",                ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  name desc ed rmed\r\n",                  ch );
      send_to_char( "  exit bexit exdesc exflags exname exkey\r\n",     ch );
      send_to_char( "  flags sector teledelay televnum tunnel\r\n",     ch );
      send_to_char( "  rlist exdistance\r\n",                           ch );
      return;
    }

  if ( !can_rmodify( ch, location ) )
    return;

  /*
    if ( !str_cmp( arg, "on" ) )
    {
    send_to_char( "Redit mode on.\r\n", ch );
    ch->substate = SUB_REPEATCMD;
    if ( ch->pcdata )
    {
    if ( ch->pcdata->subprompt )
    STRFREE( ch->pcdata->subprompt );
    ch->pcdata->subprompt = STRALLOC( "<&CRedit &W#%r&w> %i" );
    }
    return;
    }
  */

  if ( !str_cmp( arg, "substate" ) )
    {
      argument = one_argument( argument, arg2);
      if( !str_cmp( arg2, "north" )  )
        {
          ch->inter_substate = SUB_NORTH;
          return;
        }
      if( !str_cmp( arg2, "east" )  )
        {
          ch->inter_substate = SUB_EAST;
          return;
        }
      if( !str_cmp( arg2, "south" )  )
        {
          ch->inter_substate = SUB_SOUTH;
          return;
        }
      if( !str_cmp( arg2, "west" )  )
        {
          ch->inter_substate = SUB_WEST;
          return;
        }
      if( !str_cmp( arg2, "up" )  )
        {
          ch->inter_substate = SUB_UP;
          return;
        }
      if( !str_cmp( arg2, "down" )  )
        {
          ch->inter_substate = SUB_DOWN;
          return;
        }
      send_to_char( " unrecognized substate in redit\r\n", ch);
      return;
    }


  if ( !str_cmp( arg, "name" ) )
    {
      if ( argument[0] == '\0' )
        {
          send_to_char( "Set the room name.  A very brief single line room description.\r\n", ch );
          send_to_char( "Usage: redit name <Room summary>\r\n", ch );
          return;
        }
      STRFREE( location->name );
      location->name = STRALLOC( argument );
      return;
    }

  if ( !str_cmp( arg, "desc" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      ch->substate = SUB_ROOM_DESC;
      ch->dest_buf = location;
      start_editing( ch, location->description );
      return;
    }

  if ( !str_cmp( arg, "tunnel" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the maximum characters allowed in the room at one time. (0 = unlimited).\r\n", ch );
          send_to_char( "Usage: redit tunnel <value>\r\n", ch );
          return;
        }
      location->tunnel = URANGE( 0, atoi(argument), 1000 );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "ed" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Create an extra description.\r\n", ch );
          send_to_char( "You must supply keyword(s).\r\n", ch );
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      ed = SetRExtra( location, argument );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      ch->substate = SUB_ROOM_EXTRA;
      ch->dest_buf = ed;
      start_editing( ch, ed->description );
      return;
    }

  if ( !str_cmp( arg, "rmed" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Remove an extra description.\r\n", ch );
          send_to_char( "You must supply keyword(s).\r\n", ch );
          return;
        }
      if ( DelRExtra( location, argument ) )
        send_to_char( "Deleted.\r\n", ch );
      else
        send_to_char( "Not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "rlist" ) )
    {
      RESET_DATA *pReset;
      char *bptr;
      AREA_DATA *tarea;
      short num;

      tarea = location->area;
      if ( !tarea->first_reset )
        {
          send_to_char( "This area has no resets to list.\r\n", ch );
          return;
        }
      num = 0;
      for ( pReset = tarea->first_reset; pReset; pReset = pReset->next )
        {
          num++;
          if ( (bptr = sprint_reset( ch, pReset, num, TRUE )) == NULL )
            continue;
          send_to_char( bptr, ch );
        }
      return;
    }

  if ( !str_cmp( arg, "flags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Toggle the room flags.\r\n", ch );
          send_to_char( "Usage: redit flags <flag> [flag]...\r\n", ch );
          send_to_char( "\r\nPossible Flags: \r\n", ch );
          send_to_char( "dark, nomob, indoors, nomagic, bank,\r\n", ch );
          send_to_char( "private, safe, petshop, norecall, donation, nodropall, silence,\r\n", ch );
          send_to_char( "logspeach, nodrop, clanstoreroom, plr_home, empty_home, teleport\r\n", ch );
          send_to_char( "nofloor, prototype, refinery, factory, recruit\r\n", ch );
          send_to_char( "spacecraft, auction, no_drive, can_land, can_fly, hotel\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg2 );
          value = get_rflag( arg2 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg2 );
          else if ( 1 << value == ROOM_PLR_HOME && get_trust(ch) < LEVEL_SUPREME )
            send_to_char( "If you want to build a player home use the 'empty_home' flag instead.\r\n", ch );
          else
            {
              TOGGLE_BIT( location->room_flags, 1 << value );
            }
        }
      return;
    }

  if ( !str_cmp( arg, "teledelay" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the delay of the teleport. (0 = off).\r\n", ch );
          send_to_char( "Usage: redit teledelay <value>\r\n", ch );
          return;
        }
      location->tele_delay = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "televnum" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the vnum of the room to teleport to.\r\n", ch );
          send_to_char( "Usage: redit televnum <vnum>\r\n", ch );
          return;
        }
      location->tele_vnum = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "sector" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Set the sector type.\r\n", ch );
          send_to_char( "Usage: redit sector <value>\r\n", ch );
          send_to_char( "\r\nSector Values:\r\n", ch );
          send_to_char( "0:dark, 1:city, 2:field, 3:forest, 4:hills, 5:mountain, 6:water_swim\r\n", ch );
          send_to_char( "7:water_noswim, 8:underwater, 9:air, 10:desert, 11:unkown, 12:oceanfloor, 13:underground\r\n", ch );

          return;
        }
      location->sector_type = atoi( argument );
      if ( location->sector_type < 0 || location->sector_type >= SECT_MAX )
        {
          location->sector_type = 1;
          send_to_char( "Out of range\r\n.", ch );
        }
      else
        send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exkey" ) )
    {
      argument = one_argument( argument, arg2 );
      argument = one_argument( argument, arg3 );
      if ( arg2[0] == '\0' || arg3[0] == '\0' )
        {
          send_to_char( "Usage: redit exkey <dir> <key vnum>\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      value = atoi( arg3 );
      if ( !xit )
        {
          send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }
      xit->key = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exname" ) )
    {
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Change or clear exit keywords.\r\n", ch );
          send_to_char( "Usage: redit exname <dir> [keywords]\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( !xit )
        {
          send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }
      STRFREE( xit->keyword );
      xit->keyword = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exflags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Toggle or display exit flags.\r\n", ch );
          send_to_char( "Usage: redit exflags <dir> <flag> [flag]...\r\n", ch );
          send_to_char( "\r\nExit flags:\r\n", ch );
          send_to_char( "isdoor, closed, locked, can_look, searchable, can_leave, can_climb,\r\n", ch );
          send_to_char( "nopassdoor, secret, pickproof, fly, climb, dig, window, auto, can_enter\r\n", ch );
          send_to_char( "hidden, no_mob, bashproof, bashed\r\n", ch );

          return;
        }
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( !xit )
        {
          send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
          return;
        }
      if ( argument[0] == '\0' )
        {
          sprintf( buf, "Flags for exit direction: %d  Keywords: %s  Key: %d\r\n[ ",
                   xit->vdir, xit->keyword, xit->key );
          for ( value = 0; value <= MAX_EXFLAG; value++ )
            {
              if ( IS_SET( xit->exit_info, 1 << value ) )
                {
                  strcat( buf, ex_flags[value] );
                  strcat( buf, " " );
                }
            }
          strcat( buf, "]\r\n" );
          send_to_char( buf, ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg2 );
          value = get_exflag( arg2 );
          if ( value < 0 || value > MAX_EXFLAG )
            ch_printf( ch, "Unknown flag: %s\r\n", arg2 );
          else
            TOGGLE_BIT( xit->exit_info, 1 << value );
        }
      return;
    }



  if ( !str_cmp( arg, "ex_flags" ) )
    {
      argument = one_argument( argument, arg2 );
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }

      value = get_exflag(arg2);
      if ( value < 0 )
        {
          send_to_char("Bad exit flag. \r\n", ch);
          return;
        }
      if ( (xit = get_exit(location,edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
          xit = get_exit(location,edir);
        }
      TOGGLE_BIT( xit->exit_info, value );
      return;
    }


  if ( !str_cmp( arg, "ex_to_room" ) )
    {
      argument = one_argument( argument, arg2 );
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      evnum = atoi(arg2);
      if ( evnum < 1 || evnum > 32766 )
        {
          send_to_char( "Invalid room number.\r\n", ch );
          return;
        }
      if ( (tmp = get_room_index( evnum )) == NULL )
        {
          send_to_char( "Non-existant room.\r\n", ch );
          return;
        }
      if ( (xit = get_exit(location,edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
          xit = get_exit(location,edir);
        }
      xit->vnum = evnum;
      return;
    }

  if ( !str_cmp( arg, "ex_key" ) )
    {
      argument = one_argument( argument, arg2 );
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      if ( (xit = get_exit(location,edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
          xit = get_exit(location,edir);
        }
      xit->key = atoi( arg2 );
      return;
    }

  if ( !str_cmp( arg, "ex_exdesc" ) )
    {
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      if ( (xit = get_exit(location, edir)) == NULL )
        {
          sprintf(buf,"exit %c 1",dir);
          do_redit(ch,buf);
        }
      sprintf(buf,"exdesc %c %s",dir,argument);
      do_redit(ch,buf);
      return;
    }

  if ( !str_cmp( arg, "ex_keywords" ) )  /* not called yet */
    {
      switch(ch->inter_substate)
        {
        case SUB_EAST : dir = 'e'; edir = 1; break;
        case SUB_WEST : dir = 'w'; edir = 3; break;
        case SUB_SOUTH: dir = 's'; edir = 2; break;
        case SUB_UP   : dir = 'u'; edir = 4; break;
        case SUB_DOWN : dir = 'd'; edir = 5; break;
        default:
        case SUB_NORTH: dir = 'n'; edir = 0; break;
        }
      if ( (xit = get_exit(location, edir)) == NULL )
        {
          sprintf(buf, "exit %c 1", dir);
          do_redit(ch,buf);
          if ( (xit = get_exit(location, edir)) == NULL )
            return;
        }
      sprintf( buf, "%s %s", xit->keyword, argument );
      STRFREE( xit->keyword );
      xit->keyword = STRALLOC( buf );
      return;
    }

  if ( !str_cmp( arg, "exit" ) )
    {
      bool addexit, numnotdir;

      argument = one_argument( argument, arg2 );
      argument = one_argument( argument, arg3 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Create, change or remove an exit.\r\n", ch );
          send_to_char( "Usage: redit exit <dir> [room] [flags] [key] [keywords]\r\n", ch );
          return;
        }
      addexit = numnotdir = FALSE;
      switch( arg2[0] )
        {
        default:        edir = get_dir(arg2);                     break;
        case '+':       edir = get_dir(arg2+1); addexit = TRUE;   break;
        case '#':       edir = atoi(arg2+1);    numnotdir = TRUE; break;
        }
      if ( arg3[0] == '\0' )
        evnum = 0;
      else
        evnum = atoi( arg3 );
      if ( numnotdir )
        {
          if ( (xit = get_exit_num(location, edir)) != NULL )
            edir = xit->vdir;
        }
      else
        xit = get_exit(location, edir);
      if ( !evnum )
        {
          if ( xit )
            {
              extract_exit(location, xit);
              send_to_char( "Exit removed.\r\n", ch );
              return;
            }
          send_to_char( "No exit in that direction.\r\n", ch );
          return;
        }
      if ( evnum < 1 || evnum > 32766 )
        {
          send_to_char( "Invalid room number.\r\n", ch );
          return;
        }
      if ( (tmp = get_room_index( evnum )) == NULL )
        {
          send_to_char( "Non-existant room.\r\n", ch );
          return;
        }
      if ( get_trust(ch) <= LEVEL_IMMORTAL && tmp->area != location->area )
        {
          send_to_char( "You can't make an exit to that room.\r\n", ch );
          return;
        }
      if ( addexit || !xit )
        {
          if ( numnotdir )
            {
              send_to_char( "Cannot add an exit by number, sorry.\r\n", ch );
              return;
            }
          if ( addexit && xit && get_exit_to(location, edir, tmp->vnum) )
            {
              send_to_char( "There is already an exit in that direction leading to that location.\r\n", ch );
              return;
            }
          xit = make_exit( location, tmp, edir );
          xit->keyword          = STRALLOC( "" );
          xit->description              = STRALLOC( "" );
          xit->key                      = -1;
          xit->exit_info                = 0;
          act( AT_IMMORT, "$n reveals a hidden passage!", ch, NULL, NULL, TO_ROOM );
        }
      else
        act( AT_IMMORT, "Something is different...", ch, NULL, NULL, TO_ROOM );
      if ( xit->to_room != tmp )
        {
          xit->to_room = tmp;
          xit->vnum = evnum;
          texit = get_exit_to( xit->to_room, rev_dir[edir], location->vnum );
          if ( texit )
            {
              texit->rexit = xit;
              xit->rexit = texit;
            }
        }
      argument = one_argument( argument, arg3 );
      if ( arg3[0] != '\0' )
        xit->exit_info = atoi( arg3 );
      if ( argument && argument[0] != '\0' )
        {
          one_argument( argument, arg3 );
          ekey = atoi( arg3 );
          if ( ekey != 0 || arg3[0] == '0' )
            {
              argument = one_argument( argument, arg3 );
              xit->key = ekey;
            }
          if ( argument && argument[0] != '\0' )
            {
              STRFREE( xit->keyword );
              xit->keyword = STRALLOC( argument );
            }
        }
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /*
   * Twisted and evil, but works                                -Thoric
   * Makes an exit, and the reverse in one shot.
   */
  if ( !str_cmp( arg, "bexit" ) )
    {
      EXIT_DATA *this_exit, *rxit;
      char tmpcmd[MAX_INPUT_LENGTH];
      ROOM_INDEX_DATA *tmploc;
      int vnum, exnum;
      char rvnum[MAX_INPUT_LENGTH];
      bool numnotdir;

      argument = one_argument( argument, arg2 );
      argument = one_argument( argument, arg3 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Create, change or remove a two-way exit.\r\n", ch );
          send_to_char( "Usage: redit bexit <dir> [room] [flags] [key] [keywords]\r\n", ch );
          return;
        }
      numnotdir = FALSE;
      switch( arg2[0] )
        {
        default:
          edir = get_dir( arg2 );
          break;
        case '#':
          numnotdir = TRUE;
          edir = atoi( arg2+1 );
          break;
        case '+':
          edir = get_dir( arg2+1 );
          break;
        }
      tmploc = location;
      exnum = edir;
      if ( numnotdir )
        {
          if ( (this_exit = get_exit_num(tmploc, edir)) != NULL )
            edir = this_exit->vdir;
        }
      else
        this_exit = get_exit(tmploc, edir);

      rxit = NULL;
      vnum = 0;
      rvnum[0] = '\0';

      if ( this_exit )
        {
          vnum = this_exit->vnum;
          if ( arg3[0] != '\0' )
            sprintf( rvnum, "%d", tmploc->vnum );
          if ( this_exit->to_room )
            rxit = get_exit(this_exit->to_room, rev_dir[edir]);
          else
            rxit = NULL;
        }
      sprintf( tmpcmd, "exit %s %s %s", arg2, arg3, argument );
      do_redit( ch, tmpcmd );

      if ( numnotdir )
        this_exit = get_exit_num(tmploc, exnum);
      else
        this_exit = get_exit(tmploc, edir);

      if ( !rxit && this_exit )
        {
          vnum = this_exit->vnum;

          if ( arg3[0] != '\0' )
            sprintf( rvnum, "%d", tmploc->vnum );

          if ( this_exit->to_room )
            rxit = get_exit(this_exit->to_room, rev_dir[edir]);
          else
            rxit = NULL;
        }

      if ( vnum )
        {
          sprintf( tmpcmd, "%d redit exit %d %s %s",
                   vnum,
                   rev_dir[edir],
                   rvnum,
                   argument );
          do_at( ch, tmpcmd );
        }
      return;
    }

  if ( !str_cmp( arg, "exdistance" ) )
    {
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Set the distance (in rooms) between this room, and the destination room.\r\n", ch );
          send_to_char( "Usage: redit exdistance <dir> [distance]\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( xit )
        {
          xit->distance = URANGE( 1, atoi(argument), 50 );
          send_to_char( "Done.\r\n", ch );
          return;
        }
      send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "exdesc" ) )
    {
      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Create or clear a description for an exit.\r\n", ch );
          send_to_char( "Usage: redit exdesc <dir> [description]\r\n", ch );
          return;
        }
      if ( arg2[0] == '#' )
        {
          edir = atoi( arg2+1 );
          xit = get_exit_num( location, edir );
        }
      else
        {
          edir = get_dir( arg2 );
          xit = get_exit( location, edir );
        }
      if ( xit )
        {
          STRFREE( xit->description );
          if ( !argument || argument[0] == '\0' )
            xit->description = STRALLOC( "" );
          else
            {
              sprintf( buf, "%s\r\n", argument );
              xit->description = STRALLOC( buf );
            }
          send_to_char( "Done.\r\n", ch );
          return;
        }
      send_to_char( "No exit in that direction.  Use 'redit exit ...' first.\r\n", ch );
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_RESTRICTED;
      interpret( ch, origarg );
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = do_redit;
    }
  else
    do_redit( ch, "" );
  return;
}

void do_ocreate( CHAR_DATA *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_INDEX_DATA        *pObjIndex;
  OBJ_DATA              *obj;
  int                    vnum, cvnum;

  if ( IS_NPC(ch) )
    {
      send_to_char( "Mobiles cannot create.\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  vnum = is_number( arg ) ? atoi( arg ) : -1;

  if ( vnum == -1 || !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: ocreate <vnum> [copy vnum] <item name>\r\n", ch );
      return;
    }

  if ( vnum < 1 || vnum > 32767 )
    {
      send_to_char( "Bad number.\r\n", ch );
      return;
    }

  one_argument( argument, arg2 );
  cvnum = atoi( arg2 );
  if ( cvnum != 0 )
    argument = one_argument( argument, arg2 );
  if ( cvnum < 1 )
    cvnum = 0;

  if ( get_obj_index( vnum ) )
    {
      send_to_char( "An object with that number already exists.\r\n", ch );
      return;
    }

  if ( IS_NPC( ch ) )
    return;
  if ( get_trust( ch ) <= LEVEL_IMMORTAL )
    {
      AREA_DATA *pArea;

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to create objects.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_o_vnum
           ||   vnum > pArea->hi_o_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if( cvnum == vnum )
    send_to_char( "The vnums must be different!\r\n", ch );

  pObjIndex = make_object( vnum, cvnum, argument );
  if ( !pObjIndex )
    {
      send_to_char( "Error.\r\n", ch );
      log_string( "do_ocreate: make_object failed." );
      return;
    }
  obj = create_object( pObjIndex, get_trust(ch) );
  obj_to_char( obj, ch );
  act( AT_IMMORT, "$n makes some ancient arcane gestures, and opens $s hands to reveal $p!", ch, obj, NULL, TO_ROOM );
  act( AT_IMMORT, "You make some ancient arcane gestures, and open your hands to reveal $p!", ch, obj, NULL, TO_CHAR );
}

void do_mcreate( CHAR_DATA *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  MOB_INDEX_DATA        *pMobIndex;
  CHAR_DATA             *mob;
  int                    vnum, cvnum;

  if ( IS_NPC(ch) )
    {
      send_to_char( "Mobiles cannot create.\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  vnum = is_number( arg ) ? atoi( arg ) : -1;

  if ( vnum == -1 || !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: mcreate <vnum> [cvnum] <mobile name>\r\n", ch );
      return;
    }

  if ( vnum < 1 || vnum > 32767 )
    {
      send_to_char( "Bad number.\r\n", ch );
      return;
    }

  one_argument( argument, arg2 );
  cvnum = atoi( arg2 );
  if ( cvnum != 0 )
    argument = one_argument( argument, arg2 );
  if ( cvnum < 1 )
    cvnum = 0;

  if ( get_mob_index( vnum ) )
    {
      send_to_char( "A mobile with that number already exists.\r\n", ch );
      return;
    }

  if ( IS_NPC( ch ) )
    return;
  if ( get_trust( ch ) <= LEVEL_IMMORTAL )
    {
      AREA_DATA *pArea;

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to create mobiles.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_m_vnum
           ||   vnum > pArea->hi_m_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  pMobIndex = make_mobile( vnum, cvnum, argument );
  if ( !pMobIndex )
    {
      send_to_char( "Error.\r\n", ch );
      log_string( "do_mcreate: make_mobile failed." );
      return;
    }
  mob = create_mobile( pMobIndex );
  char_to_room( mob, ch->in_room );
  act( AT_IMMORT, "$n waves $s arms about, and $N appears at $s command!", ch, NULL, mob, TO_ROOM );
  act( AT_IMMORT, "You wave your arms about, and $N appears at your command!", ch, NULL, mob, TO_CHAR );
}


/*
 * Simple but nice and handle line editor.                      -Thoric
 */
void edit_buffer( CHAR_DATA *ch, char *argument )
{
  DESCRIPTOR_DATA *d = NULL;
  EDITOR_DATA *edit = NULL;
  char cmd[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  short line = 0, max_buf_lines = 0;
  bool save = FALSE;

  if ( (d = ch->desc) == NULL )
    {
      send_to_char( "You have no descriptor.\r\n", ch );
      return;
    }

  if ( d->connected != CON_EDITING )
    {
      send_to_char( "You can't do that!\r\n", ch );
      bug( "Edit_buffer: d->connected != CON_EDITING", 0 );
      return;
    }

  if ( ch->substate <= SUB_PAUSE )
    {
      send_to_char( "You can't do that!\r\n", ch );
      bug( "Edit_buffer: illegal ch->substate (%d)", ch->substate );
      d->connected = CON_PLAYING;
      return;
    }

  if ( !ch->editor )
    {
      send_to_char( "You can't do that!\r\n", ch );
      bug( "Edit_buffer: null editor", 0 );
      d->connected = CON_PLAYING;
      return;
    }

  edit = ch->editor;
  save = FALSE;
  max_buf_lines = 24;

  if ( ch->substate == SUB_MPROG_EDIT || ch->substate == SUB_HELP_EDIT )
    max_buf_lines = 48;

  if ( argument[0] == '/' || argument[0] == '\\' )
    {
      one_argument( argument, cmd );
      if ( !str_cmp( cmd+1, "?" ) )
        {
          send_to_char( "Editing commands\r\n---------------------------------\r\n", ch );
          send_to_char( "/l              list buffer\r\n",      ch );
          send_to_char( "/c              clear buffer\r\n",     ch );
          send_to_char( "/d [line]       delete line\r\n",      ch );
          send_to_char( "/g <line>       goto line\r\n",        ch );
          send_to_char( "/i <line>       insert line\r\n",      ch );
          send_to_char( "/r <old> <new>  global replace\r\n",   ch );
          send_to_char( "/a              abort editing\r\n",    ch );
          send_to_char( "/f              format text ( to fit screen )\r\n",  ch );
          if ( get_trust(ch) > LEVEL_IMMORTAL )
            send_to_char( "/! <command>    execute command (do not use another editing command)\r\n",  ch );
          send_to_char( "/s              save buffer\r\n\r\n> ",ch );
          return;
        }

      if ( !str_cmp( cmd+1, "c" ) )
        {

          memset( edit, '\0', sizeof(EDITOR_DATA) );
          edit->numlines = 0;
          edit->on_line   = 0;
          send_to_char( "Buffer cleared.\r\n> ", ch );
          return;
        }

      if ( !str_cmp( cmd+1, "r" ) )
        {
          char word1[MAX_INPUT_LENGTH];
          char word2[MAX_INPUT_LENGTH];
          char *sptr, *wptr, *lwptr;
          int x, count, wordln, lineln;

          sptr = one_argument( argument, word1 );
          sptr = one_argument( sptr, word1 );
          sptr = one_argument( sptr, word2 );
          if ( word1[0] == '\0' || word2[0] == '\0' )
            {
              send_to_char( "Need word to replace, and replacement.\r\n> ", ch );
              return;
            }
          if ( strcmp( word1, word2 ) == 0 )
            {
              send_to_char( "Done.\r\n> ", ch );
              return;
            }

          count = 0;
	  wordln = strlen(word1);
          ch_printf( ch, "Replacing all occurrences of %s with %s...\r\n", word1, word2 );
          for ( x = edit->on_line; x < edit->numlines; x++ )
            {
              lwptr = edit->line[x];
              while ( (wptr = strstr( lwptr, word1 )) != NULL )
                {
                  sptr = lwptr;
                  lwptr = wptr + wordln;
                  sprintf( buf, "%s%s", word2, wptr + wordln );
                  lineln = wptr - edit->line[x] - wordln;
                  ++count;
                  if ( strlen(buf) + lineln > 79 )
                    {
                      lineln = UMAX(0, (79 - strlen(buf)));
                      buf[lineln] = '\0';
                      break;
                    }
                  else
                    lineln = strlen(buf);
                  buf[lineln] = '\0';
                  strcpy( wptr, buf );
                }
            }
          ch_printf( ch, "Found and replaced %d occurrence(s).\r\n> ", count );
          return;
        }

      if ( !str_cmp( cmd+1, "f" ) )
        {
          char   temp_buf[5000];
          int    x, ep, old_p, end_mark;
          int    p = 0;

          for ( x = 0; x < edit->numlines; x++ )
            {
              strcpy ( temp_buf+p , edit->line[x] );
              p += strlen( edit->line[x] );
              temp_buf[p] = ' ';
              p++;
            }

          temp_buf[p] = '\0';
          end_mark = p;
          p = 75;
          old_p =0;
          edit->on_line =0;
          edit->numlines =0;

          while ( old_p < end_mark )
            {
              while ( temp_buf[p] != ' ' && temp_buf[p] != '\0' && p > old_p )
                p--;

              if ( p == old_p )
                p +=75;

              if ( p > end_mark )
                p = end_mark;

              ep =0;
              for ( x= old_p ; x < p ; x++ )
                {
                  edit->line[edit->on_line][ep] = temp_buf[x];
                  ep++;
                }
              edit->line[edit->on_line][ep] = '\0';

              edit->on_line++;
              edit->numlines++;

              old_p = p+1 ;
              p += 75;

            }

          send_to_char( "OK.\r\n> ", ch );
          return;
        }

      if ( !str_cmp( cmd+1, "i" ) )
        {
          if ( edit->numlines >= max_buf_lines )
            send_to_char( "Buffer is full.\r\n> ", ch );
          else
            {
              if ( argument[2] == ' ' )
                line = atoi( argument + 2 ) - 1;
              else
                line = edit->on_line;
              if ( line < 0 )
                line = edit->on_line;
              if ( line < 0 || line > edit->numlines )
                send_to_char( "Out of range.\r\n> ", ch );
              else
                {
		  int x = 0;

                  for ( x = ++edit->numlines; x > line; x-- )
                    strcpy( edit->line[x], edit->line[x-1] );
                  strcpy( edit->line[line], "" );
                  send_to_char( "Line inserted.\r\n> ", ch );
                }
            }
          return;
        }
      if ( !str_cmp( cmd+1, "d" ) )
        {
          if ( edit->numlines == 0 )
            send_to_char( "Buffer is empty.\r\n> ", ch );
          else
            {
              if ( argument[2] == ' ' )
                line = atoi( argument + 2 ) - 1;
              else
                line = edit->on_line;
              if ( line < 0 )
                line = edit->on_line;
              if ( line < 0 || line > edit->numlines )
                send_to_char( "Out of range.\r\n> ", ch );
              else
                {
		  int x = 0;

                  if ( line == 0 && edit->numlines == 1 )
                    {
                      memset( edit, '\0', sizeof(EDITOR_DATA) );
                      edit->numlines = 0;
                      edit->on_line   = 0;
                      send_to_char( "Line deleted.\r\n> ", ch );
                      return;
                    }

                  for ( x = line; x < (edit->numlines - 1); x++ )
                    strcpy( edit->line[x], edit->line[x+1] );

                  strcpy( edit->line[edit->numlines--], "" );

                  if ( edit->on_line > edit->numlines )
                    edit->on_line = edit->numlines;

                  send_to_char( "Line deleted.\r\n> ", ch );
                }
            }
          return;
        }
      if ( !str_cmp( cmd+1, "g" ) )
        {
          if ( edit->numlines == 0 )
            send_to_char( "Buffer is empty.\r\n> ", ch );
          else
            {
              if ( argument[2] == ' ' )
                line = atoi( argument + 2 ) - 1;
              else
                {
                  send_to_char( "Goto what line?\r\n> ", ch );
                  return;
                }
              if ( line < 0 )
                line = edit->on_line;
              if ( line < 0 || line > edit->numlines )
                send_to_char( "Out of range.\r\n> ", ch );
              else
                {
                  edit->on_line = line;
                  ch_printf( ch, "(On line %d)\r\n> ", line+1 );
                }
            }
          return;
        }
      if ( !str_cmp( cmd+1, "l" ) )
        {
          if ( edit->numlines == 0 )
            send_to_char( "Buffer is empty.\r\n> ", ch );
          else
            {
	      int x = 0;

              send_to_char( "------------------\r\n", ch );

              for ( x = 0; x < edit->numlines; x++ )
                ch_printf( ch, "%2d> %s\r\n", x+1, edit->line[x] );

              send_to_char( "------------------\r\n> ", ch );
            }
          return;
        }
      if ( !str_cmp( cmd+1, "a" ) )
        {
          send_to_char( "\r\nAborting... ", ch );
          stop_editing( ch );
          return;
        }
      if ( get_trust(ch) > LEVEL_IMMORTAL && !str_cmp( cmd+1, "!" ) )
        {
          DO_FUN *last_cmd;
          int substate = ch->substate;

          last_cmd = ch->last_cmd;
          ch->substate = SUB_RESTRICTED;
          interpret(ch, argument+3);
          ch->substate = substate;
          ch->last_cmd = last_cmd;
          set_char_color( AT_GREEN, ch );
          send_to_char( "\r\n> ", ch );
          return;
        }
      if ( !str_cmp( cmd+1, "s" ) )
        {
          d->connected = CON_PLAYING;
          if ( !ch->last_cmd )
            return;
          (*ch->last_cmd) ( ch, "" );
          return;
        }
    }

  if ( edit->size + strlen(argument) + 1 >= MAX_STRING_LENGTH - 1 )
    send_to_char( "You buffer is full.\r\n", ch );
  else
    {
      int b_end;
      int bm = 75;
      int bp = 0;
      int ep =0;

      strcpy( buf, argument );

      b_end = strlen(buf);

      while ( bp < b_end )
        {
          while ( buf[bm] != ' ' && bm > bp )
            bm--;

          if ( bm == bp )
            bm += 75;

          if ( bm > b_end )
            bm = b_end;

          ep=0;
          while ( bp < bm )
            {
              edit->line[edit->on_line][ep] = buf[bp];
              bp++;
              ep++;
            }

          bm = bp+75;
          bp ++;

          edit->line[edit->on_line][ep] = '\0';
          edit->on_line++;

          if ( edit->on_line > edit->numlines )
            edit->numlines++;
          if ( edit->numlines > max_buf_lines )
            {
              edit->numlines = max_buf_lines;
              send_to_char( "Buffer full.\r\n", ch );
              save = TRUE;
              break;
            }
        }
    }

  if ( save )
    {
      d->connected = CON_PLAYING;
      if ( !ch->last_cmd )
        return;
      (*ch->last_cmd) ( ch, "" );
      return;
    }
  send_to_char( "> ", ch );
}

void free_reset( AREA_DATA *are, RESET_DATA *res )
{
  UNLINK( res, are->first_reset, are->last_reset, next, prev );
  DISPOSE( res );
}

void free_area( AREA_DATA *are )
{
  DISPOSE( are->name );
  DISPOSE( are->filename );
  while ( are->first_reset )
    free_reset( are, are->first_reset );
  DISPOSE( are );
  are = NULL;
}

void assign_area( CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char taf[1024];
  AREA_DATA *tarea, *tmp;
  bool created = FALSE;

  if ( IS_NPC( ch ) )
    return;
  if ( get_trust( ch ) >= LEVEL_AVATAR
       &&   ch->pcdata->r_range_lo
       &&   ch->pcdata->r_range_hi )
    {
      tarea = ch->pcdata->area;
      sprintf( taf, "%s.are", capitalize( ch->name ) );
      if ( !tarea )
        {
          for ( tmp = first_build; tmp; tmp = tmp->next )
            if ( !str_cmp( taf, tmp->filename ) )
              {
                tarea = tmp;
                break;
              }
        }
      if ( !tarea )
        {
          sprintf( buf, "Creating area entry for %s", ch->name );
          log_string_plus( buf, LOG_NORMAL, ch->top_level );
          CREATE( tarea, AREA_DATA, 1 );
          LINK( tarea, first_build, last_build, next, prev );
          tarea->first_reset    = NULL;
          tarea->last_reset     = NULL;
          sprintf( buf, "{PROTO} %s's area in progress", ch->name );
          tarea->name           = str_dup( buf );
          tarea->filename       = str_dup( taf );
          sprintf( buf2, "%s", ch->name );
          tarea->author         = STRALLOC( buf2 );
          tarea->age            = 0;
          tarea->nplayer        = 0;
          SET_BIT( tarea->flags, AFLAG_NOQUEST );

          created = TRUE;
        }
      else
        {
          sprintf( buf, "Updating area entry for %s", ch->name );
          log_string_plus( buf, LOG_NORMAL, ch->top_level );
        }
      tarea->low_r_vnum = ch->pcdata->r_range_lo;
      tarea->low_o_vnum = ch->pcdata->o_range_lo;
      tarea->low_m_vnum = ch->pcdata->m_range_lo;
      tarea->hi_r_vnum  = ch->pcdata->r_range_hi;
      tarea->hi_o_vnum  = ch->pcdata->o_range_hi;
      tarea->hi_m_vnum  = ch->pcdata->m_range_hi;
      ch->pcdata->area  = tarea;
      if ( created )
        sort_area( tarea, TRUE );
    }
}

void do_aassign( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  AREA_DATA *tarea, *tmp;

  if ( IS_NPC( ch ) )
    return;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Syntax: aassign <filename.are>\r\n", ch );
      return;
    }

  if ( !str_cmp( "none", argument )
       ||   !str_cmp( "null", argument )
       ||   !str_cmp( "clear", argument ) )
    {
      ch->pcdata->area = NULL;
      assign_area( ch );
      if ( !ch->pcdata->area )
        send_to_char( "Area pointer cleared.\r\n", ch );
      else
        send_to_char( "Originally assigned area restored.\r\n", ch );
      return;
    }

  sprintf( buf, "%s", argument );
  tarea = NULL;

  /*    if ( get_trust(ch) >= sysdata.level_modify_proto )   */

  if ( get_trust(ch) >= LEVEL_GREATER
       ||  (is_name( buf, ch->pcdata->bestowments )
            &&   get_trust(ch) >= sysdata.level_modify_proto) )
    for ( tmp = first_area; tmp; tmp = tmp->next )
      if ( !str_cmp( buf, tmp->filename ) )
        {
          tarea = tmp;
          break;
        }

  if ( !tarea )
    for ( tmp = first_build; tmp; tmp = tmp->next )
      if ( !str_cmp( buf, tmp->filename ) )
        {
          /*            if ( get_trust(ch) >= sysdata.level_modify_proto  */
          if ( get_trust(ch) >= LEVEL_GREATER
               ||   is_name( tmp->filename, ch->pcdata->bestowments ) )
            {
              tarea = tmp;
              break;
            }
          else
            {
              send_to_char( "You do not have permission to use that area.\r\n", ch );
              return;
            }
        }

  if ( !tarea )
    {
      if ( get_trust(ch) >= sysdata.level_modify_proto )
        send_to_char( "No such area.  Use 'zones'.\r\n", ch );
      else
        send_to_char( "No such area.  Use 'newzones'.\r\n", ch );
      return;
    }
  ch->pcdata->area = tarea;
  ch_printf( ch, "Assigning you: %s\r\n", tarea->name );
  return;
}


EXTRA_DESCR_DATA *SetRExtra( ROOM_INDEX_DATA *room, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = room->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, room->first_extradesc, room->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelRExtra( ROOM_INDEX_DATA *room, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = room->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, room->first_extradesc, room->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

EXTRA_DESCR_DATA *SetOExtra( OBJ_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtra( OBJ_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

EXTRA_DESCR_DATA *SetOExtraProto( OBJ_INDEX_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtraProto( OBJ_INDEX_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

void fold_area( AREA_DATA *tarea, char *filename, bool install )
{
  RESET_DATA            *treset;
  ROOM_INDEX_DATA       *room;
  MOB_INDEX_DATA        *pMobIndex;
  OBJ_INDEX_DATA        *pObjIndex;
  MPROG_DATA            *mprog;
  EXIT_DATA             *xit;
  EXTRA_DESCR_DATA      *ed;
  AFFECT_DATA           *paf;
  SHOP_DATA             *pShop;
  REPAIR_DATA           *pRepair;
  char           buf[MAX_STRING_LENGTH];
  FILE          *fpout;
  int                    vnum;
  int                    val0, val1, val2, val3, val4, val5;
  bool           complexmob;

  sprintf( buf, "Saving %s...", tarea->filename );
  log_string_plus( buf, LOG_NORMAL, LEVEL_GREATER );

  sprintf( buf, "%s.bak", filename );
  rename( filename, buf );

  if ( ( fpout = fopen( filename, "w" ) ) == NULL )
    {
      bug( "fold_area: fopen", 0 );
      perror( filename );
      return;
    }

  fprintf( fpout, "#AREA   %s~\n\n\n\n", tarea->name );

  fprintf( fpout, "#AUTHOR %s~\n\n", tarea->author );
  fprintf( fpout, "#RANGES\n");
  fprintf( fpout, "%d %d %d %d\n", tarea->low_soft_range,
           tarea->hi_soft_range,
           tarea->low_hard_range,
           tarea->hi_hard_range );
  fprintf( fpout, "$\n\n");
  if ( tarea->resetmsg )        /* Rennard */
    fprintf( fpout, "#RESETMSG %s~\n\n", tarea->resetmsg );
  if ( tarea->reset_frequency )
    fprintf( fpout, "#FLAGS\n%d %d\n\n",
             tarea->flags, tarea->reset_frequency );
  else
    fprintf( fpout, "#FLAGS\n%d\n\n", tarea->flags );

  fprintf( fpout, "#ECONOMY %d %d\n\n", tarea->high_economy, tarea->low_economy );

  /* save mobiles */
  fprintf( fpout, "#MOBILES\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( install )
        REMOVE_BIT( pMobIndex->act, ACT_PROTOTYPE );
      if ( pMobIndex->perm_str != 13    ||   pMobIndex->perm_int   != 13
           ||   pMobIndex->perm_wis != 13       ||   pMobIndex->perm_dex   != 13
           ||   pMobIndex->perm_con != 13       ||   pMobIndex->perm_cha   != 13
           ||   pMobIndex->perm_lck != 13
           ||   pMobIndex->hitroll  != 0        ||   pMobIndex->damroll    != 0
           ||   pMobIndex->race  != 0
           ||   pMobIndex->attacks       != 0   ||   pMobIndex->defenses   != 0
           ||   pMobIndex->height        != 0   ||   pMobIndex->weight     != 0
           ||   pMobIndex->speaks        != 0   ||   pMobIndex->speaking   != 0
           ||   pMobIndex->xflags        != 0   ||   pMobIndex->numattacks != 0
           ||   pMobIndex->vip_flags !=0 )
        complexmob = TRUE;
      else
        complexmob = FALSE;
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pMobIndex->player_name          );
      fprintf( fpout,   "%s~\n",        pMobIndex->short_descr          );
      fprintf( fpout,   "%s~\n",        strip_cr(pMobIndex->long_descr) );
      fprintf( fpout, "%s~\n",  strip_cr(pMobIndex->description));
      fprintf( fpout, "%d %d %d %c\n",pMobIndex->act,
               pMobIndex->affected_by,
               pMobIndex->alignment,
               complexmob ? 'Z' : 'S'           );
      /* C changed to Z for swreality vip_flags  */

      fprintf( fpout, "%d %d %d ",      pMobIndex->level,
               pMobIndex->mobthac0,
               pMobIndex->ac                    );
      fprintf( fpout, "%dd%d+%d ",      pMobIndex->hitnodice,
               pMobIndex->hitsizedice,
               pMobIndex->hitplus               );
      fprintf( fpout, "%dd%d+%d\n",     pMobIndex->damnodice,
               pMobIndex->damsizedice,
               pMobIndex->damplus               );
      fprintf( fpout, "%d 0\n", pMobIndex->gold                 );
      fprintf( fpout, "%d %d %d\n",     pMobIndex->position,
               pMobIndex->defposition,
               pMobIndex->sex                   );
      if ( complexmob )
        {
          fprintf( fpout, "%d %d %d %d %d %d %d\n",
                   pMobIndex->perm_str,
                   pMobIndex->perm_int,
                   pMobIndex->perm_wis,
                   pMobIndex->perm_dex,
                   pMobIndex->perm_con,
                   pMobIndex->perm_cha,
                   pMobIndex->perm_lck );
          fprintf( fpout, "%d %d %d %d %d\n",
                   pMobIndex->saving_poison_death,
                   pMobIndex->saving_wand,
                   pMobIndex->saving_para_petri,
                   pMobIndex->saving_breath,
                   pMobIndex->saving_spell_staff );
          fprintf( fpout, "%d 0 %d %d %d %d %d\n",
                   pMobIndex->race,
                   pMobIndex->height,
                   pMobIndex->weight,
                   pMobIndex->speaks,
                   pMobIndex->speaking,
                   pMobIndex->numattacks );
          fprintf( fpout, "%d %d %d %d %d %d %d %d\n",
                   pMobIndex->hitroll,
                   pMobIndex->damroll,
                   pMobIndex->xflags,
                   pMobIndex->resistant,
                   pMobIndex->immune,
                   pMobIndex->susceptible,
                   pMobIndex->attacks,
                   pMobIndex->defenses );
          fprintf( fpout, "%d 0 0 0 0 0 0 0\n",
                   pMobIndex->vip_flags );
        }
      if ( pMobIndex->mudprogs )
        {
          for ( mprog = pMobIndex->mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_m_vnum )
    tarea->hi_m_vnum = vnum - 1;

  /* save objects */
  fprintf( fpout, "#OBJECTS\n" );
  for ( vnum = tarea->low_o_vnum; vnum <= tarea->hi_o_vnum; vnum++ )
    {
      if ( (pObjIndex = get_obj_index( vnum )) == NULL )
        continue;
      if ( install )
        REMOVE_BIT( pObjIndex->extra_flags, ITEM_PROTOTYPE );
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pObjIndex->name                 );
      fprintf( fpout, "%s~\n",  pObjIndex->short_descr          );
      fprintf( fpout, "%s~\n",  pObjIndex->description          );
      fprintf( fpout, "%s~\n",  pObjIndex->action_desc          );
      if ( pObjIndex->layers )
        fprintf( fpout, "%d %d %d %d\n",        pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags,
                 pObjIndex->layers      );
      else
        fprintf( fpout, "%d %d %d\n",   pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags          );

      val0 = pObjIndex->value[0];
      val1 = pObjIndex->value[1];
      val2 = pObjIndex->value[2];
      val3 = pObjIndex->value[3];
      val4 = pObjIndex->value[4];
      val5 = pObjIndex->value[5];
      switch ( pObjIndex->item_type )
        {
        case ITEM_PILL:
        case ITEM_POTION:
        case ITEM_SCROLL:
          if ( IS_VALID_SN(val1) ) val1 = skill_table[val1]->slot;
          if ( IS_VALID_SN(val2) ) val2 = skill_table[val2]->slot;
          if ( IS_VALID_SN(val3) ) val3 = skill_table[val3]->slot;
          break;
        case ITEM_DEVICE:
          if ( IS_VALID_SN(val3) ) val3 = skill_table[val3]->slot;
          break;
        case ITEM_SALVE:
          if ( IS_VALID_SN(val4) ) val4 = skill_table[val4]->slot;
          if ( IS_VALID_SN(val5) ) val5 = skill_table[val5]->slot;
          break;
        }
      if ( val4 || val5 )
        fprintf( fpout, "%d %d %d %d %d %d\n",val0,
                 val1,
                 val2,
                 val3,
                 val4,
                 val5 );
      else
        fprintf( fpout, "%d %d %d %d\n",        val0,
                 val1,
                 val2,
                 val3 );

      fprintf( fpout, "%d %d %d\n",     pObjIndex->weight,
               pObjIndex->cost,
               pObjIndex->rent ? pObjIndex->rent :
               (int) (pObjIndex->cost / 10)             );

      for ( ed = pObjIndex->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, strip_cr( ed->description )       );

      for ( paf = pObjIndex->first_affect; paf; paf = paf->next )
        fprintf( fpout, "A\n%d %d\n", paf->location,
                 ((paf->location == APPLY_WEAPONSPELL
                   || paf->location == APPLY_WEARSPELL
                   || paf->location == APPLY_REMOVESPELL
                   || paf->location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->modifier))
                 ? skill_table[paf->modifier]->slot : paf->modifier             );

      if ( pObjIndex->mudprogs )
        {
          for ( mprog = pObjIndex->mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_o_vnum )
    tarea->hi_o_vnum = vnum - 1;

  /* save rooms   */
  fprintf( fpout, "#ROOMS\n" );
  for ( vnum = tarea->low_r_vnum; vnum <= tarea->hi_r_vnum; vnum++ )
    {
      if ( (room = get_room_index( vnum )) == NULL )
        continue;
      if ( install )
        {
          CHAR_DATA *victim, *vnext;
          OBJ_DATA  *obj, *obj_next;

          /* remove prototype flag from room */
          REMOVE_BIT( room->room_flags, ROOM_PROTOTYPE );
          /* purge room of (prototyped) mobiles */
          for ( victim = room->first_person; victim; victim = vnext )
            {
              vnext = victim->next_in_room;
              if ( IS_NPC(victim) )
                extract_char( victim, TRUE );
            }
          /* purge room of (prototyped) objects */
          for ( obj = room->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              extract_obj( obj );
            }
        }
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  room->name                      );
      fprintf( fpout, "%s~\n",  strip_cr( room->description )   );
      if ( (room->tele_delay > 0 && room->tele_vnum > 0) || room->tunnel > 0 )
        fprintf( fpout, "0 %d %d %d %d %d\n",   room->room_flags,
                 room->sector_type,
                 room->tele_delay,
                 room->tele_vnum,
                 room->tunnel           );
      else
        fprintf( fpout, "0 %d %d\n",    room->room_flags,
                 room->sector_type      );
      for ( xit = room->first_exit; xit; xit = xit->next )
        {
          if ( IS_SET(xit->exit_info, EX_PORTAL) ) /* don't fold portals */
            continue;
          fprintf( fpout, "D%d\n",              xit->vdir );
          fprintf( fpout, "%s~\n",              strip_cr( xit->description ) );
          fprintf( fpout, "%s~\n",              strip_cr( xit->keyword ) );
          if ( xit->distance > 1 )
            fprintf( fpout, "%d %d %d %d\n",    xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum,
                     xit->distance );
          else
            fprintf( fpout, "%d %d %d\n",       xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum );
        }
      for ( ed = room->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, strip_cr( ed->description ));

      if ( room->map )   /* maps */
        {
#ifdef OLDMAPS
          fprintf( fpout, "M\n" );
          fprintf( fpout, "%s~\n", strip_cr( room->map )        );
#endif
          fprintf( fpout, "M %d %d %d %c\n",    room->map->vnum
                   , room->map->x
                   , room->map->y
                   , room->map->entry );
        }
      if ( room->mudprogs )
        {
          for ( mprog = room->mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
      fprintf( fpout, "S\n" );
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_r_vnum )
    tarea->hi_r_vnum = vnum - 1;

  /* save resets   */
  fprintf( fpout, "#RESETS\n" );
  for ( treset = tarea->first_reset; treset; treset = treset->next )
    {
      switch( treset->command ) /* extra arg1 arg2 arg3 */
        {
        default:  case '*': break;
        case 'm': case 'M':
        case 'o': case 'O':
        case 'p': case 'P':
        case 'e': case 'E':
        case 'd': case 'D':
        case 't': case 'T':
          fprintf( fpout, "%c %d %d %d %d\n", UPPER(treset->command),
                   treset->extra, treset->arg1, treset->arg2, treset->arg3 );
          break;
        case 'g': case 'G':
        case 'r': case 'R':
          fprintf( fpout, "%c %d %d %d\n", UPPER(treset->command),
                   treset->extra, treset->arg1, treset->arg2 );
          break;
        }
    }
  fprintf( fpout, "S\n\n\n" );

  /* save shops */
  fprintf( fpout, "#SHOPS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( (pShop = pMobIndex->pShop) == NULL )
        continue;
      fprintf( fpout, " %d   %2d %2d %2d %2d %2d   %3d %3d",
               pShop->keeper,
               pShop->buy_type[0],
               pShop->buy_type[1],
               pShop->buy_type[2],
               pShop->buy_type[3],
               pShop->buy_type[4],
               pShop->profit_buy,
               pShop->profit_sell );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pShop->open_hour,
               pShop->close_hour,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save repair shops */
  fprintf( fpout, "#REPAIRS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( (pRepair = pMobIndex->rShop) == NULL )
        continue;
      fprintf( fpout, " %d   %2d %2d %2d         %3d %3d",
               pRepair->keeper,
               pRepair->fix_type[0],
               pRepair->fix_type[1],
               pRepair->fix_type[2],
               pRepair->profit_fix,
               pRepair->shop_type );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pRepair->open_hour,
               pRepair->close_hour,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save specials */
  fprintf( fpout, "#SPECIALS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( pMobIndex->spec_fun )
        fprintf( fpout, "M  %d %s\n",   pMobIndex->vnum,
                 lookup_spec( pMobIndex->spec_fun ) );
      if ( pMobIndex->spec_2 )
        fprintf( fpout, "M  %d %s\n",   pMobIndex->vnum,
                 lookup_spec( pMobIndex->spec_2 ) );
    }
  fprintf( fpout, "S\n\n\n" );

  /* END */
  fprintf( fpout, "#$\n" );
  fclose( fpout );
}

void do_savearea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char   filename[256];

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       ||  ( argument[0] == '\0' && !ch->pcdata->area) )
    {
      send_to_char( "You don't have an assigned area to save.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    tarea = ch->pcdata->area;
  else
    {
      bool found;

      if ( get_trust( ch ) < LEVEL_GOD )
        {
          send_to_char( "You can only save your own area.\r\n", ch );
          return;
        }
      for ( found = FALSE, tarea = first_build; tarea; tarea = tarea->next )
        if ( !str_cmp( tarea->filename, argument ) )
          {
            found = TRUE;
            break;
          }
      if ( !found )
        {
          send_to_char( "Area not found.\r\n", ch );
          return;
        }
    }

  if ( !tarea )
    {
      send_to_char( "No area to save.\r\n", ch );
      return;
    }

  /* Ensure not wiping out their area with save before load - Scryn 8/11 */
  if ( !IS_SET(tarea->status, AREA_LOADED ) )
    {
      send_to_char( "Your area is not loaded!\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", BUILD_DIR, tarea->filename );
  fold_area( tarea, filename, FALSE );
  send_to_char( "Done.\r\n", ch );
}

void do_loadarea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char   filename[256];
  int           tmp;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       ||  ( argument[0] == '\0' && !ch->pcdata->area) )
    {
      send_to_char( "You don't have an assigned area to load.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    tarea = ch->pcdata->area;
  else
    {
      bool found;

      for ( found = FALSE, tarea = first_build; tarea; tarea = tarea->next )
        if ( !str_cmp( tarea->filename, argument ) )
          {
            found = TRUE;
            break;
          }
      if ( IS_NPC(ch) || ( get_trust(ch) < LEVEL_GOD
                           &&   tarea && !is_name( tarea->filename, ch->pcdata->bestowments ) ) )
        {
          send_to_char( "You can only load areas you have permission for.\r\n", ch );
          return;
        }
      if ( !found )
        {
          send_to_char( "Area not found.\r\n", ch );
          return;
        }
    }

  if ( !tarea )
    {
      send_to_char( "No area to load.\r\n", ch );
      return;
    }

  /* Stops char from loading when already loaded - Scryn 8/11 */
  if ( IS_SET ( tarea->status, AREA_LOADED) )
    {
      send_to_char( "Your area is already loaded.\r\n", ch );
      return;
    }
  sprintf( filename, "%s%s", BUILD_DIR, tarea->filename );
  send_to_char( "Loading...\r\n", ch );
  load_area_file( tarea, filename );
  send_to_char( "Linking exits...\r\n", ch );
  fix_area_exits( tarea );
  if ( tarea->first_reset )
    {
      tmp = tarea->nplayer;
      tarea->nplayer = 0;
      send_to_char( "Resetting area...\r\n", ch );
      reset_area( tarea );
      tarea->nplayer = tmp;
    }
  send_to_char( "Done.\r\n", ch );
}

/*
 * Dangerous command.  Can be used to install an area that was either:
 *   (a) already installed but removed from area.lst
 *   (b) designed offline
 * The mud will likely crash if:
 *   (a) this area is already loaded
 *   (b) it contains vnums that exist
 *   (c) the area has errors
 *
 * NOTE: Use of this command is not recommended.                -Thoric
 */
void do_unfoldarea( CHAR_DATA *ch, char *argument )
{

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Unfold what?\r\n", ch );
      return;
    }

  fBootDb = TRUE;
  load_area_file( last_area, argument );
  fBootDb = FALSE;
  return;
}


void do_foldarea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char         arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: foldarea <filename> [remproto]\r\n", ch );
      return;
    }

  for ( tarea = first_area; tarea; tarea = tarea->next )
    {
      if ( !str_cmp( tarea->filename, arg ) )
        {
          send_to_char( "Folding...\r\n", ch );
          if (!strcmp( argument, "remproto") )
            fold_area( tarea, tarea->filename, TRUE );
          else
            fold_area( tarea, tarea->filename, FALSE );
          send_to_char( "Done.\r\n", ch );
          return;
        }
    }
  send_to_char( "No such area exists.\r\n", ch );
  return;
}

extern int top_area;

void write_area_list( )
{
  AREA_DATA *tarea;
  FILE *fpout;

  fpout = fopen( AREA_LIST, "w" );
  if ( !fpout )
    {
      bug( "FATAL: cannot open area.lst for writing!\r\n", 0 );
      return;
    }
  fprintf( fpout, "help.are\n" );
  for ( tarea = first_area; tarea; tarea = tarea->next )
    fprintf( fpout, "%s\n", tarea->filename );
  fprintf( fpout, "$\n" );
  fclose( fpout );
}

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->author and area->name are cleaned up... it will be easier
 */
void do_installarea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char  arg[MAX_INPUT_LENGTH];
  char  buf[MAX_STRING_LENGTH];
  int           num;
  DESCRIPTOR_DATA *d;

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: installarea <filename> [Area title]\r\n", ch );
      return;
    }

  for ( tarea = first_build; tarea; tarea = tarea->next )
    {
      if ( !str_cmp( tarea->filename, arg ) )
        {
          if ( argument && argument[0] != '\0' )
            {
              DISPOSE( tarea->name );
              tarea->name = str_dup( argument );
            }

          /* Fold area with install flag -- auto-removes prototype flags */
          send_to_char( "Saving and installing file...\r\n", ch );
          fold_area( tarea, tarea->filename, TRUE );

          /* Remove from prototype area list */
          UNLINK( tarea, first_build, last_build, next, prev );

          /* Add to real area list */
          LINK( tarea, first_area, last_area, next, prev );

          /* Fix up author if online */
          for ( d = first_descriptor; d; d = d->next )
            if ( d->character
                 &&   d->character->pcdata
                 &&   d->character->pcdata->area == tarea )
              {
                /* remove area from author */
                d->character->pcdata->area = NULL;
                /* clear out author vnums  */
                d->character->pcdata->r_range_lo = 0;
                d->character->pcdata->r_range_hi = 0;
                d->character->pcdata->o_range_lo = 0;
                d->character->pcdata->o_range_hi = 0;
                d->character->pcdata->m_range_lo = 0;
                d->character->pcdata->m_range_hi = 0;
              }

          top_area++;
          send_to_char( "Writing area.lst...\r\n", ch );
          write_area_list( );
          send_to_char( "Resetting new area.\r\n", ch );
          num = tarea->nplayer;
          tarea->nplayer = 0;
          reset_area( tarea );
          tarea->nplayer = num;
          send_to_char( "Renaming author's building file.\r\n", ch );
          sprintf( buf, "%s%s.installed", BUILD_DIR, tarea->filename );
          sprintf( arg, "%s%s", BUILD_DIR, tarea->filename );
          rename( arg, buf );
          send_to_char( "Done.\r\n", ch );
          return;
        }
    }
  send_to_char( "No such area exists.\r\n", ch );
  return;
}

void add_reset_nested( AREA_DATA *tarea, OBJ_DATA *obj )
{
  int limit;

  for ( obj = obj->first_content; obj; obj = obj->next_content )
    {
      limit = obj->pIndexData->count;
      if ( limit < 1 )
        limit = 1;
      add_reset( tarea, 'P', 1, obj->pIndexData->vnum, limit,
                 obj->in_obj->pIndexData->vnum );
      if ( obj->first_content )
        add_reset_nested( tarea, obj );
    }
}


/*
 * Parse a reset command string into a reset_data structure
 */
RESET_DATA *parse_reset( AREA_DATA *tarea, char *argument, CHAR_DATA *ch )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];
  char letter;
  int extra, val1, val2, val3;
  int value;
  ROOM_INDEX_DATA *room;
  EXIT_DATA     *pexit;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  argument = one_argument( argument, arg4 );
  extra = 0; letter = '*';
  val1 = atoi( arg2 );
  val2 = atoi( arg3 );
  val3 = atoi( arg4 );
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Reset commands: mob obj give equip door rand trap hide.\r\n", ch );
      return NULL;
    }

  if ( !str_cmp( arg1, "hide" ) )
    {
      if ( arg2[0] != '\0' && !get_obj_index(val1) )
        {
          send_to_char( "Reset: HIDE: no such object\r\n", ch );
          return NULL;
        }
      else
        val1 = 0;
      extra = 1;
      val2 = 0;
      val3 = 0;
      letter = 'H';
    }
  else
    if ( arg2[0] == '\0' )
      {
        send_to_char( "Reset: not enough arguments.\r\n", ch );
        return NULL;
      }
    else
      if ( val1 < 1 || val1 > 32767 )
        {
          send_to_char( "Reset: value out of range.\r\n", ch );
          return NULL;
        }
      else
        if ( !str_cmp( arg1, "mob" ) )
          {
            if ( !get_mob_index(val1) )
              {
                send_to_char( "Reset: MOB: no such mobile\r\n", ch );
                return NULL;
              }
            if ( !get_room_index(val2) )
              {
                send_to_char( "Reset: MOB: no such room\r\n", ch );
                return NULL;
              }
            if ( val3 < 1 )
              val3 = 1;
            letter = 'M';
          }
        else
          if ( !str_cmp( arg1, "obj" ) )
            {
              if ( !get_obj_index(val1) )
                {
                  send_to_char( "Reset: OBJ: no such object\r\n", ch );
                  return NULL;
                }
              if ( !get_room_index(val2) )
                {
                  send_to_char( "Reset: OBJ: no such room\r\n", ch );
                  return NULL;
                }
              if ( val3 < 1 )
                val3 = 1;
              letter = 'O';
            }
          else
            if ( !str_cmp( arg1, "give" ) )
              {
                if ( !get_obj_index(val1) )
                  {
                    send_to_char( "Reset: GIVE: no such object\r\n", ch );
                    return NULL;
                  }
                if ( val2 < 1 )
                  val2 = 1;
                val3 = val2;
                val2 = 0;
                extra = 1;
                letter = 'G';
              }
            else
              if ( !str_cmp( arg1, "equip" ) )
                {
                  if ( !get_obj_index(val1) )
                    {
                      send_to_char( "Reset: EQUIP: no such object\r\n", ch );
                      return NULL;
                    }
                  if ( !is_number(arg3) )
                    val2 = get_wearloc(arg3);
                  if ( val2 < 0 || val2 >= MAX_WEAR )
                    {
                      send_to_char( "Reset: EQUIP: invalid wear location\r\n", ch );
                      return NULL;
                    }
                  if ( val3 < 1 )
                    val3 = 1;
                  extra  = 1;
                  letter = 'E';
                }
              else
                if ( !str_cmp( arg1, "put" ) )
                  {
                    if ( !get_obj_index(val1) )
                      {
                        send_to_char( "Reset: PUT: no such object\r\n", ch );
                        return NULL;
                      }
                    if ( val2 > 0 && !get_obj_index(val2) )
                      {
                        send_to_char( "Reset: PUT: no such container\r\n", ch );
                        return NULL;
                      }
                    extra = UMAX(val3, 0);
                    argument = one_argument(argument, arg4);
                    val3 = (is_number(argument) ? atoi(arg4) : 0);
                    if ( val3 < 0 )
                      val3 = 0;
                    letter = 'P';
                  }
                else
                  if ( !str_cmp( arg1, "door" ) )
                    {
                      if ( (room = get_room_index(val1)) == NULL )
                        {
                          send_to_char( "Reset: DOOR: no such room\r\n", ch );
                          return NULL;
                        }
                      if ( val2 < 0 || val2 > 9 )
                        {
                          send_to_char( "Reset: DOOR: invalid exit\r\n", ch );
                          return NULL;
                        }
                      if ( (pexit = get_exit(room, val2)) == NULL
                           ||   !IS_SET( pexit->exit_info, EX_ISDOOR ) )
                        {
                          send_to_char( "Reset: DOOR: no such door\r\n", ch );
                          return NULL;
                        }
                      if ( val3 < 0 || val3 > 2 )
                        {
                          send_to_char( "Reset: DOOR: invalid door state (0 = open, 1 = close, 2 = lock)\r\n", ch );
                          return NULL;
                        }
                      letter = 'D';
                      value = val3;
                      val3  = val2;
                      val2  = value;
                    }
                  else
                    if ( !str_cmp( arg1, "rand" ) )
                      {
                        if ( !get_room_index(val1) )
                          {
                            send_to_char( "Reset: RAND: no such room\r\n", ch );
                            return NULL;
                          }
                        if ( val2 < 0 || val2 > 9 )
                          {
                            send_to_char( "Reset: RAND: invalid max exit\r\n", ch );
                            return NULL;
                          }
                        val3 = val2;
                        val2 = 0;
                        letter = 'R';
                      }
                    else
                      if ( !str_cmp( arg1, "trap" ) )
                        {
                          if ( val2 < 1 || val2 > MAX_TRAPTYPE )
                            {
                              send_to_char( "Reset: TRAP: invalid trap type\r\n", ch );
                              return NULL;
                            }
                          if ( val3 < 0 || val3 > 10000 )
                            {
                              send_to_char( "Reset: TRAP: invalid trap charges\r\n", ch );
                              return NULL;
                            }
                          while ( argument[0] != '\0' )
                            {
                              argument = one_argument( argument, arg4 );
                              value = get_trapflag( arg4 );
                              if ( value >= 0 || value < 32 )
                                SET_BIT( extra, 1 << value );
                              else
                                {
                                  send_to_char( "Reset: TRAP: bad flag\r\n", ch );
                                  return NULL;
                                }
                            }
                          if ( IS_SET(extra, TRAP_ROOM) && IS_SET(extra, TRAP_OBJ) )
                            {
                              send_to_char( "Reset: TRAP: Must specify room OR object, not both!\r\n", ch );
                              return NULL;
                            }
                          if ( IS_SET(extra, TRAP_ROOM) && !get_room_index(val1) )
                            {
                              send_to_char( "Reset: TRAP: no such room\r\n", ch );
                              return NULL;
                            }
                          if ( IS_SET(extra, TRAP_OBJ)  && val1>0 && !get_obj_index(val1) )
                            {
                              send_to_char( "Reset: TRAP: no such object\r\n", ch );
                              return NULL;
                            }
                          if (!IS_SET(extra, TRAP_ROOM) && !IS_SET(extra, TRAP_OBJ) )
                            {
                              send_to_char( "Reset: TRAP: Must specify ROOM or OBJECT\r\n", ch );
                              return NULL;
                            }
                          /* fix order */
                          value = val1;
                          val1  = val2;
                          val2  = value;
                          letter = 'T';
                        }
  if ( letter == '*' )
    return NULL;
  else
    return make_reset( letter, extra, val1, val3, val2 );
}

void do_astat( CHAR_DATA *ch, char *argument )
{
  AREA_DATA *tarea;
  bool proto, found;


  found = FALSE; proto = FALSE;
  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !str_cmp( tarea->filename, argument ) )
      {
        found = TRUE;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !str_cmp( tarea->filename, argument ) )
        {
          found = TRUE;
          proto = TRUE;
          break;
        }

  if ( !found )
    {
      if ( argument && argument[0] != '\0' )
        {
          send_to_char( "Area not found.  Check 'zones'.\r\n", ch );
          return;
        }
      else
        {
          tarea = ch->in_room->area;
        }
    }

  ch_printf( ch, "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
             tarea->name,
             tarea->filename,
             proto ? "yes" : "no" );
  if ( !proto )
    {
      ch_printf( ch, "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                 tarea->max_players,
                 tarea->illegal_pk,
                 tarea->gold_looted );
      if ( tarea->high_economy )
        ch_printf( ch, "Area economy: %d billion and %d credits.\r\n",
                   tarea->high_economy,
                   tarea->low_economy );
      else
        ch_printf( ch, "Area economy: %d credits.\r\n",
                   tarea->low_economy );
      if ( tarea->planet )
        ch_printf( ch, "Planet: %s.\r\n",
                   tarea->planet->name );
      ch_printf( ch, "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                 tarea->mdeaths,
                 tarea->mkills,
                 tarea->pdeaths,
                 tarea->pkills );
    }
  ch_printf( ch, "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->author,
             tarea->age,
             tarea->nplayer );
  ch_printf( ch, "Area flags: %s\r\n", flag_string(tarea->flags, area_flags) );
  ch_printf( ch, "low_room: %5d  hi_room: %d\r\n",
             tarea->low_r_vnum,
             tarea->hi_r_vnum );
  ch_printf( ch, "low_obj : %5d  hi_obj : %d\r\n",
             tarea->low_o_vnum,
             tarea->hi_o_vnum );
  ch_printf( ch, "low_mob : %5d  hi_mob : %d\r\n",
             tarea->low_m_vnum,
             tarea->hi_m_vnum );
  ch_printf( ch, "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->low_soft_range,
             tarea->hi_soft_range,
             tarea->low_hard_range,
             tarea->hi_hard_range );
  ch_printf( ch, "Resetmsg: %s\r\n", tarea->resetmsg ? tarea->resetmsg
             : "(default)" ); /* Rennard */
  ch_printf( ch, "Reset frequency: %d minutes.\r\n",
             tarea->reset_frequency ? tarea->reset_frequency : 15 );
}


void do_aset( CHAR_DATA *ch, char *argument )
{
  AREA_DATA *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  bool found;
  int vnum, value;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  vnum = atoi( argument );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Usage: aset <area filename> <field> <value>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  low_room hi_room low_obj hi_obj low_mob hi_mob\r\n", ch );
      send_to_char( "  name filename low_soft hi_soft low_hard hi_hard\r\n", ch );
      send_to_char( "  author resetmsg resetfreq flags planet\r\n", ch );
      return;
    }

  found = FALSE;

  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !str_cmp( tarea->filename, arg1 ) )
      {
        found = TRUE;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !str_cmp( tarea->filename, arg1 ) )
        {
          found = TRUE;
          break;
        }

  if ( !found )
    {
      send_to_char( "Area not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      DISPOSE( tarea->name );
      tarea->name = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "planet" ) )
    {
      PLANET_DATA *planet;
      planet = get_planet(argument);
      if (planet)
        {
          if (tarea->planet)
            {
              PLANET_DATA *old_planet;

              old_planet=tarea->planet;
              UNLINK(tarea, old_planet->first_area, old_planet->last_area, next_on_planet, prev_on_planet);
            }
          tarea->planet=planet;
          LINK(tarea, planet->first_area, planet->last_area, next_on_planet, prev_on_planet);
          save_planet(planet);
        }
      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( tarea->filename );
      tarea->filename = str_dup( argument );
      write_area_list( );
      fold_area( tarea, tarea->filename, TRUE );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_economy" ) )
    {
      tarea->low_economy = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "high_economy" ) )
    {
      tarea->high_economy = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_room" ) )
    {
      tarea->low_r_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_room" ) )
    {
      tarea->hi_r_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_obj" ) )
    {
      tarea->low_o_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_obj" ) )
    {
      tarea->hi_o_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_mob" ) )
    {
      tarea->low_m_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_mob" ) )
    {
      tarea->hi_m_vnum = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_soft" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->low_soft_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_soft" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->hi_soft_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "low_hard" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->low_hard_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "hi_hard" ) )
    {
      if ( vnum < 0 || vnum > MAX_LEVEL )
        {
          send_to_char( "That is not an acceptable value.\r\n", ch);
          return;
        }

      tarea->hi_hard_range = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "author" ) )
    {
      STRFREE( tarea->author );
      tarea->author = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "resetmsg" ) )
    {
      if ( tarea->resetmsg )
        DISPOSE( tarea->resetmsg );
      if ( str_cmp( argument, "clear" ) )
        tarea->resetmsg = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    } /* Rennard */

  if ( !str_cmp( arg2, "resetfreq" ) )
    {
      tarea->reset_frequency = vnum;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: aset <filename> flags <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_areaflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              if ( IS_SET( tarea->flags, 1 << value ) )
                REMOVE_BIT( tarea->flags, 1 << value );
              else
                SET_BIT( tarea->flags, 1 << value );
            }
        }
      return;
    }

  do_aset( ch, "" );
  return;
}


void do_rlist( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA       *room;
  int                    vnum;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  AREA_DATA             *tarea;
  int lrange;
  int trange;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       || ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }

  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_r_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_r_vnum;
      else
        trange = atoi(arg2);

      if ( ( lrange < tarea->low_r_vnum || trange > tarea->hi_r_vnum )
           && get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 1 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (room = get_room_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "%5d) %s\r\n", vnum, room->name );
    }
  return;
}

void do_olist( CHAR_DATA *ch, char *argument )
{
  OBJ_INDEX_DATA        *obj;
  int                    vnum;
  AREA_DATA             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  /*
   * Greater+ can list out of assigned range - Tri (mlist/rlist as well)
   */
  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_CREATOR || !ch->pcdata
       || ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }
  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_o_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_o_vnum;
      else
        trange = atoi(arg2);

      if ((lrange < tarea->low_o_vnum || trange > tarea->hi_o_vnum)
          &&   get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 3 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (obj = get_obj_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "%5d) %-20s (%s)\r\n", vnum,
                    obj->name,
                    obj->short_descr );
    }
  return;
}

void do_mlist( CHAR_DATA *ch, char *argument )
{
  MOB_INDEX_DATA        *mob;
  int                    vnum;
  AREA_DATA             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_CREATOR || !ch->pcdata
       ||  ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }

  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_m_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_m_vnum;
      else
        trange = atoi( arg2 );

      if ( ( lrange < tarea->low_m_vnum || trange > tarea->hi_m_vnum )
           && get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 1 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (mob = get_mob_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "%5d) %-20s '%s'\r\n", vnum,
                    mob->player_name,
                    mob->short_descr );
    }
}

void mpedit( CHAR_DATA *ch, MPROG_DATA *mprg, int mptype, char *argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;
      if ( mprg->arglist )
        STRFREE( mprg->arglist );
      mprg->arglist = STRALLOC( argument );
    }
  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;
  if ( !mprg->comlist )
    mprg->comlist = STRALLOC( "" );
  start_editing( ch, mprg->comlist );
  return;
}

/*
 * Mobprogram editing - cumbersome                              -Thoric
 */
void do_mpedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  CHAR_DATA  *victim;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't mpedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_mpedit: sub_mprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      mprog      = ch->dest_buf;
      if ( mprog->comlist )
        STRFREE( mprog->comlist );
      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  value = atoi( arg3 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: mpedit <victim> <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand fight hitprcnt greet allgreet\r\n", ch );
      send_to_char( "  entry give bribe death time hour script\r\n",    ch );
      return;
    }

  if ( get_trust( ch ) < LEVEL_GOD )
    {
      if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
        {
          send_to_char( "No one like that in all the realms.\r\n", ch );
          return;
        }
    }

  if ( get_trust( ch ) < get_trust( victim ) || !IS_NPC(victim) )
    {
      send_to_char( "You can't do that!\r\n", ch );
      return;
    }

  if ( !can_mmodify( ch, victim ) )
    return;

  if ( !IS_SET( victim->act, ACT_PROTOTYPE ) )
    {
      send_to_char( "A mobile must have a prototype flag to be mpset.\r\n", ch );
      return;
    }

  mprog = victim->pIndexData->mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( arg4[0] != '\0' )
        {
          mptype = get_mpflag( arg4 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              victim->pIndexData->progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                victim->pIndexData->progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = victim->pIndexData->mudprogs;
          victim->pIndexData->mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
              }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( victim->pIndexData->progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      mptype = get_mpflag( arg4 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          victim->pIndexData->progtypes |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          victim->pIndexData->mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              victim->pIndexData->progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "add" ) )
    {
      mptype = get_mpflag( arg3 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next                     = mprg;
      else
        victim->pIndexData->mudprogs    = mprg;
      victim->pIndexData->progtypes     |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_mpedit( ch, "" );
}

void do_opedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  OBJ_DATA   *obj;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't opedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      mprog      = ch->dest_buf;
      if ( mprog->comlist )
        STRFREE( mprog->comlist );
      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  value = atoi( arg3 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: opedit <object> <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand wear remove sac zap get\r\n",  ch );
      send_to_char( "  drop damage repair greet exa use\r\n",ch );
      send_to_char( "  pull push (for levers,pullchains,buttons)\r\n",ch );
      send_to_char( "\r\n", ch);
      send_to_char( "Object should be in your inventory to edit.\r\n",ch);
      return;
    }

  if ( get_trust( ch ) < LEVEL_GOD )
    {
      if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You aren't carrying that.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj = get_obj_world( ch, arg1 ) ) == NULL )
        {
          send_to_char( "Nothing like that in all the realms.\r\n", ch );
          return;
        }
    }

  if ( !can_omodify( ch, obj ) )
    return;

  if ( !IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      send_to_char( "An object must have a prototype flag to be opset.\r\n", ch );
      return;
    }

  mprog = obj->pIndexData->mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( arg4[0] != '\0' )
        {
          mptype = get_mpflag( arg4 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              obj->pIndexData->progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                obj->pIndexData->progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = obj->pIndexData->mudprogs;
          obj->pIndexData->mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
              }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( obj->pIndexData->progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      mptype = get_mpflag( arg4 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          obj->pIndexData->progtypes    |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          obj->pIndexData->mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              obj->pIndexData->progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "add" ) )
    {
      mptype = get_mpflag( arg3 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next                      = mprg;
      else
        obj->pIndexData->mudprogs        = mprg;
      obj->pIndexData->progtypes        |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_opedit( ch, "" );
}



/*
 * RoomProg Support
 */
void rpedit( CHAR_DATA *ch, MPROG_DATA *mprg, int mptype, char *argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;
      if ( mprg->arglist )
        STRFREE( mprg->arglist );
      mprg->arglist = STRALLOC( argument );
    }
  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;
  if(!mprg->comlist)
    mprg->comlist = STRALLOC("");
  start_editing( ch, mprg->comlist );
  return;
}

void do_rpedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mob's can't rpedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      mprog      = ch->dest_buf;
      if ( mprog->comlist )
        STRFREE( mprog->comlist );
      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  value = atoi( arg2 );
  /* argument = one_argument( argument, arg3 ); */

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: rpedit <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand sleep rest rfight enter\r\n",  ch );
      send_to_char( "  leave death\r\n",                              ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "You should be standing in room you wish to edit.\r\n",ch);
      return;
    }

  if ( !can_rmodify( ch, ch->in_room ) )
    return;

  mprog = ch->in_room->mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg1, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "This room has no room programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg1, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "This room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      if ( arg3[0] != '\0' )
        {
          mptype = get_mpflag( arg3 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              ch->in_room->progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                ch->in_room->progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = ch->in_room->mudprogs;
          ch->in_room->mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
              }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( ch->in_room->progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      mptype = get_mpflag( arg2 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          ch->in_room->progtypes |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          ch->in_room->mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              ch->in_room->progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "add" ) )
    {
      mptype = get_mpflag( arg2 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next             = mprg;
      else
        ch->in_room->mudprogs   = mprg;
      ch->in_room->progtypes |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_rpedit( ch, "" );
}

void do_rdelete( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;

  argument = one_argument( argument, arg );

  /* Temporarily disable this command. */
  //return;

  if ( arg[0] == '\0' )
    {
      send_to_char( "Delete which room?\r\n", ch );
      return;
    }

  /* Find the room. */
  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  /* Does the player have the right to delete this room? */
  if ( get_trust( ch ) < sysdata.level_modify_proto
       && ( location->vnum < ch->pcdata->r_range_lo ||
            location->vnum > ch->pcdata->r_range_hi ) )
    {
      send_to_char( "That room is not in your assigned range.\r\n", ch );
      return;
    }

  /* We could go to the trouble of clearing out the room, but why? */
  if ( location->first_person || location->first_content )
    {
      send_to_char( "The room must be empty first.\r\n", ch );
      return;
    }

  /* Ok, we've determined that the room exists, it is empty and the
     player has the authority to delete it, so let's dump the thing.
     The function to do it is in db.c so it can access the top-room
     variable. */
  delete_room( location );

  send_to_char( "Room deleted.\r\n", ch );
  return;
}
void do_odelete( CHAR_DATA *ch, char *argument )
{
}
void do_mdelete( CHAR_DATA *ch, char *argument )
{
}
