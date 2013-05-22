#include <string.h>
#include "shops.h"
#include "mud.h"
#include "character.h"

static void appraise_all( CHAR_DATA *ch, CHAR_DATA *keeper, char *fixstr );

void do_appraise( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *keeper;
  OBJ_DATA *obj;
  int cost;
  char *fixstr;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Appraise what?\r\n", ch );
      return;
    }

  if ( ( keeper = find_fixer( ch ) ) == NULL )
    return;

  switch( keeper->pIndexData->rShop->shop_type )
    {
    default:
    case SHOP_FIX:
      fixstr  = "repair";
      break;
    case SHOP_RECHARGE:
      fixstr  = "recharge";
      break;
    }

  if ( !str_cmp( arg, "all") )
    {
      appraise_all( ch, keeper, fixstr );
      return;
    }

  if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
      act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->reply = keeper;
      return;
    }

  if ( !can_drop_obj( ch, obj ) )
    {
      send_to_char( "You can't let go of it.\r\n", ch );
      return;
    }

  if ( ( cost = get_repaircost( keeper, obj ) ) < 0 )
    {
      if (cost != -2)
        act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'", keeper, obj, ch, TO_VICT );
      else
        act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
      return;
    }

  sprintf( buf,
           "$N tells you, 'It will cost %d credit%s to %s that...'", cost,
           cost == 1 ? "" : "s", fixstr );
  act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
  if ( cost > ch->gold )
    act( AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
         NULL, keeper, TO_CHAR );
}

static void appraise_all( CHAR_DATA *ch, CHAR_DATA *keeper, char *fixstr )
{
  OBJ_DATA *obj;
  char buf[MAX_STRING_LENGTH], *pbuf=buf;
  int cost, total=0;

  for ( obj = ch->first_carrying; obj != NULL ; obj = obj->next_content )
    {
      if ( obj->wear_loc  == WEAR_NONE
           &&   can_see_obj( ch, obj )
           && ( obj->item_type == ITEM_ARMOR
                ||   obj->item_type == ITEM_WEAPON
                ||   obj->item_type == ITEM_DEVICE ) )

        {
          if ( !can_drop_obj( ch, obj ) )
            ch_printf( ch, "You can't let go of %s.\r\n", obj->name );
          else if ( ( cost = get_repaircost( keeper, obj ) ) < 0 )
            {
              if (cost != -2)
                act( AT_TELL,
                     "$n tells you, 'Sorry, I can't do anything with $p.'",
                     keeper, obj, ch, TO_VICT );
              else
		act( AT_TELL, "$n tells you, '$p looks fine to me!'",
                     keeper, obj, ch, TO_VICT );
            }
          else
            {
              sprintf( buf,
                       "$N tells you, 'It will cost %d credit%s to %s %s'",
                       cost, cost == 1 ? "" : "s", fixstr, obj->name );
              act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
              total += cost;
            }
        }
    }
  if ( total > 0 )
    {
      send_to_char ("\r\n", ch);
      sprintf( buf,
               "$N tells you, 'It will cost %d credit%s in total.'",
               total, cost == 1 ? "" : "s" );
      act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
      strcpy( pbuf,
              "$N tells you, 'Remember there is a 10% surcharge for repair all.'");
      act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
    }
}
