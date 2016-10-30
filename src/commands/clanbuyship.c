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

  clan = ch->PCData->ClanInfo.Clan;
  mainclan = clan->MainClan ? clan->MainClan : clan;

  if ( ( ch->PCData->Bestowments
         && IsName("clanbuyship", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader ))
    ;
  else
    {
      SendToCharacter( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
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
      SendToCharacter( "&RThat ship isn't for sale!\r\n" ,ch );
      return;
    }

  if ( StrCmp( mainclan->Name, BADGUY_CLAN ) && ship->Type == SHIP_IMPERIAL )
    {
      Echo( ch, "&RThat ship may only be purchaced by %s!\r\n", BADGUY_CLAN );
      return;
    }

  if ( StrCmp( mainclan->Name, GOODGUY_CLAN ) && ship->Type == SHIP_REBEL )
    {
      Echo( ch, "&RThat ship may only be purchaced by %s!\r\n", GOODGUY_CLAN );
      return;
    }

  if ( !StrCmp( clan->Name, BADGUY_CLAN ) && ship->Type != SHIP_IMPERIAL )
    {
      Echo( ch, "&RDue to contractual agreements that ship may not be purchaced by %s!\r\n",
	    BADGUY_CLAN );
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

  FreeMemory( ship->Owner );
  ship->Owner = CopyString( clan->Name );
  SaveShip( ship );

  if ( ship->Class <= SHIP_PLATFORM )
    clan->Spacecraft++;
  else
    clan->Vehicles++;

  SaveClan( clan );
}
