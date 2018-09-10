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

#include <cassert>
#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "shop.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "alias.hpp"
#include "race.hpp"
#include "playerrepository.hpp"

/*
 * Increment with every major format change.
 */
#define SAVEVERSION     3

/*
 * Array to keep track of equipment temporarily.                -Thoric
 */
Object *save_equipment[MAX_WEAR][8];
Character *quitting_char = NULL;
Character *loading_char = NULL;
Character *saving_char = NULL;

int file_ver = 0;

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];
extern int falling;

/*
 * Array of containers read for proper re-nesting of objects.
 */
static Object *rgObjNest[MAX_NEST];

/*
 * Local functions.
 */
static bool HasAnyOvalues( const Object *obj );
static void WriteCharacter( const Character *ch, FILE *fp );
static void ReadCharacter( Character *ch, FILE *fp, bool preload );
static Character *ReadMobile( FILE *fp );
static void WriteMobile( FILE *fp, const Character *mob );

void SaveHome( Character *ch )
{
  if ( ch->PlayerHome )
    {
      FILE *fp = NULL;
      char filename[256];
      short templvl = 0;

      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->Name[0]),
               Capitalize( ch->Name ).c_str() );

      if ( ( fp = fopen( filename, "w" ) ) )
        {
          templvl = ch->TopLevel;
          ch->TopLevel = LEVEL_AVATAR;           /* make sure EQ doesn't get lost */

          for(const Object *obj : Reverse(ch->PlayerHome->Objects()))
	    {
	      WriteObject(ch, obj, fp, 0, OS_CARRY );
	    }

          fprintf( fp, "#END\n" );
          ch->TopLevel = templvl;
          fclose( fp );
        }
    }
}

/*
 * Un-equip character before saving to ensure proper    -Thoric
 * stats are saved in case of changes to or removal of EQ
 */
void DeEquipCharacter( Character *ch )
{
  for ( int x = 0; x < MAX_WEAR; x++ )
    {
      for ( int y = 0; y < MAX_LAYERS; y++ )
	{
	  save_equipment[x][y] = NULL;
	}
    }

  for ( Object *obj : ch->Objects() )
    {
      if ( obj->WearLoc > WEAR_NONE && obj->WearLoc < MAX_WEAR )
	{
          int x = 0;
          
	  for ( x = 0; x < MAX_LAYERS; x++ )
	    {
	      if ( !save_equipment[obj->WearLoc][x] )
		{
		  save_equipment[obj->WearLoc][x] = obj;
		  break;
		}
	    }

	  if ( x == MAX_LAYERS )
	    {
	      Log->Bug( "%s had on more than %d layers of clothing in one location (%d): %s",
		   ch->Name.c_str(), MAX_LAYERS, obj->WearLoc, obj->Name.c_str() );
	    }

	  UnequipCharacter(ch, obj);
	}
    }
}

/*
 * Re-equip character                                   -Thoric
 */
void ReEquipCharacter( Character *ch )
{
  int x = 0;
  int y = 0;

  for ( x = 0; x < MAX_WEAR; x++ )
    {
      for ( y = 0; y < MAX_LAYERS; y++ )
	{
	  if ( save_equipment[x][y] != NULL )
	    {
	      if ( quitting_char != ch )
		{
		  EquipCharacter(ch, save_equipment[x][y], (WearLocation)x);
		}

	      save_equipment[x][y] = NULL;
	    }
	  else
	    {
	      break;
	    }
	}
    }
}

/*
 * Save a character and inventory.
 * Would be cool to save NPC's too for quest purposes,
 *   some of the infrastructure is provided.
 */
