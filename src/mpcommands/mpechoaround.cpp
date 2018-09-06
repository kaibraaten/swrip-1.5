#include "character.hpp"
#include "mud.hpp"

/* prints the message to everyone in the room other than the mob and victim */

void do_mpechoaround( Character *ch, std::string argument )
{
  std::string arg;
  Character *victim = nullptr;
  int mobflags = 0;
  short color = 0;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg.empty() )
    {
      ProgBug( "Mpechoaround - No argument", ch );
      return;
    }

  if ( !( victim=GetCharacterInRoomMudProg( ch, arg ) ) )
    {
      ProgBug( "Mpechoaround - victim does not exist", ch );
      return;
    }

  mobflags = ch->Flags;
  RemoveBit(ch->Flags, ACT_SECRETIVE);

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument( argument, arg );
      Act( color, argument, ch, NULL, victim, TO_NOTVICT );
    }
  else
    Act( AT_ACTION, argument, ch, NULL, victim, TO_NOTVICT );

  ch->Flags = mobflags;
}
