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

#include <time.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>
#include "mud.h"

/* global variables */
int top_sn = 0;
int top_herb = 0;

SKILLTYPE *skill_table[MAX_SKILL];
SKILLTYPE *herb_table[MAX_HERB];

#ifdef SWRIP_USE_DLSYM

SPELL_FUN *spell_function( const char *name )
{
#ifdef _WIN32
  SPELL_FUN *fun_handle = (SPELL_FUN*) GetProcAddress( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      bug( "Could not find symbol '%s': %s", name, GetLastError() );
      return spell_notfound;
    }
#else
  SPELL_FUN *fun_handle = (SPELL_FUN*)(long)dlsym( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      bug( "Could not find symbol '%s': %s", name, dlerror() );
      return spell_notfound;
    }
#endif

  return fun_handle;
}

DO_FUN *skill_function( const char *name )
{
#ifdef _WIN32
  DO_FUN *fun_handle = (DO_FUN*) GetProcAddress( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      bug( "Could not find symbol '%s': %s", name, GetLastError() );
      return skill_notfound;
    }
#else
  DO_FUN *fun_handle = (DO_FUN*)(long)dlsym( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      bug( "Could not find symbol '%s': %s", name, dlerror() );
      return skill_notfound;
    }
#endif

  return fun_handle;
}

#else

typedef struct spell_fun_entry
{
  const char *fun_name;
  SPELL_FUN *fun_ptr;
} SPELL_FUN_ENTRY;

static const SPELL_FUN_ENTRY spell_fun_table[] = {
  { "spell_smaug",          spell_smaug },
  { "spell_acid_blast", spell_acid_blast },
  { "spell_animate_dead", spell_animate_dead },
  { "spell_astral_walk", spell_astral_walk },
  { "spell_blindness", spell_blindness },
  { "spell_burning_hands", spell_burning_hands },
  { "spell_call_lightning", spell_call_lightning },
  { "spell_cause_critical", spell_cause_critical },
  { "spell_cause_light", spell_cause_light },
  { "spell_cause_serious", spell_cause_serious },
  { "spell_change_sex", spell_change_sex },
  { "spell_charm_person", spell_charm_person },
  { "spell_chill_touch", spell_chill_touch },
  { "spell_colour_spray", spell_colour_spray },
  { "spell_control_weather", spell_control_weather },
  { "spell_create_food", spell_create_food },
  { "spell_create_water", spell_create_water },
  { "spell_cure_addiction", spell_cure_addiction },
  { "spell_cure_blindness", spell_cure_blindness },
  { "spell_cure_poison", spell_cure_poison },
  { "spell_curse", spell_curse },
  { "spell_detect_poison", spell_detect_poison },
  { "spell_dispel_evil", spell_dispel_evil },
  { "spell_dispel_magic", spell_dispel_magic },
  { "spell_dream", spell_dream },
  { "spell_earthquake", spell_earthquake },
  { "spell_enchant_weapon", spell_enchant_weapon },
  { "spell_energy_drain", spell_energy_drain },
  { "spell_faerie_fire", spell_faerie_fire },
  { "spell_faerie_fog", spell_faerie_fog },
  { "spell_farsight", spell_farsight },
  { "spell_fireball", spell_fireball },
  { "spell_flamestrike", spell_flamestrike },
  { "spell_gate", spell_gate },
  { "spell_knock", spell_knock },
  { "spell_harm", spell_harm },
  { "spell_identify", spell_identify },
  { "spell_invis", spell_invis },
  { "spell_know_alignment", spell_know_alignment },
  { "spell_lightning_bolt", spell_lightning_bolt },
  { "spell_locate_object", spell_locate_object },
  { "spell_magic_missile", spell_magic_missile },
  { "spell_mist_walk", spell_mist_walk },
  { "spell_pass_door", spell_pass_door },
  { "spell_plant_pass", spell_plant_pass },
  { "spell_poison", spell_poison },
  { "spell_polymorph", spell_polymorph },
  { "spell_possess", spell_possess },
  { "spell_recharge", spell_recharge },
  { "spell_remove_curse", spell_remove_curse },
  { "spell_remove_invis", spell_remove_invis },
  { "spell_remove_trap", spell_remove_trap },
  { "spell_shocking_grasp", spell_shocking_grasp },
  { "spell_sleep", spell_sleep },
  { "spell_solar_flight", spell_solar_flight },
  { "spell_suggest", spell_suggest },
  { "spell_summon", spell_summon },
  { "spell_teleport", spell_teleport },
  { "spell_ventriloquate", spell_ventriloquate },
  { "spell_weaken", spell_weaken },
  { "spell_word_of_recall", spell_word_of_recall },
  { "spell_acid_breath", spell_acid_breath },
  { "spell_fire_breath", spell_fire_breath },
  { "spell_frost_breath", spell_frost_breath },
  { "spell_gas_breath", spell_gas_breath },
  { "spell_lightning_breath", spell_lightning_breath },
  { "spell_spiral_blast", spell_spiral_blast },
  { "spell_scorching_surge", spell_scorching_surge },
  { "spell_helical_flow", spell_helical_flow },
  { "spell_transport", spell_transport },
  { "spell_portal", spell_portal },
  { "spell_ethereal_fist", spell_ethereal_fist },
  { "spell_spectral_furor", spell_spectral_furor },
  { "spell_hand_of_chaos", spell_hand_of_chaos },
  { "spell_disruption", spell_disruption },
  { "spell_sonic_resonance", spell_sonic_resonance },
  { "spell_mind_wrack", spell_mind_wrack },
  { "spell_mind_wrench", spell_mind_wrench },
  { "spell_revive", spell_revive },
  { "spell_sulfurous_spray", spell_sulfurous_spray },
  { "spell_caustic_fount", spell_caustic_fount },
  { "spell_acetum_primus", spell_acetum_primus },
  { "spell_galvanic_whip", spell_galvanic_whip },
  { "spell_magnetic_thrust", spell_magnetic_thrust },
  { "spell_quantum_spike", spell_quantum_spike },
  { "spell_black_hand", spell_black_hand },
  { "spell_black_fist", spell_black_fist },
  { "spell_black_lightning", spell_black_lightning },
  { "spell_midas_touch", spell_midas_touch },
  { "spell_null", spell_null }
};

static size_t spell_fun_table_size( void )
{
  return sizeof( spell_fun_table ) / sizeof( *spell_fun_table );
}

SPELL_FUN *spell_function( const char *name )
{
  SPELL_FUN *fun_ptr = spell_notfound;
  size_t i = 0;

  for( i = 0; i < spell_fun_table_size(); ++i )
    {
      if( !str_cmp( name, spell_fun_table[ i ].fun_name ) )
        {
          fun_ptr = spell_fun_table[ i ].fun_ptr;
          break;
        }
    }

  return fun_ptr;
}

typedef struct do_fun_entry
{
  const char *fun_name;
  DO_FUN *fun_ptr;
} DO_FUN_ENTRY;

