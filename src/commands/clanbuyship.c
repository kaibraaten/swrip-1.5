#include "character.h"
#include "ship.h"
#include "mud.h"
#include "clan.h"

void do_clanbuyship(Character *ch, char *argument )
{
  long price = 0;
  Ship *ship = NULL;
  Clan *clan = NULL;
  Clan *mainclan = NULL;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "&ROnly players can do that!\r\n" ,ch );
      return;
    }

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "&RYou aren't a member of any organizations!\r\n" ,ch );
      return;
    }

  clan = ch->pcdata->ClanInfo.Clan;
  mainclan = clan->MainClan ? clan->MainClan : clan;

  if ( ( ch->pcdata->bestowments
         && IsName("clanbuyship", ch->pcdata->bestowments))
       || !StrCmp( ch->name, clan->Leadership.Leader ))
    ;
  else
    {
      SendToCharacter( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
      return;
    }

  ship = GetShipInRoom( ch->in_room , argument );
  if ( !ship )
    {
      ship = GetShipFromCockpit( ch->in_room->Vnum );

      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( StrCmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      SendToCharacter( "&RThat ship isn't for sale!\r\n" ,ch );
      return;
    }

  if ( StrCmp( mainclan->Name , "The Empire" )  && ship->type == SHIP_IMPERIAL )
    {
      SendToCharacter( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
      return;
    }

  if ( (StrCmp( mainclan->Name , "The Rebel Alliance" )
	&& StrCmp( mainclan->Name , "The New Republic" ) )
       && ship->type == SHIP_REBEL )
    {
      SendToCharacter( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
      return;
    }

  if ( !StrCmp( clan->Name , "The Empire" )  && ship->type != SHIP_IMPERIAL )
    {
      SendToCharacter( "&RDue to contractual agreements that ship may not be purchaced by the empire!\r\n" ,ch );
      return;
    }

  price = GetShipValue( ship );

  if ( clan->Funds < price )
    {
      Echo(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  clan->Funds -= price;
  Echo(ch, "&G%s pays %ld credits to purchace the ship.\r\n", clan->Name , price );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->owner );
  ship->owner = CopyString( clan->Name );
  SaveShip( ship );

  if ( ship->sclass <= SHIP_PLATFORM )
    clan->Spacecraft++;
  else
    clan->Vehicles++;

  SaveClan( clan );
}
