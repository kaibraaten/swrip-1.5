#include <time.h>
#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"

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

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter("usage:> pricevendor <item> <cost>\r\n",ch);
      return;
    }

  if ( ( vendor = FindKeeper (ch) ) == NULL )
    {
      return;
    }

  if ( !(vendor->Owner) )
    return;

  if ( (ch1 = GetCharacterInRoom(ch, vendor->Owner)) == NULL )
    {
      SendToCharacter ("This isnt your vendor!\r\n",ch);
      return;
    }
  if ( StrCmp( ch1->Name, vendor->Owner ) )
    {
      SendToCharacter ("Trying to steal huh?\r\n",ch);
      tms = localtime(&current_time);
      tms->tm_hour += 24;
      ch->PCData->ReleaseDate = mktime(tms);
      ch->PCData->HelledBy = CopyString("VendorCheat");
      Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(6));
      Act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
      do_look(ch, "auto");
      Echo(ch, "The immortals are not pleased with your actions.\r\n"
                "You shall remain in hell for 24 Hours.\r\n");
      SaveCharacter(ch);        /* used to save ch, fixed by Thoric 09/17/96 */
      sprintf( logbuf , "%s just tried to abuse the vendor bug!" , ch->Name);
      LogPrintf( logbuf );
      return;
    }

  if ( ch->Fighting)
    {
      SendToCharacter ("Not while you fightZ!\r\n",ch);
      return;
    }

  if ( (obj  = GetCarriedObject( vendor, arg1 )) != NULL)
    {
      obj->Cost = atoi (arg2);
      SendToCharacter("The price has been changed\r\n",ch);
      SaveVendor(vendor);
      return;
    }


  SendToCharacter("He doesnt have that item!\r\n",ch);
  SaveVendor(vendor);
}
