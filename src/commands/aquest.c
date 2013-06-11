#include "character.h"
#include "quest.h"
#include "mud.h"

static Character *GetQuestmaster( const ROOM_INDEX_DATA *room )
{
  CerisListIterator *iter = CreateListIterator( room->People, ForwardsIterator );
  Character *questmaster = NULL;

  for( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
    {
      Character *current = (Character*) ListIterator_GetData( iter );

      if( !IsNpc( current ) )
	{
	  continue;
	}

      if( current->spec_fun == spec_lookup( "spec_questmaster" ) )
	{
	  questmaster = current;
	  break;
	}
    }

  DestroyListIterator( iter );

  return questmaster;
}

void do_aquest(Character *ch, char *argument)
{
  Character *questman;
  OBJ_DATA *obj=NULL, *obj_next;
  OBJ_INDEX_DATA *obj1, *obj2, *obj3, *obj4, *obj5;
  OBJ_INDEX_DATA *questinfoobj;
  MOB_INDEX_DATA *questinfo;
  char buf [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];

  argument = one_argument(argument, arg1);
  argument = one_argument(argument, arg2);

  if (!str_cmp(arg1, "info"))
    {
      if (IS_SET(ch->act, PLR_QUESTOR))
        {
          if (ch->quest.questmob == -1 && ch->quest.questgiver->short_descr != NULL)
            {
              sprintf(buf, "Your quest is ALMOST complete!\r\nGet back to %s before your time runs out!\r\n",ch->quest.questgiver->short_descr);
              send_to_char(buf, ch);
            }
          else if (ch->quest.questobj > 0)
	    {
              questinfoobj = get_obj_index(ch->quest.questobj);
              if (questinfoobj != NULL)
                {
                  sprintf(buf, "You are on a quest to recover the fabled %s!\r\n",questinfoobj->name);
                  send_to_char(buf, ch);
                }
              else send_to_char("You aren't currently on a quest.\r\n",ch);
              return;
            }
          else if (ch->quest.questmob > 0)
            {
              questinfo = get_mob_index(ch->quest.questmob);
              if (questinfo != NULL)
                {
                  sprintf(buf, "You are on a quest to slay the dreaded %s!\r\n",questinfo->short_descr);
                  send_to_char(buf, ch);
                }
              else send_to_char("You aren't currently on a quest.\r\n",ch);
              return;
            }
        }
      else
        send_to_char("You aren't currently on a quest.\r\n",ch);
      return;
    }
  if (!str_cmp(arg1, "points"))
    {
      sprintf(buf, "You have %d quest points.\r\n",ch->quest.questpoints);
      send_to_char(buf, ch);
      return;
    }
  else if (!str_cmp(arg1, "time"))
    {
      if (!IS_SET(ch->act, PLR_QUESTOR))
        {
          send_to_char("You aren't currently on a quest.\r\n",ch);
          if (ch->quest.nextquest > 1)
            {
              sprintf(buf, "There are %d minutes remaining until you can go on another quest.\r\n",ch->quest.nextquest);
              send_to_char(buf, ch);
            }
          else if (ch->quest.nextquest == 1)
            {
              sprintf(buf, "There is less than a minute remaining until you can go on another quest.\r\n");
	      send_to_char(buf, ch);
            }
        }
      else if (ch->quest.countdown > 0)
        {
          sprintf(buf, "Time left for current quest: %d\r\n",ch->quest.countdown);
          send_to_char(buf, ch);
        }
      return;
    }

  /* Checks for a character in the room with spec_questmaster set. This special
     procedure must be defined in special.c. You could instead use an
     ACT_QUESTMASTER flag instead of a special procedure. */

  questman = GetQuestmaster( ch->in_room );

  if (questman == NULL || questman->spec_fun != spec_lookup( "spec_questmaster" ))
    {
      send_to_char("You can't do that here.\r\n",ch);
      return;
    }

  if ( questman->position == POS_FIGHTING)
    {
      send_to_char("Wait until the fighting stops.\r\n",ch);
      return;
    }

  ch->quest.questgiver = questman;

  /* And, of course, you will need to change the following lines for YOUR
     quest item information. Quest items on Moongate are unbalanced, very
     very nice items, and no one has one yet, because it takes awhile to
     build up quest points :> Make the item worth their while. */


  obj1 = get_obj_index(QUEST_ITEM1);
  obj2 = get_obj_index(QUEST_ITEM2);
  obj3 = get_obj_index(QUEST_ITEM3);
  obj4 = get_obj_index(QUEST_ITEM4);
  obj5 = get_obj_index(QUEST_ITEM5);

  if ( obj1 == NULL || obj2 == NULL || obj3 == NULL || obj4 == NULL || obj5 == NULL )
    {
      bug("Error loading quest objects. Char: ", ch->name);
      return;
    }

  if (!str_cmp(arg1, "list"))
    {
      act(AT_PLAIN,"$n asks $N for a list of quest items.",ch,NULL,questman,TO_ROOM);
      act(AT_PLAIN,"You ask $N for a list of quest items.",ch,NULL,questman,TO_CHAR);
      sprintf(buf, "Current Quest Items available for Purchase:\r\n\r\n\
[1] %dqp.......%s\r\n\
[2] %dqp.......%s\r\n\
[3] %dqp........%s\r\n\
[4] %dqp........%s\r\n\
[5] %dqp......%s\r\n\
[6] 500qp........100,000 gold pieces\r\n\
[7] 500qp........10 health points\r\n",
              QUEST_VALUE1, obj1->short_descr, QUEST_VALUE2, obj2->short_descr,
              QUEST_VALUE3, obj3->short_descr, QUEST_VALUE4, obj4->short_descr,
              QUEST_VALUE5, obj5->short_descr);

      send_to_char(buf, ch);
      return;
    }

  else if (!str_cmp(arg1, "buy"))
    {
      if (arg2[0] == '\0')
        {
          send_to_char("To buy an item, type 'QUEST BUY <item>'.\r\n",ch);
          return;
        }
      if (is_name(arg2, "1"))
        {
          if (ch->quest.questpoints >= QUEST_VALUE1)
            {
              ch->quest.questpoints -= QUEST_VALUE1;
              obj = create_object(get_obj_index(QUEST_ITEM1),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
	      do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "2"))
        {
          if (ch->quest.questpoints >= QUEST_VALUE2)
            {
              ch->quest.questpoints -= QUEST_VALUE2;
              obj = create_object(get_obj_index(QUEST_ITEM2),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "3"))
        {
          if (ch->quest.questpoints >= QUEST_VALUE3)
            {
              ch->quest.questpoints -= QUEST_VALUE3;
              obj = create_object(get_obj_index(QUEST_ITEM3),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "4"))
        {
          if (ch->quest.questpoints >= QUEST_VALUE4)
            {
              ch->quest.questpoints -= QUEST_VALUE4;
              obj = create_object(get_obj_index(QUEST_ITEM4),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
	}
      else if (is_name(arg2, "5"))
        {
          if (ch->quest.questpoints >= QUEST_VALUE5)
            {
              ch->quest.questpoints -= QUEST_VALUE5;
              obj = create_object(get_obj_index(QUEST_ITEM5),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "6"))
        {
          if (ch->quest.questpoints >= 500)
            {
              ch->quest.questpoints -= 500;
              ch->gold += 100000;
              act(AT_MAGIC,"$N gives a pouch of gold to $n.", ch, NULL,
                  questman, TO_ROOM );
              act(AT_MAGIC,"$N hands you a pouch of gold pieces.",   ch, NULL,
                  questman, TO_CHAR );
              return;
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "7"))
        {
          if (ch->quest.questpoints >= 750)
            {
              ch->quest.questpoints -= 750;
              ch->max_hit += 10;
              act(AT_MAGIC,"$N waves his hand over $n. $n looks stronger.", ch, NULL,
                  questman, TO_ROOM );
              act(AT_MAGIC,"$N waves his hand over you. You feel stronger.",   ch, NULL,
                  questman, TO_CHAR );
              return;
	    }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else
        {
          sprintf(buf, "I don't have that item, %s.",ch->name);
          do_say(questman, buf);
        }
      if (obj != NULL)
        {
          act(AT_PLAIN,"$N gives something to $n.", ch, obj, questman, TO_ROOM );
          act(AT_PLAIN,"$N gives you your reward.",   ch, obj, questman, TO_CHAR );
          obj_to_char(obj, ch);
        }
      return;
    }
  else if (!str_cmp(arg1, "request"))
    {

      sprintf(buf, "Do to extreme stupidity of its system, the quest system has been removed\r\nThere are other ways to gain quest points now!");
      do_say(questman, buf);
      return;

      act(AT_PLAIN,"$n asks $N for a quest.", ch, NULL, questman, TO_ROOM);
      act(AT_PLAIN,"You ask $N for a quest.",ch, NULL, questman, TO_CHAR);
      if (IS_SET(ch->act, PLR_QUESTOR))
        {
          sprintf(buf, "But you're already on a quest!\r\nBetter hurry up and finish it!");
          do_say(questman, buf);
          return;
        }
      if (ch->quest.nextquest > 0)
        {
          sprintf(buf, "You're very brave, %s, but let someone else have a chance.",ch->name);
          do_say(questman, buf);
          sprintf(buf, "Come back later.");
          do_say(questman, buf);
          return;
        }

      sprintf(buf, "Thank you, brave %s!",ch->name);
      do_say(questman, buf);

      generate_quest(ch, questman);

      if (ch->quest.questmob > 0 || ch->quest.questobj > 0)
        {
          ch->quest.countdown = number_range(10,30);
          SET_BIT(ch->act, PLR_QUESTOR);
          sprintf(buf, "You have %d minutes to complete this quest.",ch->quest.countdown);
          do_say(questman, buf);
          sprintf(buf, "May the gods go with you!");
          do_say(questman, buf);
        }
      return;
    }
  else if (!str_cmp(arg1, "complete"))
    {
      act(AT_PLAIN,"$n informs $N $e has completed $s quest.", ch, NULL, questman,
          TO_ROOM);
      act(AT_PLAIN,"You inform $N you have completed $s quest.",ch, NULL,
          questman, TO_CHAR);
      if (ch->quest.questgiver != questman)
        {
          sprintf(buf, "I never sent you on a quest! Perhaps you're thinking of someone else.");
          do_say(questman,buf);
          return;
        }

      if (IS_SET(ch->act, PLR_QUESTOR))
        {
          if (ch->quest.questmob == -1 && ch->quest.countdown > 0)
            {
              int reward, pointreward;

              reward = number_range(5000,10000);
              pointreward = number_range(1,5);

              sprintf(buf, "Congratulations on completing your quest!");
              do_say(questman,buf);
              sprintf(buf,"As a reward, I am giving you %d quest points, and %d gold.",pointreward,reward);
              do_say(questman,buf);

              REMOVE_BIT(ch->act, PLR_QUESTOR);
              ch->quest.questgiver = NULL;
	      ch->quest.countdown = 0;
              ch->quest.questmob = 0;
              ch->quest.questobj = 0;
              ch->quest.nextquest = 30;
              ch->gold += reward;
              ch->quest.questpoints += pointreward;

              return;
            }
          else if (ch->quest.questobj > 0 && ch->quest.countdown > 0)
            {
              bool obj_found = FALSE;

              for (obj = ch->first_carrying; obj != NULL; obj=obj_next)
                {
                  obj_next = obj->next;

                  if ( obj->carried_by == ch )
                    if (obj != NULL && obj->pIndexData->vnum == ch->quest.questobj)
                      {
                        obj_found = TRUE;
                        break;
                      }
                }
              if (obj_found == TRUE)
                {
                  int reward, pointreward;

                  reward = number_range(5000,10000);
                  pointreward = number_range(1,5);

                  act(AT_PLAIN,"You hand $p to $N.",ch, obj, questman, TO_CHAR);
                  act(AT_PLAIN,"$n hands $p to $N.",ch, obj, questman, TO_ROOM);

                  sprintf(buf, "Congratulations on completing your quest!");
                  do_say(questman,buf);
                  sprintf(buf,"As a reward, I am giving you %d quest points, and %d gold.",pointreward,reward);
                  do_say(questman,buf);

                  REMOVE_BIT(ch->act, PLR_QUESTOR);
                  ch->quest.questgiver = NULL;
                  ch->quest.countdown = 0;
                  ch->quest.questmob = 0;
                  ch->quest.questobj = 0;
                  ch->quest.nextquest = 30;
		  ch->gold += reward;
                  ch->quest.questpoints += pointreward;
                  extract_obj(obj);
                  return;
                }
              else
                {
                  sprintf(buf, "You haven't completed the quest yet, but there is still time!");
                  do_say(questman, buf);
                  return;
                }
              return;
            }
          else if ((ch->quest.questmob > 0 || ch->quest.questobj > 0) && ch->quest.countdown > 0)
            {
              sprintf(buf, "You haven't completed the quest yet, but there is still time!");
              do_say(questman, buf);
              return;
            }
        }
      if (ch->quest.nextquest > 0)
        sprintf(buf,"But you didn't complete your quest in time!");
      else sprintf(buf, "You have to REQUEST a quest first, %s.",ch->name);
      do_say(questman, buf);
      return;
    }

  send_to_char("QUEST commands: POINTS INFO TIME REQUEST COMPLETE LIST BUY.\r\n",ch);
  send_to_char("For more information, type 'HELP QUEST'.\r\n",ch);
}
