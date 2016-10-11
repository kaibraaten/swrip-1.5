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
#include "skill.h"

static int GetInArray( const char *name, const char * const * array,
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
const struct Race RaceTable[MAX_RACE] =
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


const char *const NpcRace[MAX_NPC_RACE] =
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
    "_60", "_61", "_62", "_63", "_64", "_65", "_66",
    "_67", "_68", "_69", "_70", "_71", "_72", "_73", "_74",
    "_75", "_76", "_77", "_78", "_79", "_80", "_81", "_82",
    "_83", "_84", "_85", "_86", "_87", "_88",
    "_89"
  };


const char * const AbilityName[MAX_ABILITY] =
  {
    "combat", "piloting", "engineering", "bounty hunting", "smuggling",
    "diplomacy", "leadership", "force", "commando"
  };

size_t GetAbilityNameSize(void)
{
  return sizeof(AbilityName) / sizeof(*AbilityName);
}

int GetAbility( const char *type )
{
  return GetInArray( type, AbilityName, GetAbilityNameSize(), StrCmp );
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
const struct LiquidType LiquidTable[LIQ_MAX] =
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

const char * const AttackTable[] =
  {
    "hit",
    "slice",  "stab",  "slash", "whip", "claw",
    "blast",  "pound", "crush", "shot", "bite",
    "pierce", "suction"
  };

size_t GetAttackTableSize( void )
{
  return sizeof( AttackTable ) / sizeof( AttackTable[0] );
}

const char *GetAttackType_name( size_t type )
{
  if(type >= GetAttackTableSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return AttackTable[type];
}

const char * const SpaceobjectTypeName[] =
  {
    "sun", "planet", "_space_moveobj", "_space_obj"
  };

size_t GetSpaceobjectTypeSize( void )
{
  return sizeof(SpaceobjectTypeName) / sizeof(*SpaceobjectTypeName);
}

SpaceobjectType GetSpaceobjectType( const char *type )
{
  return (SpaceobjectType)GetInArray( type, SpaceobjectTypeName, GetSpaceobjectTypeSize(), StringPrefix );
}

const char * const SkillTypeName[] =
  {
    "unknown", "Force Power", "Skill", "Weapon", "Tongue", "Herb"
  };

skill_types GetSkillType( const char *skilltype )
{
  if( !StrCmp( skilltype, "Spell" ) )
    {
      skilltype = "Force Power";
    }

  return (skill_types) GetInArray( skilltype, SkillTypeName, GetSkillTypeNameSize(), StrCmp );
}

size_t GetSkillTypeNameSize( void )
{
  return sizeof( SkillTypeName ) / sizeof( SkillTypeName[0] );
}

int GetSkillTypeName( const char *type )
{
  return GetInArray( type, SkillTypeName, GetSkillTypeNameSize(), StrCmp );
}

const char * const DirectionName[] =
  {
    "north", "east", "south", "west", "up", "down",
    "northeast", "northwest", "southeast", "southwest", "somewhere"
  };

const DirectionType ReverseDirection[] =
  {
    DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_EAST, DIR_DOWN, DIR_UP,
    DIR_SOUTHWEST, DIR_SOUTHEAST, DIR_NORTHWEST, DIR_NORTHEAST, DIR_SOMEWHERE
  };

const char *GetDirectionName( DirectionType dir )
{
  if( dir > DIR_SOMEWHERE )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, dir);
      return NULL;
    }

  return DirectionName[dir];
}

DirectionType GetReverseDirection( DirectionType dir )
{
  if( dir > DIR_SOMEWHERE )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, dir);
      return DIR_SOMEWHERE;
    }

  return ReverseDirection[dir];
}

