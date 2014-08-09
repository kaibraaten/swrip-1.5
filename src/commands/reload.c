#include <string.h>
#include "mud.h"
#include "ships.h"
#include "character.h"
#include "turret.h"

void do_reload( Character *ch, char *argument )
{
  /* Reload code added by Darrik Vequir */
  char arg[MAX_INPUT_LENGTH];
  SHIP_DATA *ship;
  short price = 0;
  size_t turret_num = 0;

  strcpy( arg, argument );

  if (arg[0] == '\0')
    {
      send_to_char("&RYou need to specify a target!\r\n",ch);
      return;
    }

  if ( ( ship = ship_in_room( ch->in_room , argument ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if (ship_is_disabled( ship ) )
    price += 200;

  if ( ship->missilestate == MISSILE_DAMAGED )
    price += 100;

  if ( ship->statet0 == LASER_DAMAGED )
    price += 50;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      const TURRET_DATA *turret = ship->turret[turret_num];

      if( is_turret_damaged( turret ) )
	{
	  price += 50;
	}
    }

  if ( ch->pcdata && ch->pcdata->clan && !str_cmp(ch->pcdata->clan->name,ship->owner) )
    {
      if ( ch->pcdata->clan->funds < price )
        {
          ch_printf(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n",
		    ch->pcdata->clan->name );
          return;
        }

      ch->pcdata->clan->funds -= price;
      ch_printf(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->pcdata->clan->name, price );
    }
  else if ( str_cmp( ship->owner , "Public" ) )
    {
      if ( ch->gold < price )
        {
          ch_printf(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
          return;
        }

      ch->gold -= price;
      ch_printf(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
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
      TURRET_DATA *turret = ship->turret[turret_num];
      set_turret_ready( turret );
    }

  ship->shipstate = SHIP_LANDED;
}
