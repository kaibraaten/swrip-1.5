#include "character.h"
#include "mud.h"

void do_mpoload( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  ProtoObject *pObjIndex;
  Object       *obj;
  int             level;
  int               timer = 0;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || !IsNumber( arg1 ) )
    {
      ProgBug( "Mpoload - Bad syntax", ch );
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
          ProgBug( "Mpoload - Bad level syntax", ch );
          return;
        }
      level = atoi( arg2 );
      if ( level < 0 || level > GetTrustLevel( ch ) )
        {
          ProgBug( "Mpoload - Bad level", ch );
          return;
        }

      /*
       * New feature from Thoric.
       */
      timer = atoi( argument );
      if ( timer < 0 )
        {
          ProgBug( "Mpoload - Bad timer", ch );
          return;
        }
    }

  if ( ( pObjIndex = GetProtoObject( atoi( arg1 ) ) ) == NULL )
    {
      ProgBug( "Mpoload - Bad vnum arg", ch );
      return;
    }

  obj = CreateObject( pObjIndex, level );
  obj->timer = timer;
  if ( CAN_WEAR(obj, ITEM_TAKE) )
    obj_to_char( obj, ch );
  else
    obj_to_room( obj, ch->in_room );
}
