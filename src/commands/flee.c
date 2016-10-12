#include "mud.h"
#include "character.h"
#include "skill.h"

void do_flee( Character *ch, char *argument )
{
  Room *was_in;
  Room *now_in;
  char buf[MAX_STRING_LENGTH];
  int attempt;
  DirectionType door;
  Exit *pexit;

  if ( !GetFightingOpponent( ch ) )
    {
      if ( ch->Position == POS_FIGHTING )
        {
          if ( ch->Mount )
            ch->Position = POS_MOUNTED;
          else
            ch->Position = POS_STANDING;
        }
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ch->Move <= 0 )
    {
      SendToCharacter( "You're too exhausted to flee from combat!\r\n", ch );
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
           ||   !pexit->to_room
           || ( IsBitSet(pexit->Flags, EX_CLOSED)
                &&   !IsAffectedBy( ch, AFF_PASS_DOOR ) )
           || ( IsNpc(ch)
                &&   IsBitSet(pexit->to_room->Flags, ROOM_NO_MOB) ) )
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
      sprintf(buf, "You run for cover!");
      SendToCharacter( buf, ch );

      StopFighting( ch, true );
      return;
    }

  sprintf(buf, "You attempt to run for cover!");
  SendToCharacter( buf, ch );
}
