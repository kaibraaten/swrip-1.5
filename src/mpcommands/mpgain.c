#include "character.h"
#include "mud.h"

void do_mpgain( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  char arg3[ MAX_INPUT_LENGTH ];
  Character *victim;
  long xp;
  int  ability;

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "mpgain whom?\r\n", ch );
      progbug( "Mpgain: invalid argument1", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      send_to_char( "mpgain in what ability?\r\n", ch );
      progbug( "Mpgain: invalid argument2", ch );
      return;
    }

  if ( arg3[0] == '\0' )
    {
      send_to_char( "mpgain how much exp?\r\n", ch );
      progbug( "Mpgain: invalid argument3", ch );
      return;
    }

  if ( ( victim = get_char_room_mp( ch, arg1 ) ) == NULL )
    {
      send_to_char( "Victim must be in room.\r\n", ch );
      progbug( "Mpgain: victim not in room", ch );
      return;
    }

  ability = atoi(arg2);
  xp = atoi(arg3);

  if( ability < 0 || ability >= MAX_ABILITY )
    {
      send_to_char( "Mpgain which ability?\r\n", ch );
      progbug( "Mpgain: ability out of range", ch );
      return;
    }

  if( (xp < 1) )
    {
      send_to_char( "Mpgain how much?\r\n", ch );
      progbug( "Mpgain: experience out of range", ch );
      return;
    }

  xp =  URANGE(1, xp, ( exp_level( get_level( victim, ability ) + 1 ) - exp_level( get_level( victim, ability ) ) ) );

  ch_printf( victim, "You gain %ld %s experience.\r\n", xp, ability_name[ability]  );
  gain_exp( victim, ability, xp );
}