void SaveCharacter( Character *ch )
{
  PlayerCharacters->Save(ch);
  //return;
  
  assert(ch != nullptr);
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( IsNpc(ch) || !IsAuthed(ch) )
    {
      return;
    }

  saving_char = ch;

  /* save pc's clan's data while we're at it to keep the data in sync */
  if ( !IsNpc(ch) && ch->PCData->ClanInfo.Clan )
    {
      UpdateClanMember( ch );
    }

  if ( ch->Desc && ch->Desc->Original )
    {
      ch = ch->Desc->Original;
    }

  DeEquipCharacter( ch );

  ch->PCData->SaveTime = current_time;
  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(ch->Name[0]),
           Capitalize( ch->Name ).c_str() );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IsBitSet( SysData.SaveFlags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->Name[0]),
               Capitalize( ch->Name ).c_str() );
      rename( strsave, strback );
    }

  /*
   * Save immortal stats, level & vnums for wizlist             -Thoric
   * and do_vnums command
   *
   * Also save the player flags so we the wizlist builder can see
   * who is a guest and who is retired.
   */
  if ( GetTrustLevel(ch) > LEVEL_AVATAR )
    {
      sprintf( strback, "%s%s", GOD_DIR, Capitalize( ch->Name ).c_str() );

      if ( ( fp = fopen( strback, "w" ) ) == NULL )
        {
          Log->Bug( "%s: fopen", __FUNCTION__ );
          perror( strsave );
        }
      else
        {
          fprintf( fp, "Level        %d\n", ch->TopLevel );
          fprintf( fp, "Pcflags      %d\n", ch->PCData->Flags );

          if ( ch->PCData->Build.VnumRanges.Room.First && ch->PCData->Build.VnumRanges.Room.Last )
	    {
	      fprintf( fp, "RoomRange     %ld %ld\n", ch->PCData->Build.VnumRanges.Room.First,
		       ch->PCData->Build.VnumRanges.Room.Last );
	    }

          if ( ch->PCData->Build.VnumRanges.Object.First && ch->PCData->Build.VnumRanges.Object.Last )
	    {
	      fprintf( fp, "ObjectRange   %ld %ld\n", ch->PCData->Build.VnumRanges.Object.First,
		       ch->PCData->Build.VnumRanges.Object.Last );
	    }

          if ( ch->PCData->Build.VnumRanges.Mob.First && ch->PCData->Build.VnumRanges.Mob.Last )
	    {
	      fprintf( fp, "MobRange      %ld %ld\n", ch->PCData->Build.VnumRanges.Mob.First,
		       ch->PCData->Build.VnumRanges.Mob.Last );
	    }

          fclose( fp );
        }
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      Log->Bug( "%s: fopen", __FUNCTION__ );
      perror( strsave );
    }
  else
    {
      WriteCharacter( ch, fp );

      for(const Object *obj : Reverse(ch->Objects()))
	{
	  WriteObject( ch, obj, fp, 0, OS_CARRY );
	}

      if ( ch->PCData && !ch->PCData->Comments().empty() )
	{
	  WriteComments( ch, fp );
	}

      if ( ch->PCData->Pet )
	{
	  WriteMobile( fp, ch->PCData->Pet );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  ReEquipCharacter( ch );

  WriteCorpses(ch, "");
  quitting_char = NULL;
  saving_char   = NULL;
}

void SaveClone( Character *ch )
{
  assert(ch != nullptr);

  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( IsNpc(ch) || !IsAuthed(ch) )
    {
      return;
    }

  if ( ch->Desc && ch->Desc->Original )
    {
      ch = ch->Desc->Original;
    }

  DeEquipCharacter( ch );
  ch->PCData->Clones++;

  ch->PCData->SaveTime = current_time;
  sprintf( strsave, "%s%c/%s.clone", PLAYER_DIR, tolower(ch->Name[0]),
           Capitalize( ch->Name ).c_str() );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IsBitSet( SysData.SaveFlags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->Name[0]),
               Capitalize( ch->Name ).c_str() );
      rename( strsave, strback );
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      Log->Bug( "Save_char_obj: fopen", 0 );
      perror( strsave );
    }
  else
    {
      WriteCharacter( ch, fp );

      if ( ch->PCData && !ch->PCData->Comments().empty() )
	{
	  WriteComments( ch, fp );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  ch->PCData->Clones--;
  ReEquipCharacter( ch );

  WriteCorpses(ch, "");
  quitting_char = NULL;
  saving_char   = NULL;
}

/*
 * Write the char.
 */
static void WriteCharacter( const Character *ch, FILE *fp )
{
  int sn = 0;
  int drug = 0;
  const Skill *skill = NULL;

  fprintf( fp, "#%s\n", IsNpc(ch) ? "MOB" : "PLAYER"           );

  fprintf( fp, "Version      %d\n",   SAVEVERSION               );
  fprintf( fp, "Name         %s~\n",    ch->Name.c_str()                );

  if ( !ch->ShortDescr.empty() )
    {
      fprintf( fp, "ShortDescr   %s~\n",  ch->ShortDescr.c_str() );
    }

  if ( !ch->LongDescr.empty() )
    {
      fprintf( fp, "LongDescr    %s~\n",  ch->LongDescr.c_str()  );
    }

  if ( !ch->Description.empty() )
    {
      fprintf( fp, "Description  %s~\n",  ch->Description.c_str() );
    }

  fprintf( fp, "Sex          %d\n",     ch->Sex                 );
  fprintf( fp, "Race         %d\n",     ch->Race                );
  fprintf( fp, "MainAbility  %d\n",     ch->Ability.Main        );
  fprintf( fp, "Languages    %d %d\n", ch->Speaks, ch->Speaking );
  fprintf( fp, "Toplevel     %d\n",     ch->TopLevel           );

  if ( ch->Trust )
    {
      fprintf( fp, "Trust        %d\n",   ch->Trust               );
    }

  fprintf( fp, "Played       %d\n",
           ch->PCData->Played + (int) (current_time - ch->PCData->Logon)                );
  fprintf( fp, "Room         %ld\n",
           (  ch->InRoom == GetRoom( ROOM_VNUM_LIMBO )
              && ch->WasInRoom )
           ? ch->WasInRoom->Vnum
           : ch->InRoom->Vnum );

  if ( ch->PlayerHome != NULL )
    {
      fprintf( fp, "PlrHome      %ld\n",          ch->PlayerHome->Vnum );
    }

  fprintf( fp, "HpManaMove   %d %d 0 0 %d %d\n",
           ch->HitPoints.Current, ch->HitPoints.Max,
           ch->Fatigue.Current, ch->Fatigue.Max );
  fprintf( fp, "Force        %d %d %d %d\n",
           ch->PermStats.Frc, ch->StatMods.Frc,
           ch->Mana.Current, ch->Mana.Max );
  fprintf( fp, "Gold         %d\n",     ch->Gold                );
  fprintf( fp, "Bank         %ld\n",    ch->PCData->Bank                );

  {
    int ability;
    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      fprintf( fp, "Ability        %d %d %ld\n",
               ability, GetAbilityLevel( ch, ability ), GetAbilityXP( ch, ability ) );
  }

  fprintf( fp, "Clones         %d\n",   ch->PCData->Clones              );
  fprintf( fp, "Salary_time         %ld\n",     ch->PCData->ClanInfo.SalaryDate );
  fprintf( fp, "Salary         %d\n",   ch->PCData->ClanInfo.Salary );
  fprintf( fp, "Jailvnum         %ld\n", ch->PCData->JailVnum   );

  if ( ch->Flags )
    {
      fprintf( fp, "Act          %d\n", ch->Flags                   );
    }

  if ( ch->AffectedBy )
    {
      fprintf( fp, "AffectedBy   %d\n",   ch->AffectedBy         );
    }

  fprintf( fp, "Position     %d\n",
           ch->Position == POS_FIGHTING ? POS_STANDING : ch->Position );

  fprintf( fp, "SavingThrows %d %d %d %d %d\n",
           ch->Saving.PoisonDeath,
           ch->Saving.Wand,
           ch->Saving.ParaPetri,
           ch->Saving.Breath,
           ch->Saving.SpellStaff                       );
  fprintf( fp, "Alignment    %d\n",     ch->Alignment           );
  fprintf( fp, "Hitroll      %d\n",     ch->HitRoll             );
  fprintf( fp, "Damroll      %d\n",     ch->DamRoll             );
  fprintf( fp, "Armor        %d\n",     ch->ArmorClass          );

  if ( ch->Wimpy )
    {
      fprintf( fp, "Wimpy        %d\n",   ch->Wimpy               );
    }

  if ( ch->Deaf )
    {
      fprintf( fp, "Deaf         %d\n",   ch->Deaf                );
    }

  if ( ch->Resistant )
    {
      fprintf( fp, "Resistant    %d\n",   ch->Resistant           );
    }

  if ( ch->Immune )
    {
      fprintf( fp, "Immune       %d\n",   ch->Immune              );
    }

  if ( ch->Susceptible )
    {
      fprintf( fp, "Susceptible  %d\n",   ch->Susceptible         );
    }

  if ( ch->PCData && ch->PCData->RestoreTime )
    {
      fprintf( fp, "Restore_time %ld\n",ch->PCData->RestoreTime );
    }

  if ( ch->MentalState != -10 )
    {
      fprintf( fp, "Mentalstate  %d\n",   ch->MentalState        );
    }

  if ( IsNpc(ch) )
    {
      fprintf( fp, "Vnum         %ld\n", ch->Prototype->Vnum    );
      fprintf( fp, "Mobinvis     %d\n", ch->MobInvis            );
    }
  else
    {
      fprintf( fp, "Password     %s~\n", ch->PCData->Password.c_str() );
      fprintf( fp, "Lastplayed   %d\n", (int)current_time );

      if ( !ch->PCData->BamfIn.empty() )
	{
	  fprintf( fp, "Bamfin       %s~\n",      ch->PCData->BamfIn.c_str()      );
	}

      if ( !ch->PCData->Email.empty() )
	{
	  fprintf( fp, "Email       %s~\n",       ch->PCData->Email.c_str()       );
	}

      if ( !ch->PCData->BamfOut.empty() )
	{
	  fprintf( fp, "Bamfout      %s~\n",      ch->PCData->BamfOut.c_str()     );
	}

      if ( !ch->PCData->Rank.empty() )
	{
	  fprintf( fp, "Rank         %s~\n",      ch->PCData->Rank.c_str()        );
	}

      if ( !ch->PCData->Bestowments.empty() )
	{
	  fprintf( fp, "Bestowments  %s~\n",      ch->PCData->Bestowments.c_str() );
	}

      fprintf( fp, "Title        %s~\n",        ch->PCData->Title.c_str()       );

      if ( !ch->PCData->HomePage.empty() )
	{
	  fprintf( fp, "Homepage     %s~\n",      ch->PCData->HomePage.c_str()    );
	}

      if ( !ch->PCData->Bio.empty() )
	{
	  fprintf( fp, "Bio          %s~\n",      ch->PCData->Bio.c_str()         );
	}

      if ( !ch->PCData->AuthedBy.empty() )
	{
	  fprintf( fp, "AuthedBy     %s~\n",      ch->PCData->AuthedBy.c_str()   );
	}

      if ( ch->PCData->MinSnoop )
	{
	  fprintf( fp, "Minsnoop     %d\n",       ch->PCData->MinSnoop   );
	}

      if ( !ch->PCData->Prompt.empty() )
	{
	  fprintf( fp, "Prompt       %s~\n",      ch->PCData->Prompt.c_str()      );
	}

      for(const Alias *alias : ch->PCData->Aliases())
        {
          if(alias->Name.empty() || alias->Command.empty())
	    {
	      continue;
	    }

          fprintf( fp, "Alias        %s~ %s~\n", alias->Name.c_str(), alias->Command.c_str() );
        }

      fprintf( fp, "Addiction   ");

      for ( drug = 0 ; drug <=9 ; drug++ )
	{
	  fprintf( fp, " %d",     ch->PCData->Addiction[drug] );
	}

      fprintf( fp, "\n");
      fprintf( fp, "Druglevel   ");

      for ( drug = 0 ; drug < 10 ; drug++ )
	{
	  fprintf( fp, " %d",     ch->PCData->DrugLevel[drug] );
	}

      fprintf( fp, "\n");

      if ( ch->PCData->WantedFlags )
	{
	  fprintf( fp, "Wanted       %d\n",       ch->PCData->WantedFlags );
	}

      if ( IsImmortal( ch ) || ch->PCData->Build.Area )
        {
          fprintf( fp, "WizInvis     %d\n", ch->PCData->WizInvis );

          if ( ch->PCData->Build.VnumRanges.Room.First && ch->PCData->Build.VnumRanges.Room.Last )
	    {
	      fprintf( fp, "RoomRange    %ld %ld\n", ch->PCData->Build.VnumRanges.Room.First,
		       ch->PCData->Build.VnumRanges.Room.Last );
	    }

          if ( ch->PCData->Build.VnumRanges.Object.First && ch->PCData->Build.VnumRanges.Object.Last )
	    {
	      fprintf( fp, "ObjRange     %ld %ld\n", ch->PCData->Build.VnumRanges.Object.First,
		       ch->PCData->Build.VnumRanges.Object.Last );
	    }

          if ( ch->PCData->Build.VnumRanges.Mob.First && ch->PCData->Build.VnumRanges.Mob.Last )
	    {
	      fprintf( fp, "MobRange     %ld %ld\n", ch->PCData->Build.VnumRanges.Mob.First,
		       ch->PCData->Build.VnumRanges.Mob.Last );
	    }
        }

      if ( ch->PCData->ClanInfo.Clan != nullptr )
	{
	  fprintf( fp, "Clan         %s~\n",      ch->PCData->ClanInfo.Clan->Name.c_str()   );
	}

      fprintf( fp, "Flags        %d\n", ch->PCData->Flags       );

      if ( ch->PCData->ReleaseDate > current_time )
	{
	  fprintf( fp, "Helled       %d %s~\n",
		   (int)ch->PCData->ReleaseDate, ch->PCData->HelledBy.c_str() );
	}

      if ( ch->PCData->PKills )
	{
	  fprintf( fp, "PKills       %d\n",       ch->PCData->PKills      );
	}

      if ( ch->PCData->PDeaths )
	{
	  fprintf( fp, "PDeaths      %d\n",       ch->PCData->PDeaths     );
	}

      if ( !ch->PCData->Target.empty() )
	{
	  fprintf( fp, "Targ %s~\n",      ch->PCData->Target.c_str()      );
	}

      if ( GetTimer( ch , TIMER_PKILLED)
           && ( GetTimer( ch , TIMER_PKILLED) > 0 ) )
	{
	  fprintf( fp, "PTimer       %d\n",     GetTimer(ch, TIMER_PKILLED));
	}

      fprintf( fp, "MKills       %d\n", ch->PCData->MKills      );
      fprintf( fp, "MDeaths      %d\n", ch->PCData->MDeaths     );

      if ( ch->PCData->IllegalPk )
	{
	  fprintf( fp, "IllegalPK    %d\n",       ch->PCData->IllegalPk  );
	}

      fprintf( fp, "AttrPerm     %d %d %d %d %d %d %d\n",
               ch->PermStats.Str,
               ch->PermStats.Int,
               ch->PermStats.Wis,
               ch->PermStats.Dex,
               ch->PermStats.Con,
               ch->PermStats.Cha,
               ch->PermStats.Lck );

      fprintf( fp, "AttrMod      %d %d %d %d %d %d %d\n",
               ch->StatMods.Str,
               ch->StatMods.Int,
               ch->StatMods.Wis,
               ch->StatMods.Dex,
               ch->StatMods.Con,
               ch->StatMods.Cha,
               ch->StatMods.Lck );

      fprintf( fp, "Condition    %d %d %d %d\n",
               ch->PCData->Condition[0],
               ch->PCData->Condition[1],
               ch->PCData->Condition[2],
               ch->PCData->Condition[3] );

      if ( ch->Desc && !ch->Desc->Remote.Hostname.empty() )
	{
	  fprintf( fp, "Site         %s\n", ch->Desc->Remote.Hostname.c_str() );
	}
      else
	{
	  fprintf( fp, "Site         (Link-Dead)\n" );
	}

      for ( sn = 1; sn < TopSN; sn++ )
        {
          if ( !SkillTable[sn]->Name.empty() && ch->PCData->Learned[sn] > 0 )
	    {
	      switch( SkillTable[sn]->Type )
		{
		default:
		  fprintf( fp, "Skill        %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str() );
		  break;

		case SKILL_SPELL:
		  fprintf( fp, "Spell        %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str() );
		  break;

		case SKILL_WEAPON:
		  fprintf( fp, "Weapon       %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str() );
		  break;

		case SKILL_TONGUE:
		  fprintf( fp, "Tongue       %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str() );
		  break;
		}
	    }
        }
    }

  for(const Affect *paf : ch->Affects())
    {
      if ( paf->Type >= 0 && (skill=GetSkill(paf->Type)) == NULL )
	{
	  continue;
	}

      if ( paf->Type >= 0 && paf->Type < TYPE_PERSONAL )
	{
	  fprintf( fp, "AffectData   '%s' %3d %3d %3d %10d\n",
		   skill->Name.c_str(),
		   paf->Duration,
		   paf->Modifier,
		   paf->Location,
		   paf->AffectedBy
		   );
	}
      else
	{
	  fprintf( fp, "Affect       %3d %3d %3d %3d %10d\n",
		   paf->Type,
		   paf->Duration,
		   paf->Modifier,
		   paf->Location,
		   paf->AffectedBy
		   );
	}
    }

  for_each(ch->PCData->Killed.begin(), ch->PCData->Killed.end(),
           [fp](auto killed) { fprintf( fp, "Killed       %ld %d\n",
                                        killed.Vnum,
                                        killed.Count ); });

  ImcSaveCharacter( ch, fp );

  fprintf( fp, "End\n\n" );
}

static bool HasAnyOvalues( const Object *obj )
{
  int oval = 0;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      if( obj->Value[oval] != 0 )
	{
	  return true;
	}
    }

  return false;
}

/*
 * Write an object and its contents.
 */
void WriteObject( const Character *ch, const Object *obj, FILE *fp, int iNest, short os_type )
{
  short wear = 0, wear_loc = 0, x = 0;

  if ( iNest >= MAX_NEST )
    {
      Log->Bug( "WriteObject: iNest hit MAX_NEST %d", iNest );
      return;
    }

  /*
   * Slick recursion to write lists backwards,
   *   so loading them will load in forwards order.
   */
  for(const Object *content : Reverse(obj->Objects()))
    {
      WriteObject( ch, content, fp, iNest, OS_CARRY );
    }

  /*
   * Castrate storage characters.
   */
  if ( obj->ItemType == ITEM_KEY && !IS_OBJ_STAT(obj, ITEM_CLANOBJECT ))
    {
      return;
    }

  /*
   * Catch deleted objects                                      -Thoric
   */
  if ( IsObjectExtracted(obj) )
    {
      return;
    }

  /*
   * Do NOT save prototype items!                               -Thoric
   */
  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      return;
    }

  /* Corpse saving. -- Altrag */
  fprintf( fp, (os_type == OS_CORPSE ? "#CORPSE\n" : "#OBJECT\n") );

  if ( iNest )
    {
      fprintf( fp, "Nest         %d\n",   iNest                );
    }

  if ( obj->Count > 1 )
    {
      fprintf( fp, "Count        %d\n",   obj->Count           );
    }

  if ( StrCmp( obj->Name, obj->Prototype->Name ) )
    {
      fprintf( fp, "Name         %s~\n",  obj->Name.c_str()            );
    }

  if ( StrCmp( obj->ShortDescr, obj->Prototype->ShortDescr ) )
    {
      fprintf( fp, "ShortDescr   %s~\n",  obj->ShortDescr.c_str()     );
    }

  if ( StrCmp( obj->Description, obj->Prototype->Description ) )
    {
      fprintf( fp, "Description  %s~\n",  obj->Description.c_str()     );
    }

  if ( StrCmp( obj->ActionDescription, obj->Prototype->ActionDescription ) )
    {
      fprintf( fp, "ActionDesc   %s~\n",  obj->ActionDescription.c_str()     );
    }

  fprintf( fp, "Vnum         %ld\n",     obj->Prototype->Vnum );

  if ( os_type == OS_CORPSE && obj->InRoom )
    {
      fprintf( fp, "Room         %ld\n",   obj->InRoom->Vnum  );
    }

  if ( obj->Flags != obj->Prototype->Flags )
    {
      fprintf( fp, "ExtraFlags   %d\n",   obj->Flags     );
    }

  if ( obj->WearFlags != obj->Prototype->WearFlags )
    {
      fprintf( fp, "WearFlags    %d\n",   obj->WearFlags      );
    }

  wear_loc = -1;

  for ( wear = 0; wear < MAX_WEAR; wear++ )
    {
      for ( x = 0; x < MAX_LAYERS; x++ )
	{
	  if ( obj == save_equipment[wear][x] )
	    {
	      wear_loc = wear;
	      break;
	    }
	  else if ( !save_equipment[wear][x] )
	    {
	      break;
	    }
	}
    }

  if ( wear_loc != -1 )
    {
      fprintf( fp, "WearLoc      %d\n",   wear_loc             );
    }

  if ( obj->ItemType != obj->Prototype->ItemType )
    {
      fprintf( fp, "ItemType     %d\n",   obj->ItemType       );
    }

  if ( obj->Weight != obj->Prototype->Weight )
    {
      fprintf( fp, "Weight       %d\n",   obj->Weight                  );
    }

  if ( obj->Level )
    {
      fprintf( fp, "Level        %d\n",   obj->Level                   );
    }

  if ( obj->Timer )
    {
      fprintf( fp, "Timer        %d\n",   obj->Timer                   );
    }

  if ( obj->Cost != obj->Prototype->Cost )
    {
      fprintf( fp, "Cost         %d\n",   obj->Cost                    );
    }

  if( HasAnyOvalues( obj ) )
    {
      fprintf( fp, "Values       %d %d %d %d %d %d\n",
	       obj->Value[0], obj->Value[1], obj->Value[2],
	       obj->Value[3], obj->Value[4], obj->Value[5]     );
    }

  switch ( obj->ItemType )
    {
    case ITEM_PILL: /* was down there with staff and wand, wrongly - Scryn */
    case ITEM_POTION:
      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL1]) )
	{
	  fprintf( fp, "Spell 1      '%s'\n",
		   SkillTable[obj->Value[OVAL_PILL_SPELL1]]->Name.c_str() );
	}

      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL2]) )
	{
	  fprintf( fp, "Spell 2      '%s'\n",
		   SkillTable[obj->Value[OVAL_PILL_SPELL2]]->Name.c_str() );
	}

      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL3]) )
	{
	  fprintf( fp, "Spell 3      '%s'\n",
		   SkillTable[obj->Value[OVAL_PILL_SPELL3]]->Name.c_str() );
	}
      break;

    case ITEM_DEVICE:
      if ( IS_VALID_SN(obj->Value[OVAL_DEVICE_SPELL]) )
	{
	  fprintf( fp, "Spell 3      '%s'\n",
		   SkillTable[obj->Value[OVAL_DEVICE_SPELL]]->Name.c_str() );
	}
      break;

    case ITEM_SALVE:
      if ( IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL1]) )
	{
	  fprintf( fp, "Spell 4      '%s'\n",
		   SkillTable[obj->Value[OVAL_SALVE_SPELL1]]->Name.c_str() );
	}

      if ( IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL2]) )
	{
	  fprintf( fp, "Spell 5      '%s'\n",
		   SkillTable[obj->Value[OVAL_SALVE_SPELL2]]->Name.c_str() );
	}

      break;

    default:
      break;
    }

  for ( const Affect *paf : obj->Affects() )
    {
      /*
       * Save extra object affects                              -Thoric
       */
      if ( paf->Type < 0 || paf->Type >= TopSN )
        {
          fprintf( fp, "Affect       %d %d %d %d %d\n",
                   paf->Type,
                   paf->Duration,
                   ((paf->Location == APPLY_WEAPONSPELL
                     || paf->Location == APPLY_WEARSPELL
                     || paf->Location == APPLY_REMOVESPELL
                     || paf->Location == APPLY_STRIPSN)
                    && IS_VALID_SN(paf->Modifier))
                   ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
                   paf->Location,
                   paf->AffectedBy
                   );
        }
      else
	{
	  fprintf( fp, "AffectData   '%s' %d %d %d %d\n",
		   SkillTable[paf->Type]->Name.c_str(),
		   paf->Duration,
		   ((paf->Location == APPLY_WEAPONSPELL
		     || paf->Location == APPLY_WEARSPELL
		     || paf->Location == APPLY_REMOVESPELL
		     || paf->Location == APPLY_STRIPSN)
		    && IS_VALID_SN(paf->Modifier))
		   ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
		   paf->Location,
		   paf->AffectedBy
		   );
	}
    }

  for(const ExtraDescription *ed : obj->ExtraDescriptions())
    {
      fprintf( fp, "ExtraDescr   %s~ %s~\n",
	       ed->Keyword.c_str(), ed->Description.c_str() );
    }

  fprintf( fp, "End\n\n" );

  for(const Object *content : Reverse(obj->Objects()))
    {
      WriteObject( ch, content, fp, iNest + 1, OS_CARRY );
    }
}

