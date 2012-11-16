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
 *                           Mud constants module                          *
 ****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <time.h>
#include "mud.h"

/* undef these at EOF */
#define AM 95
#define AC 95
#define AT 85
#define AW 85
#define AV 95
#define AD 95
#define AR 90
#define AA 95

/*
 * Race table.
 */
const   struct  race_type       race_table      [MAX_RACE]      =
  {
    /*  race name          DEF_AFF      st dx ws in cn ch lk fc hp mn re su     RESTRICTION  LANGUAGE */
    //Firrieron, Barabel, Bothan, Togorian, Dug, Kubaz, Selonian, Gran, Yevetha, (Ooryl) Gand, Duros, Coynite.
    {
      "Human",  0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,           LANG_COMMON
    },//nada
    {
      "Wookiee",        0,      4,      -1,     -3,     0,      2,      -2,     0,      0,      +30,    0,      0,      0,      0,          LANG_WOOKIEE
    },//+cmbt
    {
      "Twi'lek",        0,      0,      2,      2,      2,      -1,     -1,     0,      0,      0,      0,      0,      0,      0,  LANG_TWI_LEK
    },
    {
      "Rodian", 0,      -1,     3,      0,      0,      1,      -1,     0,      0,      -10,    0,      0,      0,      0,      LANG_RODIAN
    },
    {
      "Hutt",   0,      5,      -9,     3,      4,      5,      -10,    0,      0,      +700,   0, (RIS_SLEEP+RIS_POISON+RIS_PARALYSIS+RIS_ENERGY), 0,       0,     LANG_HUTT
    },//--cmbt, -smg, -80bh, ++lead
    {
      "Mon Calamari",   AFF_AQUA_BREATH,        1,      -1,     2,      4,      0,      0,      0,      0,      +20,    0, 0, 0,         0,    LANG_MON_CALAMARI
    },//-cmbt
    {
      "Shistavanen",    AFF_SNEAK,      +3,     +4,     -1,     0,      -2,     -4,     0,      0,      +20,    0, 0, RIS_NONMAGIC+RIS_POISON,  0, LANG_SHISTAVANEN
    },
    {
      "Gamorrean",      0,      5,      0,      -5,     -5,     5,      -2,     0,      0,      +60,    0, 0, (RIS_SLEEP+RIS_PARALYSIS+RIS_MAGIC),       0,   LANG_GAMORREAN
    },
    {
      "Jawa",   0,      -3,     3,      1,      0,      0,      -2,     0,      0,      -20,    0,      0,      0,       0,    LANG_JAWA
    },
    {
      "Adarian",        0,      -2,     -1,     +2,     +2,     -1,     +2,     0,      0,      -50,    0,      0, 0,   0,  LANG_ADARIAN
    },
    {
      "Ewok",   0,      -1,     -1,     -3,     -5,     -2,     +5,     0,      0,      -100,   0,      0,      0,      0,           LANG_EWOK
    },
    {
      "Verpine",        0,      0,      0,      +1,     +5,     -1,     0,      0,      0,      0,      0,      0,      0,      0,           LANG_VERPINE
    },//-cmbt
    {
      "Defel",  AFF_HIDE+AFF_SNEAK,+1,  +3,     -3,     -3,     +1,     0,      0,      0,      +15,    0,      0, 0,   0,           LANG_DEFEL
    },
    {
      "Trandoshan",     AFF_INFRARED,   +3,     -1,     0,      0,      +6,     -1,     0,      0,      +35,    0,      0, 0,   0,           LANG_TRANDOSHAN
    },//-cmbt(possible)
    {
      "Chadra-Fan",     AFF_INFRARED,   -3,     +3,     0,      +2,     -1,     0,      0,      0,      -85,    0,      0, 0,   0,           LANG_CHADRA_FAN
    },
    {
      "Quarren",        AFF_AQUA_BREATH+AFF_INFRARED,   -1,     +1,     0,      +1,     -1,     0,      0,      0,      -10,    0,      0, 0,   0,           LANG_MON_CALAMARI
    },
    {
      "Sullustan",      0,               -2,    0,      +2,     +5,     0,      +1,     0,      0,      0,      0,      0,      0,      0,           LANG_SULLUSTAN
    },
    {
      "Falleen",        AFF_AQUA_BREATH,         0,     1,      +3,     +1,     -1,     +4,     0,      0,      0,      0,      0, 0,   0,           LANG_FALLEEN
    },
    {
      "Ithorian",       0,       +5,    +3,     +3,     0,      0,      -4,     0,      0,      -30,    0,      0, 0,   0,           LANG_ITHORIAN
    },//---cmbt
    {
      "Devaronian",     0,       +1,    +3,     1,      -1,     -1,     -3,     0,      0,      0,      0,      0,      0,      0,           LANG_DEVARONIAN
    },
    {
      "Gotal",  AFF_DETECT_MAGIC,        -1,    0,      +1,     0,      0,      0,      0,      0,      0,      0,      0,      0,      0,           LANG_GOTAL
    },
    {
      "Droid",           AFF_AQUA_BREATH+AFF_INFRARED,          0, -2, +1, +4, -4, +1, 0, 0, 0, 0, 0, RIS_SLEEP+RIS_ELECTRICITY,        0,           LANG_BINARY
    },
    //"Firrerreo", "Barabel", "Bothan", "Togorian", "Dug", "Kubaz", "Selonian", "Gran", "Yevetha", "Gand", "Duros", "Coynite",
    {
      "Firrerreo",      AFF_AQUA_BREATH,        +1,     -2,     0,      0,      +2,     +3,     0,      0,      +40,    +1000, RIS_FIRE, 0,     0,           LANG_FIRRERREO
    },/*-dip/lead, +1500 mana, no force levels, leave on so that if a forcer does come they have large
        ammounts of mana, but no real force boost*/
    {
      "Barabel",                0,      +5,     -1,     -1,     1,      +5,     -4,     0,      0,      +220,   0, 0, 0,        0,           LANG_BARABEL
    },//++cmbt, -dip/lead
    {
      "Bothan", AFF_SNEAK|AFF_SCRYING,  0,      +3,     -3,     +4,     -4,     +4,     0,      0,      0,      0,      0,      0,      0,           LANG_BOTHAN + LANG_COMMON
    },//++lead/dip, -eng
    {
      "Togorian",       AFF_DETECT_HIDDEN|AFF_SNEAK,    +4,     +4,     0,      0,      -2,     -11,    0,      0,      +40,    0,      0, 0,   0,           LANG_TOGORIAN
    },//++cmbt,+bh
    {
      "Dug",    AFF_SNEAK,      -2,     +5,     -1,     0,      -1,     -2,     0,      0,      -15,    0,      0,      0,      0,           LANG_HUTT
    },//+cmbt
    {
      "Kubaz",  AFF_SCRYING,    0,      +3,     -1,     +3,     0,      -2,     0,      0,      0,      0,      0,      0,      0,           LANG_KUBAZ
    },//++lead,+dip,-pil
    {
      "Selonian",       0,      +2,     +2,     -5,     -2,     +3,     -1,     0,      0,      +35,    0,      0,      0,      0,           LANG_COMMON
    },//+combat,--lead/dip/pil
    {
      "Gran",   AFF_INFRARED,   +2,     0,      0,      -3,     +3,     -5,     0,      0,      0,      0,      RIS_POISON,     (RIS_SLEEP+RIS_PARALYSIS),      0,           LANG_HUTT
    },//+bh
    {
      "Yevetha",        0,      +3,     +1,     -3,     +2,     +2,     -8,     0,      0,      +45,    0,      RIS_POISON+RIS_COLD,    0,      0,           LANG_YEVETHAN
    },//++combat,+lead/eng,--dip
    {
      "Gand",   AFF_AQUA_BREATH,        +1,     -3,     +5,     0,      +1,     -2,     0,      0,      0,      0,      0,      0,      0,           LANG_GAND
    },//+lead/pilot
    {
      "Duros",  0,      -1,     +2,     +4,     +2,     -1,     -1,     0,      0,      0,      0,      0,      0,      0,           LANG_DUROS
    },//++engineer/pilot,--combat, -lead
    {
      "Coynite",        AFF_SNEAK,      +4,     +2,     +1,     0,      +1,     -3,     0,      0,      +30,    0,      0,      0,      0,           LANG_COYNITE
    },//++combat/lead, +bh, -piloting/dip
    {
      "Protocal Droid", AFF_AQUA_BREATH+AFF_INFRARED,   -5,     -5,     +5,     +5,     0,      +5,     0,      0,      0,      0,      0,      RIS_SLEEP+RIS_ELECTRICITY,      0,           LANG_BINARY
    },//(+)dip
    {
      "Assassin Droid", AFF_AQUA_BREATH+AFF_INFRARED,   +4,     +3,     -15,    +1,     +2,     -9,     0,      0,      100,    0,      0,      0,      0,           LANG_BINARY
    },//++BH,++combat
    {
      "Gladiator Droid",        AFF_AQUA_BREATH+AFF_INFRARED,   +5,     +3,     -9,     -6,     +4,     -9,     0,      0,      150,    0,      RIS_NONMAGIC,   RIS_SLEEP+RIS_ELECTRICITY,      0,           LANG_BINARY
    },//(+)combat
    {
      "Astromech",      AFF_AQUA_BREATH+AFF_INFRARED,   0,      -5,     -6,     +5,     -6,     0,      0,      0,      0,      0,      0,      RIS_SLEEP+RIS_ELECTRICITY,      0,           LANG_BINARY
    },//(+)pil
    {
      "Interrogation Droid",    AFF_AQUA_BREATH+AFF_INFRARED+AFF_FLYING+AFF_FLOATING,   0,      +4,     -9,     +5,     +1,     -5,     0,      0,      0,      0,      0,      RIS_SLEEP+RIS_ELECTRICITY,      0,           LANG_BINARY
    },//(+)lead
    {
      "God",    AFF_AQUA_BREATH+AFF_INFRARED+AFF_FLYING+AFF_FLOATING,   +5,     +5,     +5,     +5,     +5,     +5,     +5,     +5,     2000,   5000,   0,      RIS_SLEEP+RIS_ELECTRICITY,      0,           LANG_COMMON
    }//(+)lead
    /*  race name          DEF_AFF      st dx ws in cn ch lk fc hp mn re su     RESTRICTION  LANGUAGE */

  };


