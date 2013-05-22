#include "mud.h"
#include "character.h"

void do_advance( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  int level, ability;
  int iLevel, iAbility;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg3 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' || !is_number( arg2 ) )
    {
      send_to_char( "Syntax: advance <char> <ability> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  ability = -1;

  for ( iAbility = 0 ; iAbility < MAX_ABILITY ; iAbility++ )
    {
      if ( !str_prefix( arg3 , ability_name[iAbility] ) )
        {
          ability = iAbility;
          break;
        }
    }

  if ( ability == -1 )
    {
      send_to_char( "No Such Ability.\r\n", ch);
      do_advance(ch, "" );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  /* You can demote yourself but not someone else at your own trust. -- Narn */
  if ( get_trust( ch ) <= get_trust( victim ) && ch != victim )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 1 || level > 500 )
    {
      send_to_char( "Level must be 1 to 500.\r\n", ch );
      return;
    }

  /*
   * Lower level:
   *   Reset to level 1.
   *   Then raise again.
   *   Currently, an imp can lower another imp.
   *   -- Swiftest
   */
  if ( level <= get_level( victim, ability ) )
    {
      send_to_char( "Lowering a player's level!\r\n", ch );
      set_char_color( AT_IMMORT, victim );
      send_to_char( "Cursed and forsaken! The gods have lowered your level.\r\n", victim );
      set_exp( victim, ability, 0 );
      set_level( victim, ability, 1 );

      if ( ability == COMBAT_ABILITY )
        victim->max_hit = 500;

      if ( ability == FORCE_ABILITY )
        victim->max_mana = 0;
    }
  else
    {
      send_to_char( "Raising a player's level!\r\n", ch );
      send_to_char( "The gods feel fit to raise your level!\r\n", victim );
    }

  for ( iLevel = get_level( victim, ability ) ; iLevel < level; iLevel++ )
    {
      set_exp( victim, ability, exp_level(iLevel+1) );
      gain_exp( victim, ability, 0 );
    }
}