/*
 * Load a char and inventory into a new ch structure.
 */
bool LoadCharacter( Descriptor *d, const std::string &name, bool preload )
{
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp = NULL;
  bool found = false;
  struct stat fst;
  char buf[MAX_INPUT_LENGTH];

  Character *ch = new Character(new PCData(), d);

  for ( int x = 0; x < MAX_WEAR; x++ )
    {
      for ( int i = 0; i < MAX_LAYERS; i++ )
	{
	  save_equipment[x][i] = NULL;
	}
    }

  loading_char = ch;

  ch->Name = name;

  ImcInitializeCharacter( ch );

  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           Capitalize( name ).c_str() );

  if ( stat( strsave, &fst ) != -1 )
    {
      if ( fst.st_size == 0 )
        {
          sprintf( strsave, "%s%c/%s", BACKUP_DIR, tolower(name[0]),
                   Capitalize( name ).c_str() );
          ch->Echo( "Restoring your backup player file..." );
        }
      else
        {
          sprintf( buf, "%s player data for: %s (%dK)",
                   preload ? "Preloading" : "Loading", ch->Name.c_str(),
                   (int) fst.st_size/1024 );
          Log->LogStringPlus( buf, LOG_COMM, LEVEL_GREATER );
        }
    }
  /* else no player file */

  if ( ( fp = fopen( strsave, "r" ) ) != NULL )
    {
      for ( int iNest = 0; iNest < MAX_NEST; iNest++ )
	{
	  rgObjNest[iNest] = NULL;
	}

      found = true;
      /* Cheat so that bug will show line #'s -- Altrag */
      fpArea = fp;
      strcpy(strArea, strsave);

      for ( ; ; )
        {
	  const char *word = nullptr;
          char letter = ReadChar( fp, Log, fBootDb );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp,Log, fBootDb );
              continue;
            }

          if ( letter != '#' )
            {
              Log->Bug( "Load_char_obj: # not found.", 0 );
              Log->Bug( "%s", name.c_str() );
              break;
            }

          word = ReadWord( fp,Log, fBootDb );

          if ( !StrCmp( word, "PLAYER" ) )
            {
              ReadCharacter ( ch, fp, preload );

              if ( preload )
		{
		  break;
		}
            }
          else if ( !StrCmp( word, "OBJECT" ) )
	    {
	      ReadObject( ch, fp, OS_CARRY );
	    }
	  else if ( !StrCmp( word, "COMMENT") )
	    {
	      ReadComment(ch, fp );
	    }
	  else if ( !StrCmp( word, "MOBILE") )
	    {
	      Character *mob = ReadMobile( fp );
	      ch->PCData->Pet = mob;
	      mob->Master = ch;
	      SetBit(mob->AffectedBy, AFF_CHARM);
	    }
	  else if ( !StrCmp( word, "END"    ) )
	    {
	      break;
	    }
	  else
	    {
	      Log->Bug( "Load_char_obj: bad section." );
	      Log->Bug( "%s", name.c_str() );
	      break;
	    }
        }

      fclose( fp );
      fpArea = NULL;
      strcpy(strArea, "$");
    }

  if ( found )
    {
      if ( !IsNpc( ch ) && GetTrustLevel( ch ) > LEVEL_AVATAR )
        {
          if ( ch->PCData->WizInvis < 2 )
	    {
	      ch->PCData->WizInvis = ch->TopLevel;
	    }

          AssignAreaTo( ch );
        }

      if ( file_ver > 1 )
        {
          for ( int i = 0; i < MAX_WEAR; i++ )
	    {
	      for ( int x = 0; x < MAX_LAYERS; x++ )
		{
		  if ( save_equipment[i][x] )
		    {
		      EquipCharacter( ch, save_equipment[i][x], (WearLocation)i );
		      save_equipment[i][x] = NULL;
		    }
		  else
		    {
		      break;
		    }
		}
	    }
        }
    }

  loading_char = NULL;
  return found;
}

