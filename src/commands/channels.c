#include "character.h"
#include "mud.h"

void do_channels( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      if ( !IsNpc(ch) && IS_SET(ch->act, PLR_SILENCE) )
        {
          send_to_char( "You are silenced.\r\n", ch );
          return;
        }

      send_to_char( "Channels:", ch );

      if ( GetTrustLevel( ch ) > 2 && !IsNotAuthed( ch ) )
        {
          send_to_char( !IS_SET(ch->deaf, CHANNEL_AUCTION)
                        ? " +AUCTION"
                        : " -auction",
                        ch );
        }

      send_to_char( !IS_SET(ch->deaf, CHANNEL_CHAT)
                    ? " +CHAT"
                    : " -chat",
                    ch );

      send_to_char( !IS_SET(ch->deaf, CHANNEL_OOC)
                    ? " +OOC"
                    : " -ooc",
                    ch );

      if ( !IsNpc( ch ) && ch->pcdata->clan )
	{
          send_to_char( !IS_SET(ch->deaf, CHANNEL_CLAN)
                        ? " +CLAN"
                        : " -clan",
                        ch );
        }

      send_to_char( !IS_SET( ch->deaf, CHANNEL_TELLS )
                    ? " +TELLS"
                    : " -tells",
                    ch );

      send_to_char( !IS_SET( ch->deaf, CHANNEL_WARTALK )
                    ? " +WARTALK"
                    : " -wartalk",
                    ch );

      if ( IsAvatar(ch) )
        {
          send_to_char( !IS_SET(ch->deaf, CHANNEL_AVTALK)
                        ? " +AVATAR"
                        : " -avatar",
                        ch );
        }

      if ( IsImmortal(ch) )
        {
          send_to_char( !IS_SET(ch->deaf, CHANNEL_IMMTALK)
                        ? " +IMMTALK"
                        : " -immtalk",
                        ch );

          send_to_char( !IS_SET(ch->deaf, CHANNEL_PRAY)
                        ? " +PRAY"
                        : " -pray",
                        ch );
        }

      send_to_char( !IS_SET(ch->deaf, CHANNEL_MUSIC)
? " +MUSIC"
                    : " -music",
                    ch );

      send_to_char( !IS_SET(ch->deaf, CHANNEL_ASK)
                    ? " +ASK"
                    : " -ask",
                    ch );

      send_to_char( !IS_SET(ch->deaf, CHANNEL_SHOUT)
                    ? " +SHOUT"
                    : " -shout",
                    ch );

      send_to_char( !IS_SET(ch->deaf, CHANNEL_YELL)
                    ? " +YELL"
                    : " -yell",
                    ch );

      send_to_char( !IS_SET(ch->deaf, CHANNEL_ARENA)
                    ? " +ARENA"
                    : " -arena",
                    ch );

      if ( IsImmortal(ch) )
        {
          send_to_char( !IS_SET(ch->deaf, CHANNEL_MONITOR)
                        ? " +MONITOR"
                        : " -monitor",
                        ch );
        }

      send_to_char( !IS_SET(ch->deaf, CHANNEL_NEWBIE)
                    ? " +NEWBIE"
                    : " -newbie",
                    ch );

      if ( GetTrustLevel(ch) >= sysdata.log_level )
        {
          send_to_char( !IS_SET(ch->deaf, CHANNEL_LOG)
                        ? " +LOG"
                        : " -log",
                        ch );

          send_to_char( !IS_SET(ch->deaf, CHANNEL_BUILD)
? " +BUILD"
                        : " -build",
                        ch );

          send_to_char( !IS_SET(ch->deaf, CHANNEL_COMM)
                        ? " +COMM"
                        : " -comm",
                        ch );
        }
      send_to_char( ".\r\n", ch );
    }
  else
    {
      bool fClear;
      bool ClearAll;
      int bit;

      bit=0;
      ClearAll = false;

      if ( arg[0] == '+' )
	fClear = true;
      else if ( arg[0] == '-' )
	fClear = false;
      else
        {
          send_to_char( "Channels -channel or +channel?\r\n", ch );
          return;
        }

      if ( !str_cmp( arg+1, "auction"  ) )
	bit = CHANNEL_AUCTION;
      else if ( !str_cmp( arg+1, "chat"     ) )
	bit = CHANNEL_CHAT;
      else if ( !str_cmp( arg+1, "ooc"      ) )
	bit = CHANNEL_OOC;
      else if ( !str_cmp( arg+1, "clan"     ) )
	bit = CHANNEL_CLAN;
      else if ( !str_cmp( arg+1, "guild"    ) )
	bit = CHANNEL_GUILD;
      else if ( !str_cmp( arg+1, "tells"    ) )
	bit = CHANNEL_TELLS;
      else if ( !str_cmp( arg+1, "immtalk"  ) )
	bit = CHANNEL_IMMTALK;
      else if ( !str_cmp( arg+1, "log"      ) )
	bit = CHANNEL_LOG;
      else if ( !str_cmp( arg+1, "build"    ) )
	bit = CHANNEL_BUILD;
      else if ( !str_cmp( arg+1, "pray"     ) )
	bit = CHANNEL_PRAY;
      else if ( !str_cmp( arg+1, "avatar"   ) )
	bit = CHANNEL_AVTALK;
      else if ( !str_cmp( arg+1, "monitor"  ) )
	bit = CHANNEL_MONITOR;
      else if ( !str_cmp( arg+1, "newbie"   ) )
	bit = CHANNEL_NEWBIE;
      else if ( !str_cmp( arg+1, "music"    ) )
	bit = CHANNEL_MUSIC;
      else if ( !str_cmp( arg+1, "ask"      ) )
	bit = CHANNEL_ASK;
      else if ( !str_cmp( arg+1, "shout"    ) )
	bit = CHANNEL_SHOUT;
      else if ( !str_cmp( arg+1, "yell"     ) )
	bit = CHANNEL_YELL;
      else if ( !str_cmp( arg+1, "comm"     ) )
	bit = CHANNEL_COMM;
      else if ( !str_cmp( arg+1, "order"    ) )
	bit = CHANNEL_ORDER;
      else if ( !str_cmp( arg+1, "wartalk"  ) )
	bit = CHANNEL_WARTALK;
      else if ( !str_cmp( arg+1, "arena"  ) )
	bit = CHANNEL_ARENA;
      else if ( !str_cmp( arg+1, "all"      ) )
	ClearAll = true;
      else
        {
          send_to_char( "Set or clear which channel?\r\n", ch );
          return;
        }

      if ( fClear && ClearAll )
        {
          REMOVE_BIT(ch->deaf, CHANNEL_AUCTION);
          REMOVE_BIT(ch->deaf, CHANNEL_CHAT);
          REMOVE_BIT(ch->deaf, CHANNEL_PRAY);
          REMOVE_BIT(ch->deaf, CHANNEL_MUSIC);
          REMOVE_BIT(ch->deaf, CHANNEL_ASK);
          REMOVE_BIT(ch->deaf, CHANNEL_SHOUT);
          REMOVE_BIT(ch->deaf, CHANNEL_YELL);
          REMOVE_BIT(ch->deaf, CHANNEL_ARENA);

          if (ch->top_level >= LEVEL_IMMORTAL)
            REMOVE_BIT(ch->deaf, CHANNEL_AVTALK);

          if (ch->top_level >= sysdata.log_level )
            REMOVE_BIT(ch->deaf, CHANNEL_COMM);

        }
      else if ((!fClear) && (ClearAll))
        {
          SET_BIT(ch->deaf, CHANNEL_AUCTION);
          SET_BIT(ch->deaf, CHANNEL_CHAT);
          SET_BIT(ch->deaf, CHANNEL_PRAY);
	  SET_BIT(ch->deaf, CHANNEL_MUSIC);
          SET_BIT(ch->deaf, CHANNEL_ASK);
          SET_BIT(ch->deaf, CHANNEL_SHOUT);
          SET_BIT(ch->deaf, CHANNEL_YELL);
          SET_BIT(ch->deaf, CHANNEL_ARENA);

          if (ch->top_level >= LEVEL_IMMORTAL)
            SET_BIT(ch->deaf, CHANNEL_AVTALK);

          if (ch->top_level >= sysdata.log_level)
            SET_BIT(ch->deaf, CHANNEL_COMM);
        }
      else if (fClear)
        {
          REMOVE_BIT(ch->deaf, bit);
        }
      else
        {
          SET_BIT(ch->deaf, bit);
        }

      send_to_char( "Ok.\r\n", ch );
    }
}
