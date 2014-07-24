#include "character.h"
#include "mud.h"

void do_bashdoor( Character *ch, char *argument )
{
  Character *gch = NULL;
  EXIT_DATA *pexit = NULL;
  char arg[MAX_INPUT_LENGTH];

  if ( !is_npc( ch )
       &&  ch->pcdata->learned[gsn_bashdoor] <= 0  )
    {
      send_to_char( "You're not enough of a warrior to bash doors!\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Bash what?\r\n", ch );
      return;
    }

  if ( ch->fighting )
    {
      send_to_char( "You can't break off your fight.\r\n", ch );
      return;
    }

  if ( ( pexit = find_door( ch, arg, FALSE ) ) != NULL )
    {
      ROOM_INDEX_DATA *to_room = NULL;
      EXIT_DATA *pexit_rev = NULL;
      int bash_chance = 0;
      char *keyword = NULL;

      if ( !IS_SET( pexit->exit_info, EX_CLOSED ) )
        {
          send_to_char( "Calm down.  It is already open.\r\n", ch );
          return;
        }

      set_wait_state( ch, skill_table[gsn_bashdoor]->beats );

      if ( IS_SET( pexit->exit_info, EX_SECRET ) )
        keyword = "wall";
      else
        keyword = pexit->keyword;

      if ( !is_npc(ch) )
        bash_chance = ch->pcdata->learned[gsn_bashdoor] / 2;
      else
        bash_chance = 90;

      if ( !IS_SET( pexit->exit_info, EX_BASHPROOF )
           && ch->move >= 15
           && number_percent() < ( bash_chance + 4 * ( get_curr_str( ch ) - 19 ) ) )
        {
          REMOVE_BIT( pexit->exit_info, EX_CLOSED );

          if ( IS_SET( pexit->exit_info, EX_LOCKED ) )
            REMOVE_BIT( pexit->exit_info, EX_LOCKED );

          SET_BIT( pexit->exit_info, EX_BASHED );
          act(AT_SKILL, "Crash!  You bashed open the $d!",
	      ch, NULL, keyword, TO_CHAR );
          act(AT_SKILL, "$n bashes open the $d!",
	      ch, NULL, keyword, TO_ROOM );
          learn_from_success(ch, gsn_bashdoor);

          if ( (to_room = pexit->to_room) != NULL
               &&   (pexit_rev = pexit->rexit) != NULL
               &&    pexit_rev->to_room == ch->in_room )
            {
              Character *rch = NULL;

              REMOVE_BIT( pexit_rev->exit_info, EX_CLOSED );

              if ( IS_SET( pexit_rev->exit_info, EX_LOCKED ) )
                REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );

              SET_BIT( pexit_rev->exit_info, EX_BASHED );

              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                {
                  act(AT_SKILL, "The $d crashes open!",
                      rch, NULL, pexit_rev->keyword, TO_CHAR );
		}
            }

          damage( ch, ch, ( ch->max_hit / 20 ), gsn_bashdoor );
        }
      else
        {
          act(AT_SKILL, "WHAAAAM!!! You bash against the $d, but it doesn't budge.",
              ch, NULL, keyword, TO_CHAR );
          act(AT_SKILL, "WHAAAAM!!! $n bashes against the $d, but it holds strong.",
              ch, NULL, keyword, TO_ROOM );
          damage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_bashdoor );
          learn_from_failure(ch, gsn_bashdoor);
        }
    }
  else
    {
      act(AT_SKILL, "WHAAAAM!!! You bash against the wall, but it doesn't budge.",
          ch, NULL, NULL, TO_CHAR );
      act(AT_SKILL, "WHAAAAM!!! $n bashes against the wall, but it holds strong.",
          ch, NULL, NULL, TO_ROOM );
      damage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_bashdoor );
      learn_from_failure(ch, gsn_bashdoor);
    }

  if ( !char_died( ch ) )
    {
      for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
	{
	  if ( is_awake( gch )
	       && !gch->fighting
	       && ( is_npc( gch ) && !is_affected_by( gch, AFF_CHARM ) )
	       && ( ch->top_level - gch->top_level <= 4 )
	       && number_bits( 2 ) == 0 )
	    {
	      multi_hit( gch, ch, TYPE_UNDEFINED );
	    }
	}
    }
}
