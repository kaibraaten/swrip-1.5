#include "character.h"
#include "ships.h"
#include "mud.h"
#include "turret.h"

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
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
    {
      SendToCharacter( "Usage: setship <ship> <field> <values>\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "filename name personalname owner copilot pilot description home\r\n", ch );
      SendToCharacter( "cockpit entrance turret1 turret2 hanger\r\n", ch );
      SendToCharacter( "engineroom firstroom lastroom shipyard\r\n", ch );
      SendToCharacter( "manuever speed hyperspeed tractorbeam\r\n", ch );
      SendToCharacter( "lasers missiles shield hull energy chaff\r\n", ch );
      SendToCharacter( "comm sensor astroarray class torpedos\r\n", ch );
      SendToCharacter( "pilotseat coseat gunseat navseat rockets alarm\r\n", ch );
      SendToCharacter( "ions dockingports guard (0-1)\r\n", ch );
      return;
    }

  ship = GetShipAnywhere( arg1 );

  if ( !ship )
    {
      SendToCharacter( "No such ship.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "owner" ) )
    {
      Clan *clan = NULL;

      if ( ship->type != MOB_SHIP && (clan = GetClan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft--;
          else
            clan->vehicles--;
        }

      FreeMemory( ship->owner );
      ship->owner = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );

      if ( ship->type != MOB_SHIP && (clan = GetClan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft++;
          else
            clan->vehicles++;
        }

      return;
    }

  if ( !StrCmp( arg2, "home" ) )
    {
      FreeMemory( ship->home );
      ship->home = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "pilot" ) )
    {
      FreeMemory( ship->pilot );
      ship->pilot = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "copilot" ) )
    {
      FreeMemory( ship->copilot );
      ship->copilot = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "firstroom" ) )
    {
      int turret_num = 0;

      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      ship->room.first = tempnum;
      ship->room.last = tempnum;
      ship->room.cockpit = tempnum;
      ship->room.coseat = tempnum;
      ship->room.pilotseat = tempnum;
      ship->room.gunseat = tempnum;
      ship->room.navseat = tempnum;
      ship->room.entrance = tempnum;

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->turret[turret_num];
	  SetTurretRoom( turret, 0 );
	}

      ship->room.hanger = 0;
      SendToCharacter( "You will now need to set the other rooms in the ship.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "lastroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first )
        {
          SendToCharacter("The last room on a ship must be greater than or equal to the first room.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP && (tempnum - ship->room.first) > 5 )
        {
          SendToCharacter("Starfighters may have up to 5 rooms only.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP && (tempnum - ship->room.first) > 25 )
        {
          SendToCharacter("Midships may have up to 25 rooms only.\r\n",ch);
          return;
        }

      if ( ship->sclass == CAPITAL_SHIP && (tempnum - ship->room.first) > 100 )
        {
          SendToCharacter("Capital Ships may have up to 100 rooms only.\r\n",ch);
          return;
        }

      ship->room.last = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "cockpit" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.cockpit = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "pilotseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
	{
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.pilotseat = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "coseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.coseat = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "navseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.navseat = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "gunseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
	}

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.gunseat = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "entrance" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.entrance = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret1" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
	  return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[0], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret2" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[1], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret3" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
	}

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[2], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret4" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[3], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }


  if ( !StrCmp( arg2, "turret5" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
	  SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[4], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret6" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[5], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret7" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[6], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret8" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[7], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret9" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[8], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "turret0" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          SendToCharacter("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      SetTurretRoom( ship->turret[9], tempnum );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "hanger" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL && atoi(argument) != 0 )
	{
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if (( tempnum < ship->room.first || tempnum > ship->room.last ) && (atoi(argument) != 0 ))
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          SendToCharacter("Starfighters are to small to have hangers for other ships!\r\n",ch);
          return;
        }

      ship->room.hanger = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "engineroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->room.first || tempnum > ship->room.last )
        {
          SendToCharacter("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
	}

      if ( room_is_in_use( ship, tempnum ) )
        {
          SendToCharacter("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->room.engine = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "shipyard" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          SendToCharacter("That room doesn't exist.",ch);
          return;
        }

      ship->shipyard = tempnum;
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      if ( !StrCmp( argument, "rebel" ) )
        ship->type = SHIP_REBEL;
      else if ( !StrCmp( argument, "imperial" ) )
        ship->type = SHIP_IMPERIAL;
      else if ( !StrCmp( argument, "civilian" ) )
        ship->type = SHIP_CIVILIAN;
      else if ( !StrCmp( argument, "mob" ) )
        ship->type = MOB_SHIP;
      else
        {
	  SendToCharacter( "Ship type must be either: rebel, imperial, civilian or mob.\r\n", ch );
          return;
        }

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( ship->name );
      ship->name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "personalname" ) )
    {
      if ( ship->personalname )
        FreeMemory( ship->personalname );

      ship->personalname = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( ship->filename );
      ship->filename = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      WriteShipList( );
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      FreeMemory( ship->description );
      ship->description = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "dockingports" ) )
    {
      ship->dockingports = urange( -1, atoi(argument) , 20 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "guard" ) )
    {
      ship->guard = urange( -1, atoi(argument) , 1 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "manuever" ) )
    {
      ship->manuever = urange( 0, atoi(argument) , 250 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "lasers" ) )
    {
      if ( ch->top_level == 105 )
        ship->lasers = urange( 0, atoi(argument) , 20 );
      else
        ship->lasers = urange( 0, atoi(argument) , 10 );

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "ions" ) )
    {
      if ( ch->top_level == 105 )
        ship->ions = urange( 0, atoi(argument) , 20 );
      else
        ship->ions = urange( 0, atoi(argument) , 10 );

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "class" ) )
    {
      ship->sclass = urange( 0, atoi(argument) , WALKER );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "missiles" ) )
    {
      ship->missiles = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "torpedos" ) )
    {
      ship->torpedos = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "rockets" ) )
    {
      ship->rockets = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "speed" ) )
    {
      if ( ch->top_level == 105 )
        ship->realspeed = urange( 0, atoi(argument) , 255 );
      else
        ship->realspeed = urange( 0, atoi(argument) , 150 );

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "tractorbeam" ) )
    {
      ship->tractorbeam = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "hyperspeed" ) )
    {
      ship->hyperspeed = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "shield" ) )
    {
      if ( ch->top_level == 105 )
        ship->maxshield = urange( 0, atoi(argument) , 30000 );
      else
        ship->maxshield = urange( 0, atoi(argument) , 1000 );

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "hull" ) )
    {
      if ( ch->top_level == 105 )
        {
          ship->hull = urange( 1, atoi(argument) , 30000 );
          ship->maxhull = urange( 1, atoi(argument) , 30000 );
        }
      else
        {
          ship->hull = urange( 1, atoi(argument) , 20000 );
          ship->maxhull = urange( 1, atoi(argument) , 20000 );
        }

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "energy" ) )
    {
      ship->energy = urange( 1, atoi(argument) , 30000 );
      ship->maxenergy = urange( 1, atoi(argument) , 30000 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "sensor" ) )
    {
      ship->sensor = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "astroarray" ) )
    {
      ship->astro_array = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "comm" ) )
    {
      ship->comm = urange( 0, atoi(argument) , 255 );
      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( arg2, "chaff" ) )
    {
      if ( ch->top_level == 105 )
        {
          ship->chaff = urange( 0, atoi(argument) , 255 );
        }
      else
	{
          ship->chaff = urange( 0, atoi(argument) , 25 );
        }

      SendToCharacter( "Done.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp(arg2,"alarm") )
    {
      ship->alarm = urange(0,atoi(argument),5);
      SendToCharacter("Done.\r\n",ch);
      SaveShip(ship);
      return;
    }

  do_setship( ch, "" );
}

static bool room_is_in_use( const Ship *ship, int room_vnum )
{
  if( room_vnum == ship->room.hanger
      || room_vnum == ship->room.entrance
      || room_vnum == ship->room.engine
      || room_vnum == ship->room.navseat
      || room_vnum == ship->room.pilotseat
      || room_vnum == ship->room.coseat
      || room_vnum == ship->room.gunseat )
    {
      return true;
    }
  else
    {
      int turret_num = 0;

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  const Turret *turret = ship->turret[turret_num];

	  if( GetTurretRoom( turret ) == room_vnum )
	    {
	      return true;
	    }
	}
    }

  return false;
}
