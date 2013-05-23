#include "character.h"
#include "mud.h"

void do_cutdoor( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *gch;
  EXIT_DATA *pexit;
  char       arg [ MAX_INPUT_LENGTH ];
  OBJ_DATA *wield;
  int whichweap;
  int SABER = 1;
  int PIKE = 0;

  if ( ( wield = get_eq_char( ch, WEAR_WIELD ) ) == NULL ||
       ( ( wield->value[3] != WEAPON_LIGHTSABER ) && ( wield->value[3] != WEAPON_FORCE_PIKE ) ) )
    {
      send_to_char( "You need a lightsaber for that!\r\n", ch );
      return;
    }

  if ( wield->value[3] == WEAPON_LIGHTSABER )
    whichweap = SABER;
  else
    whichweap = PIKE;
  if ( !is_npc( ch )
       && ( (whichweap ? ch->pcdata->learned[gsn_lightsabers] <= 0 : ch->pcdata->learned[gsn_force_pikes] <= 0) || ch->pcdata->learned[gsn_cutdoor] <= 0 ))
    {
      send_to_char( "You can not use it well enough to cut a door open.\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Cut what?\r\n", ch );
      return;
    }

  if ( ch->fighting )
    {
      send_to_char( "You can't break off your fight.\r\n", ch );
      return;
    }

  if ( ( pexit = find_door( ch, arg, FALSE ) ) != NULL )
    {
      ROOM_INDEX_DATA *to_room;
      EXIT_DATA       *pexit_rev;
      int              the_chance;
      char          *keyword;

      if ( !IS_SET( pexit->exit_info, EX_CLOSED ) )
        {
          send_to_char( "It is already open.\r\n", ch );
          return;
        }

      WAIT_STATE( ch, skill_table[gsn_cutdoor]->beats );

      if ( IS_SET( pexit->exit_info, EX_SECRET ) )
        keyword = "wall";
      else
        keyword = pexit->keyword;
      if ( !is_npc(ch) )
        the_chance = ch->pcdata->learned[gsn_cutdoor] / 2;
      else
        the_chance = 90;

      if ( !IS_SET( pexit->exit_info, EX_BASHPROOF )
           &&   ch->move >= 15
           &&   number_percent( ) < ( the_chance + 4 * ( get_curr_str( ch ) - 19 ) ) )
        {
          REMOVE_BIT( pexit->exit_info, EX_CLOSED );
          if ( IS_SET( pexit->exit_info, EX_LOCKED ) )
            REMOVE_BIT( pexit->exit_info, EX_LOCKED );
          SET_BIT( pexit->exit_info, EX_BASHED );

          act(AT_SKILL, "You cut open the $d!", ch, NULL, keyword, TO_CHAR );
          act(AT_SKILL, "$n cuts open the $d!",          ch, NULL, keyword, TO_ROOM );
	  learn_from_success(ch, gsn_cutdoor);

          if ( (to_room = pexit->to_room) != NULL
               &&   (pexit_rev = pexit->rexit) != NULL
               &&    pexit_rev->to_room == ch->in_room )
            {
              CHAR_DATA *rch;

              REMOVE_BIT( pexit_rev->exit_info, EX_CLOSED );
              if ( IS_SET( pexit_rev->exit_info, EX_LOCKED ) )
                REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );
              SET_BIT( pexit_rev->exit_info, EX_BASHED );

              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                {
                  act(AT_SKILL, "The $d falls open!",
                      rch, NULL, pexit_rev->keyword, TO_CHAR );
                }
            }
          damage( ch, ch, ( ch->max_hit / 20 ), gsn_cutdoor );

        }
      else
        {
          act(AT_SKILL, "You cut at the $d, but you handle it badly and just score it.",
              ch, NULL, keyword, TO_CHAR );
          act(AT_SKILL, "$n cuts at the $d, but just scores it.",
              ch, NULL, keyword, TO_ROOM );
          damage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_cutdoor );
          learn_from_failure(ch, gsn_cutdoor);
        }
    }
  else
    {
      act(AT_SKILL, "You slice at the wall, but just score it.",
          ch, NULL, NULL, TO_CHAR );
      act(AT_SKILL, "$n cuts at the wall, but just scores it.",
          ch, NULL, NULL, TO_ROOM );
      damage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_cutdoor );
      learn_from_failure(ch, gsn_cutdoor);
    }
  if ( !char_died( ch ) )
    for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
      {
        if ( is_awake( gch )
	     && !gch->fighting
             && ( is_npc( gch ) && !is_affected_by( gch, AFF_CHARM ) )
             && ( ch->top_level - gch->top_level <= 4 )
             && number_bits( 2 ) == 0 )
          multi_hit( gch, ch, TYPE_UNDEFINED );
      }
}
