#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"

void do_whois( Character *ch, char *argument)
{
  Character *victim;
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf2[MAX_STRING_LENGTH];

  if(IsNpc(ch))
    return;

  if(argument[0] == '\0')
    {
      SendToCharacter("You must input the name of a player online.\r\n", ch);
      return;
    }

  strcat(buf, "0.");
  strcat(buf, argument);

  if( ( ( victim = GetCharacterAnywhere(ch, buf) ) == NULL ))
    {
      SendToCharacter("No such player online.\r\n", ch);
      return;
    }

  if(IsNpc(victim))
    {
      SendToCharacter("That's not a player!\r\n", ch);
      return;
    }

  if( victim->pcdata
      && victim->pcdata->whoCloak
      && ch->top_level < LEVEL_IMMORTAL )
    {
      SendToCharacter("No such player online.\r\n", ch);
      return;
    }

  if (IsGreater(ch))
    {
      Echo(ch, "%s is a %s %s",
                victim->name,
                victim->sex == SEX_MALE ? "male" :
                victim->sex == SEX_FEMALE ? "female" : "neutral",
                npc_race[victim->race]);
      Echo(ch, " in room %d.\r\n",
                victim->in_room->vnum);
    }
  else
    Echo(ch, "%s.\r\n",
              victim->name );

  if ( victim->pcdata->clan && ( ( ch->pcdata->clan
                                   && ch->pcdata->clan == victim->pcdata->clan )
                                 || IsImmortal( ch ) ) )
    {
      if ( victim->pcdata->clan->clan_type == CLAN_CRIME )
        SendToCharacter( ", and belongs to the crime family ", ch );
      else if ( victim->pcdata->clan->clan_type == CLAN_GUILD )
        SendToCharacter( ", and belongs to the guild ", ch );
      else
        SendToCharacter( ", and belongs to organization ", ch );
      SendToCharacter( victim->pcdata->clan->name, ch );
    }
  SendToCharacter( ".\r\n", ch );

  if(victim->pcdata->homepage && victim->pcdata->homepage[0] != '\0')
    Echo(ch, "%s's homepage can be found at %s.\r\n",
              victim->name,
              victim->pcdata->homepage);

  if(victim->pcdata->bio && victim->pcdata->bio[0] != '\0')
    Echo(ch, "%s's personal bio:\r\n%s",
              victim->name,
              victim->pcdata->bio);

  if( GetTrustLevel( ch ) >= LEVEL_GREATER )
    {
      SendToCharacter("----------------------------------------------------\r\n", ch);

      SendToCharacter("Info for immortals:\r\n", ch);

      if ( victim->pcdata->authed_by && victim->pcdata->authed_by[0] != '\0' )
        Echo(ch, "%s was authorized by %s.\r\n",
                  victim->name, victim->pcdata->authed_by);

      Echo(ch, "%s has killed %d mobiles, and been killed by a mobile %d times.\r\n",
                victim->name, victim->pcdata->mkills, victim->pcdata->mdeaths );
      if ( victim->pcdata->pkills || victim->pcdata->pdeaths )
        Echo(ch, "%s has killed %d players, and been killed by a player %d times.\r\n",
                  victim->name, victim->pcdata->pkills, victim->pcdata->pdeaths );
      if ( victim->pcdata->illegal_pk )
        Echo(ch, "%s has committed %d illegal player kills.\r\n",
                  victim->name, victim->pcdata->illegal_pk );

      Echo(ch, "%s is %shelled at the moment.\r\n",
                victim->name,
                (victim->pcdata->release_date == 0) ? "not " : "");

      if(victim->pcdata->release_date != 0)
        Echo(ch, "%s was helled by %s, and will be released on %24.24s.\r\n",
                  victim->sex == SEX_MALE ? "He" :
                  victim->sex == SEX_FEMALE ? "She" : "It",
                  victim->pcdata->helled_by,
                  ctime(&victim->pcdata->release_date));

      if(GetTrustLevel(victim) < GetTrustLevel(ch))
        {
          sprintf(buf2, "list %s", buf);
          do_comment(ch, buf2);
        }

      if(IsBitSet(victim->act, PLR_SILENCE) || IsBitSet(victim->act, PLR_NO_EMOTE)
         || IsBitSet(victim->act, PLR_NO_TELL) )
        {
          sprintf(buf2, "This player has the following flags set:");
          if(IsBitSet(victim->act, PLR_SILENCE))
            strcat(buf2, " silence");
          if(IsBitSet(victim->act, PLR_NO_EMOTE))
            strcat(buf2, " noemote");
          if(IsBitSet(victim->act, PLR_NO_TELL) )
            strcat(buf2, " notell");
          strcat(buf2, ".\r\n");
          SendToCharacter(buf2, ch);
        }

      if ( victim->desc && victim->desc->remote.hostname[0]!='\0' )   /* added by Gorog */
        {
          sprintf (buf2, "%s's IP info: %s ", victim->name, victim->desc->remote.hostip);
          if (GetTrustLevel(ch) > LEVEL_GREATER)
            {
              strcat (buf2, victim->desc->remote.hostname);
            }
          strcat (buf2, "\r\n");
          SendToCharacter(buf2, ch);
        }

      if (GetTrustLevel(ch) >= LEVEL_GREATER && GetTrustLevel(ch) >= GetTrustLevel( victim ) && victim->pcdata )
        {
          sprintf (buf2, "Email: %s\r\n" , victim->pcdata->email );
          SendToCharacter(buf2, ch);
        }
    }
}
