#include "character.h"
#include "ships.h"
#include "mud.h"

void do_clanbuyship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;
  CLAN_DATA   *clan;
  CLAN_DATA   *mainclan;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      send_to_char( "&ROnly players can do that!\r\n" ,ch );
      return;
    }
  if ( !ch->pcdata->clan )
    {
      send_to_char( "&RYou aren't a member of any organizations!\r\n" ,ch );
      return;
    }

  clan = ch->pcdata->clan;
  mainclan = ch->pcdata->clan->mainclan ? ch->pcdata->clan->mainclan : clan;

  if ( ( ch->pcdata->bestowments
         &&    IsName("clanbuyship", ch->pcdata->bestowments))
       ||   !StrCmp( ch->name, clan->leadership.leader  ))
    ;
  else
    {
      send_to_char( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
      return;
    }

  ship = GetShipInRoom( ch->in_room , argument );
  if ( !ship )
    {
      ship = GetShipFromCockpit( ch->in_room->vnum );

      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( StrCmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      send_to_char( "&RThat ship isn't for sale!\r\n" ,ch );
      return;
    }

  if ( StrCmp( mainclan->name , "The Empire" )  && ship->type == SHIP_IMPERIAL )
    {
      send_to_char( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
      return;
    }

  if ( (StrCmp( mainclan->name , "The Rebel Alliance" )
	&& StrCmp( mainclan->name , "The New Republic" ) )
       && ship->type == SHIP_REBEL )
    {
      send_to_char( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
      return;
    }

  if ( !StrCmp( clan->name , "The Empire" )  && ship->type != SHIP_IMPERIAL )
    {
      send_to_char( "&RDue to contractual agreements that ship may not be purchaced by the empire!\r\n" ,ch );
      return;
    }

  price = GetShipValue( ship );

  if ( ch->pcdata->clan->funds < price )
    {
      ch_printf(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  clan->funds -= price;
  ch_printf(ch, "&G%s pays %ld credits to purchace the ship.\r\n", clan->name , price );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  DISPOSE( ship->owner );
  ship->owner = CopyString( clan->name );
  SaveShip( ship );

  if ( ship->sclass <= SHIP_PLATFORM )
    clan->spacecraft++;
  else
    clan->vehicles++;
}
