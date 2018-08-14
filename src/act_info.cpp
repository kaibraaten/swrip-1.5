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
#include <cstring>
#include "character.hpp"
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "object.hpp"

static std::string SeeHalucinatedObject( int ms, bool fShort );

int GetRaceFromName( const std::string &arg )
{
  int iRace;

  for ( iRace = 0; iRace < MAX_RACE; iRace++ )
    {
      if ( toupper(arg[0]) == toupper(RaceTable[iRace].Name[0])
           && !StringPrefix( arg, RaceTable[iRace].Name ) )
	{
	  break;
	}
    }

  if( iRace == MAX_RACE )
    {
      return -1;
    }

  return iRace;
}

bool RaceIsAvailableToPlayers( const Race *race )
{
  if( SysData.ExtendedRaceSelection )
    {
      return true;
    }
  else
    {
      return race->AvailableForSelection;
    }
}

int GetClassFromName( const std::string &arg )
{
  int iClass;

  for ( iClass = 0; iClass < MAX_ABILITY; iClass++ )
    {
      if ( toupper(arg[0]) == toupper(AbilityName[iClass][0])
           && !StringPrefix( arg, AbilityName[iClass] ) )
	{
	  break;
	}
    }

  if( iClass == MAX_ABILITY )
    {
      return -1;
    }

  return iClass;
}

char *FormatObjectToCharacter( const Object *obj, const Character *ch, bool fShort )
{
  static char buf[MAX_STRING_LENGTH];

  buf[0] = '\0';

  if ( IS_OBJ_STAT(obj, ITEM_INVIS) )
    {
      strcat( buf, "(Invis) " );
    }

  if ( ( IsAffectedBy(ch, AFF_DETECT_MAGIC) || IsImmortal(ch) )
       && IS_OBJ_STAT(obj, ITEM_MAGIC) )
    {
      strcat( buf, "&B(Blue Aura)&w " );
    }

  if ( IS_OBJ_STAT(obj, ITEM_GLOW) )
    {    
      strcat( buf, "(Glowing) " );
    }

  if ( IS_OBJ_STAT(obj, ITEM_HUM) )
    {
      strcat( buf, "(Humming) " );
    }

  if ( IS_OBJ_STAT(obj, ITEM_HIDDEN) )
    {
      strcat( buf, "(Hidden) " );
    }

  if ( IS_OBJ_STAT(obj, ITEM_BURRIED) )
    {
      strcat( buf, "(Burried) " );
    }

  if ( IsImmortal(ch)
       && IS_OBJ_STAT(obj, ITEM_PROTOTYPE) )
    {
      strcat( buf, "(PROTO) " );
    }

  if ( IsAffectedBy(ch, AFF_DETECTTRAPS) && IsObjectTrapped(obj) )
    {
      strcat( buf, "(Trap) "  );
    }

  if ( fShort )
    {
      if ( obj->ShortDescr )
	{
	  strcat( buf, obj->ShortDescr );
	}
    }
  else
    {
      if ( obj->Description )
	{
	  strcat( buf, obj->Description );
	}
    }

  return buf;
}

/*
 * Some increasingly freaky halucinated objects         -Thoric
 */
static std::string SeeHalucinatedObject( int ms, bool fShort )
{
  int sms = urange( 1, (ms+10)/5, 20 );

  if ( fShort )
    {
      switch( GetRandomNumberFromRange( 6-urange(1,sms/2,5), sms ) )
	{
	case  1: return "a sword";
	case  2: return "a stick";
	case  3: return "something shiny";
	case  4: return "something";
	case  5: return "something interesting";
	case  6: return "something colorful";
	case  7: return "something that looks cool";
	case  8: return "a nifty thing";
	case  9: return "a cloak of flowing colors";
	case 10: return "a mystical flaming sword";
	case 11: return "a swarm of insects";
	case 12: return "a deathbane";
	case 13: return "a figment of your imagination";
	case 14: return "your gravestone";
	case 15: return "the long lost boots of Ranger Thoric";
	case 16: return "a glowing tome of arcane knowledge";
	case 17: return "a long sought secret";
	case 18: return "the meaning of it all";
	case 19: return "the answer";
	case 20: return "the key to life, the universe and everything";
	}
    }

  switch( GetRandomNumberFromRange( 6-urange(1,sms/2,5), sms ) )
    {
    case  1: return "A nice looking sword catches your eye.";
    case  2: return "The ground is covered in small sticks.";
    case  3: return "Something shiny catches your eye.";
    case  4: return "Something catches your attention.";
    case  5: return "Something interesting catches your eye.";
    case  6: return "Something colorful flows by.";
    case  7: return "Something that looks cool calls out to you.";
    case  8: return "A nifty thing of great importance stands here.";
    case  9: return "A cloak of flowing colors asks you to wear it.";
    case 10: return "A mystical flaming sword awaits your grasp.";
    case 11: return "A swarm of insects buzzes in your face!";
    case 12: return "The extremely rare Deathbane lies at your feet.";
    case 13: return "A figment of your imagination is at your command.";
    case 14: return "You notice a gravestone here... upon closer examination, it reads your name.";
    case 15: return "The long lost boots of Ranger Thoric lie off to the side.";
    case 16: return "A glowing tome of arcane knowledge hovers in the air before you.";
    case 17: return "A long sought secret of all mankind is now clear to you.";
    case 18: return "The meaning of it all, so simple, so clear... of course!";
    case 19: return "The answer.  One.  It's always been One.";
    case 20: return "The key to life, the universe and everything awaits your hand.";
    }

  return "Whoa!!!";
}


