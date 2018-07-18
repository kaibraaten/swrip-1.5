#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_clansellship(Character *ch, char *argument )
{
  long price = 0;
  Ship *ship = NULL;
  Clan *clan = NULL;

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

  if ( ( ch->PCData->Bestowments
         &&    IsName("clanbuyship", ch->PCData->Bestowments))
       ||   !StrCmp( ch->Name, clan->Leadership.Leader  ))
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

  if ( !StrCmp( ship->Owner , "" )  || ship->Type == MOB_SHIP )
    {
      SendToCharacter( "&RThat ship is not owned!\r\n" ,ch );
      return;
    }

  if ( StrCmp( ship->Owner, clan->Name ) )
    {
      SendToCharacter( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = GetShipValue( ship );

  clan->Funds += ( price - price/10 );
  Echo(ch, "&GYour clan receives %ld credits from selling your ship.\r\n" , price - price/10 );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->Owner );
  ship->Owner = CopyString( "" );
  ship->Pilot = CopyString( "" );
  ship->CoPilot = CopyString( "" );
  ShipRepos->Save(ship);
  ClanRepos->Save(clan);
}
