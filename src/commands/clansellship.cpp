#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_clansellship(Character *ch, char *argument )
{
  long price = 0;
  Ship *ship = NULL;
  Clan *clan = NULL;

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

  if ( ( ch->PCData->Bestowments
         && IsName("clanbuyship", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader  ))
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

  if ( !StrCmp( ship->Owner , "" )  || ship->Type == MOB_SHIP )
    {
      ch->Echo( "&RThat ship is not owned!\r\n" );
      return;
    }

  if ( StrCmp( ship->Owner, clan->Name ) )
    {
      ch->Echo( "&RThat isn't your ship!" );
      return;
    }

  price = GetShipValue( ship );

  clan->Funds += ( price - price/10 );
  ch->Echo("&GYour clan receives %ld credits from selling your ship.\r\n" , price - price/10 );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->Owner );
  ship->Owner = CopyString( "" );
  ship->Pilot = CopyString( "" );
  ship->CoPilot = CopyString( "" );
  Ships->Save(ship);
  Clans->Save(clan);
}

