#include "character.h"
#include "mud.h"
#include "area.h"

extern ProtoObject *obj_index_hash[MAX_KEY_HASH];

void do_oinvoke( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex;
  Object *obj;
  short vnum;
  int level;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Syntax: oinvoke <vnum> <level>.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      level = GetTrustLevel( ch );
    }
  else
    {
      if ( !IsNumber( arg2 ) )
        {
          SendToCharacter( "Syntax: oinvoke <vnum> <level>.\r\n", ch );
          return;
        }
      level = atoi( arg2 );

      if ( level < 0 || level > GetTrustLevel( ch ) )
	{
          SendToCharacter( "Limited to your trust level.\r\n", ch );
          return;
        }
    }

  if ( !IsNumber( arg1 ) )
    {
      char arg[MAX_INPUT_LENGTH];
      int  hash, cnt;
      int  count = NumberArgument( arg1, arg );

      vnum = -1;
      for ( hash = cnt = 0; hash < MAX_KEY_HASH; hash++ )
        for ( pObjIndex = obj_index_hash[hash];
              pObjIndex;
              pObjIndex = pObjIndex->Next )
          if ( NiftyIsName( arg, pObjIndex->Name )
               &&   ++cnt == count )
            {
              vnum = pObjIndex->Vnum;
              break;
            }
      if ( vnum == -1 )
        {
          SendToCharacter( "No such object exists.\r\n", ch );
          return;
        }
    }
  else
    vnum = atoi( arg1 );

  if ( GetTrustLevel(ch) < LEVEL_CREATOR )
    {
      Area *pArea;

      if ( IsNpc(ch) )
        {
          SendToCharacter( "Huh?\r\n", ch );
          return;
        }

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "You must have an assigned area to invoke this object.\r\n", ch );
	  return;
        }
      if ( vnum < pArea->VnumRanges.Object.First
           &&   vnum > pArea->VnumRanges.Object.Last )
        {
          SendToCharacter( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if ( ( pObjIndex = GetProtoObject( vnum ) ) == NULL )
    {
      SendToCharacter( "No object has that vnum.\r\n", ch );
      return;
    }

  obj = CreateObject( pObjIndex, level );

  if ( CAN_WEAR(obj, ITEM_TAKE) )
    {
      obj = ObjectToCharacter( obj, ch );
    }
  else
    {
      obj = ObjectToRoom( obj, ch->InRoom );
      Act( AT_IMMORT, "$n has created $p!", ch, obj, NULL, TO_ROOM );
    }

  SendToCharacter( "Ok.\r\n", ch );
}
