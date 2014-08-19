#include "mud.h"
#include "character.h"

void do_advance( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  Character *victim;
  int level, ability;
  int iLevel, iAbility;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' || !IsNumber( arg2 ) )
    {
      SendToCharacter( "Syntax: advance <char> <ability> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  ability = -1;

  for ( iAbility = 0 ; iAbility < MAX_ABILITY ; iAbility++ )
    {
      if ( !StringPrefix( arg3 , ability_name[iAbility] ) )
        {
          ability = iAbility;
          break;
        }
    }

  if ( ability == -1 )
    {
      SendToCharacter( "No Such Ability.\r\n", ch);
      do_advance(ch, "" );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  /* You can demote yourself but not someone else at your own trust. -- Narn */
  if ( GetTrustLevel( ch ) <= GetTrustLevel( victim ) && ch != victim )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 1 || level > 500 )
    {
      SendToCharacter( "Level must be 1 to 500.\r\n", ch );
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
      SendToCharacter( "Lowering a player's level!\r\n", ch );
      SetCharacterColor( AT_IMMORT, victim );
      SendToCharacter( "Cursed and forsaken! The gods have lowered your level.\r\n", victim );
      SetAbilityXP( victim, ability, 0 );
      SetAbilityLevel( victim, ability, 1 );

      if ( ability == COMBAT_ABILITY )
        victim->max_hit = 500;

      if ( ability == FORCE_ABILITY )
        victim->max_mana = 0;
    }
  else
    {
      SendToCharacter( "Raising a player's level!\r\n", ch );
      SendToCharacter( "The gods feel fit to raise your level!\r\n", victim );
    }

  for ( iLevel = GetAbilityLevel( victim, ability ) ; iLevel < level; iLevel++ )
    {
      SetAbilityXP( victim, ability, GetRequiredXpForLevel(iLevel+1) );
      gain_exp( victim, ability, 0 );
    }
}
