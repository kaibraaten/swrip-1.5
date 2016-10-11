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

      if ( !ch->pcdata )
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
      ch->pcdata->restore_time = current_time;
      SaveCharacter( ch );
      SendToCharacter( "Ok.\r\n", ch);

      for ( vch = first_char; vch; vch = vch_next )
        {
          vch_next = vch->next;

          if ( !IsNpc( vch ) && !IsImmortal( vch ) )
	    {
              vch->hit = vch->max_hit;
              vch->mana = vch->max_mana;
              vch->move = vch->max_move;
              vch->pcdata->condition[COND_BLOODTHIRST] = (10 + vch->top_level);
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

      victim->hit  = victim->max_hit;
      victim->mana = victim->max_mana;
      victim->move = victim->max_move;

      if ( victim->pcdata )
        victim->pcdata->condition[COND_BLOODTHIRST] = (10 + victim->top_level);

      UpdatePosition( victim );

      if ( ch != victim )
        Act( AT_IMMORT, "$n has restored you.", ch, NULL, victim, TO_VICT );

      SendToCharacter( "Ok.\r\n", ch );
      return;
    }
}
