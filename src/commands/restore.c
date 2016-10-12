#include "character.h"
#include "mud.h"

#define RESTORE_INTERVAL 21600

void do_restore( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Restore whom?\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      Character *vch;
      Character *vch_next;

      if ( !ch->PCData )
        return;

      if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
        {
          if ( IsNpc( ch ) )
            {
              SendToCharacter( "You can't do that.\r\n", ch );
              return;
            }
          else
            {
              if ( current_time - last_restore_all_time < RESTORE_INTERVAL )
                {
                  SendToCharacter( "Sorry, you can't do a restore all yet.\r\n", ch );
                  do_restoretime( ch, "" );
                  return;
                }
            }
        }

      last_restore_all_time    = current_time;
      ch->PCData->restore_time = current_time;
      SaveCharacter( ch );
      SendToCharacter( "Ok.\r\n", ch);

      for ( vch = first_char; vch; vch = vch_next )
        {
          vch_next = vch->next;

          if ( !IsNpc( vch ) && !IsImmortal( vch ) )
	    {
              vch->Hit = vch->MaxHit;
              vch->Mana = vch->MaxMana;
              vch->Move = vch->MaxMove;
              vch->PCData->condition[COND_BLOODTHIRST] = (10 + vch->TopLevel);
              UpdatePosition (vch);
              Act( AT_IMMORT, "$n has restored you.", ch, NULL, vch, TO_VICT);
            }
        }
    }
  else
    {
      Character *victim;

      if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }

      if ( GetTrustLevel( ch ) < LEVEL_CREATOR
           &&  victim != ch
           && !( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) ) )
        {
          SendToCharacter( "You can't do that.\r\n", ch );
          return;
        }

      victim->Hit  = victim->MaxHit;
      victim->Mana = victim->MaxMana;
      victim->Move = victim->MaxMove;

      if ( victim->PCData )
        victim->PCData->condition[COND_BLOODTHIRST] = (10 + victim->TopLevel);

      UpdatePosition( victim );

      if ( ch != victim )
        Act( AT_IMMORT, "$n has restored you.", ch, NULL, victim, TO_VICT );

      SendToCharacter( "Ok.\r\n", ch );
      return;
    }
}
