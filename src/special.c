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

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"

/*
 * The following special functions are available for mobiles.
 */
DECLARE_SPEC_FUN( spec_jedi );
DECLARE_SPEC_FUN( spec_dark_jedi );
DECLARE_SPEC_FUN( spec_fido );
DECLARE_SPEC_FUN( spec_guardian );
DECLARE_SPEC_FUN( spec_janitor );
DECLARE_SPEC_FUN( spec_poison );
DECLARE_SPEC_FUN( spec_thief );
DECLARE_SPEC_FUN( spec_auth );
DECLARE_SPEC_FUN( spec_stormtrooper );
DECLARE_SPEC_FUN( spec_rebel_trooper );
DECLARE_SPEC_FUN( spec_customs_smut );
DECLARE_SPEC_FUN( spec_customs_alcohol );
DECLARE_SPEC_FUN( spec_customs_weapons );
DECLARE_SPEC_FUN( spec_customs_spice );
DECLARE_SPEC_FUN( spec_police_attack );
DECLARE_SPEC_FUN( spec_police_undercover );
DECLARE_SPEC_FUN( spec_police_jail );
DECLARE_SPEC_FUN( spec_police_fine );
DECLARE_SPEC_FUN( spec_police );
DECLARE_SPEC_FUN( spec_clan_guard );
DECLARE_SPEC_FUN( spec_newbie_pilot );

typedef struct spec_fun_entry
{
  const char *fun_name;
  SPEC_FUN *fun_ptr;
} SPEC_FUN_ENTRY;

static const SPEC_FUN_ENTRY spec_fun_table[] = {
  { "spec_jedi",              spec_jedi },
  { "spec_dark_jedi",         spec_dark_jedi },
  { "spec_fido",              spec_fido },
  { "spec_guardian",          spec_guardian },
  { "spec_janitor",           spec_janitor },
  { "spec_poison",            spec_poison },
  { "spec_thief",             spec_thief },
  { "spec_auth",              spec_auth },
  { "spec_stormtrooper",      spec_stormtrooper },
  { "spec_rebel_trooper",     spec_rebel_trooper },
  { "spec_customs_smut",      spec_customs_smut },
  { "spec_customs_alcohol",   spec_customs_alcohol },
  { "spec_customs_weapons",   spec_customs_weapons },
  { "spec_customs_spice",     spec_customs_spice },
  { "spec_police_attack",     spec_police_attack },
  { "spec_police_jail",       spec_police_jail },
  { "spec_police_fine",       spec_police_fine },
  { "spec_police_undercover", spec_police_undercover },
  { "spec_police",            spec_police },
  { "spec_clan_guard",        spec_clan_guard },
  { "spec_newbie_pilot",      spec_newbie_pilot }
};

static size_t spec_fun_table_size( void )
{
  return sizeof( spec_fun_table ) / sizeof( *spec_fun_table );
}

/*
 * Given a name, return the appropriate spec fun.
 */
SPEC_FUN *spec_lookup( const char *name )
{
  SPEC_FUN *fun_ptr = NULL;
  size_t i = 0;

  for( i = 0; i < spec_fun_table_size(); ++i )
    {
      if( !str_cmp( name, spec_fun_table[i].fun_name ) )
        {
          fun_ptr = spec_fun_table[i].fun_ptr;
          break;
        }
    }

  return fun_ptr;
}

/*
 * Given a pointer, return the appropriate spec fun text.
 */
const char *lookup_spec( SPEC_FUN *special )
{
  size_t i = 0;

  for( i = 0; i < spec_fun_table_size(); ++i )
    {
      if( spec_fun_table[i].fun_ptr == special )
        {
          return spec_fun_table[i].fun_name;
        }
    }

  return "";
}
