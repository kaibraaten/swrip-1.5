#include "quest.h"
#include "mud.h"
#include "character.h"

static bool qchance( int num );

void generate_quest(Character *ch, Character *questman)
{
  Character *victim;
  ProtoMobile *vsearch;
  ROOM_INDEX_DATA *room;
  OBJ_DATA *questitem;
  char buf[MAX_STRING_LENGTH];
  long mcounter;
  int level_diff, mob_vnum;
  bool noquest = FALSE;

  /*  Randomly selects a mob from the world mob list. If you don't
      want a mob to be selected, make sure it is immune to summon.
      Or, you could add a new mob flag called ACT_NOQUEST. The mob
      is selected for both mob and obj quests, even tho in the obj
      quest the mob is not used. This is done to assure the level
      of difficulty for the area isn't too great for the player. */

  for (mcounter = 0; mcounter < 99999; mcounter ++)
    {
      mob_vnum = number_range(50, 32600);

      if ( (vsearch = get_mob_index(mob_vnum) ) != NULL )
	{
          level_diff = vsearch->level - ch->top_level;

          /* Level differences to search for. Moongate has 350
             levels, so you will want to tweak these greater or
             less than statements for yourself. - Vassago */


          /*
            if( (room = find_location( ch, vsearch->player_name )) != NULL
            && room->area && IS_SET( room->area->flags, AFLAG_NOQUEST ) )
            noquest = TRUE;
	  */

          if (((level_diff < -5 && level_diff > -5)
               || (ch->top_level > 30 && ch->top_level < 40 && vsearch->level > 30 && vsearch->level < 54)
               || (ch->top_level > 40 && vsearch->level > 40))
              && is_evil_mob_index_data(vsearch)
              && vsearch->pShop == NULL
              && vsearch->rShop == NULL
              && !IS_SET(vsearch->act,ACT_TRAIN)
              && !IS_SET(vsearch->act,ACT_PRACTICE)
              && !IS_SET(vsearch->act,ACT_IMMORTAL)
              && qchance(35) && !noquest )

            break;


          else vsearch = NULL;
        }
    }

  if ( vsearch == NULL || ( victim = get_char_world( ch, vsearch->player_name ) ) == NULL || !is_npc(victim))
    {
      sprintf(buf, "I'm sorry, but I don't have any quests for you at this time.");
      do_say(questman, buf);
      sprintf(buf, "Try again later.");
      do_say(questman, buf);
      ch->quest.nextquest = 5;
      return;
    }

  if ( ( room = find_location( ch, victim->name) )== NULL )
    {
      sprintf(buf, "I'm sorry, but I don't have any quests for you at this time.");
      do_say(questman, buf);
      sprintf(buf, "Try again later.");
      do_say(questman, buf);
      ch->quest.nextquest = 5;
      return;
    }

  /*  40% chance it will send the player on a 'recover item' quest. */

  if (qchance(40))
    {
      vnum_t objvnum = 0;

      switch(number_range(0,4))
        {
        case 0:
          objvnum = QUEST_OBJQUEST1;
          break;

        case 1:
          objvnum = QUEST_OBJQUEST2;
          break;

        case 2:
          objvnum = QUEST_OBJQUEST3;
          break;

        case 3:
          objvnum = QUEST_OBJQUEST4;
          break;

        case 4:
          objvnum = QUEST_OBJQUEST5;
          break;
        }

      questitem = create_object( get_obj_index(objvnum), ch->top_level );
      obj_to_room(questitem, room);
      questitem->timer = 30;
      ch->quest.questobj = questitem->pIndexData->vnum;

      sprintf(buf, "Vile pilferers have stolen %s from the treasury!",questitem->short_descr);
      do_say(questman, buf);
      do_say(questman, "My court wizardess, with her magic mirror, has pinpointed its location.");

      /* I changed my area names so that they have just the name of the area
         and none of the level stuff. You may want to comment these next two
         lines. - Vassago */

      sprintf(buf, "Look in the general area of %s for %s!",room->area->name, room->name);
      do_say(questman, buf);
      return;
    }

  /* Quest to kill a mob */

  else
    {
      switch(number_range(0,1))
        {
        case 0:
          sprintf(buf, "An enemy of ours, %s, is making vile threats against my master.",victim->short_descr);
          do_say(questman, buf);
          sprintf(buf, "This threat must be eliminated!");
          do_say(questman, buf);
          break;

        case 1:
          sprintf(buf, "One of the galaxy's most heinous criminal, %s, is wandering lose!",victim->short_descr);
          do_say(questman, buf);
          sprintf(buf, "%s has murdered %d civillians, that we know of!",victim->short_descr, number_range(2,20));
          do_say(questman, buf);
          do_say(questman,"The penalty for this crime is death, and you are to deliver the sentence!");
          break;
        }

      if (room->name != NULL)
        {
          sprintf(buf, "Seek %s out somewhere in the vicinity of %s!",victim->short_descr,room->name);
          do_say(questman, buf);

          /* I changed my area names so that they have just the name of the area
             and none of the level stuff. You may want to comment these next two
             lines. - Vassago */

          sprintf(buf, "That location is in the general area of %s.",room->area->name);
          do_say(questman, buf);
        }
      ch->quest.questmob = victim->pIndexData->vnum;
    }
}

void quest_update(void)
{
  Character *ch, *ch_next;

  for ( ch = first_char; ch != NULL; ch = ch_next )
    {
      ch_next = ch->next;

      if (is_npc(ch)) continue;

      if (ch->quest.nextquest > 0)
        {
          ch->quest.nextquest--;

          if (ch->quest.nextquest == 0)
            {
              send_to_char("You may now quest again.\r\n",ch);
              return;
            }
        }
      else if (IS_SET(ch->act,PLR_QUESTOR))
	{
          if (--ch->quest.countdown <= 0)
            {
              char buf [MAX_STRING_LENGTH];

              ch->quest.nextquest = 30;
              sprintf(buf, "You have run out of time for your quest!\r\nYou may quest again in %d minutes.\r\n",ch->quest.nextquest);
              send_to_char(buf, ch);
              REMOVE_BIT(ch->act, PLR_QUESTOR);
              ch->quest.questgiver = NULL;
              ch->quest.countdown = 0;
              ch->quest.questmob = 0;
            }
          if (ch->quest.countdown > 0 && ch->quest.countdown < 6)
            {
              send_to_char("Better hurry, you're almost out of time for your quest!\r\n",ch);
              return;
            }
        }
    }
}

static bool qchance( int num )
{
  if (number_range(1,100) <= num)
    return TRUE;
  else
    return FALSE;
}
