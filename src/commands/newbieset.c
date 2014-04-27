#include "character.h"
#include "mud.h"

void do_newbieset( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument (argument, arg2);

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: newbieset <char>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( ( victim->top_level < 1 ) || ( victim->top_level > 5 ) )
    {
      send_to_char( "Level of victim must be 1 to 5.\r\n", ch );
      return;
    }
  obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_SHIELD), 1 );
  obj_to_char(obj, victim);

  obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_DAGGER), 1 );
  obj_to_char(obj, victim);

  /* Added by Brittany, on Nov. 24, 1996. The object is the adventurer's
     guide to the realms of despair, part of academy.are. */
  {
    OBJ_INDEX_DATA *obj_ind = get_obj_index( 10333 );
    if ( obj_ind != NULL )
      {
        obj = create_object( obj_ind, 1 );
        obj_to_char( obj, victim );
      }
  }

  /* Added the burlap sack to the newbieset.  The sack is part of sgate.are
     called Spectral Gate.  Brittany */

  {

    OBJ_INDEX_DATA *obj_ind = get_obj_index( 123 );
    if ( obj_ind != NULL )
      {
        obj = create_object( obj_ind, 1 );
        obj_to_char( obj, victim );
      }
  }

  act( AT_IMMORT, "$n has equipped you with a newbieset.", ch, NULL, victim, TO_VICT);
  ch_printf( ch, "You have re-equipped %s.\r\n", victim->name );
}
