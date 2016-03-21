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

Skill *skill_table[MAX_SKILL];
Skill *herb_table[MAX_HERB];

#ifdef SWRIP_USE_DLSYM

SpellFun *GetSpellFunction( const char *name )
{
#ifdef _WIN32
  SpellFun *fun_handle = (SpellFun*) GetProcAddress( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, GetLastError() );
      return spell_notfound;
    }
#else
  SpellFun *fun_handle = (SpellFun*)(long)dlsym( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, dlerror() );
      return spell_notfound;
    }
#endif

  return fun_handle;
}

CmdFun *GetSkillFunction( const char *name )
{
#ifdef _WIN32
  CmdFun *fun_handle = (CmdFun*) GetProcAddress( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, GetLastError() );
      return skill_notfound;
    }
#else
  CmdFun *fun_handle = (CmdFun*)(long)dlsym( sysdata.dl_handle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, dlerror() );
      return skill_notfound;
    }
#endif

  return fun_handle;
}

#else

typedef struct spell_fun_entry
{
  const char *fun_name;
  SpellFun *fun_ptr;
} SpellFun_ENTRY;

static const SpellFun_ENTRY spell_fun_table[] = {
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

SpellFun *GetSpellFunction( const char *name )
{
  SpellFun *fun_ptr = spell_notfound;
  size_t i = 0;

  for( i = 0; i < spell_fun_table_size(); ++i )
    {
      if( !StrCmp( name, spell_fun_table[ i ].fun_name ) )
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
  CmdFun *fun_ptr;
} CmdFun_ENTRY;

static const CmdFun_ENTRY command_fun_table[] = {
  { "do_aassign", do_aassign }
}

      if ( !StrCmp( name, "do_aassign" ))              return do_aassign;
      if ( !StrCmp( name, "do_addbounty" ))          return do_addbounty;
      if ( !StrCmp( name, "do_addresident" ))  return do_addresident;
      if ( !StrCmp( name, "do_addsalary" ))            return do_addsalary;
      if ( !StrCmp( name, "do_addpilot" ))             return do_addpilot;
      if ( !StrCmp( name, "do_add_patrol" ))   return do_add_patrol;
      if ( !StrCmp( name, "do_adjusttractorbeam" ))    return do_adjusttractorbeam;
      if ( !StrCmp( name, "do_accelerate" ))         return do_accelerate;
      if ( !StrCmp( name, "do_accept" ))             return do_accept;
      if ( !StrCmp( name, "do_advance" ))              return do_advance;
      if ( !StrCmp( name, "do_affected" ))             return do_affected;
      if ( !StrCmp( name, "do_afk" ))          return do_afk;
      if ( !StrCmp( name, "do_ahall" ))              return do_ahall;
      if ( !StrCmp( name, "do_aid" ))          return do_aid;
      if ( !StrCmp( name, "do_alias" ))                return do_alias;
      if ( !StrCmp( name, "do_allclantalk" ))  return do_allclantalk;
      if ( !StrCmp( name, "do_allow" ))                return do_allow;
      if ( !StrCmp( name, "do_allships" ))             return do_allships;
      if ( !StrCmp( name, "do_allspeeders" ))  return do_allspeeders;
      if ( !StrCmp( name, "do_ammo" ))         return do_ammo;
      if ( !StrCmp( name, "do_ansi" ))         return do_ansi;
      if ( !StrCmp( name, "do_answer" ))               return do_answer;
      if ( !StrCmp( name, "do_apply" ))                return do_apply;
      if ( !StrCmp( name, "do_appraise" ))             return do_appraise;
      if ( !StrCmp( name, "do_appoint" ))              return do_appoint;
      if ( !StrCmp( name, "do_areas" ))                return do_areas;
      if ( !StrCmp( name, "do_arena" ))              return do_arena;
      if ( !StrCmp( name, "do_arm" ))          return do_arm;
      if ( !StrCmp( name, "do_aset" ))         return do_aset;
      if ( !StrCmp( name, "do_ask" ))          return do_ask;
      if ( !StrCmp( name, "do_astat" ))                return do_astat;
      if ( !StrCmp( name, "do_at" ))                   return do_at;
      if ( !StrCmp( name, "do_auction" ))              return do_auction;
      if ( !StrCmp( name, "do_authorize" ))            return do_authorize;
      if ( !StrCmp( name, "do_autorecharge" ))       return do_autorecharge;
      if ( !StrCmp( name, "do_autotrack"))           return do_autotrack;
      if ( !StrCmp( name, "do_autopilot"))           return do_autopilot;
      if ( !StrCmp( name, "do_avtalk" ))               return do_avtalk;
      if ( !StrCmp( name, "do_awho" ))               return do_awho;
      break;
    case 'b':
      if ( !StrCmp( name, "do_backstab" ))             return do_backstab;
      if ( !StrCmp( name, "do_badname" ))           return do_badname;
      if ( !StrCmp( name, "do_balzhur" ))              return do_balzhur;
      if ( !StrCmp( name, "do_bamfin" ))               return do_bamfin;
      if ( !StrCmp( name, "do_bamfout" ))              return do_bamfout;
      if ( !StrCmp( name, "do_ban" ))          return do_ban;
      if ( !StrCmp( name, "do_bank" ))         return do_bank;
      if ( !StrCmp( name, "do_bash" ))         return do_bash;
      if ( !StrCmp( name, "do_bashdoor" ))             return do_bashdoor;
      if ( !StrCmp( name, "do_beep" ))               return do_beep;
      if ( !StrCmp( name, "do_beg" ))                return do_beg;
      if ( !StrCmp( name, "do_berserk" ))              return do_berserk;
      if ( !StrCmp( name, "do_bestow" ))               return do_bestow;
      if ( !StrCmp( name, "do_bestowarea" ))           return do_bestowarea;
      if ( !StrCmp( name, "do_bet" ))                return do_bet;
      if ( !StrCmp( name, "do_bind" ))         return do_bind;
      if ( !StrCmp( name, "do_bio" ))          return do_bio;
      if ( !StrCmp( name, "do_board" ))              return do_board;
      if ( !StrCmp( name, "do_boards" ))               return do_boards;
      if ( !StrCmp( name, "do_bodybag" ))              return do_bodybag;
      if ( !StrCmp( name, "do_bomb" ))         return do_bomb;
      if ( !StrCmp( name, "do_bounties" ))             return do_bounties;
      if ( !StrCmp( name, "do_brandish" ))             return do_brandish;
      if ( !StrCmp( name, "do_brew" ))         return do_brew;
      if ( !StrCmp( name, "do_bribe" ))                return do_bribe;
      if ( !StrCmp( name, "do_bset" ))         return do_bset;
      if ( !StrCmp( name, "do_bstat" ))                return do_bstat;
      if ( !StrCmp( name, "do_bug" ))          return do_bug;
      if ( !StrCmp( name, "do_bury" ))         return do_bury;
      if ( !StrCmp( name, "do_buy" ))          return do_buy;
      if ( !StrCmp( name, "do_buyhome" ))            return do_buyhome;
      if ( !StrCmp( name, "do_buyship" ))            return do_buyship;
      if ( !StrCmp( name, "do_buyvendor" ))            return do_buyvendor;
      if ( !StrCmp( name, "do_buzz" ))         return do_buzz;
      break;
    case 'c':
      if ( !StrCmp( name, "do_calculate" ))          return do_calculate;
      if ( !StrCmp( name, "do_calculate_diff" ))     return do_calculate_diff;
      if ( !StrCmp( name, "do_capture" ))            return do_capture;
      if ( !StrCmp( name, "do_cast" ))         return do_cast;
      if ( !StrCmp( name, "do_cedit" ))                return do_cedit;
      if ( !StrCmp( name, "do_chaff" ))                return do_chaff;
      if ( !StrCmp( name, "do_challenge" ))          return do_challenge;
      if ( !StrCmp( name, "do_channels" ))             return do_channels;
      if ( !StrCmp( name, "do_chaos" ))              return do_chaos;
      if ( !StrCmp( name, "do_chat" ))         return do_chat;
      if ( !StrCmp( name, "do_check_vnums" ))  return do_check_vnums;
      if ( !StrCmp( name, "do_circle" ))               return do_circle;
      if ( !StrCmp( name, "do_clanfunds" ))            return do_clanfunds;
      if ( !StrCmp( name, "do_clans" ))                return do_clans;
      if ( !StrCmp( name, "do_clan_donate" ))  return do_clan_donate;
      if ( !StrCmp( name, "do_clan_withdraw" ))        return do_clan_withdraw;
      if ( !StrCmp( name, "do_clantalk" ))             return do_clantalk;
      if ( !StrCmp( name, "do_clanbuyship" ))        return do_clanbuyship;
      if ( !StrCmp( name, "do_clansellship" ))        return do_clansellship;
      if ( !StrCmp( name, "do_climb" ))                return do_climb;
      if ( !StrCmp( name, "do_close" ))                return do_close;
      if ( !StrCmp( name, "do_clone" ))                return do_clone;
      if ( !StrCmp( name, "do_closebay" ))             return do_closebay;
      if ( !StrCmp( name, "do_closehatch"  ))        return do_closehatch;
      if ( !StrCmp( name, "do_cmdtable" ))             return do_cmdtable;
      if ( !StrCmp( name, "do_collectgold" ))  return do_collectgold;
      if ( !StrCmp( name, "do_commands" ))             return do_commands;
      if ( !StrCmp( name, "do_comment" ))              return do_comment;
      if ( !StrCmp( name, "do_compare" ))              return do_compare;
      if ( !StrCmp( name, "do_config" ))               return do_config;
      if ( !StrCmp( name, "do_consider" ))             return do_consider;
      if ( !StrCmp( name, "do_copyover" ))           return do_copyover;
      if ( !StrCmp( name, "do_copyship" ))             return do_copyship;
      if ( !StrCmp( name, "do_credits" ))              return do_credits;
      if ( !StrCmp( name, "do_cset" ))         return do_cset;
      if ( !StrCmp( name, "do_cutdoor" ))              return do_cutdoor;
      break;
    case 'd':
      if ( !StrCmp( name, "do_decline" ))            return do_decline;
      if ( !StrCmp( name, "do_delay" ))                return do_delay;
      if ( !StrCmp( name, "do_demote" ))               return do_demote;
      if ( !StrCmp( name, "do_deny" ))         return do_deny;
      if ( !StrCmp( name, "do_description" ))  return do_description;
      if ( !StrCmp( name, "do_destro" ))               return do_destro;
      if ( !StrCmp( name, "do_destroy" ))              return do_destroy;
      if ( !StrCmp( name, "do_detrap" ))               return do_detrap;
      if ( !StrCmp( name, "do_diagnose" ))             return do_diagnose;
      if ( !StrCmp( name, "do_dig" ))          return do_dig;
      if ( !StrCmp( name, "do_disarm" ))               return do_disarm;
      if ( !StrCmp( name, "do_disconnect" ))           return do_disconnect;
      if ( !StrCmp( name, "do_disguise" ))           return do_disguise;
      if ( !StrCmp( name, "do_dismount" ))             return do_dismount;
      if ( !StrCmp( name, "do_dismiss" ))              return do_dismiss;
      if ( !StrCmp( name, "do_dmesg" ))                return do_dmesg;
      if ( !StrCmp( name, "do_dock" ))         return do_dock;
      if ( !StrCmp( name, "do_down" ))         return do_down;
      if ( !StrCmp( name, "do_drag" ))         return do_drag;
      if ( !StrCmp( name, "do_draw" ))         return do_draw;
      if ( !StrCmp( name, "do_drink" ))                return do_drink;
      if ( !StrCmp( name, "do_drive" ))                return do_drive;
      if ( !StrCmp( name, "do_drop" ))         return do_drop;
      break;
    case 'e':
      if ( !StrCmp( name, "do_east" ))         return do_east;
      if ( !StrCmp( name, "do_eat" ))          return do_eat;
      if ( !StrCmp( name, "do_echo" ))         return do_echo;
      if ( !StrCmp( name, "do_elite_guard" ))  return do_elite_guard;
      if ( !StrCmp( name, "do_emote" ))                return do_emote;
      if ( !StrCmp( name, "do_empty" ))                return do_empty;
      if ( !StrCmp( name, "do_empower" ))              return do_empower;
      if ( !StrCmp( name, "do_enlist" ))               return do_enlist;
      if ( !StrCmp( name, "do_enter" ))                return do_enter;
      if ( !StrCmp( name, "do_equipment" ))            return do_equipment;
      if ( !StrCmp( name, "do_examine" ))              return do_examine;
      if ( !StrCmp( name, "do_exits" ))                return do_exits;
      break;
    case 'f':
      if ( !StrCmp( name, "do_feed" ))         return do_feed;
      if ( !StrCmp( name, "do_fill" ))         return do_fill;
      if ( !StrCmp( name, "do_findserin" ))            return do_findserin;
      if ( !StrCmp( name, "do_fire" ))               return do_fire;
      if ( !StrCmp( name, "do_first_aid" ))          return do_first_aid;
      if ( !StrCmp( name, "do_fixchar" ))              return do_fixchar;
      if ( !StrCmp( name, "do_flee" ))         return do_flee;
      if ( !StrCmp( name, "do_fly" ))          return do_fly;
      if ( !StrCmp( name, "do_focusalias" ))           return do_focusalias;
      if ( !StrCmp( name, "do_foldarea" ))             return do_foldarea;
      if ( !StrCmp( name, "do_follow" ))               return do_follow;
      if ( !StrCmp( name, "do_for" ))          return do_for;
      if ( !StrCmp( name, "do_force" ))                return do_force;
      if ( !StrCmp( name, "do_forceclose" ))           return do_forceclose;
      if ( !StrCmp( name, "do_form_password" ))        return do_form_password;
      if ( !StrCmp( name, "do_fuel" ))         return do_fuel;
      if ( !StrCmp( name, "do_fquit" ))                return do_fquit;
      if ( !StrCmp( name, "do_freeze" ))               return do_freeze;
      break;
    case 'g':
      if ( !StrCmp( name, "do_gather_intelligence" )) return do_gather_intelligence;
      if ( !StrCmp( name, "do_get" ))          return do_get;
      if ( !StrCmp( name, "do_gemcutting" ))           return do_gemcutting;
      if ( !StrCmp( name, "do_give" ))         return do_give;
      if ( !StrCmp( name, "do_glance" ))               return do_glance;
      if ( !StrCmp( name, "do_gold" ))               return do_gold;
      if ( !StrCmp( name, "do_goto" ))         return do_goto;
      if ( !StrCmp( name, "do_gouge" ))                return do_gouge;
      if ( !StrCmp( name, "do_group" ))                return do_group;
      if ( !StrCmp( name, "do_grub" ))         return do_grub;
      if ( !StrCmp( name, "do_gtell" ))                return do_gtell;
      if ( !StrCmp( name, "do_guard" ))                return do_guard;
      break;
    case 'h':
      if ( !StrCmp( name, "do_hail" ))         return do_hail;
      if ( !StrCmp( name, "do_hedit" ))                return do_hedit;
      if ( !StrCmp( name, "do_hell" ))         return do_hell;
      if ( !StrCmp( name, "do_help" ))         return do_help;
      if ( !StrCmp( name, "do_hide" ))         return do_hide;
      if ( !StrCmp( name, "do_hijack" ))               return do_hijack;
      if ( !StrCmp( name, "do_hitall" ))               return do_hitall;
      if ( !StrCmp( name, "do_hlist" ))                return do_hlist;
      if ( !StrCmp( name, "do_holylight" ))            return do_holylight;
      if ( !StrCmp( name, "do_homepage" ))             return do_homepage;
      if ( !StrCmp( name, "do_hset" ))         return do_hset;
      if ( !StrCmp( name, "do_hyperspace" ))         return do_hyperspace;
      break;
    case 'i':
      if ( !StrCmp( name, "do_i103" ))         return do_i103;
      if ( !StrCmp( name, "do_i104" ))         return do_i104;
      if ( !StrCmp( name, "do_i105" ))         return do_i105;
      if ( !StrCmp( name, "do_ide" ))          return do_ide;
      if ( !StrCmp( name, "do_idea" ))         return do_idea;
      if ( !StrCmp( name, "do_immortalize" ))  return do_immortalize;
      if ( !StrCmp( name, "do_immtalk" ))              return do_immtalk;
      if ( !StrCmp( name, "do_info" ))               return do_info;
      if ( !StrCmp( name, "do_induct" ))               return do_induct;
      if ( !StrCmp( name, "do_installarea" ))  return do_installarea;
      if ( !StrCmp( name, "do_InstallRoom" ))            return do_InstallRoom;
      if ( !StrCmp( name, "do_instazone" ))            return do_instazone;
      if ( !StrCmp( name, "do_inventory" ))            return do_inventory;
      if ( !StrCmp( name, "do_invis" ))                return do_invis;
      if ( !StrCmp( name, "do_invite" ))               return do_invite;
      break;
    case 'j':
      if ( !StrCmp( name, "do_jumpvector" ))   return do_jumpvector;
      if ( !StrCmp( name, "do_jail" ))                 return do_jail;
      break;
    case 'k':
      if ( !StrCmp( name, "do_kick" ))         return do_kick;
      if ( !StrCmp( name, "do_kill" ))         return do_kill;
      break;
    case 'l':
      if ( !StrCmp( name, "do_languages" ))            return do_languages;
      if ( !StrCmp( name, "do_last" ))         return do_last;
      if ( !StrCmp( name, "do_land"))                return do_land;
      if ( !StrCmp( name, "do_launch"))              return do_launch;
      if ( !StrCmp( name, "do_leave" ))                return do_leave;
      if ( !StrCmp( name, "do_leaveship" ))            return do_leaveship;
      if ( !StrCmp( name, "do_level" ))                return do_level;
      if ( !StrCmp( name, "do_light" ))                return do_light;
      if ( !StrCmp( name, "do_list" ))         return do_list;
      if ( !StrCmp( name, "do_litterbug" ))            return do_litterbug;
      if ( !StrCmp( name, "do_loadarea" ))             return do_loadarea;
      if ( !StrCmp( name, "do_loadup" ))               return do_loadup;
      if ( !StrCmp( name, "do_lock" ))         return do_lock;
      if ( !StrCmp( name, "do_log" ))          return do_log;
      if ( !StrCmp( name, "do_look" ))         return do_look;
      if ( !StrCmp( name, "do_low_purge" ))            return do_low_purge;
      break;
    case 'm':
      if ( !StrCmp( name, "do_mailroom" ))             return do_mailroom;
      if ( !StrCmp( name, "do_make" ))         return do_make;
      if ( !StrCmp( name, "do_makearmor" ))            return do_makearmor;
      if ( !StrCmp( name, "do_makeblade" ))          return do_makeblade;
      if ( !StrCmp( name, "do_makeblaster" ))        return do_makeblaster;
      if ( !StrCmp( name, "do_makebowcaster" ))      return do_makebowcaster;
      if ( !StrCmp( name, "do_makedisguise" ))           return do_makedisguise;
      if ( !StrCmp( name, "do_makelightsaber" ))     return do_makelightsaber;
      if ( !StrCmp( name, "do_makespice" ))          return do_makespice;
      if ( !StrCmp( name, "do_makegrenade" ))  return do_makegrenade;
      if ( !StrCmp( name, "do_makelight" ))            return do_makelight;
      if ( !StrCmp( name, "do_makelandmine" )) return do_makelandmine;
      if ( !StrCmp( name, "do_makecomlink" ))  return do_makecomlink;
      if ( !StrCmp( name, "do_makeshield" ))           return do_makeshield;
      if ( !StrCmp( name, "do_makecontainer" ))        return do_makecontainer;
      if ( !StrCmp( name, "do_makejewelry" ))  return do_makejewelry;
      if ( !StrCmp( name, "do_makeboard" ))            return do_makeboard;
      if ( !StrCmp( name, "do_makeclan" ))             return do_makeclan;
      if ( !StrCmp( name, "do_makemissile" ))  return do_makemissile;
      if ( !StrCmp( name, "do_makeship" ))           return do_makeship;
      if ( !StrCmp( name, "do_makerepair" ))           return do_makerepair;
      if ( !StrCmp( name, "do_makeshop" ))             return do_makeshop;
      if ( !StrCmp( name, "do_makespaceobject" ))     return do_makespaceobject;
      if ( !StrCmp( name, "do_makewizlist" ))  return do_makewizlist;
      if ( !StrCmp( name, "do_makeplanet" ))           return do_makeplanet;
      if ( !StrCmp( name, "do_massign" ))              return do_massign;
      if ( !StrCmp( name, "do_mass_propaganda" ))      return do_mass_propaganda;
      if ( !StrCmp( name, "do_mcreate" ))              return do_mcreate;
      if ( !StrCmp( name, "do_memory" ))               return do_memory;
      if ( !StrCmp( name, "do_members" ))              return do_members;
      if ( !StrCmp( name, "do_mfind" ))                return do_mfind;
      if ( !StrCmp( name, "do_minvoke" ))              return do_minvoke;
      if ( !StrCmp( name, "do_mine" ))         return do_mine;
      if ( !StrCmp( name, "do_mlist" ))                return do_mlist;
      if ( !StrCmp( name, "do_mortalize" ))            return do_mortalize;
      if ( !StrCmp( name, "do_mount" ))                return do_mount;
      if ( !StrCmp( name, "do_mp_close_passage" ))     return do_mp_close_passage;
      if ( !StrCmp( name, "do_mp_damage" ))            return do_mp_damage;
      if ( !StrCmp( name, "do_mp_deposit" ))           return do_mp_deposit;
      if ( !StrCmp( name, "do_mp_open_passage" ))      return do_mp_open_passage;
      if ( !StrCmp( name, "do_mp_practice" ))  return do_mp_practice;
      if ( !StrCmp( name, "do_mp_restore" ))           return do_mp_restore;
      if ( !StrCmp( name, "do_mp_slay" ))              return do_mp_slay;
      if ( !StrCmp( name, "do_mp_withdraw" ))  return do_mp_withdraw;
      if ( !StrCmp( name, "do_mpadvance" ))            return do_mpadvance;
      if ( !StrCmp( name, "do_mpapply" ))              return do_mpapply;
      if ( !StrCmp( name, "do_mpapplyb" ))             return do_mpapplyb;
      if ( !StrCmp( name, "do_mpasound" ))             return do_mpasound;
      if ( !StrCmp( name, "do_mpat" ))         return do_mpat;
      if ( !StrCmp( name, "do_mpdream" ))              return do_mpdream;
      if ( !StrCmp( name, "do_mpecho" ))               return do_mpecho;
      if ( !StrCmp( name, "do_mpechoaround" )) return do_mpechoaround;
      if ( !StrCmp( name, "do_mpechoat" ))             return do_mpechoat;
      if ( !StrCmp( name, "do_EditMobProg" ))               return do_EditMobProg;
      if ( !StrCmp( name, "do_mpfind" ))               return do_mpfind;
      if ( !StrCmp( name, "do_mpgain" ))               return do_mpgain;
      if ( !StrCmp( name, "do_mpforce" ))              return do_mpforce;
      if ( !StrCmp( name, "do_mpgoto" ))               return do_mpgoto;
      if ( !StrCmp( name, "do_mpinvis" ))              return do_mpinvis;
      if ( !StrCmp( name, "do_mpjunk" ))               return do_mpjunk;
      if ( !StrCmp( name, "do_mpkill" ))               return do_mpkill;
      if ( !StrCmp( name, "do_mpmload" ))              return do_mpmload;
      if ( !StrCmp( name, "do_mpnothing" ))            return do_mpnothing;
      if ( !StrCmp( name, "do_mpoload" ))              return do_mpoload;
      if ( !StrCmp( name, "do_mppkset" ))              return do_mppkset;
      if ( !StrCmp( name, "do_mppurge" ))              return do_mppurge;
      if ( !StrCmp( name, "do_mpstat" ))               return do_mpstat;
      if ( !StrCmp( name, "do_mptransfer" ))           return do_mptransfer;
      if ( !StrCmp( name, "do_mrange" ))               return do_mrange;
      if ( !StrCmp( name, "do_mset" ))         return do_mset;
      if ( !StrCmp( name, "do_mstat" ))                return do_mstat;
      if ( !StrCmp( name, "do_murde" ))                return do_murde;
      if ( !StrCmp( name, "do_murder" ))               return do_murder;
      if ( !StrCmp( name, "do_music" ))                return do_music;
      if ( !StrCmp( name, "do_mwhere" ))               return do_mwhere;
      break;
    case 'n':
      if ( !StrCmp( name, "do_name" ))         return do_name;
      if ( !StrCmp( name, "do_newbiechat" ))           return do_newbiechat;
      if ( !StrCmp( name, "do_newbieset" ))            return do_newbieset;
      if ( !StrCmp( name, "do_newzones" ))             return do_newzones;
      if ( !StrCmp( name, "do_noemote" ))              return do_noemote;
      if ( !StrCmp( name, "do_nohelps" ))              return do_nohelps;
      if ( !StrCmp( name, "do_noresolve" ))            return do_noresolve;
      if ( !StrCmp( name, "do_north" ))                return do_north;
      if ( !StrCmp( name, "do_northeast" ))            return do_northeast;
      if ( !StrCmp( name, "do_northwest" ))            return do_northwest;
      if ( !StrCmp( name, "do_notell" ))               return do_notell;
      if ( !StrCmp( name, "do_notitle" ))            return do_notitle;
      if ( !StrCmp( name, "do_noteroom" ))             return do_noteroom;
      break;
    case 'o':
      if ( !StrCmp( name, "do_oassign" ))              return do_oassign;
      if ( !StrCmp( name, "do_ocreate" ))              return do_ocreate;
      if ( !StrCmp( name, "do_ofind" ))                return do_ofind;
      if ( !StrCmp( name, "do_ogrub" ))                return do_ogrub;
      if ( !StrCmp( name, "do_oinvoke" ))              return do_oinvoke;
      if ( !StrCmp( name, "do_oldscore" ))             return do_oldscore;
      if ( !StrCmp( name, "do_olist" ))                return do_olist;
      if ( !StrCmp( name, "do_ooc" ))          return do_ooc;
      if ( !StrCmp( name, "do_opedit" ))               return do_opedit;
      if ( !StrCmp( name, "do_opfind" ))               return do_opfind;
      if ( !StrCmp( name, "do_open" ))         return do_open;
      if ( !StrCmp( name, "do_openbay" ))              return do_openbay;
      if ( !StrCmp( name, "do_openhatch" ))          return do_openhatch;
      /*        if ( !StrCmp( name, "do_opentourney" ))        return do_opentourney; */
      if ( !StrCmp( name, "do_opstat" ))               return do_opstat;
      if ( !StrCmp( name, "do_orange" ))               return do_orange;
      if ( !StrCmp( name, "do_order" ))                return do_order;
      if ( !StrCmp( name, "do_oset" ))         return do_oset;
      if ( !StrCmp( name, "do_ostat" ))                return do_ostat;
      if ( !StrCmp( name, "do_outcast" ))              return do_outcast;
      if ( !StrCmp( name, "do_override" ))             return do_override;
      if ( !StrCmp( name, "do_owhere" ))               return do_owhere;
      break;
    case 'p':
      if ( !StrCmp( name, "do_pager" ))                return do_pager;
      if ( !StrCmp( name, "do_pardon" ))               return do_pardon;
      if ( !StrCmp( name, "do_password" ))             return do_password;
      if ( !StrCmp( name, "do_peace" ))                return do_peace;
      if ( !StrCmp( name, "do_pick" ))         return do_pick;
      if ( !StrCmp( name, "do_pickshiplock" )) return do_pickshiplock;
      if ( !StrCmp( name, "do_placevendor" ))  return do_placevendor;
      if ( !StrCmp( name, "do_planets" ))              return do_planets;
      if ( !StrCmp( name, "do_pluogus" ))              return do_pluogus;
      if ( !StrCmp( name, "do_poison_weapon" ))        return do_poison_weapon;
      if ( !StrCmp( name, "do_postguard" ))            return do_postguard;
      if ( !StrCmp( name, "do_practice" ))             return do_practice;
      if ( !StrCmp( name, "do_pricevendor" ))  return do_pricevendor;
      if ( !StrCmp( name, "do_prompt" ))               return do_prompt;
      if ( !StrCmp( name, "do_propaganda" ))           return do_propaganda;
      if ( !StrCmp( name, "do_pull" ))         return do_pull;
      if ( !StrCmp( name, "do_punch" ))                return do_punch;
      if ( !StrCmp( name, "do_purge" ))                return do_purge;
      if ( !StrCmp( name, "do_push" ))         return do_push;
      if ( !StrCmp( name, "do_put" ))          return do_put;
      break;
    case 'q':
      if ( !StrCmp( name, "do_quaff" ))                return do_quaff;
      if ( !StrCmp( name, "do_qui" ))          return do_qui;
      if ( !StrCmp( name, "do_quit" ))         return do_quit;
      break;
    case 'r':
      if ( !StrCmp( name, "do_radar" ))                return do_radar;
      if ( !StrCmp( name, "do_rank" ))         return do_rank;
      if ( !StrCmp( name, "do_rassign" ))              return do_rassign;
      if ( !StrCmp( name, "do_rat" ))          return do_rat;
      if ( !StrCmp( name, "do_rdelete" ))              return do_rdelete;
      if ( !StrCmp( name, "do_reboo" ))                return do_reboo;
      if ( !StrCmp( name, "do_reboot" ))               return do_reboot;
      if ( !StrCmp( name, "do_recharge" ))           return do_recharge;
      if ( !StrCmp( name, "do_recho" ))                return do_recho;
      if ( !StrCmp( name, "do_recall" ))              return do_recall;
      if ( !StrCmp( name, "do_recite" ))               return do_recite;
      if ( !StrCmp( name, "do_recite" ))             return do_recite;
      if ( !StrCmp( name, "do_redit" ))              return do_redit;
      if ( !StrCmp( name, "do_refuel" ))             return do_refuel;
      if ( !StrCmp( name, "do_reinforcements" ))       return do_reinforcements;
      if ( !StrCmp( name, "do_regoto" ))               return do_regoto;
      if ( !StrCmp( name, "do_reload" ))               return do_reload;
      if ( !StrCmp( name, "do_rembounty" ))          return do_rembounty;
      if ( !StrCmp( name, "do_remove" ))               return do_remove;
      if ( !StrCmp( name, "do_rempilot" ))           return do_rempilot;
      if ( !StrCmp( name, "do_remresident" ))  return do_remresident;
      if ( !StrCmp( name, "do_renameship" ))           return do_renameship;
      if ( !StrCmp( name, "do_rent" ))         return do_rent;
      if ( !StrCmp( name, "do_repair" ))               return do_repair;
      if ( !StrCmp( name, "do_repairset" ))            return do_repairset;
      if ( !StrCmp( name, "do_repairship" ))         return do_repairship;
      if ( !StrCmp( name, "do_repairshops" ))  return do_repairshops;
      if ( !StrCmp( name, "do_repairstat" ))           return do_repairstat;
      if ( !StrCmp( name, "do_reply" ))                return do_reply;
      if ( !StrCmp( name, "do_report" ))               return do_report;
      if ( !StrCmp( name, "do_request"))               return do_request;
      if ( !StrCmp( name, "do_rescue" ))               return do_rescue;
      if ( !StrCmp( name, "do_reset" ))                return do_reset;
      if ( !StrCmp( name, "do_ResetShip" ))            return do_ResetShip;
      if ( !StrCmp( name, "do_resign" ))               return do_resign;
      if ( !StrCmp( name, "do_rest" ))         return do_rest;
      if ( !StrCmp( name, "do_restore" ))              return do_restore;
      if ( !StrCmp( name, "do_restoretime" ))  return do_restoretime;
      if ( !StrCmp( name, "do_restrict" ))             return do_restrict;
      if ( !StrCmp( name, "do_retire" ))               return do_retire;
      if ( !StrCmp( name, "do_retran" ))               return do_retran;
      if ( !StrCmp( name, "do_return" ))               return do_return;
      if ( !StrCmp( name, "do_revert" ))               return do_revert;
      if ( !StrCmp( name, "do_rgrub" ))                return do_rgrub;
      if ( !StrCmp( name, "do_rlist" ))                return do_rlist;
      if ( !StrCmp( name, "do_roster" ))             return do_roster;
      if ( !StrCmp( name, "do_EditRoomProg" ))               return do_EditRoomProg;
      if ( !StrCmp( name, "do_rpfind" ))               return do_rpfind;
      if ( !StrCmp( name, "do_rpstat" ))               return do_rpstat;
      if ( !StrCmp( name, "do_rreset" ))               return do_rreset;
      if ( !StrCmp( name, "do_rset" ))         return do_rset;
      if ( !StrCmp( name, "do_rstat" ))                return do_rstat;
      break;
    case 's':
      if ( !StrCmp( name, "do_sacrifice" ))            return do_sacrifice;
      if ( !StrCmp( name, "do_save" ))         return do_save;
      if ( !StrCmp( name, "do_savearea" ))             return do_savearea;
      if ( !StrCmp( name, "do_say" ))          return do_say;
      if ( !StrCmp( name, "do_sabotage" ))             return do_sabotage;
      if ( !StrCmp( name, "do_scan" ))         return do_scan;
      if ( !StrCmp( name, "do_scatter" ))              return do_scatter;
      if ( !StrCmp( name, "do_score" ))                return do_score;
      if ( !StrCmp( name, "do_search" ))               return do_search;
      if ( !StrCmp( name, "do_sedit" ))                return do_sedit;
      if ( !StrCmp( name, "do_seduce" ))               return do_seduce;
      if ( !StrCmp( name, "do_sell" ))         return do_sell;
      if ( !StrCmp( name, "do_sellship" ))           return do_sellship;
      if ( !StrCmp( name, "do_setblaster" ))           return do_setblaster;
      if ( !StrCmp( name, "do_sellhome" ))             return do_sellhome;
      if ( !StrCmp( name, "do_set_boot_time" ))        return do_set_boot_time;
      if ( !StrCmp( name, "do_setclan" ))              return do_setclan;
      if ( !StrCmp( name, "do_setship" ))            return do_setship;
      if ( !StrCmp( name, "do_setspaceobject" ))      return do_setspaceobject;
      if ( !StrCmp( name, "do_setplanet" ))            return do_setplanet;
      if ( !StrCmp( name, "do_ships" ))              return do_ships;
      if ( !StrCmp( name, "do_shiptrack" ))          return do_shiptrack;
      if ( !StrCmp( name, "do_shops" ))                return do_shops;
      if ( !StrCmp( name, "do_shopset" ))              return do_shopset;
      if ( !StrCmp( name, "do_shopstat" ))             return do_shopstat;
      if ( !StrCmp( name, "do_shout" ))                return do_shout;
      if ( !StrCmp( name, "do_shove" ))                return do_shove;
      if ( !StrCmp( name, "do_showclan" ))             return do_showclan;
      if ( !StrCmp( name, "do_showlayers" ))           return do_showlayers;
      if ( !StrCmp( name, "do_showplanet" ))           return do_showplanet;
      if ( !StrCmp( name, "do_showship" ))           return do_showship;
      if ( !StrCmp( name, "do_showspaceobject" ))     return do_showspaceobject;
      if ( !StrCmp( name, "do_showstatistic" ))     return do_showstatistic;
      if ( !StrCmp( name, "do_shutdow" ))              return do_shutdow;
      if ( !StrCmp( name, "do_shutdown" ))             return do_shutdown;
      if ( !StrCmp( name, "do_silence" ))              return do_silence;
      if ( !StrCmp( name, "do_sit" ))          return do_sit;
      if ( !StrCmp( name, "do_skin" ))         return do_skin;
      if ( !StrCmp( name, "do_sla" ))          return do_sla;
      if ( !StrCmp( name, "do_slay" ))         return do_slay;
      if ( !StrCmp( name, "do_sleep" ))                return do_sleep;
      if ( !StrCmp( name, "do_slice" ))                return do_slice;
      if ( !StrCmp( name, "do_slist" ))                return do_slist;
      if ( !StrCmp( name, "do_slookup" ))              return do_slookup;
      if ( !StrCmp( name, "do_smalltalk" ))            return do_smalltalk;
      if ( !StrCmp( name, "do_smoke" ))                return do_smoke;
      if ( !StrCmp( name, "do_snipe" ))                return do_snipe;
      if ( !StrCmp( name, "do_snoop" ))                return do_snoop;
      if ( !StrCmp( name, "do_sober" ))                return do_sober;
      if ( !StrCmp( name, "do_socials" ))              return do_socials;
      if ( !StrCmp( name, "do_south" ))                return do_south;
      if ( !StrCmp( name, "do_southeast" ))            return do_southeast;
      if ( !StrCmp( name, "do_southwest" ))            return do_southwest;
      if ( !StrCmp( name, "do_speak" ))                return do_speak;
      if ( !StrCmp( name, "do_speeders" ))             return do_speeders;
      if ( !StrCmp( name, "do_split" ))                return do_split;
      if ( !StrCmp( name, "do_sset" ))         return do_sset;
      if ( !StrCmp( name, "do_stand" ))                return do_stand;
      if ( !StrCmp( name, "do_spaceobjects" ))        return do_spaceobjects;
      if ( !StrCmp( name, "do_status" ))             return do_status;
      if ( !StrCmp( name, "do_steal" ))                return do_steal;
      if ( !StrCmp( name, "do_study" ))                return do_study;
      if ( !StrCmp( name, "do_stun" ))         return do_stun;
      if ( !StrCmp( name, "do_switch" ))               return do_switch;
      if ( !StrCmp( name, "do_shiptalk" ))             return do_shiptalk;
      if ( !StrCmp( name, "do_spacetalk" ))            return do_spacetalk;
      if ( !StrCmp( name, "do_special_forces" ))       return do_special_forces;
      if ( !StrCmp( name, "do_suicide" ))              return do_suicide;
      if ( !StrCmp( name, "do_systemtalk" ))           return do_systemtalk;
      break;
    case 't':
      if ( !StrCmp( name, "do_takedrug" ))             return do_takedrug;
      if ( !StrCmp( name, "do_tamp" ))         return do_tamp;
      if ( !StrCmp( name, "do_target" ))             return do_target;
      if ( !StrCmp( name, "do_teach" ))                return do_teach;
      if ( !StrCmp( name, "do_tell" ))         return do_tell;
      if ( !StrCmp( name, "do_throw" ))                return do_throw;
      if ( !StrCmp( name, "do_time" ))         return do_time;
      if ( !StrCmp( name, "do_timecmd" ))              return do_timecmd;
      if ( !StrCmp( name, "do_title" ))                return do_title;
      if ( !StrCmp( name, "do_torture" ))              return do_torture;
      if ( !StrCmp( name, "do_toplevel" ))             return do_toplevel;
      if ( !StrCmp( name, "do_track" ))                return do_track;
      if ( !StrCmp( name, "do_tractorbeam" ))  return do_tractorbeam;
      if ( !StrCmp( name, "do_train" ))                return do_train;
      if ( !StrCmp( name, "do_trajectory" ))           return do_trajectory;
      if ( !StrCmp( name, "do_trajectory_actual" ))    return do_trajectory_actual;
      if ( !StrCmp( name, "do_transfer" ))             return do_transfer;
      if ( !StrCmp( name, "do_TransferShip" ))            return do_TransferShip;
      if ( !StrCmp( name, "do_trust" ))                return do_trust;
      if ( !StrCmp( name, "do_typo" ))         return do_typo;
      break;
    case 'u':
      if ( !StrCmp( name, "do_unfocusalias" )) return do_unfocusalias;
      if ( !StrCmp( name, "do_unfoldarea" ))           return do_unfoldarea;
      if ( !StrCmp( name, "do_unhell" ))               return do_unhell;
      if ( !StrCmp( name, "do_undock" ))               return do_undock;
      if ( !StrCmp( name, "do_unjail" ))               return do_unjail;
      if ( !StrCmp( name, "do_unlock" ))               return do_unlock;
      if ( !StrCmp( name, "do_unsilence" ))          return do_unsilence;
      if ( !StrCmp( name, "do_up" ))                   return do_up;
      if ( !StrCmp( name, "do_use" ))          return do_use;
      if ( !StrCmp( name, "do_users" ))                return do_users;
      break;
    case 'v':
      if ( !StrCmp( name, "do_value" ))                return do_value;
      if ( !StrCmp( name, "do_vassign" ))            return do_vassign;
      if ( !StrCmp( name, "do_visible" ))              return do_visible;
      if ( !StrCmp( name, "do_viewskills" ))           return do_viewskills;
      if ( !StrCmp( name, "do_vnums" ))                return do_vnums;
      if ( !StrCmp( name, "do_vsearch" ))              return do_vsearch;
      break;
    case 'w':
      if ( !StrCmp( name, "do_wake" ))         return do_wake;
      if ( !StrCmp( name, "do_wartalk" ))              return do_wartalk;
      if ( !StrCmp( name, "do_wear" ))         return do_wear;
      if ( !StrCmp( name, "do_weather" ))              return do_weather;
      if ( !StrCmp( name, "do_west" ))         return do_west;
      if ( !StrCmp( name, "do_where" ))                return do_where;
      if ( !StrCmp( name, "do_who" ))          return do_who;
      if ( !StrCmp( name, "do_whois" ))                return do_whois;
      if ( !StrCmp( name, "do_wimpy" ))                return do_wimpy;
      if ( !StrCmp( name, "do_wizhelp" ))              return do_wizhelp;
      if ( !StrCmp( name, "do_wizlist" ))              return do_wizlist;
      if ( !StrCmp( name, "do_wizlock" ))              return do_wizlock;
      break;
    case 'y':
      if ( !StrCmp( name, "do_yell" ))         return do_yell;
      break;
    case 'z':
      if ( !StrCmp( name, "do_zap" ))          return do_zap;
      if ( !StrCmp( name, "do_zones" ))                return do_zones;

static size_t command_fun_table_size( void )
{
  return sizeof( command_fun_table ) / sizeof( *command_fun_table );
}

CmdFun *GetSkillFunction( const char *name )
{
  CmdFun *fun_ptr = skill_notfound;
  size_t i = 0;

  for( i = 0; i < command_fun_table_size(); ++i )
    {
      if( !StrCmp( name, command_fun_table[ i ].fun_name ) )
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
static int CompareSkills( Skill **sk1, Skill **sk2 )
{
  Skill *skill1 = (*sk1);
  Skill *skill2 = (*sk2);

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
void SortSkillTable( void )
{
  LogPrintf( "Sorting skill table..." );
  qsort( &skill_table[1], top_sn-1, sizeof( Skill * ),
         (int(*)(const void *, const void *)) CompareSkills );
}

/*
 * Write skill data to a file
 */
static void WriteSkill( FILE *fpout, const Skill *skill )
{
  const SmaugAffect *aff = NULL;

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
void SaveSkillTable( void )
{
  int x = 0;
  FILE *fpout = NULL;

  if ( (fpout=fopen( SKILL_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open skills.dat for writting", 0 );
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
      WriteSkill( fpout, skill_table[x] );
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

/*
 * Save the herb table to disk
 */
void SaveHerbTable( void )
{
  int x = 0;
  FILE *fpout = NULL;

  if ( (fpout=fopen( HERB_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open herbs.dat for writting", 0 );
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
      WriteSkill( fpout, herb_table[x] );
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

/*
 * Save the socials to disk
 */
void SaveSocials( void )
{
  FILE *fpout = NULL;
  const Social *social = NULL;
  int x = 0;

  if ( (fpout=fopen( SOCIAL_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open socials.dat for writting", 0 );
      perror( SOCIAL_FILE );
      return;
    }

  for ( x = 0; x < 27; x++ )
    {
      for ( social = social_index[x]; social; social = social->next )
        {
          if ( !social->name || social->name[0] == '\0' )
            {
              Bug( "Save_socials: blank social in hash bucket %d", x );
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
	      Bug( "Save_socials: NULL char_no_arg in hash bucket %d", x );
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

skill_types GetSkillType( const char *skilltype )
{
  if ( !StrCmp( skilltype, "Spell" ) )
    {
      return SKILL_SPELL;
    }

  if ( !StrCmp( skilltype, "Skill" ) )
    {
      return SKILL_SKILL;
    }

  if ( !StrCmp( skilltype, "Weapon" ) )
    {
      return SKILL_WEAPON;
    }

  if ( !StrCmp( skilltype, "Tongue" ) )
    {
      return SKILL_TONGUE;
    }

  if ( !StrCmp( skilltype, "Herb" ) )
    {
      return SKILL_HERB;
    }

  return SKILL_UNKNOWN;
}

static Skill *ReadSkill( FILE *fp )
{
  Skill *skill = NULL;
  AllocateMemory( skill, Skill, 1 );

  skill->guild = -1;

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          KEY( "Alignment",     skill->alignment,       ReadInt( fp ) );

          if ( !StrCmp( word, "Affect" ) )
            {
              SmaugAffect *aff = NULL;

              AllocateMemory( aff, SmaugAffect, 1 );
              aff->duration = CopyString( ReadWord( fp ) );
              aff->location = ReadInt( fp );
              aff->modifier = CopyString( ReadWord( fp ) );
              aff->bitvector = ReadInt( fp );
              aff->next = skill->affects;
              skill->affects = aff;
              fMatch = true;
              break;
            }
          break;

        case 'C':
          if ( !StrCmp( word, "Code" ) )
            {
	      SpellFun *spellfun = NULL;
	      CmdFun *dofun = NULL;
	      const char *w = ReadWord( fp );

	      fMatch = true;

	      if( ( spellfun = GetSpellFunction( w ) ) != spell_notfound
		  && !StringPrefix( "spell_", w ) )
		{
		  skill->spell_fun = spellfun;
		  skill->fun_name = CopyString( w );
		}
	      else if( ( dofun = GetSkillFunction( w ) ) != skill_notfound
		       && !StringPrefix( "do_", w ) )
		{
		  skill->skill_fun = dofun;
		  skill->fun_name = CopyString( w );
		}
	      else
		{
		  Bug( "%s: unknown skill/spell %s", __FUNCTION__, w );
		  skill->fun_name = CopyString( "" );
		}

	      break;
            }

          KEY( "Components",    skill->components,      ReadStringToTilde( fp ) );
          break;

        case 'D':
          KEY( "Dammsg",        skill->noun_damage,     ReadStringToTilde( fp ) );
          KEY( "Dice",  skill->dice,            ReadStringToTilde( fp ) );
          KEY( "Diechar",       skill->die_char,        ReadStringToTilde( fp ) );
          KEY( "Dieroom",       skill->die_room,        ReadStringToTilde( fp ) );
          KEY( "Dievict",       skill->die_vict,        ReadStringToTilde( fp ) );
          KEY( "Difficulty",    skill->difficulty,      ReadInt( fp ) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
	    {
	      return skill;
	    }

          break;

        case 'F':
          KEY( "Flags", skill->flags,           ReadInt( fp ) );
          break;

        case 'G':
          KEY( "Guild", skill->guild,           ReadInt( fp ) );
          break;

        case 'H':
          KEY( "Hitchar",       skill->hit_char,        ReadStringToTilde( fp ) );
          KEY( "Hitroom",       skill->hit_room,        ReadStringToTilde( fp ) );
          KEY( "Hitvict",       skill->hit_vict,        ReadStringToTilde( fp ) );
          break;

        case 'I':
          KEY( "Immchar",       skill->imm_char,        ReadStringToTilde( fp ) );
          KEY( "Immroom",       skill->imm_room,        ReadStringToTilde( fp ) );
          KEY( "Immvict",       skill->imm_vict,        ReadStringToTilde( fp ) );
          break;

        case 'M':
          KEY( "Mana",  skill->min_mana,        ReadInt( fp ) );
          KEY( "Minlevel",      skill->min_level,       ReadInt( fp ) );
          KEY( "Minpos",        skill->minimum_position, ReadInt( fp ) );
          KEY( "Misschar",      skill->miss_char,       ReadStringToTilde( fp ) );
          KEY( "Missroom",      skill->miss_room,       ReadStringToTilde( fp ) );
          KEY( "Missvict",      skill->miss_vict,       ReadStringToTilde( fp ) );
          break;

        case 'N':
          KEY( "Name",  skill->name,            ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "Participants",skill->participants,      ReadInt( fp ) );
          break;

        case 'R':
          KEY( "Rounds",        skill->beats,           ReadInt( fp ) );
          break;

        case 'S':
          KEY( "Slot",  skill->slot,            ReadInt( fp ) );
          KEY( "Saves", skill->saves,           ReadInt( fp ) );
          break;

        case 'T':
          KEY( "Target",        skill->target,          ReadInt( fp ) );
          KEY( "Teachers",      skill->teachers,        ReadStringToTilde( fp ) );
          KEY( "Type",  skill->type,  GetSkillType(ReadWord( fp ))  );
          break;

        case 'V':
          KEY( "Value", skill->value,           ReadInt( fp ) );
          break;

        case 'W':
          KEY( "Wearoff",       skill->msg_off,         ReadStringToTilde( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

void LoadSkillTable( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( SKILL_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_skill_table: # not found.", 0 );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SKILL" ) )
            {
              if ( top_sn >= MAX_SKILL )
                {
                  Bug( "LoadSkillTable: more skills than MAX_SKILL %d", MAX_SKILL );
                  fclose( fp );
                  return;
                }

              skill_table[top_sn++] = ReadSkill( fp );
              continue;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      Bug( "Load_skill_table: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open skills.dat", 0 );
      exit(0);
    }
}

void LoadHerbTable( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( HERB_FILE, "r" ) ) != NULL )
    {
      top_herb = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_herb_table: # not found.", 0 );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "HERB"      ) )
            {
              if ( top_herb >= MAX_HERB )
                {
                  Bug( "LoadHerbTable: more herbs than MAX_HERB %d", MAX_HERB );
                  fclose( fp );
                  return;
                }

              herb_table[top_herb++] = ReadSkill( fp );

              if ( herb_table[top_herb-1]->slot == 0 )
		{
		  herb_table[top_herb-1]->slot = top_herb-1;
		}

              continue;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
	      break;
	    }
	  else
	    {
	      Bug( "Load_herb_table: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open herbs.dat", 0 );
      exit(0);
    }
}

static void ReadSocial( FILE *fp )
{
  Social *social = NULL;

  AllocateMemory( social, Social, 1 );

  for ( ;; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'C':
          KEY( "CharNoArg",     social->char_no_arg,    ReadStringToTilde(fp) );
          KEY( "CharFound",     social->char_found,     ReadStringToTilde(fp) );
          KEY( "CharAuto",      social->char_auto,      ReadStringToTilde(fp) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if ( !social->name )
                {
                  Bug( "%s: Name not found", __FUNCTION__ );
                  FreeSocial( social );
                  return;
                }

              if ( !social->char_no_arg )
                {
                  Bug( "%s: CharNoArg not found", __FUNCTION__ );
                  FreeSocial( social );
                  return;
                }

              AddSocial( social );
              return;
            }
          break;

        case 'N':
          KEY( "Name",  social->name,           ReadStringToTilde(fp) );
          break;

        case 'O':
          KEY( "OthersNoArg",   social->others_no_arg,  ReadStringToTilde(fp) );
          KEY( "OthersFound",   social->others_found,   ReadStringToTilde(fp) );
          KEY( "OthersAuto",    social->others_auto,    ReadStringToTilde(fp) );
          break;

        case 'V':
          KEY( "VictFound",     social->vict_found,     ReadStringToTilde(fp) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

void LoadSocials( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( SOCIAL_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_socials: # not found." );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SOCIAL" ) )
            {
              ReadSocial( fp );
              continue;
            }
          else if ( !StrCmp( word, "END" ) )
	    {
	      break;
	    }
	  else
	    {
	      Bug( "Load_socials: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open socials.dat", 0 );
      exit(0);
    }
}
