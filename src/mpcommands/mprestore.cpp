#include "character.hpp"
#include "mud.hpp"

/*
 * syntax: mprestore (character) (#hps)                Gorog
 */
void do_mp_restore( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  Character *victim;
  int hp;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("mprestore whom?\r\n");
      ProgBug( "Mprestore: invalid argument1", ch );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
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

  hp = atoi(arg2);

  if( hp < 0 || hp > 32000 )
    {
      ch->Echo("Mprestore how much?\r\n");
      ProgBug( "Mprestore: invalid (nonexistent?) argument", ch );
      return;
    }
  hp += victim->Hit;
  victim->Hit = (hp > SHRT_MAX || hp < 0 || hp > victim->MaxHit) ? victim->MaxHit : hp;
}