static const DO_FUN_ENTRY command_fun_table[] = {
  { "do_aassign", do_aassign }
}

      if ( !str_cmp( name, "do_aassign" ))              return do_aassign;
      if ( !str_cmp( name, "do_addbounty" ))          return do_addbounty;
      if ( !str_cmp( name, "do_addresident" ))  return do_addresident;
      if ( !str_cmp( name, "do_addsalary" ))            return do_addsalary;
      if ( !str_cmp( name, "do_addpilot" ))             return do_addpilot;
      if ( !str_cmp( name, "do_add_patrol" ))   return do_add_patrol;
      if ( !str_cmp( name, "do_adjusttractorbeam" ))    return do_adjusttractorbeam;
      if ( !str_cmp( name, "do_accelerate" ))         return do_accelerate;
      if ( !str_cmp( name, "do_accept" ))             return do_accept;
      if ( !str_cmp( name, "do_advance" ))              return do_advance;
      if ( !str_cmp( name, "do_affected" ))             return do_affected;
      if ( !str_cmp( name, "do_afk" ))          return do_afk;
      if ( !str_cmp( name, "do_ahall" ))              return do_ahall;
      if ( !str_cmp( name, "do_aid" ))          return do_aid;
      if ( !str_cmp( name, "do_alias" ))                return do_alias;
      if ( !str_cmp( name, "do_allclantalk" ))  return do_allclantalk;
      if ( !str_cmp( name, "do_allow" ))                return do_allow;
      if ( !str_cmp( name, "do_allships" ))             return do_allships;
      if ( !str_cmp( name, "do_allspeeders" ))  return do_allspeeders;
      if ( !str_cmp( name, "do_ammo" ))         return do_ammo;
      if ( !str_cmp( name, "do_ansi" ))         return do_ansi;
      if ( !str_cmp( name, "do_answer" ))               return do_answer;
      if ( !str_cmp( name, "do_apply" ))                return do_apply;
      if ( !str_cmp( name, "do_appraise" ))             return do_appraise;
      if ( !str_cmp( name, "do_appoint" ))              return do_appoint;
      if ( !str_cmp( name, "do_areas" ))                return do_areas;
      if ( !str_cmp( name, "do_arena" ))              return do_arena;
      if ( !str_cmp( name, "do_arm" ))          return do_arm;
      if ( !str_cmp( name, "do_aset" ))         return do_aset;
      if ( !str_cmp( name, "do_ask" ))          return do_ask;
      if ( !str_cmp( name, "do_astat" ))                return do_astat;
      if ( !str_cmp( name, "do_at" ))                   return do_at;
      if ( !str_cmp( name, "do_auction" ))              return do_auction;
      if ( !str_cmp( name, "do_authorize" ))            return do_authorize;
      if ( !str_cmp( name, "do_autorecharge" ))       return do_autorecharge;
      if ( !str_cmp( name, "do_autotrack"))           return do_autotrack;
      if ( !str_cmp( name, "do_autopilot"))           return do_autopilot;
      if ( !str_cmp( name, "do_avtalk" ))               return do_avtalk;
      if ( !str_cmp( name, "do_awho" ))               return do_awho;
      break;
    case 'b':
      if ( !str_cmp( name, "do_backstab" ))             return do_backstab;
      if ( !str_cmp( name, "do_badname" ))           return do_badname;
      if ( !str_cmp( name, "do_balzhur" ))              return do_balzhur;
      if ( !str_cmp( name, "do_bamfin" ))               return do_bamfin;
      if ( !str_cmp( name, "do_bamfout" ))              return do_bamfout;
      if ( !str_cmp( name, "do_ban" ))          return do_ban;
      if ( !str_cmp( name, "do_bank" ))         return do_bank;
      if ( !str_cmp( name, "do_bash" ))         return do_bash;
      if ( !str_cmp( name, "do_bashdoor" ))             return do_bashdoor;
      if ( !str_cmp( name, "do_beep" ))               return do_beep;
      if ( !str_cmp( name, "do_beg" ))                return do_beg;
      if ( !str_cmp( name, "do_berserk" ))              return do_berserk;
      if ( !str_cmp( name, "do_bestow" ))               return do_bestow;
      if ( !str_cmp( name, "do_bestowarea" ))           return do_bestowarea;
      if ( !str_cmp( name, "do_bet" ))                return do_bet;
      if ( !str_cmp( name, "do_bind" ))         return do_bind;
      if ( !str_cmp( name, "do_bio" ))          return do_bio;
      if ( !str_cmp( name, "do_board" ))              return do_board;
      if ( !str_cmp( name, "do_boards" ))               return do_boards;
      if ( !str_cmp( name, "do_bodybag" ))              return do_bodybag;
      if ( !str_cmp( name, "do_bomb" ))         return do_bomb;
      if ( !str_cmp( name, "do_bounties" ))             return do_bounties;
      if ( !str_cmp( name, "do_brandish" ))             return do_brandish;
      if ( !str_cmp( name, "do_brew" ))         return do_brew;
      if ( !str_cmp( name, "do_bribe" ))                return do_bribe;
      if ( !str_cmp( name, "do_bset" ))         return do_bset;
      if ( !str_cmp( name, "do_bstat" ))                return do_bstat;
      if ( !str_cmp( name, "do_bug" ))          return do_bug;
      if ( !str_cmp( name, "do_bury" ))         return do_bury;
      if ( !str_cmp( name, "do_buy" ))          return do_buy;
      if ( !str_cmp( name, "do_buyhome" ))            return do_buyhome;
      if ( !str_cmp( name, "do_buyship" ))            return do_buyship;
      if ( !str_cmp( name, "do_buyvendor" ))            return do_buyvendor;
      if ( !str_cmp( name, "do_buzz" ))         return do_buzz;
      break;
    case 'c':
      if ( !str_cmp( name, "do_calculate" ))          return do_calculate;
      if ( !str_cmp( name, "do_calculate_diff" ))     return do_calculate_diff;
      if ( !str_cmp( name, "do_capture" ))            return do_capture;
      if ( !str_cmp( name, "do_cast" ))         return do_cast;
      if ( !str_cmp( name, "do_cedit" ))                return do_cedit;
      if ( !str_cmp( name, "do_chaff" ))                return do_chaff;
      if ( !str_cmp( name, "do_challenge" ))          return do_challenge;
      if ( !str_cmp( name, "do_channels" ))             return do_channels;
      if ( !str_cmp( name, "do_chaos" ))              return do_chaos;
      if ( !str_cmp( name, "do_chat" ))         return do_chat;
      if ( !str_cmp( name, "do_check_vnums" ))  return do_check_vnums;
      if ( !str_cmp( name, "do_circle" ))               return do_circle;
      if ( !str_cmp( name, "do_clanfunds" ))            return do_clanfunds;
      if ( !str_cmp( name, "do_clans" ))                return do_clans;
      if ( !str_cmp( name, "do_clan_donate" ))  return do_clan_donate;
      if ( !str_cmp( name, "do_clan_withdraw" ))        return do_clan_withdraw;
      if ( !str_cmp( name, "do_clantalk" ))             return do_clantalk;
      if ( !str_cmp( name, "do_clanbuyship" ))        return do_clanbuyship;
      if ( !str_cmp( name, "do_clansellship" ))        return do_clansellship;
      if ( !str_cmp( name, "do_climb" ))                return do_climb;
      if ( !str_cmp( name, "do_close" ))                return do_close;
      if ( !str_cmp( name, "do_clone" ))                return do_clone;
      if ( !str_cmp( name, "do_closebay" ))             return do_closebay;
      if ( !str_cmp( name, "do_closehatch"  ))        return do_closehatch;
      if ( !str_cmp( name, "do_cmdtable" ))             return do_cmdtable;
      if ( !str_cmp( name, "do_collectgold" ))  return do_collectgold;
      if ( !str_cmp( name, "do_commands" ))             return do_commands;
      if ( !str_cmp( name, "do_comment" ))              return do_comment;
      if ( !str_cmp( name, "do_compare" ))              return do_compare;
      if ( !str_cmp( name, "do_config" ))               return do_config;
      if ( !str_cmp( name, "do_consider" ))             return do_consider;
      if ( !str_cmp( name, "do_copyover" ))           return do_copyover;
      if ( !str_cmp( name, "do_copyship" ))             return do_copyship;
      if ( !str_cmp( name, "do_credits" ))              return do_credits;
      if ( !str_cmp( name, "do_cset" ))         return do_cset;
      if ( !str_cmp( name, "do_cutdoor" ))              return do_cutdoor;
      break;
    case 'd':
      if ( !str_cmp( name, "do_decline" ))            return do_decline;
      if ( !str_cmp( name, "do_delay" ))                return do_delay;
      if ( !str_cmp( name, "do_demote" ))               return do_demote;
      if ( !str_cmp( name, "do_deny" ))         return do_deny;
      if ( !str_cmp( name, "do_description" ))  return do_description;
      if ( !str_cmp( name, "do_destro" ))               return do_destro;
      if ( !str_cmp( name, "do_destroy" ))              return do_destroy;
      if ( !str_cmp( name, "do_detrap" ))               return do_detrap;
      if ( !str_cmp( name, "do_diagnose" ))             return do_diagnose;
      if ( !str_cmp( name, "do_dig" ))          return do_dig;
      if ( !str_cmp( name, "do_disarm" ))               return do_disarm;
      if ( !str_cmp( name, "do_disconnect" ))           return do_disconnect;
      if ( !str_cmp( name, "do_disguise" ))           return do_disguise;
      if ( !str_cmp( name, "do_dismount" ))             return do_dismount;
      if ( !str_cmp( name, "do_dismiss" ))              return do_dismiss;
      if ( !str_cmp( name, "do_dmesg" ))                return do_dmesg;
      if ( !str_cmp( name, "do_dock" ))         return do_dock;
      if ( !str_cmp( name, "do_down" ))         return do_down;
      if ( !str_cmp( name, "do_drag" ))         return do_drag;
      if ( !str_cmp( name, "do_draw" ))         return do_draw;
      if ( !str_cmp( name, "do_drink" ))                return do_drink;
      if ( !str_cmp( name, "do_drive" ))                return do_drive;
      if ( !str_cmp( name, "do_drop" ))         return do_drop;
      break;
    case 'e':
      if ( !str_cmp( name, "do_east" ))         return do_east;
      if ( !str_cmp( name, "do_eat" ))          return do_eat;
      if ( !str_cmp( name, "do_echo" ))         return do_echo;
      if ( !str_cmp( name, "do_elite_guard" ))  return do_elite_guard;
      if ( !str_cmp( name, "do_emote" ))                return do_emote;
      if ( !str_cmp( name, "do_empty" ))                return do_empty;
      if ( !str_cmp( name, "do_empower" ))              return do_empower;
      if ( !str_cmp( name, "do_enlist" ))               return do_enlist;
      if ( !str_cmp( name, "do_enter" ))                return do_enter;
      if ( !str_cmp( name, "do_equipment" ))            return do_equipment;
      if ( !str_cmp( name, "do_examine" ))              return do_examine;
      if ( !str_cmp( name, "do_exits" ))                return do_exits;
      break;
    case 'f':
      if ( !str_cmp( name, "do_feed" ))         return do_feed;
      if ( !str_cmp( name, "do_fill" ))         return do_fill;
      if ( !str_cmp( name, "do_findserin" ))            return do_findserin;
      if ( !str_cmp( name, "do_fire" ))               return do_fire;
      if ( !str_cmp( name, "do_first_aid" ))          return do_first_aid;
      if ( !str_cmp( name, "do_fixchar" ))              return do_fixchar;
      if ( !str_cmp( name, "do_flee" ))         return do_flee;
      if ( !str_cmp( name, "do_fly" ))          return do_fly;
      if ( !str_cmp( name, "do_focusalias" ))           return do_focusalias;
      if ( !str_cmp( name, "do_foldarea" ))             return do_foldarea;
      if ( !str_cmp( name, "do_follow" ))               return do_follow;
      if ( !str_cmp( name, "do_for" ))          return do_for;
      if ( !str_cmp( name, "do_force" ))                return do_force;
      if ( !str_cmp( name, "do_forceclose" ))           return do_forceclose;
      if ( !str_cmp( name, "do_form_password" ))        return do_form_password;
      if ( !str_cmp( name, "do_fuel" ))         return do_fuel;
      if ( !str_cmp( name, "do_fquit" ))                return do_fquit;
      if ( !str_cmp( name, "do_freeze" ))               return do_freeze;
      break;
    case 'g':
      if ( !str_cmp( name, "do_gather_intelligence" )) return do_gather_intelligence;
      if ( !str_cmp( name, "do_get" ))          return do_get;
      if ( !str_cmp( name, "do_gemcutting" ))           return do_gemcutting;
      if ( !str_cmp( name, "do_give" ))         return do_give;
      if ( !str_cmp( name, "do_glance" ))               return do_glance;
      if ( !str_cmp( name, "do_gold" ))               return do_gold;
      if ( !str_cmp( name, "do_goto" ))         return do_goto;
      if ( !str_cmp( name, "do_gouge" ))                return do_gouge;
      if ( !str_cmp( name, "do_group" ))                return do_group;
      if ( !str_cmp( name, "do_grub" ))         return do_grub;
      if ( !str_cmp( name, "do_gtell" ))                return do_gtell;
      if ( !str_cmp( name, "do_guard" ))                return do_guard;
      break;
    case 'h':
      if ( !str_cmp( name, "do_hail" ))         return do_hail;
      if ( !str_cmp( name, "do_hedit" ))                return do_hedit;
      if ( !str_cmp( name, "do_hell" ))         return do_hell;
      if ( !str_cmp( name, "do_help" ))         return do_help;
      if ( !str_cmp( name, "do_hide" ))         return do_hide;
      if ( !str_cmp( name, "do_hijack" ))               return do_hijack;
      if ( !str_cmp( name, "do_hitall" ))               return do_hitall;
      if ( !str_cmp( name, "do_hlist" ))                return do_hlist;
      if ( !str_cmp( name, "do_holylight" ))            return do_holylight;
      if ( !str_cmp( name, "do_homepage" ))             return do_homepage;
      if ( !str_cmp( name, "do_hset" ))         return do_hset;
      if ( !str_cmp( name, "do_hyperspace" ))         return do_hyperspace;
      break;
    case 'i':
      if ( !str_cmp( name, "do_i103" ))         return do_i103;
      if ( !str_cmp( name, "do_i104" ))         return do_i104;
      if ( !str_cmp( name, "do_i105" ))         return do_i105;
      if ( !str_cmp( name, "do_ide" ))          return do_ide;
      if ( !str_cmp( name, "do_idea" ))         return do_idea;
      if ( !str_cmp( name, "do_immortalize" ))  return do_immortalize;
      if ( !str_cmp( name, "do_immtalk" ))              return do_immtalk;
      if ( !str_cmp( name, "do_info" ))               return do_info;
      if ( !str_cmp( name, "do_induct" ))               return do_induct;
      if ( !str_cmp( name, "do_installarea" ))  return do_installarea;
      if ( !str_cmp( name, "do_InstallRoom" ))            return do_InstallRoom;
      if ( !str_cmp( name, "do_instazone" ))            return do_instazone;
      if ( !str_cmp( name, "do_inventory" ))            return do_inventory;
      if ( !str_cmp( name, "do_invis" ))                return do_invis;
      if ( !str_cmp( name, "do_invite" ))               return do_invite;
      break;
    case 'j':
      if ( !str_cmp( name, "do_jumpvector" ))   return do_jumpvector;
      if ( !str_cmp( name, "do_jail" ))                 return do_jail;
      break;
    case 'k':
      if ( !str_cmp( name, "do_kick" ))         return do_kick;
      if ( !str_cmp( name, "do_kill" ))         return do_kill;
      break;
    case 'l':
      if ( !str_cmp( name, "do_languages" ))            return do_languages;
      if ( !str_cmp( name, "do_last" ))         return do_last;
      if ( !str_cmp( name, "do_land"))                return do_land;
      if ( !str_cmp( name, "do_launch"))              return do_launch;
      if ( !str_cmp( name, "do_leave" ))                return do_leave;
      if ( !str_cmp( name, "do_leaveship" ))            return do_leaveship;
      if ( !str_cmp( name, "do_level" ))                return do_level;
      if ( !str_cmp( name, "do_light" ))                return do_light;
      if ( !str_cmp( name, "do_list" ))         return do_list;
      if ( !str_cmp( name, "do_litterbug" ))            return do_litterbug;
      if ( !str_cmp( name, "do_loadarea" ))             return do_loadarea;
      if ( !str_cmp( name, "do_loadup" ))               return do_loadup;
      if ( !str_cmp( name, "do_lock" ))         return do_lock;
      if ( !str_cmp( name, "do_log" ))          return do_log;
      if ( !str_cmp( name, "do_look" ))         return do_look;
      if ( !str_cmp( name, "do_low_purge" ))            return do_low_purge;
      break;
    case 'm':
      if ( !str_cmp( name, "do_mailroom" ))             return do_mailroom;
      if ( !str_cmp( name, "do_make" ))         return do_make;
      if ( !str_cmp( name, "do_makearmor" ))            return do_makearmor;
      if ( !str_cmp( name, "do_makeblade" ))          return do_makeblade;
      if ( !str_cmp( name, "do_makeblaster" ))        return do_makeblaster;
      if ( !str_cmp( name, "do_makebowcaster" ))      return do_makebowcaster;
      if ( !str_cmp( name, "do_makedisguise" ))           return do_makedisguise;
      if ( !str_cmp( name, "do_makelightsaber" ))     return do_makelightsaber;
      if ( !str_cmp( name, "do_makespice" ))          return do_makespice;
      if ( !str_cmp( name, "do_makegrenade" ))  return do_makegrenade;
      if ( !str_cmp( name, "do_makelight" ))            return do_makelight;
      if ( !str_cmp( name, "do_makelandmine" )) return do_makelandmine;
      if ( !str_cmp( name, "do_makecomlink" ))  return do_makecomlink;
      if ( !str_cmp( name, "do_makeshield" ))           return do_makeshield;
      if ( !str_cmp( name, "do_makecontainer" ))        return do_makecontainer;
      if ( !str_cmp( name, "do_makejewelry" ))  return do_makejewelry;
      if ( !str_cmp( name, "do_makeboard" ))            return do_makeboard;
      if ( !str_cmp( name, "do_makeclan" ))             return do_makeclan;
      if ( !str_cmp( name, "do_makemissile" ))  return do_makemissile;
      if ( !str_cmp( name, "do_makeship" ))           return do_makeship;
      if ( !str_cmp( name, "do_makerepair" ))           return do_makerepair;
      if ( !str_cmp( name, "do_makeshop" ))             return do_makeshop;
      if ( !str_cmp( name, "do_makespaceobject" ))     return do_makespaceobject;
      if ( !str_cmp( name, "do_makewizlist" ))  return do_makewizlist;
      if ( !str_cmp( name, "do_makeplanet" ))           return do_makeplanet;
      if ( !str_cmp( name, "do_massign" ))              return do_massign;
      if ( !str_cmp( name, "do_mass_propaganda" ))      return do_mass_propaganda;
      if ( !str_cmp( name, "do_mcreate" ))              return do_mcreate;
      if ( !str_cmp( name, "do_memory" ))               return do_memory;
      if ( !str_cmp( name, "do_members" ))              return do_members;
      if ( !str_cmp( name, "do_mfind" ))                return do_mfind;
      if ( !str_cmp( name, "do_minvoke" ))              return do_minvoke;
      if ( !str_cmp( name, "do_mine" ))         return do_mine;
      if ( !str_cmp( name, "do_mlist" ))                return do_mlist;
      if ( !str_cmp( name, "do_mortalize" ))            return do_mortalize;
      if ( !str_cmp( name, "do_mount" ))                return do_mount;
      if ( !str_cmp( name, "do_mp_close_passage" ))     return do_mp_close_passage;
      if ( !str_cmp( name, "do_mp_damage" ))            return do_mp_damage;
      if ( !str_cmp( name, "do_mp_deposit" ))           return do_mp_deposit;
      if ( !str_cmp( name, "do_mp_open_passage" ))      return do_mp_open_passage;
      if ( !str_cmp( name, "do_mp_practice" ))  return do_mp_practice;
      if ( !str_cmp( name, "do_mp_restore" ))           return do_mp_restore;
      if ( !str_cmp( name, "do_mp_slay" ))              return do_mp_slay;
      if ( !str_cmp( name, "do_mp_withdraw" ))  return do_mp_withdraw;
      if ( !str_cmp( name, "do_mpadvance" ))            return do_mpadvance;
      if ( !str_cmp( name, "do_mpapply" ))              return do_mpapply;
      if ( !str_cmp( name, "do_mpapplyb" ))             return do_mpapplyb;
      if ( !str_cmp( name, "do_mpasound" ))             return do_mpasound;
      if ( !str_cmp( name, "do_mpat" ))         return do_mpat;
      if ( !str_cmp( name, "do_mpdream" ))              return do_mpdream;
      if ( !str_cmp( name, "do_mpecho" ))               return do_mpecho;
      if ( !str_cmp( name, "do_mpechoaround" )) return do_mpechoaround;
      if ( !str_cmp( name, "do_mpechoat" ))             return do_mpechoat;
      if ( !str_cmp( name, "do_mpedit" ))               return do_mpedit;
      if ( !str_cmp( name, "do_mpfind" ))               return do_mpfind;
      if ( !str_cmp( name, "do_mpgain" ))               return do_mpgain;
      if ( !str_cmp( name, "do_mpforce" ))              return do_mpforce;
      if ( !str_cmp( name, "do_mpgoto" ))               return do_mpgoto;
      if ( !str_cmp( name, "do_mpinvis" ))              return do_mpinvis;
      if ( !str_cmp( name, "do_mpjunk" ))               return do_mpjunk;
      if ( !str_cmp( name, "do_mpkill" ))               return do_mpkill;
      if ( !str_cmp( name, "do_mpmload" ))              return do_mpmload;
      if ( !str_cmp( name, "do_mpnothing" ))            return do_mpnothing;
      if ( !str_cmp( name, "do_mpoload" ))              return do_mpoload;
      if ( !str_cmp( name, "do_mppkset" ))              return do_mppkset;
      if ( !str_cmp( name, "do_mppurge" ))              return do_mppurge;
      if ( !str_cmp( name, "do_mpstat" ))               return do_mpstat;
      if ( !str_cmp( name, "do_mptransfer" ))           return do_mptransfer;
      if ( !str_cmp( name, "do_mrange" ))               return do_mrange;
      if ( !str_cmp( name, "do_mset" ))         return do_mset;
      if ( !str_cmp( name, "do_mstat" ))                return do_mstat;
      if ( !str_cmp( name, "do_murde" ))                return do_murde;
      if ( !str_cmp( name, "do_murder" ))               return do_murder;
      if ( !str_cmp( name, "do_music" ))                return do_music;
      if ( !str_cmp( name, "do_mwhere" ))               return do_mwhere;
      break;
    case 'n':
      if ( !str_cmp( name, "do_name" ))         return do_name;
      if ( !str_cmp( name, "do_newbiechat" ))           return do_newbiechat;
      if ( !str_cmp( name, "do_newbieset" ))            return do_newbieset;
      if ( !str_cmp( name, "do_newzones" ))             return do_newzones;
      if ( !str_cmp( name, "do_noemote" ))              return do_noemote;
      if ( !str_cmp( name, "do_nohelps" ))              return do_nohelps;
      if ( !str_cmp( name, "do_noresolve" ))            return do_noresolve;
      if ( !str_cmp( name, "do_north" ))                return do_north;
      if ( !str_cmp( name, "do_northeast" ))            return do_northeast;
      if ( !str_cmp( name, "do_northwest" ))            return do_northwest;
      if ( !str_cmp( name, "do_notell" ))               return do_notell;
      if ( !str_cmp( name, "do_notitle" ))            return do_notitle;
      if ( !str_cmp( name, "do_noteroom" ))             return do_noteroom;
      break;
    case 'o':
      if ( !str_cmp( name, "do_oassign" ))              return do_oassign;
      if ( !str_cmp( name, "do_ocreate" ))              return do_ocreate;
      if ( !str_cmp( name, "do_ofind" ))                return do_ofind;
      if ( !str_cmp( name, "do_ogrub" ))                return do_ogrub;
      if ( !str_cmp( name, "do_oinvoke" ))              return do_oinvoke;
      if ( !str_cmp( name, "do_oldscore" ))             return do_oldscore;
      if ( !str_cmp( name, "do_olist" ))                return do_olist;
      if ( !str_cmp( name, "do_ooc" ))          return do_ooc;
      if ( !str_cmp( name, "do_opedit" ))               return do_opedit;
      if ( !str_cmp( name, "do_opfind" ))               return do_opfind;
      if ( !str_cmp( name, "do_open" ))         return do_open;
      if ( !str_cmp( name, "do_openbay" ))              return do_openbay;
      if ( !str_cmp( name, "do_openhatch" ))          return do_openhatch;
      /*        if ( !str_cmp( name, "do_opentourney" ))        return do_opentourney; */
      if ( !str_cmp( name, "do_opstat" ))               return do_opstat;
      if ( !str_cmp( name, "do_orange" ))               return do_orange;
      if ( !str_cmp( name, "do_order" ))                return do_order;
      if ( !str_cmp( name, "do_oset" ))         return do_oset;
      if ( !str_cmp( name, "do_ostat" ))                return do_ostat;
      if ( !str_cmp( name, "do_outcast" ))              return do_outcast;
      if ( !str_cmp( name, "do_override" ))             return do_override;
      if ( !str_cmp( name, "do_owhere" ))               return do_owhere;
      break;
    case 'p':
      if ( !str_cmp( name, "do_pager" ))                return do_pager;
      if ( !str_cmp( name, "do_pardon" ))               return do_pardon;
      if ( !str_cmp( name, "do_password" ))             return do_password;
      if ( !str_cmp( name, "do_peace" ))                return do_peace;
      if ( !str_cmp( name, "do_pick" ))         return do_pick;
      if ( !str_cmp( name, "do_pickshiplock" )) return do_pickshiplock;
      if ( !str_cmp( name, "do_placevendor" ))  return do_placevendor;
      if ( !str_cmp( name, "do_planets" ))              return do_planets;
      if ( !str_cmp( name, "do_pluogus" ))              return do_pluogus;
      if ( !str_cmp( name, "do_poison_weapon" ))        return do_poison_weapon;
      if ( !str_cmp( name, "do_postguard" ))            return do_postguard;
      if ( !str_cmp( name, "do_practice" ))             return do_practice;
      if ( !str_cmp( name, "do_pricevendor" ))  return do_pricevendor;
      if ( !str_cmp( name, "do_prompt" ))               return do_prompt;
      if ( !str_cmp( name, "do_propaganda" ))           return do_propaganda;
      if ( !str_cmp( name, "do_pull" ))         return do_pull;
      if ( !str_cmp( name, "do_punch" ))                return do_punch;
      if ( !str_cmp( name, "do_purge" ))                return do_purge;
      if ( !str_cmp( name, "do_push" ))         return do_push;
      if ( !str_cmp( name, "do_put" ))          return do_put;
      break;
    case 'q':
      if ( !str_cmp( name, "do_quaff" ))                return do_quaff;
      if ( !str_cmp( name, "do_qui" ))          return do_qui;
      if ( !str_cmp( name, "do_quit" ))         return do_quit;
      break;
    case 'r':
      if ( !str_cmp( name, "do_radar" ))                return do_radar;
      if ( !str_cmp( name, "do_rank" ))         return do_rank;
      if ( !str_cmp( name, "do_rassign" ))              return do_rassign;
      if ( !str_cmp( name, "do_rat" ))          return do_rat;
      if ( !str_cmp( name, "do_rdelete" ))              return do_rdelete;
      if ( !str_cmp( name, "do_reboo" ))                return do_reboo;
      if ( !str_cmp( name, "do_reboot" ))               return do_reboot;
      if ( !str_cmp( name, "do_recharge" ))           return do_recharge;
      if ( !str_cmp( name, "do_recho" ))                return do_recho;
      if ( !str_cmp( name, "do_recall" ))              return do_recall;
      if ( !str_cmp( name, "do_recite" ))               return do_recite;
      if ( !str_cmp( name, "do_recite" ))             return do_recite;
      if ( !str_cmp( name, "do_redit" ))              return do_redit;
      if ( !str_cmp( name, "do_refuel" ))             return do_refuel;
      if ( !str_cmp( name, "do_reinforcements" ))       return do_reinforcements;
      if ( !str_cmp( name, "do_regoto" ))               return do_regoto;
      if ( !str_cmp( name, "do_reload" ))               return do_reload;
      if ( !str_cmp( name, "do_rembounty" ))          return do_rembounty;
      if ( !str_cmp( name, "do_remove" ))               return do_remove;
      if ( !str_cmp( name, "do_rempilot" ))           return do_rempilot;
      if ( !str_cmp( name, "do_remresident" ))  return do_remresident;
      if ( !str_cmp( name, "do_renameship" ))           return do_renameship;
      if ( !str_cmp( name, "do_rent" ))         return do_rent;
      if ( !str_cmp( name, "do_repair" ))               return do_repair;
      if ( !str_cmp( name, "do_repairset" ))            return do_repairset;
      if ( !str_cmp( name, "do_repairship" ))         return do_repairship;
      if ( !str_cmp( name, "do_repairshops" ))  return do_repairshops;
      if ( !str_cmp( name, "do_repairstat" ))           return do_repairstat;
      if ( !str_cmp( name, "do_reply" ))                return do_reply;
      if ( !str_cmp( name, "do_report" ))               return do_report;
      if ( !str_cmp( name, "do_request"))               return do_request;
      if ( !str_cmp( name, "do_rescue" ))               return do_rescue;
      if ( !str_cmp( name, "do_reset" ))                return do_reset;
      if ( !str_cmp( name, "do_ResetShip" ))            return do_ResetShip;
      if ( !str_cmp( name, "do_resign" ))               return do_resign;
      if ( !str_cmp( name, "do_rest" ))         return do_rest;
      if ( !str_cmp( name, "do_restore" ))              return do_restore;
      if ( !str_cmp( name, "do_restoretime" ))  return do_restoretime;
      if ( !str_cmp( name, "do_restrict" ))             return do_restrict;
      if ( !str_cmp( name, "do_retire" ))               return do_retire;
      if ( !str_cmp( name, "do_retran" ))               return do_retran;
      if ( !str_cmp( name, "do_return" ))               return do_return;
      if ( !str_cmp( name, "do_revert" ))               return do_revert;
      if ( !str_cmp( name, "do_rgrub" ))                return do_rgrub;
      if ( !str_cmp( name, "do_rlist" ))                return do_rlist;
      if ( !str_cmp( name, "do_roster" ))             return do_roster;
      if ( !str_cmp( name, "do_rpedit" ))               return do_rpedit;
      if ( !str_cmp( name, "do_rpfind" ))               return do_rpfind;
      if ( !str_cmp( name, "do_rpstat" ))               return do_rpstat;
      if ( !str_cmp( name, "do_rreset" ))               return do_rreset;
      if ( !str_cmp( name, "do_rset" ))         return do_rset;
      if ( !str_cmp( name, "do_rstat" ))                return do_rstat;
      break;
    case 's':
      if ( !str_cmp( name, "do_sacrifice" ))            return do_sacrifice;
      if ( !str_cmp( name, "do_save" ))         return do_save;
      if ( !str_cmp( name, "do_savearea" ))             return do_savearea;
      if ( !str_cmp( name, "do_say" ))          return do_say;
      if ( !str_cmp( name, "do_sabotage" ))             return do_sabotage;
      if ( !str_cmp( name, "do_scan" ))         return do_scan;
      if ( !str_cmp( name, "do_scatter" ))              return do_scatter;
      if ( !str_cmp( name, "do_score" ))                return do_score;
      if ( !str_cmp( name, "do_scribe" ))               return do_scribe;
      if ( !str_cmp( name, "do_search" ))               return do_search;
      if ( !str_cmp( name, "do_sedit" ))                return do_sedit;
      if ( !str_cmp( name, "do_seduce" ))               return do_seduce;
      if ( !str_cmp( name, "do_sell" ))         return do_sell;
      if ( !str_cmp( name, "do_sellship" ))           return do_sellship;
      if ( !str_cmp( name, "do_setblaster" ))           return do_setblaster;
      if ( !str_cmp( name, "do_sellhome" ))             return do_sellhome;
      if ( !str_cmp( name, "do_set_boot_time" ))        return do_set_boot_time;
      if ( !str_cmp( name, "do_setclan" ))              return do_setclan;
      if ( !str_cmp( name, "do_setship" ))            return do_setship;
      if ( !str_cmp( name, "do_setspaceobject" ))      return do_setspaceobject;
      if ( !str_cmp( name, "do_setplanet" ))            return do_setplanet;
      if ( !str_cmp( name, "do_ships" ))              return do_ships;
      if ( !str_cmp( name, "do_shiptrack" ))          return do_shiptrack;
      if ( !str_cmp( name, "do_shops" ))                return do_shops;
      if ( !str_cmp( name, "do_shopset" ))              return do_shopset;
      if ( !str_cmp( name, "do_shopstat" ))             return do_shopstat;
      if ( !str_cmp( name, "do_shout" ))                return do_shout;
      if ( !str_cmp( name, "do_shove" ))                return do_shove;
      if ( !str_cmp( name, "do_showclan" ))             return do_showclan;
      if ( !str_cmp( name, "do_showlayers" ))           return do_showlayers;
      if ( !str_cmp( name, "do_showplanet" ))           return do_showplanet;
      if ( !str_cmp( name, "do_showship" ))           return do_showship;
      if ( !str_cmp( name, "do_showspaceobject" ))     return do_showspaceobject;
      if ( !str_cmp( name, "do_showstatistic" ))     return do_showstatistic;
      if ( !str_cmp( name, "do_shutdow" ))              return do_shutdow;
      if ( !str_cmp( name, "do_shutdown" ))             return do_shutdown;
      if ( !str_cmp( name, "do_silence" ))              return do_silence;
      if ( !str_cmp( name, "do_sit" ))          return do_sit;
      if ( !str_cmp( name, "do_skin" ))         return do_skin;
      if ( !str_cmp( name, "do_sla" ))          return do_sla;
      if ( !str_cmp( name, "do_slay" ))         return do_slay;
      if ( !str_cmp( name, "do_sleep" ))                return do_sleep;
      if ( !str_cmp( name, "do_slice" ))                return do_slice;
      if ( !str_cmp( name, "do_slist" ))                return do_slist;
      if ( !str_cmp( name, "do_slookup" ))              return do_slookup;
      if ( !str_cmp( name, "do_smalltalk" ))            return do_smalltalk;
      if ( !str_cmp( name, "do_smoke" ))                return do_smoke;
      if ( !str_cmp( name, "do_snipe" ))                return do_snipe;
      if ( !str_cmp( name, "do_snoop" ))                return do_snoop;
      if ( !str_cmp( name, "do_sober" ))                return do_sober;
      if ( !str_cmp( name, "do_socials" ))              return do_socials;
      if ( !str_cmp( name, "do_south" ))                return do_south;
      if ( !str_cmp( name, "do_southeast" ))            return do_southeast;
      if ( !str_cmp( name, "do_southwest" ))            return do_southwest;
      if ( !str_cmp( name, "do_speak" ))                return do_speak;
      if ( !str_cmp( name, "do_speeders" ))             return do_speeders;
      if ( !str_cmp( name, "do_split" ))                return do_split;
      if ( !str_cmp( name, "do_sset" ))         return do_sset;
      if ( !str_cmp( name, "do_stand" ))                return do_stand;
      if ( !str_cmp( name, "do_spaceobjects" ))        return do_spaceobjects;
      if ( !str_cmp( name, "do_status" ))             return do_status;
      if ( !str_cmp( name, "do_steal" ))                return do_steal;
      if ( !str_cmp( name, "do_study" ))                return do_study;
      if ( !str_cmp( name, "do_stun" ))         return do_stun;
      if ( !str_cmp( name, "do_switch" ))               return do_switch;
      if ( !str_cmp( name, "do_shiptalk" ))             return do_shiptalk;
      if ( !str_cmp( name, "do_spacetalk" ))            return do_spacetalk;
      if ( !str_cmp( name, "do_special_forces" ))       return do_special_forces;
      if ( !str_cmp( name, "do_suicide" ))              return do_suicide;
      if ( !str_cmp( name, "do_systemtalk" ))           return do_systemtalk;
      break;
    case 't':
      if ( !str_cmp( name, "do_takedrug" ))             return do_takedrug;
      if ( !str_cmp( name, "do_tamp" ))         return do_tamp;
      if ( !str_cmp( name, "do_target" ))             return do_target;
      if ( !str_cmp( name, "do_teach" ))                return do_teach;
      if ( !str_cmp( name, "do_tell" ))         return do_tell;
      if ( !str_cmp( name, "do_throw" ))                return do_throw;
      if ( !str_cmp( name, "do_time" ))         return do_time;
      if ( !str_cmp( name, "do_timecmd" ))              return do_timecmd;
      if ( !str_cmp( name, "do_title" ))                return do_title;
      if ( !str_cmp( name, "do_torture" ))              return do_torture;
      if ( !str_cmp( name, "do_toplevel" ))             return do_toplevel;
      if ( !str_cmp( name, "do_track" ))                return do_track;
      if ( !str_cmp( name, "do_tractorbeam" ))  return do_tractorbeam;
      if ( !str_cmp( name, "do_train" ))                return do_train;
      if ( !str_cmp( name, "do_trajectory" ))           return do_trajectory;
      if ( !str_cmp( name, "do_trajectory_actual" ))    return do_trajectory_actual;
      if ( !str_cmp( name, "do_transfer" ))             return do_transfer;
      if ( !str_cmp( name, "do_TransferShip" ))            return do_TransferShip;
      if ( !str_cmp( name, "do_trust" ))                return do_trust;
      if ( !str_cmp( name, "do_typo" ))         return do_typo;
      break;
    case 'u':
      if ( !str_cmp( name, "do_unfocusalias" )) return do_unfocusalias;
      if ( !str_cmp( name, "do_unfoldarea" ))           return do_unfoldarea;
      if ( !str_cmp( name, "do_unhell" ))               return do_unhell;
      if ( !str_cmp( name, "do_undock" ))               return do_undock;
      if ( !str_cmp( name, "do_unjail" ))               return do_unjail;
      if ( !str_cmp( name, "do_unlock" ))               return do_unlock;
      if ( !str_cmp( name, "do_unsilence" ))          return do_unsilence;
      if ( !str_cmp( name, "do_up" ))                   return do_up;
      if ( !str_cmp( name, "do_use" ))          return do_use;
      if ( !str_cmp( name, "do_users" ))                return do_users;
      break;
    case 'v':
      if ( !str_cmp( name, "do_value" ))                return do_value;
      if ( !str_cmp( name, "do_vassign" ))            return do_vassign;
      if ( !str_cmp( name, "do_visible" ))              return do_visible;
      if ( !str_cmp( name, "do_viewskills" ))           return do_viewskills;
      if ( !str_cmp( name, "do_vnums" ))                return do_vnums;
      if ( !str_cmp( name, "do_vsearch" ))              return do_vsearch;
      break;
    case 'w':
      if ( !str_cmp( name, "do_wake" ))         return do_wake;
      if ( !str_cmp( name, "do_wartalk" ))              return do_wartalk;
      if ( !str_cmp( name, "do_wear" ))         return do_wear;
      if ( !str_cmp( name, "do_weather" ))              return do_weather;
      if ( !str_cmp( name, "do_west" ))         return do_west;
      if ( !str_cmp( name, "do_where" ))                return do_where;
      if ( !str_cmp( name, "do_who" ))          return do_who;
      if ( !str_cmp( name, "do_whois" ))                return do_whois;
      if ( !str_cmp( name, "do_wimpy" ))                return do_wimpy;
      if ( !str_cmp( name, "do_wizhelp" ))              return do_wizhelp;
      if ( !str_cmp( name, "do_wizlist" ))              return do_wizlist;
      if ( !str_cmp( name, "do_wizlock" ))              return do_wizlock;
      break;
    case 'y':
      if ( !str_cmp( name, "do_yell" ))         return do_yell;
      break;
    case 'z':
      if ( !str_cmp( name, "do_zap" ))          return do_zap;
      if ( !str_cmp( name, "do_zones" ))                return do_zones;

