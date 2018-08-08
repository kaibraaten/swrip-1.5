#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_clanbuyship(Character *ch, char *argument )
{
  long price = 0;
  Ship *ship = NULL;
  Clan *clan = NULL;
  Clan *mainclan = NULL;

  if ( IsNpc(ch) )
    {
      ch->Echo( "&ROnly players can do that!\r\n" );
      return;
    }

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "&RYou aren't a member of any organizations!\r\n" );
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
      ch->Echo( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" );
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
      ch->Echo( "&RThat ship isn't for sale!\r\n" );
      return;
    }

  if ( StrCmp( mainclan->Name, BADGUY_CLAN ) && ship->Type == SHIP_IMPERIAL )
    {
      ch->Echo( "&RThat ship may only be purchaced by %s!\r\n", BADGUY_CLAN );
      return;
    }

  if ( StrCmp( mainclan->Name, GOODGUY_CLAN ) && ship->Type == SHIP_REBEL )
    {
      ch->Echo( "&RThat ship may only be purchaced by %s!\r\n", GOODGUY_CLAN );
      return;
    }

  if ( !StrCmp( clan->Name, BADGUY_CLAN ) && ship->Type != SHIP_IMPERIAL )
    {
      ch->Echo( "&RDue to contractual agreements that ship may not be purchaced by %s!\r\n",
                BADGUY_CLAN );
      return;
    }

  price = GetShipValue( ship );

  if ( clan->Funds < price )
    {
      ch->Echo("&RThis ship costs %ld. You don't have enough credits!\r\n", price );
      return;
    }

  clan->Funds -= price;
  ch->Echo( "&G%s pays %ld credits to purchace the ship.\r\n", clan->Name , price );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->Owner );
  ship->Owner = CopyString( clan->Name );
  Ships->Save(ship);

  if ( ship->Class <= SHIP_PLATFORM )
    clan->Spacecraft++;
  else
    clan->Vehicles++;

  Clans->Save( clan );
}

