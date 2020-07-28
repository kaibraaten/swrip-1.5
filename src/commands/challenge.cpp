#include "mud.hpp"
#include "arena.hpp"
#include "character.hpp"
#include "timer.hpp"

void do_challenge(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    char buf[MAX_INPUT_LENGTH];

    if((victim = GetCharacterAnywhere(ch, argument)) == NULL)
    {
        ch->Echo("&WThat character is not of these realms!\r\n");
        return;
    }

    if(IsImmortal(ch) || IsImmortal(victim))
    {
        ch->Echo("Sorry, Immortals are not allowed to participate in the arena.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("&WYou cannot challenge mobiles!\r\n");
        return;
    }

    if(victim->Name == ch->Name)
    {
        ch->Echo("&WYou cannot challenge yourself!");
        return;
    }

    if(victim->TopLevel() < 5)
    {
        ch->Echo("&WThat character is too young.\r\n");
        return;
    }

    if((!(ch->TopLevel() - 15 < victim->TopLevel()))
       || (!(ch->TopLevel() + 15 > victim->TopLevel())))
    {
        ch->Echo("&WThat character is out of your level range.\r\n");
        return;
    }

    if(ch->TopLevel() < 5)
    {
        ch->Echo("You are too young to die.\r\n");
        return;
    }

    if(CharactersInArena() > 0)
    {
        ch->Echo("&WSomeone is already in the arena!\r\n");
        return;
    }

    victim->Echo("&R%s &Whas challenged you to a duel!\r\n", ch->Name.c_str());
    victim->Echo("&WPlease either accept or decline the challenge.\r\n\r\n");
    sprintf(buf, "%s has challenged %s to a duel!\r\n", ch->Name.c_str(), victim->Name.c_str());
    ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
    victim->Challenged = ch;
}
