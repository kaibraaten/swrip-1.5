#include "mud.hpp"
#include "character.hpp"

void do_rat( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Room *location = nullptr;
  Room *original = nullptr;
  vnum_t Start = INVALID_VNUM;
  vnum_t End = INVALID_VNUM;
  vnum_t vnum = INVALID_VNUM;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() || argument.empty() )
    {
      ch->Echo("Syntax: rat <start> <end> <command>\r\n");
      return;
    }

  Start = ToLong( arg1 );
  End = ToLong( arg2 );

  if ( Start < MIN_VNUM || End < Start || Start > End || Start == End || End > MAX_VNUM )
    {
      ch->Echo("Invalid range.\r\n");
      return;
    }

  if ( !StrCmp( argument, "quit" ) )
    {
      ch->Echo("I don't think so!\r\n");
      return;
    }

  original = ch->InRoom;

  for ( vnum = Start; vnum <= End; vnum++ )
    {
      if ( (location = GetRoom(vnum)) == NULL )
        continue;

      CharacterFromRoom( ch );
      CharacterToRoom( ch, location );
      Interpret( ch, argument );
    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, original );
  ch->Echo("Done.\r\n");
}
