#include "character.h"
#include "ship.h"
#include "mud.h"
#include "clan.h"

void do_buyship(Character *ch, char *argument )
{
  long price;
  Ship *ship;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "&ROnly players can do that!\r\n" ,ch );
      return;
    }

  ship = GetShipInRoom( ch->InRoom , argument );

  if ( !ship )
    {
      ship = GetShipFromCockpit( ch->InRoom->Vnum );

      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( StrCmp( ship->Owner , "" )  || ship->Type == MOB_SHIP )
    {
      SendToCharacter( "&RThat ship isn't for sale!" ,ch );
      return;
    }


  if ( ship->Type == SHIP_IMPERIAL )
    {
      if ( !IsClanned( ch ) || StrCmp( ch->PCData->ClanInfo.Clan->Name , "the empire" ) )
        {
          if ( !IsClanned( ch )
	       || !ch->PCData->ClanInfo.Clan->MainClan
	       || StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name , "The Empire" ) )
            {
              SendToCharacter( "&RThat ship may only be purchased by the Empire!\r\n" ,ch );
              return;
            }
        }
    }
  else if ( ship->Type == SHIP_REBEL )
    {
      if ( !IsClanned( ch )
	   || (StrCmp( ch->PCData->ClanInfo.Clan->Name , "the rebel alliance" )
	       && StrCmp( ch->PCData->ClanInfo.Clan->Name , "The New Republic")))
        {
          if ( !IsClanned( ch )
	       || !ch->PCData->ClanInfo.Clan->MainClan
	       || (StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name , "The Rebel Alliance" )
		   && StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name, "The New Republic" )))
            {
              Echo( ch, "&RThat ship may only be purchased by The Rebel Alliance!\r\n" );
              return;
            }
        }
    }

  price = GetShipValue( ship );

  if ( ch->Gold < price )
    {
      Echo(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  ch->Gold -= price;
  Echo(ch, "&GYou pay %ld credits to purchace the ship.\r\n" , price );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->Owner );
  ship->Owner = CopyString( ch->Name );
  SaveShip( ship );
}
