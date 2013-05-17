#include "ships.h"
#include "mud.h"

void do_setship( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  SHIP_DATA *ship = NULL;
  int tempnum = 0;
  ROOM_INDEX_DATA *roomindex = NULL;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: setship <ship> <field> <values>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "filename name personalname owner copilot pilot description home\r\n", ch );
      send_to_char( "cockpit entrance turret1 turret2 hanger\r\n", ch );
      send_to_char( "engineroom firstroom lastroom shipyard\r\n", ch );
      send_to_char( "manuever speed hyperspeed tractorbeam\r\n", ch );
      send_to_char( "lasers missiles shield hull energy chaff\r\n", ch );
      send_to_char( "comm sensor astroarray class torpedos\r\n", ch );
      send_to_char( "pilotseat coseat gunseat navseat rockets alarm\r\n", ch );
      send_to_char( "ions dockingports guard (0-1)\r\n", ch );
      return;
    }

  ship = get_ship( arg1 );

  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "owner" ) )
    {
      CLAN_DATA *clan = NULL;

      if ( ship->type != MOB_SHIP && (clan = get_clan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft--;
          else
            clan->vehicles--;
        }

      STRFREE( ship->owner );
      ship->owner = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );

      if ( ship->type != MOB_SHIP && (clan = get_clan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft++;
          else
            clan->vehicles++;
        }

      return;
    }

  if ( !str_cmp( arg2, "home" ) )
    {
      STRFREE( ship->home );
      ship->home = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "pilot" ) )
    {
      STRFREE( ship->pilot );
      ship->pilot = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "copilot" ) )
    {
      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "firstroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      ship->firstroom = tempnum;
      ship->lastroom = tempnum;
      ship->cockpit = tempnum;
      ship->coseat = tempnum;
      ship->pilotseat = tempnum;
      ship->gunseat = tempnum;
      ship->navseat = tempnum;
      ship->entrance = tempnum;
      ship->turret1 = 0;
      ship->turret2 = 0;
      ship->hanger = 0;
      send_to_char( "You will now need to set the other rooms in the ship.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "lastroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom )
        {
          send_to_char("The last room on a ship must be greater than or equal to the first room.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP && (tempnum - ship->firstroom) > 5 )
        {
          send_to_char("Starfighters may have up to 5 rooms only.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP && (tempnum - ship->firstroom) > 25 )
        {
          send_to_char("Midships may have up to 25 rooms only.\r\n",ch);
          return;
        }

      if ( ship->sclass == CAPITAL_SHIP && (tempnum - ship->firstroom) > 100 )
        {
          send_to_char("Capital Ships may have up to 100 rooms only.\r\n",ch);
          return;
        }

      ship->lastroom = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "cockpit" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->cockpit = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "pilotseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
	{
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->pilotseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "coseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->coseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "navseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->navseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "gunseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
	}

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->gunseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "entrance" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      ship->entrance = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret1" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
	  return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret2 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret1 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret2" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }
      ship->turret2 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret3" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
	}

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret3 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret4" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
	   tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret4 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }


  if ( !str_cmp( arg2, "turret5" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
	  send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret5 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret6" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret6 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret7" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret7 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret8" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret8 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret9" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }
      ship->turret9 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret0" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret0 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "hanger" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL && atoi(argument) != 0 )
	{
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if (( tempnum < ship->firstroom || tempnum > ship->lastroom ) && (atoi(argument) != 0 ))
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters are to small to have hangers for other ships!\r\n",ch);
          return;
        }

      ship->hanger = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "engineroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
	}

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->engineroom = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "shipyard" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.",ch);
          return;
        }

      ship->shipyard = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      if ( !str_cmp( argument, "rebel" ) )
        ship->type = SHIP_REBEL;
      else if ( !str_cmp( argument, "imperial" ) )
        ship->type = SHIP_IMPERIAL;
      else if ( !str_cmp( argument, "civilian" ) )
        ship->type = SHIP_CIVILIAN;
      else if ( !str_cmp( argument, "mob" ) )
        ship->type = MOB_SHIP;
      else
        {
	  send_to_char( "Ship type must be either: rebel, imperial, civilian or mob.\r\n", ch );
          return;
        }

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      STRFREE( ship->name );
      ship->name = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "personalname" ) )
    {
      if ( ship->personalname )
        STRFREE( ship->personalname );

      ship->personalname = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( ship->filename );
      ship->filename = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      write_ship_list( );
      return;
    }

  if ( !str_cmp( arg2, "desc" ) )
    {
      STRFREE( ship->description );
      ship->description = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "dockingports" ) )
    {
      ship->dockingports = URANGE( -1, atoi(argument) , 20 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "guard" ) )
    {
      ship->guard = URANGE( -1, atoi(argument) , 1 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "manuever" ) )
    {
      ship->manuever = URANGE( 0, atoi(argument) , 250 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "lasers" ) )
    {
      if ( ch->top_level == 105 )
        ship->lasers = URANGE( 0, atoi(argument) , 20 );
      else
        ship->lasers = URANGE( 0, atoi(argument) , 10 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "ions" ) )
    {
      if ( ch->top_level == 105 )
        ship->ions = URANGE( 0, atoi(argument) , 20 );
      else
        ship->ions = URANGE( 0, atoi(argument) , 10 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "class" ) )
    {
      ship->sclass = URANGE( 0, atoi(argument) , WALKER );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "missiles" ) )
    {
      ship->missiles = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "torpedos" ) )
    {
      ship->torpedos = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "rockets" ) )
    {
      ship->rockets = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "speed" ) )
    {
      if ( ch->top_level == 105 )
        ship->realspeed = URANGE( 0, atoi(argument) , 255 );
      else
        ship->realspeed = URANGE( 0, atoi(argument) , 150 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "tractorbeam" ) )
    {
      ship->tractorbeam = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "hyperspeed" ) )
    {
      ship->hyperspeed = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "shield" ) )
    {
      if ( ch->top_level == 105 )
        ship->maxshield = URANGE( 0, atoi(argument) , 30000 );
      else
        ship->maxshield = URANGE( 0, atoi(argument) , 1000 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "hull" ) )
    {
      if ( ch->top_level == 105 )
        {
          ship->hull = URANGE( 1, atoi(argument) , 30000 );
          ship->maxhull = URANGE( 1, atoi(argument) , 30000 );
        }
      else
        {
          ship->hull = URANGE( 1, atoi(argument) , 20000 );
          ship->maxhull = URANGE( 1, atoi(argument) , 20000 );
        }

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "energy" ) )
    {
      ship->energy = URANGE( 1, atoi(argument) , 30000 );
      ship->maxenergy = URANGE( 1, atoi(argument) , 30000 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "sensor" ) )
    {
      ship->sensor = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "astroarray" ) )
    {
      ship->astro_array = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "comm" ) )
    {
      ship->comm = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "chaff" ) )
    {
      if ( ch->top_level == 105 )
        {
          ship->chaff = URANGE( 0, atoi(argument) , 255 );
        }
      else
	{
          ship->chaff = URANGE( 0, atoi(argument) , 25 );
        }

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp(arg2,"alarm") )
    {
      ship->alarm = URANGE(0,atoi(argument),5);
      send_to_char("Done.\r\n",ch);
      save_ship(ship);
      return;
    }

  do_setship( ch, "" );
}
