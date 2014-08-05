#include "character.h"
#include "mud.h"

#define RESTORE_INTERVAL 21600

void do_restore( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Restore whom?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      Character *vch;
      Character *vch_next;

      if ( !ch->pcdata )
        return;

      if ( get_trust( ch ) < LEVEL_SUB_IMPLEM )
        {
          if ( is_npc( ch ) )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }
          else
            {
              if ( current_time - last_restore_all_time < RESTORE_INTERVAL )
                {
                  send_to_char( "Sorry, you can't do a restore all yet.\r\n", ch );
                  do_restoretime( ch, "" );
                  return;
                }
            }
        }

      last_restore_all_time    = current_time;
      ch->pcdata->restore_time = current_time;
      save_char_obj( ch );
      send_to_char( "Ok.\r\n", ch);

      for ( vch = first_char; vch; vch = vch_next )
        {
          vch_next = vch->next;

          if ( !is_npc( vch ) && !is_immortal( vch ) )
	    {
              vch->hit = vch->max_hit;
              vch->mana = vch->max_mana;
              vch->move = vch->max_move;
              vch->pcdata->condition[COND_BLOODTHIRST] = (10 + vch->top_level);
              update_pos (vch);
              act( AT_IMMORT, "$n has restored you.", ch, NULL, vch, TO_VICT);
            }
        }
    }
  else
    {
      Character *victim;

      if ( ( victim = get_char_world( ch, arg ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( get_trust( ch ) < LEVEL_CREATOR
           &&  victim != ch
           && !( is_npc( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) ) )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return;
        }

      victim->hit  = victim->max_hit;
      victim->mana = victim->max_mana;
      victim->move = victim->max_move;

      if ( victim->pcdata )
        victim->pcdata->condition[COND_BLOODTHIRST] = (10 + victim->top_level);

      update_pos( victim );

      if ( ch != victim )
        act( AT_IMMORT, "$n has restored you.", ch, NULL, victim, TO_VICT );

      send_to_char( "Ok.\r\n", ch );
      return;
    }
}
