#include "character.h"
#include "ships.h"
#include "mud.h"

void do_clanbuyship(Character *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;
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
         &&    is_name("clanbuyship", ch->pcdata->bestowments))
       ||   !str_cmp( ch->name, clan->leadership.leader  ))
    ;
  else
    {
      send_to_char( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
      return;
    }

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      ship = ship_from_cockpit( ch->in_room->vnum );

      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( str_cmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      send_to_char( "&RThat ship isn't for sale!\r\n" ,ch );
      return;
    }

  if ( str_cmp( mainclan->name , "The Empire" )  && ship->type == SHIP_IMPERIAL )
    {
      send_to_char( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
      return;
    }

  if ( (str_cmp( mainclan->name , "The Rebel Alliance" )
	&& str_cmp( mainclan->name , "The New Republic" ) )
       && ship->type == SHIP_REBEL )
    {
      send_to_char( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
      return;
    }

  if ( !str_cmp( clan->name , "The Empire" )  && ship->type != SHIP_IMPERIAL )
    {
      send_to_char( "&RDue to contractual agreements that ship may not be purchaced by the empire!\r\n" ,ch );
      return;
    }

  price = get_ship_value( ship );

  if ( ch->pcdata->clan->funds < price )
    {
      ch_printf(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  clan->funds -= price;
  ch_printf(ch, "&G%s pays %ld credits to purchace the ship.\r\n", clan->name , price );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( clan->name );
  save_ship( ship );

  if ( ship->sclass <= SHIP_PLATFORM )
    clan->spacecraft++;
  else
    clan->vehicles++;
}
