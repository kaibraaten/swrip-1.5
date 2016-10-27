#include "character.h"
#include "shuttle.h"
#include "ship.h"
#include "mud.h"

void do_board( Character *ch, char *argument )
{
  Room *toroom;
  Ship *ship;
  char * name = NULL;
  Shuttle *shuttle;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Board what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->Flags, ACT_MOUNTED ) && IsNpc(ch))
    {
      Act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ( ship = GetShipInRoom( ch->InRoom , argument ) ) != NULL )
    {

      if ( ( toroom = GetRoom( ship->Rooms.Entrance ) ) == NULL )
        {
          SendToCharacter("That ship has no entrance!\r\n", ch);
          return;
        }

      if ( !ship->HatchOpen )
        {
          SendToCharacter( "&RThe hatch is closed!\r\n", ch);
	  return;
        }

      if ( ship->State == SHIP_LAUNCH || ship->State == SHIP_LAUNCH_2 )
        {
          SendToCharacter("&rThat ship has already started launching!\r\n",ch);
          return;
        }

      name = ship->Name;

    }
  else if ( ( shuttle = GetShuttleInRoom( ch->InRoom , argument ) ) != NULL )
    {
      name = shuttle->Name;
      if ( ( toroom = GetRoom( shuttle->Rooms.Entrance ) ) == NULL )
        {
          SendToCharacter("That ship has no entrance!\r\n", ch);
          return;
        }
    }
  else
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }
  if ( toroom == NULL )
    {
      SendToCharacter ("Error", ch);
      return;
    }

  if ( toroom->Tunnel > 0 )
    {
      Character *ctmp;
      int count = 0;

      for ( ctmp = toroom->FirstPerson; ctmp; ctmp = ctmp->NextInRoom )
        {
          if ( ++count >= toroom->Tunnel )
            {
              SendToCharacter( "There is no room for you in there.\r\n", ch );
              return;
            }
        }
    }

  Act( AT_PLAIN, "$n enters $T.", ch, NULL, name , TO_ROOM );
  Act( AT_PLAIN, "You enter $T.", ch, NULL, name , TO_CHAR );
  CharacterFromRoom( ch );
  CharacterToRoom( ch , toroom );
  Act( AT_PLAIN, "$n enters the ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
