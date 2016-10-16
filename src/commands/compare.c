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

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Compare what to what?\r\n", ch );
      return;
    }

  if ( ( obj1 = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "You do not have that item.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      for ( obj2 = ch->FirstCarrying; obj2; obj2 = obj2->NextContent )
        {
          if ( obj2->WearLoc != WEAR_NONE
               &&   CanSeeObject( ch, obj2 )
               &&   obj1->ItemType == obj2->ItemType
               && ( obj1->WearFlags & obj2->WearFlags & ~ITEM_TAKE) != 0 )
            break;
        }

      if ( !obj2 )
        {
          SendToCharacter( "You aren't wearing anything comparable.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj2 = GetCarriedObject( ch, arg2 ) ) == NULL )
        {
          SendToCharacter( "You do not have that item.\r\n", ch );
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
  else if ( obj1->ItemType != obj2->ItemType )
    {
      msg = "You can't compare $p and $P.";
    }
  else
    {
      switch ( obj1->ItemType )
        {
        default:
          msg = "You can't compare $p and $P.";
          break;

        case ITEM_ARMOR:
          value1 = obj1->Value[0];
          value2 = obj2->Value[0];
          break;

        case ITEM_WEAPON:
          value1 = obj1->Value[1] + obj1->Value[2];
          value2 = obj2->Value[1] + obj2->Value[2];
          break;
        }

    }

  if ( !msg )
    {
      if ( value1 == value2 ) msg = "$p and $P look about the same.";
      else if ( value1  > value2 ) msg = "$p looks better than $P.";
      else                         msg = "$p looks worse than $P.";
    }

  Act( AT_PLAIN, msg, ch, obj1, obj2, TO_CHAR );
}