const char *  const   npc_race        [MAX_NPC_RACE] =
  {
    "Human", "Wookiee", "Twi'lek", "Rodian", "Hutt", "Mon Calamari", "Shistavanen",
    "Gamorrean", "Jawa", "Adarian", "Ewok", "Verpine", "Defel", "Trandoshan", "Chadra-Fan",
    "Quarren", "Sullustan", "Falleen", "Ithorian", "Devaronian", "Gotal", "Droid",
    "Firrerreo", "Barabel", "Bothan", "Togorian", "Dug", "Kubaz", "Selonian", "Gran", "Yevetha", "Gand",
    "Duros", "Coynite", "Protocal Droid", "Assassin Droid", "Gladiator Droid", "Astromech", "Interrogation Droid",
    "God", "Sarlac", "Saurin", "Snivvian", "Gand", "Gungan", "Weequay", "Bith",
    "Ortolan", "Snit", "Cerean", "Ugnaught", "Taun Taun", "Bantha", "Tusken",
    "Gherkin", "Zabrak", "Dewback", "Rancor", "Ronto", "Noghri",
    "r60", "r61", "r62", "r63", "r64", "r65", "r66",
    "r67", "r68", "r69", "r70", "r71", "r72", "r73", "r74",
    "r75", "r76", "r77", "r78","r79", "r80", "r81", "r82",
    "r83", "r84", "r85", "r86", "r87", "r88"
    , "r89"
  };


