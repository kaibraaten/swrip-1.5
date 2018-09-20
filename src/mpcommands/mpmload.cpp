#include "character.hpp"
#include "mud.hpp"

/* lets the mobile load an item or mobile.  All items
   are loaded into inventory.  you can specify a level with
   the load object portion as well. */

void do_mpmload( Character *ch, std::string arg )
{
  ProtoMobile *pMobIndex = nullptr;
  Character *victim = nullptr;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( arg.empty() || !IsNumber(arg) )
    {
      ProgBug( "Mpmload - Bad vnum as arg", ch );
      return;
    }

  if ( ( pMobIndex = GetProtoMobile( ToLong( arg ) ) ) == NULL )
    {
      ProgBug( "Mpmload - Bad mob vnum", ch );
      return;
    }

  victim = CreateMobile( pMobIndex );
  CharacterToRoom( victim, ch->InRoom );
}
