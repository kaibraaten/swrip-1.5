#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"
#include "clan.h"

void do_whois( Character *ch, char *argument)
{
  Character *victim;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];

  buf[0] = '\0';

  if(IsNpc(ch))
    return;

  if(argument[0] == '\0')
    {
      send_to_char("You must input the name of a player online.\r\n", ch);
      return;
    }

  strcat(buf, "0.");
  strcat(buf, argument);

  if( ( ( victim = get_char_world(ch, buf) ) == NULL ))
    {
      send_to_char("No such player online.\r\n", ch);
      return;
    }

  if(IsNpc(victim))
    {
      send_to_char("That's not a player!\r\n", ch);
      return;
    }

  if( victim->pcdata
      && victim->pcdata->whoCloak
      && ch->top_level < LEVEL_IMMORTAL )
    {
      send_to_char("No such player online.\r\n", ch);
      return;
    }

  if (is_god(ch))
    {
      ch_printf(ch, "%s is a %s %s",
                victim->name,
                victim->sex == SEX_MALE ? "male" :
                victim->sex == SEX_FEMALE ? "female" : "neutral",
                npc_race[victim->race]);
      ch_printf(ch, " in room %d.\r\n",
                victim->in_room->vnum);
    }
  else
    ch_printf(ch, "%s.\r\n",
              victim->name );

  if ( is_clanned( victim )
       && ( ( is_clanned( ch ) && ch->pcdata->clan == victim->pcdata->clan )
	    || IsImmortal( ch ) ) )
    {
      if ( victim->pcdata->clan->clan_type == CLAN_CRIME )
        send_to_char( ", and belongs to the crime family ", ch );
      else if ( victim->pcdata->clan->clan_type == CLAN_GUILD )
        send_to_char( ", and belongs to the guild ", ch );
      else
        send_to_char( ", and belongs to organization ", ch );

      send_to_char( victim->pcdata->clan->name, ch );
    }

  send_to_char( ".\r\n", ch );

  if(victim->pcdata->homepage && victim->pcdata->homepage[0] != '\0')
    ch_printf(ch, "%s's homepage can be found at %s.\r\n",
              victim->name,
              victim->pcdata->homepage);

  if(victim->pcdata->bio && victim->pcdata->bio[0] != '\0')
    ch_printf(ch, "%s's personal bio:\r\n%s",
              victim->name,
              victim->pcdata->bio);

  if( get_trust( ch ) >= LEVEL_GOD )
    {
      send_to_char("----------------------------------------------------\r\n", ch);

      send_to_char("Info for immortals:\r\n", ch);

      if ( victim->pcdata->authed_by && victim->pcdata->authed_by[0] != '\0' )
        ch_printf(ch, "%s was authorized by %s.\r\n",
                  victim->name, victim->pcdata->authed_by);

      ch_printf(ch, "%s has killed %d mobiles, and been killed by a mobile %d times.\r\n",
                victim->name, victim->pcdata->mkills, victim->pcdata->mdeaths );
      if ( victim->pcdata->pkills || victim->pcdata->pdeaths )
        ch_printf(ch, "%s has killed %d players, and been killed by a player %d times.\r\n",
                  victim->name, victim->pcdata->pkills, victim->pcdata->pdeaths );
      if ( victim->pcdata->illegal_pk )
        ch_printf(ch, "%s has committed %d illegal player kills.\r\n",
                  victim->name, victim->pcdata->illegal_pk );

      ch_printf(ch, "%s is %shelled at the moment.\r\n",
                victim->name,
                (victim->pcdata->release_date == 0) ? "not " : "");

      if(victim->pcdata->release_date != 0)
        ch_printf(ch, "%s was helled by %s, and will be released on %24.24s.\r\n",
                  victim->sex == SEX_MALE ? "He" :
                  victim->sex == SEX_FEMALE ? "She" : "It",
                  victim->pcdata->helled_by,
                  ctime(&victim->pcdata->release_date));

      if(get_trust(victim) < get_trust(ch))
        {
          sprintf(buf2, "list %s", buf);
          do_comment(ch, buf2);
        }

      if(IS_SET(victim->act, PLR_SILENCE) || IS_SET(victim->act, PLR_NO_EMOTE)
         || IS_SET(victim->act, PLR_NO_TELL) )
        {
          sprintf(buf2, "This player has the following flags set:");
          if(IS_SET(victim->act, PLR_SILENCE))
            strcat(buf2, " silence");
          if(IS_SET(victim->act, PLR_NO_EMOTE))
            strcat(buf2, " noemote");
          if(IS_SET(victim->act, PLR_NO_TELL) )
            strcat(buf2, " notell");
          strcat(buf2, ".\r\n");
          send_to_char(buf2, ch);
        }

      if ( victim->desc && victim->desc->remote.hostname[0]!='\0' )   /* added by Gorog */
        {
          sprintf (buf2, "%s's IP info: %s ", victim->name, victim->desc->remote.hostip);
          if (get_trust(ch) > LEVEL_GOD)
            {
              strcat (buf2, victim->desc->remote.hostname);
            }
          strcat (buf2, "\r\n");
          send_to_char(buf2, ch);
        }

      if (get_trust(ch) >= LEVEL_GOD && get_trust(ch) >= get_trust( victim ) && victim->pcdata )
        {
          sprintf (buf2, "Email: %s\r\n" , victim->pcdata->email );
          send_to_char(buf2, ch);
        }
    }
}