static size_t command_fun_table_size( void )
{
  return sizeof( command_fun_table ) / sizeof( *command_fun_table );
}

DO_FUN *skill_function( const char *name )
{
  DO_FUN *fun_ptr = skill_notfound;
  size_t i = 0;

  for( i = 0; i < command_fun_table_size(); ++i )
    {
      if( !str_cmp( name, command_fun_table[ i ].fun_name ) )
        {
          fun_ptr = command_fun_table[ i ].fun_ptr;
          break;
        }
    }

  return fun_ptr;
}

#endif /* SWRIP_USE_DLSYM */

/*
 * Function used by qsort to sort skills
 */
int skill_comp( SKILLTYPE **sk1, SKILLTYPE **sk2 )
{
  SKILLTYPE *skill1 = (*sk1);
  SKILLTYPE *skill2 = (*sk2);

  if ( !skill1 && skill2 )
    {
      return 1;
    }

  if ( skill1 && !skill2 )
    {
      return -1;
    }

  if ( !skill1 && !skill2 )
    {
      return 0;
    }

  if ( skill1->type < skill2->type )
    {
      return -1;
    }

  if ( skill1->type > skill2->type )
    {
      return 1;
    }

  return strcasecmp( skill1->name, skill2->name );
}

/*
 * Sort the skill table with qsort
 */
