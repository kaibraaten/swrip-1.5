/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cctype>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "race.hpp"
#include "repos/descriptorrepository.hpp"

std::string DrunkSpeech(const std::string &argument, Character *ch)
{
    const char *arg = argument.c_str();
    char buf[MAX_INPUT_LENGTH * 2] = { '\0' };
    char buf1[MAX_INPUT_LENGTH * 2] = { '\0' };
    int drunk = 0;
    char *txt = NULL;
    char *txt1 = NULL;

    if (IsNpc(ch) || !ch->PCData)
    {
        return argument;
    }

    drunk = ch->PCData->Condition[COND_DRUNK];

    if (drunk <= 0)
    {
        return argument;
    }

    if (argument.empty())
    {
        Log->Bug("%s: NULL argument", __FUNCTION__);
        return "";
    }

    txt = buf;
    txt1 = buf1;

    while (!IsNullOrEmpty(arg))
    {
        if (toupper(*arg) == 'S')
        {
            if (GetRandomPercent() < (drunk * 2))               /* add 'h' after an 's' */
            {
                *txt++ = *arg;
                *txt++ = 'h';
            }
            else
                *txt++ = *arg;
        }
        else if (toupper(*arg) == 'X')
        {
            if (GetRandomPercent() < (drunk * 2 / 2))
            {
                *txt++ = 'c', *txt++ = 's', *txt++ = 'h';
            }
            else
                *txt++ = *arg;
        }
        else if (GetRandomPercent() < (drunk * 2 / 5))  /* slurred letters */
        {
            int slurn = GetRandomNumberFromRange(1, 2);
            int currslur = 0;

            while (currslur < slurn)
            {
                *txt++ = *arg, currslur++;
            }
        }
        else
        {
            *txt++ = *arg;
        }

        arg++;
    }

    *txt = '\0';

    txt = buf;

    while (!IsNullOrEmpty(txt))
    {
        if (GetRandomPercent() < (2 * drunk / 2.5))
        {
            if (isupper(*txt))
                *txt1 = tolower(*txt);
            else
                if (islower(*txt))
                    *txt1 = toupper(*txt);
                else
                    *txt1 = *txt;
        }
        else
            *txt1 = *txt;

        txt1++, txt++;
    }

    *txt1 = '\0';
    txt1 = buf1;
    txt = buf;

    while (!IsNullOrEmpty(txt1))   /* Let's make them stutter */
    {
        if (*txt1 == ' ')  /* If there's a space, then there's gotta be a */
        {                        /* along there somewhere soon */

            while (*txt1 == ' ')  /* Don't stutter on spaces */
                *txt++ = *txt1++;

            if ((GetRandomPercent() < (2 * drunk / 4)) && !IsNullOrEmpty(txt1))
            {
                short offset = GetRandomNumberFromRange(0, 2);
                short pos = 0;

                while (!IsNullOrEmpty(txt1) && pos < offset)
                    *txt++ = *txt1++, pos++;

                if (*txt1 == ' ')  /* Make sure not to stutter a space after */
                {                    /* the initial offset into the word */
                    *txt++ = *txt1++;
                    continue;
                }

                pos = 0;
                offset = GetRandomNumberFromRange(2, 4);

                while (!IsNullOrEmpty(txt1) && pos < offset)
                {
                    *txt++ = *txt1;
                    pos++;
                    if (*txt1 == ' ' || pos == offset)  /* Make sure we don't stick */
                    {                          /* A hyphen right before a space */
                        txt1--;
                        break;
                    }
                    *txt++ = '-';
                }

                if (!IsNullOrEmpty(txt1))
                    txt1++;
            }
        }
        else
            *txt++ = *txt1++;
    }

    *txt = '\0';

    return buf;
}

/*
 * Generic channel function.
 */
