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

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
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
              obj = ObjectToCharacter( obj, victim );
              SendToCharacter( "&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w",victim);
            }
        }

      if ( IsNpc(victim)
           ||   !IsBitSet(victim->PCData->Flags, PCFLAG_UNAUTHED) || victim->PCData->auth_state == 2 )
        continue;

      victim->PCData->auth_state = 3;
      RemoveBit(victim->PCData->Flags, PCFLAG_UNAUTHED);
      if ( victim->PCData->authed_by )
        FreeMemory( victim->PCData->authed_by );
      victim->PCData->authed_by = CopyString( ch->Name );
      sprintf( buf, "%s authorized %s", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
    }

  return false;
}
