#include <string.h>
#include "shops.h"
#include "mud.h"
#include "character.h"

static void appraise_all( Character *ch, Character *keeper, char *fixstr );

void do_appraise( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *keeper;
  Object *obj;
  int cost;
  char *fixstr;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Appraise what?\r\n", ch );
      return;
    }

  if ( ( keeper = FindFixer( ch ) ) == NULL )
    return;

  switch( keeper->Prototype->rShop->shop_type )
    {
    default:
    case SHOP_FIX:
      fixstr  = "repair";
      break;
    case SHOP_RECHARGE:
      fixstr  = "recharge";
      break;
    }

  if ( !StrCmp( arg, "all") )
    {
      appraise_all( ch, keeper, fixstr );
      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
    {
      Act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->reply = keeper;
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      SendToCharacter( "You can't let go of it.\r\n", ch );
      return;
    }

  if ( ( cost = GetRepairCost( keeper, obj ) ) < 0 )
    {
      if (cost != -2)
        Act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'", keeper, obj, ch, TO_VICT );
      else
        Act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
      return;
    }

  sprintf( buf,
           "$N tells you, 'It will cost %d credit%s to %s that...'", cost,
           cost == 1 ? "" : "s", fixstr );
  Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
  if ( cost > ch->gold )
    Act( AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
         NULL, keeper, TO_CHAR );
}

static void appraise_all( Character *ch, Character *keeper, char *fixstr )
{
  Object *obj;
  char buf[MAX_STRING_LENGTH], *pbuf=buf;
  int cost, total=0;

  for ( obj = ch->first_carrying; obj != NULL ; obj = obj->next_content )
    {
      if ( obj->wear_loc  == WEAR_NONE
           &&   CanSeeObject( ch, obj )
           && ( obj->item_type == ITEM_ARMOR
                ||   obj->item_type == ITEM_WEAPON
                ||   obj->item_type == ITEM_DEVICE ) )

        {
          if ( !CanDropObject( ch, obj ) )
            Echo( ch, "You can't let go of %s.\r\n", obj->name );
          else if ( ( cost = GetRepairCost( keeper, obj ) ) < 0 )
            {
              if (cost != -2)
                Act( AT_TELL,
                     "$n tells you, 'Sorry, I can't do anything with $p.'",
                     keeper, obj, ch, TO_VICT );
              else
		Act( AT_TELL, "$n tells you, '$p looks fine to me!'",
                     keeper, obj, ch, TO_VICT );
            }
          else
            {
              sprintf( buf,
                       "$N tells you, 'It will cost %d credit%s to %s %s'",
                       cost, cost == 1 ? "" : "s", fixstr, obj->name );
              Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
              total += cost;
            }
        }
    }
  if ( total > 0 )
    {
      SendToCharacter ("\r\n", ch);
      sprintf( buf,
               "$N tells you, 'It will cost %d credit%s in total.'",
               total, cost == 1 ? "" : "s" );
      Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
      strcpy( pbuf,
              "$N tells you, 'Remember there is a 10% surcharge for repair all.'");
      Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
    }
}
