#include "character.h"
#include "ships.h"
#include "mud.h"

void do_clansellship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;
  Clan   *clan;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      SendToCharacter( "&ROnly players can do that!\r\n" ,ch );
      return;
    }
  if ( !ch->pcdata->clan )
    {
      SendToCharacter( "&RYou aren't a member of any organizations!\r\n" ,ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( ( ch->pcdata->bestowments
         &&    IsName("clanbuyship", ch->pcdata->bestowments))
       ||   !StrCmp( ch->name, clan->leadership.leader  ))
    ;
  else
    {
      SendToCharacter( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
      return;
    }

  ship = GetShipInRoom( ch->in_room , argument );
  if ( !ship )
    {
      ship = GetShipFromCockpit( ch->in_room->vnum );

      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( !StrCmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      SendToCharacter( "&RThat ship is not owned!\r\n" ,ch );
      return;
    }

  if ( StrCmp( ship->owner , ch->pcdata->clan->name ) )
    {
      SendToCharacter( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = GetShipValue( ship );

  ch->pcdata->clan->funds += ( price - price/10 );
  Echo(ch, "&GYour clan receives %ld credits from selling your ship.\r\n" , price - price/10 );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->owner );
  ship->owner = CopyString( "" );
  ship->pilot = CopyString( "" );
  ship->copilot = CopyString( "" );
  SaveShip( ship );
}
