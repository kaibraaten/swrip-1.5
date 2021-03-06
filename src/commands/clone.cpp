#include <array>
#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "systemdata.hpp"

#define CLONEGOLD 1000

void do_clone(std::shared_ptr<Character> ch, std::string argument)
{
    long credits = 0, bank = 0;
    long played = 0, frc_experience = 0;
    std::string clanname;
    std::string bestowments;
    std::array<int, (int)AbilityClass::Max> experience;
    std::array<int, (int)AbilityClass::Max> skill_level;
    short frc = 0, change = 0, change2 = 0, frc_level = 0, low_frc = 0, mana = 0;

    experience.fill(0);
    skill_level.fill(0);

    if (IsNpc(ch))
    {
        ch->Echo("Yeah right!\r\n");
        return;
    }

    if (ch->InRoom->Vnum != ROOM_VNUM_CLONING_PAY_COUNTER)
    {
        ch->Echo("You can't do that here!\r\n");
        return;
    }

    if (ch->PCData->Clones >= 3 && SysData.PermaDeath)
    {
        ch->Echo("The medical droids tell you your genetical material is too far degraded.\r\n");
        return;
    }

    if (ch->Gold < ch->TopLevel() * 200 && SysData.PermaDeath)
    {
        ch->Echo("You don't have enough credits... You need %d.\r\n", ch->TopLevel() * 200);
        return;
    }
    else
    {
        if (SysData.PermaDeath)
        {
            ch->Gold -= ch->TopLevel() * 200;
            ch->Echo("You pay %d credits for cloning.\r\n", ch->TopLevel() * 200);
        }

        ch->Echo("You are escorted into a small room.\r\n\r\n");
    }

    if (SysData.PermaDeath)
    {
        CharacterFromRoom(ch);
        CharacterToRoom(ch, GetRoom(ROOM_VNUM_CLONING_CYLINDER));

        /* random force change on cloning */
        frc = ch->PermStats.Frc;
        mana = ch->Mana.Current;

        /* if character has force, there is a chance of losing force
       depending on the magnitude, the lesser force  the greater chance, as
       well as a slight chance of gaining force, also depending on
       the magnitude of the character's force */

        if (ch->Ability.Main == AbilityClass::Force)
            low_frc = 1;

        if (ch->PermStats.Frc > 0)
        {
            change = GetRandomNumberFromRange(-2, ch->PermStats.Frc);
            change = urange(-2, change, 0);
            change2 = GetRandomNumberFromRange(-1000, ch->PermStats.Frc);
            change2 = urange(0, change2, 1);
            ch->PermStats.Frc = urange(low_frc, ch->PermStats.Frc + change + change2, 20);
        }
        else
        {
            /* a character with no force has a 1/100 chance of gaining it */

            change = GetRandomNumberFromRange(-500, 2);
            change = urange(0, change, 2);
            ch->PermStats.Frc = urange(low_frc, ch->PermStats.Frc + change, 20);
        }

        frc_level = GetAbilityLevel(ch, AbilityClass::Force);
        frc_experience = GetAbilityXP(ch, AbilityClass::Force);

        /* Droids and hunters dont get force. DV */

        if (ch->Ability.Main == AbilityClass::Hunting)
            ch->PermStats.Frc = low_frc;

        if (IsDroid(ch))
            ch->PermStats.Frc = 0;

        if (frc > 0)
        {
            if (ch->PermStats.Frc > 0)
            {
                SetAbilityXP(ch, AbilityClass::Force, 500);
                SetAbilityLevel(ch, AbilityClass::Force, 2);
            }
        }
        else
        {
            SetAbilityXP(ch, AbilityClass::Force, 0);
            SetAbilityLevel(ch, AbilityClass::Force, 1);
        }

        ch->Mana.Current = 100 + 100 * ch->PermStats.Frc;

        auto flags = ch->Flags;

        ch->Flags.reset(Flag::Plr::Killer);
        credits = ch->Gold;

        if (credits <= CLONEGOLD)
        {
            ch->Gold = credits;
            credits = 0;
        }
        else
        {
            ch->Gold = CLONEGOLD;
            credits -= CLONEGOLD;
        }

        played = ch->PCData->Played;
        ch->PCData->Played = ch->PCData->Played / 2;
        bank = ch->PCData->Bank;
        ch->PCData->Bank = 0;
        std::string oldbestowments = ch->PCData->Bestowments;

        if (ch->PCData->Clones == 2)
        {
            ch->Echo("The medical droids tell you your genetic material has degraded significantly.\r\n");

            for (short ability = 0; ability < (int)AbilityClass::Max; ability++)
            {
                experience[ability] = GetAbilityXP(ch, AbilityClass(ability));
                skill_level[ability] = GetAbilityLevel(ch, AbilityClass(ability));
                SetAbilityXP(ch, AbilityClass(ability), 0);
                SetAbilityLevel(ch, AbilityClass(ability), 1);
            }

            experience[(int)AbilityClass::Force] = frc_experience;
            skill_level[(int)AbilityClass::Force] = frc_level;
        }

        ch->Mana.Current = 100 + (ch->PermStats.Frc * 100);

        if (!ch->PCData->ClanInfo.ClanName.empty())
        {
            clanname = ch->PCData->ClanInfo.ClanName;
            ch->PCData->ClanInfo.ClanName.erase();

            bestowments = ch->PCData->Bestowments;
            ch->PCData->Bestowments.erase();

            SaveClone(ch);

            ch->PCData->ClanInfo.ClanName = clanname;
            ch->PCData->Bestowments = bestowments;
        }
        else
        {
            SaveClone(ch);
        }

        ch->PermStats.Frc = frc;

        SetAbilityLevel(ch, AbilityClass::Force, frc_level);
        SetAbilityXP(ch, AbilityClass::Force, frc_experience);
        ch->Mana.Current = mana;

        if (ch->PCData->Clones == 2)
        {
            for (int ability = 0; ability < (int)AbilityClass::Max; ability++)
            {
                SetAbilityXP(ch, AbilityClass(ability), experience[ability]);
                SetAbilityLevel(ch, AbilityClass(ability), skill_level[ability]);
            }
        }

        ch->PCData->Played = played;
        ch->Gold = credits;
        ch->PCData->Bank = bank;
        ch->Flags = flags;
        ch->PCData->Bestowments = oldbestowments;
        ch->HitPoints.Current--;
    }

    CharacterFromRoom(ch);
    CharacterToRoom(ch, GetRoom(ROOM_VNUM_CLONING_CLINIC));
    do_look(ch, "");

    ch->Echo("\r\n&WA small tissue sample is taken from your arm.\r\n");
    ch->Echo("&ROuch!\r\n\r\n");
    ch->Echo("&WYou have been succesfully cloned.\r\n");
}

