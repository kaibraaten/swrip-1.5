#include "character.h"
#include "ships.h"
#include "mud.h"

void do_buyship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      SendToCharacter( "&ROnly players can do that!\r\n" ,ch );
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

  if ( StrCmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      SendToCharacter( "&RThat ship isn't for sale!" ,ch );
      return;
    }


  if ( ship->type == SHIP_IMPERIAL )
    {
      if ( !ch->pcdata->clan || StrCmp( ch->pcdata->clan->name , "the empire" ) )
        {
          if ( !ch->pcdata->clan || !ch->pcdata->clan->mainclan || StrCmp( ch->pcdata->clan->mainclan->name , "The Empire" ) )
            {
              SendToCharacter( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
              return;
            }
        }
    }
  else if ( ship->type == SHIP_REBEL )
    {
      if ( !ch->pcdata->clan || (StrCmp( ch->pcdata->clan->name , "the rebel alliance" ) && StrCmp( ch->pcdata->clan->name , "The New Republic")))
        {
          if ( !ch->pcdata->clan ||  !ch->pcdata->clan->mainclan || StrCmp( ch->pcdata->clan->mainclan->name , "The Rebel Alliance" ) )
            {
              SendToCharacter( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
              return;
            }
        }
    }

  price = GetShipValue( ship );

  if ( ch->gold < price )
    {
      ChPrintf(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  ch->gold -= price;
  ChPrintf(ch, "&GYou pay %ld credits to purchace the ship.\r\n" , price );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->owner );
  ship->owner = CopyString( ch->name );
  SaveShip( ship );
}
