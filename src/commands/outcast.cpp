#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"
#include "act.hpp"

void do_outcast(std::shared_ptr<Character> ch, std::string arg)
{
    Character *victim = NULL;
    std::shared_ptr<Clan> clan;

    if(IsNpc(ch) || !IsClanned(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    clan = ch->PCData->ClanInfo.Clan;

    if(IsName("outcast", ch->PCData->Bestowments)
       || !StrCmp(ch->Name, clan->Leadership.Leader)
       || !StrCmp(ch->Name, clan->Leadership.Number1)
       || !StrCmp(ch->Name, clan->Leadership.Number2))
    {
        ;
    }
    else
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Outcast whom?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("That player is not here.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("Kick yourself out of your own clan?\r\n");
        return;
    }

    if(victim->PCData->ClanInfo.Clan != clan)
    {
        ch->Echo("This player does not belong to your clan!\r\n");
        return;
    }


    if(victim->Speaking & LANG_CLAN)
    {
        victim->Speaking = LANG_COMMON;
    }

    RemoveBit(victim->Speaks, LANG_CLAN);

    if(!StrCmp(victim->Name, clan->Leadership.Number1))
    {
        clan->Leadership.Number1.erase();
    }

    if(!StrCmp(victim->Name, clan->Leadership.Number2))
    {
        clan->Leadership.Number2.erase();
    }

    victim->PCData->ClanInfo.Clan = NULL;
    RemoveClanMember(victim);
    victim->PCData->ClanInfo.ClanName.erase();
    Act(AT_MAGIC, "You outcast $N from $t",
        ch, clan->Name, victim, ActTarget::Char);
    Act(AT_MAGIC, "$n outcasts $N from $t",
        ch, clan->Name, victim, ActTarget::Room);
    Act(AT_MAGIC, "$n outcasts you from $t",
        ch, clan->Name, victim, ActTarget::Vict);

    victim->PCData->Bestowments.erase();
    PlayerCharacters->Save(victim);      /* clan gets saved when pfile is saved */
}