void TalkChannel(Character *ch, const std::string &text, int channel, const std::string &verb)
{
    const char *argument = text.c_str();
    char buf[MAX_STRING_LENGTH];
    char buf2[MAX_STRING_LENGTH];
    PositionType position = 0;
    std::shared_ptr<Clan> clan;

    if (channel != CHANNEL_SHOUT && channel != CHANNEL_YELL && channel != CHANNEL_IMMTALK && channel != CHANNEL_OOC
        && channel != CHANNEL_ASK && channel != CHANNEL_NEWBIE && channel != CHANNEL_AVTALK
        && channel != CHANNEL_SHIP && channel != CHANNEL_SYSTEM && channel != CHANNEL_SPACE
        && channel != CHANNEL_103 && channel != CHANNEL_104 && channel != CHANNEL_105)
    {
        if (!HasComlink(ch))
        {
            ch->Echo("You need a comlink to do that!\r\n");
            return;
        }

    }
    else if (IsNpc(ch) && (channel == CHANNEL_CLAN || channel == CHANNEL_ALLCLAN))
    {
        ch->Echo("Mobs can't be in clans.\r\n");
        return;
    }

    if (channel == CHANNEL_CLAN || channel == CHANNEL_ALLCLAN)
    {
        clan = ch->PCData->ClanInfo.Clan;
    }

    if (IsNpc(ch) && channel == CHANNEL_ORDER)
    {
        ch->Echo("Mobs can't be in orders.\r\n");
        return;
    }

    if (IsNpc(ch) && channel == CHANNEL_GUILD)
    {
        ch->Echo("Mobs can't be in guilds.\r\n");
        return;
    }

    if (ch->InRoom->Flags.test(Flag::Room::Silence))
    {
        ch->Echo("You can't do that here.\r\n");
        return;
    }

    if (IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        if (ch->Master != nullptr)
        {
            ch->Master->Echo("I don't think so...\r\n");
        }

        return;
    }

    if (IsNullOrEmpty(argument))
    {
        ch->Echo("%s what?\r\n", Capitalize(verb).c_str());
        return;
    }

    if (!IsNpc(ch) && ch->Flags.test(Flag::Plr::Silence))
    {
        ch->Echo("You can't %s.\r\n", verb.c_str());
        return;
    }

    RemoveBit(ch->Deaf, channel);

    switch (channel)
    {
    default:
        SetCharacterColor(AT_GOSSIP, ch);
        ch->Echo("&z&CYou %s over the public network&c, '&C%s&c'\r\n", verb.c_str(), argument);
        sprintf(buf, "&z&C$n &C%ss over the public network&c, '&C$t&c'", verb.c_str());
        break;

    case CHANNEL_CLANTALK:
        SetCharacterColor(AT_CLAN, ch);
        ch->Echo("&z&POver the organizations private network you say&R, '&P%s&R'\r\n", argument);
        sprintf(buf, "&z&P$n &Pspeaks over the organizations network&R, '&P$t&R'");
        break;

    case CHANNEL_ALLCLAN:
        SetCharacterColor(AT_CLAN, ch);
        ch->Echo("&z&POver the entire organizations private network you say&R, '&P%s&R'\r\n", argument);
        sprintf(buf, "&z&P$n &Pspeaks over the entire organizations network&R, '&P$t&R'");
        break;

    case CHANNEL_SHIP:
        SetCharacterColor(AT_SHIP, ch);
        ch->Echo("&z&rYou tell the ship&P, '%s'\r\n", argument);
        sprintf(buf, "&z&r$n &rsays over the ships com system,&P '$t'");
        break;

    case CHANNEL_SYSTEM:
        SetCharacterColor(AT_GOSSIP, ch);
        ch->Echo("&z&R(System): '&W%s&r'\r\n", argument);
        sprintf(buf, "&z&R(System) &R$n&r: '&W$t&r'");
        break;

    case CHANNEL_SPACE:
        SetCharacterColor(AT_GOSSIP, ch);
        ch->Echo("&z&rYou space &g(&GOOC&g):, '&W%s&r'\r\n", argument);
        sprintf(buf, "&z&g(&GOOC&g)&R(Space) &R$n&r: '&W$t&r'");
        break;

    case CHANNEL_YELL:
    case CHANNEL_SHOUT:
        SetCharacterColor(AT_GOSSIP, ch);
        ch->Echo("You %s, '%s'\r\n", verb.c_str(), argument);
        sprintf(buf, "$n %ss, '$t'", verb.c_str());
        break;

    case CHANNEL_ASK:
        SetCharacterColor(AT_OOC, ch);
        ch->Echo("&z&g(&GOOC&g)&Y You %s, '%s'\r\n", verb.c_str(), argument);
        sprintf(buf, "&z&g(&GOOC&g)&Y $n &Y%ss, '$t'", verb.c_str());
        break;

    case CHANNEL_NEWBIE:
        SetCharacterColor(AT_OOC, ch);
        ch->Echo("&z&r(&RNEWBIE&r)&Y %s: %s\r\n", ch->Name.c_str(), argument);
        sprintf(buf, "&z&r(&RNEWBIE&r)&Y $n&Y: $t");
        break;

    case CHANNEL_OOC:
        SetCharacterColor(AT_OOC, ch);
        sprintf(buf, "&z&g(&GOOC&g)&Y $n&Y: $t");
        position = ch->Position;
        ch->Position = POS_STANDING;
        Act(AT_OOC, buf, ch, argument, NULL, TO_CHAR);
        ch->Position = position;
        break;

    case CHANNEL_WARTALK:
        SetCharacterColor(AT_WARTALK, ch);
        ch->Echo("&z&cYou %s '&R%s&c'\r\n", verb.c_str(), argument);
        sprintf(buf, "&z&c$n &c%ss '&R$t&c'", verb.c_str());
        break;

    case CHANNEL_AVTALK:
    case CHANNEL_IMMTALK:
    case CHANNEL_103:
    case CHANNEL_104:
    case CHANNEL_105:
        if (channel == CHANNEL_AVTALK)
        {
            sprintf(buf, "$n&c: $t");
        }
        else if (channel == CHANNEL_IMMTALK)
        {
            sprintf(buf, "$n&Y>&W $t");
        }
        else if (channel == CHANNEL_103)
        {
            sprintf(buf, "&z&Y(&Wi103&Y)&W $n&Y>&W $t");
        }
        else if (channel == CHANNEL_104)
        {
            sprintf(buf, "&z&Y(&Wi104&Y)&W $n&Y>&W $t");
        }
        else if (channel == CHANNEL_105)
        {
            sprintf(buf, "&z&Y(&Wi105&Y)&W $n&Y>&W $t");
        }

        position = ch->Position;
        ch->Position = POS_STANDING;
        Act(channel == CHANNEL_AVTALK ? AT_AVATAR : AT_IMMORT, buf, ch, argument, NULL, TO_CHAR);
        ch->Position = position;
        break;
    }

    if (ch->InRoom->Flags.test(Flag::Room::LogSpeech))
    {
        sprintf(buf2, "%s: %s (%s)", IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str(),
            argument, verb.c_str());
        AppendToFile(LOG_FILE, buf2);
    }

    for (auto d : Descriptors)
    {
        Character *och = d->Original ? d->Original : d->Character;
        Character *vch = d->Character;

        if (d->ConnectionState == CON_PLAYING
            && vch != ch
            && !IsBitSet(och->Deaf, channel))
        {
            std::string sbuf = argument;

            if (channel != CHANNEL_SHOUT && channel != CHANNEL_YELL && channel != CHANNEL_IMMTALK && channel != CHANNEL_OOC
                && channel != CHANNEL_ASK && channel != CHANNEL_NEWBIE && channel != CHANNEL_AVTALK
                && channel != CHANNEL_SHIP && channel != CHANNEL_SYSTEM && channel != CHANNEL_SPACE
                && channel != CHANNEL_103 && channel != CHANNEL_104 && channel != CHANNEL_105
                )
            {
                if (!HasComlink(ch))
                {
                    continue;
                }
            }

            if (channel == CHANNEL_IMMTALK && !IsImmortal(och))
                continue;
            if (channel == CHANNEL_103 && och->TopLevel < 103)
                continue;
            if (channel == CHANNEL_104 && och->TopLevel < 104)
                continue;
            if (channel == CHANNEL_105 && och->TopLevel < 105)
                continue;
            if (channel == CHANNEL_WARTALK && !IsAuthed(och))
                continue;
            if (channel == CHANNEL_AVTALK && !IsAvatar(och))
                continue;

            if (vch->InRoom->Flags.test(Flag::Room::Silence))
            {
                continue;
            }

            if (channel == CHANNEL_YELL || channel == CHANNEL_SHOUT)
            {
                if (ch->InRoom != och->InRoom)
                    continue;
            }

            if (channel == CHANNEL_ALLCLAN || channel == CHANNEL_CLAN || channel == CHANNEL_ORDER
                || channel == CHANNEL_GUILD)
            {

                if (IsNpc(vch))
                    continue;

                if (!vch->PCData->ClanInfo.Clan)
                    continue;

                if (channel != CHANNEL_ALLCLAN && vch->PCData->ClanInfo.Clan != clan)
                    continue;

                if (channel == CHANNEL_ALLCLAN
                    && vch->PCData->ClanInfo.Clan != clan
                    && vch->PCData->ClanInfo.Clan->MainClan != clan
                    && clan->MainClan != vch->PCData->ClanInfo.Clan
                    && (!vch->PCData->ClanInfo.Clan->MainClan
                        || !clan->MainClan
                        || vch->PCData->ClanInfo.Clan->MainClan != clan->MainClan))
                    continue;
            }

            if (channel == CHANNEL_SHIP || channel == CHANNEL_SPACE || channel == CHANNEL_SYSTEM)
            {
                std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);
                std::shared_ptr<Ship> target;

                if (!ship)
                    continue;

                if (!vch->InRoom)
                    continue;

                if (channel == CHANNEL_SHIP)
                    if (vch->InRoom->Vnum > ship->Rooms.Last
                        || vch->InRoom->Vnum < ship->Rooms.First)
                        continue;

                target = GetShipFromCockpit(vch->InRoom->Vnum);

                if (!target)
                    continue;

                if (channel == CHANNEL_SYSTEM)
                    if (!IsShipInCombatRange(ship, target))
                        continue;

                if (GetShipDistanceToShip(target, ship) > 100 * (ship->Instruments.Sensor + 10) * ((target->Class) + 1)
                    && GetShipDistanceToShip(target, ship) > 100 * (ship->Instruments.Comm + target->Instruments.Comm + 20))
                {
                    continue;
                }
            }

            position = vch->Position;

            if (channel != CHANNEL_SHOUT && channel != CHANNEL_YELL)
                vch->Position = POS_STANDING;

            if (!CharacterKnowsLanguage(vch, ch->Speaking, ch) &&
                (!IsNpc(ch) || ch->Speaking != 0) &&
                (channel != CHANNEL_NEWBIE &&
                    channel != CHANNEL_OOC &&
                    channel != CHANNEL_AUCTION &&
                    channel != CHANNEL_ASK &&
                    channel != CHANNEL_AVTALK
                    ))
                sbuf = Scramble(argument, ch->Speaking);

            MOBtrigger = false;

            if (channel == CHANNEL_IMMTALK || channel == CHANNEL_AVTALK
                || channel == CHANNEL_103 || channel == CHANNEL_104 || channel == CHANNEL_105)
                Act(channel == CHANNEL_AVTALK ? AT_AVATAR : AT_IMMORT, buf, ch, sbuf.c_str(), vch, TO_VICT);
            else if (channel == CHANNEL_WARTALK)
                Act(AT_WARTALK, buf, ch, sbuf.c_str(), vch, TO_VICT);
            else if (channel == CHANNEL_OOC || channel == CHANNEL_NEWBIE || channel == CHANNEL_ASK)
                Act(AT_OOC, buf, ch, sbuf.c_str(), vch, TO_VICT);
            else if (channel == CHANNEL_SHIP)
                Act(AT_SHIP, buf, ch, sbuf.c_str(), vch, TO_VICT);
            else if (channel == CHANNEL_CLAN)
                Act(AT_CLAN, buf, ch, sbuf.c_str(), vch, TO_VICT);
            else
                Act(AT_GOSSIP, buf, ch, sbuf.c_str(), vch, TO_VICT);
            vch->Position = position;
        }
    }
}

