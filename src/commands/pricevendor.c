#include <time.h>
#include "shops.h"
#include "mud.h"
#include "character.h"

void do_pricevendor (Character *ch, char *argument)
{
  Character *vendor;
  Character *ch1;
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char logbuf[MAX_INPUT_LENGTH];
  Object *obj;
  struct tm *tms;

  argument = OneArgument (argument, arg1);
  argument = OneArgument (argument, arg2);

  if ( arg1[0] == '\0' )
    {
      SendToCharacter("usage:> pricevendor <item> <cost>\r\n",ch);
      return;
    }

  if (arg2[0] == '\0')
    {
      SendToCharacter("usage:> pricevendor <item> <cost>\r\n",ch);
      return;
    }


  if ( ( vendor = FindKeeper (ch) ) == NULL )
    {
      return;
    }

  if ( !(vendor->owner) )
    return;

  if ( (ch1 = get_char_room(ch, vendor->owner)) == NULL )
    {
      SendToCharacter ("This isnt your vendor!\r\n",ch);
      return;
    }
  if ( StrCmp( ch1->name, vendor->owner ) )
    {
      SendToCharacter ("Trying to steal huh?\r\n",ch);
      tms = localtime(&current_time);
      tms->tm_hour += 24;
      ch->pcdata->release_date = mktime(tms);
      ch->pcdata->helled_by = CopyString("VendorCheat");
      act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
      char_from_room(ch);
      char_to_room(ch, get_room_index(6));
      act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
      do_look(ch, "auto");
      ChPrintf(ch, "The immortals are not pleased with your actions.\r\n"
                "You shall remain in hell for 24 Hours.\r\n");
      save_char_obj(ch);        /* used to save ch, fixed by Thoric 09/17/96 */
      sprintf( logbuf , "%s just tried to abuse the vendor bug!" , ch->name);
      log_string( logbuf );
      return;
    }

  if ( ch->fighting)
    {
      SendToCharacter ("Not while you fightZ!\r\n",ch);
      return;
    }

  if ( (obj  = GetCarriedObject( vendor, arg1 )) != NULL)
    {
      obj->cost = atoi (arg2);
      SendToCharacter("The price has been changed\r\n",ch);
      SaveVendor(vendor);
      return;
    }


  SendToCharacter("He doesnt have that item!\r\n",ch);
  SaveVendor(vendor);
}
