/***************************************************************************
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
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                         Player communication module                     *
 ****************************************************************************/

#include <ctype.h>
#include "character.h"
#include "mud.h"
#include "vector3_aux.h"
#include "ships.h"

/*
 *  Externals
 */
void send_obj_page_to_char(CHAR_DATA * ch, OBJ_INDEX_DATA * idx, char page);
void send_room_page_to_char(CHAR_DATA * ch, ROOM_INDEX_DATA * idx, char page);
void send_page_to_char(CHAR_DATA * ch, MOB_INDEX_DATA * idx, char page);
void send_control_page_to_char(CHAR_DATA * ch, char page);

void sound_to_room( const ROOM_INDEX_DATA *room, const char *argument )
{
  CHAR_DATA *vic;

  if ( room == NULL ) return;

  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    if ( !IS_NPC(vic) && IS_SET( vic->act, PLR_SOUND ) )
      send_to_char( argument, vic );
}

char *drunk_speech( const char *argument, CHAR_DATA *ch )
{
  const char *arg = argument;
  static char buf[MAX_INPUT_LENGTH*2];
  char buf1[MAX_INPUT_LENGTH*2];
  short drunk;
  char *txt;
  char *txt1;

  if ( IS_NPC( ch ) || !ch->pcdata ) return (char *) argument;

  drunk = ch->pcdata->condition[COND_DRUNK];

  if ( drunk <= 0 )
    return (char *) argument;

  buf[0] = '\0';
  buf1[0] = '\0';

  if ( !argument )
    {
      bug( "Drunk_speech: NULL argument", 0 );
      return "";
    }

  /*
    if ( *arg == '\0' )
    return (char *) argument;
  */

  txt = buf;
  txt1 = buf1;

  while ( *arg != '\0' )
    {
      if ( toupper(*arg) == 'S' )
        {
          if ( number_percent() < ( drunk * 2 ) )               /* add 'h' after an 's' */
            {
              *txt++ = *arg;
              *txt++ = 'h';
            }
          else
            *txt++ = *arg;
        }
      else if ( toupper(*arg) == 'X' )
        {
          if ( number_percent() < ( drunk * 2 / 2 ) )
            {
              *txt++ = 'c', *txt++ = 's', *txt++ = 'h';
            }
          else
            *txt++ = *arg;
        }
      else if ( number_percent() < ( drunk * 2 / 5 ) )  /* slurred letters */
        {
          short slurn = number_range( 1, 2 );
          short currslur = 0;

          while ( currslur < slurn )
            *txt++ = *arg, currslur++;
        }
      else
        *txt++ = *arg;

      arg++;
    };

  *txt = '\0';

  txt = buf;

  while ( *txt != '\0' )   /* Let's mess with the string's caps */
    {
      if ( number_percent() < ( 2 * drunk / 2.5 ) )
        {
          if ( isupper(*txt) )
            *txt1 = tolower( *txt );
          else
            if ( islower(*txt) )
              *txt1 = toupper( *txt );
            else
              *txt1 = *txt;
        }
      else
        *txt1 = *txt;

      txt1++, txt++;
    };

  *txt1 = '\0';
  txt1 = buf1;
  txt = buf;

  while ( *txt1 != '\0' )   /* Let's make them stutter */
    {
      if ( *txt1 == ' ' )  /* If there's a space, then there's gotta be a */
        {                        /* along there somewhere soon */

          while ( *txt1 == ' ' )  /* Don't stutter on spaces */
            *txt++ = *txt1++;

          if ( ( number_percent() < ( 2 * drunk / 4 ) ) && *txt1 != '\0' )
            {
              short offset = number_range( 0, 2 );
              short pos = 0;

              while ( *txt1 != '\0' && pos < offset )
                *txt++ = *txt1++, pos++;

              if ( *txt1 == ' ' )  /* Make sure not to stutter a space after */
                {                    /* the initial offset into the word */
                  *txt++ = *txt1++;
                  continue;
                }

              pos = 0;
              offset = number_range( 2, 4 );
              while (   *txt1 != '\0' && pos < offset )
                {
                  *txt++ = *txt1;
                  pos++;
                  if ( *txt1 == ' ' || pos == offset )  /* Make sure we don't stick */
                    {                          /* A hyphen right before a space */
                      txt1--;
                      break;
                    }
                  *txt++ = '-';
                }
              if ( *txt1 != '\0' )
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
void talk_channel( CHAR_DATA *ch, const char *argument, int channel, const char *verb )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  DESCRIPTOR_DATA *d;
  int position;
  CLAN_DATA *clan = NULL;

  if ( channel != CHANNEL_SHOUT && channel != CHANNEL_YELL && channel != CHANNEL_IMMTALK && channel != CHANNEL_OOC
       && channel != CHANNEL_ASK && channel != CHANNEL_NEWBIE && channel != CHANNEL_AVTALK
       && channel != CHANNEL_SHIP && channel != CHANNEL_SYSTEM && channel != CHANNEL_SPACE
       && channel != CHANNEL_103 && channel != CHANNEL_104 && channel != CHANNEL_105  )
    {
      if ( !has_comlink( ch ) )
        {
          send_to_char( "You need a comlink to do that!\r\n", ch);
          return;
        }

    }
  /*    else if ( channel == CHANNEL_OOC && !IS_SET(ch->in_room->room_flags, ROOM_HOTEL ) )
   *    {
   *         send_to_char("&ROut of character conversations are restricted to hotels!\r\n",ch);
   *            return;
   *    }
   */

  else if ( IS_NPC( ch ) && ( channel == CHANNEL_CLAN || channel == CHANNEL_ALLCLAN ) )
    {
      send_to_char( "Mobs can't be in clans.\r\n", ch );
      return;
    }

  if ( channel == CHANNEL_CLAN || channel == CHANNEL_ALLCLAN )
    {
      clan = ch->pcdata->clan;
    }

  if ( IS_NPC( ch ) && channel == CHANNEL_ORDER )
    {
      send_to_char( "Mobs can't be in orders.\r\n", ch );
      return;
    }

  if ( IS_NPC( ch ) && channel == CHANNEL_GUILD )
    {
      send_to_char( "Mobs can't be in guilds.\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if ( IS_NPC( ch ) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
      if ( ch->master )
        send_to_char( "I don't think so...\r\n", ch->master );
      return;
    }

  if ( argument[0] == '\0' )
    {
      sprintf( buf, "%s what?\r\n", verb );
      buf[0] = UPPER(buf[0]);
      send_to_char( buf, ch );  /* where'd this line go? */
      return;
    }

  if ( !IS_NPC(ch) && IS_SET(ch->act, PLR_SILENCE) )
    {
      ch_printf( ch, "You can't %s.\r\n", verb );
      return;
    }

  REMOVE_BIT(ch->deaf, channel);

  switch ( channel )
    {
    default:
      set_char_color( AT_GOSSIP, ch );
      ch_printf( ch, "&z&CYou %s over the public network&c, '&C%s&c'\r\n", verb, argument );
      sprintf( buf, "&z&C$n &C%ss over the public network&c, '&C$t&c'",     verb );
      break;
    case CHANNEL_CLANTALK:
      set_char_color( AT_CLAN, ch );
      ch_printf( ch, "&z&POver the organizations private network you say&R, '&P%s&R'\r\n", argument );
      sprintf( buf, "&z&P$n &Pspeaks over the organizations network&R, '&P$t&R'" );
      break;
    case CHANNEL_ALLCLAN:
      set_char_color( AT_CLAN, ch );
      ch_printf( ch, "&z&POver the entire organizations private network you say&R, '&P%s&R'\r\n", argument );
      sprintf( buf, "&z&P$n &Pspeaks over the entire organizations network&R, '&P$t&R'" );
      break;
    case CHANNEL_SHIP:
      set_char_color( AT_SHIP, ch );
      ch_printf( ch, "&z&rYou tell the ship&P, '%s'\r\n", argument );
      sprintf( buf, "&z&r$n &rsays over the ships com system,&P '$t'"  );
      break;
    case CHANNEL_SYSTEM:
      set_char_color( AT_GOSSIP, ch );
      ch_printf( ch, "&z&R(System): '&W%s&r'\r\n", argument );
      sprintf( buf, "&z&R(System) &R$n&r: '&W$t&r'" );
      break;
    case CHANNEL_SPACE:
      set_char_color( AT_GOSSIP, ch );
      ch_printf( ch, "&z&rYou space &g(&GOOC&g):, '&W%s&r'\r\n", argument );
      sprintf( buf, "&z&g(&GOOC&g)&R(Space) &R$n&r: '&W$t&r'" );
      break;
    case CHANNEL_YELL:
    case CHANNEL_SHOUT:
      set_char_color( AT_GOSSIP, ch );
      ch_printf( ch, "You %s, '%s'\r\n", verb, argument );
      sprintf( buf, "$n %ss, '$t'",     verb );
      break;
    case CHANNEL_ASK:
      set_char_color( AT_OOC, ch );
      ch_printf( ch, "&z&g(&GOOC&g)&Y You %s, '%s'\r\n", verb, argument );
      sprintf( buf, "&z&g(&GOOC&g)&Y $n &Y%ss, '$t'",     verb );
      break;
    case CHANNEL_NEWBIE:
      set_char_color( AT_OOC, ch );
      ch_printf( ch, "&z&r(&RNEWBIE&r)&Y %s: %s\r\n", ch->name, argument );
      sprintf( buf, "&z&r(&RNEWBIE&r)&Y $n&Y: $t" );
      break;
    case CHANNEL_OOC:
      set_char_color( AT_OOC, ch );
      sprintf( buf, "&z&g(&GOOC&g)&Y $n&Y: $t" );
      position        = ch->position;
      ch->position    = POS_STANDING;
      act( AT_OOC, buf, ch, argument, NULL, TO_CHAR );
      ch->position    = position;
      break;
    case CHANNEL_WARTALK:
      set_char_color( AT_WARTALK, ch );
      ch_printf( ch, "&z&cYou %s '&R%s&c'\r\n", verb, argument );
      sprintf( buf, "&z&c$n &c%ss '&R$t&c'", verb );
      break;
    case CHANNEL_AVTALK:
    case CHANNEL_IMMTALK:
    case CHANNEL_103:
    case CHANNEL_104:
    case CHANNEL_105:
      if ( channel == CHANNEL_AVTALK )
        sprintf( buf, "$n&c: $t" );
      else if ( channel == CHANNEL_IMMTALK )
        sprintf( buf, "$n&Y>&W $t" );
      else if ( channel == CHANNEL_103 )
        sprintf( buf, "&z&Y(&Wi103&Y)&W $n&Y>&W $t" );
      else if ( channel == CHANNEL_104 )
        sprintf( buf, "&z&Y(&Wi104&Y)&W $n&Y>&W $t" );
      else if ( channel == CHANNEL_105 )
        sprintf( buf, "&z&Y(&Wi105&Y)&W $n&Y>&W $t" );
      position  = ch->position;
      ch->position      = POS_STANDING;
      act( channel == CHANNEL_AVTALK ? AT_AVATAR : AT_IMMORT , buf, ch, argument, NULL, TO_CHAR );
      ch->position      = position;
      break;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf2, "%s: %s (%s)", IS_NPC( ch ) ? ch->short_descr : ch->name,
               argument, verb );
      append_to_file( LOG_FILE, buf2 );
    }

  for ( d = first_descriptor; d; d = d->next )
    {
      CHAR_DATA *och;
      CHAR_DATA *vch;

      och = d->original ? d->original : d->character;
      vch = d->character;

      if ( d->connected == CON_PLAYING
           &&   vch != ch
           &&  !IS_SET(och->deaf, channel) )
        {
          const char *sbuf = argument;

          if ( channel != CHANNEL_SHOUT && channel != CHANNEL_YELL && channel != CHANNEL_IMMTALK && channel != CHANNEL_OOC
               && channel != CHANNEL_ASK && channel != CHANNEL_NEWBIE && channel != CHANNEL_AVTALK
               && channel != CHANNEL_SHIP && channel != CHANNEL_SYSTEM && channel != CHANNEL_SPACE
               && channel != CHANNEL_103 && channel != CHANNEL_104 && channel != CHANNEL_105
               )
            {
	      if( !has_comlink( ch ) )
		{
		  continue;
		}
            }

          if ( channel == CHANNEL_IMMTALK && !IS_IMMORTAL(och) )
            continue;
          if ( channel == CHANNEL_103 && och->top_level < 103 )
            continue;
          if ( channel == CHANNEL_104 && och->top_level < 104 )
            continue;
          if ( channel == CHANNEL_105 && och->top_level < 105 )
            continue;
          if ( channel == CHANNEL_WARTALK && NOT_AUTHED( och ) )
            continue;
          if ( channel == CHANNEL_AVTALK && !IS_HERO(och) )
            continue;

          if ( IS_SET( vch->in_room->room_flags, ROOM_SILENCE ) )
            continue;

          if ( channel == CHANNEL_YELL || channel == CHANNEL_SHOUT )
            {
              if ( ch->in_room != och->in_room )
                continue;
            }

          if ( channel == CHANNEL_ALLCLAN || channel == CHANNEL_CLAN || channel == CHANNEL_ORDER
               ||   channel == CHANNEL_GUILD )
            {

              if ( IS_NPC( vch ) )
                continue;

              if ( !vch->pcdata->clan )
                continue;

              if ( channel != CHANNEL_ALLCLAN && vch->pcdata->clan != clan /*&& vch->pcdata->clan->mainclan != clan*/ )
                continue;
              if ( channel == CHANNEL_ALLCLAN && vch->pcdata->clan != clan
                   && vch->pcdata->clan->mainclan != clan && clan->mainclan != vch->pcdata->clan
                   && ( !vch->pcdata->clan->mainclan || !clan->mainclan ||
                        vch->pcdata->clan->mainclan != clan->mainclan ) )
                continue;
            }

          if ( channel == CHANNEL_SHIP || channel == CHANNEL_SPACE || channel == CHANNEL_SYSTEM )
            {
              SHIP_DATA *ship = ship_from_cockpit( ch->in_room->vnum );
              SHIP_DATA *target;

              if ( !ship )
                continue;

              if ( !vch->in_room )
                continue;

              if ( channel == CHANNEL_SHIP )
                if ( vch->in_room->vnum > ship->lastroom || vch->in_room->vnum < ship->firstroom )
                  continue;

              target = ship_from_cockpit( vch->in_room->vnum );

              if (!target) continue;

              if ( channel == CHANNEL_SYSTEM )
                if (!ship_in_range( ship, target ) )
                  continue;

	      if( ship_distance_to_ship( target, ship ) > 100 * ( ship->sensor + 10 ) * ( ( target->sclass ) + 1 )
		  && ship_distance_to_ship( target, ship ) > 100 * ( ship->comm + target->comm + 20 ) )
		{
		  continue;
		}
            }

          position              = vch->position;
          if ( channel != CHANNEL_SHOUT && channel != CHANNEL_YELL )
            vch->position       = POS_STANDING;
          if ( !knows_language( vch, ch->speaking, ch ) &&
               (!IS_NPC(ch) || ch->speaking != 0)   &&
               ( channel != CHANNEL_NEWBIE &&
                 channel != CHANNEL_OOC &&
                 channel != CHANNEL_AUCTION &&
                 channel != CHANNEL_ASK &&
                 channel != CHANNEL_AVTALK
                 )  )
            sbuf = scramble(argument, ch->speaking);
          MOBtrigger = FALSE;
          if ( channel == CHANNEL_IMMTALK || channel == CHANNEL_AVTALK
               || channel == CHANNEL_103 || channel == CHANNEL_104 || channel == CHANNEL_105 )
            act( channel == CHANNEL_AVTALK ? AT_AVATAR : AT_IMMORT , buf, ch, sbuf, vch, TO_VICT );
          else if (channel == CHANNEL_WARTALK)
            act( AT_WARTALK, buf, ch, sbuf, vch, TO_VICT );
          else if (channel == CHANNEL_OOC || channel == CHANNEL_NEWBIE || channel == CHANNEL_ASK )
            act( AT_OOC, buf, ch, sbuf, vch, TO_VICT );
          else if ( channel == CHANNEL_SHIP )
            act( AT_SHIP, buf, ch, sbuf, vch, TO_VICT );
          else if ( channel == CHANNEL_CLAN )
            act( AT_CLAN, buf, ch, sbuf, vch, TO_VICT );
          else
            act( AT_GOSSIP, buf, ch, sbuf, vch, TO_VICT );
          vch->position = position;
        }
    }
}

void to_channel( const char *argument, int channel, const char *verb, short level )
{
  char buf[MAX_STRING_LENGTH];
  DESCRIPTOR_DATA *d;

  if ( !first_descriptor || argument[0] == '\0' )
    return;

  sprintf(buf, "%s: %s\r\n", verb, argument );

  for ( d = first_descriptor; d; d = d->next )
    {
      CHAR_DATA *och;
      CHAR_DATA *vch;

      och = d->original ? d->original : d->character;
      vch = d->character;

      if ( !och || !vch )
        continue;
      if ( ( !IS_IMMORTAL(vch) && channel != CHANNEL_ARENA )
           || ( vch->top_level < sysdata.build_level && channel == CHANNEL_BUILD )
           || ( vch->top_level < sysdata.log_level
                && ( channel == CHANNEL_LOG || channel == CHANNEL_COMM) ) )
        continue;

      if ( d->connected == CON_PLAYING
           &&  !IS_SET(och->deaf, channel)
           &&   vch->top_level >= level )
        {
          set_char_color( AT_LOG, vch );
          send_to_char( buf, vch );
        }
    }
}

/*
 * Something from original DikuMUD that Merc yanked out.
 * Used to prevent following loops, which can cause problems if people
 * follow in a loop through an exit leading back into the same room
 * (Which exists in many maze areas)                    -Thoric
 */
bool circle_follow( const CHAR_DATA *ch, const CHAR_DATA *victim )
{
  const CHAR_DATA *tmp;

  for ( tmp = victim; tmp; tmp = tmp->master )
    if ( tmp == ch )
      return TRUE;

  return FALSE;
}

void add_follower( CHAR_DATA *ch, CHAR_DATA *master )
{
  if ( ch->master )
    {
      bug( "Add_follower: non-null master.", 0 );
      return;
    }

  ch->master        = master;
  ch->leader        = NULL;
  if ( IS_NPC(ch) && IS_SET(ch->act, ACT_PET) && !IS_NPC(master) )
    master->pcdata->pet = ch;

  if ( can_see( master, ch ) )
    act( AT_ACTION, "$n now follows you.", ch, NULL, master, TO_VICT );

  act( AT_ACTION, "You now follow $N.",  ch, NULL, master, TO_CHAR );
}

void stop_follower( CHAR_DATA *ch )
{
  if ( !ch->master )
    {
      bug( "Stop_follower: null master.", 0 );
      return;
    }

  if ( IS_NPC(ch) && !IS_NPC(ch->master) && ch->master->pcdata->pet == ch )
    ch->master->pcdata->pet = NULL;

  if ( IS_AFFECTED(ch, AFF_CHARM) )
    {
      REMOVE_BIT( ch->affected_by, AFF_CHARM );
      affect_strip( ch, gsn_charm_person );
    }

  if ( can_see( ch->master, ch ) )
    act( AT_ACTION, "$n stops following you.",     ch, NULL, ch->master, TO_VICT    );
  act( AT_ACTION, "You stop following $N.",      ch, NULL, ch->master, TO_CHAR    );

  ch->master = NULL;
  ch->leader = NULL;
}

void die_follower( CHAR_DATA *ch )
{
  CHAR_DATA *fch;

  if ( ch->master )
    stop_follower( ch );

  ch->leader = NULL;

  for ( fch = first_char; fch; fch = fch->next )
    {
      if ( fch->master == ch )
        stop_follower( fch );
      if ( fch->leader == ch )
        fch->leader = fch;
    }
  return;
}

/*
 * It is very important that this be an equivalence relation:
 * (1) A ~ A
 * (2) if A ~ B then B ~ A
 * (3) if A ~ B  and B ~ C, then A ~ C
 */
bool is_same_group( const CHAR_DATA *ach, const CHAR_DATA *bch )
{
  if ( ach->leader )
    ach = ach->leader;

  if ( bch->leader )
    bch = bch->leader;

  return ach == bch;
}

/*
 * this function sends raw argument over the AUCTION: channel
 * I am not too sure if this method is right..
 */

void talk_auction (const char *argument)
{
  DESCRIPTOR_DATA *d;
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *original;

  sprintf (buf,"Auction: %s", argument); /* last %s to reset color */

  for (d = first_descriptor; d; d = d->next)
    {
      original = d->original ? d->original : d->character; /* if switched */
      if ((d->connected == CON_PLAYING) && !IS_SET(original->deaf,CHANNEL_AUCTION)
          && !IS_SET(original->in_room->room_flags, ROOM_SILENCE) && !NOT_AUTHED(original))
        act( AT_GOSSIP, buf, original, NULL, NULL, TO_CHAR );
    }
}

/*
 * Language support functions. -- Altrag
 * 07/01/96
 */
bool knows_language( const CHAR_DATA *ch, int language, const CHAR_DATA *cch )
{
  short sn;

  if ( !IS_NPC(ch) && IS_IMMORTAL(ch) )
    return TRUE;
  if ( IS_NPC(ch) && !ch->speaks ) /* No langs = knows all for npcs */
    return TRUE;
  if ( IS_NPC(ch) && IS_SET(ch->speaks, (language & ~LANG_CLAN)) )
    return TRUE;
  /* everyone does not KNOW common tongue
     if ( IS_SET(language, LANG_COMMON) )
     return TRUE;
  */
  if ( language & LANG_CLAN )
    {
      /* Clan = common for mobs.. snicker.. -- Altrag */
      if ( IS_NPC(ch) || IS_NPC(cch) )
        return TRUE;
      if ( ch->pcdata->clan == cch->pcdata->clan &&
           ch->pcdata->clan != NULL )
        return TRUE;
    }
  if ( !IS_NPC( ch ) )
    {
      int lang;

      /* Racial languages for PCs */
      if ( IS_SET(race_table[ch->race].language, language) )
        return TRUE;

      for ( lang = 0; lang_array[lang] != LANG_UNKNOWN; lang++ )
        if ( IS_SET(language, lang_array[lang]) &&
             IS_SET(ch->speaks, lang_array[lang]) )
          {
            if ( (sn = skill_lookup(lang_names[lang])) != -1 )
              {
                if( number_percent()-1 < ch->pcdata->learned[sn] )
                  return TRUE;
              }
          }
    }
  return FALSE;
}

bool can_learn_lang( const CHAR_DATA *ch, int language )
{
  if ( language & LANG_CLAN )
    return FALSE;
  if ( IS_NPC(ch) || IS_IMMORTAL(ch) )
    return FALSE;
  if ( race_table[ch->race].language & language )
    return FALSE;
  if ( ch->speaks & language )
    {
      int lang;

      for ( lang = 0; lang_array[lang] != LANG_UNKNOWN; lang++ )
        if ( language & lang_array[lang] )
          {
            int sn;

            if ( !(VALID_LANGUAGES & lang_array[lang]) )
              return FALSE;
            if ( ( sn = skill_lookup( lang_names[lang] ) ) < 0 )
              {
                bug( "Can_learn_lang: valid language without sn: %d", lang );
                continue;
              }
            if ( ch->pcdata->learned[sn] >= 99 )
              return FALSE;
          }
    }
  if ( VALID_LANGUAGES & language )
    return TRUE;
  return FALSE;
}

/* Note: does not count racial language.  This is intentional (for now). */
int countlangs( int languages )
{
  int numlangs = 0;
  int looper;

  for ( looper = 0; lang_array[looper] != LANG_UNKNOWN; looper++ )
    {
      if ( lang_array[looper] == LANG_CLAN )
        continue;
      if ( languages & lang_array[looper] )
        numlangs++;
    }
  return numlangs;
}
