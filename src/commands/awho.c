#include "character.h"
#include "mud.h"
#include "arena.h"

void do_awho(Character *ch, char *argument)
{
  Character *tch;
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];
  int num=CharactersInArena();

  if(num==0)
    {
      SendToCharacter("There is noone in the arena right now.\r\n", ch);
      return;
    }

  sprintf(buf,"&W  Players in the &BRise in Power&W Arena\r\n");
  sprintf(buf,"%s-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-", buf);
  sprintf(buf,"%s&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-\r\n", buf);
  sprintf(buf,"%sGame Length = &R%-3d   &WTime To Start &R%-3d\r\n", buf, arena.GameLength, arena.TimeToStart);
  sprintf(buf,"%s&WLevel Limits &R%d &Wto &R%d\r\n", buf, arena.MinLevel, arena.MaxLevel);
  sprintf(buf,"%s         &WJackpot = &R%d\r\n", buf, arena.ArenaPot);
  sprintf(buf,"%s&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B", buf);
  sprintf(buf,"%s-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B\r\n", buf);
  SendToCharacter(buf, ch);

  for ( tch = FirstCharacter; tch; tch = tch->Next )
    if (tch->InRoom && IsBitSet(tch->InRoom->Flags, ROOM_ARENA)
        && (tch->TopLevel < LEVEL_IMMORTAL))
      {
        sprintf(buf2, "&W%s\r\n", tch->Name);
        SendToCharacter(buf2,ch);
      }
}
