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
           &&   victim->InRoom
           &&   NiftyIsName( arg, victim->Name ) )
        {
          found = true;
          PagerPrintf( ch, "[%5d] %-28s [%5d] %s\r\n",
                        victim->Prototype->Vnum,
                        victim->ShortDescr,
                        victim->InRoom->Vnum,
                        victim->InRoom->Name );
        }
    }

  if ( !found )
    Act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
}
