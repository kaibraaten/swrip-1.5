#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"

void do_where( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Descriptor *d;
  bool found;

  if (GetTrustLevel(ch) < LEVEL_IMMORTAL)
    {
      SendToCharacter( "If only life were really that simple...\r\n" , ch);
      return;
    }

  OneArgument( argument, arg );

  SetPagerColor( AT_PERSON, ch );

  if ( IsNullOrEmpty( arg ) )
    {
      if (GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        SendToPager( "Players logged in:\r\n", ch );
      else
        PagerPrintf( ch, "Players near you in %s:\r\n", ch->InRoom->Area->Name );

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
            PagerPrintf( ch, "%-28s %s\r\n",
                          victim->Name, victim->InRoom->Name );
          }

      if ( !found )
        SendToCharacter( "None\r\n", ch );
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
            PagerPrintf( ch, "%-28s %s\r\n",
                          PERS(victim, ch), victim->InRoom->Name );
            break;
          }
      if ( !found )
        Act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
    }
}
