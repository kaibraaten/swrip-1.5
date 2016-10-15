#include "character.h"
#include "ship.h"
#include "mud.h"
#include "vector3_aux.h"
#include "missile.h"
#include "skill.h"
#include "spaceobject.h"

void do_radar( Character *ch, char *argument )
{
  Ship *target;
  int the_chance;
  Ship *ship;
  Missile *missile;
  Spaceobject *spaceobj;

  if ( ( ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit or turret of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_LANDED)
    {
      if (ship->docked == NULL)
	{
	  SendToCharacter("&RWait until after you launch!\r\n",ch);
	  return;
	}
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->spaceobject == NULL)
    {
      SendToCharacter("&RYou can't do that unless the ship is flying in realspace!\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->learned[gsn_navigation]) ;

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_navigation );
      return;
    }

  Act( AT_PLAIN, "$n checks the radar.", ch, NULL, argument , TO_ROOM );
  SetCharacterColor(  AT_RED, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->Next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj )
	   && spaceobj->Type == SPACE_SUN
	   && StrCmp(spaceobj->Name,"") )
        Echo(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->Name,
                  spaceobj->Position.x,
                  spaceobj->Position.y,
                  spaceobj->Position.z,
                  "",
                  (spaceobj->Position.x - ship->pos.x),
                  (spaceobj->Position.y - ship->pos.y),
                  (spaceobj->Position.z - ship->pos.z) );
    }

  SetCharacterColor(  AT_LBLUE, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->Next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj )
	   && spaceobj->Type == SPACE_PLANET
	   && StrCmp(spaceobj->Name,"") )
	Echo(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->Name,
                  spaceobj->Position.x,
                  spaceobj->Position.y,
                  spaceobj->Position.z,
                  "",
                  (spaceobj->Position.x - ship->pos.x),
                  (spaceobj->Position.y - ship->pos.y),
                  (spaceobj->Position.z - ship->pos.z));
    }

  Echo(ch,"\r\n");
  SetCharacterColor(  AT_WHITE, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->Next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj )
	   && spaceobj->Type > SPACE_PLANET && StrCmp(spaceobj->Name,"") )
        Echo(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
	     spaceobj->Name,
	     spaceobj->Position.x,
	     spaceobj->Position.y,
	     spaceobj->Position.z, "",
	     (spaceobj->Position.x - ship->pos.x),
	     (spaceobj->Position.y - ship->pos.y),
	     (spaceobj->Position.z - ship->pos.z) );
    }

  Echo(ch,"\r\n");

  for ( target = first_ship; target; target = target->Next )
    {
      if ( target != ship && target->spaceobject )
        {
          if( GetShipDistanceToShip( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass) +1))
            Echo(ch, "%s    %.0f %.0f %.0f\r\n",
                      target->Name,
                      (target->pos.x - ship->pos.x),
                      (target->pos.y - ship->pos.y),
                      (target->pos.z - ship->pos.z));
          else if ( GetShipDistanceToShip( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3))
            {
              if ( target->sclass == FIGHTER_SHIP )
                Echo(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
	      else if ( target->sclass == MIDSIZE_SHIP )
                Echo(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass == SHIP_DEBRIS )
                Echo(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass >= CAPITAL_SHIP )
                Echo(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
            }
        }

    }
  Echo(ch,"\r\n");

  for ( missile = FirstMissile; missile; missile = missile->Next )
    {
      if( GetMissileDistanceToShip( missile, ship ) < 50*(ship->sensor+10)*2)
        {
          Echo(ch, "%s    %.0f %.0f %.0f\r\n",
                    missile->missiletype == CONCUSSION_MISSILE ? "A Concusion missile" :
                    ( missile->missiletype ==  PROTON_TORPEDO ? "A Torpedo" :
                      ( missile->missiletype ==  HEAVY_ROCKET ? "A Heavy Rocket" : "A Heavy Bomb" ) ),
                    (missile->pos.x - ship->pos.x),
                    (missile->pos.y - ship->pos.y),
                    (missile->pos.z - ship->pos.z));
        }
    }

  Echo(ch, "\r\n&WYour Coordinates: %.0f %.0f %.0f\r\n" ,
            ship->pos.x , ship->pos.y, ship->pos.z);

  LearnFromSuccess( ch, gsn_navigation );
}
