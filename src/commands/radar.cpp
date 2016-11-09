#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "missile.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"

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

  if ( ship->Class > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (ship->State == SHIP_LANDED)
    {
      if (ship->Docked == NULL)
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

  if (ship->Spaceobject == NULL)
    {
      SendToCharacter("&RYou can't do that unless the ship is flying in realspace!\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_navigation]) ;

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_navigation );
      return;
    }

  Act( AT_PLAIN, "$n checks the radar.", ch, NULL, argument , TO_ROOM );
  SetCharacterColor(  AT_RED, ch );

  for ( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
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
                  (spaceobj->Position.x - ship->Position.x),
                  (spaceobj->Position.y - ship->Position.y),
                  (spaceobj->Position.z - ship->Position.z) );
    }

  SetCharacterColor(  AT_LBLUE, ch );

  for ( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
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
                  (spaceobj->Position.x - ship->Position.x),
                  (spaceobj->Position.y - ship->Position.y),
                  (spaceobj->Position.z - ship->Position.z));
    }

  Echo(ch,"\r\n");
  SetCharacterColor(  AT_WHITE, ch );

  for ( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj )
	   && spaceobj->Type > SPACE_PLANET && StrCmp(spaceobj->Name,"") )
        Echo(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
	     spaceobj->Name,
	     spaceobj->Position.x,
	     spaceobj->Position.y,
	     spaceobj->Position.z, "",
	     (spaceobj->Position.x - ship->Position.x),
	     (spaceobj->Position.y - ship->Position.y),
	     (spaceobj->Position.z - ship->Position.z) );
    }

  Echo(ch,"\r\n");

  for ( target = FirstShip; target; target = target->Next )
    {
      if ( target != ship && target->Spaceobject )
        {
          if( GetShipDistanceToShip( ship, target ) < 100*(ship->Instruments.Sensor + 10)*((target->Class == SHIP_DEBRIS ? 2 : target->Class) +1))
            Echo(ch, "%s    %.0f %.0f %.0f\r\n",
                      target->Name,
                      (target->Position.x - ship->Position.x),
                      (target->Position.y - ship->Position.y),
                      (target->Position.z - ship->Position.z));
          else if ( GetShipDistanceToShip( ship, target ) < 100*(ship->Instruments.Sensor + 10)*((target->Class == SHIP_DEBRIS ? 2 : target->Class)+3))
            {
              if ( target->Class == FIGHTER_SHIP )
                Echo(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
                          (target->Position.x - ship->Position.x),
                          (target->Position.y - ship->Position.y),
                          (target->Position.z - ship->Position.z));
	      else if ( target->Class == MIDSIZE_SHIP )
                Echo(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                          (target->Position.x - ship->Position.x),
                          (target->Position.y - ship->Position.y),
                          (target->Position.z - ship->Position.z));
              else if ( target->Class == SHIP_DEBRIS )
                Echo(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
                          (target->Position.x - ship->Position.x),
                          (target->Position.y - ship->Position.y),
                          (target->Position.z - ship->Position.z));
              else if ( target->Class >= CAPITAL_SHIP )
                Echo(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
                          (target->Position.x - ship->Position.x),
                          (target->Position.y - ship->Position.y),
                          (target->Position.z - ship->Position.z));
            }
        }

    }
  Echo(ch,"\r\n");

  for ( missile = FirstMissile; missile; missile = missile->Next )
    {
      if( GetMissileDistanceToShip( missile, ship ) < 50*(ship->Instruments.Sensor+10)*2)
        {
          Echo(ch, "%s    %.0f %.0f %.0f\r\n",
                    missile->Type == CONCUSSION_MISSILE ? "A Concusion missile" :
                    ( missile->Type ==  PROTON_TORPEDO ? "A Torpedo" :
                      ( missile->Type ==  HEAVY_ROCKET ? "A Heavy Rocket" : "A Heavy Bomb" ) ),
                    (missile->Position.x - ship->Position.x),
                    (missile->Position.y - ship->Position.y),
                    (missile->Position.z - ship->Position.z));
        }
    }

  Echo(ch, "\r\n&WYour Coordinates: %.0f %.0f %.0f\r\n" ,
            ship->Position.x , ship->Position.y, ship->Position.z);

  LearnFromSuccess( ch, gsn_navigation );
}
