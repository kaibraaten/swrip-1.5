#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_config( Character *ch, std::string arg )
{
  if ( IsNpc(ch) )
    return;

  SetCharacterColor( AT_WHITE, ch );

  if ( arg.empty() )
    {
      ch->Echo( "[ Keyword  ] Option\r\n" );

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_FLEE)
                ? "[+FLEE     ] You flee if you get attacked.\r\n"
                : "[-flee     ] You fight back if you get attacked.\r\n");                

      ch->Echo( "%s", ch->PCData->Flags.test( Flag::PCData::NoRecall )
                ? "[+NORECALL ] You fight to the death, link-dead or not.\r\n"
                : "[-norecall ] You try to recall if fighting link-dead.\r\n");                

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_AUTOEXIT)
                ? "[+AUTOEXIT ] You automatically see exits.\r\n"
                : "[-autoexit ] You don't automatically see exits.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_AUTOLOOT)
                ? "[+AUTOLOOT ] You automatically loot corpses.\r\n"
                : "[-autoloot ] You don't automatically loot corpses.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_AUTOSAC)
                ? "[+AUTOSAC  ] You automatically sacrifice corpses.\r\n"
                : "[-autosac  ] You don't automatically sacrifice corpses.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_AUTOGOLD)
                ? "[+AUTOCRED ] You automatically split credits from kills in groups.\r\n"
                : "[-autocred ] You don't automatically split credits from kills in groups.\r\n");

      ch->Echo( "%s", ch->PCData->Flags.test( Flag::PCData::Gag )
                ? "[+GAG      ] You see only necessary battle text.\r\n"
                : "[-gag      ] You see full battle text.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_BLANK)
                ? "[+BLANK    ] You have a blank line before your prompt.\r\n"
                : "[-blank    ] You have no blank line before your prompt.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_BRIEF)
                ? "[+BRIEF    ] You see brief descriptions.\r\n"
                : "[-brief    ] You see long descriptions.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_COMBINE)
                ? "[+COMBINE  ] You see object lists in combined format.\r\n"
                : "[-combine  ] You see object lists in single format.\r\n");

      ch->Echo( "%s", ch->PCData->Flags.test( Flag::PCData::NoIntro )
                ? "[+NOINTRO  ] You don't see the ascii intro screen on login.\r\n"
                : "[-nointro  ] You see the ascii intro screen on login.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_PROMPT)
                ? "[+PROMPT   ] You have a prompt.\r\n"
                : "[-prompt   ] You don't have a prompt.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_TELNET_GA)
                ? "[+TELNETGA ] You receive a telnet GA sequence.\r\n"
                : "[-telnetga ] You don't receive a telnet GA sequence.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_ANSI)
                ? "[+ANSI     ] You receive ANSI color sequences.\r\n"
                : "[-ansi     ] You don't receive receive ANSI colors.\r\n");


      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_SHOVEDRAG)
                ? "[+SHOVEDRAG] You allow yourself to be shoved and dragged around.\r\n"
                : "[-shovedrag] You'd rather not be shoved or dragged around.\r\n");

      ch->Echo( "%s", ch->PCData->Flags.test( Flag::PCData::NoSummon )
                ? "[+NOSUMMON ] You do not allow other players to summon you.\r\n"
                : "[-nosummon ] You allow other players to summon you.\r\n");

      ch->Echo( "%s", IsBitSet( ch->Flags, PLR_DONTAUTOFUEL )
                ? "[+dontautofuel ] You will not refuel automatically on launch.\r\n"
                : "[-dontautofuel] You refuel automatically on launch.\r\n");

      if ( IsImmortal( ch ) )
        ch->Echo( "%s", IsBitSet(ch->Flags, PLR_ROOMVNUM)
                  ? "[+VNUM     ] You can see the VNUM of a room.\r\n"
                  : "[-vnum     ] You do not see the VNUM of a room.\r\n");

      if ( IsImmortal( ch ) )
        ch->Echo( "%s", IsBitSet(ch->Flags, PLR_AUTOMAP)
                  ? "[+MAP      ] You can see the MAP of a room.\r\n"
                  : "[-map      ] You do not see the MAP of a room.\r\n");

      if ( IsImmortal( ch) )
        ch->Echo( "%s", ch->PCData->Flags.test( Flag::PCData::ShowRoomFlags )
                  ? "[+ROOMFLAGS] You will see room flags.\r\n"
                  : "[-roomflags] You will not see room flags.\r\n");

      ch->Echo( "%s", IsBitSet(ch->Flags, PLR_SILENCE)
                ? "[+SILENCE  ] You are silenced.\r\n"
                : "");

      ch->Echo( "%s", !IsBitSet(ch->Flags, PLR_NO_EMOTE)
                ? ""
                : "[-emote    ] You can't emote.\r\n");

      ch->Echo( "%s", !IsBitSet(ch->Flags, PLR_NO_TELL)
                ? ""
                : "[-tell     ] You can't use 'tell'.\r\n");

      ch->Echo( "%s", !IsBitSet(ch->Flags, PLR_LITTERBUG)
                ? ""
                : "[-litter  ] A convicted litterbug. You cannot drop anything.\r\n");
    }
  else
    {
      bool fSet = false;
      int bit = 0;

      if ( arg[0] == '+' )
        {
          fSet = true;
        }
      else if ( arg[0] == '-' )
        {
          fSet = false;
        }
      else
        {
          ch->Echo( "Config -option or +option?\r\n" );
          return;
        }

      std::string option = arg.substr(1);
      
      if ( !StringPrefix( option, "autoexit" ) )
	bit = PLR_AUTOEXIT;
      else if ( !StringPrefix( option, "autoloot" ) )
	bit = PLR_AUTOLOOT;
      else if ( !StringPrefix( option, "autosac"  ) )
	bit = PLR_AUTOSAC;
      else if ( !StringPrefix( option, "autocred" ) )
	bit = PLR_AUTOGOLD;
      else if ( !StringPrefix( option, "blank"    ) )
	bit = PLR_BLANK;
      else if ( !StringPrefix( option, "brief"    ) )
	bit = PLR_BRIEF;
      else if ( !StringPrefix( option, "combine"  ) )
	bit = PLR_COMBINE;
      else if ( !StringPrefix( option, "prompt"   ) )
	bit = PLR_PROMPT;
      else if ( !StringPrefix( option, "telnetga" ) )
	bit = PLR_TELNET_GA;
      else if ( !StringPrefix( option, "ansi"     ) )
	bit = PLR_ANSI;
      else if ( !StringPrefix( option, "flee"     ) )
	bit = PLR_FLEE;
      else if ( !StringPrefix( option, "nice"     ) )
	bit = PLR_NICE;
      else if ( !StringPrefix( option, "shovedrag") )
	bit = PLR_SHOVEDRAG;
      else if ( !StringPrefix( option, "dontautofuel") )
	bit = PLR_DONTAUTOFUEL;
      else if ( IsImmortal( ch )
                &&   !StringPrefix( option, "vnum"     ) )
	bit = PLR_ROOMVNUM;
      else if ( IsImmortal( ch )
                &&   !StringPrefix( option, "map"      ) )
	bit = PLR_AUTOMAP;

      if (bit)
        {

          if ( fSet )
            SetBit(ch->Flags, bit);
          else
            RemoveBit(ch->Flags, bit);

          ch->Echo( "Ok.\r\n" );
          return;
        }
      else
        {
          if ( !StringPrefix( option, "norecall" ) )
            {
              bit = Flag::PCData::NoRecall;
            }
          else if ( !StringPrefix( option, "nointro"  ) )
            {
              bit = Flag::PCData::NoIntro;
            }
          else if ( !StringPrefix( option, "nosummon" ) )
            {
              bit = Flag::PCData::NoSummon;
            }
          else if ( !StringPrefix( option, "gag"      ) )
            {
              bit = Flag::PCData::Gag;
            }
          else if ( !StringPrefix( option, "showroomflags")
                    && (IsImmortal(ch)))
            {
              bit = Flag::PCData::ShowRoomFlags;
            }
          else
            {
              ch->Echo( "Config which option?\r\n" );
              return;
            }

          if ( fSet )
            {
              ch->PCData->Flags.set( bit );
            }
          else
            {
              ch->PCData->Flags.reset( bit );
            }
          
          ch->Echo( "Ok.\r\n" );
          return;
        }
    }
}

