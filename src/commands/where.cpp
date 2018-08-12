#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"

void do_where( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;
  Descriptor *d = nullptr;
  bool found = false;

  if (GetTrustLevel(ch) < LEVEL_IMMORTAL)
    {
      ch->Echo("If only life were really that simple...\r\n" );
      return;
    }

  OneArgument( argument, arg );

  SetCharacterColor( AT_PERSON, ch );

  if ( IsNullOrEmpty( arg ) )
    {
      if (GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        ch->Echo("Players logged in:\r\n");
      else
        ch->Echo("Players near you in %s:\r\n", ch->InRoom->Area->Name );

      found = false;

      for ( d = FirstDescriptor; d; d = d->Next )
        if ( (d->ConnectionState == CON_PLAYING || d->ConnectionState == CON_EDITING )
             && ( victim = d->Character ) != NULL
             && !IsNpc(victim)
             && victim->InRoom
             && (victim->InRoom->Area == ch->InRoom->Area
		 || GetTrustLevel(ch) >= LEVEL_IMMORTAL )
             &&   CanSeeCharacter( ch, victim ) )
          {
            found = true;
            ch->Echo("%-28s %s\r\n",
                          victim->Name, victim->InRoom->Name );
          }

      if ( !found )
        ch->Echo("None\r\n");
    }
  else
    {
      found = false;
      for ( victim = FirstCharacter; victim; victim = victim->Next )
        if ( victim->InRoom
             && victim->InRoom->Area == ch->InRoom->Area
             && !IsAffectedBy(victim, AFF_HIDE)
             && !IsAffectedBy(victim, AFF_SNEAK)
             && CanSeeCharacter( ch, victim )
             && IsName( arg, victim->Name ) )
          {
            found = true;
            ch->Echo("%-28s %s\r\n",
                          PERS(victim, ch), victim->InRoom->Name );
            break;
          }
      if ( !found )
        Act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
    }
}

