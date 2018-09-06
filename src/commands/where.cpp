#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "descriptor.hpp"

void do_where( Character *ch, std::string arg )
{
  Character *victim = nullptr;
  bool found = false;

  if (GetTrustLevel(ch) < LEVEL_IMMORTAL)
    {
      ch->Echo("If only life were really that simple...\r\n" );
      return;
    }

  SetCharacterColor( AT_PERSON, ch );

  if ( arg.empty() )
    {
      if (GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        ch->Echo("Players logged in:\r\n");
      else
        ch->Echo("Players near you in %s:\r\n", ch->InRoom->Area->Name.c_str() );

      found = false;

      for(const Descriptor *d : Descriptors->Entities())
        {
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
                       victim->Name.c_str(), victim->InRoom->Name.c_str() );
            }
        }
      
      if ( !found )
        {
          ch->Echo("None\r\n");
        }
    }
  else
    {
      found = false;

      for ( victim = FirstCharacter; victim; victim = victim->Next )
        {
          if ( victim->InRoom
               && victim->InRoom->Area == ch->InRoom->Area
               && !IsAffectedBy(victim, AFF_HIDE)
               && !IsAffectedBy(victim, AFF_SNEAK)
               && CanSeeCharacter( ch, victim )
               && IsName( arg, victim->Name ) )
            {
              found = true;
              ch->Echo("%-28s %s\r\n",
                       PERS(victim, ch).c_str(), victim->InRoom->Name.c_str() );
              break;
            }
        }
      
      if ( !found )
        {
          Act( AT_PLAIN, "You didn't find any $T.",
               ch, NULL, arg.c_str(), TO_CHAR );
        }
    }
}