/*
 * Read in a char.
 */
static void ReadCharacter( Character *ch, FILE *fp, bool preload )
{
  file_ver = 0;

  for ( ; ; )
    {
      const char *line = NULL;
      int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0, x7 = 0, x8 = 0, x9 = 0, x0 = 0;
      time_t lastplayed = 0;
      int sn = 0;
      const char *word = feof( fp ) ? "End" : ReadWord( fp,Log, fBootDb );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp,Log, fBootDb );
          break;

        case 'A':
          KEY( "Act",           ch->Flags,                ReadInt( fp,Log, fBootDb ) );
          KEY( "AffectedBy",    ch->AffectedBy,        ReadInt( fp,Log, fBootDb ) );
          KEY( "Alignment",     ch->Alignment,          ReadInt( fp,Log, fBootDb ) );
          KEY( "Armor", ch->ArmorClass,              ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Addiction"  ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x0 = x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = x9 = 0;
              sscanf( line, "%d %d %d %d %d %d %d %d %d %d",
                      &x0, &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8, &x9 );
              ch->PCData->Addiction[0] = x0;
              ch->PCData->Addiction[1] = x1;
              ch->PCData->Addiction[2] = x2;
              ch->PCData->Addiction[3] = x3;
              ch->PCData->Addiction[4] = x4;
              ch->PCData->Addiction[5] = x5;
              ch->PCData->Addiction[6] = x6;
              ch->PCData->Addiction[7] = x7;
              ch->PCData->Addiction[8] = x8;
              ch->PCData->Addiction[9] = x9;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Ability"  ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x0=x1=x2=0;
              sscanf( line, "%d %d %d",
                      &x0, &x1, &x2 );

              if ( x0 >= 0 && x0 < MAX_ABILITY )
                {
                  SetAbilityLevel( ch, x0, x1 );
                  SetAbilityXP( ch, x0, x2 );
                }

              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Affect" ) || !StrCmp( word, "AffectData" ) )
            {
              if ( preload )
                {
                  fMatch = true;
                  ReadToEndOfLine( fp,Log, fBootDb );
                  break;
                }

              Affect *paf = new Affect();

              if ( !StrCmp( word, "Affect" ) )
                {
                  paf->Type = ReadInt( fp,Log, fBootDb );
                }
              else
                {
                  const char *sname = ReadWord(fp,Log, fBootDb);

                  if ( (sn=LookupSkill(sname)) < 0 )
                    {
                      if ( (sn=LookupHerb(sname)) < 0 )
			{
			  Log->Bug( "%s (%d): unknown skill %s.",
			       __FUNCTION__, __LINE__, sname );
			}
                      else
			{
			  sn += TYPE_HERB;
			}
                    }

                  paf->Type = sn;
                }

              paf->Duration   = ReadInt( fp,Log, fBootDb );
              paf->Modifier   = ReadInt( fp,Log, fBootDb );
              paf->Location   = ReadInt( fp,Log, fBootDb );
              paf->AffectedBy = ReadInt( fp,Log, fBootDb );
              ch->Add(paf);
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "AttrMod"  ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x1=x2=x3=x4=x5=x6=x7=13;
              sscanf( line, "%d %d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6, &x7 );
              ch->StatMods.Str = x1;
              ch->StatMods.Int = x2;
              ch->StatMods.Wis = x3;
              ch->StatMods.Dex = x4;
              ch->StatMods.Con = x5;
              ch->StatMods.Cha = x6;
              ch->StatMods.Lck = x7;
              if (!x7)
                ch->StatMods.Lck = 0;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Alias" ) )
            {
              if ( preload )
                {
                  fMatch = true;
                  ReadToEndOfLine( fp,Log, fBootDb );
                  break;
                }

              Alias *pal = new Alias();

              pal->Name = ReadStringToTilde( fp,Log, fBootDb );
              pal->Command  = ReadStringToTilde( fp,Log, fBootDb );
	      AddAlias( ch, pal );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "AttrPerm" ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x1=x2=x3=x4=x5=x6=x7=0;
              sscanf( line, "%d %d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6, &x7 );
              ch->PermStats.Str = x1;
              ch->PermStats.Int = x2;
              ch->PermStats.Wis = x3;
              ch->PermStats.Dex = x4;
              ch->PermStats.Con = x5;
              ch->PermStats.Cha = x6;
              ch->PermStats.Lck = x7;

              if ( x7 == 0 )
		{
		  ch->PermStats.Lck = 13;
		}

              fMatch = true;
              break;
            }

          KEY( "AuthedBy",      ch->PCData->AuthedBy,  ReadStringToTilde( fp,Log, fBootDb ) );
          break;

        case 'B':
          KEY( "Bamfin",        ch->PCData->BamfIn,     ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Bamfout",       ch->PCData->BamfOut,    ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Bestowments", ch->PCData->Bestowments, ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Bio",           ch->PCData->Bio,        ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Bank",  ch->PCData->Bank,       ReadInt( fp,Log, fBootDb ) );
          break;

        case 'C':
          if ( !StrCmp( word, "Clan" ) )
            {
              ch->PCData->ClanInfo.ClanName = ReadStringToTilde( fp,Log, fBootDb );

              if ( !preload
                   && !ch->PCData->ClanInfo.ClanName.empty()
                   && ( ch->PCData->ClanInfo.Clan = GetClan( ch->PCData->ClanInfo.ClanName )) == NULL )
                {
                  ch->Echo( "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n", ch->PCData->ClanInfo.ClanName.c_str() );
                  ch->PCData->ClanInfo.ClanName.erase();
                  RemoveClanMember(ch);
                }
              else
		{
		  UpdateClanMember(ch);
		}

              fMatch = true;
              break;
            }

          KEY( "Clones",        ch->PCData->Clones,             ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Condition" ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4 );
              ch->PCData->Condition[0] = x1;
              ch->PCData->Condition[1] = x2;
              ch->PCData->Condition[2] = x3;
              ch->PCData->Condition[3] = x4;
              fMatch = true;
              break;
            }

          break;

        case 'D':
          KEY( "Damroll",       ch->DamRoll,            ReadInt( fp,Log, fBootDb ) );
          KEY( "Deaf",  ch->Deaf,               ReadInt( fp,Log, fBootDb ) );
          KEY( "Description",   ch->Description,        ReadStringToTilde( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Druglevel"  ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x0=x1=x2=x3=x4=x5=x6=x7=x8=x9=0;
              sscanf( line, "%d %d %d %d %d %d %d %d %d %d",
                      &x0, &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8, &x9 );
              ch->PCData->DrugLevel[0] = x0;
              ch->PCData->DrugLevel[1] = x1;
              ch->PCData->DrugLevel[2] = x2;
              ch->PCData->DrugLevel[3] = x3;
              ch->PCData->DrugLevel[4] = x4;
              ch->PCData->DrugLevel[5] = x5;
              ch->PCData->DrugLevel[6] = x6;
              ch->PCData->DrugLevel[7] = x7;
              ch->PCData->DrugLevel[8] = x8;
              ch->PCData->DrugLevel[9] = x9;
              fMatch = true;
              break;
            }

          break;

          /* 'E' was moved to after 'S' */
        case 'F':
          KEY( "Flags", ch->PCData->Flags,      ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Force" ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4);
              ch->PermStats.Frc = x1;
              ch->StatMods.Frc = x2;
              ch->Mana.Current = x3;
              ch->Mana.Max = x4;
              fMatch = true;
              break;
            }
          break;

        case 'G':
          KEY( "Gold",  ch->Gold,               ReadInt( fp,Log, fBootDb ) );
          /* temporary measure */
          if ( !StrCmp( word, "Guild" ) )
            {
              ch->PCData->ClanInfo.ClanName = ReadStringToTilde( fp,Log, fBootDb );

              if ( !preload
                   && !ch->PCData->ClanInfo.ClanName.empty()
                   && ( ch->PCData->ClanInfo.Clan = GetClan( ch->PCData->ClanInfo.ClanName )) == NULL )
                {
                  ch->Echo( "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n",
                            ch->PCData->ClanInfo.ClanName.c_str() );
                  ch->PCData->ClanInfo.ClanName.erase();
                }

              fMatch = true;
              break;
            }
          break;

        case 'H':
          if ( !StrCmp(word, "Helled") )
            {
              ch->PCData->ReleaseDate = ReadInt(fp,Log, fBootDb);
              ch->PCData->HelledBy = ReadStringToTilde(fp,Log, fBootDb);

              if ( ch->PCData->ReleaseDate < current_time )
                {
                  ch->PCData->HelledBy.erase();
                  ch->PCData->ReleaseDate = 0;
                  ch->PCData->JailVnum = 0;
                }

              fMatch = true;
              break;
            }

          KEY( "Hitroll",       ch->HitRoll,            ReadInt( fp,Log, fBootDb ) );
          KEY( "Homepage",      ch->PCData->HomePage,   ReadStringToTilde( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "HpManaMove" ) )
            {
              line = ReadLine( fp,Log, fBootDb );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6 );
              ch->HitPoints.Current = x1;
              ch->HitPoints.Max = x2;
              ch->Fatigue.Current = x5;
              ch->Fatigue.Max = x6;

              if ( x4 >= 100 )
                {
                  ch->PermStats.Frc = GetRandomNumberFromRange( 1 , 20 );
                  ch->Mana.Max = x4;
                  ch->Mana.Current = x4;
                }
              else if ( x4 >= 10 )
                {
                  ch->PermStats.Frc = 1;
                  ch->Mana.Max = x4;
                }

              fMatch = true;
              break;
            }

          break;

        case 'I':
          KEY( "IllegalPK",     ch->PCData->IllegalPk, ReadInt( fp,Log, fBootDb ) );
          KEY( "Immune",        ch->Immune,             ReadInt( fp,Log, fBootDb ) );

	  if( ( fMatch = ImcLoadCharacter( ch, fp, word ) ) )
	    {
	      break;
	    }

          break;
        case 'J':
          KEY( "Jailvnum",    ch->PCData->JailVnum,          ReadInt( fp,Log, fBootDb ) );
          break;

        case 'K':
          if ( !StrCmp( word, "Killed" ) )
            {
              fMatch = true;
              vnum_t vnum = ReadInt(fp,Log, fBootDb);
              char count = ReadInt(fp,Log, fBootDb);

              if(ch->PCData->Killed.size() < GetKillTrackCount(ch))
                {
                  ch->PCData->Killed.push_front({vnum, count});
                }
            }
          break;

        case 'L':
          if ( !StrCmp(word, "Lastplayed") )
            {
              lastplayed = ReadInt(fp,Log, fBootDb);
              fMatch = true;
              break;
            }

          KEY( "LongDescr",     ch->LongDescr,         ReadStringToTilde( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Languages" ) )
            {
              ch->Speaks = ReadInt( fp,Log, fBootDb );
              ch->Speaking = ReadInt( fp,Log, fBootDb );
              fMatch = true;
            }

          break;

        case 'M':
          KEY( "MainAbility",   ch->Ability.Main,               ReadInt( fp,Log, fBootDb ) );
          KEY( "MDeaths",       ch->PCData->MDeaths,    ReadInt( fp,Log, fBootDb ) );
          KEY( "Mentalstate", ch->MentalState, ReadInt( fp,Log, fBootDb ) );
          KEY( "Minsnoop",      ch->PCData->MinSnoop,  ReadInt( fp,Log, fBootDb ) );
          KEY( "MKills",        ch->PCData->MKills,     ReadInt( fp,Log, fBootDb ) );
          KEY( "Mobinvis",      ch->MobInvis,           ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "MobRange" ) )
            {
              ch->PCData->Build.VnumRanges.Mob.First = ReadInt( fp,Log, fBootDb );
              ch->PCData->Build.VnumRanges.Mob.Last = ReadInt( fp,Log, fBootDb );
              fMatch = true;
            }

          break;

        case 'N':
          if ( !StrCmp( word, "Name" ) )
            {
              /*
               * Name already set externally.
               */
              ReadToEndOfLine( fp,Log, fBootDb );
              fMatch = true;
              break;
            }
          break;

        case 'O':
          if ( !StrCmp( word, "ObjRange" ) )
            {
              ch->PCData->Build.VnumRanges.Object.First = ReadInt( fp,Log, fBootDb );
              ch->PCData->Build.VnumRanges.Object.Last = ReadInt( fp,Log, fBootDb );
              fMatch = true;
            }
          break;

        case 'P':
          KEY( "Password",      ch->PCData->Password,        ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "PDeaths",       ch->PCData->PDeaths,    ReadInt( fp,Log, fBootDb ) );
          KEY( "PKills",        ch->PCData->PKills,     ReadInt( fp,Log, fBootDb ) );
          KEY( "Played",        ch->PCData->Played,     ReadInt( fp,Log, fBootDb ) );
          KEY( "Position",      ch->Position,           (PositionType)ReadInt( fp,Log, fBootDb ) );
          KEY( "Prompt",        ch->PCData->Prompt,     ReadStringToTilde( fp,Log, fBootDb ) );

          if (!StrCmp ( word, "PTimer" ) )
            {
              AddTimerToCharacter( ch , TIMER_PKILLED, ReadInt(fp,Log, fBootDb), NULL, SUB_NONE );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "PlrHome" ) )
            {
              ch->PlayerHome = GetRoom( ReadInt( fp,Log, fBootDb ) );

              if ( !ch->PlayerHome )
		{
		  ch->PlayerHome = NULL;
		}

              fMatch = true;
              break;
            }

          break;

        case 'R':
          KEY( "Race",        ch->Race,         ReadInt( fp,Log, fBootDb ) );
          KEY( "Rank",        ch->PCData->Rank, ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Resistant",     ch->Resistant,          ReadInt( fp,Log, fBootDb ) );
          KEY( "Restore_time",ch->PCData->RestoreTime, ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Room" ) )
            {
              ch->InRoom = GetRoom( ReadInt( fp,Log, fBootDb ) );

              if ( !ch->InRoom )
		{
		  ch->InRoom = GetRoom( ROOM_VNUM_LIMBO );
		}

              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "RoomRange" ) )
            {
              ch->PCData->Build.VnumRanges.Room.First = ReadInt( fp,Log, fBootDb );
              ch->PCData->Build.VnumRanges.Room.Last = ReadInt( fp,Log, fBootDb );
              fMatch = true;
            }

          break;

        case 'S':
          KEY( "Salary",      ch->PCData->ClanInfo.Salary, ReadInt( fp,Log, fBootDb ) );
          KEY( "Salary_time",ch->PCData->ClanInfo.SalaryDate, ReadInt( fp,Log, fBootDb ) );
          KEY( "Sex",           ch->Sex,                (SexType)ReadInt( fp,Log, fBootDb ) );
          KEY( "ShortDescr",    ch->ShortDescr,        ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Susceptible",   ch->Susceptible,        ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "SavingThrow" ) )
            {
              ch->Saving.Wand   = ReadInt( fp,Log, fBootDb );
              ch->Saving.PoisonDeath = ch->Saving.Wand;
              ch->Saving.ParaPetri     = ch->Saving.Wand;
              ch->Saving.Breath         = ch->Saving.Wand;
              ch->Saving.SpellStaff    = ch->Saving.Wand;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "SavingThrows" ) )
            {
              ch->Saving.PoisonDeath = ReadInt( fp,Log, fBootDb );
              ch->Saving.Wand   = ReadInt( fp,Log, fBootDb );
              ch->Saving.ParaPetri     = ReadInt( fp,Log, fBootDb );
              ch->Saving.Breath         = ReadInt( fp,Log, fBootDb );
              ch->Saving.SpellStaff    = ReadInt( fp,Log, fBootDb );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Site" ) )
            {
              if ( !preload )
                {
                  ch->Echo( "Last connected from: %s\r\n", ReadWord( fp,Log, fBootDb ) );
                }
              else
		{
		  ReadToEndOfLine( fp,Log, fBootDb );
		}

              fMatch = true;

              if ( preload )
		{
		  word = "End";
		}
              else
		{
		  break;
		}
            }

          if ( !StrCmp( word, "Skill" ) )
            {
              int value;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp,Log, fBootDb );

                  if ( file_ver < 3 )
		    {
		      sn = LookupSkill( ReadWord( fp,Log, fBootDb ) );
		    }
                  else
		    {
		      sn = BSearchSkillExact( ReadWord( fp,Log, fBootDb ), gsn_first_skill, gsn_first_weapon-1 );
		    }

                  if ( sn < 0 )
		    {
		      Log->Bug( "%s (%d): unknown skill sn %d.",
			   __FUNCTION__, __LINE__, sn );
		    }
                  else
                    {
                      ch->PCData->Learned[sn] = value;
                    }

                  fMatch = true;
                  break;
                }
            }

          if ( !StrCmp( word, "Spell" ) )
            {
              int value = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp,Log, fBootDb );
                  sn = BSearchSkillExact( ReadWord( fp,Log, fBootDb ), gsn_first_spell, gsn_first_skill-1 );

                  if ( sn < 0 )
		    {
		      Log->Bug( "%s (%d): unknown spell sn %d.",
			   __FUNCTION__, __LINE__, sn );
		    }
                  else
                    {
                      ch->PCData->Learned[sn] = value;
                    }

                  fMatch = true;
                  break;
                }
            }

          if ( StrCmp( word, "End" ) )
	    {
	      break;
	    }

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              for ( int ability = 0 ; ability < MAX_ABILITY ; ability++ )
                {
                  if ( GetAbilityLevel( ch, ability ) == 0 )
                    {
                      SetAbilityLevel( ch, ability, 1 );
                    }
                }

              if ( !IsImmortal( ch ) && !ch->Speaking )
                ch->Speaking = RaceTable[ch->Race].Language;

              if ( IsImmortal( ch ) )
                {
                  ch->Speaks = ~0;

                  if ( ch->Speaking == 0 )
		    {
		      ch->Speaking = ~0;
		    }
                }

              if ( lastplayed != 0 )
                {
                  int hitgain = ( ( int ) ( current_time - lastplayed ) / 60 );
                  ch->HitPoints.Current = urange( 1, ch->HitPoints.Current + hitgain,
                                                  ch->HitPoints.Max );
                  ch->Fatigue.Current = urange( 1, ch->Fatigue.Current + hitgain,
                                                ch->Fatigue.Max );

                  if ( IsJedi( ch ) )
		    {
		      ch->Mana.Current = urange( 0, ch->Mana.Current + hitgain, ch->Mana.Max );
		    }

                  ImproveMentalState( ch , hitgain );
                }

              for ( sn = 0; sn < TopSN; sn++ )
                {
                  if ( SkillTable[sn]->Name.empty() )
		    {
		      break;
		    }

                  if ( SkillTable[sn]->Guild < 0 || SkillTable[sn]->Guild >= MAX_ABILITY )
		    {
		      continue;
		    }

                  if ( ch->PCData->Learned[sn] > 0
		       && GetAbilityLevel( ch, SkillTable[sn]->Guild ) < SkillTable[sn]->Level )
		    {
		      ch->PCData->Learned[sn] = 0;
		    }

                }

              return;
            }

          KEY( "Email", ch->PCData->Email,      ReadStringToTilde( fp,Log, fBootDb ) );
          break;

        case 'T':
          KEY( "Targ",  ch->PCData->Target,     ReadStringToTilde( fp,Log, fBootDb ) );
          KEY( "Toplevel",      ch->TopLevel,          ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Tongue" ) )
            {
              int value  = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp,Log, fBootDb );
                  sn = BSearchSkillExact( ReadWord( fp,Log, fBootDb ), gsn_first_tongue, gsn_TopSN-1 );

                  if ( sn < 0 )
		    {
		      Log->Bug( "%s (%d): unknown tongue sn %d.",
			   __FUNCTION__, __LINE__, sn );
		    }
                  else
                    {
                      ch->PCData->Learned[sn] = value;
                    }

                  fMatch = true;
                }

              break;
            }

          KEY( "Trust", ch->Trust, ReadInt( fp,Log, fBootDb ) );
          /* Let no character be trusted higher than one below maxlevel -- Narn */
          ch->Trust = umin( ch->Trust, MAX_LEVEL - 1 );

          if ( !StrCmp( word, "Title" ) )
            {
              ch->PCData->Title = ReadStringToTilde( fp,Log, fBootDb );

#if 0
              // The following code removes the title, then assigns
              // back the exact same title? What's the point?
              if ( isalpha(ch->PCData->Title[0])
                   || isdigit(ch->PCData->Title[0]) )
                {
                  sprintf( buf, "%s", ch->PCData->Title );

                  if ( ch->PCData->Title )
                    FreeMemory( ch->PCData->Title );

                  ch->PCData->Title = buf;
                }
#endif
              
              fMatch = true;
              break;
            }

          break;

        case 'V':
          if ( !StrCmp( word, "Vnum" ) )
            {
              ch->Prototype = GetProtoMobile( ReadInt( fp,Log, fBootDb ) );
              fMatch = true;
              break;
            }

          KEY( "Version",       file_ver,               ReadInt( fp,Log, fBootDb ) );
          break;

        case 'W':
          if ( !StrCmp( word, "Weapon" ) )
            {
              int value = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp,Log, fBootDb );
                  sn = BSearchSkillExact( ReadWord( fp,Log, fBootDb ), gsn_first_weapon, gsn_first_tongue-1 );
                  if ( sn < 0 )
		    {
		      Log->Bug( "%s (%d): unknown weapon sn %d.",
			   __FUNCTION__, __LINE__, sn );
		    }
                  else
                    {
                      ch->PCData->Learned[sn] = value;
                    }

                  fMatch = true;
                }
              break;
            }

          KEY( "Wimpy", ch->Wimpy,              ReadInt( fp,Log, fBootDb ) );
          KEY( "WizInvis",      ch->PCData->WizInvis,   ReadInt( fp,Log, fBootDb ) );
          KEY( "Wanted",        ch->PCData->WantedFlags,  ReadInt( fp,Log, fBootDb ) );
          break;
        }

      if ( !fMatch )
        {
          Log->Bug( "ReadCharacter: no match: %s", word );
        }
    }
}

