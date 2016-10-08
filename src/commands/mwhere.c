#include "character.h"
#include "mud.h"

void do_mwhere( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  bool found = false;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Mwhere whom?\r\n", ch );
      return;
    }

  SetPagerColor( AT_PLAIN, ch );

  for ( victim = first_char; victim; victim = victim->next )
    {
      if ( IsNpc(victim)
           &&   victim->in_room
           &&   NiftyIsName( arg, victim->name ) )
        {
          found = true;
          PagerPrintf( ch, "[%5d] %-28s [%5d] %s\r\n",
                        victim->Prototype->vnum,
                        victim->short_descr,
                        victim->in_room->vnum,
                        victim->in_room->name );
        }
    }

  if ( !found )
    Act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
}
