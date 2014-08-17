#include "character.h"
#include "ships.h"
#include "mud.h"

void do_clansellship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;
  CLAN_DATA   *clan;

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

  if ( ( ch->pcdata->bestowments
         &&    is_name("clanbuyship", ch->pcdata->bestowments))
       ||   !str_cmp( ch->name, clan->leadership.leader  ))
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

  if ( !str_cmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      send_to_char( "&RThat ship is not owned!\r\n" ,ch );
      return;
    }

  if ( str_cmp( ship->owner , ch->pcdata->clan->name ) )
    {
      send_to_char( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = GetShipValue( ship );

  ch->pcdata->clan->funds += ( price - price/10 );
  ch_printf(ch, "&GYour clan receives %ld credits from selling your ship.\r\n" , price - price/10 );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  DISPOSE( ship->owner );
  ship->owner = str_dup( "" );
  ship->pilot = str_dup( "" );
  ship->copilot = str_dup( "" );
  SaveShip( ship );
}
