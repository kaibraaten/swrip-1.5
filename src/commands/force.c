#include "mud.h"
#include "character.h"

void do_force( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool mobsonly;
  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Force whom to do what?\r\n", ch );
      return;
    }

  mobsonly = get_trust( ch ) < sysdata.level_forcepc;

  if ( !str_cmp( arg, "all" ) )
    {
      Character *vch;
      Character *vch_next;

      if ( mobsonly )
        {
          send_to_char( "Force whom to do what?\r\n", ch );
          return;
        }

      for ( vch = first_char; vch; vch = vch_next )
        {
          vch_next = vch->next;

          if ( !is_npc(vch) && get_trust( vch ) < get_trust( ch ) )
            {
              act( AT_IMMORT, "$n forces you to '$t'.", ch, argument, vch, TO_VICT );
              interpret( vch, argument );
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

      if ( victim == ch )
        {
          send_to_char( "Aye aye, right away!\r\n", ch );
          return;
        }

      if ( ( get_trust( victim ) >= get_trust( ch ) )
           || ( mobsonly && !is_npc( victim ) ) )
        {
          send_to_char( "Do it yourself!\r\n", ch );
          return;
        }

      act( AT_IMMORT, "$n forces you to '$t'.", ch, argument, victim, TO_VICT );
      interpret( victim, argument );
    }

  send_to_char( "Ok.\r\n", ch );
}
