#include "mud.h"

void do_group( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim = NULL;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      CHAR_DATA *gch = NULL;

      set_char_color( AT_GREEN, ch );
      ch_printf( ch, "%s's group:\r\n", PERS(ch, ch) );

      for ( gch = first_char; gch; gch = gch->next )
        {
          if ( is_same_group( gch, ch ) )
            {
              set_char_color( AT_DGREEN, ch );

              if (IS_AFFECTED(gch, AFF_POSSESS))
                ch_printf( ch,
                           "[%2d %s] %-16s %4s/%4s hp %4s/%4s mv %5s xp\r\n",
                           gch->top_level,
                           IS_NPC(gch) ? "Mob" : race_table[gch->race].race_name,
                           capitalize( PERS(gch, ch) ),
			   "????",
                           "????",
                           "????",
                           "????",
                           "?????"    );

              else
                ch_printf( ch,
                           "[%2d %s] %-16s %4d/%4d hp %4d/%4d mv\r\n",
                           gch->top_level,
                           IS_NPC(gch) ? "Mob" : race_table[gch->race].race_name,
                           capitalize( PERS(gch, ch) ),
                           gch->hit,
                           gch->max_hit,
                           gch->move,
                           gch->max_move   );
            }
        }
      return;
    }

  if ( !str_cmp( arg, "disband" ))
    {
      CHAR_DATA *gch = NULL;
      int count = 0;

      if ( ch->leader || ch->master )
        {
          send_to_char( "You cannot disband a group if you're following someone.\r\n", ch );
          return;
        }

      for ( gch = first_char; gch; gch = gch->next )
        {
          if ( is_same_group( ch, gch )
               && ( ch != gch ) )
            {
              gch->leader = NULL;
              gch->master = NULL;
              count++;
              send_to_char( "Your group is disbanded.\r\n", gch );
            }
        }

      if ( count == 0 )
	send_to_char( "You have no group members to disband.\r\n", ch );
      else
        send_to_char( "You disband your group.\r\n", ch );

      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      CHAR_DATA *rch = NULL;
      int count = 0;

      for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
        {
          if ( ch != rch
               && !IS_NPC( rch )
               && rch->master == ch
               && !ch->master
               && !ch->leader
               && !is_same_group( rch, ch )
               )
            {
              rch->leader = ch;
              count++;
            }
        }

      if ( count == 0 )
	{
	  send_to_char( "You have no eligible group members.\r\n", ch );
	}
      else
        {
          act( AT_ACTION, "$n groups $s followers.", ch, NULL, NULL, TO_ROOM );
          send_to_char( "You group your followers.\r\n", ch );
        }

      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( ch->master || ( ch->leader && ch->leader != ch ) )
    {
      send_to_char( "But you are following someone else!\r\n", ch );
      return;
    }

  if ( victim->master != ch && ch != victim )
    {
      act( AT_PLAIN, "$N isn't following you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( is_same_group( victim, ch ) && ch != victim )
    {
      victim->leader = NULL;
      act( AT_ACTION, "$n removes $N from $s group.",
	   ch, NULL, victim, TO_NOTVICT );
      act( AT_ACTION, "$n removes you from $s group.",
	   ch, NULL, victim, TO_VICT );
      act( AT_ACTION, "You remove $N from your group.",
	   ch, NULL, victim, TO_CHAR );
      return;
    }

  victim->leader = ch;
  act( AT_ACTION, "$N joins $n's group.", ch, NULL, victim, TO_NOTVICT );
  act( AT_ACTION, "You join $n's group.", ch, NULL, victim, TO_VICT );
  act( AT_ACTION, "$N joins your group.", ch, NULL, victim, TO_CHAR );
}