void sort_skill_table()
{
  log_string( "Sorting skill table..." );
  qsort( &skill_table[1], top_sn-1, sizeof( SKILLTYPE * ),
         (int(*)(const void *, const void *)) skill_comp );
}

/*
 * Write skill data to a file
 */
void fwrite_skill( FILE *fpout, SKILLTYPE *skill )
{
  SMAUG_AFF *aff = NULL;

  fprintf( fpout, "Name         %s~\n", skill->name     );
  fprintf( fpout, "Type         %s\n",  skill_tname[skill->type]);
  fprintf( fpout, "Flags        %d\n",  skill->flags    );

  if ( skill->target )
    {
      fprintf( fpout, "Target       %d\n",        skill->target   );
    }

  if ( skill->minimum_position )
    {
      fprintf( fpout, "Minpos       %d\n",        skill->minimum_position );
    }

  if ( skill->saves )
    {
      fprintf( fpout, "Saves        %d\n",        skill->saves    );
    }

  if ( skill->slot )
    {
      fprintf( fpout, "Slot         %d\n",        skill->slot     );
    }

  if ( skill->min_mana )
    {
      fprintf( fpout, "Mana         %d\n",        skill->min_mana );
    }

  if ( skill->beats )
    {
      fprintf( fpout, "Rounds       %d\n",        skill->beats    );
    }

  if ( skill->guild != -1 )
    {
      fprintf( fpout, "Guild        %d\n",        skill->guild    );
    }

  if ( skill->skill_fun || skill->spell_fun )
    {
      fprintf( fpout, "Code         %s\n",        skill->fun_name );
    }

  fprintf( fpout, "Dammsg       %s~\n", skill->noun_damage );

  if ( skill->msg_off && skill->msg_off[0] != '\0' )
    {
      fprintf( fpout, "Wearoff      %s~\n",       skill->msg_off  );
    }


  if ( skill->hit_char && skill->hit_char[0] != '\0' )
    {
      fprintf( fpout, "Hitchar      %s~\n",       skill->hit_char );
    }

  if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
    {
      fprintf( fpout, "Hitvict      %s~\n",       skill->hit_vict );
    }

  if ( skill->hit_room && skill->hit_room[0] != '\0' )
    {
      fprintf( fpout, "Hitroom      %s~\n",       skill->hit_room );
    }

  if ( skill->miss_char && skill->miss_char[0] != '\0' )
    {
      fprintf( fpout, "Misschar     %s~\n",       skill->miss_char );
    }

  if ( skill->miss_vict && skill->miss_vict[0] != '\0' )
    {
      fprintf( fpout, "Missvict     %s~\n",       skill->miss_vict );
    }

  if ( skill->miss_room && skill->miss_room[0] != '\0' )
    {
      fprintf( fpout, "Missroom     %s~\n",       skill->miss_room );
    }

  if ( skill->die_char && skill->die_char[0] != '\0' )
    {
      fprintf( fpout, "Diechar      %s~\n",       skill->die_char );
    }

  if ( skill->die_vict && skill->die_vict[0] != '\0' )
    {
      fprintf( fpout, "Dievict      %s~\n",       skill->die_vict );
    }

  if ( skill->die_room && skill->die_room[0] != '\0' )
    {
      fprintf( fpout, "Dieroom      %s~\n",       skill->die_room );
    }

  if ( skill->imm_char && skill->imm_char[0] != '\0' )
    {
      fprintf( fpout, "Immchar      %s~\n",       skill->imm_char );
    }

  if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
    {
      fprintf( fpout, "Immvict      %s~\n",       skill->imm_vict );
    }

  if ( skill->imm_room && skill->imm_room[0] != '\0' )
    {
      fprintf( fpout, "Immroom      %s~\n",       skill->imm_room );
    }

  if ( skill->dice && skill->dice[0] != '\0' )
    {
      fprintf( fpout, "Dice         %s~\n",       skill->dice );
    }

  if ( skill->value )
    {
      fprintf( fpout, "Value        %d\n",        skill->value );
    }

  if ( skill->difficulty )
    {
      fprintf( fpout, "Difficulty   %d\n",        skill->difficulty );
    }

  if ( skill->participants )
    {
      fprintf( fpout, "Participants %d\n",        skill->participants );
    }

  if ( skill->components && skill->components[0] != '\0' )
    {
      fprintf( fpout, "Components   %s~\n",       skill->components );
    }

  if ( skill->teachers && skill->teachers[0] != '\0' )
    {
      fprintf( fpout, "Teachers     %s~\n",       skill->teachers );
    }

  for ( aff = skill->affects; aff; aff = aff->next )
    {
      fprintf( fpout, "Affect       '%s' %d '%s' %d\n",
	       aff->duration, aff->location, aff->modifier, aff->bitvector );
    }

  if ( skill->alignment )
    {
      fprintf( fpout, "Alignment   %d\n", skill->alignment );
    }

  if ( skill->type != SKILL_HERB )
    {
      fprintf( fpout, "Minlevel     %d\n",      skill->min_level        );
    }

  fprintf( fpout, "End\n\n" );
}

