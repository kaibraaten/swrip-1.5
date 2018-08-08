#include <ctime>
#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_pricevendor (Character *ch, char *argument)
{
  Character *vendor = NULL;
  Character *ch1 = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  struct tm *tms = NULL;

  argument = OneArgument (argument, arg1);
  argument = OneArgument (argument, arg2);

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("Syntax: pricevendor <item> <cost>\r\n");
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
      ch->Echo("This isnt your vendor!\r\n");
      return;
    }

  if ( StrCmp( ch1->Name, vendor->Owner ) )
    {
      ch->Echo("Trying to steal huh?\r\n");
      tms = localtime(&current_time);
      tms->tm_hour += 24;
      ch->PCData->ReleaseDate = mktime(tms);
      ch->PCData->HelledBy = CopyString("VendorCheat");
      Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(ROOM_VNUM_HELL));
      Act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
      do_look(ch, "auto");
      ch->Echo("The immortals are not pleased with your actions.\r\n"
                "You shall remain in hell for 24 Hours.\r\n");
      SaveCharacter(ch);        /* used to save ch, fixed by Thoric 09/17/96 */
      Log->Info("%s just tried to abuse the vendor bug!" , ch->Name);
      return;
    }

  if ( ch->Fighting)
    {
      ch->Echo("Not while you fightZ!\r\n");
      return;
    }

  if ( (obj  = GetCarriedObject( vendor, arg1 )) != NULL)
    {
      obj->Cost = atoi (arg2);
      ch->Echo("The price has been changed\r\n");
      SaveVendor(vendor);
      return;
    }


  ch->Echo("He doesnt have that item!\r\n");
  SaveVendor(vendor);
}


