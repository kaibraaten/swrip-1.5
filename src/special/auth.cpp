#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"

bool spec_auth( Character *ch )
{
  for(Character *victim : ch->InRoom->Characters())
    {
      ProtoObject *pObjIndex = GetProtoObject( OBJ_VNUM_SCHOOL_DIPLOMA );
      
      if ( !IsNpc(victim) && pObjIndex != nullptr )
        {
          if ( !HasDiploma(ch) )
            {
              Object *obj = CreateObject( pObjIndex, 1 );
              obj = ObjectToCharacter( obj, victim );
              victim->Echo("&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w");
            }
        }

      if ( IsNpc(victim)
           || !IsBitSet(victim->PCData->Flags, PCFLAG_UNAUTHED)
           || victim->PCData->AuthState == 2 )
        {
          continue;
        }
      
      victim->PCData->AuthState = 3;
      RemoveBit(victim->PCData->Flags, PCFLAG_UNAUTHED);

      victim->PCData->AuthedBy = ch->Name;
      char buf[MAX_STRING_LENGTH];
      sprintf( buf, "%s authorized %s", ch->Name.c_str(),
               victim->Name.c_str() );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
    }

  return false;
}
