#include "character.h"
#include "mud.h"

void do_sleep( Character *ch, char *argument )
{
  Object *obj = NULL;

  switch ( ch->position )
    {
    case POS_SLEEPING:
      SendToCharacter( "You are already sleeping.\r\n", ch );
      break;

    case POS_RESTING:
    case POS_SITTING:
    case POS_STANDING:
      if (argument[0] == '\0' && ch->on == NULL)
        {
          SendToCharacter( "You go to sleep.\r\n", ch );
          Act(AT_ACTION, "$n goes to sleep.", ch, NULL, NULL, TO_ROOM );
          ch->position = POS_SLEEPING;
        }
      else  /* find an object and sleep on it */
        {
          if (argument[0] == '\0')
            obj = ch->on;
          else
            obj = get_obj_list( ch, argument,  ch->in_room->first_content );

          if (obj == NULL)
            {
              SendToCharacter("You don't see that here.\r\n",ch);
              return;
            }
          if (obj->item_type != ITEM_FURNITURE
              ||  (!obj->value[2]))
            {
	      SendToCharacter("You can't sleep on that!\r\n",ch);
              return;
            }

          if (ch->on != obj && count_users(obj) >= obj->value[0])
            {
              Act(AT_ACTION, "There is no room on $p for you.",
                  ch,obj,NULL,TO_CHAR);
              return;
            }

          ch->on = obj;

          if (obj->value[2] == SLEEP_AT)
            {
              Act(AT_ACTION, "You go to sleep at $p.",ch,obj,NULL,TO_CHAR);
              Act(AT_ACTION, "$n goes to sleep at $p.",ch,obj,NULL,TO_ROOM);
            }
          else if (obj->value[2] == SLEEP_ON)
            {
              Act(AT_ACTION, "You go to sleep on $p.",ch,obj,NULL,TO_CHAR);
              Act(AT_ACTION, "$n goes to sleep on $p.",ch,obj,NULL,TO_ROOM);
            }
          else
            {
              Act(AT_ACTION, "You go to sleep in $p.",ch,obj,NULL,TO_CHAR);
              Act(AT_ACTION, "$n goes to sleep in $p.",ch,obj,NULL,TO_ROOM);
            }

          ch->position = POS_SLEEPING;
        }
      break;

    case POS_FIGHTING:
      SendToCharacter( "You are busy fighting!\r\n", ch );
      break;
    }

  rprog_sleep_trigger( ch );
}
