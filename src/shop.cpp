/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
/* To include the prototype for fchmod() */
#define _DEFAULT_SOURCE

#if defined(__NetBSD__)
#define _NETBSD_SOURCE
#endif

/* To include the prototype for fileno() */
#define _POSIX_SOURCE
#endif

#include <cctype>
#include <cstring>
#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "pcdata.hpp"

#define COST_EQUATION  (int) (cost*CostEquation( obj ))

static float CostEquation( const Object *obj )
{
  float count = obj->Prototype->Count;

  count = urange( 50, count, 500 );

  return 100 / count;
}

/*
 * Shopping commands.
 */
Character *FindKeeper( const Character *ch )
{
  return FindKeeperQ( ch, true );
}

Character *FindKeeperQ( const Character *ch, bool message )
{
  Character *keeper = NULL;
  const Shop *pShop = NULL;

  for ( keeper = ch->InRoom->FirstPerson;
        keeper;
        keeper = keeper->NextInRoom )
    {
      if ( IsNpc(keeper) && (pShop = keeper->Prototype->Shop) != NULL )
	{
	  break;
	}
    }

  if ( !pShop )
    {
      if ( message )
	{
	  SendToCharacter( "You can't do that here.\r\n", ch );
	}

      return NULL;
    }

  /*
   * Shop hours.
   */
  if ( pShop->BusinessHours.Open > pShop->BusinessHours.Close )
    {
      if( time_info.Hour < pShop->BusinessHours.Open
	  && time_info.Hour > pShop->BusinessHours.Close )
        {
          do_say( keeper, "Sorry, come back later." );
          return NULL;
        }
    }
  else if( time_info.Hour < pShop->BusinessHours.Open
	   || time_info.Hour > pShop->BusinessHours.Close )
    {
      if( time_info.Hour > pShop->BusinessHours.Open )
	{
	  do_say( keeper, "Sorry, come back later." );
	  return NULL;
	}

      if ( time_info.Hour > pShop->BusinessHours.Close )
	{
	  do_say( keeper, "Sorry, come back tomorrow." );
	  return NULL;
	}
    }
  
  if ( !CharacterKnowsLanguage( keeper, ch->Speaking, ch ) )
    {
      do_say( keeper, "I can't understand you." );
      return NULL;
    }

  return keeper;
}

/*
 * repair commands.
 */
Character *FindFixer( const Character *ch )
{
  Character *keeper = NULL;
  const RepairShop *rShop = NULL;

  for ( keeper = ch->InRoom->FirstPerson;
        keeper;
        keeper = keeper->NextInRoom )
    {
      if ( IsNpc(keeper) && (rShop = keeper->Prototype->RepairShop) != NULL )
	{
	  break;
	}
    }

  if ( !rShop )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return NULL;
    }

  /*
   * Shop hours.
   */
  if ( time_info.Hour < rShop->BusinessHours.Open )
    {
      do_say( keeper, "Sorry, come back later." );
      return NULL;
    }

  if ( time_info.Hour > rShop->BusinessHours.Close )
    {
      do_say( keeper, "Sorry, come back tomorrow." );
      return NULL;
    }

  if ( !CharacterKnowsLanguage( keeper, ch->Speaking, ch ) )
    {
      do_say( keeper, "I can't understand you." );
      return NULL;
    }

  return keeper;
}

