#include "character.h"
#include "mud.h"

void do_mpoload( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  OBJ_INDEX_DATA *pObjIndex;
  OBJ_DATA       *obj;
  int             level;
  int               timer = 0;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || !IsNumber( arg1 ) )
    {
      progbug( "Mpoload - Bad syntax", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    level = GetTrustLevel( ch );
  else
    {
      /*
       * New feature from Alander.
       */
      if ( !IsNumber( arg2 ) )
        {
          progbug( "Mpoload - Bad level syntax", ch );
          return;
        }
      level = atoi( arg2 );
      if ( level < 0 || level > GetTrustLevel( ch ) )
        {
          progbug( "Mpoload - Bad level", ch );
          return;
        }

      /*
       * New feature from Thoric.
       */
      timer = atoi( argument );
      if ( timer < 0 )
        {
          progbug( "Mpoload - Bad timer", ch );
          return;
        }
    }

  if ( ( pObjIndex = get_obj_index( atoi( arg1 ) ) ) == NULL )
    {
      progbug( "Mpoload - Bad vnum arg", ch );
      return;
    }

  obj = create_object( pObjIndex, level );
  obj->timer = timer;
  if ( CAN_WEAR(obj, ITEM_TAKE) )
    obj_to_char( obj, ch );
  else
    obj_to_room( obj, ch->in_room );
}
