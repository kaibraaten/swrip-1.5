#include <string.h>
#include "mud.h"
#include "ship.h"
#include "character.h"
#include "turret.h"
#include "clan.h"

void do_reload( Character *ch, char *argument )
{
  /* Reload code added by Darrik Vequir */
  char arg[MAX_INPUT_LENGTH];
  Ship *ship;
  short price = 0;
  size_t turret_num = 0;

  strcpy( arg, argument );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter("&RYou need to specify a target!\r\n",ch);
      return;
    }

  if ( ( ship = GetShipInRoom( ch->InRoom , argument ) ) == NULL )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if (IsShipDisabled( ship ) )
    price += 200;

  if ( ship->WeaponSystems.State.Missile == MISSILE_DAMAGED )
    price += 100;

  if ( ship->WeaponSystems.State.Laser0 == LASER_DAMAGED )
    price += 50;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      const Turret *turret = ship->WeaponSystems.Turret[turret_num];

      if( IsTurretDamaged( turret ) )
	{
	  price += 50;
	}
    }

  if ( IsClanned( ch ) && !StrCmp(ch->PCData->ClanInfo.Clan->Name,ship->Owner) )
    {
      if ( ch->PCData->ClanInfo.Clan->Funds < price )
        {
          Echo(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n",
		    ch->PCData->ClanInfo.Clan->Name );
          return;
        }

      ch->PCData->ClanInfo.Clan->Funds -= price;
      Echo(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->PCData->ClanInfo.Clan->Name, price );
    }
  else if ( StrCmp( ship->Owner , "Public" ) )
    {
      if ( ch->Gold < price )
        {
          Echo(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
          return;
        }

      ch->Gold -= price;
      Echo(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
    }

  ship->Energy = ship->MaxEnergy;
  ship->Shield = 0;
  ship->AutoRecharge = false;
  ship->AutoTrack = false;
  ship->AutoSpeed = false;
  ship->Hull = ship->MaxHull;

  ship->WeaponSystems.State.Missile = MISSILE_READY;
  ship->WeaponSystems.State.Laser0 = LASER_READY;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->WeaponSystems.Turret[turret_num];
      SetTurretReady( turret );
    }

  ship->ShipState = SHIP_LANDED;
}
