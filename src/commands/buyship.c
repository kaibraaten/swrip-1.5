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
      if ( !IsClanned( ch ) || StrCmp( ch->pcdata->ClanInfo.Clan->Name , "the empire" ) )
        {
          if ( !IsClanned( ch )
	       || !ch->pcdata->ClanInfo.Clan->MainClan
	       || StrCmp( ch->pcdata->ClanInfo.Clan->MainClan->Name , "The Empire" ) )
            {
              SendToCharacter( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
              return;
            }
        }
    }
  else if ( ship->type == SHIP_REBEL )
    {
      if ( !IsClanned( ch )
	   || (StrCmp( ch->pcdata->ClanInfo.Clan->Name , "the rebel alliance" )
	       && StrCmp( ch->pcdata->ClanInfo.Clan->Name , "The New Republic")))
        {
          if ( !IsClanned( ch )
	       || !ch->pcdata->ClanInfo.Clan->MainClan
	       || (StrCmp( ch->pcdata->ClanInfo.Clan->MainClan->Name , "The Rebel Alliance" )
		   && StrCmp( ch->pcdata->ClanInfo.Clan->MainClan->Name, "The New Republic" )))
            {
              Echo( ch, "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" );
              return;
            }
        }
    }

  price = GetShipValue( ship );

  if ( ch->gold < price )
    {
      Echo(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  ch->gold -= price;
  Echo(ch, "&GYou pay %ld credits to purchace the ship.\r\n" , price );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->owner );
  ship->owner = CopyString( ch->name );
  SaveShip( ship );
}
