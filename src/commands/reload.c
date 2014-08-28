#include <string.h>
#include "mud.h"
#include "ship.h"
#include "character.h"
#include "turret.h"

void do_reload( Character *ch, char *argument )
{
  /* Reload code added by Darrik Vequir */
  char arg[MAX_INPUT_LENGTH];
  Ship *ship;
  short price = 0;
  size_t turret_num = 0;

  strcpy( arg, argument );

  if (arg[0] == '\0')
    {
      SendToCharacter("&RYou need to specify a target!\r\n",ch);
      return;
    }

  if ( ( ship = GetShipInRoom( ch->in_room , argument ) ) == NULL )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if (IsShipDisabled( ship ) )
    price += 200;

  if ( ship->missilestate == MISSILE_DAMAGED )
    price += 100;

  if ( ship->statet0 == LASER_DAMAGED )
    price += 50;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      const Turret *turret = ship->turret[turret_num];

      if( IsTurretDamaged( turret ) )
	{
	  price += 50;
	}
    }

  if ( IsClanned( ch ) && !StrCmp(ch->pcdata->ClanInfo.Clan->name,ship->owner) )
    {
      if ( ch->pcdata->ClanInfo.Clan->funds < price )
        {
          Echo(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n",
		    ch->pcdata->ClanInfo.Clan->name );
          return;
        }

      ch->pcdata->ClanInfo.Clan->funds -= price;
      Echo(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->pcdata->ClanInfo.Clan->name, price );
    }
  else if ( StrCmp( ship->owner , "Public" ) )
    {
      if ( ch->gold < price )
        {
          Echo(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
          return;
        }

      ch->gold -= price;
      Echo(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
    }

  ship->energy = ship->maxenergy;
  ship->shield = 0;
  ship->autorecharge = false;
  ship->autotrack = false;
  ship->autospeed = false;
  ship->hull = ship->maxhull;

  ship->missilestate = MISSILE_READY;
  ship->statet0 = LASER_READY;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->turret[turret_num];
      SetTurretReady( turret );
    }

  ship->shipstate = SHIP_LANDED;
}
