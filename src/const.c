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

#include <string.h>
#include "mud.h"

static int get_in_array( const char *name, const char * const * array,
                         size_t sz,
                         bool (*compare_string)( const char*, const char* ) )
{
  size_t x = 0;

  for( x = 0; x < sz; ++x )
    if( !compare_string( name, array[x] ) )
      return x;

  return -1;
}

/*
 * Race table.
 */
const struct race_type race_table[MAX_RACE] =
  {
    {
      "Human",    /* race_name          */
      0,          /* affected           */
      {           /* stats              */
	0,        /*   mod_str          */
	0,        /*   mod_dex          */
	0,        /*   mod_wis          */
	0,        /*   mod_int          */
	0,        /*   mod_con          */
	0,        /*   mod_cha          */
	0,        /*   mod_lck          */
	0         /*   mod_frc          */
      },
      {
	0, /* COMBAT_ABILITY */
	0, /* PILOTING_ABILITY */
	0, /* ENGINEERING_ABILITY */
	0, /* HUNTING_ABILITY */
	0, /* SMUGGLING_ABILITY */
	0, /* DIPLOMACY_ABILITY */
	0, /* LEADERSHIP_ABILITY */
	0, /* FORCE_ABILITY */
	0  /* COMMANDO_ABILITY */
      },
      0,          /* hit                */
      0,          /* mana               */
      0,          /* resist             */
      0,          /* suscept            */
      0,          /* class_restriction; */
      LANG_COMMON /* language           */
    },/* nada */
    {
      "Wookiee",
      0,
      {
	4,
	-1,
	-3,
	0,
	2,
	-2,
	0,
	0
      },
      {
        +31, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
        +10, /* ENGINEERING_ABILITY */
        +10, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -50, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +30,
      0,
      0,
      0,
      0,
      LANG_WOOKIEE
    },/* +cmbt */
    {
      "Twi'lek",
      0,
      {
	0,
	2,
	2,
	2,
	-1,
	-1,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
        +10, /* HUNTING_ABILITY */
        +40, /* SMUGGLING_ABILITY */
        -25, /* DIPLOMACY_ABILITY */
        -25, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_TWI_LEK
    },
    {
      "Rodian",
      0,
      {
	-1,
	3,
	0,
	0,
	1,
	-1,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
        -10, /* ENGINEERING_ABILITY */
        +50, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -20, /* DIPLOMACY_ABILITY */
        -20, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      -10,
      0,
      0,
      0,
      0,
      LANG_RODIAN
    },
    {
      "Hutt",
      0,
      {
	5,
	-9,
	3,
	4,
	5,
	-10,
	0,
	0,
      },
      {
        -20, /* COMBAT_ABILITY */
        -10, /* PILOTING_ABILITY */
        -10, /* ENGINEERING_ABILITY */
        -20, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        +85, /* DIPLOMACY_ABILITY */
        +35, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +700,
      0,
      RIS_SLEEP + RIS_POISON + RIS_PARALYSIS + RIS_ENERGY,
      0,
      0,
      LANG_HUTT
    },/* --cmbt, -smg, -80bh, ++lead */
    {
      "Mon Calamari",
      AFF_AQUA_BREATH,
      {
	1,
	-1,
	2,
	4,
	0,
	0,
	0,
	0,
      },
      {
         -1, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
        +10, /* ENGINEERING_ABILITY */
        +30, /* HUNTING_ABILITY */
        -20, /* SMUGGLING_ABILITY */
        +10, /* DIPLOMACY_ABILITY */
        +30, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +20,
      0,
      0,
      0,
      0,
      LANG_MON_CALAMARI
    },/* -cmbt */
    {
      "Shistavanen",
      AFF_SNEAK,
      {
	+3,
	+4,
	-1,
	0,
	-2,
	-4,
	0,
	0,
      },
      {
        +35, /* COMBAT_ABILITY */
         +5, /* PILOTING_ABILITY */
        -20, /* ENGINEERING_ABILITY */
        +20, /* HUNTING_ABILITY */
        +15, /* SMUGGLING_ABILITY */
        -30, /* DIPLOMACY_ABILITY */
        -15, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +20,
      0,
      0,
      RIS_NONMAGIC + RIS_POISON,
      0,
      LANG_SHISTAVANEN
    },
    {
      "Gamorrean",
      0,
      {
	5,
	0,
	-5,
	-5,
	5,
	-2,
	0,
	0,
      },
      {
        +30, /* COMBAT_ABILITY */
        -10, /* PILOTING_ABILITY */
        -10, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -10, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +60,
      0,
      0,
      RIS_SLEEP + RIS_PARALYSIS + RIS_MAGIC,
      0,
      LANG_GAMORREAN
    },
    {
      "Jawa",   0,
      {
	-3,
	3,
	1,
	0,
	0,
	-2,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
        -10, /* HUNTING_ABILITY */
        +30, /* SMUGGLING_ABILITY */
        -10, /* DIPLOMACY_ABILITY */
        -10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      -20,
      0,
      0,
      0,
      0,
      LANG_JAWA
    },
    {
      "Adarian",
      0,
      {
	-2,
	-1,
	+2,
	+2,
	-1,
	+2,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
        -30, /* HUNTING_ABILITY */
        -20, /* SMUGGLING_ABILITY */
        +40, /* DIPLOMACY_ABILITY */
        +10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      -50,
      0,
      0,
      0,
      0,
      LANG_ADARIAN
    },
    {
      "Ewok",
      0,
      {
	-1,
	-1,
	-3,
	-5,
	-2,
	+5,
	0,
	0,
      },
      {
        0, /* COMBAT_ABILITY */
        0, /* PILOTING_ABILITY */
        0, /* ENGINEERING_ABILITY */
        0, /* HUNTING_ABILITY */
        0, /* SMUGGLING_ABILITY */
        0, /* DIPLOMACY_ABILITY */
        0, /* LEADERSHIP_ABILITY */
        0, /* FORCE_ABILITY */
        0  /* COMMANDO_ABILITY */
      },
      -100,
      0,
      0,
      0,
      0,
      LANG_EWOK
    },
    {
      "Verpine",
      0,
      {
	0,
	0,
	+1,
	+5,
	-1,
	0,
	0,
	0,
      },
      {
         +1, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
        +70, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
        -20, /* SMUGGLING_ABILITY */
        -10, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
	  0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_VERPINE
    },/* -cmbt */
    {
      "Defel",
      AFF_HIDE + AFF_SNEAK,
      {
	+1,
	+3,
	-3,
	-3,
	+1,
	0,
	0,
	0,
      },
      {
        +25, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
        +25, /* SMUGGLING_ABILITY */
        -30, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +15,
      0,
      0,
      0,
      0,
      LANG_DEFEL
    },
    {
      "Trandoshan",
      AFF_INFRARED,
      {
	+3,
	-1,
	0,
	0,
	+6,
	-1,
	0,
	0,
      },
      {
        +20, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
        -10, /* ENGINEERING_ABILITY */
        +30, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -30, /* DIPLOMACY_ABILITY */
        -10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +35,
      0,
      0,
      0,
      0,
      LANG_TRANDOSHAN
    },/* -cmbt(possible) */
    {
      "Chadra-Fan",
      AFF_INFRARED,
      {
	-3,
	+3,
	0,
	+2,
	-1,
	0,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
        +15, /* ENGINEERING_ABILITY */
        -25, /* HUNTING_ABILITY */
        +10, /* SMUGGLING_ABILITY */
          0, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      -85,
      0,
      0,
      0,
      0,
      LANG_CHADRA_FAN
    },
    {
      "Quarren",
      AFF_AQUA_BREATH + AFF_INFRARED,
      {
	-1,
	+1,
	0,
	+1,
	-1,
	0,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
        +10, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
        +20, /* SMUGGLING_ABILITY */
        -20, /* DIPLOMACY_ABILITY */
        -10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      -10,
      0,
      0,
      0,
      0,
      LANG_MON_CALAMARI
    },
    {
      "Sullustan",
      0,
      {
	-2,
	0,
	+2,
	+5,
	0,
	+1,
	0,
	0,
      },
      {
        -10, /* COMBAT_ABILITY */
        +30, /* PILOTING_ABILITY */
        +20, /* ENGINEERING_ABILITY */
        -25, /* HUNTING_ABILITY */
        +10, /* SMUGGLING_ABILITY */
        +10, /* DIPLOMACY_ABILITY */
        -10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_SULLUSTAN
    },
    {
      "Falleen",
      AFF_AQUA_BREATH,
      {
	0,
	1,
	+3,
	+1,
	-1,
	+4,
	0,
	0,
      },
      {
        0, /* COMBAT_ABILITY */
        0, /* PILOTING_ABILITY */
        0, /* ENGINEERING_ABILITY */
        0, /* HUNTING_ABILITY */
        0, /* SMUGGLING_ABILITY */
        0, /* DIPLOMACY_ABILITY */
        0, /* LEADERSHIP_ABILITY */
        0, /* FORCE_ABILITY */
        0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_FALLEEN
    },
    {
      "Ithorian",
      0,
      {
	+5,
	+3,
	+3,
	0,
	0,
	-4,
	0,
	0,
      },
      {
        -101, /* COMBAT_ABILITY */
           0, /* PILOTING_ABILITY */
           0, /* ENGINEERING_ABILITY */
           0, /* HUNTING_ABILITY */
           0, /* SMUGGLING_ABILITY */
           0, /* DIPLOMACY_ABILITY */
           0, /* LEADERSHIP_ABILITY */
           0, /* FORCE_ABILITY */
           0  /* COMMANDO_ABILITY */
      },
      -30,
      0,
      0,
      0,
      0,
      LANG_ITHORIAN
    },/* ---cmbt */
    {
      "Devaronian",
      0,
      {
	+1,
	+3,
	1,
	-1,
	-1,
	-3,
	0,
	0,
      },
      {
        0, /* COMBAT_ABILITY */
        0, /* PILOTING_ABILITY */
        0, /* ENGINEERING_ABILITY */
        0, /* HUNTING_ABILITY */
        0, /* SMUGGLING_ABILITY */
        0, /* DIPLOMACY_ABILITY */
        0, /* LEADERSHIP_ABILITY */
        0, /* FORCE_ABILITY */
        0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_DEVARONIAN
    },
    {
      "Gotal",
      AFF_DETECT_MAGIC,
      {
        -1,
	0,
	+1,
	0,
	0,
	0,
	0,
	0,
      },
      {
        0, /* COMBAT_ABILITY */
        0, /* PILOTING_ABILITY */
        0, /* ENGINEERING_ABILITY */
        0, /* HUNTING_ABILITY */
        0, /* SMUGGLING_ABILITY */
        0, /* DIPLOMACY_ABILITY */
        0, /* LEADERSHIP_ABILITY */
        0, /* FORCE_ABILITY */
        0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_GOTAL
    },
    {
      "Droid",
      AFF_AQUA_BREATH + AFF_INFRARED,
      {
	0,
	-2,
	+1,
	+4,
	-4,
	+1,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
        -10, /* PILOTING_ABILITY */
        +20, /* ENGINEERING_ABILITY */
        -40, /* HUNTING_ABILITY */
        -20, /* SMUGGLING_ABILITY */
        -10, /* DIPLOMACY_ABILITY */
        -10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      RIS_SLEEP + RIS_ELECTRICITY,
      0,
      LANG_BINARY
    },
    {
      "Firrerreo",
      AFF_AQUA_BREATH,
      {
        +1,
	-2,
	 0,
 	 0,
	+2,
	+3,
	 0,
	 0,
      },
      {
        +11, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
          0, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +40,
      +1000,
      RIS_FIRE,
      0,
      0,
      LANG_FIRRERREO
    },/*-dip/lead, +1500 mana, no force levels, leave on so that if a forcer does come they have large
        ammounts of mana, but no real force boost*/
    {
      "Barabel",
      0,
      {
	+5,
	-1,
	-1,
	1,
	+5,
	-4,
	0,
	0,
      },
      {
        +35, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -20, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +220,
      0,
      0,
      0,
      0,
      LANG_BARABEL
    },/* ++cmbt, -dip/lead */
    {
      "Bothan",
      AFF_SNEAK | AFF_SCRYING,
      {
	0,
	+3,
	-3,
	+4,
	-4,
	+4,
	0,
	0,
      },
      {
        -11, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        +35, /* DIPLOMACY_ABILITY */
        +20, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_BOTHAN + LANG_COMMON
    },/* ++lead/dip, -eng */
    {
      "Togorian",
      AFF_DETECT_HIDDEN | AFF_SNEAK,
      {
	+4,
	+4,
	0,
	0,
	-2,
	-11,
	0,
	0,
      },
      {
        +40, /* COMBAT_ABILITY */
        +10, /* PILOTING_ABILITY */
        -10, /* ENGINEERING_ABILITY */
        +30, /* HUNTING_ABILITY */
        +15, /* SMUGGLING_ABILITY */
        -40, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +40,
      0,
      0,
      0,
      0,
      LANG_TOGORIAN
    },/* ++cmbt,+bh */
    {
      "Dug",
      AFF_SNEAK,
      {
	-2,
	+5,
	-1,
	0,
	-1,
	-2,
	0,
	0,
      },
      {
        +11, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
         -5, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -14, /* DIPLOMACY_ABILITY */
        +15, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      -15,
      0,
      0,
      0,
      0,
      LANG_HUTT
    },/* +cmbt */
    {
      "Kubaz",
      AFF_SCRYING,
      {
	0,
	+3,
	-1,
	+3,
	0,
	-2,
	0,
	0,
      },
      {
        +16, /* COMBAT_ABILITY */
        -10, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
        +10, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -12, /* DIPLOMACY_ABILITY */
        +30, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_KUBAZ
    },/* ++lead,+dip,-pil */
    {
      "Selonian",
      0,
      {
	+2,
	+2,
	-5,
	-2,
	+3,
	-1,
	0,
	0,
      },
      {
        +26, /* COMBAT_ABILITY */
          0, /* PILOTING_ABILITY */
         +9, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -14, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +35,
      0,
      0,
      0,
      0,
      LANG_COMMON
    },/* +combat,--lead/dip/pil */
    {
      "Gran",
      AFF_INFRARED,
      {
	+2,
	0,
	0,
	-3,
	+3,
	-5,
	0,
	0,
      },
      {
        +8, /* COMBAT_ABILITY */
        -6, /* PILOTING_ABILITY */
        -7, /* ENGINEERING_ABILITY */
         0, /* HUNTING_ABILITY */
         0, /* SMUGGLING_ABILITY */
         0, /* DIPLOMACY_ABILITY */
         0, /* LEADERSHIP_ABILITY */
         0, /* FORCE_ABILITY */
         0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      RIS_POISON,
      RIS_SLEEP + RIS_PARALYSIS,
      0,
      LANG_HUTT
    },/* +bh */
    {
      "Yevetha",
      0,
      {
	+3,
	+1,
	-3,
	+2,
	+2,
	-8,
	0,
	0,
      },
      {
        +26, /* COMBAT_ABILITY */
         +7, /* PILOTING_ABILITY */
        +30, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -10, /* DIPLOMACY_ABILITY */
         +5, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +45,
      0,
      RIS_POISON + RIS_COLD,
      0,
      0,
      LANG_YEVETHAN
    },/* ++combat,+lead/eng,--dip */
    {
      "Gand",
      AFF_AQUA_BREATH,
      {
        +1,
	-3,
	+5,
	0,
	+1,
	-2,
	0,
	0,
      },
      {
         +6, /* COMBAT_ABILITY */
        +30, /* PILOTING_ABILITY */
        -16, /* ENGINEERING_ABILITY */
        +10, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
          0, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_GAND
    },/* +lead/pilot */
    {
      "Duros",
      0,
      {
	-1,
	+2,
	+4,
	+2,
	-1,
	-1,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
        +30, /* PILOTING_ABILITY */
        +25, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
          0, /* SMUGGLING_ABILITY */
        -10, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      0,
      0,
      LANG_DUROS
    },/* ++engineer/pilot,--combat, -lead */
    {
      "Coynite",
      AFF_SNEAK,
      {
	+4,
	+2,
	+1,
	0,
	+1,
	-3,
	0,
	0,
      },
      {
        +25, /* COMBAT_ABILITY */
        +10, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
        +15, /* HUNTING_ABILITY */
        +15, /* SMUGGLING_ABILITY */
        -40, /* DIPLOMACY_ABILITY */
        +10, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +30,
      0,
      0,
      0,
      0,
      LANG_COYNITE
    },/* ++combat/lead, +bh, -piloting/dip */
    {
      "Protocol Droid",
      AFF_AQUA_BREATH + AFF_INFRARED,
      {
	-5,
	-5,
	+5,
	+5,
	0,
	+5,
	0,
	0,
      },
      {
          0, /* COMBAT_ABILITY */
        -15, /* PILOTING_ABILITY */
        -40, /* ENGINEERING_ABILITY */
          0, /* HUNTING_ABILITY */
        -40, /* SMUGGLING_ABILITY */
          0, /* DIPLOMACY_ABILITY */
        -40, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      RIS_SLEEP + RIS_ELECTRICITY,
      0,
      LANG_BINARY
    },/* (+)dip */
    {
      "Assassin Droid",
      AFF_AQUA_BREATH + AFF_INFRARED,
      {
	+4,
	+3,
	-15,
	+1,
	+2,
	-9,
	0,
	0,
      },
      {
        +45, /* COMBAT_ABILITY */
        +10, /* PILOTING_ABILITY */
          0, /* ENGINEERING_ABILITY */
        +65, /* HUNTING_ABILITY */
        +15, /* SMUGGLING_ABILITY */
        -30, /* DIPLOMACY_ABILITY */
          0, /* LEADERSHIP_ABILITY */
          0, /* FORCE_ABILITY */
          0  /* COMMANDO_ABILITY */
      },
      +100,
      0,
      0,
      0,
      0,
      LANG_BINARY
    },/* ++BH,++combat */
    {
      "Gladiator Droid",
      AFF_AQUA_BREATH + AFF_INFRARED,
      {
	+5,
	+3,
	-9,
	-6,
	+4,
	-9,
	0,
	0,
      },
      {
         +60, /* COMBAT_ABILITY */
        -110, /* PILOTING_ABILITY */
         -25, /* ENGINEERING_ABILITY */
           0, /* HUNTING_ABILITY */
         -25, /* SMUGGLING_ABILITY */
         -30, /* DIPLOMACY_ABILITY */
         -40, /* LEADERSHIP_ABILITY */
           0, /* FORCE_ABILITY */
           0  /* COMMANDO_ABILITY */
      },
      +150,
      0,
      RIS_NONMAGIC,
      RIS_SLEEP + RIS_ELECTRICITY,
      0,
      LANG_BINARY
    },/* (+)combat */
    {
      "Astromech",
      AFF_AQUA_BREATH + AFF_INFRARED,
      {
	0,
	-5,
	-6,
	+5,
	-6,
	0,
	0,
	0,
      },
      {
        -110, /* COMBAT_ABILITY */
         +70, /* PILOTING_ABILITY */
         -46, /* ENGINEERING_ABILITY */
           0, /* HUNTING_ABILITY */
         -25, /* SMUGGLING_ABILITY */
         -55, /* DIPLOMACY_ABILITY */
         -50, /* LEADERSHIP_ABILITY */
           0, /* FORCE_ABILITY */
           0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      RIS_SLEEP + RIS_ELECTRICITY,
      0,
      LANG_BINARY
    },/* (+)pil */
    {
      "Interrogation Droid",
      AFF_AQUA_BREATH + AFF_INFRARED + AFF_FLYING + AFF_FLOATING,
      {
	0,
	+4,
	-9,
	+5,
	+1,
	-5,
	0,
	0,
      },
      {
           0, /* COMBAT_ABILITY */
        -120, /* PILOTING_ABILITY */
         -58, /* ENGINEERING_ABILITY */
           0, /* HUNTING_ABILITY */
        -125, /* SMUGGLING_ABILITY */
        -100, /* DIPLOMACY_ABILITY */
        +140, /* LEADERSHIP_ABILITY */
           0, /* FORCE_ABILITY */
	   0  /* COMMANDO_ABILITY */
      },
      0,
      0,
      0,
      RIS_SLEEP + RIS_ELECTRICITY,
      0,
      LANG_BINARY
    },/* (+)lead */
    {
      "God",
      AFF_AQUA_BREATH + AFF_INFRARED + AFF_FLYING + AFF_FLOATING,
      {
	+5,
	+5,
	+5,
	+5,
	+5,
	+5,
	+5,
	+5,
      },
      {
        +150, /* COMBAT_ABILITY */
        +150, /* PILOTING_ABILITY */
        +150, /* ENGINEERING_ABILITY */
        +150, /* HUNTING_ABILITY */
        +150, /* SMUGGLING_ABILITY */
        +150, /* DIPLOMACY_ABILITY */
        +150, /* LEADERSHIP_ABILITY */
        +150, /* FORCE_ABILITY */
        +150  /* COMMANDO_ABILITY */
      },
      +2000,
      +5000,
      0,
      RIS_SLEEP + RIS_ELECTRICITY,
      0,
      LANG_COMMON
    }/* (+)lead */
    /*  race name          DEF_AFF      st dx ws in cn ch lk fc hp mn re su     RESTRICTION  LANGUAGE */

  };


const char *const npc_race[MAX_NPC_RACE] =
  {
    "Human", "Wookiee", "Twi'lek", "Rodian", "Hutt", "Mon Calamari",
    "Shistavanen", "Gamorrean", "Jawa", "Adarian", "Ewok", "Verpine",
    "Defel", "Trandoshan", "Chadra-Fan", "Quarren", "Sullustan",
    "Falleen", "Ithorian", "Devaronian", "Gotal", "Droid", "Firrerreo",
    "Barabel", "Bothan", "Togorian", "Dug", "Kubaz", "Selonian", "Gran",
    "Yevetha", "Gand", "Duros", "Coynite", "Protocol Droid",
    "Assassin Droid", "Gladiator Droid", "Astromech", "Interrogation Droid",
    "God", "Sarlac", "Saurin", "Snivvian", "Gand", "Gungan", "Weequay",
    "Bith", "Ortolan", "Snit", "Cerean", "Ugnaught", "Taun Taun", "Bantha",
    "Tusken", "Gherkin", "Zabrak", "Dewback", "Rancor", "Ronto", "Noghri",
    "r60", "r61", "r62", "r63", "r64", "r65", "r66",
    "r67", "r68", "r69", "r70", "r71", "r72", "r73", "r74",
    "r75", "r76", "r77", "r78","r79", "r80", "r81", "r82",
    "r83", "r84", "r85", "r86", "r87", "r88",
    "r89"
  };


const char * const ability_name[MAX_ABILITY] =
  {
    "combat", "piloting", "engineering", "bounty hunting", "smuggling",
    "diplomacy", "leadership", "force", "commando"
  };

size_t ability_name_size(void)
{
  return sizeof(ability_name) / sizeof(*ability_name);
}

int get_ability( const char *type )
{
  return get_in_array( type, ability_name, ability_name_size(), StrCmp );
}

/*
 * Attribute bonus tables.
 */
const struct str_app_type str_app[] =
  {
    { -5, -4,   0,  0 },  /* 0  */
    { -5, -4,   3,  1 },  /* 1  */
    { -3, -2,   3,  2 },
    { -3, -1,  10,  3 },  /* 3  */
    { -2, -1,  25,  4 },
    { -2, -1,  55,  5 },  /* 5  */
    { -1,  0,  80,  6 },
    { -1,  0,  90,  8 },
    {  0,  0, 100, 10 },
    {  0,  0, 100, 12 },
    {  0,  0, 115, 14 }, /* 10  */
    {  0,  0, 115, 15 },
    {  0,  0, 140, 16 },
    {  0,  0, 140, 17 }, /* 13  */
    {  0,  1, 170, 18 },
    {  1,  1, 170, 19 }, /* 15  */
    {  1,  2, 195, 20 },
    {  2,  3, 220, 22 },
    {  2,  4, 250, 25 }, /* 18  */
    {  3,  5, 400, 30 },
    {  3,  6, 500, 35 }, /* 20  */
    {  4,  7, 600, 40 },
    {  5,  7, 700, 45 },
    {  6,  8, 800, 50 },
    {  8, 10, 900, 55 },
    { 10, 12, 999, 60 }  /* 25   */
  };

const struct int_app_type int_app[] =
  {
    {  3 },     /*  0 */
    {  5 },     /*  1 */
    {  7 },
    {  8 },     /*  3 */
    {  9 },
    { 10 },     /*  5 */
    { 11 },
    { 12 },
    { 13 },
    { 15 },
    { 17 },     /* 10 */
    { 19 },
    { 22 },
    { 25 },
    { 28 },
    { 31 },     /* 15 */
    { 34 },
    { 37 },
    { 40 },     /* 18 */
    { 44 },
    { 49 },     /* 20 */
    { 55 },
    { 60 },
    { 70 },
    { 85 },
    { 99 }      /* 25 */
  };

const struct wis_app_type wis_app[] =
  {
    { 0 },      /*  0 */
    { 0 },      /*  1 */
    { 0 },
    { 0 },      /*  3 */
    { 0 },
    { 1 },      /*  5 */
    { 1 },
    { 1 },
    { 1 },
    { 2 },
    { 2 },      /* 10 */
    { 2 },
    { 2 },
    { 2 },
    { 2 },
    { 3 },      /* 15 */
    { 3 },
    { 4 },
    { 5 },      /* 18 */
    { 5 },
    { 5 },      /* 20 */
    { 6 },
    { 6 },
    { 6 },
    { 6 },
    { 7 }       /* 25 */
  };

const struct dex_app_type dex_app[] =
  {
    {   60 },   /* 0 */
    {   50 },   /* 1 */
    {   50 },
    {   40 },
    {   30 },
    {   20 },   /* 5 */
    {   10 },
    {    0 },
    {    0 },
    {    0 },
    {    0 },   /* 10 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },
    { - 10 },   /* 15 */
    { - 15 },
    { - 20 },
    { - 30 },
    { - 40 },
    { - 50 },   /* 20 */
    { - 60 },
    { - 75 },
    { - 90 },
    { -105 },
    { -120 }    /* 25 */
  };

const struct con_app_type con_app[] =
  {
    { -4, 20 },   /*  0 */
    { -3, 25 },   /*  1 */
    { -2, 30 },
    { -2, 35 },   /*  3 */
    { -1, 40 },
    { -1, 45 },   /*  5 */
    { -1, 50 },
    {  0, 55 },
    {  0, 60 },
    {  0, 65 },
    {  0, 70 },   /* 10 */
    {  0, 75 },
    {  0, 80 },
    {  0, 85 },
    {  0, 88 },
    {  1, 90 },   /* 15 */
    {  2, 95 },
    {  2, 97 },
    {  3, 99 },   /* 18 */
    {  3, 99 },
    {  4, 99 },   /* 20 */
    {  4, 99 },
    {  5, 99 },
    {  6, 99 },
    {  7, 99 },
    {  8, 99 }    /* 25 */
  };

const struct cha_app_type cha_app[] =
  {
    { - 60 },   /* 0 */
    { - 50 },   /* 1 */
    { - 50 },
    { - 40 },
    { - 30 },
    { - 20 },   /* 5 */
    { - 10 },
    { -  5 },
    { -  1 },
    {    0 },
    {    0 },   /* 10 */
    {    0 },
    {    0 },
    {    0 },
    {    1 },
    {    5 },   /* 15 */
    {   10 },
    {   20 },
    {   30 },
    {   40 },
    {   50 },   /* 20 */
    {   60 },
    {   70 },
    {   80 },
    {   90 },
    {   99 }    /* 25 */
  };

/* Have to fix this up - not exactly sure how it works (Scryn) */
const struct lck_app_type lck_app[] =
  {
    {   60 },   /* 0 */
    {   50 },   /* 1 */
    {   50 },
    {   40 },
    {   30 },
    {   20 },   /* 5 */
    {   10 },
    {    0 },
    {    0 },
    {    0 },
    {    0 },   /* 10 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },
    { - 10 },   /* 15 */
    { - 15 },
    { - 20 },
    { - 30 },
    { - 40 },
    { - 50 },   /* 20 */
    { - 60 },
    { - 75 },
    { - 90 },
    { -105 },
    { -120 }    /* 25 */
  };

const struct frc_app_type frc_app[] =
  {
    {    0 },   /* 0 */
    {    0 },   /* 1 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },   /* 5 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },
    {    0 },   /* 10 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },
    {    0 },   /* 15 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },
    {    0 },   /* 20 */
    {    0 },
    {    0 },
    {    0 },
    {    0 },
    {    0 }    /* 25 */
  };

/*
 * Liquid properties.
 * Used in #OBJECT section of area file.
 */
const struct liq_type liq_table[LIQ_MAX] =
  {
    { "water",                  "clear",        {  0, 1, 10 }   },  /*  0 */
    { "beer",                   "amber",        {  3, 2,  5 }   },
    { "wine",                   "rose",         {  5, 2,  5 }   },
    { "ale",                    "brown",        {  2, 2,  5 }   },
    { "dark ale",               "dark",         {  1, 2,  5 }   },

    { "whisky",                 "golden",       {  6, 1,  4 }   },  /*  5 */
    { "lemonade",               "pink",         {  0, 1,  8 }   },
    { "firebreather",           "boiling",      { 10, 0,  0 }   },
    { "local specialty",        "everclear",    {  3, 3,  3 }   },
    { "slime mold juice",       "green",        {  0, 4, -8 }   },

    { "milk",                   "white",        {  0, 3,  6 }   },  /* 10 */
    { "tea",                    "tan",          {  0, 1,  6 }   },
    { "coffee",                 "black",        {  0, 1,  6 }   },
    { "blood",                  "red",          {  0, 2, -1 }   },
    { "salt water",             "clear",        {  0, 1, -2 }   },

    { "cola",                   "cherry",       {  0, 1,  5 }   },  /* 15 */
    { "mead",                   "honey color",  {  4, 2,  5 }   },  /* 16 */
    { "grog",                   "thick brown",  {  3, 2,  5 }   },  /* 17 */
    { "milkshake",              "creamy",       {  0, 8,  5 }   },   /* 18 */
    { "gin",                    "clear",        {  6, 1,  5 }   },
    { "brandy",                 "dark yellow",  {  7, 1,  5 }   },
    { "rum",                    "clear",        {  7, 2,  7 }   },
    { "heavy liquor",           "clear",        {  8, 1,  5 }   },
    { "liquor",                 "clear",        {  5, 1,  5 }   },
    { "champagne",              "golden",       {  6, 1,  1 }   },
    { "cognac",                 "rust",         {  6, 2,  4 }   },
    { "alcohol",                "everclear",    {  6, 1,  6 }   },
    { "mixed alcohol",          "everclear",    {  4, 1,  7 }   },
    { "frozen alcohol",         "everclear",    {  6, 5,  5 }   },
    { "blue alcohol",           "blue",         {  5, 1,  1 }   },
    { "red alcohol",            "red",          {  5, 1,  1 }   },
    { "orange alcohol",         "orange",       {  5, 1,  1 }   },
    { "green alcohol",          "green",        {  5, 1,  1 }   },
    { "mineral water",          "clear",        {  0, 0,  10 }  },
    { "ethanol",                "clear",        {  15, 0,  0 }  },
    { "apple juice",            "yellow",       {  0, 4,  6 }   },
    { "fruit beverage",         "cherry",       {  0, 3,  8 }   },
    { "mixed spritzer",         "clear",        {  3, 1,  3 }   },
    { "sweet tea",              "tan",          {  0, 2,  6 }   }
  };

const char * const attack_table[] =
  {
    "hit",
    "slice",  "stab",  "slash", "whip", "claw",
    "blast",  "pound", "crush", "shot", "bite",
    "pierce", "suction"
  };

size_t attacktable_size( void )
{
  return sizeof( attack_table ) / sizeof( attack_table[0] );
}

const char *get_attacktype_name( size_t type )
{
  if(type >= attacktable_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return attack_table[type];
}

const char * const spaceobj_type[] =
  {
    "sun", "planet", "_space_moveobj", "_space_obj"
  };

const char * const *get_spaceobj_type_table( void )
{
  return spaceobj_type;
}

size_t spaceobj_type_size( void )
{
  return sizeof(spaceobj_type) / sizeof(*spaceobj_type);
}

const char *get_spaceobj_type(size_t sotype)
{
  if(sotype >= spaceobj_type_size())
    {
      bug("%s: subscript %d out of range", __FUNCTION__, sotype);
      return NULL;
    }

  return spaceobj_type[sotype];
}

int get_spaceobj_type_from_name( const char *type )
{
  return get_in_array( type, spaceobj_type, spaceobj_type_size(), StringPrefix );
}

const char * const skill_tname[] =
  {
    "unknown", "Force Power", "Skill", "Weapon", "Tongue", "Herb"
  };

const char * const dir_name[] =
  {
    "north", "east", "south", "west", "up", "down",
    "northeast", "northwest", "southeast", "southwest", "somewhere"
  };

const short rev_dir[] =
  {
    DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_EAST, DIR_DOWN, DIR_UP,
    DIR_SOUTHWEST, DIR_SOUTHEAST, DIR_NORTHWEST, DIR_NORTHEAST, DIR_SOMEWHERE
  };

const char *get_dir_name( int dir )
{
  if( dir > DIR_SOMEWHERE )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, dir);
      return NULL;
    }

  return dir_name[dir];
}

int get_rev_dir( int dir )
{
  if( dir > DIR_SOMEWHERE )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, dir);
      return DIR_SOMEWHERE;
    }

  return rev_dir[dir];
}

int get_dir( const char *txt )
{
  int edir = DIR_INVALID;
  char c1 = 0, c2 = 0;

  if ( !StrCmp( txt, get_dir_name( DIR_NORTHEAST ) ) )
    return DIR_NORTHEAST;

  if ( !StrCmp( txt, get_dir_name( DIR_NORTHWEST ) ) )
    return DIR_NORTHWEST;

  if ( !StrCmp( txt, get_dir_name( DIR_SOUTHEAST ) ) )
    return DIR_SOUTHEAST;

  if ( !StrCmp( txt, get_dir_name( DIR_SOUTHWEST ) ) )
    return DIR_SOUTHWEST;

  if ( !StrCmp( txt, get_dir_name( DIR_SOMEWHERE ) ) )
    return DIR_SOMEWHERE;

  if( strlen( txt ) > 2 )
    {
      return DIR_INVALID;
    }

  c1 = txt[0];

  if ( c1 == '\0' )
    return DIR_INVALID;

  c2 = txt[1];

  switch ( c1 )
    {
    case 'n':
      switch ( c2 )
        {
        default:
          edir = DIR_NORTH;
          break;

        case 'e':
          edir = DIR_NORTHEAST;
          break;

        case 'w':
          edir = DIR_NORTHWEST;
          break;
        }
      break;

    case '0':
      edir = DIR_NORTH;
      break;

    case 'e':
      edir = DIR_EAST;
      break;

    case '1':
      edir = DIR_EAST;
      break;

    case 's':
      switch ( c2 )
        {
        default:
          edir = DIR_SOUTH;
          break;

        case 'e':
          edir = DIR_SOUTHEAST;
          break;

        case 'w':
          edir = DIR_SOUTHWEST;
          break;
        }
      break;

    case '2':
      edir = DIR_SOUTH;
      break;

    case 'w':
      edir = DIR_WEST;
      break;

    case '3':
      edir = DIR_WEST;
      break;

    case 'u':
      edir = DIR_UP;
      break;

    case '4':
      edir = DIR_UP;
      break;

    case 'd':
      edir = DIR_DOWN;
      break;

    case '5':
      edir = DIR_DOWN;
      break;

    case '6':
      edir = DIR_NORTHEAST;
      break;

    case '7':
      edir = DIR_NORTHWEST;
      break;

    case '8':
      edir = DIR_SOUTHEAST;
      break;

    case '9':
      edir = DIR_SOUTHWEST;
      break;

    case '?':
      edir = DIR_SOMEWHERE;
      break;
    }

  return edir;
}

const char * const where_name[] =
  {
    "<used as light>     ",
    "<worn on finger>    ",
    "<worn on finger>    ",
    "<worn around neck>  ",
    "<worn around neck>  ",
    "<worn on body>      ",
    "<worn on head>      ",
    "<worn on legs>      ",
    "<worn on feet>      ",
    "<worn on hands>     ",
    "<worn on arms>      ",
    "<energy shield>     ",
    "<worn about body>   ",
    "<worn about waist>  ",
    "<worn around wrist> ",
    "<worn around wrist> ",
    "<wielded>           ",
    "<held>              ",
    "<dual wielded>      ",
    "<worn on ears>      ",
    "<worn on eyes>      ",
    "<missile wielded>   ",
    "<floating>          ",
    "<worn over body>    "
  };

const int trap_door[] =
  {
    TRAP_N, TRAP_E, TRAP_S, TRAP_W, TRAP_U, TRAP_D,
    TRAP_NE, TRAP_NW, TRAP_SE, TRAP_SW
  };

const char * const sect_names[SECT_MAX][2] =
  {
    { "In A Room",      "inside"      }, /* SECT_INSIDE       */
    { "A City Street",  "cities"      }, /* SECT_CITY         */
    { "In A Field",     "fields"      }, /* SECT_FIELD        */
    { "In A Forest",    "forests"     }, /* SECT_FOREST       */
    { "Hill",           "hills"       }, /* SECT_HILLS        */
    { "On A Mountain",  "mountains"   }, /* SECT_MOUNTAIN     */
    { "In The Water",   "waters"      }, /* SECT_WATER_SWIM   */
    { "In Rough Water", "waters"      }, /* SECT_WATER_NOSWIM */
    { "Underwater",     "underwaters" }, /* SECT_UNDERWATER   */
    { "In The Air",     "air"         }, /* SECT_AIR          */
    { "In A Desert",    "deserts"     }, /* SECT_DESERT       */
    { "Somewhere",      "unknown"     }, /* SECT_DUNNO        */
    { "Ocean floor",    "Ocean floor" }, /* SECT_OCEANFLOOR   */
    { "Underground",    "underground" }  /* SECT_UNDERGROUND  */
  };

const short movement_loss[SECT_MAX] =
  {
    1,  /* SECT_INSIDE */
    2,  /* SECT_CITY */
    2,  /* SECT_FIELD */
    3,  /* SECT_FOREST */
    4,  /* SECT_HILLS */
    6,  /* SECT_MOUNTAIN */
    4,  /* SECT_WATER_SWIM */
    1,  /* SECT_WATER_NOSWIM */
    6,  /* SECT_UNDERWATER */
    10, /* SECT_AIR */
    6,  /* SECT_DESERT */
    5,  /* SECT_DUNNO */
    7,  /* SECT_OCEANFLOOR */
    4   /* SECT_UNDERGROUND */
  };

const int sent_total[SECT_MAX] =
  {
    4, 24, 4, 4, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1
  };

const char * const room_sents[SECT_MAX][25] =
  {
    {
      "The smooth walls are made of durasteel.",
      "You see an occasional rotent moving around.",
      "You notice the glowrods attached along the ceiling.",
      "The place has the strong smell of sanitizer and metal."
    },

    {
      "You notice the occasional stray looking for food.",
      "Tall buildings loom on either side of you stretching to the sky.",
      "Some street people are putting on an interesting display of talent trying to earn some credits.",
      "Two people nearby shout heated words of argument at one another.",
      "You think you can make out several shady figures talking down a dark alleyway."
      "A slight breeze blows through the tall buildings.",
      "A small crowd of people have gathered at one side of the street.",
      "Clouds far above you obscure the tops of the highest skyscrapers.",
      "A speeder moves slowly through the street avoiding pedestrians.",
      "A cloudcar flys by overhead.",
      "The air is thick and hard to breath.",
      "The many smells of the city assault your senses.",
      "You hear a scream far of in the distance.",
      "The buildings around you seem endless in number.",
      "The city stretches seemingly endless in all directions.",
      "The street is wide and long.",
      "A swoop rider passes quickly by weaving in and out of pedestrians and other vehicles.",
      "The surface of the road is worn from many travellers.",
      "You feel it would be very easy to get lost in such an enormous city.",
      "You can see other streets above and bellow this one running in many directions.",
      "There are entrances to several buildings at this level.",
      "Along the edge of the street railings prevent pedestrians from falling to their death.",
      "In between the many towers you can see down into depths of the lower city.",
      "A grate in the street prevents rainwater from building up.",
      "You can see you reflection in several of the transparisteel windows as you pass by."
      "You hear a scream far of in the distance.",
    },

    {
      "You notice sparce patches of brush and shrubs.",
      "There is a small cluster of trees far off in the distance.",
      "Around you are grassy fields as far as the eye can see.",
      "Throughout the plains a wide variety of weeds and wildflowers are scattered."
    },

    {
      "Tall, dark green trees prevent you from seeing very far.",
      "Many huge trees that look several hundred years old are here.",
      "You notice a solitary, drooping tree.",
      "To your left is a patch of bright white, slender trees, slender and tall."
    },

    {
      "The rolling hills are lightly speckled with violet wildflowers."
    },

    {
      "The rocky mountain pass offers many hiding places."
    },

    {
      "The water is smooth as glass."
    },

    {
      "Rough waves splash about angrily."
    },

    {
      "A small school of fish swims by."
    },

    {
      "The land is far far below.",
      "A misty haze of clouds drifts by."
    },

    {
      "Around you is sand as far as the eye can see.",
      "You think you see the shimmering that might represent water in the distance"
    },

    {
      "You notice nothing unusual."
    },

    {
      "There are many rocks and coral which litter the ocean floor."
    },

    {
      "You stand in a lengthy tunnel of rock."
    }

  };

const char * const mag_flags[] =
  {
    "returning", "backstabber", "bane", "loyal", "haste", "drain",
    "lightning_blade"
  };

const char * const room_flags[] =
  {
    "dark", "reserved", "nomob", "indoors", "can_land", "can_fly", "no_drive",
    "nomagic", "bank", "private", "safe", "remove_this_flag", "petshop",
    "arena", "donation", "nodropall", "silence", "logspeech", "nodrop",
    "clanstoreroom", "plr_home", "empty_home", "teleport", "hotel", "nofloor",
    "refinery", "factory", "recruit", "plr_shop", "spacecraft", "prototype",
    "auction"
  };

const char * const wear_flags[] =
  {
    "take", "finger", "neck", "body", "head", "legs", "feet", "hands", "arms",
    "shield", "about", "waist", "wrist", "wield", "hold", "_dual_", "ears",
    "eyes", "_missile_", "floating","over","disguise","maxwear","r5","r6",
    "r7","r8","r9","r10","r11","r12","r13"
  };

const char * const object_flags[] =
  {
    "glow", "hum", "dark", "hutt_size", "contraband", "invis", "magic",
    "nodrop", "bless", "antigood", "antievil", "antineutral", "noremove",
    "inventory", "antisoldier", "antithief", "antihunter", "antijedi",
    "small_size", "large_size", "donation", "clanobject", "anticitizen",
    "antisith", "antipilot", "hidden", "poisoned", "covering", "deathrot",
    "burried", "prototype", "human_size"
  };

const char * const affected_flags[] =
  {
    "blind", "invisible", "detect_evil", "detect_invis", "detect_magic",
    "detect_hidden", "weaken", "sanctuary", "faerie_fire", "infrared", "curse",
    "_flaming", "poison", "protect", "paralysis", "sneak", "hide", "sleep",
    "charm", "flying", "pass_door", "floating", "truesight", "detect_traps",
    "scrying", "fireshield", "shockshield", "r1", "iceshield", "possess",
    "berserk", "aqua_breath"
  };

const char * const object_types[] =
  {
    "none",
    "light",
    "scroll",
    "_wand",
    "staff",
    "weapon",
    "_fireweapon",
    "missile",
    "treasure",
    "armor",
    "potion",
    "rope",
    "furniture",
    "trash",
    "_oldtrap",
    "container",
    "_note",
    "drinkcon",
    "key",
    "food",
    "money",
    "pen",
    "_boat",
    "corpse",
    "corpse_pc",
    "fountain",
    "pill",
    "_blood",
    "_bloodstain",
    "scraps",
    "_pipe",
    "_herbcon",
    "_herb",
    "_incense",
    "fire",
    "book",
    "switch",
    "lever",
    "_pullchain",
    "button",
    "dial",
    "_rune",
    "_runepouch",
    "_match",
    "trap",
    "map",
    "_portal",
    "paper",
    "tinder",
    "lockpick",
    "_spike",
    "_disease",
    "oil",
    "fuel",
    "_shortbow",
    "_longbow",
    "crossbow",
    "ammo",
    "_quiver",
    "shovel",
    "salve",
    "rawspice",
    "lens",
    "crystal",
    "duraplast",
    "battery",
    "toolkit",
    "durasteel",
    "oven",
    "mirror",
    "circuit",
    "superconductor",
    "comlink",
    "medpac",
    "fabric",
    "rare_metal",
    "magnet",
    "thread",
    "spice",
    "smut",
    "device",
    "spacecraft",
    "grenade",
    "landmine",
    "government",
    "droid_corpse",
    "bolt",
    "scope",
    "fightercomp",
    "midcomp",
    "capitalcomp",
    "chemical",
    "disguise",
    "disguise_fabric",
    "hair"
  };

const char * const affect_types[] =
  {
    "none", "strength", "dexterity", "intelligence", "wisdom", "constitution",
    "sex", "null", "level", "age", "height", "weight", "force", "hit", "move",
    "credits", "experience", "armor", "hitroll", "damroll", "save_poison",
    "save_rod", "save_para", "save_breath", "save_spell", "charisma",
    "affected", "resistant", "immune", "susceptible", "weaponspell", "luck",
    "backstab", "pick", "track", "steal", "sneak", "hide", "palm", "detrap",
    "dodge", "peek", "scan", "gouge", "search", "mount", "disarm", "kick",
    "parry", "bash", "stun", "punch", "climb", "grip", "scribe", "brew",
    "wearspell", "removespell", "mentalstate", "emotion",
    "stripsn", "remove", "dig", "full", "thirst", "drunk", "blood", "snipe"
  };

const char * const act_flags[] =
  {
    "npc", "sentinel", "scavenger", "r3", "r4", "aggressive", "stayarea",
    "wimpy", "pet", "train", "practice", "immortal", "deadly", "polyself",
    "meta_aggr", "guardian", "running", "nowander", "mountable", "mounted",
    "scholar", "secretive", "polymorphed", "mobinvis", "noassist", "nokill",
    "droid", "nocorpse", "r28", "r29", "prototype", "r31"
 };

const char * const planet_flags[] =
  {
    "coruscant", "kashyyyk", "ryloth", "f3", "f4", "mon calamari",
    "honoghr", "gamorr", "tatooine", "adari", "byss", "endor", "f12",
    "f13", "f14", "f15", "f16", "corellia", "hoth", "f18", "f19",
    "kuat", "f21", "f22", "f23", "f24", "f25", "f26",
    "f27", "f28", "f29", "f30", "f31"
  };

const char * const weapon_table[13] =
  {
    "none",
    "vibro-axe",  "vibro-blade",  "lightsaber", "whip", "claw",
    "blaster",  "w7", "bludgeon", "bowcaster", "w10",
    "force pike", "w12"
  };

size_t weapontable_size( void )
{
  return sizeof(weapon_table) / sizeof(*weapon_table);
}

const char *get_weapontype_name( size_t type )
{
  if( type >= weapontable_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return weapon_table[type];
}

const char * const spice_table[] =
  {
    "glitterstim", "carsanum", "ryll","andris","lumni"
  };

size_t spicetable_size(void)
{
  return sizeof(spice_table) / sizeof(*spice_table);
}

const char *get_spicetype_name( size_t type )
{
  if( type >= spicetable_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spice_table[type];
}

const char * const plr_flags[] =
  {
    "npc", "boughtpet", "shovedrag", "autoexits", "autoloot", "autosac",
    "blank", "outcast", "brief", "combine", "prompt", "telnet_ga", "holylight",
    "wizinvis", "roomvnum","silence", "noemote", "attacker", "notell", "log",
    "deny", "freeze", "killer","homeresident", "litterbug", "ansi", "rip",
    "nice", "flee" ,"autocred", "automap", "afk"
  };

const char * const pc_flags[] =
  {
    "r1", "deadly", "unauthed", "norecall", "nointro", "gag", "retired",
    "guest",
    "nosummon", "pageron", "notitled", "room", "r6", "r7", "r8", "r9", "r10",
    "r11", "r12", "r13", "r14", "r15", "r16", "r17", "r18", "r19", "r20",
    "r21", "r22", "r23", "r24", "r25"
  };

const char * const trap_flags[] =
  {
    "room", "obj", "enter", "leave", "open", "close", "get", "put", "pick",
    "unlock", "north", "south", "east", "r1", "west", "up", "down", "examine",
    "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13",
    "r14", "r15"
  };

const char * const ris_flags[] =
  {
    "fire", "cold", "electricity", "energy", "blunt", "pierce", "slash",
    "acid", "poison", "drain", "sleep", "charm", "hold", "nonmagic", "plus1",
    "plus2", "plus3", "plus4", "plus5", "plus6", "magic", "paralysis",
    "steal", "r23", "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31"
  };

const char * const trig_flags[] =
  {
    "up", "unlock", "lock", "d_north", "d_south", "d_east", "d_west", "d_up",
    "d_down", "door", "container", "open", "close", "passage", "oload",
    "mload", "teleport", "teleportall", "teleportplus", "death", "cast",
    "fakeblade", "rand4", "rand6", "trapdoor", "anotherroom", "usedial",
    "absolutevnum", "showroomdesc", "autoreturn", "r30", "r31"
  };

const char * const part_flags[] =
  {
    "head", "arms", "legs", "heart", "brains", "guts", "hands", "feet",
    "fingers", "ear", "eye", "long_tongue", "eyestalks", "tentacles", "fins",
    "wings", "tail", "scales", "claws", "fangs", "horns", "tusks",
    "tailattack", "sharpscales", "beak", "haunches", "hooves", "paws",
    "forelegs", "feathers", "r30", "r31"
  };

const char * const defense_flags[] =
  {
    "parry", "dodge", "r2", "r3", "r4" ,"r5",
    "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16",
    "r17", "r18", "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26",
    "r27", "r28", "r29", "r30", "r31"
  };

const char * const attack_flags[] =
  {
    "bite", "claws", "tail", "sting", "punch", "kick",
    "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16",
    "r17", "r18", "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26",
    "r27", "r28", "r29", "r30", "r31"
  };

const char * const area_flags[] =
  {
    "nopkill", "r1", "changed", "r3", "r4", "r5", "r6", "r7", "r8",
    "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16", "r17",
    "r18", "r19","r20","r21","r22","r23","r24",
    "r25","r26","r27","r28","r29","r30","r31"
  };

const char * const wear_locs[] =
  {
    "light", "finger1", "finger2", "neck1", "neck2", "body", "head", "legs",
    "feet", "hands", "arms", "shield", "about", "waist", "wrist1", "wrist2",
    "wield", "hold", "dual_wield", "ears", "eyes", "missile_wield", "floating",
    "over"
  };

const char * const exit_flags[] =
  {
    "isdoor", "closed", "locked", "secret", "swim", "pickproof", "fly",
    "climb", "dig", "r1", "nopassdoor", "hidden", "passage", "portal", "r2",
    "r3", "can_climb", "can_enter", "can_leave", "auto", "r4", "searchable",
    "bashed", "bashproof", "nomob", "window", "can_look"
  };

const int lang_array[] =
  {
    LANG_COMMON, LANG_WOOKIEE, LANG_TWI_LEK, LANG_RODIAN,
    LANG_HUTT, LANG_MON_CALAMARI, LANG_SHISTAVANEN, LANG_EWOK,
    LANG_ITHORIAN, LANG_GOTAL, LANG_DEVARONIAN,
    LANG_DROID, LANG_SPIRITUAL, LANG_MAGICAL,
    LANG_GAMORREAN, LANG_GOD, LANG_ANCIENT, LANG_JAWA,
    LANG_CLAN, LANG_ADARIAN, LANG_VERPINE, LANG_DEFEL,
    LANG_TRANDOSHAN, LANG_CHADRA_FAN, LANG_QUARREN,
    LANG_SULLUSTAN, LANG_FALLEEN, LANG_BINARY,
    LANG_YEVETHAN, LANG_GAND, LANG_DUROS, LANG_COYNITE,
    LANG_UNKNOWN
  };

const char * const lang_names[] =
  { "common", "wookiee", "twilek", "rodian", "hutt",
    "mon calamari", "shistavanen", "ewok", "ithorian",
    "gotal", "devaronian", "barabel", "firrerreo",
    "bothan", "gamorrean", "togorian", "kubaz",
    "jawa", "clan", "adarian", "verpine", "defel",
    "trandoshan", "chadra-fan", "quarren", "sullustan",
    "falleen", "binary", "yevethan", "gand", "duros",
    "coynite", ""
  };

const char * const crystal_table[] =
  {
    "non-adegan", "kathracite", "relacite", "danite", "mephite",
    "ponite", "illum", "corusca"
  };

size_t crystaltable_size( void )
{
  return sizeof( crystal_table ) / sizeof( *crystal_table );
}

const char *get_crystaltype_name( size_t type )
{
  if( type >= crystaltable_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return crystal_table[type];
}

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
const char * const mprog_flags[] =
  {
    "act", "speech", "rand", "fight", "death", "hitprcnt", "entry", "greet",
    "allgreet", "give", "bribe", "hour", "time", "wear", "remove", "sac",
    "look", "exa", "zap", "get", "drop", "damage", "repair", "randiw",
    "speechiw", "pull", "push", "sleep", "rest", "leave", "script", "use"
  };

const char * const spell_flag[] =
  {
    "water", "earth", "air", "astral", "area", "distant", "reverse",
    "save_half_dam", "save_negates", "accumulative", "recastable", "noscribe",
    "nobrew", "group", "object", "character", "secretskill", "pksensitive"
  };

size_t spellflag_size( void )
{
  return sizeof( spell_flag ) / sizeof( *spell_flag );
}

const char *get_spellflag_name( size_t type )
{
  if( type >= spellflag_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_flag[type];
}

const char * const spell_saves[] =
  {
    "none", "poison_death", "wands", "para_petri", "breath", "spell_staff"
  };

size_t spellsaves_size( void )
{
  return sizeof( spell_saves ) / sizeof( *spell_saves );
}

const char *get_spellsaves_name( size_t type )
{
  if( type >= spellsaves_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_saves[type];
}

const char * const spell_damage[] =
  {
    "none", "fire", "cold", "electricity", "energy", "acid", "poison", "drain"
  };

size_t spelldamage_size( void )
{
  return sizeof( spell_damage ) / sizeof( *spell_damage );
}

const char *get_spelldamage_name( size_t type )
{
  if( type >= spelldamage_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_damage[type];
}

const char * const spell_action[] =
  {
    "none", "create", "destroy", "resist", "suscept", "divinate", "obscure",
    "change"
  };

size_t spellaction_size( void )
{
  return sizeof( spell_action ) / sizeof( *spell_action );
}

const char *get_spellaction_name( size_t type )
{
  if( type >= spellaction_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_action[type];
}

const char * const spell_power[] =
  {
    "none", "minor", "greater", "major"
  };

size_t spellpower_size( void )
{
  return sizeof( spell_power ) / sizeof( *spell_power );
}

const char *get_spellpower_name( size_t type )
{
  if( type >= spellpower_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_power[type];
}

const char * const spell_class[] =
  {
    "none", "lunar", "solar", "travel", "summon", "life", "death", "illusion"
  };

size_t spellclass_size( void )
{
  return sizeof( spell_class ) / sizeof( *spell_class );
}

const char *get_spellclass_name( size_t type )
{
  if( type >= spellclass_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_class[type];
}

const char * const spell_target[] =
  {
    "ignore", "offensive", "defensive", "self", "objinv"
  };

size_t spelltarget_size( void )
{
  return sizeof( spell_target ) / sizeof( *spell_target );
}

const char *get_spelltarget_name( size_t type )
{
  if( type >= spelltarget_size() )
    {
      bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return spell_target[type];
}

int get_spellsave( const char *name )
{
  return get_in_array( name, spell_saves,
                       sizeof( spell_saves ) / sizeof( spell_saves[0] ),
                       StrCmp );
}

int get_spelltarget( const char *name )
{
  return get_in_array( name, spell_target,
                       sizeof( spell_target ) / sizeof( spell_target[0] ),
                       StrCmp );
}

int get_spellflag( const char *name )
{
  return get_in_array( name, spell_flag,
                       sizeof( spell_flag ) / sizeof( spell_flag[0] ),
                       StrCmp );
}

int get_spelldamage( const char *name )
{
  return get_in_array( name, spell_damage,
                       sizeof( spell_damage ) / sizeof( spell_damage[0] ),
                       StrCmp );
}

int get_spellaction( const char *name )
{
  return get_in_array( name, spell_action,
                       sizeof( spell_action ) / sizeof( spell_action[0] ),
                       StrCmp );
}

int get_spellpower( const char *name )
{
  return get_in_array( name, spell_power,
                       sizeof( spell_power ) / sizeof( spell_power[0] ),
                       StrCmp );
}

int get_spellclass( const char *name )
{
  return get_in_array( name, spell_class,
                       sizeof( spell_class ) / sizeof( spell_class[0] ),
                       StrCmp );
}

int get_objecttype( const char *type )
{
  return get_in_array( type, object_types,
                       sizeof( object_types ) / sizeof( object_types[0] ),
                       StrCmp );
}

int get_affectedflag( const char *flag )
{
  return get_in_array( flag, affected_flags,
                       sizeof( affected_flags ) / sizeof( affected_flags[0] ),
                       StrCmp );
}

int get_trapflag( const char *flag )
{
  return get_in_array( flag, trap_flags,
                       sizeof( trap_flags ) / sizeof( trap_flags[0] ),
		       StrCmp );
}

int get_affecttype( const char *type )
{
  return get_in_array( type, affect_types, MAX_APPLY_TYPE, StrCmp );
}

int get_npc_race( const char *type )
{
  return get_in_array( type, npc_race, MAX_NPC_RACE, StrCmp );
}

int get_wearloc( const char *type )
{
  return get_in_array( type, wear_locs, MAX_WEAR, StrCmp );
}

int get_exitflag( const char *flag )
{
  return get_in_array( flag, exit_flags, MAX_EXFLAG, StrCmp );
}

int get_roomflag( const char *flag )
{
  return get_in_array( flag, room_flags,
                       sizeof( room_flags ) / sizeof( room_flags[0] ),
                       StrCmp );
}

int get_mpflag( const char *flag )
{
  return get_in_array( flag, mprog_flags,
                       sizeof( mprog_flags ) / sizeof( mprog_flags[0] ),
                       StrCmp );
}

int get_objectflag( const char *flag )
{
  return get_in_array( flag, object_flags,
                       sizeof( object_flags ) / sizeof( object_flags[0] ),
                       StrCmp );
}

int get_areaflag( const char *flag )
{
  return get_in_array( flag, area_flags,
                       sizeof( area_flags ) / sizeof( area_flags[0] ),
                       StrCmp );
}

int get_wearflag( const char *flag )
{
  return get_in_array( flag, wear_flags,
                       sizeof( wear_flags ) / sizeof( wear_flags[0] ),
                       StrCmp );
}

int get_actflag( const char *flag )
{
  return get_in_array( flag, act_flags,
                       sizeof( act_flags ) / sizeof( act_flags[0] ),
                       StrCmp );
}

int get_vip_flag( const char *flag )
{
  return get_in_array( flag, planet_flags,
                       sizeof( planet_flags ) / sizeof( planet_flags[0] ),
                       StrCmp );
}

int get_wanted_flag( const char *flag )
{
  return get_in_array( flag, planet_flags,
                       sizeof( planet_flags ) / sizeof( planet_flags[0] ),
                       StrCmp );
}

int get_pcflag( const char *flag )
{
  return get_in_array( flag, pc_flags,
                       sizeof( pc_flags ) / sizeof( pc_flags[0] ),
                       StrCmp );
}

int get_plrflag( const char *flag )
{
  return get_in_array( flag, plr_flags,
                       sizeof( plr_flags ) / sizeof( plr_flags[0] ),
                       StrCmp );
}

int get_risflag( const char *flag )
{
  return get_in_array( flag, ris_flags,
                       sizeof( ris_flags ) / sizeof( ris_flags[0] ),
                       StrCmp );
}

int get_trigflag( const char *flag )
{
  return get_in_array( flag, trig_flags,
                       sizeof( trig_flags ) / sizeof( trig_flags[0] ),
                       StrCmp );
}

int get_partflag( const char *flag )
{
  return get_in_array( flag, part_flags,
                       sizeof( part_flags ) / sizeof( part_flags[0] ),
                       StrCmp );
}

int get_attackflag( const char *flag )
{
  return get_in_array( flag, attack_flags,
                       sizeof( attack_flags ) / sizeof( attack_flags[0] ),
                       StrCmp );
}

int get_defenseflag( const char *flag )
{
  return get_in_array( flag, defense_flags,
                       sizeof( defense_flags ) / sizeof( defense_flags[0] ),
                       StrCmp );
}

int get_langflag( const char *flag )
{
  int x = 0;

  for ( x = 0; lang_array[x] != LANG_UNKNOWN; x++ )
    if ( !StrCmp( flag, lang_names[x] ) )
      return lang_array[x];

  return LANG_UNKNOWN;
}

int get_spicetype( const char *type )
{
  return get_in_array( type, spice_table,
                       sizeof( spice_table ) / sizeof( spice_table[0] ),
                       StrCmp );
}

int get_weapontype( const char *type )
{
  return get_in_array( type, weapon_table,
                       sizeof( weapon_table ) / sizeof( weapon_table[0] ),
                       StrCmp );
}

int get_crystaltype( const char *type )
{
  return get_in_array( type, crystal_table,
                       sizeof( crystal_table ) / sizeof( crystal_table[0] ),
                       StrCmp );
}

int get_attacktype( const char *type )
{
  return get_in_array( type, attack_table,
                       sizeof( attack_table ) / sizeof( attack_table[0] ),
                       StrCmp );
}

const char * const save_flag[] =
  { "death", "kill", "passwd", "drop", "put", "give", "auto", "zap",
    "auction", "get", "receive", "idle", "backup", "r13", "r14", "r15", "r16",
    "r17", "r18", "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", "r27",
    "r28", "r29", "r30", "r31" };

int get_saveflag( const char *flag )
{
  return get_in_array( flag, save_flag,
                       sizeof( save_flag ) / sizeof( save_flag[0] ),
                       StrCmp );
}
