#include <time.h>
#include "shops.h"
#include "mud.h"

void do_pricevendor (CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *vendor;
  CHAR_DATA *ch1;
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char logbuf[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  struct tm *tms;

  argument = one_argument (argument, arg1);
  argument = one_argument (argument, arg2);

  if ( arg1[0] == '\0' )
    {
      send_to_char("usage:> pricevendor <item> <cost>\r\n",ch);
      return;
    }

  if (arg2[0] == '\0')
    {
      send_to_char("usage:> pricevendor <item> <cost>\r\n",ch);
      return;
    }


  if ( ( vendor = find_keeper (ch) ) == NULL )
    {
      return;
    }

  if ( !(vendor->owner) )
    return;

  if ( (ch1 = get_char_room(ch, vendor->owner)) == NULL )
    {
      send_to_char ("This isnt your vendor!\r\n",ch);
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

  if ( ch->fighting)
    {
      send_to_char ("Not while you fightZ!\r\n",ch);
      return;
    }

  if ( (obj  = get_obj_carry( vendor, arg1 )) != NULL)
    {
      obj->cost = atoi (arg2);
      send_to_char("The price has been changed\r\n",ch);
      save_vendor(vendor);
      return;
    }


  send_to_char("He doesnt have that item!\r\n",ch);
  save_vendor(vendor);
}