int GetObjectCost( const Character *ch, const Character *keeper, const Object *obj, bool fBuy )
{
  const Shop *pShop = NULL;
  int cost = 0;
  bool richcustomer = false;
  int profitmod = 0;

  if ( !obj || ( pShop = keeper->Prototype->Shop ) == NULL )
    {
      return 0;
    }

  if ( ( ch->Gold + (IsNpc(ch) ? 0 : ch->PCData->Bank) ) > (ch->TopLevel * 1000) )
    {
      richcustomer = true;
    }
  else
    {
      richcustomer = false;
    }

  if ( fBuy )
    {
      cost = (int) (obj->Cost * (80 + umin(ch->TopLevel, LEVEL_AVATAR))) / 100;

      profitmod = 13 - GetCurrentCharisma(ch) + (richcustomer ? 15 : 0)
        + ((urange(5,ch->TopLevel,LEVEL_AVATAR)-20)/2);
      cost = (int) (obj->Cost
                    * umax( (pShop->ProfitSell + 1), pShop->ProfitBuy + profitmod ) )
        / 100;
    }
  else
    {
      const Object *obj2 = NULL;
      int itype = 0;

      profitmod = GetCurrentCharisma(ch) - 13 - (richcustomer ? 15 : 0);
      cost = 0;

      for ( itype = 0; itype < MAX_TRADE; itype++ )
        {
          if ( obj->ItemType == pShop->BuyType[itype] )
            {
              cost = (int) (obj->Cost
                            * umin( (pShop->ProfitBuy - 1),
                                    pShop->ProfitSell + profitmod) ) / 100;
              break;
            }
        }

      for ( obj2 = keeper->FirstCarrying; obj2; obj2 = obj2->NextContent )
        {
          if ( obj->Prototype == obj2->Prototype )
            {
              cost /= (obj2->Count+1);
              break;
            }
        }

      cost = umin( cost , 2500 );
    }

  if( cost > 0 )
    {
      cost = COST_EQUATION;

      if( cost <= 0 )
	{
	  cost = 1;
	}
    }

  if ( obj->ItemType == ITEM_ARMOR )
    {
      cost = (int) (cost * (obj->Value[OVAL_ARMOR_CONDITION] + 1) / (obj->Value[OVAL_ARMOR_AC] + 1) );
    }

  if ( obj->ItemType == ITEM_WEAPON )
    {
      cost = (int) (cost * (obj->Value[OVAL_WEAPON_CONDITION] + 1) / INIT_WEAPON_CONDITION + 1);
      cost = (int) (cost * (obj->Value[OVAL_WEAPON_CHARGE] + 1) / (obj->Value[OVAL_WEAPON_MAX_CHARGE] + 1));
    }

  if ( obj->ItemType == ITEM_DEVICE )
    {
      cost = (int) (cost * (obj->Value[OVAL_DEVICE_CHARGES] + 1) / (obj->Value[OVAL_DEVICE_MAX_CHARGES] + 1));
    }

  return cost;
}

int GetRepairCost( const Character *keeper, const Object *obj )
{
  const RepairShop *rShop = NULL;
  int cost = 0;
  int itype = 0;
  bool found = false;

  if ( !obj || ( rShop = keeper->Prototype->RepairShop ) == NULL )
    {
      return 0;
    }

  for ( itype = 0; itype < MAX_FIX; itype++ )
    {
      if ( obj->ItemType == rShop->FixType[itype] )
        {
          cost = (int) (obj->Cost * rShop->ProfitFix / 100);
          found = true;
          break;
        }
    }

  if ( !found )
    {
      cost = -1;
    }

  if ( cost == 0 )
    {
      cost = 1;
    }

  if ( found && cost > 0 )
    {
      switch (obj->ItemType)
        {
        case ITEM_ARMOR:
          if (obj->Value[OVAL_ARMOR_CONDITION] >= obj->Value[OVAL_ARMOR_AC])
	    {
	      cost = -2;
	    }
          else
	    {
	      cost *= (obj->Value[OVAL_ARMOR_AC] - obj->Value[OVAL_ARMOR_CONDITION]);
	    }
          break;

        case ITEM_WEAPON:
          if (INIT_WEAPON_CONDITION == obj->Value[OVAL_WEAPON_CONDITION])
	    {
	      cost = -2;
	    }
          else
	    {
	      cost *= (INIT_WEAPON_CONDITION - obj->Value[OVAL_WEAPON_CONDITION]);
	    }
          break;

        case ITEM_DEVICE:
          if (obj->Value[OVAL_DEVICE_CHARGES] >= obj->Value[OVAL_DEVICE_MAX_CHARGES])
	    {
	      cost = -2;
	    }
          else
	    {
	      cost *= (obj->Value[OVAL_DEVICE_MAX_CHARGES] - obj->Value[OVAL_DEVICE_CHARGES]);
	    }

	default:
	  break;
        }
    }

  return cost;
}

/* Write vendor to file */
void WriteVendor( FILE *fp, Character *mob )
{
  if ( !IsNpc( mob ) || !fp )
    {
      return;
    }

  fprintf( fp, "Vnum     %ld\n", mob->Prototype->Vnum );

  if (mob->Gold > 0)
    {
      fprintf (fp, "Gold     %d\n",mob->Gold);
    }

  if ( mob->Home )
    {
      fprintf( fp, "Home     %ld\n", mob->Home->Vnum );
    }

  if (mob->Owner != NULL )
    {
      fprintf (fp, "Owner     %s~\n", mob->Owner );
    }

  if ( StrCmp( mob->ShortDescr, mob->Prototype->ShortDescr) )
    {
      fprintf( fp, "Short     %s~\n", mob->ShortDescr );
    }

  fprintf( fp, "Position   %d\n", mob->Position );
  fprintf( fp, "Flags   %d\n",   mob->Flags );
  fprintf( fp, "END\n" );
}

