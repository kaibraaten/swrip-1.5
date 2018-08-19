#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"

void do_compare( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo( "Compare what to what?\r\n" );
      return;
    }

  const Object *obj1 = GetCarriedObject(ch, arg1);
  
  if ( obj1 == nullptr )
    {
      ch->Echo( "You do not have that item.\r\n" );
      return;
    }

  const Object *obj2 = nullptr;
  
  if ( IsNullOrEmpty( arg2 ) )
    {
      for(const Object *iter : ch->Objects())
        {
          if ( iter->WearLoc != WEAR_NONE
               && CanSeeObject( ch, iter )
               && obj1->ItemType == iter->ItemType
               && ( obj1->WearFlags & iter->WearFlags & ~ITEM_TAKE) != 0 )
            {
              obj2 = iter;
              break;
            }
        }

      if ( !obj2 )
        {
          ch->Echo( "You aren't wearing anything comparable.\r\n" );
          return;
        }
    }
  else
    {
      obj2 = GetCarriedObject( ch, arg2 );
      
      if ( obj2 == nullptr )
        {
          ch->Echo( "You do not have that item.\r\n" );
          return;
        }
    }

  const char *msg = nullptr;
  int value1 = 0;
  int value2 = 0;
  
  if ( obj1 == obj2 )
    {
      msg = "You compare $p to itself. It looks about the same.";
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

  if ( msg == nullptr )
    {
      if ( value1 == value2 )
        msg = "$p and $P look about the same.";
      else if ( value1  > value2 )
        msg = "$p looks better than $P.";
      else
        msg = "$p looks worse than $P.";
    }

  Act( AT_PLAIN, msg, ch, obj1, obj2, TO_CHAR );
}

