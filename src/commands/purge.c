#include "mud.h"
#include "character.h"

static void PurgeMobilesInRoom( Character *purger, ROOM_INDEX_DATA *room );
static void PurgeObjectsInRoom( ROOM_INDEX_DATA *room );

void do_purge( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  OBJ_DATA *obj = NULL;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      PurgeMobilesInRoom( ch, ch->in_room );
      PurgeObjectsInRoom( ch->in_room );

      act( AT_IMMORT, "$n purges the room!", ch, NULL, NULL, TO_ROOM);
      send_to_char( "Ok.\r\n", ch );
      return;
    }

  /* fixed to get things in room first -- i.e., purge portal (obj),
   * no more purging mobs with that keyword in another room first
   * -- Tri */
  if ( ( victim = get_char_room( ch, arg ) ) == NULL
       && ( obj = get_obj_here( ch, arg ) ) == NULL )
    {
      if ( ( victim = get_char_world( ch, arg ) ) == NULL
           &&   ( obj = get_obj_world( ch, arg ) ) == NULL )  /* no get_obj_room */
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }
    }

  /* Single object purge in room for high level purge - Scryn 8/12*/
  if ( obj )
    {
      separate_obj( obj );
      act( AT_IMMORT, "$n purges $p.", ch, obj, NULL, TO_ROOM);
      act( AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, TO_CHAR);
      extract_obj( obj );
      return;
    }


  if ( !IsNpc(victim) )
    {
      send_to_char( "Not on PC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "You cannot purge yourself!\r\n", ch );
      return;
    }

  if (IS_SET(victim->act, ACT_POLYMORPHED))
    {
      send_to_char("You cannot purge a polymorphed player.\r\n", ch);
      return;
    }

  act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  extract_char( victim, TRUE );
}

static void ExtractMobileIfNotPolymorphed( void *element, void *userData )
{
  Character *victim = (Character*) element;
  const Character *purger = userData;

  if ( IsNpc(victim) && victim != purger && !IS_SET(victim->act, ACT_POLYMORPHED))
    {
      extract_char( victim, TRUE );
    }
}

static void PurgeMobilesInRoom( Character *purger, ROOM_INDEX_DATA *room )
{
  CerisList *charactersInRoom = List_Copy( room->People );

  List_ForEach( charactersInRoom, ExtractMobileIfNotPolymorphed, purger );

  DestroyList( charactersInRoom );
}

static void PurgeObjectsInRoom( ROOM_INDEX_DATA *room )
{
  OBJ_DATA *obj = NULL;
  OBJ_DATA *obj_next = NULL;

  for ( obj = room->first_content; obj; obj = obj_next )
    {
      obj_next = obj->next_content;

      if ( obj->item_type == ITEM_SPACECRAFT )
        continue;

      extract_obj( obj );
    }
}