/* read vendor from file */
Character *ReadVendor( FILE *fp )
{
  Character *mob = NULL;
  const char *word = NULL;

  word = feof( fp ) ? "END" : ReadWord( fp );

  if ( !StrCmp(word, "Vnum") )
    {
      vnum_t vnum = ReadInt( fp );

      mob = CreateMobile( GetProtoMobile(vnum));

      if ( !mob )
        {
          for ( ; ; )
            {
              word = feof( fp ) ? "END" : ReadWord( fp );

              if ( !StrCmp( word, "END" ) )
		{
		  break;
		}
            }

          Bug("Fread_mobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; )
        {
          word = feof( fp ) ? "END" : ReadWord( fp );

          if ( !StrCmp( word, "END" ) )
	    {
	      break;
	    }
        }

      Bug("Fread_vendor: Vnum not found", 0 );
      return NULL;
    }

  for ( ; ;)
    {
      bool fMatch = false;
      vnum_t inroom = 0;
      Room *pRoomIndex = NULL;

      word = feof( fp ) ? "END" : ReadWord( fp );

      switch ( CharToUppercase(word[0]) )
	{
	case '*':
	  fMatch = true;
	  ReadToEndOfLine( fp );
	  break;

	case '#':
	  if ( !StrCmp( word, "#OBJECT" ) )
	    {
	      ReadObject ( mob, fp, OS_CARRY );
	    }
	  break;

	case 'D':
	  KEY( "Description", mob->Description, ReadStringToTilde(fp));
	  break;

	case 'E':
	  if ( !StrCmp( word, "END" ) )
	    {
	      Character *victim = NULL;
	      Character *vnext = NULL;
	      char buf[MAX_INPUT_LENGTH];
	      char vnum1[MAX_INPUT_LENGTH];

	      if ( inroom == INVALID_VNUM )
		{
		  inroom = ROOM_VNUM_VENSTOR;
		}

	      mob->Home = GetRoom(inroom);
	      pRoomIndex = GetRoom( inroom );

	      if ( !pRoomIndex )
		{
		  pRoomIndex = GetRoom( ROOM_VNUM_VENSTOR );
		  mob->Home = GetRoom( ROOM_VNUM_VENSTOR );
		}

	      mob->InRoom = pRoomIndex;

	      /* the following code is to make sure no more than one player owned vendor
		 is in the room - meckteck */
	      for ( victim = mob->InRoom->FirstPerson; victim; victim = vnext )
		{
		  vnext = victim->NextInRoom;

		  if (victim->Home != NULL)
		    {
		      ExtractCharacter( victim, true);
		      break;
		    }
		}

	      CharacterToRoom(mob, pRoomIndex);
	      sprintf(vnum1,"%ld", mob->Prototype->Vnum);
	      do_makeshop (mob, vnum1 );
	      sprintf (buf, mob->LongDescr, mob->Owner);
	      mob->LongDescr = CopyString( buf );
	      mob->Hit = 10000;
	      mob->MaxHit = 10000;
	      return mob;
	    }
	  break;

	case 'F':
	  KEY( "Flags", mob->Flags, ReadInt(fp));
	  break;

	case 'G':
	  KEY("Gold", mob->Gold, ReadInt(fp));
	  break;

	case 'H':
	  KEY("Home", inroom, ReadInt(fp) );
	  break;

	case 'L':
	  break;

	case 'N':
	  break;

	case 'O':
	  KEY ("Owner", mob->Owner, ReadStringToTilde (fp) );
	  break;

	case 'P':
	  KEY( "Position", mob->Position, (PositionType)ReadInt( fp ) );
	  break;

	case 'S':
	  KEY( "Short", mob->ShortDescr, ReadStringToTilde(fp));
	  break;
	}

      if ( !fMatch )
	{
	  Bug( "Fread_mobile: no match." );
	  Bug( word );
	}
    }

  return NULL;
}

void SaveVendor( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( !ch )
    {
      Bug( "Save_char_obj: null ch!", 0 );
      return;
    }

  DeEquipCharacter( ch );


  sprintf( strsave, "%s%s",VENDOR_DIR, Capitalize( ch->Owner ) );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      Bug( "Save_vendor: fopen" );
    }
  else
    {
      bool ferr = false;
#ifndef AMIGA
      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);
#endif
      fprintf( fp, "#VENDOR\n"          );
      WriteVendor( fp, ch );

      if ( ch->FirstCarrying )
	{
	  WriteObject( ch, ch->LastCarrying, fp, 0, OS_CARRY );
	}

      fprintf(fp, "#END\n" );
      ferr = ferror(fp);
      fclose( fp );

      if (ferr)
        {
          perror(strsave);
          Bug("Error writing temp file for %s -- not copying", strsave);
        }
    }

  ReEquipCharacter( ch );
}
