#include "mud.h"
#include "character.h"

void do_sit (Character *ch, char *argument )
{
  Object *obj = NULL;

  if (ch->position == POS_FIGHTING)
    {
      SendToCharacter("Maybe you should finish this fight first?\r\n",ch);
      return;
    }

  /* okay, now that we know we can sit, find an object to sit on */
  if (argument[0] != '\0')
    {
      obj = get_obj_list( ch, argument, ch->in_room->first_content );

      if (obj == NULL)
        {
          SendToCharacter("You don't see that here.\r\n",ch);
          return;
        }
    }

  if (obj != NULL)
    {
      if (obj->item_type != ITEM_FURNITURE
          ||  (!obj->value[2]))
        {
          SendToCharacter("You can't sit on that.\r\n",ch);
          return;
        }

      if (obj != NULL && ch->on != obj && count_users(obj) >= obj->value[0])
        {
          Act(AT_ACTION, "There's no more room on $p.",ch,obj,NULL,TO_CHAR);
          return;
	}

      ch->on = obj;
    }

  switch (ch->position)
    {
    case POS_SLEEPING:
      if (IsAffectedBy(ch,AFF_SLEEP))
        {
          SendToCharacter("You can't wake up!\r\n",ch);
          return;
        }

      if (obj == NULL)
        {
          SendToCharacter( "You wake and sit up.\r\n", ch );
          Act(AT_ACTION,  "$n wakes and sits up.", ch, NULL, NULL, TO_ROOM );
        }
      else if (obj->value[2] == SIT_AT)
        {
          Act(AT_ACTION, "You wake and sit at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes and sits at $p.",ch,obj,NULL,TO_ROOM);

        }
      else if (obj->value[2] == SIT_ON)
        {
          Act(AT_ACTION, "You wake and sit on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes and sits at $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You wake and sit in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes and sits in $p.",ch,obj,NULL,TO_ROOM);
        }

      ch->position = POS_SITTING;
      break;

    case POS_RESTING:
      if (obj == NULL)
        SendToCharacter("You stop resting.\r\n",ch);
      else if (obj->value[2] == SIT_AT)
        {
          Act(AT_ACTION, "You sit at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->value[2] == SIT_ON)
        {
          Act(AT_ACTION, "You sit on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits on $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->position = POS_SITTING;
      break;

    case POS_SITTING:
      SendToCharacter("You are already sitting down.\r\n",ch);
      break;

    case POS_STANDING:
      if (obj == NULL)
        {
          SendToCharacter("You sit down.\r\n",ch);
          Act(AT_ACTION, "$n sits down on the ground.",ch,NULL,NULL,TO_ROOM);
        }
      else if ( obj->value[2] == SIT_AT)
        {
          Act(AT_ACTION, "You sit down at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits down at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->value[2] == SIT_ON)
        {
          Act(AT_ACTION, "You sit on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits on $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You sit down in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits down in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->position = POS_SITTING;
      break;
    }
}
