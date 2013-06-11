/*
Super-AT command:

FOR ALL <action>
FOR MORTALS <action>
FOR GODS <action>
FOR MOBS <action>
FOR EVERYWHERE <action>


Executes action several times, either on ALL players (not including yourself),
MORTALS (including trusted characters), GODS (characters with level higher than
L_HERO), MOBS (Not recommended) or every room (not recommended either!)

If you insert a # in the action, it will be replaced by the name of the target.

If # is a part of the action, the action will be executed for every target
in game. If there is no #, the action will be executed for every room containg
at least one target, but only once per room. # cannot be used with FOR EVERY-
WHERE. # can be anywhere in the action.

Example:

FOR ALL SMILE -> you will only smile once in a room with 2 players.
FOR ALL TWIDDLE # -> In a room with A and B, you will twiddle A then B.

Destroying the characters this command acts upon MAY cause it to fail. Try to
avoid something like FOR MOBS PURGE (although it actually works at my MUD).

FOR MOBS TRANS 3054 (transfer ALL the mobs to Midgaard temple) does NOT work
though :)

The command works by transporting the character to each of the rooms with
target in them. Private rooms are not violated.

*/

#include <string.h>
#include "mud.h"
#include "character.h"
#include "room.h"

extern ROOM_INDEX_DATA *room_index_hash[MAX_KEY_HASH];

static const char *name_expand( Character *ch );
static bool CharacterHasName( void *element, void *userData );

void do_for(Character *ch, char *argument)
{
  char range[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  bool fGods = FALSE, fMortals = FALSE, fMobs = FALSE, fEverywhere = FALSE, found;
  ROOM_INDEX_DATA *room, *old_room;
  Character *p, *p_prev;  /* p_next to p_prev -- TRI */
  int i;

  argument = one_argument (argument, range);

  if (!range[0] || !argument[0]) /* invalid usage? */
    {
      do_help (ch, "for");
      return;
    }

  if (!str_prefix("quit", argument))
    {
      send_to_char ("Are you trying to crash the MUD or something?\r\n",ch);
      return;
    }


  if (!str_cmp (range, "all"))
    {
      fMortals = TRUE;
      fGods = TRUE;
    }
  else if (!str_cmp (range, "gods"))
    fGods = TRUE;
  else if (!str_cmp (range, "mortals"))
    fMortals = TRUE;
  else if (!str_cmp (range, "mobs"))
    fMobs = TRUE;
  else if (!str_cmp (range, "everywhere"))
    fEverywhere = TRUE;
  else
    do_help (ch, "for"); /* show syntax */

  /* do not allow # to make it easier */
  if (fEverywhere && strchr (argument, '#'))
    {
      send_to_char ("Cannot use FOR EVERYWHERE with the # thingie.\r\n",ch);
      return;
    }

  if (strchr (argument, '#')) /* replace # ? */
    {
      /* char_list - last_char, p_next - gch_prev -- TRI */
      for (p = last_char; p ; p = p_prev )
        {
          p_prev = p->prev;  /* TRI */
          /*    p_next = p->next; */ /* In case someone DOES try to AT MOBS SLAY # */
          found = FALSE;

          if (!(p->in_room) || room_is_private(p, p->in_room) || (p == ch))
            continue;

          if (IsNpc(p) && fMobs)
            found = TRUE;
          else if (!IsNpc(p) && GetTrustedLevel(p) >= LEVEL_IMMORTAL && fGods)
            found = TRUE;
          else if (!IsNpc(p) && GetTrustedLevel(p) < LEVEL_IMMORTAL && fMortals)
            found = TRUE;

          /* It looks ugly to me.. but it works :) */
          if (found) /* p is 'appropriate' */
            {
              char *pSource = argument; /* head of buffer to be parsed */
              char *pDest = buf; /* parse into this */

              while (*pSource)
                {
                  if (*pSource == '#') /* Replace # with name of target */
                    {
                      const char *namebuf = name_expand (p);

                      if (namebuf) /* in case there is no mob name ?? */
                        while (*namebuf) /* copy name over */
                          *(pDest++) = *(namebuf++);

                      pSource++;
                    }
		  else
                    *(pDest++) = *(pSource++);
                } /* while */
              *pDest = '\0'; /* Terminate */

              /* Execute */
              old_room = ch->in_room;
              char_from_room (ch);
              char_to_room (ch,p->in_room);
              interpret (ch, buf);
              char_from_room (ch);
              char_to_room (ch,old_room);

            } /* if found */
        } /* for every char */
    }
  else /* just for every room with the appropriate people in it */
    {
      for (i = 0; i < MAX_KEY_HASH; i++) /* run through all the buckets */
        for (room = room_index_hash[i] ; room ; room = room->next)
          {
	    CerisListIterator *peopleInRoomIterator = NULL;
            found = FALSE;

            /* Anyone in here at all? */
            if (fEverywhere) /* Everywhere executes always */
	      {
		found = TRUE;
	      }
            else if( NumberOfPeopleInRoom( room ) == 0 )
	      {
		continue;
	      }

	    peopleInRoomIterator = CreateListIterator( room->People, ForwardsIterator );

            /* Check if there is anyone here of the requried type */
            /* Stop as soon as a match is found or there are no more ppl in room */
	    for( ; !ListIterator_IsDone( peopleInRoomIterator ); ListIterator_Next( peopleInRoomIterator ) );
              {
		p = (Character*) ListIterator_GetData( peopleInRoomIterator );

                if (p == ch) /* do not execute on oneself */
                  continue;

                if (IsNpc(p) && fMobs)
                  found = TRUE;
                else if (!IsNpc(p) && ( GetTrustedLevel(p) >= LEVEL_IMMORTAL) && fGods)
                  found = TRUE;
                else if (!IsNpc(p) && ( GetTrustedLevel(p) <= LEVEL_IMMORTAL) && fMortals)
                  found = TRUE;
	      } /* for everyone inside the room */

	    DestroyListIterator( peopleInRoomIterator );

            if (found && !room_is_private(p, room)) /* Any of the required type here AND room not private? */
              {
                /* This may be ineffective. Consider moving character out of old_room
                   once at beginning of command then moving back at the end.
                   This however, is more safe?
		*/

                old_room = ch->in_room;
                char_from_room (ch);
                char_to_room (ch, room);
                interpret (ch, argument);
                char_from_room (ch);
                char_to_room (ch, old_room);
              } /* if found */
          } /* for every room in a bucket */
    } /* if strchr */
}

/* Expand the name of a character into a string that identifies THAT
   character within a room. E.g. the second 'guard' -> 2. guard
*/
static const char *name_expand( Character *ch )
{
  int count = 1;
  char name[MAX_INPUT_LENGTH]; /*  HOPEFULLY no mob has a name longer than THAT */
  static char outbuf[MAX_INPUT_LENGTH];

  if (!IsNpc(ch))
    return ch->name;

  one_argument (ch->name, name); /* copy the first word into name */

  if (!name[0]) /* weird mob .. no keywords */
    {
      strcpy (outbuf, ""); /* Do not return NULL, just an empty buffer */
      return outbuf;
    }

  count += List_CountIf( ch->in_room->People, CharacterHasName, name );

  sprintf (outbuf, "%d.%s", count, name);
  return outbuf;
}

static bool CharacterHasName( void *element, void *userData )
{
  const Character *ch = (Character*) element;
  const char *name = (char*) userData;

  return is_name( name, ch->name );
}