/*
 * Show a list to a character.
 * Can coalesce duplicated items.
 */
void ShowObjectListToCharacter( const Object *list, Character *ch, bool fShort, bool fShowNothing )
{
  std::list<Object*> objects;
  
  for ( const Object *obj = list; obj; obj = obj->NextContent )
    {
      objects.push_back(const_cast<Object*>(obj));
    }

  ShowObjectListToCharacter(objects, ch, fShort, fShowNothing);
}

void ShowObjectListToCharacter( const std::list<Object*> &list, Character *ch,
                                bool fShort, bool fShowNothing )
{
  char **prgpstrShow = nullptr;
  int *prgnShow = nullptr;
  int *pitShow = nullptr;
  char *pstrShow = nullptr;
  int nShow = 0;
  int iShow = 0;
  int count = list.size(), offcount = 0, tmp = 0, cnt = 0;
  bool fCombine = false;

  if ( !ch->Desc )
    return;

  /*
   * if there's no list... then don't do all this crap!  -Thoric
   */
  if ( list.empty() )
    {
      if ( fShowNothing )
        {
          if ( IsNpc(ch) || IsBitSet(ch->Flags, PLR_COMBINE) )
            ch->Echo( "     " );
          
          ch->Echo( "Nothing.\r\n" );
        }
      return;
    }
  /*
   * Alloc space for output lines.
   */

  int ms  = (ch->MentalState ? ch->MentalState : 1)
    * (IsNpc(ch) ? 1 : (ch->PCData->Condition[COND_DRUNK] ? (ch->PCData->Condition[COND_DRUNK]/12) : 1));

  /*
   * If not mentally stable...
   */
  if ( abs(ms) > 40 )
    {
      offcount = urange( -(count), (count * ms) / 100, count*2 );
      if ( offcount < 0 )
        offcount += GetRandomNumberFromRange(0, abs(offcount));
      else
        if ( offcount > 0 )
          offcount -= GetRandomNumberFromRange(0, offcount);
    }
  else
    offcount = 0;

  if ( count + offcount <= 0 )
    {
      if ( fShowNothing )
        {
          if ( IsNpc(ch) || IsBitSet(ch->Flags, PLR_COMBINE) )
            ch->Echo( "     " );

          ch->Echo( "Nothing.\r\n" );
        }
      return;
    }

  AllocateMemory( prgpstrShow,  char*,  count + ((offcount > 0) ? offcount : 0) );
  AllocateMemory( prgnShow,             int,    count + ((offcount > 0) ? offcount : 0) );
  AllocateMemory( pitShow,              int,    count + ((offcount > 0) ? offcount : 0) );
  nShow = 0;
  tmp           = (offcount > 0) ? offcount : 0;
  cnt           = 0;

  /*
   * Format the list of objects.
   */
  for(Object *obj : list)
    {
      if ( offcount < 0 && ++cnt > (count + offcount) )
        break;

      if ( tmp > 0 && NumberBits(1) == 0 )
        {
          prgpstrShow [nShow] = CopyString( SeeHalucinatedObject(ms, fShort) );
          prgnShow      [nShow] = 1;
          pitShow       [nShow] = GetRandomNumberFromRange( ITEM_LIGHT, ITEM_BOOK );
          nShow++;
          --tmp;
        }
      if ( obj->WearLoc == WEAR_NONE
           && CanSeeObject( ch, obj )
           && ( !IsNullOrEmpty( obj->Description ) || ( IsBitSet(ch->Flags, PLR_HOLYLIGHT) || IsNpc(ch) ) )
           && (obj->ItemType != ITEM_TRAP || IsAffectedBy(ch, AFF_DETECTTRAPS) ) )
        {
          pstrShow = FormatObjectToCharacter( obj, ch, fShort );
          fCombine = false;

          if ( IsNpc(ch) || IsBitSet(ch->Flags, PLR_COMBINE) )
            {
              /*
               * Look for duplicates, case sensitive.
               * Matches tend to be near end so run loop backwords.
               */
              for ( iShow = nShow - 1; iShow >= 0; iShow-- )
                {
                  if ( !StrCmp( prgpstrShow[iShow], pstrShow ) )
                    {
                      prgnShow[iShow] += obj->Count;
                      fCombine = true;
                      break;
                    }
                }
            }

          pitShow[nShow] = obj->ItemType;
          /*
           * Couldn't combine, or didn't want to.
           */
          if ( !fCombine )
            {
              prgpstrShow [nShow] = CopyString( pstrShow );
              prgnShow    [nShow] = obj->Count;
              nShow++;
            }
        }
    }
  if ( tmp > 0 )
    {
      int x;
      for ( x = 0; x < tmp; x++ )
        {
          prgpstrShow [nShow] = CopyString( SeeHalucinatedObject(ms, fShort) );
          prgnShow      [nShow] = 1;
          pitShow       [nShow] = GetRandomNumberFromRange( ITEM_LIGHT, ITEM_BOOK );
          nShow++;
        }
    }

  /*
   * Output the formatted list.         -Color support by Thoric
   */
  for ( iShow = 0; iShow < nShow; iShow++ )
    {
      switch(pitShow[iShow])
	{
	default:
	  SetCharacterColor( AT_OBJECT, ch );
	  break;

	case ITEM_BLOOD:
	  SetCharacterColor( AT_BLOOD, ch );
	  break;

	case ITEM_MONEY:
	case ITEM_TREASURE:
	  SetCharacterColor( AT_YELLOW, ch );
	  break;

	case ITEM_FOOD:
	  SetCharacterColor( AT_HUNGRY, ch );
	  break;

	case ITEM_DRINK_CON:
	case ITEM_FOUNTAIN:
	  SetCharacterColor( AT_THIRSTY, ch );
	  break;

	case ITEM_FIRE:
	  SetCharacterColor( AT_FIRE, ch );
	  break;

	case ITEM_SCROLL:
	case ITEM_WAND:
	case ITEM_STAFF:
	  break;
	}

      if ( fShowNothing )
	{
	  ch->Echo( "     " );
	}

      ch->Echo( prgpstrShow[iShow] );

      if ( prgnShow[iShow] != 1 )
	{
	  ch->Echo( " (%d)", prgnShow[iShow] );
	}

      ch->Echo( "\r\n" );
      FreeMemory( prgpstrShow[iShow] );
    }

  if ( fShowNothing && nShow == 0 )
    {
      if ( IsNpc(ch) || IsBitSet(ch->Flags, PLR_COMBINE) )
	{
	  ch->Echo( "     " );
	}

      ch->Echo( "Nothing.\r\n" );
    }

  /*
   * Clean up.
   */
  FreeMemory( prgpstrShow );
  FreeMemory( prgnShow );
  FreeMemory( pitShow );
}

