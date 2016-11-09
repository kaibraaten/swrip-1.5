#include "character.hpp"
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
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      /* 'purge' */
      Character *vnext;

      for ( victim = ch->InRoom->FirstPerson; victim; victim = vnext )
        {
	  vnext = victim->NextInRoom;
          if ( IsNpc( victim ) && victim != ch )
            ExtractCharacter( victim, true );
        }
      while ( ch->InRoom->FirstContent )
        ExtractObject( ch->InRoom->FirstContent );

      return;
    }

  if ( (victim = GetCharacterInRoom( ch, arg )) == NULL )
    {
      if ( (obj = GetObjectHere( ch, arg )) != NULL )
        ExtractObject( obj );
      else
        ProgBug( "Mppurge - Bad argument", ch );
      return;
    }

  if ( !IsNpc( victim ) )
    {
      ProgBug( "Mppurge - Trying to purge a PC", ch );
      return;
    }

  if ( victim == ch )
    {
      ProgBug( "Mppurge - Trying to purge oneself", ch );
      return;
    }

  if ( IsNpc( victim ) && victim->Prototype->Vnum == 3 )
    {
      ProgBug( "Mppurge: trying to purge supermob", ch );
      return;
    }

  ExtractCharacter( victim, true );
}
