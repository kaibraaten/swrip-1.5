#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_unjail( std::shared_ptr<Character> ch, std::string arg )
{
  Character *victim = NULL;

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("That's pointless.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("That would be a waste of time.\r\n");
      return;
    }

  if ( ch->InRoom->Flags.test( Flag::Room::Safe ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo("This isn't a good place to do that.\r\n");
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      ch->Echo("Interesting combat technique.\r\n" );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      ch->Echo("In your dreams or what?\r\n" );
      return;
    }

  if ( victim->InRoom->Vnum == ROOM_VNUM_HELL)
    {
      ch->Echo("Only an immortal can unhell someone.\r\n");
      return;
    }

  ch->Echo("Jail restrictions released.\r\n");
  victim->PCData->JailVnum = 0;
  victim->PCData->ReleaseDate = 0;
}
