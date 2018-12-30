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

#include <array>
#include "mud.hpp"

struct spec_fun_entry
{
  const char *fun_name = nullptr;
  SpecFun *fun_ptr = nullptr;
};

static const std::array<const spec_fun_entry, 21> spec_fun_table =
  {
   spec_fun_entry { "spec_jedi",              spec_jedi },
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

/*
 * Given a name, return the appropriate spec fun.
 */
SpecFun *SpecialLookup( const std::string &name )
{
  SpecFun *fun_ptr = NULL;
  size_t i = 0;

  for( i = 0; i < spec_fun_table.size(); ++i )
    {
      if( !StrCmp( name, spec_fun_table[i].fun_name ) )
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
const char *LookupSpecial( SpecFun *special )
{
  size_t i = 0;

  for( i = 0; i < spec_fun_table.size(); ++i )
    {
      if( spec_fun_table[i].fun_ptr == special )
        {
          return spec_fun_table[i].fun_name;
        }
    }

  return "";
}

