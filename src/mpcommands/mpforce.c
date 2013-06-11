#include "character.h"
#include "mud.h"

static void ForceVictim( void *element, void *userData );
static bool CanBeForced( void *element, void *userData );

/* lets the mobile force someone to do something.  must be mortal level
   and the all argument only affects those in the room with the mobile */
void do_mpforce( Character *ch, char *argument )
{
  char arg[ MAX_INPUT_LENGTH ];

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ch->desc )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      progbug( "Mpforce - Bad syntax", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      CerisList *victims = List_CopyIf( ch->in_room->People, CanBeForced, ch );

      List_ForEach( victims, ForceVictim, argument );

      DestroyList( victims );
    }
  else
    {
      Character *victim;

      if ( ( victim = get_char_room_mp( ch, arg ) ) == NULL )
        {
          progbug( "Mpforce - No such victim", ch );
          return;
        }

      if ( victim == ch )
        {
          progbug( "Mpforce - Forcing oneself", ch );
          return;
        }

      if ( !IsNpc( victim )
           && ( !victim->desc )
           && IsImmortal( victim ) )
        {
          progbug( "Mpforce - Attempting to force link dead immortal", ch );
          return;
        }


      interpret( victim, argument );
    }
}

static void ForceVictim( void *element, void *userData )
{
  Character *victim = (Character*) element;
  char *argument = (char*) userData;

  interpret( victim, argument );
}

static bool CanBeForced( void *element, void *userData )
{
  Character *victim = (Character*) element;
  Character *ch = (Character*) userData;

  if ( GetTrustedLevel( victim ) < GetTrustedLevel( ch ) && can_see( ch, victim ) )
    {
      return TRUE;
    }
  else
    {
      return FALSE;
    }
}
