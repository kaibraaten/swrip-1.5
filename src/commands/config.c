#include "mud.h"

void do_config( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( IS_NPC(ch) )
    return;

  one_argument( argument, arg );

  set_char_color( AT_WHITE, ch );

  if ( arg[0] == '\0' )
    {
      send_to_char( "[ Keyword  ] Option\r\n", ch );

      send_to_char(  IS_SET(ch->act, PLR_FLEE)
                     ? "[+FLEE     ] You flee if you get attacked.\r\n"
                     : "[-flee     ] You fight back if you get attacked.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->pcdata->flags, PCFLAG_NORECALL)
                     ? "[+NORECALL ] You fight to the death, link-dead or not.\r\n"
                     : "[-norecall ] You try to recall if fighting link-dead.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_AUTOEXIT)
                     ? "[+AUTOEXIT ] You automatically see exits.\r\n"
                     : "[-autoexit ] You don't automatically see exits.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_AUTOLOOT)
                     ? "[+AUTOLOOT ] You automatically loot corpses.\r\n"
                     : "[-autoloot ] You don't automatically loot corpses.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_AUTOSAC)
? "[+AUTOSAC  ] You automatically sacrifice corpses.\r\n"
                     : "[-autosac  ] You don't automatically sacrifice corpses.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_AUTOGOLD)
                     ? "[+AUTOCRED ] You automatically split credits from kills in groups.\r\n"
                     : "[-autocred ] You don't automatically split credits from kills in groups.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->pcdata->flags, PCFLAG_GAG)
                     ? "[+GAG      ] You see only necessary battle text.\r\n"
                     : "[-gag      ] You see full battle text.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->pcdata->flags, PCFLAG_PAGERON)
                     ? "[+PAGER    ] Long output is page-paused.\r\n"
                     : "[-pager    ] Long output scrolls to the end.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_BLANK)
                     ? "[+BLANK    ] You have a blank line before your prompt.\r\n"
                     : "[-blank    ] You have no blank line before your prompt.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_BRIEF)
                     ? "[+BRIEF    ] You see brief descriptions.\r\n"
                     : "[-brief    ] You see long descriptions.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_COMBINE)
                     ? "[+COMBINE  ] You see object lists in combined format.\r\n"
                     : "[-combine  ] You see object lists in single format.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->pcdata->flags, PCFLAG_NOINTRO)
                     ? "[+NOINTRO  ] You don't see the ascii intro screen on login.\r\n"
                     : "[-nointro  ] You see the ascii intro screen on login.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_PROMPT)
                     ? "[+PROMPT   ] You have a prompt.\r\n"
                     : "[-prompt   ] You don't have a prompt.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_TELNET_GA)
 ? "[+TELNETGA ] You receive a telnet GA sequence.\r\n"
                     : "[-telnetga ] You don't receive a telnet GA sequence.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_ANSI)
                     ? "[+ANSI     ] You receive ANSI color sequences.\r\n"
                     : "[-ansi     ] You don't receive receive ANSI colors.\r\n"
                     , ch );

      send_to_char(  IS_SET(ch->act, PLR_SOUND)
                     ? "[+SOUND     ] You have MSP support.\r\n"
                     : "[-sound     ] You don't have MSP support.\r\n"
                     , ch );


      send_to_char(  IS_SET(ch->act, PLR_SHOVEDRAG)
                     ? "[+SHOVEDRAG] You allow yourself to be shoved and dragged around.\r\n"
                     : "[-shovedrag] You'd rather not be shoved or dragged around.\r\n"
                     , ch );

      send_to_char(  IS_SET( ch->pcdata->flags, PCFLAG_NOSUMMON )
                     ? "[+NOSUMMON ] You do not allow other players to summon you.\r\n"
                     : "[-nosummon ] You allow other players to summon you.\r\n"
                     , ch );

      send_to_char(  IS_SET( ch->act, PLR_DONTAUTOFUEL )
                     ? "[+dontautofuel ] You will not refuel automatically on launch.\r\n"
                     : "[-dontautofuel] You refuel automatically on launch.\r\n"
                     , ch );

      if ( IS_IMMORTAL( ch ) )
        send_to_char(  IS_SET(ch->act, PLR_ROOMVNUM)
                       ? "[+VNUM     ] You can see the VNUM of a room.\r\n"
                       : "[-vnum     ] You do not see the VNUM of a room.\r\n"
                       , ch );

      if ( IS_IMMORTAL( ch ) )
        send_to_char(  IS_SET(ch->act, PLR_AUTOMAP)    /* maps */
                       ? "[+MAP      ] You can see the MAP of a room.\r\n"
                       : "[-map      ] You do not see the MAP of a room.\r\n"
                       , ch );

      if ( IS_IMMORTAL( ch) )             /* Added 10/16 by Kuran of SWR */
        send_to_char( IS_SET(ch->pcdata->flags, PCFLAG_ROOM)
                      ? "[+ROOMFLAGS] You will see room flags.\r\n"
		      : "[-roomflags] You will not see room flags.\r\n"
                      , ch );

      send_to_char(  IS_SET(ch->act, PLR_SILENCE)
                     ? "[+SILENCE  ] You are silenced.\r\n"
                     : ""
                     , ch );

      send_to_char( !IS_SET(ch->act, PLR_NO_EMOTE)
                    ? ""
                    : "[-emote    ] You can't emote.\r\n"
                    , ch );

      send_to_char( !IS_SET(ch->act, PLR_NO_TELL)
                    ? ""
                    : "[-tell     ] You can't use 'tell'.\r\n"
                    , ch );

      send_to_char( !IS_SET(ch->act, PLR_LITTERBUG)
                    ? ""
                    : "[-litter  ] A convicted litterbug. You cannot drop anything.\r\n"
                    , ch );
    }
  else
    {
      bool fSet;
      int bit = 0;

      if ( arg[0] == '+' )
	fSet = TRUE;
      else if ( arg[0] == '-' )
	fSet = FALSE;
      else
        {
          send_to_char( "Config -option or +option?\r\n", ch );
          return;
        }

      if ( !str_prefix( arg+1, "autoexit" ) )
	bit = PLR_AUTOEXIT;
      else if ( !str_prefix( arg+1, "autoloot" ) )
	bit = PLR_AUTOLOOT;
      else if ( !str_prefix( arg+1, "autosac"  ) )
	bit = PLR_AUTOSAC;
      else if ( !str_prefix( arg+1, "autocred" ) )
	bit = PLR_AUTOGOLD;
      else if ( !str_prefix( arg+1, "blank"    ) )
	bit = PLR_BLANK;
      else if ( !str_prefix( arg+1, "brief"    ) )
	bit = PLR_BRIEF;
      else if ( !str_prefix( arg+1, "combine"  ) )
	bit = PLR_COMBINE;
      else if ( !str_prefix( arg+1, "prompt"   ) )
	bit = PLR_PROMPT;
      else if ( !str_prefix( arg+1, "telnetga" ) )
	bit = PLR_TELNET_GA;
      else if ( !str_prefix( arg+1, "ansi"     ) )
	bit = PLR_ANSI;
      else if ( !str_prefix( arg+1, "sound"      ) )
	bit = PLR_SOUND;
      else if ( !str_prefix( arg+1, "flee"     ) )
	bit = PLR_FLEE;
      else if ( !str_prefix( arg+1, "nice"     ) )
	bit = PLR_NICE;
      else if ( !str_prefix( arg+1, "shovedrag") )
	bit = PLR_SHOVEDRAG;
      else if ( !str_prefix( arg+1, "dontautofuel") )
	bit = PLR_DONTAUTOFUEL;
      else if ( IS_IMMORTAL( ch )
                &&   !str_prefix( arg+1, "vnum"     ) )
	bit = PLR_ROOMVNUM;
      else if ( IS_IMMORTAL( ch )
                &&   !str_prefix( arg+1, "map"      ) )
	bit = PLR_AUTOMAP;

      if (bit)
        {

          if ( fSet )
            SET_BIT    (ch->act, bit);
          else
            REMOVE_BIT (ch->act, bit);

          send_to_char( "Ok.\r\n", ch );
          return;
        }
      else
        {
          if ( !str_prefix( arg+1, "norecall" ) )
	    bit = PCFLAG_NORECALL;
          else if ( !str_prefix( arg+1, "nointro"  ) )
	    bit = PCFLAG_NOINTRO;
          else if ( !str_prefix( arg+1, "nosummon" ) )
	    bit = PCFLAG_NOSUMMON;
          else if ( !str_prefix( arg+1, "gag"      ) )
	    bit = PCFLAG_GAG;
          else if ( !str_prefix( arg+1, "pager"    ) )
	    bit = PCFLAG_PAGERON;
          else if ( !str_prefix( arg+1, "roomflags")
                    && (IS_IMMORTAL(ch)))
	    bit = PCFLAG_ROOM;
          else
            {
              send_to_char( "Config which option?\r\n", ch );
              return;
            }

          if ( fSet )
            SET_BIT(ch->pcdata->flags, bit);
          else
            REMOVE_BIT(ch->pcdata->flags, bit);

          send_to_char( "Ok.\r\n", ch );
          return;
        }
    }
}