/*
 * Save the skill table to disk
 */
void save_skill_table()
{
  int x = 0;
  FILE *fpout = NULL;

  if ( (fpout=fopen( SKILL_FILE, "w" )) == NULL )
    {
      bug( "Cannot open skills.dat for writting", 0 );
      perror( SKILL_FILE );
      return;
    }

  for ( x = 0; x < top_sn; x++ )
    {
      if ( !skill_table[x]->name || skill_table[x]->name[0] == '\0' )
	{
	  break;
	}

      fprintf( fpout, "#SKILL\n" );
      fwrite_skill( fpout, skill_table[x] );
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

/*
 * Save the herb table to disk
 */
void save_herb_table()
{
  int x = 0;
  FILE *fpout = NULL;

  if ( (fpout=fopen( HERB_FILE, "w" )) == NULL )
    {
      bug( "Cannot open herbs.dat for writting", 0 );
      perror( HERB_FILE );
      return;
    }

  for ( x = 0; x < top_herb; x++ )
    {
      if ( !herb_table[x]->name || herb_table[x]->name[0] == '\0' )
	{
	  break;
	}

      fprintf( fpout, "#HERB\n" );
      fwrite_skill( fpout, herb_table[x] );
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

/*
 * Save the socials to disk
 */
void save_socials()
{
  FILE *fpout = NULL;
  SOCIALTYPE *social = NULL;
  int x = 0;

  if ( (fpout=fopen( SOCIAL_FILE, "w" )) == NULL )
    {
      bug( "Cannot open socials.dat for writting", 0 );
      perror( SOCIAL_FILE );
      return;
    }

  for ( x = 0; x < 27; x++ )
    {
      for ( social = social_index[x]; social; social = social->next )
        {
          if ( !social->name || social->name[0] == '\0' )
            {
              bug( "Save_socials: blank social in hash bucket %d", x );
              continue;
            }

          fprintf( fpout, "#SOCIAL\n" );
          fprintf( fpout, "Name        %s~\n", social->name );

          if ( social->char_no_arg )
	    {
	      fprintf( fpout, "CharNoArg   %s~\n", social->char_no_arg );
	    }
	  else
	    {
	      bug( "Save_socials: NULL char_no_arg in hash bucket %d", x );
	    }

          if ( social->others_no_arg )
	    {
	      fprintf( fpout, "OthersNoArg %s~\n", social->others_no_arg );
	    }

          if ( social->char_found )
	    {
	      fprintf( fpout, "CharFound   %s~\n", social->char_found );
	    }

          if ( social->others_found )
	    {
	      fprintf( fpout, "OthersFound %s~\n", social->others_found );
	    }

          if ( social->vict_found )
	    {
	      fprintf( fpout, "VictFound   %s~\n", social->vict_found );
	    }

          if ( social->char_auto )
	    {
	      fprintf( fpout, "CharAuto    %s~\n", social->char_auto );
	    }

          if ( social->others_auto )
	    {
	      fprintf( fpout, "OthersAuto  %s~\n", social->others_auto );
	    }

          fprintf( fpout, "End\n\n" );
        }
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

int get_skill( char *skilltype )
{
  if ( !str_cmp( skilltype, "Spell" ) )
    {
      return SKILL_SPELL;
    }

  if ( !str_cmp( skilltype, "Skill" ) )
    {
      return SKILL_SKILL;
    }

  if ( !str_cmp( skilltype, "Weapon" ) )
    {
      return SKILL_WEAPON;
    }

  if ( !str_cmp( skilltype, "Tongue" ) )
    {
      return SKILL_TONGUE;
    }

  if ( !str_cmp( skilltype, "Herb" ) )
    {
      return SKILL_HERB;
    }

  return SKILL_UNKNOWN;
}

/*
 * Save the commands to disk
 */
void save_commands( void )
{
  FILE *fpout = NULL;
  CMDTYPE *command = NULL;
  int x = 0;

  if ( (fpout=fopen( COMMAND_FILE, "w" )) == NULL )
    {
      bug( "Cannot open commands.dat for writing", 0 );
      perror( COMMAND_FILE );
      return;
    }

  for ( x = 0; x < 126; x++ )
    {
      for ( command = command_hash[x]; command; command = command->next )
        {
          if ( !command->name || command->name[0] == '\0' )
            {
              bug( "Save_commands: blank command in hash bucket %d", x );
              continue;
            }

          fprintf( fpout, "#COMMAND\n" );
          fprintf( fpout, "Name        %s~\n", command->name     );
          fprintf( fpout, "Code        %s\n",  command->fun_name );
          fprintf( fpout, "Position    %d\n",  command->position );
          fprintf( fpout, "Level       %d\n",  command->level    );
          fprintf( fpout, "Log         %d\n",  command->log      );
          fprintf( fpout, "End\n\n" );
        }
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

SKILLTYPE *fread_skill( FILE *fp )
{
  SKILLTYPE *skill = NULL;
  CREATE( skill, SKILLTYPE, 1 );

  skill->guild = -1;

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = false;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = true;
          fread_to_eol( fp );
          break;

        case 'A':
          KEY( "Alignment",     skill->alignment,       fread_number( fp ) );

          if ( !str_cmp( word, "Affect" ) )
            {
              SMAUG_AFF *aff = NULL;

              CREATE( aff, SMAUG_AFF, 1 );
              aff->duration = str_dup( fread_word( fp ) );
              aff->location = fread_number( fp );
              aff->modifier = str_dup( fread_word( fp ) );
              aff->bitvector = fread_number( fp );
              aff->next = skill->affects;
              skill->affects = aff;
              fMatch = true;
              break;
            }
          break;

        case 'C':
          if ( !str_cmp( word, "Code" ) )
            {
	      SPELL_FUN *spellfun = NULL;
	      DO_FUN *dofun = NULL;
	      const char *w = fread_word( fp );

	      fMatch = true;

	      if( ( spellfun = spell_function( w ) ) != spell_notfound
		  && !str_prefix( "spell_", w ) )
		{
		  skill->spell_fun = spellfun;
		  skill->fun_name = str_dup( w );
		}
	      else if( ( dofun = skill_function( w ) ) != skill_notfound
		       && !str_prefix( "do_", w ) )
		{
		  skill->skill_fun = dofun;
		  skill->fun_name = str_dup( w );
		}
	      else
		{
		  bug( "fread_skill: unknown skill/spell %s", w );
		  skill->fun_name = str_dup( "" );
		}

	      break;
            }

          KEY( "Components",    skill->components,      fread_string_nohash( fp ) );
          break;

        case 'D':
          KEY( "Dammsg",        skill->noun_damage,     fread_string_nohash( fp ) );
          KEY( "Dice",  skill->dice,            fread_string_nohash( fp ) );
          KEY( "Diechar",       skill->die_char,        fread_string_nohash( fp ) );
          KEY( "Dieroom",       skill->die_room,        fread_string_nohash( fp ) );
          KEY( "Dievict",       skill->die_vict,        fread_string_nohash( fp ) );
          KEY( "Difficulty",    skill->difficulty,      fread_number( fp ) );
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
	    {
	      return skill;
	    }

          break;

        case 'F':
          KEY( "Flags", skill->flags,           fread_number( fp ) );
          break;

        case 'G':
          KEY( "Guild", skill->guild,           fread_number( fp ) );
          break;

        case 'H':
          KEY( "Hitchar",       skill->hit_char,        fread_string_nohash( fp ) );
          KEY( "Hitroom",       skill->hit_room,        fread_string_nohash( fp ) );
          KEY( "Hitvict",       skill->hit_vict,        fread_string_nohash( fp ) );
          break;

        case 'I':
          KEY( "Immchar",       skill->imm_char,        fread_string_nohash( fp ) );
          KEY( "Immroom",       skill->imm_room,        fread_string_nohash( fp ) );
          KEY( "Immvict",       skill->imm_vict,        fread_string_nohash( fp ) );
          break;

        case 'M':
          KEY( "Mana",  skill->min_mana,        fread_number( fp ) );
          KEY( "Minlevel",      skill->min_level,       fread_number( fp ) );
          KEY( "Minpos",        skill->minimum_position, fread_number( fp ) );
          KEY( "Misschar",      skill->miss_char,       fread_string_nohash( fp ) );
          KEY( "Missroom",      skill->miss_room,       fread_string_nohash( fp ) );
          KEY( "Missvict",      skill->miss_vict,       fread_string_nohash( fp ) );
          break;

        case 'N':
          KEY( "Name",  skill->name,            fread_string_nohash( fp ) );
          break;

        case 'P':
          KEY( "Participants",skill->participants,      fread_number( fp ) );
          break;

        case 'R':
          KEY( "Rounds",        skill->beats,           fread_number( fp ) );
          break;

        case 'S':
          KEY( "Slot",  skill->slot,            fread_number( fp ) );
          KEY( "Saves", skill->saves,           fread_number( fp ) );
          break;

        case 'T':
          KEY( "Target",        skill->target,          fread_number( fp ) );
          KEY( "Teachers",      skill->teachers,        fread_string_nohash( fp ) );
          KEY( "Type",  skill->type,  get_skill(fread_word( fp ))  );
          break;

        case 'V':
          KEY( "Value", skill->value,           fread_number( fp ) );
          break;

        case 'W':
          KEY( "Wearoff",       skill->msg_off,         fread_string_nohash( fp ) );
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_skill: no match: %s", word );
        }
    }
}

void load_skill_table()
{
  FILE *fp = NULL;

  if ( ( fp = fopen( SKILL_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = fread_letter( fp );

          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_skill_table: # not found.", 0 );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "SKILL" ) )
            {
              if ( top_sn >= MAX_SKILL )
                {
                  bug( "load_skill_table: more skills than MAX_SKILL %d", MAX_SKILL );
                  fclose( fp );
                  return;
                }

              skill_table[top_sn++] = fread_skill( fp );
              continue;
            }
          else if ( !str_cmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      bug( "Load_skill_table: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      bug( "Cannot open skills.dat", 0 );
      exit(0);
    }
}

void load_herb_table()
{
  FILE *fp = NULL;

  if ( ( fp = fopen( HERB_FILE, "r" ) ) != NULL )
    {
      top_herb = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = fread_letter( fp );

          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_herb_table: # not found.", 0 );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "HERB"      ) )
            {
              if ( top_herb >= MAX_HERB )
                {
                  bug( "load_herb_table: more herbs than MAX_HERB %d", MAX_HERB );
                  fclose( fp );
                  return;
                }

              herb_table[top_herb++] = fread_skill( fp );

              if ( herb_table[top_herb-1]->slot == 0 )
		{
		  herb_table[top_herb-1]->slot = top_herb-1;
		}

              continue;
            }
          else if ( !str_cmp( word, "END"  ) )
	    {
	      break;
	    }
	  else
	    {
	      bug( "Load_herb_table: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      bug( "Cannot open herbs.dat", 0 );
      exit(0);
    }
}

void fread_social( FILE *fp )
{
  SOCIALTYPE *social = NULL;

  CREATE( social, SOCIALTYPE, 1 );

  for ( ;; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = false;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = true;
          fread_to_eol( fp );
          break;

        case 'C':
          KEY( "CharNoArg",     social->char_no_arg,    fread_string_nohash(fp) );
          KEY( "CharFound",     social->char_found,     fread_string_nohash(fp) );
          KEY( "CharAuto",      social->char_auto,      fread_string_nohash(fp) );
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              if ( !social->name )
                {
                  bug( "Fread_social: Name not found" );
                  free_social( social );
                  return;
                }

              if ( !social->char_no_arg )
                {
                  bug( "Fread_social: CharNoArg not found" );
                  free_social( social );
                  return;
                }

              add_social( social );
              return;
            }
          break;

        case 'N':
          KEY( "Name",  social->name,           fread_string_nohash(fp) );
          break;

        case 'O':
          KEY( "OthersNoArg",   social->others_no_arg,  fread_string_nohash(fp) );
          KEY( "OthersFound",   social->others_found,   fread_string_nohash(fp) );
          KEY( "OthersAuto",    social->others_auto,    fread_string_nohash(fp) );
          break;

        case 'V':
          KEY( "VictFound",     social->vict_found,     fread_string_nohash(fp) );
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_social: no match: %s", word );
        }
    }
}

void load_socials()
{
  FILE *fp = NULL;

  if ( ( fp = fopen( SOCIAL_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = fread_letter( fp );

          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_socials: # not found." );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "SOCIAL" ) )
            {
              fread_social( fp );
              continue;
            }
          else if ( !str_cmp( word, "END" ) )
	    {
	      break;
	    }
	  else
	    {
	      bug( "Load_socials: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      bug( "Cannot open socials.dat", 0 );
      exit(0);
    }
}

void fread_command( FILE *fp )
{
  CMDTYPE *command = NULL;

  CREATE( command, CMDTYPE, 1 );

  for ( ;; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = false;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = true;
          fread_to_eol( fp );
          break;

        case 'C':
	  if( !str_cmp( "Code", word ) )
	    {
	      const char *symbol_name = fread_word( fp );

	      command->do_fun = skill_function( symbol_name );
	      fMatch = true;

	      if( command->do_fun != skill_notfound )
		{
		  command->fun_name = str_dup( symbol_name );
		}
	      else
		{
		  command->fun_name = str_dup( "" );
		}

	      break;
	    }
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              if ( !command->name )
                {
                  bug( "Fread_command: Name not found", 0 );
                  free_command( command );
                  return;
                }

              if ( !command->do_fun )
                {
                  bug( "Fread_command: Function not found", 0 );
                  free_command( command );
                  return;
                }

              add_command( command );
              return;
            }
          break;

        case 'L':
          KEY( "Level", command->level,         fread_number(fp) );
          KEY( "Log",           command->log,           fread_number(fp) );
          break;

        case 'N':
          KEY( "Name",  command->name,          fread_string_nohash(fp) );
          break;

        case 'P':
          KEY( "Position",      command->position,      fread_number(fp) );
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_command: no match: %s", word );
        }
    }
}

void load_commands()
{
  FILE *fp = NULL;

  if ( ( fp = fopen( COMMAND_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
	  const char *word = NULL;
          char letter = fread_letter( fp );

          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_commands: # not found." );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "COMMAND" ) )
            {
              fread_command( fp );
              continue;
            }
          else if ( !str_cmp( word, "END" ) )
	    {
              break;
	    }
	  else
	    {
	      bug( "Load_commands: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      bug( "Cannot open commands.dat" );
      exit(0);
    }
}
