#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_reboot( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch;
  Ship *ship;

  if ( StrCmp( argument, "mud now" )
       &&   StrCmp( argument, "nosave" )
       &&   StrCmp( argument, "and sort skill table" ) )
    {
      SendToCharacter( "Syntax: 'reboot mud now' or 'reboot nosave'\r\n", ch );
      return;
    }

  if ( auction->Item )
    do_auction( ch, "stop");

  sprintf( buf, "Reboot by %s.", ch->Name );
  do_echo( ch, buf );

  if ( !StrCmp(argument, "and sort skill table") )
    {
      SortSkillTable();
      SaveSkills();
    }

  /* Save all characters before booting. */
  if ( StrCmp(argument, "nosave") )
    for ( vch = FirstCharacter; vch; vch = vch->Next )
      if ( !IsNpc( vch ) )
        SaveCharacter( vch );

  for ( ship = FirstShip; ship; ship = ship->Next )
    SaveShip( ship );

  mud_down = true;
}
