#include "character.h"
#include "mud.h"

void do_where( Character *ch, char *argument )
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

      for ( d = first_descriptor; d; d = d->next )
        if ( (d->connection_state == CON_PLAYING || d->connection_state == CON_EDITING )
             && ( victim = d->character ) != NULL
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
      for ( victim = first_char; victim; victim = victim->next )
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
