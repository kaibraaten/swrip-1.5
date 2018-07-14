#include "character.hpp"
#include "mud.hpp"

/* lets the mobile load an item or mobile.  All items
   are loaded into inventory.  you can specify a level with
   the load object portion as well. */

void do_mpmload( Character *ch, char *argument )
{
  char            arg[ MAX_INPUT_LENGTH ];
  ProtoMobile *pMobIndex;
  Character      *victim;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || !IsNumber(arg) )
    {
      ProgBug( "Mpmload - Bad vnum as arg", ch );
      return;
    }

  if ( ( pMobIndex = GetProtoMobile( atoi( arg ) ) ) == NULL )
    {
      ProgBug( "Mpmload - Bad mob vnum", ch );
      return;
    }

  victim = CreateMobile( pMobIndex );
  CharacterToRoom( victim, ch->InRoom );
}
