#include "character.h"
#include "mud.h"

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

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "mprestore whom?\r\n", ch );
      progbug( "Mprestore: invalid argument1", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      send_to_char( "mprestore how many hps?\r\n", ch );
      progbug( "Mprestore: invalid argument2", ch );
      return;
    }

  if ( ( victim = get_char_room_mp( ch, arg1 ) ) == NULL )
    {
      send_to_char( "Victim must be in room.\r\n", ch );
      progbug( "Mprestore: victim not in room", ch );
      return;
    }

  hp = atoi(arg2);

  if( (hp<0) || (hp>32000) )
    {
      send_to_char( "Mprestore how much?\r\n", ch );
      progbug( "Mprestore: invalid (nonexistent?) argument", ch );
      return;
    }
  hp += victim->hit;
  victim->hit = (hp > 32000 || hp < 0 || hp > victim->max_hit) ? victim->max_hit : hp;
}
