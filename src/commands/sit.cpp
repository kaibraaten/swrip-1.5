#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"

void do_sit (Character *ch, char *argument )
{
  Object *obj = NULL;

  if (ch->Position == POS_FIGHTING)
    {
      ch->Echo("Maybe you should finish this fight first?\r\n");
      return;
    }

  /* okay, now that we know we can sit, find an object to sit on */
  if ( !IsNullOrEmpty( argument ) )
    {
      obj = GetObjectInList( ch, argument, ch->InRoom->Objects());

      if (obj == NULL)
        {
          ch->Echo("You don't see that here.\r\n");
          return;
        }
    }

  if (obj != NULL)
    {
      if (obj->ItemType != ITEM_FURNITURE
          ||  (!obj->Value[OVAL_FURNITURE_PREPOSITION]))
        {
          ch->Echo("You can't sit on that.\r\n");
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

  switch (ch->Position)
    {
    case POS_SLEEPING:
      if (IsAffectedBy(ch,AFF_SLEEP))
        {
          ch->Echo("You can't wake up!\r\n");
          return;
        }

      if (obj == NULL)
        {
          ch->Echo("You wake and sit up.\r\n");
          Act(AT_ACTION,  "$n wakes and sits up.", ch, NULL, NULL, TO_ROOM );
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SIT_AT)
        {
          Act(AT_ACTION, "You wake and sit at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes and sits at $p.",ch,obj,NULL,TO_ROOM);

        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SIT_ON)
        {
          Act(AT_ACTION, "You wake and sit on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes and sits at $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You wake and sit in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n wakes and sits in $p.",ch,obj,NULL,TO_ROOM);
        }

      ch->Position = POS_SITTING;
      break;

    case POS_RESTING:
      if (obj == NULL)
        ch->Echo("You stop resting.\r\n");
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SIT_AT)
        {
          Act(AT_ACTION, "You sit at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SIT_ON)
        {
          Act(AT_ACTION, "You sit on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits on $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->Position = POS_SITTING;
      break;

    case POS_SITTING:
      ch->Echo("You are already sitting down.\r\n");
      break;

    case POS_STANDING:
      if (obj == NULL)
        {
          ch->Echo("You sit down.\r\n");
          Act(AT_ACTION, "$n sits down on the ground.",ch,NULL,NULL,TO_ROOM);
        }
      else if ( obj->Value[OVAL_FURNITURE_PREPOSITION] == SIT_AT)
        {
          Act(AT_ACTION, "You sit down at $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits down at $p.",ch,obj,NULL,TO_ROOM);
        }
      else if (obj->Value[OVAL_FURNITURE_PREPOSITION] == SIT_ON)
        {
          Act(AT_ACTION, "You sit on $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits on $p.",ch,obj,NULL,TO_ROOM);
        }
      else
        {
          Act(AT_ACTION, "You sit down in $p.",ch,obj,NULL,TO_CHAR);
          Act(AT_ACTION, "$n sits down in $p.",ch,obj,NULL,TO_ROOM);
        }
      ch->Position = POS_SITTING;
      break;

    default:
      break;
    }
}

