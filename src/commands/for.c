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

extern Room *room_index_hash[MAX_KEY_HASH];

static const char * name_expand (Character *ch);

void do_for(Character *ch, char *argument)
{
  char range[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  bool fGods = false, fMortals = false, fMobs = false, fEverywhere = false, found;
  Room *room, *old_room;
  Character *p, *p_prev;  /* p_next to p_prev -- TRI */
  int i;

  argument = OneArgument (argument, range);

  if (!range[0] || !argument[0]) /* invalid usage? */
    {
      do_help (ch, "for");
      return;
    }

  if (!StringPrefix("quit", argument))
    {
      SendToCharacter ("Are you trying to crash the MUD or something?\r\n",ch);
      return;
    }


  if (!StrCmp (range, "all"))
    {
      fMortals = true;
      fGods = true;
    }
  else if (!StrCmp (range, "gods"))
    fGods = true;
  else if (!StrCmp (range, "mortals"))
    fMortals = true;
  else if (!StrCmp (range, "mobs"))
    fMobs = true;
  else if (!StrCmp (range, "everywhere"))
    fEverywhere = true;
  else
    do_help (ch, "for"); /* show syntax */

  /* do not allow # to make it easier */
  if (fEverywhere && strchr (argument, '#'))
    {
      SendToCharacter ("Cannot use FOR EVERYWHERE with the # thingie.\r\n",ch);
      return;
    }

  if (strchr (argument, '#')) /* replace # ? */
    {
      /* char_list - last_char, p_next - gch_prev -- TRI */
      for (p = last_char; p ; p = p_prev )
        {
          p_prev = p->prev;  /* TRI */
          /*    p_next = p->next; */ /* In case someone DOES try to AT MOBS SLAY # */
          found = false;

          if (!(p->InRoom) || IsRoomPrivate(p, p->InRoom) || (p == ch))
            continue;

          if (IsNpc(p) && fMobs)
            found = true;
          else if (!IsNpc(p) && GetTrustLevel(p) >= LEVEL_IMMORTAL && fGods)
            found = true;
          else if (!IsNpc(p) && GetTrustLevel(p) < LEVEL_IMMORTAL && fMortals)
            found = true;

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
              old_room = ch->InRoom;
              CharacterFromRoom (ch);
              CharacterToRoom (ch,p->InRoom);
              Interpret (ch, buf);
              CharacterFromRoom (ch);
              CharacterToRoom (ch,old_room);

            } /* if found */
        } /* for every char */
    }
  else /* just for every room with the appropriate people in it */
    {
      for (i = 0; i < MAX_KEY_HASH; i++) /* run through all the buckets */
        for (room = room_index_hash[i] ; room ; room = room->Next)
          {
            found = false;

            /* Anyone in here at all? */
            if (fEverywhere) /* Everywhere executes always */
              found = true;
            else if (!room->FirstPerson) /* Skip it if room is empty */
              continue;
            /* ->people changed to first_person -- TRI */

            /* Check if there is anyone here of the requried type */
            /* Stop as soon as a match is found or there are no more ppl in room */
            /* ->people to ->first_person -- TRI */
            for (p = room->FirstPerson; p && !found; p = p->next_in_room)
              {

                if (p == ch) /* do not execute on oneself */
                  continue;

                if (IsNpc(p) && fMobs)
                  found = true;
                else if (!IsNpc(p) && ( GetTrustLevel(p) >= LEVEL_IMMORTAL) && fGods)
                  found = true;
                else if (!IsNpc(p) && ( GetTrustLevel(p) <= LEVEL_IMMORTAL) && fMortals)
                  found = true;
	      } /* for everyone inside the room */

            if (found && !IsRoomPrivate(p, room)) /* Any of the required type here AND room not private? */
              {
                /* This may be ineffective. Consider moving character out of old_room
                   once at beginning of command then moving back at the end.
                   This however, is more safe?
		*/

                old_room = ch->InRoom;
                CharacterFromRoom (ch);
                CharacterToRoom (ch, room);
                Interpret (ch, argument);
                CharacterFromRoom (ch);
                CharacterToRoom (ch, old_room);
              } /* if found */
          } /* for every room in a bucket */
    } /* if strchr */
}

/* Expand the name of a character into a string that identifies THAT
   character within a room. E.g. the second 'guard' -> 2. guard
*/
static const char * name_expand (Character *ch)
{
  int count = 1;
  Character *rch;
  char name[MAX_INPUT_LENGTH]; /*  HOPEFULLY no mob has a name longer than THAT */

  static char outbuf[MAX_INPUT_LENGTH];

  if (!IsNpc(ch))
    return ch->name;

  OneArgument (ch->Name, name); /* copy the first word into name */

  if (!name[0]) /* weird mob .. no keywords */
    {
      strcpy (outbuf, ""); /* Do not return NULL, just an empty buffer */
      return outbuf;
    }

  /* ->people changed to ->first_person -- TRI */
  for (rch = ch->InRoom->FirstPerson; rch && (rch != ch);rch = rch->next_in_room)
    if ( IsName(name, rch->Name))
      count++;

  sprintf (outbuf, "%d.%s", count, name);
  return outbuf;
}
