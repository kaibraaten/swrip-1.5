#include "character.hpp"
#include "mud.hpp"

void do_sleep( Character *ch, char *argument )
{
  Object *obj = NULL;

  switch ( ch->Position )
    {
    case POS_SLEEPING:
      SendToCharacter( "You are already sleeping.\r\n", ch );
      break;

    case POS_RESTING:
    case POS_SITTING:
    case POS_STANDING:
      if ( IsNullOrEmpty( argument ) && ch->On == NULL)
        {
          SendToCharacter( "You go to sleep.\r\n", ch );
          Act(AT_ACTION, "$n goes to sleep.", ch, NULL, NULL, TO_ROOM );
          ch->Position = POS_SLEEPING;
        }
      else  /* find an object and sleep on it */
        {
          if ( IsNullOrEmpty( argument ) )
            obj = ch->On;
          else
            obj = GetObjectInList( ch, argument,  ch->InRoom->FirstContent );

          if (obj == NULL)
            {
              SendToCharacter("You don't see that here.\r\n",ch);
              return;
            }
          if (obj->ItemType != ITEM_FURNITURE
              ||  (!obj->Value[OVAL_FURNITURE_PREPOSITION]))
            {
	      SendToCharacter("You can't sleep on that!\r\n",ch);
              return;
            }

          if (ch->On != obj && CountCharactersOnObject(obj) >= obj->Value[OVAL_FURNITURE_CAPACITY])
            {
              Act(AT_ACTION, "There is no room on $p for you.",
                  ch,obj,NULL,TO_CHAR);
              return;
            }

          ch->On = obj;

          if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SLEEP_AT)
            {
              Act(AT_ACTION, "You go to sleep at $p.",ch,obj,NULL,TO_CHAR);
              Act(AT_ACTION, "$n goes to sleep at $p.",ch,obj,NULL,TO_ROOM);
            }
          else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SLEEP_ON)
            {
              Act(AT_ACTION, "You go to sleep on $p.",ch,obj,NULL,TO_CHAR);
              Act(AT_ACTION, "$n goes to sleep on $p.",ch,obj,NULL,TO_ROOM);
            }
          else
            {
              Act(AT_ACTION, "You go to sleep in $p.",ch,obj,NULL,TO_CHAR);
              Act(AT_ACTION, "$n goes to sleep in $p.",ch,obj,NULL,TO_ROOM);
            }

          ch->Position = POS_SLEEPING;
        }
      break;

    case POS_FIGHTING:
      SendToCharacter( "You are busy fighting!\r\n", ch );
      break;

    default:
      break;
    }

  RoomProgSleepTrigger( ch );
}
