#include "character.h"
#include "ships.h"
#include "mud.h"
#include "vector3_aux.h"

void do_radar( Character *ch, char *argument )
{
  Ship *target;
  int the_chance;
  Ship *ship;
  Missile *missile;
  Spaceobject *spaceobj;
  if (   (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
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
      if (ship->docked == NULL) {
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

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_navigation]) ;
  if ( GetRandomPercent( ) > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }


  act( AT_PLAIN, "$n checks the radar.", ch,
       NULL, argument , TO_ROOM );

  SetCharacterColor(  AT_RED, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj )
	   && spaceobj->type == SPACE_SUN
	   && StrCmp(spaceobj->name,"") )
        ChPrintf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z,
                  "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z) );
    }

  SetCharacterColor(  AT_LBLUE, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj )
	   && spaceobj->type == SPACE_PLANET
	   && StrCmp(spaceobj->name,"") )
	ChPrintf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z,
                  "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z));
    }

  ChPrintf(ch,"\r\n");
  SetCharacterColor(  AT_WHITE, ch );
  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( IsSpaceobjectInRange( ship, spaceobj ) && spaceobj->type > SPACE_PLANET && StrCmp(spaceobj->name,"") )
        ChPrintf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z, "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z) );
    }
  ChPrintf(ch,"\r\n");

  for ( target = first_ship; target; target = target->next )
    {
      if ( target != ship && target->spaceobject )
        {
          if( GetShipDistanceToShip( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass) +1))
            ChPrintf(ch, "%s    %.0f %.0f %.0f\r\n",
                      target->name,
                      (target->pos.x - ship->pos.x),
                      (target->pos.y - ship->pos.y),
                      (target->pos.z - ship->pos.z));
          else if ( GetShipDistanceToShip( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3))
            {
              if ( target->sclass == FIGHTER_SHIP )
                ChPrintf(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
	      else if ( target->sclass == MIDSIZE_SHIP )
                ChPrintf(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass == SHIP_DEBRIS )
                ChPrintf(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass >= CAPITAL_SHIP )
                ChPrintf(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
            }
        }

    }
  ChPrintf(ch,"\r\n");
  for ( missile = first_missile; missile; missile = missile->next )
    {

      if( GetMissileDistanceToShip( missile, ship ) < 50*(ship->sensor+10)*2)
        {
          ChPrintf(ch, "%s    %.0f %.0f %.0f\r\n",
                    missile->missiletype == CONCUSSION_MISSILE ? "A Concusion missile" :
                    ( missile->missiletype ==  PROTON_TORPEDO ? "A Torpedo" :
                      ( missile->missiletype ==  HEAVY_ROCKET ? "A Heavy Rocket" : "A Heavy Bomb" ) ),
                    (missile->pos.x - ship->pos.x),
                    (missile->pos.y - ship->pos.y),
                    (missile->pos.z - ship->pos.z));
        }
    }

  ChPrintf(ch, "\r\n&WYour Coordinates: %.0f %.0f %.0f\r\n" ,
            ship->pos.x , ship->pos.y, ship->pos.z);

  learn_from_success( ch, gsn_navigation );
}
