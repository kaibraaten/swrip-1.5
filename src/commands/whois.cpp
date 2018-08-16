#include <string.h>
#include <time.h>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_whois( Character *ch, char *argument)
{
  Character *victim = NULL;
  char buf[MAX_STRING_LENGTH / 2] = {'\0'};
  char buf2[MAX_STRING_LENGTH];

  if(IsNpc(ch))
    return;

  if( IsNullOrEmpty( argument ) )
    {
      ch->Echo("You must input the name of a player online.\r\n");
      return;
    }

  strcat(buf, "0.");
  strcat(buf, argument);

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
                victim->Name,
                victim->Sex == SEX_MALE ? "male" :
                victim->Sex == SEX_FEMALE ? "female" : "neutral",
                NpcRace[victim->Race]);
      ch->Echo(" in room %d.\r\n",
                victim->InRoom->Vnum);
    }
  else
    ch->Echo("%s.\r\n", victim->Name );

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

  if( !IsNullOrEmpty( victim->PCData->HomePage ) )
    ch->Echo("%s's homepage can be found at %s.\r\n",
              victim->Name,
              victim->PCData->HomePage);

  if( !IsNullOrEmpty( victim->PCData->Bio ) )
    ch->Echo("%s's personal bio:\r\n%s",
              victim->Name,
              victim->PCData->Bio);

  if( GetTrustLevel( ch ) >= LEVEL_GREATER )
    {
      ch->Echo("----------------------------------------------------\r\n");

      ch->Echo("Info for immortals:\r\n");

      if ( !IsNullOrEmpty( victim->PCData->AuthedBy ) )
        ch->Echo("%s was authorized by %s.\r\n",
                  victim->Name, victim->PCData->AuthedBy);

      ch->Echo("%s has killed %d mobiles, and been killed by a mobile %d times.\r\n",
                victim->Name, victim->PCData->MKills, victim->PCData->MDeaths );
      if ( victim->PCData->PKills || victim->PCData->PDeaths )
        ch->Echo("%s has killed %d players, and been killed by a player %d times.\r\n",
                  victim->Name, victim->PCData->PKills, victim->PCData->PDeaths );
      if ( victim->PCData->IllegalPk )
        ch->Echo("%s has committed %d illegal player kills.\r\n",
                  victim->Name, victim->PCData->IllegalPk );

      ch->Echo("%s is %shelled at the moment.\r\n",
                victim->Name,
                (victim->PCData->ReleaseDate == 0) ? "not " : "");

      if(victim->PCData->ReleaseDate != 0)
        ch->Echo("%s was helled by %s, and will be released on %24.24s.\r\n",
                  victim->Sex == SEX_MALE ? "He" :
                  victim->Sex == SEX_FEMALE ? "She" : "It",
                  victim->PCData->HelledBy,
                  ctime(&victim->PCData->ReleaseDate));

      if(GetTrustLevel(victim) < GetTrustLevel(ch))
        {
          sprintf(buf2, "list %s", buf);
          do_comment(ch, buf2);
        }

      if(IsBitSet(victim->Flags, PLR_SILENCE) || IsBitSet(victim->Flags, PLR_NO_EMOTE)
         || IsBitSet(victim->Flags, PLR_NO_TELL) )
        {
          sprintf(buf2, "This player has the following flags set:");
          if(IsBitSet(victim->Flags, PLR_SILENCE))
            strcat(buf2, " silence");
          if(IsBitSet(victim->Flags, PLR_NO_EMOTE))
            strcat(buf2, " noemote");
          if(IsBitSet(victim->Flags, PLR_NO_TELL) )
            strcat(buf2, " notell");
          strcat(buf2, ".\r\n");
          ch->Echo(buf2);
        }

      if ( victim->Desc && !IsNullOrEmpty( victim->Desc->Remote.Hostname ) )
        {
          sprintf (buf2, "%s's IP info: %s ", victim->Name, victim->Desc->Remote.HostIP);

          if (GetTrustLevel(ch) > LEVEL_GREATER)
            {
              strcat (buf2, victim->Desc->Remote.Hostname);
            }

	  strcat (buf2, "\r\n");
          ch->Echo(buf2);
        }

      if (GetTrustLevel(ch) >= LEVEL_GREATER && GetTrustLevel(ch) >= GetTrustLevel( victim ) && victim->PCData )
        {
          sprintf (buf2, "Email: %s\r\n" , victim->PCData->Email );
          ch->Echo(buf2);
        }
    }
}
