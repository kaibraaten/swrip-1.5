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

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "mpgain whom?\r\n", ch );
      ProgBug( "Mpgain: invalid argument1", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      SendToCharacter( "mpgain in what ability?\r\n", ch );
      ProgBug( "Mpgain: invalid argument2", ch );
      return;
    }

  if ( arg3[0] == '\0' )
    {
      SendToCharacter( "mpgain how much exp?\r\n", ch );
      ProgBug( "Mpgain: invalid argument3", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoomMudProg( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "Victim must be in room.\r\n", ch );
      ProgBug( "Mpgain: victim not in room", ch );
      return;
    }

  ability = atoi(arg2);
  xp = atoi(arg3);

  if( ability < 0 || ability >= MAX_ABILITY )
    {
      SendToCharacter( "Mpgain which ability?\r\n", ch );
      ProgBug( "Mpgain: ability out of range", ch );
      return;
    }

  if( (xp < 1) )
    {
      SendToCharacter( "Mpgain how much?\r\n", ch );
      ProgBug( "Mpgain: experience out of range", ch );
      return;
    }

  xp =  urange(1, xp, ( GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) + 1 ) - GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) ) ) );

  ChPrintf( victim, "You gain %ld %s experience.\r\n", xp, ability_name[ability]  );
  gain_exp( victim, ability, xp );
}
