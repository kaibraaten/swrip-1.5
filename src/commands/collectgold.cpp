#include <ctime>
#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_collectgold (Character *ch, char *argument)
{
  Character *vendor = NULL;
  Character *ch1 = NULL;
  long gold = 0;
  char buf [MAX_INPUT_LENGTH];
  char logbuf [MAX_INPUT_LENGTH];
  char name[MAX_INPUT_LENGTH];
  struct tm *tms = NULL;

  if ( ( vendor = FindKeeper (ch) ) == NULL )
    {
      return;
    }

  if (vendor->Owner == NULL)
    {
      SendToCharacter("thats not a vendor!\r\n",ch);
      return;
    }

  sprintf(name, "%s", vendor->Owner);

  if ( (ch1 = GetCharacterInRoom(ch, vendor->Owner)) == NULL )
    {
      SendToCharacter ("Trying to steal, huh?\r\n",ch);
      return;
    }
  if ( StrCmp( ch1->Name, vendor->Owner ) )
    {
      SendToCharacter ("Trying to steal, huh?\r\n",ch);
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


  if ( !(ch == ch1) )
    {
      sprintf (buf, "collectgold: %s and ch1 = %s\r\n", name, ch1->Name);
      LogPrintf(buf);

      SendToCharacter ("This isnt your vendor!\r\n",ch);
      return;
    }

  if ( ch->Fighting)
    {
      SendToCharacter ("Not while you fightZ!\r\n",ch);
      return;
    }

  gold = vendor->Gold;
  gold -= (gold * VENDOR_FEE);
  if( vendor->InRoom && vendor->InRoom->Area )
    BoostEconomy( vendor->InRoom->Area, vendor->Gold);
  vendor->Gold = 0;
  ch->Gold += gold;

  SendToCharacter("&GYour vendor gladly hands over his earnings minus a small fee of course..\r\n",ch);
  Act( AT_ACTION, "$n hands over some money.\r\n", vendor, NULL, NULL, TO_ROOM );
}