void ReadObject( Character *ch, FILE *fp, short os_type )
{
  int iNest = 0;
  bool fNest = true; /* Yes, these should             */
  bool fVnum = true; /* indeed be initialized as true */
  Room *room = NULL;

  Object *obj = new Object();

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp,Log, fBootDb );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp,Log, fBootDb );
          break;

        case 'A':
          if ( !StrCmp( word, "Affect" ) || !StrCmp( word, "AffectData" ) )
            {
              Affect *paf = new Affect();
              int pafmod = 0;

              if ( !StrCmp( word, "Affect" ) )
                {
                  paf->Type = ReadInt( fp,Log, fBootDb );
                }
              else
                {
                  int sn = LookupSkill( ReadWord( fp,Log, fBootDb ) );

                  if ( sn < 0 )
		    {
		      Log->Bug( "%s (%d): unknown skill sn %d.",
			   __FUNCTION__, __LINE__, sn );
		    }
                  else
		    {
		      paf->Type = sn;
		    }
                }

              paf->Duration     = ReadInt( fp,Log, fBootDb );
              pafmod            = ReadInt( fp,Log, fBootDb );
              paf->Location     = ReadInt( fp,Log, fBootDb );
              paf->AffectedBy   = ReadInt( fp,Log, fBootDb );

              if ( paf->Location == APPLY_WEAPONSPELL
                   || paf->Location == APPLY_WEARSPELL
                   || paf->Location == APPLY_REMOVESPELL )
		{
		  paf->Modifier = SkillNumberFromSlot( pafmod );
		}
              else
		{
		  paf->Modifier = pafmod;
		}

              obj->Add(paf);
              fMatch                            = true;
              break;
            }

          KEY( "Actiondesc",    obj->ActionDescription,       ReadStringToTilde( fp,Log, fBootDb ) );
          break;

        case 'C':
          KEY( "Cost",  obj->Cost,              ReadInt( fp,Log, fBootDb ) );
          KEY( "Count", obj->Count,             ReadInt( fp,Log, fBootDb ) );
          break;

        case 'D':
          KEY( "Description",   obj->Description,       ReadStringToTilde( fp,Log, fBootDb ) );
          break;

        case 'E':
          KEY( "ExtraFlags",    obj->Flags,       ReadInt( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "ExtraDescr" ) )
            {
              ExtraDescription *ed = new ExtraDescription();

              ed->Keyword = ReadStringToTilde( fp,Log, fBootDb );
              ed->Description = ReadStringToTilde( fp,Log, fBootDb );
              obj->Add(ed);
              fMatch = true;
            }

          if ( !StrCmp( word, "End" ) )
            {
              if ( !fNest || !fVnum )
                {
                  Log->Bug( "Fread_obj: incomplete object.", 0 );
                  delete obj;
                  return;
                }
              else
                {
                  short wear_loc = obj->WearLoc;

                  if ( obj->Name.empty() )
                    obj->Name = obj->Prototype->Name;

                  if ( obj->Description.empty() )
                    obj->Description = obj->Prototype->Description;

                  if ( obj->ShortDescr.empty() )
                    obj->ShortDescr = obj->Prototype->ShortDescr;

                  if ( obj->ActionDescription.empty() )
                    obj->ActionDescription = obj->Prototype->ActionDescription;

                  Objects->Add(obj);
                  obj->Prototype->Count += obj->Count;

                  if ( !obj->Serial )
                    {
                      cur_obj_serial = umax((cur_obj_serial + 1 ) & (BV30-1), 1);
                      obj->Serial = obj->Prototype->Serial = cur_obj_serial;
                    }

                  if ( fNest )
                    rgObjNest[iNest] = obj;

                  numobjsloaded += obj->Count;
                  ++physicalobjects;

                  if ( file_ver > 1 || obj->WearLoc < -1
                       || obj->WearLoc >= MAX_WEAR )
		    {
		      obj->WearLoc = WEAR_NONE;
		    }

                  /* Corpse saving. -- Altrag */
                  if ( os_type == OS_CORPSE )
                    {
                      if ( !room )
                        {
                          Log->Bug( "Fread_obj: Corpse without room", 0);
                          room = GetRoom(ROOM_VNUM_LIMBO);
                        }

                      obj = ObjectToRoom( obj, room );
                    }
                  else if ( iNest == 0 || rgObjNest[iNest] == NULL )
                    {
                      int slot = 0;
                      bool reslot = false;

                      if ( file_ver > 1
                           && wear_loc > -1
                           && wear_loc < MAX_WEAR )
                        {
                          int x = 0;

                          for ( x = 0; x < MAX_LAYERS; x++ )
			    {
			      if ( !save_equipment[wear_loc][x] )
				{
				  save_equipment[wear_loc][x] = obj;
				  slot = x;
				  reslot = true;
				  break;
				}
			    }

                          if ( x == MAX_LAYERS )
			    {
			      Log->Bug( "Fread_obj: too many layers %d", wear_loc );
			    }
                        }

                      obj = ObjectToCharacter( obj, ch );

                      if ( reslot )
			{
			  save_equipment[wear_loc][slot] = obj;
			}
                    }
                  else
                    {
                      if ( rgObjNest[iNest-1] )
                        {
                          SeparateOneObjectFromGroup( rgObjNest[iNest-1] );
                          obj = ObjectToObject( obj, rgObjNest[iNest-1] );
                        }
                      else
			{
			  Log->Bug( "Fread_obj: nest layer missing %d", iNest-1 );
			}
                    }

                  if ( fNest )
		    {
		      rgObjNest[iNest] = obj;
		    }

                  return;
                }
            }
          break;

        case 'I':
          KEY( "ItemType",      obj->ItemType,         (ItemTypes)ReadInt( fp,Log, fBootDb ) );
          break;

        case 'L':
          KEY( "Level", obj->Level,             ReadInt( fp,Log, fBootDb ) );
          break;

        case 'N':
          KEY( "Name",  obj->Name,              ReadStringToTilde( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Nest" ) )
            {
              iNest = ReadInt( fp,Log, fBootDb );

              if ( iNest < 0 || iNest >= MAX_NEST )
                {
                  Log->Bug( "Fread_obj: bad nest %d.", iNest );
                  iNest = 0;
                  fNest = false;
                }

              fMatch = true;
            }
          break;

        case 'R':
          KEY( "Room", room, GetRoom(ReadInt(fp,Log, fBootDb)) );

        case 'S':
          KEY( "ShortDescr",    obj->ShortDescr,       ReadStringToTilde( fp,Log, fBootDb ) );

          if ( !StrCmp( word, "Spell" ) )
            {
              int iValue = ReadInt( fp,Log, fBootDb );
              int sn     = LookupSkill( ReadWord( fp,Log, fBootDb ) );

              if ( iValue < 0 || iValue > 5 )
		{
		  Log->Bug( "Fread_obj: bad iValue %d.", iValue );
		}
              else if ( sn < 0 )
		{
		  Log->Bug( "%s (%d): unknown skill sn %d.",
		       __FUNCTION__, __LINE__, sn );
		}
              else
		{
		  obj->Value[iValue] = sn;
		}

              fMatch = true;
              break;
            }

          break;

        case 'T':
          KEY( "Timer", obj->Timer,             ReadInt( fp,Log, fBootDb ) );
          break;

        case 'V':
          if ( !StrCmp( word, "Values" ) )
            {
              int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0;
              const char *ln = ReadLine( fp,Log, fBootDb );

              sscanf( ln, "%d %d %d %d %d %d", &x1, &x2, &x3, &x4, &x5, &x6 );

              obj->Value[0]     = x1;
              obj->Value[1]     = x2;
              obj->Value[2]     = x3;
              obj->Value[3]     = x4;
              obj->Value[4]     = x5;
              obj->Value[5]     = x6;
              fMatch            = true;
              break;
            }

          if ( !StrCmp( word, "Vnum" ) )
            {
              vnum_t vnum = ReadInt( fp,Log, fBootDb );

              if ( ( obj->Prototype = GetProtoObject( vnum ) ) == NULL )
                {
                  fVnum = false;
                  Log->Bug( "Fread_obj: bad vnum %d.", vnum );
                }
              else
                {
                  fVnum = true;
                  obj->Cost = obj->Prototype->Cost;
                  obj->Weight = obj->Prototype->Weight;
                  obj->ItemType = obj->Prototype->ItemType;
                  obj->WearFlags = obj->Prototype->WearFlags;
                  obj->Flags = obj->Prototype->Flags;
                }

              fMatch = true;
              break;
            }
          break;

        case 'W':
          KEY( "WearFlags",     obj->WearFlags,        ReadInt( fp,Log, fBootDb ) );
          KEY( "WearLoc",       obj->WearLoc,          (WearLocation)ReadInt( fp,Log, fBootDb ) );
          KEY( "Weight",        obj->Weight,            ReadInt( fp,Log, fBootDb ) );
          break;

        }

      if ( !fMatch )
        {
          Log->Bug( "Fread_obj: no match." );
          Log->Bug( word );
          ReadToEndOfLine( fp,Log, fBootDb );

          while( !obj->ExtraDescriptions().empty() )
            {
              ExtraDescription *ed = obj->ExtraDescriptions().front();
              obj->Remove(ed);
              delete ed;
            }

          while( !obj->Affects().empty() )
            {
              Affect *paf = obj->Affects().front();
              obj->Remove(paf);
              delete paf;
            }

          delete obj;
          return;
        }
    }
}

