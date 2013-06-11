#include "character.h"
#include "mud.h"

/* lets the mobile load an item or mobile.  All items
   are loaded into inventory.  you can specify a level with
   the load object portion as well. */

void do_mpmload( Character *ch, char *argument )
{
  char            arg[ MAX_INPUT_LENGTH ];
  MOB_INDEX_DATA *pMobIndex;
  Character      *victim;

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' || !is_number(arg) )
    {
      progbug( "Mpmload - Bad vnum as arg", ch );
      return;
    }

  if ( ( pMobIndex = get_mob_index( atoi( arg ) ) ) == NULL )
    {
      progbug( "Mpmload - Bad mob vnum", ch );
      return;
    }

  victim = create_mobile( pMobIndex );
  char_to_room( victim, ch->in_room );
}
