#include "character.h"
#include "mud.h"

void do_channels( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_SILENCE) )
        {
          SendToCharacter( "You are silenced.\r\n", ch );
          return;
        }

      SendToCharacter( "Channels:", ch );

      if ( GetTrustLevel( ch ) > 2 && IsAuthed( ch ) )
        {
          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_AUCTION)
                        ? " +AUCTION"
                        : " -auction",
                        ch );
        }

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_CHAT)
                    ? " +CHAT"
                    : " -chat",
                    ch );

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_OOC)
                    ? " +OOC"
                    : " -ooc",
                    ch );

      if ( IsClanned( ch ) )
	{
          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_CLAN)
                        ? " +CLAN"
                        : " -clan",
                        ch );
        }

      SendToCharacter( !IsBitSet( ch->deaf, CHANNEL_TELLS )
                    ? " +TELLS"
                    : " -tells",
                    ch );

      SendToCharacter( !IsBitSet( ch->deaf, CHANNEL_WARTALK )
                    ? " +WARTALK"
                    : " -wartalk",
                    ch );

      if ( IsAvatar(ch) )
        {
          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_AVTALK)
                        ? " +AVATAR"
                        : " -avatar",
                        ch );
        }

      if ( IsImmortal(ch) )
        {
          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_IMMTALK)
                        ? " +IMMTALK"
                        : " -immtalk",
                        ch );

          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_PRAY)
                        ? " +PRAY"
                        : " -pray",
                        ch );
        }

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_MUSIC)
? " +MUSIC"
                    : " -music",
                    ch );

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_ASK)
                    ? " +ASK"
                    : " -ask",
                    ch );

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_SHOUT)
                    ? " +SHOUT"
                    : " -shout",
                    ch );

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_YELL)
                    ? " +YELL"
                    : " -yell",
                    ch );

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_ARENA)
                    ? " +ARENA"
                    : " -arena",
                    ch );

      if ( IsImmortal(ch) )
        {
          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_MONITOR)
                        ? " +MONITOR"
                        : " -monitor",
                        ch );
        }

      SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_NEWBIE)
                    ? " +NEWBIE"
                    : " -newbie",
                    ch );

      if ( GetTrustLevel(ch) >= sysdata.log_level )
        {
          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_LOG)
                        ? " +LOG"
                        : " -log",
                        ch );

          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_BUILD)
? " +BUILD"
                        : " -build",
                        ch );

          SendToCharacter( !IsBitSet(ch->deaf, CHANNEL_COMM)
                        ? " +COMM"
                        : " -comm",
                        ch );
        }
      SendToCharacter( ".\r\n", ch );
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
          SendToCharacter( "Channels -channel or +channel?\r\n", ch );
          return;
        }

      if ( !StrCmp( arg+1, "auction"  ) )
	bit = CHANNEL_AUCTION;
      else if ( !StrCmp( arg+1, "chat"     ) )
	bit = CHANNEL_CHAT;
      else if ( !StrCmp( arg+1, "ooc"      ) )
	bit = CHANNEL_OOC;
      else if ( !StrCmp( arg+1, "clan"     ) )
	bit = CHANNEL_CLAN;
      else if ( !StrCmp( arg+1, "guild"    ) )
	bit = CHANNEL_GUILD;
      else if ( !StrCmp( arg+1, "tells"    ) )
	bit = CHANNEL_TELLS;
      else if ( !StrCmp( arg+1, "immtalk"  ) )
	bit = CHANNEL_IMMTALK;
      else if ( !StrCmp( arg+1, "log"      ) )
	bit = CHANNEL_LOG;
      else if ( !StrCmp( arg+1, "build"    ) )
	bit = CHANNEL_BUILD;
      else if ( !StrCmp( arg+1, "pray"     ) )
	bit = CHANNEL_PRAY;
      else if ( !StrCmp( arg+1, "avatar"   ) )
	bit = CHANNEL_AVTALK;
      else if ( !StrCmp( arg+1, "monitor"  ) )
	bit = CHANNEL_MONITOR;
      else if ( !StrCmp( arg+1, "newbie"   ) )
	bit = CHANNEL_NEWBIE;
      else if ( !StrCmp( arg+1, "music"    ) )
	bit = CHANNEL_MUSIC;
      else if ( !StrCmp( arg+1, "ask"      ) )
	bit = CHANNEL_ASK;
      else if ( !StrCmp( arg+1, "shout"    ) )
	bit = CHANNEL_SHOUT;
      else if ( !StrCmp( arg+1, "yell"     ) )
	bit = CHANNEL_YELL;
      else if ( !StrCmp( arg+1, "comm"     ) )
	bit = CHANNEL_COMM;
      else if ( !StrCmp( arg+1, "order"    ) )
	bit = CHANNEL_ORDER;
      else if ( !StrCmp( arg+1, "wartalk"  ) )
	bit = CHANNEL_WARTALK;
      else if ( !StrCmp( arg+1, "arena"  ) )
	bit = CHANNEL_ARENA;
      else if ( !StrCmp( arg+1, "all"      ) )
	ClearAll = true;
      else
        {
          SendToCharacter( "Set or clear which channel?\r\n", ch );
          return;
        }

      if ( fClear && ClearAll )
        {
          RemoveBit(ch->deaf, CHANNEL_AUCTION);
          RemoveBit(ch->deaf, CHANNEL_CHAT);
          RemoveBit(ch->deaf, CHANNEL_PRAY);
          RemoveBit(ch->deaf, CHANNEL_MUSIC);
          RemoveBit(ch->deaf, CHANNEL_ASK);
          RemoveBit(ch->deaf, CHANNEL_SHOUT);
          RemoveBit(ch->deaf, CHANNEL_YELL);
          RemoveBit(ch->deaf, CHANNEL_ARENA);

          if (ch->top_level >= LEVEL_IMMORTAL)
            RemoveBit(ch->deaf, CHANNEL_AVTALK);

          if (ch->top_level >= sysdata.log_level )
            RemoveBit(ch->deaf, CHANNEL_COMM);

        }
      else if ((!fClear) && (ClearAll))
        {
          SetBit(ch->deaf, CHANNEL_AUCTION);
          SetBit(ch->deaf, CHANNEL_CHAT);
          SetBit(ch->deaf, CHANNEL_PRAY);
	  SetBit(ch->deaf, CHANNEL_MUSIC);
          SetBit(ch->deaf, CHANNEL_ASK);
          SetBit(ch->deaf, CHANNEL_SHOUT);
          SetBit(ch->deaf, CHANNEL_YELL);
          SetBit(ch->deaf, CHANNEL_ARENA);

          if (ch->top_level >= LEVEL_IMMORTAL)
            SetBit(ch->deaf, CHANNEL_AVTALK);

          if (ch->top_level >= sysdata.log_level)
            SetBit(ch->deaf, CHANNEL_COMM);
        }
      else if (fClear)
        {
          RemoveBit(ch->deaf, bit);
        }
      else
        {
          SetBit(ch->deaf, bit);
        }

      SendToCharacter( "Ok.\r\n", ch );
    }
}
