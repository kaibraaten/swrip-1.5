#include "mud.h"
#include "arena.h"
#include "character.h"

void do_challenge(Character *ch, char *argument)
{
  Character *victim;
  char buf[MAX_INPUT_LENGTH];

  if ( ( victim = get_char_world( ch, argument ) ) == NULL)
    {
      send_to_char("&WThat character is not of these realms!\r\n",ch);
      return;
    }

  if (IsImmortal(ch) || IsImmortal(victim))
    {
      send_to_char("Sorry, Immortals are not allowed to participate in the arena.\r\n",ch);
      return;
    }

  if (IsNpc(victim))
    {
      send_to_char("&WYou cannot challenge mobiles!\r\n",ch);
      return;
    }

  if (victim->name == ch->name)
    {
      send_to_char("&WYou cannot challenge yourself!",ch);
      return;
    }

  if (victim->top_level < 5)
    {
      send_to_char("&WThat character is too young.\r\n",ch);
      return;
    }

  if ( ( !( ch->top_level - 15 < victim->top_level) )
       || ( !(ch->top_level + 15 > victim->top_level) ) )
    {
      send_to_char("&WThat character is out of your level range.\r\n",ch);
      return;
    }

  if (get_timer(victim,TIMER_PKILLED)>0)
    {
      send_to_char("&WThat player has died within the last 5 minutes and cannot be challenged!\r\n",ch);
      return;
    }

  if ( victim->top_level < 5 )
    {
      send_to_char("You are too young to die.\r\n",ch);
      return;
    }

  if (get_timer(ch,TIMER_PKILLED)>0)
    {
      send_to_char("&WYou have died within the last 5 minutes and cannot challenge anyone.\r\n",ch);
      return;
    }

  if (num_in_arena()>0)
    {
      send_to_char("&WSomeone is already in the arena!\r\n",ch);
      return;
    }
  sprintf(buf,"&R%s &Whas challenged you to a dual!\r\n",ch->name);
  send_to_char(buf,victim);
  send_to_char("&WPlease either accept or decline the challenge.\r\n\r\n",victim);
  sprintf(buf,"%s has challenged %s to a dual!!\r\n",ch->name,victim->name);
  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
  victim->challenged = ch;
}
