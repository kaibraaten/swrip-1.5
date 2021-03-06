#include "turret.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "repos/shiprepository.hpp"

void do_copyship( std::shared_ptr<Character> ch, std::string argument )
{
  std::shared_ptr<Ship> ship;
  std::shared_ptr<Ship> old;
  std::string arg;

  argument = OneArgument( argument, arg );

  if ( argument.empty() )
    {
      ch->Echo( "Usage: copyship <oldshipname> <newshipname>\r\n" );
      return;
    }

  old = GetShipAnywhere( arg );

  if (!old)
    {
      ch->Echo( "That's not a ship!\r\n" );
      return;
    }

  ship = std::make_shared<Ship>();
  Ships->Add(ship);

  ship->Name = argument;
  ship->Type = old->Type;
  ship->Class = old->Class;
  ship->WeaponSystems.Laser.Count = old->WeaponSystems.Laser.Count;
  ship->Defenses.Shield.Max = old->Defenses.Shield.Max;
  ship->Defenses.Hull.Max = old->Defenses.Hull.Max;
  ship->Thrusters.Energy.Max = old->Thrusters.Energy.Max  ;
  ship->Hyperdrive.Speed = old->Hyperdrive.Speed  ;
  ship->Thrusters.Speed.Max = old->Thrusters.Speed.Max  ;
  ship->Thrusters.Maneuver = old->Thrusters.Maneuver  ;

  Ships->Save(ship);
}

