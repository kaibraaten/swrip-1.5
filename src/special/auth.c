#include "character.h"
#include "mud.h"

static void AuthorizeCharacter( void *element, void *userData )
{
  Character *victim = (Character*) element;
  Character *schoolmaster = (Character*) userData;
  char buf[MAX_STRING_LENGTH];
  OBJ_INDEX_DATA *pObjIndex = NULL;
  OBJ_DATA *obj = NULL;

  if ( !IsNpc(victim) && ( pObjIndex = get_obj_index( OBJ_VNUM_SCHOOL_DIPLOMA ) ) != NULL )
    {
      if ( !HasDiploma( victim ) )
	{
	  obj = create_object( pObjIndex, 1 );
	  obj = obj_to_char( obj, victim );
	  send_to_char( "&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w",
			victim);
	}
    }

  if ( IsNpc(victim)
       || !IS_SET(victim->pcdata->flags, PCFLAG_UNAUTHED)
       || victim->pcdata->auth_state == 2 )
    {
      return;
    }

  victim->pcdata->auth_state = 3;
  REMOVE_BIT(victim->pcdata->flags, PCFLAG_UNAUTHED);

  if ( victim->pcdata->authed_by )
    {
      STRFREE( victim->pcdata->authed_by );
    }

  victim->pcdata->authed_by = QUICKLINK( schoolmaster->name );
  sprintf( buf, "%s authorized %s", schoolmaster->name, victim->name );
  to_channel( buf, CHANNEL_MONITOR, "Monitor", schoolmaster->top_level );
}

bool spec_auth( Character *ch )
{
  List_ForEach( ch->in_room->People, AuthorizeCharacter, ch );

  return FALSE;
}
