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

#include <ctype.h>
#include "character.h"
#include "mud.h"
#include "vector3_aux.h"
#include "ship.h"
#include "clan.h"
#include "skill.h"

char *DrunkSpeech( const char *argument, Character *ch )
{
  const char *arg = argument;
  static char buf[MAX_INPUT_LENGTH*2];
  char buf1[MAX_INPUT_LENGTH*2] = {'\0'};
  short drunk;
  char *txt;
  char *txt1;

  if ( IsNpc( ch ) || !ch->pcdata ) return (char *) argument;

  drunk = ch->pcdata->condition[COND_DRUNK];

  if ( drunk <= 0 )
    return (char *) argument;

  buf[0] = '\0';

  if ( !argument )
    {
      Bug( "%s: NULL argument", __FUNCTION__ );
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
          if ( GetRandomPercent() < ( drunk * 2 ) )               /* add 'h' after an 's' */
            {
              *txt++ = *arg;
              *txt++ = 'h';
            }
          else
            *txt++ = *arg;
        }
      else if ( toupper(*arg) == 'X' )
        {
          if ( GetRandomPercent() < ( drunk * 2 / 2 ) )
            {
              *txt++ = 'c', *txt++ = 's', *txt++ = 'h';
            }
          else
            *txt++ = *arg;
        }
      else if ( GetRandomPercent() < ( drunk * 2 / 5 ) )  /* slurred letters */
        {
          short slurn = GetRandomNumberFromRange( 1, 2 );
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
      if ( GetRandomPercent() < ( 2 * drunk / 2.5 ) )
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

          if ( ( GetRandomPercent() < ( 2 * drunk / 4 ) ) && *txt1 != '\0' )
            {
              short offset = GetRandomNumberFromRange( 0, 2 );
              short pos = 0;

              while ( *txt1 != '\0' && pos < offset )
                *txt++ = *txt1++, pos++;

              if ( *txt1 == ' ' )  /* Make sure not to stutter a space after */
                {                    /* the initial offset into the word */
                  *txt++ = *txt1++;
                  continue;
                }

              pos = 0;
              offset = GetRandomNumberFromRange( 2, 4 );
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
void TalkChannel( Character *ch, const char *argument, int channel, const char *verb )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Descriptor *d;
  int position;
  Clan *clan = NULL;

  if ( channel != CHANNEL_SHOUT && channel != CHANNEL_YELL && channel != CHANNEL_IMMTALK && channel != CHANNEL_OOC
       && channel != CHANNEL_ASK && channel != CHANNEL_NEWBIE && channel != CHANNEL_AVTALK
       && channel != CHANNEL_SHIP && channel != CHANNEL_SYSTEM && channel != CHANNEL_SPACE
       && channel != CHANNEL_103 && channel != CHANNEL_104 && channel != CHANNEL_105  )
    {
      if ( !HasComlink( ch ) )
        {
          SendToCharacter( "You need a comlink to do that!\r\n", ch);
          return;
        }

    }
  else if ( IsNpc( ch ) && ( channel == CHANNEL_CLAN || channel == CHANNEL_ALLCLAN ) )
    {
      SendToCharacter( "Mobs can't be in clans.\r\n", ch );
      return;
    }

  if ( channel == CHANNEL_CLAN || channel == CHANNEL_ALLCLAN )
    {
      clan = ch->pcdata->ClanInfo.Clan;
    }

  if ( IsNpc( ch ) && channel == CHANNEL_ORDER )
    {
      SendToCharacter( "Mobs can't be in orders.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) && channel == CHANNEL_GUILD )
    {
      SendToCharacter( "Mobs can't be in guilds.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      if ( ch->master )
        SendToCharacter( "I don't think so...\r\n", ch->master );
      return;
    }

  if ( argument[0] == '\0' )
    {
      sprintf( buf, "%s what?\r\n", verb );
      buf[0] = CharToUppercase(buf[0]);
      SendToCharacter( buf, ch );  /* where'd this line go? */
      return;
    }

  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_SILENCE) )
    {
      Echo( ch, "You can't %s.\r\n", verb );
      return;
    }

  RemoveBit(ch->deaf, channel);

  switch ( channel )
    {
    default:
      SetCharacterColor( AT_GOSSIP, ch );
      Echo( ch, "&z&CYou %s over the public network&c, '&C%s&c'\r\n", verb, argument );
      sprintf( buf, "&z&C$n &C%ss over the public network&c, '&C$t&c'",     verb );
      break;

    case CHANNEL_CLANTALK:
      SetCharacterColor( AT_CLAN, ch );
      Echo( ch, "&z&POver the organizations private network you say&R, '&P%s&R'\r\n", argument );
      sprintf( buf, "&z&P$n &Pspeaks over the organizations network&R, '&P$t&R'" );
      break;

    case CHANNEL_ALLCLAN:
      SetCharacterColor( AT_CLAN, ch );
      Echo( ch, "&z&POver the entire organizations private network you say&R, '&P%s&R'\r\n", argument );
      sprintf( buf, "&z&P$n &Pspeaks over the entire organizations network&R, '&P$t&R'" );
      break;

    case CHANNEL_SHIP:
      SetCharacterColor( AT_SHIP, ch );
      Echo( ch, "&z&rYou tell the ship&P, '%s'\r\n", argument );
      sprintf( buf, "&z&r$n &rsays over the ships com system,&P '$t'"  );
      break;

    case CHANNEL_SYSTEM:
      SetCharacterColor( AT_GOSSIP, ch );
      Echo( ch, "&z&R(System): '&W%s&r'\r\n", argument );
      sprintf( buf, "&z&R(System) &R$n&r: '&W$t&r'" );
      break;

    case CHANNEL_SPACE:
      SetCharacterColor( AT_GOSSIP, ch );
      Echo( ch, "&z&rYou space &g(&GOOC&g):, '&W%s&r'\r\n", argument );
      sprintf( buf, "&z&g(&GOOC&g)&R(Space) &R$n&r: '&W$t&r'" );
      break;

    case CHANNEL_YELL:
    case CHANNEL_SHOUT:
      SetCharacterColor( AT_GOSSIP, ch );
      Echo( ch, "You %s, '%s'\r\n", verb, argument );
      sprintf( buf, "$n %ss, '$t'",     verb );
      break;

    case CHANNEL_ASK:
      SetCharacterColor( AT_OOC, ch );
      Echo( ch, "&z&g(&GOOC&g)&Y You %s, '%s'\r\n", verb, argument );
      sprintf( buf, "&z&g(&GOOC&g)&Y $n &Y%ss, '$t'",     verb );
      break;

    case CHANNEL_NEWBIE:
      SetCharacterColor( AT_OOC, ch );
      Echo( ch, "&z&r(&RNEWBIE&r)&Y %s: %s\r\n", ch->name, argument );
      sprintf( buf, "&z&r(&RNEWBIE&r)&Y $n&Y: $t" );
      break;

    case CHANNEL_OOC:
      SetCharacterColor( AT_OOC, ch );
      sprintf( buf, "&z&g(&GOOC&g)&Y $n&Y: $t" );
      position        = ch->position;
      ch->position    = POS_STANDING;
      Act( AT_OOC, buf, ch, argument, NULL, TO_CHAR );
      ch->position    = position;
      break;

    case CHANNEL_WARTALK:
      SetCharacterColor( AT_WARTALK, ch );
      Echo( ch, "&z&cYou %s '&R%s&c'\r\n", verb, argument );
      sprintf( buf, "&z&c$n &c%ss '&R$t&c'", verb );
      break;

    case CHANNEL_AVTALK:
    case CHANNEL_IMMTALK:
    case CHANNEL_103:
    case CHANNEL_104:
    case CHANNEL_105:
      if ( channel == CHANNEL_AVTALK )
	{
	  sprintf( buf, "$n&c: $t" );
	}
      else if ( channel == CHANNEL_IMMTALK )
	{
	  sprintf( buf, "$n&Y>&W $t" );
	}
      else if ( channel == CHANNEL_103 )
	{
	  sprintf( buf, "&z&Y(&Wi103&Y)&W $n&Y>&W $t" );
	}
      else if ( channel == CHANNEL_104 )
	{
	  sprintf( buf, "&z&Y(&Wi104&Y)&W $n&Y>&W $t" );
	}
      else if ( channel == CHANNEL_105 )
	{
	  sprintf( buf, "&z&Y(&Wi105&Y)&W $n&Y>&W $t" );
	}

      position  = ch->position;
      ch->position = POS_STANDING;
      Act( channel == CHANNEL_AVTALK ? AT_AVATAR : AT_IMMORT, buf, ch, argument, NULL, TO_CHAR );
      ch->position = position;
      break;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf2, "%s: %s (%s)", IsNpc( ch ) ? ch->short_descr : ch->name,
               argument, verb );
      AppendToFile( LOG_FILE, buf2 );
    }

  for ( d = first_descriptor; d; d = d->next )
    {
      Character *och;
      Character *vch;

      och = d->original ? d->original : d->character;
      vch = d->character;

      if ( d->connection_state == CON_PLAYING
           &&   vch != ch
           &&  !IsBitSet(och->deaf, channel) )
        {
          const char *sbuf = argument;

          if ( channel != CHANNEL_SHOUT && channel != CHANNEL_YELL && channel != CHANNEL_IMMTALK && channel != CHANNEL_OOC
               && channel != CHANNEL_ASK && channel != CHANNEL_NEWBIE && channel != CHANNEL_AVTALK
               && channel != CHANNEL_SHIP && channel != CHANNEL_SYSTEM && channel != CHANNEL_SPACE
               && channel != CHANNEL_103 && channel != CHANNEL_104 && channel != CHANNEL_105
               )
            {
	      if( !HasComlink( ch ) )
		{
		  continue;
		}
            }

          if ( channel == CHANNEL_IMMTALK && !IsImmortal(och) )
            continue;
          if ( channel == CHANNEL_103 && och->top_level < 103 )
            continue;
          if ( channel == CHANNEL_104 && och->top_level < 104 )
            continue;
          if ( channel == CHANNEL_105 && och->top_level < 105 )
            continue;
          if ( channel == CHANNEL_WARTALK && !IsAuthed( och ) )
            continue;
          if ( channel == CHANNEL_AVTALK && !IsAvatar(och) )
            continue;

          if ( IsBitSet( vch->in_room->room_flags, ROOM_SILENCE ) )
            continue;

          if ( channel == CHANNEL_YELL || channel == CHANNEL_SHOUT )
            {
              if ( ch->in_room != och->in_room )
                continue;
            }

          if ( channel == CHANNEL_ALLCLAN || channel == CHANNEL_CLAN || channel == CHANNEL_ORDER
               ||   channel == CHANNEL_GUILD )
            {

              if ( IsNpc( vch ) )
                continue;

              if ( !vch->pcdata->ClanInfo.Clan )
                continue;

              if ( channel != CHANNEL_ALLCLAN && vch->pcdata->ClanInfo.Clan != clan )
                continue;

              if ( channel == CHANNEL_ALLCLAN
		   && vch->pcdata->ClanInfo.Clan != clan
                   && vch->pcdata->ClanInfo.Clan->mainclan != clan
		   && clan->mainclan != vch->pcdata->ClanInfo.Clan
                   && ( !vch->pcdata->ClanInfo.Clan->mainclan
			|| !clan->mainclan
			|| vch->pcdata->ClanInfo.Clan->mainclan != clan->mainclan ) )
                continue;
            }

          if ( channel == CHANNEL_SHIP || channel == CHANNEL_SPACE || channel == CHANNEL_SYSTEM )
            {
              Ship *ship = GetShipFromCockpit( ch->in_room->vnum );
              Ship *target;

              if ( !ship )
                continue;

              if ( !vch->in_room )
                continue;

              if ( channel == CHANNEL_SHIP )
                if ( vch->in_room->vnum > ship->room.last || vch->in_room->vnum < ship->room.first )
                  continue;

              target = GetShipFromCockpit( vch->in_room->vnum );

              if (!target) continue;

              if ( channel == CHANNEL_SYSTEM )
                if (!IsShipInCombatRange( ship, target ) )
                  continue;

	      if( GetShipDistanceToShip( target, ship ) > 100 * ( ship->sensor + 10 ) * ( ( target->sclass ) + 1 )
		  && GetShipDistanceToShip( target, ship ) > 100 * ( ship->comm + target->comm + 20 ) )
		{
		  continue;
		}
            }

          position              = vch->position;
          if ( channel != CHANNEL_SHOUT && channel != CHANNEL_YELL )
            vch->position       = POS_STANDING;
          if ( !CharacterKnowsLanguage( vch, ch->speaking, ch ) &&
               (!IsNpc(ch) || ch->speaking != 0)   &&
               ( channel != CHANNEL_NEWBIE &&
                 channel != CHANNEL_OOC &&
                 channel != CHANNEL_AUCTION &&
                 channel != CHANNEL_ASK &&
                 channel != CHANNEL_AVTALK
                 )  )
            sbuf = Scramble(argument, ch->speaking);
          MOBtrigger = false;
          if ( channel == CHANNEL_IMMTALK || channel == CHANNEL_AVTALK
               || channel == CHANNEL_103 || channel == CHANNEL_104 || channel == CHANNEL_105 )
            Act( channel == CHANNEL_AVTALK ? AT_AVATAR : AT_IMMORT , buf, ch, sbuf, vch, TO_VICT );
          else if (channel == CHANNEL_WARTALK)
            Act( AT_WARTALK, buf, ch, sbuf, vch, TO_VICT );
          else if (channel == CHANNEL_OOC || channel == CHANNEL_NEWBIE || channel == CHANNEL_ASK )
            Act( AT_OOC, buf, ch, sbuf, vch, TO_VICT );
          else if ( channel == CHANNEL_SHIP )
            Act( AT_SHIP, buf, ch, sbuf, vch, TO_VICT );
          else if ( channel == CHANNEL_CLAN )
            Act( AT_CLAN, buf, ch, sbuf, vch, TO_VICT );
          else
            Act( AT_GOSSIP, buf, ch, sbuf, vch, TO_VICT );
          vch->position = position;
        }
    }
}

void ToChannel( const char *argument, int channel, const char *verb, short level )
{
  char buf[MAX_STRING_LENGTH];
  Descriptor *d;

  if ( !first_descriptor || argument[0] == '\0' )
    return;

  sprintf(buf, "%s: %s\r\n", verb, argument );

  for ( d = first_descriptor; d; d = d->next )
    {
      Character *och = d->original ? d->original : d->character;
      Character *vch = d->character;

      if ( !och || !vch )
        continue;

      if ( ( !IsImmortal(vch) && channel != CHANNEL_ARENA )
           || ( vch->top_level < sysdata.build_level && channel == CHANNEL_BUILD )
           || ( vch->top_level < sysdata.log_level
                && ( channel == CHANNEL_LOG || channel == CHANNEL_COMM) ) )
	{
	  continue;
	}

      if ( d->connection_state == CON_PLAYING
           && !IsBitSet(och->deaf, channel)
           && vch->top_level >= level )
        {
          SetCharacterColor( AT_LOG, vch );
          SendToCharacter( buf, vch );
        }
    }
}

/*
 * Something from original DikuMUD that Merc yanked out.
 * Used to prevent following loops, which can cause problems if people
 * follow in a loop through an exit leading back into the same room
 * (Which exists in many maze areas)                    -Thoric
 */
bool IsFollowingInCircle( const Character *ch, const Character *victim )
{
  const Character *tmp;

  for ( tmp = victim; tmp; tmp = tmp->master )
    if ( tmp == ch )
      return true;

  return false;
}

void StartFollowing( Character *ch, Character *master )
{
  if ( ch->master )
    {
      Bug( "%s: non-null master.", __FUNCTION__ );
      return;
    }

  ch->master = master;
  ch->leader = NULL;

  if ( IsNpc(ch) && IsBitSet(ch->act, ACT_PET) && !IsNpc(master) )
    {
      master->pcdata->pet = ch;
    }

  if ( CanSeeCharacter( master, ch ) )
    {
      Act( AT_ACTION, "$n now follows you.", ch, NULL, master, TO_VICT );
    }

  Act( AT_ACTION, "You now follow $N.",  ch, NULL, master, TO_CHAR );
}

void StopFollowing( Character *ch )
{
  if ( !ch->master )
    {
      Bug( "%s: null master.", __FUNCTION__ );
      return;
    }

  if ( IsNpc(ch) && !IsNpc(ch->master) && ch->master->pcdata->pet == ch )
    {
      ch->master->pcdata->pet = NULL;
    }

  if ( IsAffectedBy(ch, AFF_CHARM) )
    {
      RemoveBit( ch->affected_by, AFF_CHARM );
      StripAffect( ch, gsn_charm_person );
    }

  if ( CanSeeCharacter( ch->master, ch ) )
    {
      Act( AT_ACTION, "$n stops following you.", ch, NULL, ch->master, TO_VICT );
    }

  Act( AT_ACTION, "You stop following $N.", ch, NULL, ch->master, TO_CHAR );

  ch->master = NULL;
  ch->leader = NULL;
}

void DieFollower( Character *ch )
{
  Character *fch = NULL;

  if ( ch->master )
    {
      StopFollowing( ch );
    }

  ch->leader = NULL;

  for ( fch = first_char; fch; fch = fch->next )
    {
      if ( fch->master == ch )
	{
	  StopFollowing( fch );
	}

      if ( fch->leader == ch )
	{
	  fch->leader = fch;
	}
    }
}

/*
 * It is very important that this be an equivalence relation:
 * (1) A ~ A
 * (2) if A ~ B then B ~ A
 * (3) if A ~ B  and B ~ C, then A ~ C
 */
bool IsInSameGroup( const Character *ach, const Character *bch )
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

void TalkAuction (const char *argument)
{
  Descriptor *d;
  char buf[MAX_STRING_LENGTH];

  sprintf (buf,"Auction: %s", argument); /* last %s to reset color */

  for (d = first_descriptor; d; d = d->next)
    {
      Character *original = d->original ? d->original : d->character; /* if switched */

      if ((d->connection_state == CON_PLAYING) && !IsBitSet(original->deaf,CHANNEL_AUCTION)
          && !IsBitSet(original->in_room->room_flags, ROOM_SILENCE) && IsAuthed(original))
	{
	  Act( AT_GOSSIP, buf, original, NULL, NULL, TO_CHAR );
	}
    }
}

/*
 * Language support functions. -- Altrag
 * 07/01/96
 */
bool CharacterKnowsLanguage( const Character *ch, int language, const Character *cch )
{
  short sn;

  if ( !IsNpc(ch) && IsImmortal(ch) )
    return true;
  if ( IsNpc(ch) && !ch->speaks ) /* No langs = knows all for npcs */
    return true;
  if ( IsNpc(ch) && IsBitSet(ch->speaks, (language & ~LANG_CLAN)) )
    return true;
  /* everyone does not KNOW common tongue
     if ( IsBitSet(language, LANG_COMMON) )
     return true;
  */
  if ( language & LANG_CLAN )
    {
      /* Clan = common for mobs.. snicker.. -- Altrag */
      if ( IsNpc(ch) || IsNpc(cch) )
        return true;
      if ( ch->pcdata->ClanInfo.Clan == cch->pcdata->ClanInfo.Clan
	   && ch->pcdata->ClanInfo.Clan != NULL )
        return true;
    }
  if ( !IsNpc( ch ) )
    {
      int lang;

      /* Racial languages for PCs */
      if ( IsBitSet(RaceTable[ch->race].language, language) )
        return true;

      for ( lang = 0; lang_array[lang] != LANG_UNKNOWN; lang++ )
        if ( IsBitSet(language, lang_array[lang]) &&
             IsBitSet(ch->speaks, lang_array[lang]) )
          {
            if ( (sn = LookupSkill(lang_names[lang])) != -1 )
              {
                if( GetRandomPercent()-1 < ch->pcdata->learned[sn] )
                  return true;
              }
          }
    }
  return false;
}

bool CharacterCanLearnLanguage( const Character *ch, int language )
{
  if ( language & LANG_CLAN )
    return false;
  if ( IsNpc(ch) || IsImmortal(ch) )
    return false;
  if ( RaceTable[ch->race].language & language )
    return false;
  if ( ch->speaks & language )
    {
      int lang;

      for ( lang = 0; lang_array[lang] != LANG_UNKNOWN; lang++ )
        if ( language & lang_array[lang] )
          {
            int sn;

            if ( !IsValidLanguage( lang_array[lang] ) )
              return false;

            if ( ( sn = LookupSkill( lang_names[lang] ) ) < 0 )
              {
                Bug( "Can_learn_lang: valid language without sn: %d", lang );
                continue;
              }
            if ( ch->pcdata->learned[sn] >= 99 )
              return false;
          }
    }

  if( IsValidLanguage( language ) )
    return true;

  return false;
}

/* Note: does not count racial language.  This is intentional (for now). */
int CountLanguages( int languages )
{
  int numlangs = 0;
  int looper = 0;

  for ( looper = 0; lang_array[looper] != LANG_UNKNOWN; looper++ )
    {
      if ( lang_array[looper] == LANG_CLAN )
	{
	  continue;
	}

      if ( languages & lang_array[looper] )
	{
	  numlangs++;
	}
    }

  return numlangs;
}