void ToChannel(const std::string &argument, int channel, const std::string &verb, short level)
{
    char buf[MAX_STRING_LENGTH];

    if (Descriptors->Count() == 0 || argument.empty())
        return;

    sprintf(buf, "%s: %s\r\n", verb.c_str(), argument.c_str());

    for (auto d : Descriptors)
    {
        Character *och = d->Original ? d->Original : d->Character;
        Character *vch = d->Character;

        if (!och || !vch)
            continue;

        if ((!IsImmortal(vch) && channel != CHANNEL_ARENA)
            || (vch->TopLevel < SysData.LevelOfBuildChannel && channel == CHANNEL_BUILD)
            || (vch->TopLevel < SysData.LevelOfLogChannel
                && (channel == CHANNEL_LOG || channel == CHANNEL_COMM)))
        {
            continue;
        }

        if (d->ConnectionState == CON_PLAYING
            && !IsBitSet(och->Deaf, channel)
            && vch->TopLevel >= level)
        {
            SetCharacterColor(AT_LOG, vch);
            vch->Echo("%s", buf);
        }
    }
}

/*
 * Something from original DikuMUD that Merc yanked out.
 * Used to prevent following loops, which can cause problems if people
 * follow in a loop through an exit leading back into the same room
 * (Which exists in many maze areas)                    -Thoric
 */
