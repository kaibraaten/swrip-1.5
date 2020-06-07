#include <string.h>
#include <time.h>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "descriptor.hpp"

void do_whois( Character *ch, std::string argument)
{
    Character *victim = NULL;
    char buf[MAX_STRING_LENGTH / 2] = {'\0'};
    char buf2[MAX_STRING_LENGTH] = {'\0'};

    if(IsNpc(ch))
        return;

    if( argument.empty() )
    {
        ch->Echo("You must input the name of a player online.\r\n");
        return;
    }

    strcat(buf, "0.");
    strcat(buf, argument.c_str());

    if( ( ( victim = GetCharacterAnywhere(ch, buf) ) == NULL ))
    {
        ch->Echo("No such player online.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("That's not a player!\r\n");
        return;
    }

    if( victim->PCData
        && victim->PCData->WhoCloak
        && ch->TopLevel < LEVEL_IMMORTAL )
    {
        ch->Echo("No such player online.\r\n");
        return;
    }

    if (IsGreater(ch))
    {
        ch->Echo("%s is a %s %s",
                 victim->Name.c_str(),
                 SexNames[victim->Sex],
                 NpcRace[victim->Race]);
        ch->Echo(" in room %ld.\r\n",
                 victim->InRoom->Vnum);
    }
    else
    {
        ch->Echo("%s.\r\n", victim->Name.c_str() );
    }
    
    if ( IsClanned( victim )
         && ( ( IsClanned( ch )
                && ch->PCData->ClanInfo.Clan == victim->PCData->ClanInfo.Clan )
              || IsImmortal( ch ) ) )
    {
        if ( victim->PCData->ClanInfo.Clan->Type == CLAN_GUILD )
            ch->Echo(", and belongs to the guild ");
        else
            ch->Echo(", and belongs to organization ");
        ch->Echo(victim->PCData->ClanInfo.Clan->Name);
    }
    ch->Echo(".\r\n");

    if( !victim->PCData->HomePage.empty() )
        ch->Echo("%s's homepage can be found at %s.\r\n",
                 victim->Name.c_str(),
                 victim->PCData->HomePage.c_str());

    if( !victim->PCData->Bio.empty() )
        ch->Echo("%s's personal bio:\r\n%s",
                 victim->Name.c_str(),
                 victim->PCData->Bio.c_str());

    if( GetTrustLevel( ch ) >= LEVEL_GREATER )
    {
        ch->Echo("----------------------------------------------------\r\n");

        ch->Echo("Info for immortals:\r\n");

        if ( !victim->PCData->AuthedBy.empty() )
            ch->Echo("%s was authorized by %s.\r\n",
                     victim->Name.c_str(), victim->PCData->AuthedBy.c_str());

        ch->Echo("%s has killed %d mobiles, and been killed by a mobile %d times.\r\n",
                 victim->Name.c_str(), victim->PCData->MKills, victim->PCData->MDeaths );
        if ( victim->PCData->PKills || victim->PCData->PDeaths )
            ch->Echo("%s has killed %d players, and been killed by a player %d times.\r\n",
                     victim->Name.c_str(), victim->PCData->PKills, victim->PCData->PDeaths );
        if ( victim->PCData->IllegalPk )
            ch->Echo("%s has committed %d illegal player kills.\r\n",
                     victim->Name.c_str(), victim->PCData->IllegalPk );

        ch->Echo("%s is %shelled at the moment.\r\n",
                 victim->Name.c_str(),
                 (victim->PCData->ReleaseDate == 0) ? "not " : "");

        if(victim->PCData->ReleaseDate != 0)
            ch->Echo("%s was helled by %s, and will be released on %24.24s.\r\n",
                     victim->Sex == SEX_MALE ? "He" :
                     victim->Sex == SEX_FEMALE ? "She" : "It",
                     victim->PCData->HelledBy.c_str(),
                     ctime(&victim->PCData->ReleaseDate));

        if(GetTrustLevel(victim) < GetTrustLevel(ch))
        {
            sprintf(buf2, "list %s", buf);
            do_comment(ch, buf2);
        }

        if(victim->Flags.test(Flag::Plr::Silence)
           || victim->Flags.test(Flag::Plr::NoEmote)
           || victim->Flags.test(Flag::Plr::NoTell))
        {
            sprintf(buf2, "This player has the following flags set:");

            if(victim->Flags.test(Flag::Plr::Silence))
                strcat(buf2, " silence");

            if(victim->Flags.test(Flag::Plr::NoEmote))
                strcat(buf2, " noemote");

            if(victim->Flags.test(Flag::Plr::NoTell))
                strcat(buf2, " notell");

            strcat(buf2, ".\r\n");
            ch->Echo("%s", buf2);
        }

        if ( victim->Desc && !victim->Desc->Remote.Hostname.empty() )
        {
            sprintf(buf2, "%s's IP info: %s ",
                    victim->Name.c_str(), victim->Desc->Remote.HostIP.c_str());

            if (GetTrustLevel(ch) > LEVEL_GREATER)
            {
                strcat(buf2, victim->Desc->Remote.Hostname.c_str());
            }

            strcat( buf2, "\r\n" );
            ch->Echo("%s", buf2);
        }

        if (GetTrustLevel(ch) >= LEVEL_GREATER
            && GetTrustLevel(ch) >= GetTrustLevel( victim )
            && victim->PCData )
        {
            sprintf (buf2, "Email: %s\r\n" , victim->PCData->Email.c_str() );
            ch->Echo("%s", buf2);
        }
    }
}
