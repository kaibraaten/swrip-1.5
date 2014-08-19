#include "character.h"
#include "mud.h"

void do_quit( Character *ch, char *argument )
{
  int x = 0, y = 0, cost = 0;
  int level = 0;
  char qbuf[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) && IsBitSet(ch->act, ACT_POLYMORPHED))
    {
      SendToCharacter("You can't quit while polymorphed.\r\n", ch);
      return;
    }

  if ( IsNpc(ch) )
    return;

  if ( ch->position == POS_FIGHTING )
    {
      SetCharacterColor( AT_RED, ch );
      SendToCharacter( "No way! You are fighting.\r\n", ch );
      return;
    }

  if ( ch->position < POS_STUNNED  )
    {
      SetCharacterColor( AT_BLOOD, ch );
      SendToCharacter( "You're not DEAD yet.\r\n", ch );
      return;
    }

  if ( auction->item != NULL && ((ch == auction->buyer) || (ch == auction->seller) ) )
    {
      SendToCharacter("Wait until you have bought/sold the item on auction.\r\n", ch);
      return;
    }

  if ( !IsImmortal(ch) && ch->in_room
       && !IsBitSet( ch->in_room->room_flags, ROOM_HOTEL )
       && IsAuthed(ch) )
    {
      SendToCharacter("You may not quit here.\r\n", ch);
      SendToCharacter("You will have to find a safer resting place such as a hotel...\r\n", ch);
      SendToCharacter("Maybe you could HAIL a speeder.\r\n", ch);
      return;
    }

  if ( !IsImmortal(ch) && ch->in_room
       && IsBitSet( ch->in_room->room_flags, ROOM_HOTEL )
       && !IsBitSet( ch->in_room->room_flags, ROOM_PLR_HOME )
       && !IsBitSet( ch->in_room->room_flags, ROOM_SPACECRAFT )
       && IsAuthed(ch) )
    {
      cost = GetCostToQuit( ch );

      if( !cost )
        {
          sprintf( buf, "The keeper takes a good look at you and adopts a look of pity, letting you stay here for free\r\n");
          SendToCharacter("The keeper takes a good look at you and adopts a look of pity, letting you stay here for free\r\n", ch);
        }
      else if( ch->gold < cost )
        {
          sprintf( buf, "You need %d credits to spend the night here!\r\n", cost );
          SendToCharacter(buf, ch);
          return;
        }
      else
        {
          sprintf( buf, "The keeper takes a good look at you and lets you stay here for %d credits\r\n", cost );
          SendToCharacter(buf, ch);
          ch->gold -= cost;

          if( ch->in_room && ch->in_room->area )
            boost_economy( ch->in_room->area, cost );
        }
    }

  if ( ch->challenged )
    {
      sprintf(qbuf,"%s has quit! Challenge is void. WHAT A WUSS!",ch->name);
      ch->challenged=NULL;
      ToChannel(qbuf,CHANNEL_ARENA,"&RArena&W",5);
    }

  SetCharacterColor( AT_WHITE, ch );
  SendToCharacter( "Your surroundings begin to fade as a mystical swirling vortex of colors\r\nenvelops your body... When you come to, things are not as they were.\r\n\r\n", ch );
  act( AT_SAY, "A strange voice says, 'We await your return, $n...'",
       ch, NULL, NULL, TO_CHAR );
  act( AT_BYE, "$n has left the game.", ch, NULL, NULL, TO_ROOM );
  SetCharacterColor( AT_GREY, ch);

  sprintf( log_buf, "%s has quit.", ch->name );
  quitting_char = ch;
  save_char_obj( ch );
  save_home(ch);

  if ( ch->pcdata->pet )
    {
      act( AT_BYE, "$N follows $S master out of the game.", ch, NULL,
	   ch->pcdata->pet, TO_ROOM );
      extract_char( ch->pcdata->pet, true );
    }

  saving_char = NULL;
  level = GetTrustLevel(ch);
  extract_char( ch, true );

  for ( x = 0; x < MAX_WEAR; x++ )
    for ( y = 0; y < MAX_LAYERS; y++ )
      save_equipment[x][y] = NULL;

  log_string_plus( log_buf, LOG_COMM, level );
}
