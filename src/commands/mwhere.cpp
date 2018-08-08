#include "character.hpp"
#include "mud.hpp"

void do_mwhere( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  bool found = false;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Mwhere whom?\r\n");
      return;
    }

  SetCharacterColor( AT_PLAIN, ch );

  for ( victim = FirstCharacter; victim; victim = victim->Next )
    {
      if ( IsNpc(victim)
           &&   victim->InRoom
           &&   NiftyIsName( arg, victim->Name ) )
        {
          found = true;
          ch->Echo("[%5d] %-28s [%5d] %s\r\n",
                        victim->Prototype->Vnum,
                        victim->ShortDescr,
                        victim->InRoom->Vnum,
                        victim->InRoom->Name );
        }
    }

  if ( !found )
    Act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
}

