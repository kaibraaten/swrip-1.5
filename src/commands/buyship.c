#include "character.h"
#include "ships.h"
#include "mud.h"
#include "clan.h"

void do_buyship(Character *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      send_to_char( "&ROnly players can do that!\r\n" ,ch );
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
      send_to_char( "&RThat ship isn't for sale!" ,ch );
      return;
    }


  if ( ship->type == SHIP_IMPERIAL )
    {
      if ( !is_clanned( ch ) || str_cmp( ch->pcdata->clan->name , "the empire" ) )
        {
          if ( !is_clanned( ch ) || !ch->pcdata->clan->mainclan || str_cmp( ch->pcdata->clan->mainclan->name , "The Empire" ) )
            {
              send_to_char( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
              return;
            }
        }
    }
  else if ( ship->type == SHIP_REBEL )
    {
      if ( !is_clanned( ch ) || (str_cmp( ch->pcdata->clan->name , "the rebel alliance" ) && str_cmp( ch->pcdata->clan->name , "The New Republic")))
        {
          if ( !is_clanned( ch ) ||  !ch->pcdata->clan->mainclan || str_cmp( ch->pcdata->clan->mainclan->name , "The Rebel Alliance" ) )
            {
              send_to_char( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
              return;
            }
        }
    }

  price = get_ship_value( ship );

  if ( ch->gold < price )
    {
      ch_printf(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  ch->gold -= price;
  ch_printf(ch, "&GYou pay %ld credits to purchace the ship.\r\n" , price );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( ch->name );
  save_ship( ship );
}