const char *  const   ability_name    [MAX_ABILITY] =
  {
    "combat", "piloting", "engineering", "bounty hunting", "smuggling", "diplomacy",
    "leadership", "force", "commando"
  };


/*
 * Attribute bonus tables.
 */
const   struct  str_app_type    str_app         [26]            =
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



const   struct  int_app_type    int_app         [26]            =
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



const   struct  wis_app_type    wis_app         [26]            =
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



const   struct  dex_app_type    dex_app         [26]            =
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



const   struct  con_app_type    con_app         [26]            =
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


const   struct  cha_app_type    cha_app         [26]            =
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
const   struct  lck_app_type    lck_app         [26]            =
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

const   struct  frc_app_type    frc_app         [26]            =
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
const   struct  liq_type        liq_table       [LIQ_MAX]       =
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

const char *  const   attack_table    [13] =
  {
    "hit",
    "slice",  "stab",  "slash", "whip", "claw",
    "blast",  "pound", "crush", "shot", "bite",
    "pierce", "suction"
  };

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

int get_spaceobj_type_from_name(const char *name)
{
  size_t n = 0;

  for( n = 0; n < spaceobj_type_size(); ++n)
    {
      if(!str_prefix(name, spaceobj_type[n]))
	{
	  return n;
	}
    }

  return -1;
}

/*
 * The skill and spell table.
 * Slot numbers must never be changed as they appear in #OBJECTS sections.
 */
#define SLOT(n) n
#define LI LEVEL_IMMORTAL

#undef AM
#undef AC
#undef AT
#undef AW
#undef AV
#undef AD
#undef AR
#undef AA

#undef LI
