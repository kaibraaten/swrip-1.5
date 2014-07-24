#include "character.h"
#include "mud.h"

extern OBJ_INDEX_DATA *obj_index_hash[MAX_KEY_HASH];

void do_oinvoke( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_INDEX_DATA *pObjIndex;
  OBJ_DATA *obj;
  short vnum;
  int level;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: oinvoke <vnum> <level>.\r\n", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      level = get_trust( ch );
    }
  else
    {
      if ( !is_number( arg2 ) )
        {
          send_to_char( "Syntax: oinvoke <vnum> <level>.\r\n", ch );
          return;
        }
      level = atoi( arg2 );

      if ( level < 0 || level > get_trust( ch ) )
	{
          send_to_char( "Limited to your trust level.\r\n", ch );
          return;
        }
    }

  if ( !is_number( arg1 ) )
    {
      char arg[MAX_INPUT_LENGTH];
      int  hash, cnt;
      int  count = number_argument( arg1, arg );

      vnum = -1;
      for ( hash = cnt = 0; hash < MAX_KEY_HASH; hash++ )
        for ( pObjIndex = obj_index_hash[hash];
              pObjIndex;
              pObjIndex = pObjIndex->next )
          if ( nifty_is_name( arg, pObjIndex->name )
               &&   ++cnt == count )
            {
              vnum = pObjIndex->vnum;
              break;
            }
      if ( vnum == -1 )
        {
          send_to_char( "No such object exists.\r\n", ch );
          return;
        }
    }
  else
    vnum = atoi( arg1 );

  if ( get_trust(ch) < LEVEL_DEMI )
    {
      Area *pArea;

      if ( is_npc(ch) )
        {
          send_to_char( "Huh?\r\n", ch );
          return;
        }

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to invoke this object.\r\n", ch );
	  return;
        }
      if ( vnum < pArea->low_o_vnum
           &&   vnum > pArea->hi_o_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "No object has that vnum.\r\n", ch );
      return;
    }

  obj = create_object( pObjIndex, level );

  if ( CAN_WEAR(obj, ITEM_TAKE) )
    {
      obj = obj_to_char( obj, ch );
    }
  else
    {
      obj = obj_to_room( obj, ch->in_room );
      act( AT_IMMORT, "$n has created $p!", ch, obj, NULL, TO_ROOM );
    }

  send_to_char( "Ok.\r\n", ch );
}