DirectionType GetDirection( const char *txt )
{
  DirectionType edir = DIR_INVALID;
  char c1 = 0, c2 = 0;

  if ( !StrCmp( txt, GetDirectionName( DIR_NORTH ) ) )
    return DIR_NORTH;

  if ( !StrCmp( txt, GetDirectionName( DIR_EAST ) ) )
    return DIR_EAST;

  if ( !StrCmp( txt, GetDirectionName( DIR_SOUTH ) ) )
    return DIR_SOUTH;

  if ( !StrCmp( txt, GetDirectionName( DIR_WEST ) ) )
    return DIR_WEST;

  if ( !StrCmp( txt, GetDirectionName( DIR_UP ) ) )
    return DIR_UP;

  if ( !StrCmp( txt, GetDirectionName( DIR_DOWN ) ) )
    return DIR_DOWN;

  if ( !StrCmp( txt, GetDirectionName( DIR_NORTHEAST ) ) )
    return DIR_NORTHEAST;

  if ( !StrCmp( txt, GetDirectionName( DIR_NORTHWEST ) ) )
    return DIR_NORTHWEST;

  if ( !StrCmp( txt, GetDirectionName( DIR_SOUTHEAST ) ) )
    return DIR_SOUTHEAST;

  if ( !StrCmp( txt, GetDirectionName( DIR_SOUTHWEST ) ) )
    return DIR_SOUTHWEST;

  if ( !StrCmp( txt, GetDirectionName( DIR_SOMEWHERE ) ) )
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

const char * const WhereName[] =
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

const int TrapDoor[] =
  {
    TRAP_N, TRAP_E, TRAP_S, TRAP_W, TRAP_U, TRAP_D,
    TRAP_NE, TRAP_NW, TRAP_SE, TRAP_SW
  };

const char * const SectorNames[SECT_MAX][2] =
  {
    { "In A Room",      "inside"      }, /* SECT_INSIDE       */
    { "A City Street",  "city"      }, /* SECT_CITY         */
    { "In A Field",     "field"      }, /* SECT_FIELD        */
    { "In A Forest",    "forest"     }, /* SECT_FOREST       */
    { "Hill",           "hills"       }, /* SECT_HILLS        */
    { "On A Mountain",  "mountain"   }, /* SECT_MOUNTAIN     */
    { "In The Water",   "water_swim"      }, /* SECT_WATER_SWIM   */
    { "In Rough Water", "water_noswim"      }, /* SECT_WATER_NOSWIM */
    { "Underwater",     "underwater" }, /* SECT_UNDERWATER   */
    { "In The Air",     "air"         }, /* SECT_AIR          */
    { "In A Desert",    "desert"     }, /* SECT_DESERT       */
    { "Somewhere",      "unknown"     }, /* SECT_DUNNO        */
    { "Ocean floor",    "oceanfloor" }, /* SECT_OCEANFLOOR   */
    { "Underground",    "underground" }  /* SECT_UNDERGROUND  */
  };

SectorType GetSectorType( const char *type )
{
  SectorType sector = SECT_INSIDE;

  for( sector = SECT_INSIDE; sector < SECT_MAX; sector = (SectorType)(sector + 1) )
    {
      if( !StrCmp( type, SectorNames[sector][1] ) )
	{
	  return sector;
	}      
    }

  return SECT_INVALID;
}

const short MovementLoss[SECT_MAX] =
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

const int SentTotal[SECT_MAX] =
  {
    4, 24, 4, 4, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1
  };

const char * const RoomSents[SECT_MAX][25] =
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

const char * const RoomFlags[] =
  {
    "Dark",
    "Reserved",
    "NoMob",
    "Indoors",
    "CanLand",
    "CanFly",
    "NoDrive",
    "NoMagic",
    "Bank",
    "Private",
    "Safe",
    "_11",
    "PetShop",
    "Aena",
    "Donation",
    "NoDropAll",
    "Silence",
    "LogSpeech",
    "NoDrop",
    "ClanStoreroom",
    "PlayerHome",
    "EmptyHome",
    "Teleport",
    "Hotel",
    "NoFloor",
    "Refinery",
    "Factory",
    "Recruit",
    "PlayerShop",
    "Spacecraft",
    "Prototype",
    "Auction"
  };

const char * const WearFlags[] =
  {
    "Take",
    "Finger",
    "Neck",
    "Body",
    "Head",
    "Legs",
    "Feet",
    "Hands",
    "Arms",
    "Shield",
    "About",
    "Waist",
    "Wrist",
    "Wield",
    "Hold",
    "_dual_",
    "Ears",
    "Eyes",
    "_missile_",
    "Floating",
    "Over",
    "Disguise",
    "MaxWear",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const ObjectFlags[] =
  {
    "Glow",
    "Hum",
    "_02",
    "HuttSize",
    "Contraband",
    "Invis",
    "Magic",
    "NoDrop",
    "Bless",
    "AntiGood",
    "AntiEvil",
    "AntiNeutral",
    "NoRemove",
    "Inventory",
    "_14",
    "_15",
    "_16",
    "_17",
    "SmallSize",
    "LargeSize",
    "_20",
    "ClanObject",
    "_22",
    "_23",
    "_24",
    "Hidden",
    "Poisoned",
    "Covering",
    "DeathRot",
    "Burried",
    "Prototype",
    "HumanSize"
  };

const char * const AffectFlags[] =
  {
    "Blind",
    "Invisible",
    "DetectEvil",
    "DetectInvis",
    "DetectMagic",
    "DetectHidden",
    "Weaken",
    "Sanctuary",
    "FaerieFire",
    "Infrared",
    "Curse",
    "_flaming",
    "Poison",
    "Protect",
    "Paralysis",
    "Sneak",
    "Hide",
    "Sleep",
    "Charm",
    "Flying",
    "PassDoor",
    "Floating",
    "TrueSight",
    "DetectTraps",
    "Scrying",
    "Fireshield",
    "Shockshield",
    "_27",
    "Iceshield",
    "Possess",
    "Berserk",
    "AquaBreath"
  };

const char * const ObjectTypes[] =
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
    "drink_container",
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

const char * const AffectTypes[] =
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

const char * const MobFlags[] =
  {
    "Npc",
    "Sentinel",
    "Scavenger",
    "_03",
    "_04",
    "Aggressive",
    "StayArea",
    "Wimpy",
    "Pet",
    "Train",
    "Practice",
    "Immortal",
    "Deadly",
    "PolySelf",
    "MetaAggr",
    "Guardian",
    "Running",
    "NoWander",
    "Mountable",
    "Mounted",
    "Scholar",
    "Secretive",
    "Polymorphed",
    "MobInvis",
    "NoAssist",
    "NoKill",
    "Droid",
    "NoCorpse",
    "_28",
    "_29",
    "Prototype",
    "_31"
 };

const char * const PlanetFlags[] =
  {
    "Coruscant",
    "Kashyyyk",
    "Ryloth",
    "_03",
    "_04",
    "Mon Calamari",
    "Honoghr",
    "Gamorr",
    "Tatooine",
    "Adari",
    "Byss",
    "Endor",
    "_12",
    "_13",
    "_14",
    "_15",
    "_16",
    "Corellia",
    "Hoth",
    "_18",
    "_19",
    "Kuat",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const WeaponTable[13] =
  {
    "none",
    "vibro-axe",
    "vibro-blade",
    "lightsaber",
    "whip",
    "claw",
    "blaster",
    "_07",
    "bludgeon",
    "bowcaster",
    "_10",
    "force pike",
    "_12"
  };

size_t GetWeaponTableSize( void )
{
  return sizeof(WeaponTable) / sizeof(*WeaponTable);
}

const char *GetWeaponTypeName( size_t type )
{
  if( type >= GetWeaponTableSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return WeaponTable[type];
}

const char * const SpiceTable[] =
  {
    "glitterstim", "carsanum", "ryll","andris","lumni"
  };

size_t GetSpiceTableSize(void)
{
  return sizeof(SpiceTable) / sizeof(*SpiceTable);
}

const char *GetSpiceTypeName( size_t type )
{
  if( type >= GetSpiceTableSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpiceTable[type];
}

const char * const PlayerFlags[] =
  {
    "Npc",
    "BoughtPet",
    "ShoveDrag",
    "Autoexits",
    "Autoloot",
    "Autosac",
    "Blank",
    "Outcast",
    "Brief",
    "Combine",
    "Prompt",
    "TelnetGA",
    "Holylight",
    "WizInvis",
    "RoomVnum",
    "Silence",
    "NoEmote",
    "Attacker",
    "NoTell",
    "Log",
    "Deny",
    "Freeze",
    "Killer",
    "HomeResident",
    "Litterbug",
    "Ansi",
    "Rip",
    "Nice",
    "Flee",
    "Autocred",
    "Automap",
    "afk"
  };

const char * const PcFlags[] =
  {
    "_00",
    "Deadly",
    "Unauthed",
    "NoRecall",
    "NoIntro",
    "Gag",
    "Retired",
    "Guest",
    "NoSummon",
    "PagerOn",
    "NoTitled",
    "Room",
    "_12",
    "_13",
    "_14",
    "_15",
    "_16",
    "_17",
    "_18",
    "_19",
    "_20",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const TrapFlags[] =
  {
    "Room",
    "Obj",
    "Enter",
    "Leave",
    "Open",
    "Close",
    "Get",
    "Put",
    "Pick",
    "Unlock",
    "North",
    "South",
    "East",
    "West",
    "Up",
    "Down",
    "Examine",
    "Northeast",
    "Northwest",
    "Southeast",
    "Southwest",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const RisFlags[] =
  {
    "fire",
    "cold",
    "electricity",
    "energy",
    "blunt",
    "pierce",
    "slash",
    "acid",
    "poison",
    "drain",
    "sleep",
    "charm",
    "hold",
    "nonmagic",
    "plus1",
    "plus2",
    "plus3",
    "plus4",
    "plus5",
    "plus6",
    "magic",
    "paralysis",
    "steal",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const TriggerFlags[] =
  {
    "up",
    "unlock",
    "lock",
    "d_north",
    "d_south",
    "d_east",
    "d_west",
    "d_up",
    "d_down",
    "door",
    "container",
    "open",
    "close",
    "passage",
    "oload",
    "mload",
    "teleport",
    "teleportall",
    "teleportplus",
    "death",
    "cast",
    "fakeblade",
    "rand4",
    "rand6",
    "trapdoor",
    "anotherroom",
    "usedial",
    "absolutevnum",
    "showroomdesc",
    "autoreturn",
    "_30",
    "_31"
  };

const char * const PartFlags[] =
  {
    "head",
    "arms",
    "legs",
    "heart",
    "brains",
    "guts",
    "hands",
    "feet",
    "fingers",
    "ear",
    "eye",
    "long_tongue",
    "eyestalks",
    "tentacles",
    "fins",
    "wings",
    "tail",
    "scales",
    "claws",
    "fangs",
    "horns",
    "tusks",
    "tailattack",
    "sharpscales",
    "beak",
    "haunches",
    "hooves",
    "paws",
    "forelegs",
    "feathers",
    "_30",
    "_31"
  };

const char * const DefenseFlags[] =
  {
    "parry",
    "dodge",
    "_02",
    "_03",
    "_04",
    "_05",
    "_06",
    "_07",
    "_08",
    "_09",
    "_10",
    "_11",
    "_12",
    "_13",
    "_14",
    "_15",
    "_16",
    "_17",
    "_18",
    "_19",
    "_20",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const AttackFlags[] =
  {
    "bite",
    "claws",
    "tail",
    "sting",
    "punch",
    "kick",
    "_06",
    "_07",
    "_08",
    "_09",
    "_10",
    "_11",
    "_12",
    "_13",
    "_14",
    "_15",
    "_16",
    "_17",
    "_18",
    "_19",
    "_20",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const AreaFlags[] =
  {
    "NoPkill",
    "_01",
    "Changed",
    "_03",
    "_04",
    "_05",
    "_06",
    "_07",
    "_08",
    "_09",
    "_10",
    "_11",
    "_12",
    "_13",
    "_14",
    "_15",
    "_16",
    "_17",
    "_18",
    "_19",
    "_20",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const char * const WearLocations[] =
  {
    "light",
    "finger1",
    "finger2",
    "neck1",
    "neck2",
    "body",
    "head",
    "legs",
    "feet",
    "hands",
    "arms",
    "shield",
    "about",
    "waist",
    "wrist1",
    "wrist2",
    "wield",
    "hold",
    "dual_wield",
    "ears",
    "eyes",
    "missile_wield",
    "floating",
    "over"
  };

const char * const ExitFlags[] =
  {
    "IsDoor",
    "Closed",
    "Locked",
    "Secret",
    "Swim",
    "PickProof",
    "Fly",
    "Climb",
    "Dig",
    "_09",
    "NoPassdoor",
    "Hidden",
    "Passage",
    "Portal",
    "_14",
    "_15",
    "CanClimb",
    "CanEnter",
    "CanLeave",
    "Auto",
    "_20",
    "Searchable",
    "Bashed",
    "BashProof",
    "NoMob",
    "Window",
    "CanLook",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

const int LanguageArray[] =
  {
    LANG_COMMON,
    LANG_WOOKIEE,
    LANG_TWI_LEK,
    LANG_RODIAN,
    LANG_HUTT,
    LANG_MON_CALAMARI,
    LANG_SHISTAVANEN,
    LANG_EWOK,
    LANG_ITHORIAN,
    LANG_GOTAL,
    LANG_DEVARONIAN,
    LANG_DROID,
    LANG_SPIRITUAL,
    LANG_MAGICAL,
    LANG_GAMORREAN,
    LANG_GOD,
    LANG_ANCIENT,
    LANG_JAWA,
    LANG_CLAN,
    LANG_ADARIAN,
    LANG_VERPINE,
    LANG_DEFEL,
    LANG_TRANDOSHAN,
    LANG_CHADRA_FAN,
    LANG_QUARREN,
    LANG_SULLUSTAN,
    LANG_FALLEEN,
    LANG_BINARY,
    LANG_YEVETHAN,
    LANG_GAND,
    LANG_DUROS,
    LANG_COYNITE,
    LANG_UNKNOWN
  };

const char * const LanguageNames[] =
  {
    "common",
    "wookiee",
    "twilek",
    "rodian",
    "hutt",
    "mon calamari",
    "shistavanen",
    "ewok",
    "ithorian",
    "gotal",
    "devaronian",
    "barabel",
    "firrerreo",
    "bothan",
    "gamorrean",
    "togorian",
    "kubaz",
    "jawa",
    "clan",
    "adarian",
    "verpine",
    "defel",
    "trandoshan",
    "chadra-fan",
    "quarren",
    "sullustan",
    "falleen",
    "binary",
    "yevethan",
    "gand",
    "duros",
    "coynite",
    ""
  };

const char * const CrystalTable[] =
  {
    "non-adegan", "kathracite", "relacite", "danite", "mephite",
    "ponite", "illum", "corusca"
  };

size_t GetCrystalTableSize( void )
{
  return sizeof( CrystalTable ) / sizeof( *CrystalTable );
}

const char *GetCrystalTypeName( size_t type )
{
  if( type >= GetCrystalTableSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return CrystalTable[type];
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

const char * const SpellFlag[] =
  {
    "_00",
    "_01",
    "_02",
    "_03",
    "_04",
    "_05",
    "_06",
    "_07",
    "_08",
    "_09",
    "_10",
    "Water",
    "Earth",
    "Air",
    "Astral",
    "Area",
    "Distant",
    "Reverse",
    "SaveHalfDam",
    "SaveNegates",
    "Accumulative",
    "Recastable",
    "NoScribe",
    "NoBrew",
    "Group",
    "Object",
    "Character",
    "SecretSkill",
    "PkSensitive",
    "StopOnFail",
    "_30",
    "_31"
  };

size_t spellflag_size( void )
{
  return sizeof( SpellFlag ) / sizeof( *SpellFlag );
}

const char * const SpellSaveName[] =
  {
    "none", "poison_death", "wands", "para_petri", "breath", "spell_staff"
  };

size_t GetSpellSavesSize( void )
{
  return sizeof( SpellSaveName ) / sizeof( *SpellSaveName );
}

const char *GetSpellSavesName( size_t type )
{
  if( type >= GetSpellSavesSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpellSaveName[type];
}

const char * const SpellDamage[] =
  {
    "none", "fire", "cold", "electricity", "energy", "acid", "poison", "drain"
  };

size_t GetSpellDamageSize( void )
{
  return sizeof( SpellDamage ) / sizeof( *SpellDamage );
}

const char *GetSpellDamageName( size_t type )
{
  if( type >= GetSpellDamageSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpellDamage[type];
}

const char * const SpellAction[] =
  {
    "none", "create", "destroy", "resist", "suscept", "divinate", "obscure",
    "change"
  };

size_t GetSpellActionSize( void )
{
  return sizeof( SpellAction ) / sizeof( *SpellAction );
}

const char *GetSpellActionName( size_t type )
{
  if( type >= GetSpellActionSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpellAction[type];
}

const char * const SpellPower[] =
  {
    "none", "minor", "greater", "major"
  };

size_t GetSpellPowerSize( void )
{
  return sizeof( SpellPower ) / sizeof( *SpellPower );
}

const char *GetSpellPowerName( size_t type )
{
  if( type >= GetSpellPowerSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpellPower[type];
}

const char * const SpellClass[] =
  {
    "none", "lunar", "solar", "travel", "summon", "life", "death", "illusion"
  };

size_t GetSpellClassSize( void )
{
  return sizeof( SpellClass ) / sizeof( *SpellClass );
}

const char *GetSpellClassName( size_t type )
{
  if( type >= GetSpellClassSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpellClass[type];
}

const char * const SpellTargetName[] =
  {
    "ignore", "offensive", "defensive", "self", "objinv"
  };

size_t GetSpellTargetSize( void )
{
  return sizeof( SpellTargetName ) / sizeof( *SpellTargetName );
}

const char *GetSpellTargetName( size_t type )
{
  if( type >= GetSpellTargetSize() )
    {
      Bug("%s: subscript %d out of range", __FUNCTION__, type);
      return NULL;
    }

  return SpellTargetName[type];
}

int GetSpellSave( const char *name )
{
  return GetInArray( name, SpellSaveName,
		     sizeof( SpellSaveName ) / sizeof( SpellSaveName[0] ),
		     StrCmp );
}

target_types GetSpellTarget( const char *name )
{
  return (target_types)GetInArray( name, SpellTargetName,
				   sizeof( SpellTargetName ) / sizeof( SpellTargetName[0] ),
				   StrCmp );
}

int GetSpellFlag( const char *name )
{
  return GetInArray( name, SpellFlag,
		     sizeof( SpellFlag ) / sizeof( SpellFlag[0] ),
		     StrCmp );
}

int GetSpellDamage( const char *name )
{
  return GetInArray( name, SpellDamage,
		     sizeof( SpellDamage ) / sizeof( SpellDamage[0] ),
		     StrCmp );
}

int GetSpellAction( const char *name )
{
  return GetInArray( name, SpellAction,
		     sizeof( SpellAction ) / sizeof( SpellAction[0] ),
		     StrCmp );
}

int GetSpellPower( const char *name )
{
  return GetInArray( name, SpellPower,
		     sizeof( SpellPower ) / sizeof( SpellPower[0] ),
		     StrCmp );
}

int GetSpellClass( const char *name )
{
  return GetInArray( name, SpellClass,
		     sizeof( SpellClass ) / sizeof( SpellClass[0] ),
		     StrCmp );
}

int GetObjectType( const char *type )
{
  return GetInArray( type, ObjectTypes,
		     sizeof( ObjectTypes ) / sizeof( ObjectTypes[0] ),
		     StrCmp );
}

int GetAffectFlag( const char *flag )
{
  return GetInArray( flag, AffectFlags,
		     sizeof( AffectFlags ) / sizeof( AffectFlags[0] ),
		     StrCmp );
}

int GetTrapFlag( const char *flag )
{
  return GetInArray( flag, TrapFlags,
		     sizeof( TrapFlags ) / sizeof( TrapFlags[0] ),
		     StrCmp );
}

int GetAffectType( const char *type )
{
  return GetInArray( type, AffectTypes, MAX_APPLY_TYPE, StrCmp );
}

int GetNpcRace( const char *type )
{
  return GetInArray( type, NpcRace, MAX_NPC_RACE, StrCmp );
}

int GetWearLocation( const char *type )
{
  return GetInArray( type, WearLocations, MAX_WEAR, StrCmp );
}

int GetExitFlag( const char *flag )
{
  return GetInArray( flag, ExitFlags, MAX_EXFLAG, StrCmp );
}

int GetRoomFlag( const char *flag )
{
  return GetInArray( flag, RoomFlags,
		     sizeof( RoomFlags ) / sizeof( RoomFlags[0] ),
		     StrCmp );
}

int GetMudProgFlag( const char *flag )
{
  return GetInArray( flag, mprog_flags,
		     sizeof( mprog_flags ) / sizeof( mprog_flags[0] ),
		     StrCmp );
}

int GetObjectFlag( const char *flag )
{
  return GetInArray( flag, ObjectFlags,
		     sizeof( ObjectFlags ) / sizeof( ObjectFlags[0] ),
		     StrCmp );
}

int GetAreaFlag( const char *flag )
{
  return GetInArray( flag, AreaFlags,
		     sizeof( AreaFlags ) / sizeof( AreaFlags[0] ),
		     StrCmp );
}

int GetWearFlag( const char *flag )
{
  return GetInArray( flag, WearFlags,
		     sizeof( WearFlags ) / sizeof( WearFlags[0] ),
		     StrCmp );
}

int GetMobFlag( const char *flag )
{
  return GetInArray( flag, MobFlags,
		     sizeof( MobFlags ) / sizeof( MobFlags[0] ),
		     StrCmp );
}

int GetVipFlag( const char *flag )
{
  return GetInArray( flag, PlanetFlags,
		     sizeof( PlanetFlags ) / sizeof( PlanetFlags[0] ),
		     StrCmp );
}

int GetWantedFlag( const char *flag )
{
  return GetInArray( flag, PlanetFlags,
		     sizeof( PlanetFlags ) / sizeof( PlanetFlags[0] ),
		     StrCmp );
}

int GetPcFlag( const char *flag )
{
  return GetInArray( flag, PcFlags,
		     sizeof( PcFlags ) / sizeof( PcFlags[0] ),
		     StrCmp );
}

int GetPlayerFlag( const char *flag )
{
  return GetInArray( flag, PlayerFlags,
		     sizeof( PlayerFlags ) / sizeof( PlayerFlags[0] ),
		     StrCmp );
}

int GetResistanceFlag( const char *flag )
{
  return GetInArray( flag, RisFlags,
		     sizeof( RisFlags ) / sizeof( RisFlags[0] ),
		     StrCmp );
}

int GetTrapTriggerFlag( const char *flag )
{
  return GetInArray( flag, TriggerFlags,
		     sizeof( TriggerFlags ) / sizeof( TriggerFlags[0] ),
		     StrCmp );
}

int GetBodyPartFlag( const char *flag )
{
  return GetInArray( flag, PartFlags,
		     sizeof( PartFlags ) / sizeof( PartFlags[0] ),
		     StrCmp );
}

int GetAttackFlag( const char *flag )
{
  return GetInArray( flag, AttackFlags,
		     sizeof( AttackFlags ) / sizeof( AttackFlags[0] ),
		     StrCmp );
}

int GetDefenseFlag( const char *flag )
{
  return GetInArray( flag, DefenseFlags,
		     sizeof( DefenseFlags ) / sizeof( DefenseFlags[0] ),
		     StrCmp );
}

int GetLanguage( const char *flag )
{
  int x = 0;

  for ( x = 0; LanguageArray[x] != LANG_UNKNOWN; x++ )
    if ( !StrCmp( flag, LanguageNames[x] ) )
      return LanguageArray[x];

  return LANG_UNKNOWN;
}

int GetSpiceType( const char *type )
{
  return GetInArray( type, SpiceTable,
		     sizeof( SpiceTable ) / sizeof( SpiceTable[0] ),
		     StrCmp );
}

int GetWeaponType( const char *type )
{
  return GetInArray( type, WeaponTable,
		     sizeof( WeaponTable ) / sizeof( WeaponTable[0] ),
		     StrCmp );
}

int GetCrystalType( const char *type )
{
  return GetInArray( type, CrystalTable,
		     sizeof( CrystalTable ) / sizeof( CrystalTable[0] ),
		     StrCmp );
}

int GetAttackType( const char *type )
{
  return GetInArray( type, AttackTable,
		     sizeof( AttackTable ) / sizeof( AttackTable[0] ),
		     StrCmp );
}

const char * const SaveFlags[] =
  {
    "Death",
    "Kill",
    "Passwd",
    "Drop",
    "Put",
    "Give",
    "Auto",
    "Zap",
    "Auction",
    "Get",
    "Receive",
    "Idle",
    "Backup",
    "_13",
    "_14",
    "_15",
    "_16",
    "_17",
    "_18",
    "_19",
    "_20",
    "_21",
    "_22",
    "_23",
    "_24",
    "_25",
    "_26",
    "_27",
    "_28",
    "_29",
    "_30",
    "_31"
  };

int GetSaveFlag( const char *flag )
{
  return GetInArray( flag, SaveFlags,
		     sizeof( SaveFlags ) / sizeof( SaveFlags[0] ),
		     StrCmp );
}

const char * const PositionName[MAX_POSITION] =
  {
    "dead",
    "mortally wounded",
    "incapacitated",
    "stunned",
    "sleeping",
    "resting",
    "sitting",
    "fighting",
    "standing",
    "mounted",
    "shoved",
    "dragged"
  };

int GetPosition( const char *posName )
{
  return GetInArray( posName, PositionName,
		     sizeof( PositionName ) / sizeof( PositionName[0] ),
		     StrCmp );
}

const char * const CmdLogName[] =
  {
    "normal",
    "always",
    "never",
    "build",
    "high",
    "comm",
    "all"
  };

int GetCmdLog( const char *logName )
{
  return GetInArray( logName, CmdLogName,
                     sizeof( CmdLogName ) / sizeof( CmdLogName[0] ),
                     StrCmp );
}
