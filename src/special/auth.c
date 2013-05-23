#include "character.h"
#include "mud.h"

bool spec_auth( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  char buf[MAX_STRING_LENGTH];
  OBJ_INDEX_DATA *pObjIndex;
  OBJ_DATA *obj;
  bool hasdiploma;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !is_npc(victim) && ( pObjIndex = get_obj_index( OBJ_VNUM_SCHOOL_DIPLOMA ) ) != NULL )
        {
          hasdiploma = FALSE;

          for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
            if (obj->pIndexData == get_obj_index( OBJ_VNUM_SCHOOL_DIPLOMA ) )
              hasdiploma = TRUE;

          if ( !hasdiploma )
            {
              obj = create_object( pObjIndex, 1 );
              obj = obj_to_char( obj, victim );
              send_to_char( "&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w",victim);
            }
        }

      if ( is_npc(victim)
           ||   !IS_SET(victim->pcdata->flags, PCFLAG_UNAUTHED) || victim->pcdata->auth_state == 2 )
        continue;

      victim->pcdata->auth_state = 3;
      REMOVE_BIT(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->pcdata->authed_by )
        STRFREE( victim->pcdata->authed_by );
      victim->pcdata->authed_by = QUICKLINK( ch->name );
      sprintf( buf, "%s authorized %s", ch->name,
               victim->name );
      to_channel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
    }

  return FALSE;
}
