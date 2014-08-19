#include "mud.h"
#include "arena.h"
#include "character.h"

void do_challenge(Character *ch, char *argument)
{
  Character *victim;
  char buf[MAX_INPUT_LENGTH];

  if ( ( victim = GetCharacterAnywhere( ch, argument ) ) == NULL)
    {
      SendToCharacter("&WThat character is not of these realms!\r\n",ch);
      return;
    }

  if (IsImmortal(ch) || IsImmortal(victim))
    {
      SendToCharacter("Sorry, Immortals are not allowed to participate in the arena.\r\n",ch);
      return;
    }

  if (IsNpc(victim))
    {
      SendToCharacter("&WYou cannot challenge mobiles!\r\n",ch);
      return;
    }

  if (victim->name == ch->name)
    {
      SendToCharacter("&WYou cannot challenge yourself!",ch);
      return;
    }

  if (victim->top_level < 5)
    {
      SendToCharacter("&WThat character is too young.\r\n",ch);
      return;
    }

  if ( ( !( ch->top_level - 15 < victim->top_level) )
       || ( !(ch->top_level + 15 > victim->top_level) ) )
    {
      SendToCharacter("&WThat character is out of your level range.\r\n",ch);
      return;
    }

  if (GetTimer(victim,TIMER_PKILLED)>0)
    {
      SendToCharacter("&WThat player has died within the last 5 minutes and cannot be challenged!\r\n",ch);
      return;
    }

  if ( victim->top_level < 5 )
    {
      SendToCharacter("You are too young to die.\r\n",ch);
      return;
    }

  if (GetTimer(ch,TIMER_PKILLED)>0)
    {
      SendToCharacter("&WYou have died within the last 5 minutes and cannot challenge anyone.\r\n",ch);
      return;
    }

  if (CharactersInArena()>0)
    {
      SendToCharacter("&WSomeone is already in the arena!\r\n",ch);
      return;
    }
  sprintf(buf,"&R%s &Whas challenged you to a dual!\r\n",ch->name);
  SendToCharacter(buf,victim);
  SendToCharacter("&WPlease either accept or decline the challenge.\r\n\r\n",victim);
  sprintf(buf,"%s has challenged %s to a dual!!\r\n",ch->name,victim->name);
  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
  victim->challenged = ch;
}