bool IsFollowingInCircle(const Character *ch, const Character *victim)
{
    const Character *tmp;

    for (tmp = victim; tmp; tmp = tmp->Master)
        if (tmp == ch)
            return true;

    return false;
}

void StartFollowing(Character *ch, Character *master)
{
    if (ch->Master)
    {
        Log->Bug("%s: non-null master.", __FUNCTION__);
        return;
    }

    ch->Master = master;
    ch->Leader = NULL;

    if (IsNpc(ch) && ch->Flags.test(Flag::Mob::Pet) && !IsNpc(master))
    {
        master->PCData->Pet = ch;
    }

    if (CanSeeCharacter(master, ch))
    {
        Act(AT_ACTION, "$n now follows you.", ch, NULL, master, TO_VICT);
    }

    Act(AT_ACTION, "You now follow $N.", ch, NULL, master, TO_CHAR);
}

void StopFollowing(Character *ch)
{
    if (!ch->Master)
    {
        Log->Bug("%s: null master.", __FUNCTION__);
        return;
    }

    if (IsNpc(ch) && !IsNpc(ch->Master) && ch->Master->PCData->Pet == ch)
    {
        ch->Master->PCData->Pet = NULL;
    }

    if (IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->AffectedBy.reset(Flag::Affect::Charm);
        StripAffect(ch, gsn_charm_person);
    }

    if (CanSeeCharacter(ch->Master, ch))
    {
        Act(AT_ACTION, "$n stops following you.", ch, NULL, ch->Master, TO_VICT);
    }

    Act(AT_ACTION, "You stop following $N.", ch, NULL, ch->Master, TO_CHAR);

    ch->Master = NULL;
    ch->Leader = NULL;
}

