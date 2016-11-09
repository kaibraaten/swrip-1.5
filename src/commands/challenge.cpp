#include "mud.hpp"
#include "arena.hpp"
#include "character.hpp"

void do_challenge(Character *ch, std::string argument)
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

  if (victim->Name == ch->Name)
    {
      SendToCharacter("&WYou cannot challenge yourself!",ch);
      return;
    }

  if (victim->TopLevel < 5)
    {
      SendToCharacter("&WThat character is too young.\r\n",ch);
      return;
    }

  if ( ( !( ch->TopLevel - 15 < victim->TopLevel) )
       || ( !(ch->TopLevel + 15 > victim->TopLevel) ) )
    {
      SendToCharacter("&WThat character is out of your level range.\r\n",ch);
      return;
    }

  if (GetTimer(victim,TIMER_PKILLED)>0)
    {
      SendToCharacter("&WThat player has died within the last 5 minutes and cannot be challenged!\r\n",ch);
      return;
    }

  if ( victim->TopLevel < 5 )
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
  sprintf(buf,"&R%s &Whas challenged you to a dual!\r\n",ch->Name);
  SendToCharacter(buf,victim);
  SendToCharacter("&WPlease either accept or decline the challenge.\r\n\r\n",victim);
  sprintf(buf,"%s has challenged %s to a dual!!\r\n",ch->Name,victim->Name);
  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
  victim->Challenged = ch;
}
