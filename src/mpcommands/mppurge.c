#include "character.h"
#include "mud.h"

/* lets the mobile purge all objects and other npcs in the room,
   or purge a specified object or mob in the room.  It can purge
   itself, but this had best be the last command in the MUDprogram
   otherwise ugly stuff will happen */

void do_mppurge( Character *ch, char *argument )
{
  char       arg[ MAX_INPUT_LENGTH ];
  Character *victim;
  Object  *obj;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      /* 'purge' */
      Character *vnext;

      for ( victim = ch->in_room->first_person; victim; victim = vnext )
        {
	  vnext = victim->next_in_room;
          if ( IsNpc( victim ) && victim != ch )
            extract_char( victim, true );
        }
      while ( ch->in_room->first_content )
        extract_obj( ch->in_room->first_content );

      return;
    }

  if ( (victim = get_char_room( ch, arg )) == NULL )
    {
      if ( (obj = get_obj_here( ch, arg )) != NULL )
        extract_obj( obj );
      else
        progbug( "Mppurge - Bad argument", ch );
      return;
    }

  if ( !IsNpc( victim ) )
    {
      progbug( "Mppurge - Trying to purge a PC", ch );
      return;
    }

  if ( victim == ch )
    {
      progbug( "Mppurge - Trying to purge oneself", ch );
      return;
    }

  if ( IsNpc( victim ) && victim->Prototype->vnum == 3 )
    {
      progbug( "Mppurge: trying to purge supermob", ch );
      return;
    }

  extract_char( victim, true );
}