void DieFollower(Character *ch)
{
    Character *fch = NULL;

    if (ch->Master)
    {
        StopFollowing(ch);
    }

    ch->Leader = NULL;

    for (fch = FirstCharacter; fch; fch = fch->Next)
    {
        if (fch->Master == ch)
        {
            StopFollowing(fch);
        }

        if (fch->Leader == ch)
        {
            fch->Leader = fch;
        }
    }
}

/*
 * It is very important that this be an equivalence relation:
 * (1) A ~ A
 * (2) if A ~ B then B ~ A
 * (3) if A ~ B  and B ~ C, then A ~ C
 */
bool IsInSameGroup(const Character *ach, const Character *bch)
{
    if (ach->Leader)
        ach = ach->Leader;

    if (bch->Leader)
        bch = bch->Leader;

    return ach == bch;
}

/*
 * this function sends raw argument over the AUCTION: channel
 * I am not too sure if this method is right..
 */

void TalkAuction(const std::string &argument)
{
    char buf[MAX_STRING_LENGTH];

    sprintf(buf, "Auction: %s", argument.c_str()); /* last %s to reset color */

    for (auto d : Descriptors)
    {
        Character *original = d->Original ? d->Original : d->Character; /* if switched */

        if ((d->ConnectionState == CON_PLAYING)
            && !IsBitSet(original->Deaf, CHANNEL_AUCTION)
            && !original->InRoom->Flags.test(Flag::Room::Silence)
            && IsAuthed(original))
        {
            Act(AT_GOSSIP, buf, original, NULL, NULL, TO_CHAR);
        }
    }
}

