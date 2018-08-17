#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "protoobject.hpp"

void do_oinvoke( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoObject *pObjIndex = NULL;
  Object *obj = NULL;
  vnum_t vnum = INVALID_VNUM;
  int level = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Syntax: oinvoke <vnum> <level>.\r\n");
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
          ch->Echo("Syntax: oinvoke <vnum> <level>.\r\n");
          return;
        }
      level = atoi( arg2 );

      if ( level < 0 || level > GetTrustLevel( ch ) )
	{
          ch->Echo("Limited to your trust level.\r\n");
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
        for ( pObjIndex = ObjectIndexHash[hash];
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
          ch->Echo("No such object exists.\r\n");
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
          ch->Echo("Huh?\r\n");
          return;
        }

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          ch->Echo("You must have an assigned area to invoke this object.\r\n");
	  return;
        }
      if ( vnum < pArea->VnumRanges.Object.First
           &&   vnum > pArea->VnumRanges.Object.Last )
        {
          ch->Echo("That number is not in your allocated range.\r\n");
          return;
        }
    }

  if ( ( pObjIndex = GetProtoObject( vnum ) ) == NULL )
    {
      ch->Echo("No object has that vnum.\r\n");
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

  ch->Echo("Ok.\r\n");
}