void SetAlarm( long seconds )
{
  alarm( seconds );
}

void WriteCorpses( const Character *ch, std::string name )
{
  FILE *fp = NULL;

  /* Name and ch support so that we dont have to have a char to save their
     corpses.. (ie: decayed corpses while offline) */
  if ( ch && IsNpc(ch) )
    {
      Log->Bug( "Write_corpses: writing NPC corpse." );
      return;
    }

  if ( ch )
    {
      name = ch->Name;
    }

  /* Go by vnum, less chance of screwups. -- Altrag */
  for( const Object *corpse : Objects->Entities() )
    {
      if ( corpse->Prototype->Vnum == OBJ_VNUM_CORPSE_PC
	   && corpse->InRoom != NULL && corpse->Value[OVAL_CORPSE_SKINNED] != 1
	   && !StrCmp(corpse->ShortDescr.c_str() + 14, name) )
	{
	  if ( !fp )
	    {
	      char buf[127];

	      sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name).c_str());

	      if ( !(fp = fopen(buf, "w")) )
		{
		  Log->Bug( "Write_corpses: Cannot open file." );
		  perror(buf);
		  return;
		}
	    }

	  WriteObject(ch, corpse, fp, 0, OS_CORPSE);
	}
    }

  if ( fp )
    {
      fprintf(fp, "#END\n\n");
      fclose(fp);
    }
  else
    {
      char buf[127];

      sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name).c_str());
      remove(buf);
    }
}

