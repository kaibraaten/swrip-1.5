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
      send_to_char( "If only life were really that simple...\r\n" , ch);
      return;
    }

  one_argument( argument, arg );

  set_pager_color( AT_PERSON, ch );
  if ( arg[0] == '\0' )
    {
      if (GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        send_to_pager( "Players logged in:\r\n", ch );
      else
        pager_printf( ch, "Players near you in %s:\r\n", ch->in_room->area->name );
      found = false;
      for ( d = first_descriptor; d; d = d->next )
        if ( (d->connection_state == CON_PLAYING || d->connection_state == CON_EDITING )
             && ( victim = d->character ) != NULL
             &&   !IsNpc(victim)
             &&   victim->in_room
             &&   (victim->in_room->area == ch->in_room->area || GetTrustLevel(ch) >= LEVEL_IMMORTAL )
             &&   can_see( ch, victim ) )
          {
            found = true;
            pager_printf( ch, "%-28s %s\r\n",
                          victim->name, victim->in_room->name );
          }

      if ( !found )
        send_to_char( "None\r\n", ch );
    }
  else
    {
      found = false;
      for ( victim = first_char; victim; victim = victim->next )
        if ( victim->in_room
             &&   victim->in_room->area == ch->in_room->area
             &&   !IsAffectedBy(victim, AFF_HIDE)
             &&   !IsAffectedBy(victim, AFF_SNEAK)
             &&   can_see( ch, victim )
             &&   is_name( arg, victim->name ) )
          {
            found = true;
            pager_printf( ch, "%-28s %s\r\n",
                          PERS(victim, ch), victim->in_room->name );
            break;
          }
      if ( !found )
        act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
    }
}
