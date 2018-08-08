#include "mud.hpp"
#include "character.hpp"

void do_advance( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  Character *victim = nullptr;
  int level = 0, ability = 0;
  int iLevel = 0, iAbility = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( arg3 ) || !IsNumber( arg2 ) )
    {
      ch->Echo( "Syntax: advance <char> <ability> <level>.\r\n" );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      ch->Echo( "That player is not here.\r\n" );
      return;
    }

  ability = -1;

  for ( iAbility = 0 ; iAbility < MAX_ABILITY ; iAbility++ )
    {
      if ( !StringPrefix( arg3 , AbilityName[iAbility] ) )
        {
          ability = iAbility;
          break;
        }
    }

  if ( ability == -1 )
    {
      ch->Echo( "No such ability.\r\n" );
      do_advance(ch, "" );
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo( "Not on NPC's.\r\n" );
      return;
    }

  /* You can demote yourself but not someone else at your own trust. -- Narn */
  if ( GetTrustLevel( ch ) <= GetTrustLevel( victim ) && ch != victim )
    {
      ch->Echo( "You can't do that.\r\n" );
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 1 || level > 500 )
    {
      ch->Echo( "Level must be 1 to 500.\r\n" );
      return;
    }

  /*
   * Lower level:
   *   Reset to level 1.
   *   Then raise again.
   *   Currently, an imp can lower another imp.
   *   -- Swiftest
   */
  if ( level <= GetAbilityLevel( victim, ability ) )
    {
      ch->Echo( "Lowering a player's level!\r\n" );
      SetCharacterColor( AT_IMMORT, victim );
      victim->Echo( "Cursed and forsaken! The gods have lowered your level.\r\n" );
      SetAbilityXP( victim, ability, 0 );
      SetAbilityLevel( victim, ability, 1 );

      if ( ability == COMBAT_ABILITY )
        victim->MaxHit = 500;

      if ( ability == FORCE_ABILITY )
        victim->MaxMana = 0;
    }
  else
    {
      ch->Echo( "Raising a player's level!\r\n" );
      victim->Echo( "The gods feel fit to raise your level!\r\n" );
    }

  for ( iLevel = GetAbilityLevel( victim, ability ) ; iLevel < level; iLevel++ )
    {
      SetAbilityXP( victim, ability, GetRequiredXpForLevel(iLevel+1) );
      GainXP( victim, ability, 0 );
    }
}

