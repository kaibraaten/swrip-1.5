#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "turret.hpp"
#include "clan.hpp"

static bool room_is_in_use( const Ship *ship, int room_vnum );

void do_setship( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Ship *ship = NULL;
  int tempnum = 0;
  Room *roomindex = NULL;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Usage: setship <ship> <field> <values>\r\n");
      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo("name personalname owner copilot pilot description home\r\n");
      ch->Echo("cockpit entrance turret1 turret2 hangar\r\n");
      ch->Echo("engineroom firstroom lastroom shipyard\r\n");
      ch->Echo("manuever speed hyperspeed tractorbeam\r\n");
      ch->Echo("lasers missiles shield hull energy chaff\r\n");
      ch->Echo("comm sensor astroarray class torpedos\r\n");
      ch->Echo("pilotseat coseat gunseat navseat rockets alarm\r\n");
      ch->Echo("ions dockingports guard (0-1)\r\n");
      return;
    }

  ship = GetShipAnywhere( arg1 );

  if ( !ship )
    {
      ch->Echo("No such ship.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "owner" ) )
    {
      Clan *clan = NULL;

      if ( ship->Type != MOB_SHIP && (clan = GetClan( ship->Owner )) != NULL )
        {
          if ( ship->Class <= SHIP_PLATFORM )
            clan->Spacecraft--;
          else
            clan->Vehicles--;

          Clans->Save(clan);
        }

      FreeMemory( ship->Owner );
      ship->Owner = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);

      if ( ship->Type != MOB_SHIP && (clan = GetClan( ship->Owner )) != NULL )
        {
          if ( ship->Class <= SHIP_PLATFORM )
            clan->Spacecraft++;
          else
            clan->Vehicles++;

          Clans->Save(clan);
        }

      return;
    }

  if ( !StrCmp( arg2, "home" ) )
    {
      FreeMemory( ship->Home );
      ship->Home = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "pilot" ) )
    {
      FreeMemory( ship->Pilot );
      ship->Pilot = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "copilot" ) )
    {
      FreeMemory( ship->CoPilot );
      ship->CoPilot = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "firstroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      ship->Rooms.First = tempnum;
      ship->Rooms.Last = tempnum;
      ship->Rooms.Cockpit = tempnum;
      ship->Rooms.Coseat = tempnum;
      ship->Rooms.Pilotseat = tempnum;
      ship->Rooms.Gunseat = tempnum;
      ship->Rooms.Navseat = tempnum;
      ship->Rooms.Entrance = tempnum;

      for(Turret *turret : ship->WeaponSystems.Turrets)
	{
	  SetTurretRoom( turret, INVALID_VNUM );
	}

      ship->Rooms.Hangar = INVALID_VNUM;
      ch->Echo("You will now need to set the other rooms in the ship.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "lastroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First )
        {
          ch->Echo("The last room on a ship must be greater than or equal to the first room.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP && (tempnum - ship->Rooms.First) > 5 )
        {
          ch->Echo("Starfighters may have up to 5 rooms only.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP && (tempnum - ship->Rooms.First) > 25 )
        {
          ch->Echo("Midships may have up to 25 rooms only.\r\n");
          return;
        }

      if ( ship->Class == CAPITAL_SHIP && (tempnum - ship->Rooms.First) > 100 )
        {
          ch->Echo("Capital Ships may have up to 100 rooms only.\r\n");
          return;
        }

      ship->Rooms.Last = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "cockpit" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      ship->Rooms.Cockpit = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "pilotseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
	{
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      ship->Rooms.Pilotseat = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "coseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship.\r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship.\r\n");
          return;
        }

      ship->Rooms.Coseat = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "navseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      ship->Rooms.Navseat = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "gunseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
	}

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      ship->Rooms.Gunseat = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "entrance" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      ship->Rooms.Entrance = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret1" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
	  return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[0], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret2" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[1], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret3" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
	}

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[2], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret4" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[3], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }


  if ( !StrCmp( arg2, "turret5" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
   ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[4], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret6" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[5], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret7" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[6], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret8" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[7], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret9" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[8], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "turret0" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters can't have extra laser turrets.\r\n");
          return;
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          ch->Echo("Midships can't have more than 2 laser turrets.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      SetTurretRoom( ship->WeaponSystems.Turrets[9], tempnum );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "hangar" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL && atoi(argument) != 0 )
	{
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if (( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last ) && (atoi(argument) != 0 ))
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      if ( ship->Class == FIGHTER_SHIP )
        {
          ch->Echo("Starfighters are to small to have hangars for other ships!\r\n");
          return;
        }

      ship->Rooms.Hangar = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "engineroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.\r\n");
          return;
        }

      if ( tempnum < ship->Rooms.First || tempnum > ship->Rooms.Last )
        {
          ch->Echo("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n");
          return;
	}

      if ( room_is_in_use( ship, tempnum ) )
        {
          ch->Echo("That room is already being used by another part of the ship\r\n");
          return;
        }

      ship->Rooms.Engine = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "shipyard" ) )
    {
      tempnum = atoi(argument);
      roomindex = GetRoom(tempnum);

      if (roomindex == NULL)
        {
          ch->Echo("That room doesn't exist.");
          return;
        }

      ship->Shipyard = tempnum;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      if ( !StrCmp( argument, "rebel" ) )
        ship->Type = SHIP_REBEL;
      else if ( !StrCmp( argument, "imperial" ) )
        ship->Type = SHIP_IMPERIAL;
      else if ( !StrCmp( argument, "civilian" ) )
        ship->Type = SHIP_CIVILIAN;
      else if ( !StrCmp( argument, "mob" ) )
        ship->Type = MOB_SHIP;
      else
        {
   ch->Echo("Ship type must be either: rebel, imperial, civilian or mob.\r\n");
          return;
        }

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if( !ShipNameAndPersonalnameComboIsUnique( argument, ship->PersonalName ) )
	{
   ch->Echo("&RThere's already another ship with that combination of name and personalname.&d\r\n" );
	  return;
	}

      unlink( GetShipFilename( ship ) );
      
      FreeMemory( ship->Name );
      ship->Name = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "personalname" ) )
    {
       if( !ShipNameAndPersonalnameComboIsUnique( ship->Name, argument ) )
	 {
    ch->Echo("&RThere's already another ship with that combination of name and personalname.&d\r\n" );
	   return;
	 }
       
      unlink( GetShipFilename( ship ) );
      
      if ( ship->PersonalName )
        FreeMemory( ship->PersonalName );

      ship->PersonalName = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      FreeMemory( ship->Description );
      ship->Description = CopyString( argument );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "dockingports" ) )
    {
      ship->DockingPorts = urange( -1, atoi(argument) , 20 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "guard" ) )
    {
      ship->Guard = urange( -1, atoi(argument) , 1 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "manuever" ) )
    {
      ship->Thrusters.Maneuver = urange( 0, atoi(argument) , 250 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "lasers" ) )
    {
      if ( ch->TopLevel == LEVEL_IMPLEMENTOR )
        ship->WeaponSystems.Laser.Count = urange( 0, atoi(argument) , 20 );
      else
        ship->WeaponSystems.Laser.Count = urange( 0, atoi(argument) , 10 );

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "ions" ) )
    {
      if ( ch->TopLevel == LEVEL_IMPLEMENTOR )
        ship->WeaponSystems.IonCannon.Count = urange( 0, atoi(argument) , 20 );
      else
        ship->WeaponSystems.IonCannon.Count = urange( 0, atoi(argument) , 10 );

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "class" ) )
    {
      ship->Class = (ShipClass)urange( 0, atoi(argument) , WALKER );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "missiles" ) )
    {
      ship->WeaponSystems.Tube.Missiles.Current = ship->WeaponSystems.Tube.Missiles.Max = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "torpedos" ) )
    {
      ship->WeaponSystems.Tube.Torpedoes.Current = ship->WeaponSystems.Tube.Torpedoes.Max = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "rockets" ) )
    {
      ship->WeaponSystems.Tube.Rockets.Current = ship->WeaponSystems.Tube.Rockets.Max = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "speed" ) )
    {
      if ( ch->TopLevel == LEVEL_IMPLEMENTOR )
        ship->Thrusters.Speed.Max = urange( 0, atoi(argument) , 255 );
      else
        ship->Thrusters.Speed.Max = urange( 0, atoi(argument) , 150 );

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "tractorbeam" ) )
    {
      ship->WeaponSystems.TractorBeam.Strength = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "hyperspeed" ) )
    {
      ship->Hyperdrive.Speed = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "shield" ) )
    {
      if ( ch->TopLevel == LEVEL_IMPLEMENTOR )
        ship->Defenses.Shield.Max = urange( 0, atoi(argument) , SHRT_MAX );
      else
        ship->Defenses.Shield.Max = urange( 0, atoi(argument) , 1000 );

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "hull" ) )
    {
      if ( ch->TopLevel == LEVEL_IMPLEMENTOR )
        {
          ship->Defenses.Hull.Current = ship->Defenses.Hull.Max = urange( 1, atoi(argument) , SHRT_MAX );
        }
      else
        {
          ship->Defenses.Hull.Current = ship->Defenses.Hull.Max = urange( 1, atoi(argument) , 20000 );
        }

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "energy" ) )
    {
      ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max = urange( 1, atoi(argument), SHRT_MAX );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "sensor" ) )
    {
      ship->Instruments.Sensor = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "astroarray" ) )
    {
      ship->Instruments.AstroArray = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "comm" ) )
    {
      ship->Instruments.Comm = urange( 0, atoi(argument) , 255 );
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( arg2, "chaff" ) )
    {
      if ( ch->TopLevel == LEVEL_IMPLEMENTOR )
        {
          ship->Defenses.Chaff.Current = ship->Defenses.Chaff.Max = urange( 0, atoi(argument) , 255 );
        }
      else
	{
          ship->Defenses.Chaff.Current = ship->Defenses.Chaff.Max = urange( 0, atoi(argument) , 25 );
        }

      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp(arg2,"alarm") )
    {
      ship->Alarm = !ship->Alarm;
      ch->Echo("Done.\r\n");
      Ships->Save(ship);
      return;
    }

  do_setship( ch, "" );
}

static bool room_is_in_use( const Ship *ship, int room_vnum )
{
  if( room_vnum == ship->Rooms.Hangar
      || room_vnum == ship->Rooms.Entrance
      || room_vnum == ship->Rooms.Engine
      || room_vnum == ship->Rooms.Navseat
      || room_vnum == ship->Rooms.Pilotseat
      || room_vnum == ship->Rooms.Coseat
      || room_vnum == ship->Rooms.Gunseat )
    {
      return true;
    }
  else
    {
      for(const Turret *turret : ship->WeaponSystems.Turrets)
	{
	  if( GetTurretRoom( turret ) == room_vnum )
	    {
	      return true;
	    }
	}
    }

  return false;
}

