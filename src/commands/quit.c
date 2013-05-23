#include "character.h"
#include "mud.h"

void do_quit( CHAR_DATA *ch, char *argument )
{
  int x = 0, y = 0, cost = 0;
  int level = 0;
  char qbuf[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  if ( is_npc(ch) && IS_SET(ch->act, ACT_POLYMORPHED))
    {
      send_to_char("You can't quit while polymorphed.\r\n", ch);
      return;
    }

  if ( is_npc(ch) )
    return;

  if ( ch->position == POS_FIGHTING )
    {
      set_char_color( AT_RED, ch );
      send_to_char( "No way! You are fighting.\r\n", ch );
      return;
    }

  if ( ch->position < POS_STUNNED  )
    {
      set_char_color( AT_BLOOD, ch );
      send_to_char( "You're not DEAD yet.\r\n", ch );
      return;
    }

  if ( auction->item != NULL && ((ch == auction->buyer) || (ch == auction->seller) ) )
    {
      send_to_char("Wait until you have bought/sold the item on auction.\r\n", ch);
      return;
    }

  if ( !is_immortal(ch) && ch->in_room
       && !IS_SET( ch->in_room->room_flags, ROOM_HOTEL )
       && !is_not_authed(ch) )
    {
      send_to_char("You may not quit here.\r\n", ch);
      send_to_char("You will have to find a safer resting place such as a hotel...\r\n", ch);
      send_to_char("Maybe you could HAIL a speeder.\r\n", ch);
      return;
    }

  if ( !is_immortal(ch) && ch->in_room
       && IS_SET( ch->in_room->room_flags, ROOM_HOTEL )
       && !IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME )
       && !IS_SET( ch->in_room->room_flags, ROOM_SPACECRAFT )
       && !is_not_authed(ch) )
    {
      cost = get_cost_quit( ch );

      if( !cost )
        {
          sprintf( buf, "The keeper takes a good look at you and adopts a look of pity, letting you stay here for free\r\n");
          send_to_char("The keeper takes a good look at you and adopts a look of pity, letting you stay here for free\r\n", ch);
        }
      else if( ch->gold < cost )
        {
          sprintf( buf, "You need %d credits to spend the night here!\r\n", cost );
          send_to_char(buf, ch);
          return;
        }
      else
        {
          sprintf( buf, "The keeper takes a good look at you and lets you stay here for %d credits\r\n", cost );
          send_to_char(buf, ch);
          ch->gold -= cost;

          if( ch->in_room && ch->in_room->area )
            boost_economy( ch->in_room->area, cost );
        }
    }

  if ( ch->challenged )
    {
      sprintf(qbuf,"%s has quit! Challenge is void. WHAT A WUSS!",ch->name);
      ch->challenged=NULL;
      to_channel(qbuf,CHANNEL_ARENA,"&RArena&W",5);
    }

  set_char_color( AT_WHITE, ch );
  send_to_char( "Your surroundings begin to fade as a mystical swirling vortex of colors\r\nenvelops your body... When you come to, things are not as they were.\r\n\r\n", ch );
  act( AT_SAY, "A strange voice says, 'We await your return, $n...'",
       ch, NULL, NULL, TO_CHAR );
  act( AT_BYE, "$n has left the game.", ch, NULL, NULL, TO_ROOM );
  set_char_color( AT_GREY, ch);

  sprintf( log_buf, "%s has quit.", ch->name );
  quitting_char = ch;
  save_char_obj( ch );
  save_home(ch);

  if ( ch->pcdata->pet )
    {
      act( AT_BYE, "$N follows $S master out of the game.", ch, NULL,
	   ch->pcdata->pet, TO_ROOM );
      extract_char( ch->pcdata->pet, TRUE );
    }

  saving_char = NULL;
  level = get_trust(ch);
  extract_char( ch, TRUE );

  for ( x = 0; x < MAX_WEAR; x++ )
    for ( y = 0; y < MAX_LAYERS; y++ )
      save_equipment[x][y] = NULL;

  log_string_plus( log_buf, LOG_COMM, level );
}
