#include "character.h"
#include "mud.h"

bool spec_auth( Character *ch )
{
  Character *victim;
  Character *v_next;
  char buf[MAX_STRING_LENGTH];
  ProtoObject *pObjIndex;
  Object *obj;
  bool hasdiploma;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !IsNpc(victim) && ( pObjIndex = GetProtoObject( OBJ_VNUM_SCHOOL_DIPLOMA ) ) != NULL )
        {
          hasdiploma = false;

          for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
            if (obj->Prototype == GetProtoObject( OBJ_VNUM_SCHOOL_DIPLOMA ) )
              hasdiploma = true;

          if ( !hasdiploma )
            {
              obj = CreateObject( pObjIndex, 1 );
              obj = obj_to_char( obj, victim );
              SendToCharacter( "&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w",victim);
            }
        }

      if ( IsNpc(victim)
           ||   !IsBitSet(victim->pcdata->flags, PCFLAG_UNAUTHED) || victim->pcdata->auth_state == 2 )
        continue;

      victim->pcdata->auth_state = 3;
      RemoveBit(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->pcdata->authed_by )
        FreeMemory( victim->pcdata->authed_by );
      victim->pcdata->authed_by = CopyString( ch->name );
      sprintf( buf, "%s authorized %s", ch->name,
               victim->name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
    }

  return false;
}
