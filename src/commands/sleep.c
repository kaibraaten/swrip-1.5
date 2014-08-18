#include "character.h"
#include "mud.h"

void do_sleep( Character *ch, char *argument )
{
  Object *obj = NULL;

  switch ( ch->position )
    {
    case POS_SLEEPING:
      send_to_char( "You are already sleeping.\r\n", ch );
      break;

    case POS_RESTING:
    case POS_SITTING:
    case POS_STANDING:
      if (argument[0] == '\0' && ch->on == NULL)
        {
          send_to_char( "You go to sleep.\r\n", ch );
          act(AT_ACTION, "$n goes to sleep.", ch, NULL, NULL, TO_ROOM );
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
              send_to_char("You don't see that here.\r\n",ch);
              return;
            }
          if (obj->item_type != ITEM_FURNITURE
              ||  (!obj->value[2]))
            {
	      send_to_char("You can't sleep on that!\r\n",ch);
              return;
            }

          if (ch->on != obj && count_users(obj) >= obj->value[0])
            {
              act(AT_ACTION, "There is no room on $p for you.",
                  ch,obj,NULL,TO_CHAR);
              return;
            }

          ch->on = obj;

          if (obj->value[2] == SLEEP_AT)
            {
              act(AT_ACTION, "You go to sleep at $p.",ch,obj,NULL,TO_CHAR);
              act(AT_ACTION, "$n goes to sleep at $p.",ch,obj,NULL,TO_ROOM);
            }
          else if (obj->value[2] == SLEEP_ON)
            {
              act(AT_ACTION, "You go to sleep on $p.",ch,obj,NULL,TO_CHAR);
              act(AT_ACTION, "$n goes to sleep on $p.",ch,obj,NULL,TO_ROOM);
            }
          else
            {
              act(AT_ACTION, "You go to sleep in $p.",ch,obj,NULL,TO_CHAR);
              act(AT_ACTION, "$n goes to sleep in $p.",ch,obj,NULL,TO_ROOM);
            }

          ch->position = POS_SLEEPING;
        }
      break;

    case POS_FIGHTING:
      send_to_char( "You are busy fighting!\r\n", ch );
      break;
    }

  rprog_sleep_trigger( ch );
}