void LoadCorpses( void )
{
  DIR *dp = NULL;
  struct dirent *de = NULL;

  if ( !(dp = opendir(CORPSE_DIR)) )
    {
      Log->Bug( "%s: can't open CORPSE_DIR", __FUNCTION__ );
      perror(CORPSE_DIR);
      return;
    }

  falling = 1; /* Arbitrary, must be >0 though. */

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          sprintf(strArea, "%s%s", CORPSE_DIR, de->d_name );
          fprintf(stderr, "Corpse -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          for ( ; ; )
            {
              const char *word;
              char letter = ReadChar( fpArea,Log, fBootDb );

              if ( letter == '*' )
                {
                  ReadToEndOfLine(fpArea,Log, fBootDb);
                  continue;
                }

              if ( letter != '#' )
                {
                  Log->Bug( "%s: # not found.", __FUNCTION__ );
                  break;
                }

              word = ReadWord( fpArea,Log, fBootDb );

              if ( !StrCmp(word, "CORPSE" ) )
		{
		  ReadObject( NULL, fpArea, OS_CORPSE );
		}
              else if ( !StrCmp(word, "OBJECT" ) )
		{
		  ReadObject( NULL, fpArea, OS_CARRY );
		}
              else if ( !StrCmp( word, "END" ) )
		{
		  break;
		}
              else
                {
                  Log->Bug( "%s: bad section.", __FUNCTION__ );
                  break;
                }
            }

          fclose(fpArea);
        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
}

void LoadStorerooms( void )
{
  DIR *dp = NULL;
  struct dirent *de = NULL;
  char buf[MAX_INPUT_LENGTH];

  if ( !(dp = opendir(STOREROOM_DIR)) )
    {
      Log->Bug( "Load_storeroom: can't open STOREROOM_DIR" );
      perror(STOREROOM_DIR);
      return;
    }

  falling = 1;

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          sprintf(strArea, "%s%s", STOREROOM_DIR, de->d_name );
          fprintf(stderr, "Storeroom -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          Room *storeroom = GetRoom(atoi(de->d_name));

          if( !storeroom )
            {
              fpArea = NULL;
              strcpy(strArea, "$");
              closedir(dp);
              falling = 0;
              return;
            }

          if ( !IsBitSet( storeroom->Flags, ROOM_CLANSTOREROOM ) )
            {
              sprintf( buf, "%s%ld", STOREROOM_DIR, storeroom->Vnum );
              remove( buf );
            }

          RoomProgSetSupermob(storeroom);

          for ( int iNest = 0; iNest < MAX_NEST; iNest++ )
	    {
	      rgObjNest[iNest] = NULL;
	    }

          for ( ; ; )
            {
              const char *word = NULL;
              char letter = ReadChar( fpArea,Log, fBootDb );

              if ( letter == '*' )
                {
                  ReadToEndOfLine( fpArea,Log, fBootDb );
                  continue;
                }

              if ( letter != '#' )
                {
                  Log->Bug( "LoadStorerooms: # not found.", 0 );
                  Log->Bug( de->d_name, 0 );
                  break;
                }

              word = ReadWord( fpArea,Log, fBootDb );

              if ( !StrCmp( word, "OBJECT" ) ) /* Objects      */
		{
		  ReadObject( supermob, fpArea, OS_CARRY );
		}
              else if ( !StrCmp( word, "END"    ) )       /* Done         */
		{
                  break;
		}
	      else
		{
		  Log->Bug( "LoadStorerooms: bad section.", 0 );
		  Log->Bug( de->d_name, 0 );
		  break;
		}
            }

          fclose( fpArea );

          std::list<Object*> carriedBySupermob(supermob->Objects());

          for(Object *tobj : carriedBySupermob)
            {
              ObjectFromCharacter( tobj );

              if( tobj->ItemType != ITEM_MONEY )
		{
		  ObjectToRoom( tobj, storeroom );
		}
            }

          ReleaseSupermob();
        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
}

void SaveStoreroom( const Room *room )
{
  assert(room != nullptr);

  char strsave[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  sprintf( strsave, "%s%ld",STOREROOM_DIR, room->Vnum );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      Log->Bug( "Save_storeroom: fopen", 0 );
      Log->Bug( strsave, 0 );

    }
  else
    {
      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);

      for(const Object *obj : room->Objects())
	{
	  WriteObject(NULL, obj, fp, 0, OS_CARRY );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }
}

void LoadVendors( void )
{
  DIR *dp = NULL;
  Character *mob = NULL;
  struct dirent *de = NULL;

  if ( !(dp = opendir(VENDOR_DIR)) )
    {
      Log->Bug( "Load_vendors: can't open VENDOR_DIR" );
      perror(VENDOR_DIR);
      return;
    }

  falling = 1;

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          sprintf(strArea, "%s%s", VENDOR_DIR, de->d_name );
          fprintf(stderr, "Vendor -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          for ( ; ; )
            {
              const char *word = NULL;
	      char letter = ReadChar( fpArea,Log, fBootDb );

              if ( letter == '*' )
                {
                  ReadToEndOfLine(fpArea,Log, fBootDb);
                  continue;
                }

              if ( letter != '#' )
                {
                  Log->Bug( "Load_vendor: # not found.", 0 );
                  break;
                }

              word = ReadWord( fpArea,Log, fBootDb );

              if ( !StrCmp(word, "VENDOR" ) )
		{
		  mob = ReadVendor( fpArea );
		}
              else if ( !StrCmp(word, "OBJECT" ) )
		{
		  ReadObject( mob, fpArea, OS_CARRY );
		}
              else if ( !StrCmp( word, "END" ) )
		{
		  break;
		}
            }

          fclose(fpArea);
        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
}

/*
 * This will write one mobile structure pointed to be fp --Shaddai
 */
static void WriteMobile( FILE *fp, const Character *mob )
{
  if ( !IsNpc( mob ) || !fp )
    {
      return;
    }

  fprintf( fp, "#MOBILE\n" );
  fprintf( fp, "Vnum    %ld\n", mob->Prototype->Vnum );

  if ( mob->InRoom )
    {
      fprintf( fp, "Room  %ld\n",
	       (  mob->InRoom == GetRoom( ROOM_VNUM_LIMBO )
		  && mob->WasInRoom )
	       ? mob->WasInRoom->Vnum
	       : mob->InRoom->Vnum );
    }

  if ( StrCmp( mob->Name, mob->Prototype->Name) )
    {
      fprintf( fp, "Name     %s~\n", mob->Name.c_str() );
    }

  if ( StrCmp( mob->ShortDescr, mob->Prototype->ShortDescr) )
    {
      fprintf( fp, "Short %s~\n", mob->ShortDescr.c_str() );
    }

  if ( StrCmp( mob->LongDescr, mob->Prototype->LongDescr) )
    {
      fprintf( fp, "Long  %s~\n", mob->LongDescr.c_str() );
    }

  if ( StrCmp( mob->Description, mob->Prototype->Description) )
    {
      fprintf( fp, "Description %s~\n", mob->Description.c_str() );
    }

  fprintf( fp, "Position %d\n", mob->Position );
  fprintf( fp, "Flags %d\n", mob->Flags );
  /* Might need these later --Shaddai
     DeEquipCharacter( mob );
     ReEquipCharacter( mob );
  */

  for(const Object *obj : Reverse(mob->Objects()))
    {
      WriteObject( mob, obj, fp, 0, OS_CARRY );
    }

  fprintf( fp, "EndMobile\n" );
}

/*
 * This will read one mobile structure pointer to by fp --Shaddai
 */
static Character *ReadMobile( FILE *fp )
{
  Character *mob = NULL;
  bool fMatch = false;
  int inroom = 0;
  Room *pRoomIndex = NULL;
  const char *word = feof( fp ) ? "EndMobile" : ReadWord( fp,Log, fBootDb );

  if ( !StrCmp(word, "Vnum") )
    {
      int vnum = ReadInt( fp,Log, fBootDb );

      mob = CreateMobile( GetProtoMobile(vnum) );

      if ( !mob )
        {
          for ( ; ; )
	    {
	      word = feof( fp ) ? "EndMobile" : ReadWord( fp,Log, fBootDb );
	      /* So we don't get so many bug messages when something messes up
	       * --Shaddai
	       */
	      if ( !StrCmp( word, "EndMobile" ) )
		break;
	    }

          Log->Bug("ReadMobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; )
	{
	  word = feof( fp ) ? "EndMobile" : ReadWord( fp,Log, fBootDb );
	  /* So we don't get so many bug messages when something messes up
	   * --Shaddai
	   */
	  if ( !StrCmp( word, "EndMobile" ) )
	    {
	      break;
	    }
	}

      ExtractCharacter(mob, true);
      Log->Bug("ReadMobile: Vnum not found", 0 );
      return NULL;
    }

  for ( ; ;)
    {
      word = feof( fp ) ? "EndMobile" : ReadWord( fp,Log, fBootDb );
      fMatch = false;

      switch ( CharToUppercase(word[0]) )
	{
	case '*':
	  fMatch = true;
	  ReadToEndOfLine( fp,Log, fBootDb );
	  break;

	case '#':
	  if ( !StrCmp( word, "#OBJECT" ) )
	    ReadObject ( mob, fp, OS_CARRY );
	case 'D':
	  KEY( "Description", mob->Description, ReadStringToTilde(fp,Log, fBootDb));
	  break;

	case 'E':
	  if ( !StrCmp( word, "EndMobile" ) )
	    {
	      if ( inroom == 0 )
		{
		  inroom = ROOM_VNUM_TEMPLE;
		}

	      pRoomIndex = GetRoom( inroom );

	      if ( !pRoomIndex )
		{
		  pRoomIndex = GetRoom( ROOM_VNUM_TEMPLE );
		}

	      CharacterToRoom(mob, pRoomIndex);
	      return mob;
	    }
	  break;

	case 'F':
	  KEY( "Flags", mob->Flags, ReadInt( fp,Log, fBootDb ));
	  break;

	case 'L':
	  KEY( "Long", mob->LongDescr, ReadStringToTilde(fp,Log, fBootDb) );
	  break;

	case 'N':
	  KEY( "Name", mob->Name, ReadStringToTilde( fp,Log, fBootDb ) );
	  break;

	case 'P':
	  KEY( "Position", mob->Position, (PositionType)ReadInt( fp,Log, fBootDb ) );
	  break;

	case 'R':
	  KEY( "Room",  inroom, ReadInt(fp,Log, fBootDb));
	  break;

	case 'S':
	  KEY( "Short", mob->ShortDescr, ReadStringToTilde(fp,Log, fBootDb));
	  break;
	}

      if ( !fMatch )
	{
	  Log->Bug( "ReadMobile: no match.", 0 );
	  Log->Bug( word, 0 );
	}
    }

  return NULL;
}
