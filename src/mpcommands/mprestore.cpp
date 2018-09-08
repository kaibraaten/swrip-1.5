#include "character.hpp"
#include "mud.hpp"

/*
 * syntax: mprestore (character) (#hps)                Gorog
 */
void do_mp_restore( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Character *victim = nullptr;
  int hp = 0;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() )
    {
      ch->Echo("mprestore whom?\r\n");
      ProgBug( "Mprestore: invalid argument1", ch );
      return;
    }

  if ( arg2.empty() )
    {
      ch->Echo("mprestore how many hps?\r\n");
      ProgBug( "Mprestore: invalid argument2", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoomMudProg( ch, arg1 ) ) == NULL )
    {
      ch->Echo("Victim must be in room.\r\n");
      ProgBug( "Mprestore: victim not in room", ch );
      return;
    }

  hp = std::stoi(arg2);

  if( hp < 0 || hp > 32000 )
    {
      ch->Echo("Mprestore how much?\r\n");
      ProgBug( "Mprestore: invalid (nonexistent?) argument", ch );
      return;
    }

  hp += victim->HitPoints.Current;
  victim->HitPoints.Current = (hp > SHRT_MAX || hp < 0 || hp > victim->HitPoints.Max) ? victim->HitPoints.Max : hp;
}