/*
 * Language support functions. -- Altrag
 * 07/01/96
 */
bool CharacterKnowsLanguage(const Character *ch, int language, const Character *cch)
{
    short sn;

    if (!IsNpc(ch) && IsImmortal(ch))
        return true;
    if (IsNpc(ch) && !ch->Speaks) /* No langs = knows all for npcs */
        return true;
    if (IsNpc(ch) && IsBitSet(ch->Speaks, (language & ~LANG_CLAN)))
        return true;
    /* everyone does not KNOW common tongue
       if ( IsBitSet(language, LANG_COMMON) )
       return true;
    */
    if (language & LANG_CLAN)
    {
        /* Clan = common for mobs.. snicker.. -- Altrag */
        if (IsNpc(ch) || IsNpc(cch))
            return true;
        if (ch->PCData->ClanInfo.Clan == cch->PCData->ClanInfo.Clan
            && ch->PCData->ClanInfo.Clan != nullptr)
            return true;
    }
    if (!IsNpc(ch))
    {
        /* Racial languages for PCs */
        if (IsBitSet(RaceTable[ch->Race].Language, language))
            return true;

        for (int lang = 0; LanguageArray[lang] != LANG_UNKNOWN; lang++)
            if (IsBitSet(language, LanguageArray[lang]) &&
                IsBitSet(ch->Speaks, LanguageArray[lang]))
            {
                if ((sn = LookupSkill(LanguageNames[lang])) != -1)
                {
                    if (GetRandomPercent() - 1 < ch->PCData->Learned[sn])
                        return true;
                }
            }
    }
    return false;
}

bool CharacterCanLearnLanguage(const Character *ch, int language)
{
    if (language & LANG_CLAN)
        return false;
    if (IsNpc(ch) || IsImmortal(ch))
        return false;
    if (RaceTable[ch->Race].Language & language)
        return false;
    if (ch->Speaks & language)
    {
        int lang;

        for (lang = 0; LanguageArray[lang] != LANG_UNKNOWN; lang++)
            if (language & LanguageArray[lang])
            {
                int sn;

                if (!IsValidLanguage(LanguageArray[lang]))
                    return false;

                if ((sn = LookupSkill(LanguageNames[lang])) < 0)
                {
                    Log->Bug("Can_learn_lang: valid language without sn: %d", lang);
                    continue;
                }

                if (ch->PCData->Learned[sn] >= 99)
                    return false;
            }
    }

    if (IsValidLanguage(language))
        return true;

    return false;
}

/* Note: does not count racial language.  This is intentional (for now). */
int CountLanguages(int languages)
{
    int numlangs = 0;
    int looper = 0;

    for (looper = 0; LanguageArray[looper] != LANG_UNKNOWN; looper++)
    {
        if (LanguageArray[looper] == LANG_CLAN)
        {
            continue;
        }

        if (languages & LanguageArray[looper])
        {
            numlangs++;
        }
    }

    return numlangs;
}

