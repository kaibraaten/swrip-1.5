#include "character.hpp"
#include "mud.hpp"

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

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("mpgain whom?\r\n");
      ProgBug( "Mpgain: invalid argument1", ch );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("mpgain in what ability?\r\n");
      ProgBug( "Mpgain: invalid argument2", ch );
      return;
    }

  if ( IsNullOrEmpty( arg3 ) )
    {
      ch->Echo("mpgain how much exp?\r\n");
      ProgBug( "Mpgain: invalid argument3", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoomMudProg( ch, arg1 ) ) == NULL )
    {
      ch->Echo("Victim must be in room.\r\n");
      ProgBug( "Mpgain: victim not in room", ch );
      return;
    }

  ability = atoi(arg2);
  xp = atoi(arg3);

  if( ability < 0 || ability >= MAX_ABILITY )
    {
      ch->Echo("Mpgain which ability?\r\n");
      ProgBug( "Mpgain: ability out of range", ch );
      return;
    }

  if( (xp < 1) )
    {
      ch->Echo("Mpgain how much?\r\n");
      ProgBug( "Mpgain: experience out of range", ch );
      return;
    }

  xp =  urange(1, xp, ( GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) + 1 ) - GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) ) ) );

  victim->Echo("You gain %ld %s experience.\r\n", xp, AbilityName[ability]  );
  GainXP( victim, ability, xp );
}

