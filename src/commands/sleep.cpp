#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

void do_sleep( Character *ch, char *argument )
{
  Object *obj = NULL;

  switch ( ch->Position )
    {
    case POS_SLEEPING:
      ch->Echo("You are already sleeping.\r\n");
      break;

    case POS_RESTING:
    case POS_SITTING:
    case POS_STANDING:
      if ( IsNullOrEmpty( argument ) && ch->On == NULL)
        {
          ch->Echo("You go to sleep.\r\n");
          Act(AT_ACTION, "$n goes to sleep.", ch, NULL, NULL, TO_ROOM );
          ch->Position = POS_SLEEPING;
        }
      else  /* find an object and sleep on it */
        {
          if ( IsNullOrEmpty( argument ) )
            obj = ch->On;
          else
            obj = GetObjectInList( ch, argument,  ch->InRoom->Objects());

          if (obj == NULL)
            {
              ch->Echo("You don't see that here.\r\n");
              return;
            }
          if (obj->ItemType != ITEM_FURNITURE
              ||  (!obj->Value[OVAL_FURNITURE_PREPOSITION]))
            {
       ch->Echo("You can't sleep on that!\r\n");
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
      ch->Echo("You are busy fighting!\r\n");
      break;

    default:
      break;
    }

  RoomProgSleepTrigger( ch );
}
