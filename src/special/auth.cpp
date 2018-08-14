#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"

bool spec_auth( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  ProtoObject *pObjIndex = NULL;
  Object *obj = NULL;
  bool hasdiploma = false;

  for(Character *victim : ch->InRoom->Characters())
    {
      if ( !IsNpc(victim) && ( pObjIndex = GetProtoObject( OBJ_VNUM_SCHOOL_DIPLOMA ) ) != NULL )
        {
          hasdiploma = false;

          for ( obj = victim->LastCarrying; obj; obj = obj->PreviousContent )
            if (obj->Prototype == GetProtoObject( OBJ_VNUM_SCHOOL_DIPLOMA ) )
              hasdiploma = true;

          if ( !hasdiploma )
            {
              obj = CreateObject( pObjIndex, 1 );
              obj = ObjectToCharacter( obj, victim );
              victim->Echo("&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w");
            }
        }

      if ( IsNpc(victim)
           ||   !IsBitSet(victim->PCData->Flags, PCFLAG_UNAUTHED) || victim->PCData->AuthState == 2 )
        continue;

      victim->PCData->AuthState = 3;
      RemoveBit(victim->PCData->Flags, PCFLAG_UNAUTHED);

      if ( victim->PCData->AuthedBy )
        FreeMemory( victim->PCData->AuthedBy );

      victim->PCData->AuthedBy = CopyString( ch->Name );
      sprintf( buf, "%s authorized %s", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
    }

  return false;
}
