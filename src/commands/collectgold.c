#include <time.h>
#include "mud.h"
#include "shops.h"
#include "character.h"

void do_collectgold (Character *ch, char *argument)
{
  Character *vendor;
  Character *ch1;
  long gold;
  char buf [MAX_INPUT_LENGTH];
  char logbuf [MAX_INPUT_LENGTH];
  char name[MAX_INPUT_LENGTH];
  struct tm *tms;

  if ( ( vendor = FindKeeper (ch) ) == NULL )
    {
      return;
    }

  if (vendor->owner == NULL)
    {
      SendToCharacter("thats not a vendor!\r\n",ch);
      return;
    }

  sprintf(name, "%s", vendor->owner);

  if ( (ch1 = GetCharacterInRoom(ch, vendor->owner)) == NULL )
    {
      SendToCharacter ("Trying to steal huh?\r\n",ch);
      return;
    }
  if ( StrCmp( ch1->name, vendor->owner ) )
    {
      SendToCharacter ("Trying to steal huh?\r\n",ch);
      tms = localtime(&current_time);
      tms->tm_hour += 24;
      ch->pcdata->release_date = mktime(tms);
      ch->pcdata->helled_by = CopyString("VendorCheat");
      Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(6));
      Act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
      do_look(ch, "auto");
      ChPrintf(ch, "The immortals are not pleased with your actions.\r\n"
                "You shall remain in hell for 24 Hours.\r\n");
      SaveCharacter(ch);        /* used to save ch, fixed by Thoric 09/17/96 */
      sprintf( logbuf , "%s just tried to abuse the vendor bug!" , ch->name);
      LogPrintf( logbuf );
      return;
    }


  if ( !(ch == ch1) )
    {
      sprintf (buf, "collectgold: %s and ch1 = %s\r\n", name, ch1->name);
      LogPrintf(buf);

      SendToCharacter ("This isnt your vendor!\r\n",ch);
      return;
    }

  if ( ch->fighting)
    {
      SendToCharacter ("Not while you fightZ!\r\n",ch);
      return;
    }

  gold = vendor->gold;
  gold -= (gold * VENDOR_FEE);
  if( vendor->in_room && vendor->in_room->area )
    BoostEconomy( vendor->in_room->area, vendor->gold);
  vendor->gold = 0;
  ch->gold += gold;

  SendToCharacter("&GYour vendor gladly hands over his earnings minus a small fee of course..\r\n",ch);
  Act( AT_ACTION, "$n hands over some money.\r\n", vendor, NULL, NULL, TO_ROOM );
}