void ShowCharacterCondition( const Character *ch, const Character *victim )
{
  char buf[MAX_STRING_LENGTH];
  int percent;

  if ( victim->MaxHit > 0 )
    percent = ( 100 * victim->Hit ) / victim->MaxHit;
  else
    percent = -1;


  strcpy( buf, PERS(victim, ch) );

  if ( (IsNpc ( victim ) && IsBitSet( victim->Flags , ACT_DROID ) ) ||
       ( victim->Race == RACE_DROID ) )
    {

      if ( percent >= 100 ) strcat( buf, " is in perfect condition.\r\n"  );
      else if ( percent >=  90 ) strcat( buf, " is slightly scratched.\r\n" );
      else if ( percent >=  80 ) strcat( buf, " has a few scrapes.\r\n"     );
      else if ( percent >=  70 ) strcat( buf, " has some dents.\r\n"         );
      else if ( percent >=  60 ) strcat( buf, " has a couple holes in its plating.\r\n"    );
      else if ( percent >=  50 ) strcat( buf, " has a many broken pieces.\r\n" );
      else if ( percent >=  40 ) strcat( buf, " has many exposed circuits.\r\n"    );
      else if ( percent >=  30 ) strcat( buf, " is leaking oil.\r\n"   );
      else if ( percent >=  20 ) strcat( buf, " has smoke coming out of it.\r\n"       );
      else if ( percent >=  10 ) strcat( buf, " is almost completely broken.\r\n"        );
      else                       strcat( buf, " is about to EXPLODE.\r\n"              );

    }
  else
    {

      if ( percent >= 100 ) strcat( buf, " is in perfect health.\r\n"  );
      else if ( percent >=  90 ) strcat( buf, " is slightly scratched.\r\n" );
      else if ( percent >=  80 ) strcat( buf, " has a few bruises.\r\n"     );
      else if ( percent >=  70 ) strcat( buf, " has some cuts.\r\n"         );
      else if ( percent >=  60 ) strcat( buf, " has several wounds.\r\n"    );
      else if ( percent >=  50 ) strcat( buf, " has many nasty wounds.\r\n" );
      else if ( percent >=  40 ) strcat( buf, " is bleeding freely.\r\n"    );
      else if ( percent >=  30 ) strcat( buf, " is covered in blood.\r\n"   );
      else if ( percent >=  20 ) strcat( buf, " is leaking guts.\r\n"       );
      else if ( percent >=  10 ) strcat( buf, " is almost dead.\r\n"        );
      else                       strcat( buf, " is DYING.\r\n"              );

    }
  
  buf[0] = CharToUppercase(buf[0]);
  ch->Echo( buf );
}

