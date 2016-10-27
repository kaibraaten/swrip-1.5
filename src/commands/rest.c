#include "character.h"
#include "mud.h"

void do_rest( Character *ch, char *argument )
{
  Object *obj = NULL;

  if (ch->Position == POS_FIGHTING)
    {
      SendToCharacter("You are already fighting!\r\n",ch);
      return;
    }

  /* okay, now that we know we can rest, find an object to rest on */
  if ( !IsNullOrEmpty( argument ) )
    {
      obj = GetObjectInList(ch, argument, ch->InRoom->FirstContent);

      if (obj == NULL)
        {
          SendToCharacter("You don't see that here.\r\n",ch);
          return;
        }
    }
  else
    {
      obj = ch->On;
    }

  if (obj != NULL)
    {
      if (obj->ItemType != ITEM_FURNITURE
          ||  (!obj->Value[OVAL_FURNITURE_PREPOSITION]))
        {
          SendToCharacter("You can't rest on that.\r\n",ch);
          return;
        }

      if (obj != NULL && ch->On != obj
	  && CountCharactersOnObject(obj) >= obj->Value[OVAL_FURNITURE_CAPACITY])
        {
          Act(AT_ACTION, "There's no more room on $p.",ch,obj,NULL,TO_CHAR);
	  return;
        }

      ch->On = obj;
    }

  switch ( ch->Position )
    {
    case POS_SLEEPING:
      if (IsAffectedBy(ch,AFF_SLEEP))
        {
          SendToCharacter("You can't wake up!\r\n",ch);
          return;
        }

      if (obj == NULL)
        {
          SendToCharacter( "You wake up and start resting.\r\n", ch );
          Act(AT_ACTION, "$n wakes up and starts resting.",
	       ch, NULL, NULL, TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
        {
          Act(AT_ACTION, "You wake up and rest at $p.", ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes up and rests at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
        {
          Act(AT_ACTION, "You wake up and rest on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes up and rests on $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You wake up and rest in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes up and rests in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->Position = POS_RESTING;
      break;

    case POS_RESTING:
      SendToCharacter( "You are already resting.\r\n", ch );
      break;

    case POS_STANDING:
      if (obj == NULL)
        {
	  SendToCharacter( "You rest.\r\n", ch );
          Act( AT_ACTION, "$n sits down and rests.", ch, NULL, NULL, TO_ROOM );
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
        {
          Act(AT_ACTION, "You sit down at $p and rest.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits down at $p and rests.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
        {
          Act(AT_ACTION, "You sit on $p and rest.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits on $p and rests.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You rest in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n rests in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->Position = POS_RESTING;
      break;

    case POS_SITTING:
      if (obj == NULL)
        {
          SendToCharacter("You rest.\r\n",ch);
          Act(AT_ACTION, "$n rests.",ch,NULL,NULL,TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
        {
          Act(AT_ACTION, "You rest at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n rests at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
        {
          Act(AT_ACTION, "You rest on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n rests on $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You rest in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n rests in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->Position = POS_RESTING;
      break;

    case POS_MOUNTED:
      SendToCharacter( "You'd better dismount first.\r\n", ch );
      return;

    default:
      break;
    }

  RoomProgRestTrigger( ch );
}
