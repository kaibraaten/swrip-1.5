#include "character.h"
#include "mud.h"

void do_compare( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj1;
  Object *obj2;
  int value1;
  int value2;
  char *msg;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Compare what to what?\r\n", ch );
      return;
    }

  if ( ( obj1 = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      send_to_char( "You do not have that item.\r\n", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      for ( obj2 = ch->first_carrying; obj2; obj2 = obj2->next_content )
        {
          if ( obj2->wear_loc != WEAR_NONE
               &&   CanSeeObject( ch, obj2 )
               &&   obj1->item_type == obj2->item_type
               && ( obj1->wear_flags & obj2->wear_flags & ~ITEM_TAKE) != 0 )
            break;
        }

      if ( !obj2 )
        {
          send_to_char( "You aren't wearing anything comparable.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj2 = GetCarriedObject( ch, arg2 ) ) == NULL )
        {
          send_to_char( "You do not have that item.\r\n", ch );
          return;
        }
    }

  msg           = NULL;
  value1        = 0;
  value2        = 0;

  if ( obj1 == obj2 )
    {
      msg = "You compare $p to itself.  It looks about the same.";
    }
  else if ( obj1->item_type != obj2->item_type )
    {
      msg = "You can't compare $p and $P.";
    }
  else
    {
      switch ( obj1->item_type )
        {
        default:
          msg = "You can't compare $p and $P.";
          break;

        case ITEM_ARMOR:
          value1 = obj1->value[0];
          value2 = obj2->value[0];
          break;

        case ITEM_WEAPON:
          value1 = obj1->value[1] + obj1->value[2];
          value2 = obj2->value[1] + obj2->value[2];
          break;
        }

    }

  if ( !msg )
    {
      if ( value1 == value2 ) msg = "$p and $P look about the same.";
      else if ( value1  > value2 ) msg = "$p looks better than $P.";
      else                         msg = "$p looks worse than $P.";
    }

  act( AT_PLAIN, msg, ch, obj1, obj2, TO_CHAR );
}
