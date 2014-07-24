#include "character.h"
#include "mud.h"

void do_rest( Character *ch, char *argument )
{
  OBJ_DATA *obj = NULL;

  if (ch->position == POS_FIGHTING)
    {
      send_to_char("You are already fighting!\r\n",ch);
      return;
    }

  /* okay, now that we know we can rest, find an object to rest on */
  if (argument[0] != '\0')
    {
      obj = get_obj_list(ch,argument,ch->in_room->first_content);

      if (obj == NULL)
        {
          send_to_char("You don't see that here.\r\n",ch);
          return;
        }
    }
  else
    {
      obj = ch->on;
    }

  if (obj != NULL)
    {
      if (obj->item_type != ITEM_FURNITURE
          ||  (!obj->value[2]))
        {
          send_to_char("You can't rest on that.\r\n",ch);
          return;
        }

      if (obj != NULL && ch->on != obj && count_users(obj) >= obj->value[0])
        {
          act(AT_ACTION, "There's no more room on $p.",ch,obj,NULL,TO_CHAR);
	  return;
        }

      ch->on = obj;
    }

  switch ( ch->position )
    {
    case POS_SLEEPING:
      if (is_affected_by(ch,AFF_SLEEP))
        {
          send_to_char("You can't wake up!\r\n",ch);
          return;
        }

      if (obj == NULL)
        {
          send_to_char( "You wake up and start resting.\r\n", ch );
          act (AT_ACTION, "$n wakes up and starts resting.",
	       ch, NULL, NULL, TO_ROOM);
        }
      else if (obj->value[2] == REST_AT)
        {
          act(AT_ACTION, "You wake up and rest at $p.", ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n wakes up and rests at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->value[2] == REST_ON)
        {
          act(AT_ACTION, "You wake up and rest on $p.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n wakes up and rests on $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          act(AT_ACTION, "You wake up and rest in $p.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n wakes up and rests in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->position = POS_RESTING;
      break;

    case POS_RESTING:
      send_to_char( "You are already resting.\r\n", ch );
      break;

    case POS_STANDING:
      if (obj == NULL)
        {
	  send_to_char( "You rest.\r\n", ch );
          act( AT_ACTION, "$n sits down and rests.", ch, NULL, NULL, TO_ROOM );
        }
      else if (obj->value[2] == REST_AT)
        {
          act(AT_ACTION, "You sit down at $p and rest.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n sits down at $p and rests.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->value[2] == REST_ON)
        {
          act(AT_ACTION, "You sit on $p and rest.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n sits on $p and rests.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          act(AT_ACTION, "You rest in $p.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n rests in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->position = POS_RESTING;
      break;

    case POS_SITTING:
      if (obj == NULL)
        {
          send_to_char("You rest.\r\n",ch);
          act(AT_ACTION, "$n rests.",ch,NULL,NULL,TO_ROOM);
        }
      else if (obj->value[2] == REST_AT)
        {
          act(AT_ACTION, "You rest at $p.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n rests at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->value[2] == REST_ON)
        {
          act(AT_ACTION, "You rest on $p.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n rests on $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          act(AT_ACTION, "You rest in $p.",ch,obj,NULL,TO_CHAR);
          act(AT_ACTION, "$n rests in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->position = POS_RESTING;
      break;

    case POS_MOUNTED:
      send_to_char( "You'd better dismount first.\r\n", ch );
      return;
    }

  rprog_rest_trigger( ch );
}
