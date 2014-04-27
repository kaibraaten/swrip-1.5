#include <time.h>
#include "mud.h"
#include "shops.h"
#include "character.h"

void do_collectgold (CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *vendor;
  CHAR_DATA *ch1;
  long gold;
  char buf [MAX_INPUT_LENGTH];
  char logbuf [MAX_INPUT_LENGTH];
  char name[MAX_INPUT_LENGTH];
  struct tm *tms;

  if ( ( vendor = find_keeper (ch) ) == NULL )
    {
      return;
    }

  if (vendor->owner == NULL)
    {
      send_to_char("thats not a vendor!\r\n",ch);
      return;
    }

  sprintf(name, "%s", vendor->owner);

  if ( (ch1 = get_char_room(ch, vendor->owner)) == NULL )
    {
      send_to_char ("Trying to steal huh?\r\n",ch);
      return;
    }
  if ( str_cmp( ch1->name, vendor->owner ) )
    {
      send_to_char ("Trying to steal huh?\r\n",ch);
      tms = localtime(&current_time);
      tms->tm_hour += 24;
      ch->pcdata->release_date = mktime(tms);
      ch->pcdata->helled_by = STRALLOC("VendorCheat");
      act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
      char_from_room(ch);
      char_to_room(ch, get_room_index(6));
      act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
      do_look(ch, "auto");
      ch_printf(ch, "The immortals are not pleased with your actions.\r\n"
                "You shall remain in hell for 24 Hours.\r\n");
      save_char_obj(ch);        /* used to save ch, fixed by Thoric 09/17/96 */
      sprintf( logbuf , "%s just tried to abuse the vendor bug!" , ch->name);
      log_string( logbuf );
      return;
    }


  if ( !(ch == ch1) )
    {
      sprintf (buf, "collectgold: %s and ch1 = %s\r\n", name, ch1->name);
      log_string (buf);

      send_to_char ("This isnt your vendor!\r\n",ch);
      return;
    }

  if ( ch->fighting)
    {
      send_to_char ("Not while you fightZ!\r\n",ch);
      return;
    }

  gold = vendor->gold;
  gold -= (gold * VENDOR_FEE);
  if( vendor->in_room && vendor->in_room->area )
    boost_economy( vendor->in_room->area, vendor->gold);
  vendor->gold = 0;
  ch->gold += gold;

  send_to_char("&GYour vendor gladly hands over his earnings minus a small fee of course..\r\n",ch);
  act( AT_ACTION, "$n hands over some money.\r\n", vendor, NULL, NULL, TO_ROOM );
}
