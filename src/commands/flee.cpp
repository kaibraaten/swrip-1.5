#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_flee( Character *ch, std::string argument )
{
  Room *was_in = nullptr;
  Room *now_in = nullptr;
  int attempt = 0;
  DirectionType door = DIR_INVALID;
  Exit *pexit = nullptr;

  if ( !GetFightingOpponent( ch ) )
    {
      if ( ch->Position == POS_FIGHTING )
        {
          if ( ch->Mount )
            ch->Position = POS_MOUNTED;
          else
            ch->Position = POS_STANDING;
        }
      
      ch->Echo( "You aren't fighting anyone.\r\n" );
      return;
    }

  if ( ch->Fatigue.Current <= 0 )
    {
      ch->Echo( "You're too exhausted to flee from combat!\r\n" );
      return;
    }

  /* No fleeing while stunned. - Narn */
  if ( ch->Position < POS_FIGHTING )
    return;

  was_in = ch->InRoom;

  for ( attempt = 0; attempt < 8; attempt++ )
    {

      door = (DirectionType)GetRandomDoor();

      if ( ( pexit = GetExit(was_in, door) ) == NULL
           ||   !pexit->ToRoom
           || ( IsBitSet(pexit->Flags, EX_CLOSED)
                &&   !IsAffectedBy( ch, AFF_PASS_DOOR ) )
           || ( IsNpc(ch)
                &&   IsBitSet(pexit->ToRoom->Flags, ROOM_NO_MOB) ) )
        continue;

      if ( !HasPermanentSneak(ch) )
        {
          StripAffect ( ch, gsn_sneak );
          RemoveBit   ( ch->AffectedBy, AFF_SNEAK );
        }

      if ( ch->Mount && ch->Mount->Fighting )
        StopFighting( ch->Mount, true );
      MoveCharacter( ch, pexit, 0 );

      MobProgEntryTrigger( ch );

      if ( CharacterDiedRecently(ch) )
        return;

      RoomProgEnterTrigger( ch );

      if ( CharacterDiedRecently(ch) )
        return;

      MobProgGreetTrigger( ch );

      if ( CharacterDiedRecently(ch) )
        return;

      ObjProgGreetTrigger( ch );

      if ( CharacterDiedRecently(ch) )
        return;

      if ( ( now_in = ch->InRoom ) == was_in )
        continue;

      ch->InRoom = was_in;
      Act( AT_FLEE, "$n runs for cover!", ch, NULL, NULL, TO_ROOM );
      ch->InRoom = now_in;
      Act( AT_FLEE, "$n glances around for signs of pursuit.", ch, NULL, NULL, TO_ROOM );
      ch->Echo( "You run for cover!" );

      StopFighting( ch, true );
      return;
    }

  ch->Echo("You attempt to run for cover!\r\n");
}
