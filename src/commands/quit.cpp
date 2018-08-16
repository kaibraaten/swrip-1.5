#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

void do_quit( Character *ch, char *argument )
{
  int x = 0, y = 0, cost = 0;
  int level = 0;
  char qbuf[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) && IsBitSet(ch->Flags, ACT_POLYMORPHED))
    {
      ch->Echo("You can't quit while polymorphed.\r\n");
      return;
    }

  if ( IsNpc(ch) )
    return;

  if ( ch->Position == POS_FIGHTING )
    {
      SetCharacterColor( AT_RED, ch );
      ch->Echo("No way! You are fighting.\r\n");
      return;
    }

  if ( ch->Position < POS_STUNNED  )
    {
      SetCharacterColor( AT_BLOOD, ch );
      ch->Echo("You're not DEAD yet.\r\n");
      return;
    }

  if ( auction->Item != NULL && ((ch == auction->Buyer) || (ch == auction->Seller) ) )
    {
      ch->Echo("Wait until you have bought/sold the item on auction.\r\n");
      return;
    }

  if ( !IsImmortal(ch) && ch->InRoom
       && !IsBitSet( ch->InRoom->Flags, ROOM_HOTEL )
       && IsAuthed(ch) )
    {
      ch->Echo("You may not quit here.\r\n");
      ch->Echo("You will have to find a safer resting place such as a hotel...\r\n");
      ch->Echo("Maybe you could HAIL a speeder.\r\n");
      return;
    }

  if ( !IsImmortal(ch) && ch->InRoom
       && IsBitSet( ch->InRoom->Flags, ROOM_HOTEL )
       && !IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME )
       && !IsBitSet( ch->InRoom->Flags, ROOM_SPACECRAFT )
       && IsAuthed(ch) )
    {
      cost = GetCostToQuit( ch );

      if( !cost )
        {
          sprintf( buf, "The keeper takes a good look at you and adopts a look of pity, letting you stay here for free\r\n");
          ch->Echo("The keeper takes a good look at you and adopts a look of pity, letting you stay here for free\r\n");
        }
      else if( ch->Gold < cost )
        {
          sprintf( buf, "You need %d credits to spend the night here!\r\n", cost );
          ch->Echo(buf);
          return;
        }
      else
        {
          sprintf( buf, "The keeper takes a good look at you and lets you stay here for %d credits\r\n", cost );
          ch->Echo(buf);
          ch->Gold -= cost;

          if( ch->InRoom && ch->InRoom->Area )
            BoostEconomy( ch->InRoom->Area, cost );
        }
    }

  if ( ch->Challenged )
    {
      sprintf(qbuf,"%s has quit! Challenge is void. WHAT A WUSS!",ch->Name);
      ch->Challenged=NULL;
      ToChannel(qbuf,CHANNEL_ARENA,"&RArena&W",5);
    }

  SetCharacterColor( AT_WHITE, ch );
  ch->Echo("Your surroundings begin to fade as a mystical swirling vortex of colors\r\nenvelops your body... When you come to, things are not as they were.\r\n\r\n");
  Act( AT_SAY, "A strange voice says, 'We await your return, $n...'",
       ch, NULL, NULL, TO_CHAR );
  Act( AT_BYE, "$n has left the game.", ch, NULL, NULL, TO_ROOM );
  SetCharacterColor( AT_GREY, ch);

  sprintf( log_buf, "%s has quit.", ch->Name );
  quitting_char = ch;
  SaveCharacter( ch );
  SaveHome(ch);

  if ( ch->PCData->Pet )
    {
      Act( AT_BYE, "$N follows $S master out of the game.", ch, NULL,
	   ch->PCData->Pet, TO_ROOM );
      ExtractCharacter( ch->PCData->Pet, true );
    }

  saving_char = NULL;
  level = GetTrustLevel(ch);
  ExtractCharacter( ch, true );

  for ( x = 0; x < MAX_WEAR; x++ )
    for ( y = 0; y < MAX_LAYERS; y++ )
      save_equipment[x][y] = NULL;

  Log->LogStringPlus( log_buf, LOG_COMM, level );
}
