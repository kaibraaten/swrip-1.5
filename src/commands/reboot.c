#include "ship.h"
#include "mud.h"
#include "character.h"
#include "skill.h"

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

  if ( auction->item )
    do_auction( ch, "stop");

  sprintf( buf, "Reboot by %s.", ch->name );
  do_echo( ch, buf );

  if ( !StrCmp(argument, "and sort skill table") )
    {
      SortSkillTable();
      SaveSkills();
    }

  /* Save all characters before booting. */
  if ( StrCmp(argument, "nosave") )
    for ( vch = first_char; vch; vch = vch->next )
      if ( !IsNpc( vch ) )
        SaveCharacter( vch );

  for ( ship = first_ship; ship; ship = ship->next )
    SaveShip( ship );

  mud_down = true;
}
