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

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"
#include "shops.h"
#include "clan.h"
#include "skill.h"

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
      Object *contents = NULL;


      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->Name[0]),
               Capitalize( ch->Name ) );

      if ( ( fp = fopen( filename, "w" ) ) )
        {
          templvl = ch->TopLevel;
          ch->TopLevel = LEVEL_AVATAR;           /* make sure EQ doesn't get lost */
          contents = ch->PlayerHome->LastContent;

          if (contents)
	    {
	      WriteObject(ch, contents, fp, 0, OS_CARRY );
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
  Object *obj = NULL;
  int x = 0;
  int y = 0;

  for ( x = 0; x < MAX_WEAR; x++ )
    {
      for ( y = 0; y < MAX_LAYERS; y++ )
	{
	  save_equipment[x][y] = NULL;
	}
    }

  for ( obj = ch->FirstCarrying; obj; obj = obj->NextContent )
    {
      if ( obj->WearLoc > WEAR_NONE && obj->WearLoc < MAX_WEAR )
	{
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
	      Bug( "%s had on more than %d layers of clothing in one location (%d): %s",
		   ch->Name, MAX_LAYERS, obj->WearLoc, obj->Name );
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
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( !ch )
    {
      Bug( "%s: null ch!", __FUNCTION__ );
      return;
    }

  if ( IsNpc(ch) || !IsAuthed(ch) )
    {
      return;
    }

  saving_char = ch;

  /* save pc's clan's data while we're at it to keep the data in sync */
  if ( !IsNpc(ch) && ch->PCData->ClanInfo.Clan )
    {
      SaveClan( ch->PCData->ClanInfo.Clan );
    }

  if ( ch->Desc && ch->Desc->Original )
    {
      ch = ch->Desc->Original;
    }

  DeEquipCharacter( ch );

  ch->PCData->SaveTime = current_time;
  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(ch->Name[0]),
           Capitalize( ch->Name ) );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IsBitSet( SysData.SaveFlags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->Name[0]),
               Capitalize( ch->Name ) );
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
      sprintf( strback, "%s%s", GOD_DIR, Capitalize( ch->Name ) );

      if ( ( fp = fopen( strback, "w" ) ) == NULL )
        {
          Bug( "%s: fopen", __FUNCTION__ );
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
      Bug( "%s: fopen", __FUNCTION__ );
      perror( strsave );
    }
  else
    {
      WriteCharacter( ch, fp );

      if ( ch->FirstCarrying )
	{
	  WriteObject( ch, ch->LastCarrying, fp, 0, OS_CARRY );
	}

      if ( ch->PCData && ch->PCData->Comments )
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

  WriteCorpses(ch, NULL);
  quitting_char = NULL;
  saving_char   = NULL;
}

void SaveClone( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( !ch )
    {
      Bug( "Save_char_obj: null ch!" );
      return;
    }

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
           Capitalize( ch->Name ) );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IsBitSet( SysData.SaveFlags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->Name[0]),
               Capitalize( ch->Name ) );
      rename( strsave, strback );
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      Bug( "Save_char_obj: fopen", 0 );
      perror( strsave );
    }
  else
    {
      WriteCharacter( ch, fp );

      if ( ch->PCData && ch->PCData->Comments )
	{
	  WriteComments( ch, fp );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  ch->PCData->Clones--;
  ReEquipCharacter( ch );

  WriteCorpses(ch, NULL);
  quitting_char = NULL;
  saving_char   = NULL;
}

/*
 * Write the char.
 */
static void WriteCharacter( const Character *ch, FILE *fp )
{
  const Affect *paf = NULL;
  const Alias *pal = NULL;
  int sn = 0;
  int track = 0;
  int drug = 0;
  const Skill *skill = NULL;

  fprintf( fp, "#%s\n", IsNpc(ch) ? "MOB" : "PLAYER"           );

  fprintf( fp, "Version      %d\n",   SAVEVERSION               );
  fprintf( fp, "Name         %s~\n",    ch->Name                );

  if ( !IsNullOrEmpty( ch->ShortDescr ) )
    {
      fprintf( fp, "ShortDescr   %s~\n",  ch->ShortDescr );
    }

  if ( !IsNullOrEmpty( ch->LongDescr ) )
    {
      fprintf( fp, "LongDescr    %s~\n",  ch->LongDescr  );
    }

  if ( !IsNullOrEmpty( ch->Description ) )
    {
      fprintf( fp, "Description  %s~\n",  ch->Description );
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
           ch->Hit, ch->MaxHit, ch->Move, ch->MaxMove );
  fprintf( fp, "Force        %d %d %d %d\n", ch->Stats.PermFrc, ch->Stats.ModFrc, ch->Mana, ch->MaxMana );
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
  fprintf( fp, "Clones         %d\n",   ch->PCData->Clones              );
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

  if ( ch->PCData && ch->PCData->OutcastTime )
    {
      fprintf( fp, "Outcast_time %ld\n",ch->PCData->OutcastTime );
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
      fprintf( fp, "Password     %s~\n", ch->PCData->Password );
      fprintf( fp, "Lastplayed   %d\n", (int)current_time );

      if ( !IsNullOrEmpty( ch->PCData->BamfIn ) )
	{
	  fprintf( fp, "Bamfin       %s~\n",      ch->PCData->BamfIn      );
	}

      if ( !IsNullOrEmpty( ch->PCData->Email ) )
	{
	  fprintf( fp, "Email       %s~\n",       ch->PCData->Email       );
	}

      if ( !IsNullOrEmpty( ch->PCData->BamfOut ) )
	{
	  fprintf( fp, "Bamfout      %s~\n",      ch->PCData->BamfOut     );
	}

      if ( !IsNullOrEmpty( ch->PCData->Rank ) )
	{
	  fprintf( fp, "Rank         %s~\n",      ch->PCData->Rank        );
	}

      if ( !IsNullOrEmpty( ch->PCData->Bestowments ) )
	{
	  fprintf( fp, "Bestowments  %s~\n",      ch->PCData->Bestowments );
	}

      fprintf( fp, "Title        %s~\n",        ch->PCData->Title       );

      if ( !IsNullOrEmpty( ch->PCData->HomePage ) )
	{
	  fprintf( fp, "Homepage     %s~\n",      ch->PCData->HomePage    );
	}

      if ( !IsNullOrEmpty( ch->PCData->Bio ) )
	{
	  fprintf( fp, "Bio          %s~\n",      ch->PCData->Bio         );
	}

      if ( !IsNullOrEmpty( ch->PCData->AuthedBy ) )
	{
	  fprintf( fp, "AuthedBy     %s~\n",      ch->PCData->AuthedBy   );
	}

      if ( ch->PCData->MinSnoop )
	{
	  fprintf( fp, "Minsnoop     %d\n",       ch->PCData->MinSnoop   );
	}

      if ( !IsNullOrEmpty( ch->PCData->Prompt ) )
	{
	  fprintf( fp, "Prompt       %s~\n",      ch->PCData->Prompt      );
	}

      if ( ch->PCData->PagerLength != 24 )
	{
	  fprintf( fp, "Pagerlen     %d\n",       ch->PCData->PagerLength    );
	}

      for ( pal = ch->PCData->FirstAlias; pal; pal = pal->Next )
        {
          if ( !pal->Name || !pal->Command || !*pal->Name || !*pal->Command )
	    {
	      continue;
	    }

          fprintf( fp, "Alias        %s~ %s~\n", pal->Name, pal->Command );
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

      if ( ch->PCData->ClanInfo.Clan )
	{
	  fprintf( fp, "Clan         %s~\n",      ch->PCData->ClanInfo.Clan->Name   );
	}

      fprintf( fp, "Flags        %d\n", ch->PCData->Flags       );

      if ( ch->PCData->ReleaseDate > current_time )
	{
	  fprintf( fp, "Helled       %d %s~\n",
		   (int)ch->PCData->ReleaseDate, ch->PCData->HelledBy );
	}

      if ( ch->PCData->PKills )
	{
	  fprintf( fp, "PKills       %d\n",       ch->PCData->PKills      );
	}

      if ( ch->PCData->PDeaths )
	{
	  fprintf( fp, "PDeaths      %d\n",       ch->PCData->PDeaths     );
	}

      if ( !IsNullOrEmpty( ch->PCData->Target ) )
	{
	  fprintf( fp, "Targ %s~\n",      ch->PCData->Target      );
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
               ch->Stats.PermStr,
               ch->Stats.PermInt,
               ch->Stats.PermWis,
               ch->Stats.PermDex,
               ch->Stats.PermCon,
               ch->Stats.PermCha,
               ch->Stats.PermLck );

      fprintf( fp, "AttrMod      %d %d %d %d %d %d %d\n",
               ch->Stats.ModStr,
               ch->Stats.ModInt,
               ch->Stats.ModWis,
               ch->Stats.ModDex,
               ch->Stats.ModCon,
               ch->Stats.ModCha,
               ch->Stats.ModLck );

      fprintf( fp, "Condition    %d %d %d %d\n",
               ch->PCData->Condition[0],
               ch->PCData->Condition[1],
               ch->PCData->Condition[2],
               ch->PCData->Condition[3] );

      if ( ch->Desc && !IsNullOrEmpty( ch->Desc->Remote.Hostname ) )
	{
	  fprintf( fp, "Site         %s\n", ch->Desc->Remote.Hostname );
	}
      else
	{
	  fprintf( fp, "Site         (Link-Dead)\n" );
	}

      for ( sn = 1; sn < TopSN; sn++ )
        {
          if ( SkillTable[sn]->Name && ch->PCData->Learned[sn] > 0 )
	    {
	      switch( SkillTable[sn]->Type )
		{
		default:
		  fprintf( fp, "Skill        %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name );
		  break;

		case SKILL_SPELL:
		  fprintf( fp, "Spell        %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name );
		  break;

		case SKILL_WEAPON:
		  fprintf( fp, "Weapon       %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name );
		  break;

		case SKILL_TONGUE:
		  fprintf( fp, "Tongue       %d '%s'\n",
			   ch->PCData->Learned[sn], SkillTable[sn]->Name );
		  break;
		}
	    }
        }
    }

  for ( paf = ch->FirstAffect; paf; paf = paf->Next )
    {
      if ( paf->Type >= 0 && (skill=GetSkill(paf->Type)) == NULL )
	{
	  continue;
	}

      if ( paf->Type >= 0 && paf->Type < TYPE_PERSONAL )
	{
	  fprintf( fp, "AffectData   '%s' %3d %3d %3d %10d\n",
		   skill->Name,
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

  track = urange( 2, ((ch->TopLevel+3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );

  for ( sn = 0; sn < track; sn++ )
    {
      if ( ch->PCData->Killed[sn].Vnum == INVALID_VNUM )
	{
	  break;
	}

      fprintf( fp, "Killed       %ld %d\n",
               ch->PCData->Killed[sn].Vnum,
               ch->PCData->Killed[sn].Count );
    }

#ifdef SWRIP_USE_IMC
  ImcSaveCharacter( ch, fp );
#endif

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
  ExtraDescription *ed = NULL;
  Affect *paf = NULL;
  short wear = 0, wear_loc = 0, x = 0;

  if ( iNest >= MAX_NEST )
    {
      Bug( "WriteObject: iNest hit MAX_NEST %d", iNest );
      return;
    }

  /*
   * Slick recursion to write lists backwards,
   *   so loading them will load in forwards order.
   */
  if ( obj->PreviousContent && os_type != OS_CORPSE )
    {
      WriteObject( ch, obj->PreviousContent, fp, iNest, OS_CARRY );
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
      fprintf( fp, "Name         %s~\n",  obj->Name            );
    }

  if ( StrCmp( obj->ShortDescr, obj->Prototype->ShortDescr ) )
    {
      fprintf( fp, "ShortDescr   %s~\n",  obj->ShortDescr     );
    }

  if ( StrCmp( obj->Description, obj->Prototype->Description ) )
    {
      fprintf( fp, "Description  %s~\n",  obj->Description     );
    }

  if ( StrCmp( obj->ActionDescription, obj->Prototype->ActionDescription ) )
    {
      fprintf( fp, "ActionDesc   %s~\n",  obj->ActionDescription     );
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
		   SkillTable[obj->Value[OVAL_PILL_SPELL1]]->Name );
	}

      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL2]) )
	{
	  fprintf( fp, "Spell 2      '%s'\n",
		   SkillTable[obj->Value[OVAL_PILL_SPELL2]]->Name );
	}

      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL3]) )
	{
	  fprintf( fp, "Spell 3      '%s'\n",
		   SkillTable[obj->Value[OVAL_PILL_SPELL3]]->Name );
	}
      break;

    case ITEM_DEVICE:
      if ( IS_VALID_SN(obj->Value[OVAL_DEVICE_SPELL]) )
	{
	  fprintf( fp, "Spell 3      '%s'\n",
		   SkillTable[obj->Value[OVAL_DEVICE_SPELL]]->Name );
	}
      break;

    case ITEM_SALVE:
      if ( IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL1]) )
	{
	  fprintf( fp, "Spell 4      '%s'\n",
		   SkillTable[obj->Value[OVAL_SALVE_SPELL1]]->Name );
	}

      if ( IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL2]) )
	{
	  fprintf( fp, "Spell 5      '%s'\n",
		   SkillTable[obj->Value[OVAL_SALVE_SPELL2]]->Name );
	}

      break;

    default:
      break;
    }

  for ( paf = obj->FirstAffect; paf; paf = paf->Next )
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
		   SkillTable[paf->Type]->Name,
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

  for ( ed = obj->FirstExtraDescription; ed; ed = ed->Next )
    {
      fprintf( fp, "ExtraDescr   %s~ %s~\n",
	       ed->Keyword, ed->Description );
    }

  fprintf( fp, "End\n\n" );

  if ( obj->FirstContent )
    {
      WriteObject( ch, obj->LastContent, fp, iNest + 1, OS_CARRY );
    }
}

/*
 * Load a char and inventory into a new ch structure.
 */
bool LoadCharacter( Descriptor *d, const char *name, bool preload )
{
  char strsave[MAX_INPUT_LENGTH];
  Character *ch = NULL;
  FILE *fp = NULL;
  bool found = false;
  struct stat fst;
  int i = 0, x = 0;
  char buf[MAX_INPUT_LENGTH];

  AllocateMemory( ch, Character, 1 );

  for ( x = 0; x < MAX_WEAR; x++ )
    {
      for ( i = 0; i < MAX_LAYERS; i++ )
	{
	  save_equipment[x][i] = NULL;
	}
    }

  ClearCharacter( ch );
  loading_char = ch;

  AllocateMemory( ch->PCData, PCData, 1 );
  d->Character                = ch;
  ch->Desc                            = d;
  ch->Name                            = CopyString( name );
  ch->Flags                             = PLR_BLANK | PLR_COMBINE | PLR_PROMPT;
  ch->Stats.PermStr                  = 10;
  ch->Stats.PermInt                  = 10;
  ch->Stats.PermWis                  = 10;
  ch->Stats.PermDex                  = 10;
  ch->Stats.PermCon                  = 10;
  ch->Stats.PermCha                  = 10;
  ch->Stats.PermLck                  = 10;
  ch->PCData->Condition[COND_THIRST]  = 48;
  ch->PCData->Condition[COND_FULL]    = 48;
  ch->PCData->Condition[COND_BLOODTHIRST] = 10;
  ch->MentalState                    = -10;

  for(i = 0; i < MAX_SKILL; i++)
    {
      ch->PCData->Learned[i]          = 0;
    }

  ch->PCData->PagerLength      = 24;
  ch->MobClan              = CopyString( "" );

#ifdef SWRIP_USE_IMC
  ImcInitializeCharacter( ch );
#endif

  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           Capitalize( name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      if ( fst.st_size == 0 )
        {
          sprintf( strsave, "%s%c/%s", BACKUP_DIR, tolower(name[0]),
                   Capitalize( name ) );
          SendToCharacter( "Restoring your backup player file...", ch );
        }
      else
        {
          sprintf( buf, "%s player data for: %s (%dK)",
                   preload ? "Preloading" : "Loading", ch->Name,
                   (int) fst.st_size/1024 );
          LogStringPlus( buf, LOG_COMM, LEVEL_GREATER );
        }
    }
  /* else no player file */

  if ( ( fp = fopen( strsave, "r" ) ) != NULL )
    {
      int iNest = 0;

      for ( iNest = 0; iNest < MAX_NEST; iNest++ )
	{
	  rgObjNest[iNest] = NULL;
	}

      found = true;
      /* Cheat so that bug will show line #'s -- Altrag */
      fpArea = fp;
      strcpy(strArea, strsave);

      for ( ; ; )
        {
	  const char *word;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_char_obj: # not found.", 0 );
              Bug( name );
              break;
            }

          word = ReadWord( fp );

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
	      Bug( "Load_char_obj: bad section." );
	      Bug( name );
	      break;
	    }
        }

      fclose( fp );
      fpArea = NULL;
      strcpy(strArea, "$");
    }

  if ( !found )
    {
      ch->ShortDescr           = CopyString( "" );
      ch->LongDescr            = CopyString( "" );
      ch->Description           = CopyString( "" );
      ch->PCData->Target        = CopyString( "" );
      ch->PCData->ClanInfo.ClanName = CopyString( "" );
      ch->PCData->Password      = CopyString( "" );
      ch->PCData->Email         = CopyString( "" );
      ch->PCData->BamfIn        = CopyString( "" );
      ch->PCData->BamfOut       = CopyString( "" );
      ch->PCData->Rank          = CopyString( "" );
      ch->PCData->Bestowments   = CopyString( "" );
      ch->PCData->Title         = CopyString( "" );
      ch->PCData->HomePage      = CopyString( "" );
      ch->PCData->Bio           = CopyString( "" );
      ch->PCData->AuthedBy      = CopyString( "" );
      ch->PCData->Prompt        = CopyString( "" );
    }
  else
    {
      if ( !ch->PCData->ClanInfo.ClanName )
        {
          ch->PCData->ClanInfo.ClanName = CopyString( "" );
        }

      if ( !ch->PCData->Bio )
	{
	  ch->PCData->Bio  = CopyString( "" );
	}

      if ( !ch->PCData->AuthedBy )
	{
	  ch->PCData->AuthedBy    = CopyString( "" );
	}

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
          for ( i = 0; i < MAX_WEAR; i++ )
	    {
	      for ( x = 0; x < MAX_LAYERS; x++ )
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
      char buf[MAX_STRING_LENGTH];
      const char *line = NULL;
      int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0, x7 = 0, x8 = 0, x9 = 0, x0 = 0;
      short killcnt = 0;
      time_t lastplayed = 0;
      int sn = 0;
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          KEY( "Act",           ch->Flags,                ReadInt( fp ) );
          KEY( "AffectedBy",    ch->AffectedBy,        ReadInt( fp ) );
          KEY( "Alignment",     ch->Alignment,          ReadInt( fp ) );
          KEY( "Armor", ch->ArmorClass,              ReadInt( fp ) );

          if ( !StrCmp( word, "Addiction"  ) )
            {
              line = ReadLine( fp );
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
              line = ReadLine( fp );
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
              Affect *paf = NULL;

              if ( preload )
                {
                  fMatch = true;
                  ReadToEndOfLine( fp );
                  break;
                }

              AllocateMemory( paf, Affect, 1 );

              if ( !StrCmp( word, "Affect" ) )
                {
                  paf->Type = ReadInt( fp );
                }
              else
                {
                  const char *sname = ReadWord(fp);

                  if ( (sn=LookupSkill(sname)) < 0 )
                    {
                      if ( (sn=LookupHerb(sname)) < 0 )
			{
			  Bug( "%s (%d): unknown skill %s.",
			       __FUNCTION__, __LINE__, sname );
			}
                      else
			{
			  sn += TYPE_HERB;
			}
                    }

                  paf->Type = sn;
                }

              paf->Duration   = ReadInt( fp );
              paf->Modifier   = ReadInt( fp );
              paf->Location   = ReadInt( fp );
              paf->AffectedBy = ReadInt( fp );
              LINK(paf, ch->FirstAffect, ch->LastAffect, Next, Previous );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "AttrMod"  ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=x7=13;
              sscanf( line, "%d %d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6, &x7 );
              ch->Stats.ModStr = x1;
              ch->Stats.ModInt = x2;
              ch->Stats.ModWis = x3;
              ch->Stats.ModDex = x4;
              ch->Stats.ModCon = x5;
              ch->Stats.ModCha = x6;
              ch->Stats.ModLck = x7;
              if (!x7)
                ch->Stats.ModLck = 0;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Alias" ) )
            {
              Alias *pal = NULL;

              if ( preload )
                {
                  fMatch = true;
                  ReadToEndOfLine( fp );
                  break;
                }

              AllocateMemory( pal, Alias, 1 );

              pal->Name = ReadStringToTilde( fp );
              pal->Command  = ReadStringToTilde( fp );
	      AddAlias( ch, pal );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "AttrPerm" ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=x7=0;
              sscanf( line, "%d %d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6, &x7 );
              ch->Stats.PermStr = x1;
              ch->Stats.PermInt = x2;
              ch->Stats.PermWis = x3;
              ch->Stats.PermDex = x4;
              ch->Stats.PermCon = x5;
              ch->Stats.PermCha = x6;
              ch->Stats.PermLck = x7;

              if ( x7 == 0 )
		{
		  ch->Stats.PermLck = 13;
		}

              fMatch = true;
              break;
            }

          KEY( "AuthedBy",      ch->PCData->AuthedBy,  ReadStringToTilde( fp ) );
          break;

        case 'B':
          KEY( "Bamfin",        ch->PCData->BamfIn,     ReadStringToTilde( fp ) );
          KEY( "Bamfout",       ch->PCData->BamfOut,    ReadStringToTilde( fp ) );
          KEY( "Bestowments", ch->PCData->Bestowments, ReadStringToTilde( fp ) );
          KEY( "Bio",           ch->PCData->Bio,        ReadStringToTilde( fp ) );
          KEY( "Bank",  ch->PCData->Bank,       ReadInt( fp ) );
          break;

        case 'C':
          if ( !StrCmp( word, "Clan" ) )
            {
              ch->PCData->ClanInfo.ClanName = ReadStringToTilde( fp );

              if ( !preload
                   && !IsNullOrEmpty( ch->PCData->ClanInfo.ClanName )
                   && ( ch->PCData->ClanInfo.Clan = GetClan( ch->PCData->ClanInfo.ClanName )) == NULL )
                {
                  Echo( ch, "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n", ch->PCData->ClanInfo.ClanName );
                  FreeMemory( ch->PCData->ClanInfo.ClanName );
                  RemoveClanMember(ch);
                  ch->PCData->ClanInfo.ClanName = CopyString( "" );
                }
              else
		{
		  UpdateClanMember(ch);
		}

              fMatch = true;
              break;
            }

          KEY( "Clones",        ch->PCData->Clones,             ReadInt( fp ) );

          if ( !StrCmp( word, "Condition" ) )
            {
              line = ReadLine( fp );
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
          KEY( "Damroll",       ch->DamRoll,            ReadInt( fp ) );
          KEY( "Deaf",  ch->Deaf,               ReadInt( fp ) );
          KEY( "Description",   ch->Description,        ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Druglevel"  ) )
            {
              line = ReadLine( fp );
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
          KEY( "Flags", ch->PCData->Flags,      ReadInt( fp ) );

          if ( !StrCmp( word, "Force" ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4);
              ch->Stats.PermFrc = x1;
              ch->Stats.ModFrc = x2;
              ch->Mana = x3;
              ch->MaxMana = x4;
              fMatch = true;
              break;
            }
          break;

        case 'G':
          KEY( "Gold",  ch->Gold,               ReadInt( fp ) );
          /* temporary measure */
          if ( !StrCmp( word, "Guild" ) )
            {
              ch->PCData->ClanInfo.ClanName = ReadStringToTilde( fp );

              if ( !preload
                   && !IsNullOrEmpty( ch->PCData->ClanInfo.ClanName )
                   && ( ch->PCData->ClanInfo.Clan = GetClan( ch->PCData->ClanInfo.ClanName )) == NULL )
                {
                  Echo( ch, "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n",
                           ch->PCData->ClanInfo.ClanName );
                  FreeMemory( ch->PCData->ClanInfo.ClanName );
                  ch->PCData->ClanInfo.ClanName = CopyString( "" );
                }

              fMatch = true;
              break;
            }
          break;

        case 'H':
          if ( !StrCmp(word, "Helled") )
            {
              ch->PCData->ReleaseDate = ReadInt(fp);
              ch->PCData->HelledBy = ReadStringToTilde(fp);

              if ( ch->PCData->ReleaseDate < current_time )
                {
                  FreeMemory(ch->PCData->HelledBy);
                  ch->PCData->HelledBy = NULL;
                  ch->PCData->ReleaseDate = 0;
                  ch->PCData->JailVnum = 0;
                }

              fMatch = true;
              break;
            }

          KEY( "Hitroll",       ch->HitRoll,            ReadInt( fp ) );
          KEY( "Homepage",      ch->PCData->HomePage,   ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "HpManaMove" ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6 );
              ch->Hit = x1;
              ch->MaxHit = x2;
              ch->Move = x5;
              ch->MaxMove = x6;

              if ( x4 >= 100 )
                {
                  ch->Stats.PermFrc = GetRandomNumberFromRange( 1 , 20 );
                  ch->MaxMana = x4;
                  ch->Mana     = x4;
                }
              else if ( x4 >= 10 )
                {
                  ch->Stats.PermFrc = 1;
                  ch->MaxMana = x4;
                }

              fMatch = true;
              break;
            }

          break;

        case 'I':
          KEY( "IllegalPK",     ch->PCData->IllegalPk, ReadInt( fp ) );
          KEY( "Immune",        ch->Immune,             ReadInt( fp ) );

#ifdef SWRIP_USE_IMC
	  if( ( fMatch = ImcLoadCharacter( ch, fp, word ) ) )
	    {
	      break;
	    }
#endif
          break;
        case 'J':
          KEY( "Jailvnum",    ch->PCData->JailVnum,          ReadInt( fp ) );
          break;

        case 'K':
          if ( !StrCmp( word, "Killed" ) )
            {
              fMatch = true;

              if ( killcnt >= MAX_KILLTRACK )
		{
		  Bug( "ReadCharacter: killcnt (%d) >= MAX_KILLTRACK", killcnt );
		}
              else
                {
                  ch->PCData->Killed[killcnt].Vnum    = ReadInt( fp );
                  ch->PCData->Killed[killcnt++].Count = ReadInt( fp );
                }
            }
          break;

        case 'L':
          if ( !StrCmp(word, "Lastplayed") )
            {
              lastplayed = ReadInt(fp);
              fMatch = true;
              break;
            }

          KEY( "LongDescr",     ch->LongDescr,         ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Languages" ) )
            {
              ch->Speaks = ReadInt( fp );
              ch->Speaking = ReadInt( fp );
              fMatch = true;
            }

          break;

        case 'M':
          KEY( "MainAbility",   ch->Ability.Main,               ReadInt( fp ) );
          KEY( "MDeaths",       ch->PCData->MDeaths,    ReadInt( fp ) );
          KEY( "Mentalstate", ch->MentalState, ReadInt( fp ) );
          KEY( "Minsnoop",      ch->PCData->MinSnoop,  ReadInt( fp ) );
          KEY( "MKills",        ch->PCData->MKills,     ReadInt( fp ) );
          KEY( "Mobinvis",      ch->MobInvis,           ReadInt( fp ) );

          if ( !StrCmp( word, "MobRange" ) )
            {
              ch->PCData->Build.VnumRanges.Mob.First = ReadInt( fp );
              ch->PCData->Build.VnumRanges.Mob.Last = ReadInt( fp );
              fMatch = true;
            }

          break;

        case 'N':
          if ( !StrCmp( word, "Name" ) )
            {
              /*
               * Name already set externally.
               */
              ReadToEndOfLine( fp );
              fMatch = true;
              break;
            }
          break;

        case 'O':
          KEY( "Outcast_time", ch->PCData->OutcastTime, ReadInt( fp ) );

          if ( !StrCmp( word, "ObjRange" ) )
            {
              ch->PCData->Build.VnumRanges.Object.First = ReadInt( fp );
              ch->PCData->Build.VnumRanges.Object.Last = ReadInt( fp );
              fMatch = true;
            }
          break;

        case 'P':
          KEY( "Pagerlen",      ch->PCData->PagerLength,   ReadInt( fp ) );
          KEY( "Password",      ch->PCData->Password,        ReadStringToTilde( fp ) );
          KEY( "PDeaths",       ch->PCData->PDeaths,    ReadInt( fp ) );
          KEY( "PKills",        ch->PCData->PKills,     ReadInt( fp ) );
          KEY( "Played",        ch->PCData->Played,     ReadInt( fp ) );
          KEY( "Position",      ch->Position,           (PositionType)ReadInt( fp ) );
          KEY( "Prompt",        ch->PCData->Prompt,     ReadStringToTilde( fp ) );

          if (!StrCmp ( word, "PTimer" ) )
            {
              AddTimerToCharacter( ch , TIMER_PKILLED, ReadInt(fp), NULL, SUB_NONE );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "PlrHome" ) )
            {
              ch->PlayerHome = GetRoom( ReadInt( fp ) );

              if ( !ch->PlayerHome )
		{
		  ch->PlayerHome = NULL;
		}

              fMatch = true;
              break;
            }

          break;

        case 'R':
          KEY( "Race",        ch->Race,         ReadInt( fp ) );
          KEY( "Rank",        ch->PCData->Rank, ReadStringToTilde( fp ) );
          KEY( "Resistant",     ch->Resistant,          ReadInt( fp ) );
          KEY( "Restore_time",ch->PCData->RestoreTime, ReadInt( fp ) );

          if ( !StrCmp( word, "Room" ) )
            {
              ch->InRoom = GetRoom( ReadInt( fp ) );

              if ( !ch->InRoom )
		{
		  ch->InRoom = GetRoom( ROOM_VNUM_LIMBO );
		}

              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "RoomRange" ) )
            {
              ch->PCData->Build.VnumRanges.Room.First = ReadInt( fp );
              ch->PCData->Build.VnumRanges.Room.Last = ReadInt( fp );
              fMatch = true;
            }

          break;

        case 'S':
          KEY( "Salary",      ch->PCData->ClanInfo.Salary, ReadInt( fp ) );
          KEY( "Salary_time",ch->PCData->ClanInfo.SalaryDate, ReadInt( fp ) );
          KEY( "Sex",           ch->Sex,                (SexType)ReadInt( fp ) );
          KEY( "ShortDescr",    ch->ShortDescr,        ReadStringToTilde( fp ) );
          KEY( "Susceptible",   ch->Susceptible,        ReadInt( fp ) );

          if ( !StrCmp( word, "SavingThrow" ) )
            {
              ch->Saving.Wand   = ReadInt( fp );
              ch->Saving.PoisonDeath = ch->Saving.Wand;
              ch->Saving.ParaPetri     = ch->Saving.Wand;
              ch->Saving.Breath         = ch->Saving.Wand;
              ch->Saving.SpellStaff    = ch->Saving.Wand;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "SavingThrows" ) )
            {
              ch->Saving.PoisonDeath = ReadInt( fp );
              ch->Saving.Wand   = ReadInt( fp );
              ch->Saving.ParaPetri     = ReadInt( fp );
              ch->Saving.Breath         = ReadInt( fp );
              ch->Saving.SpellStaff    = ReadInt( fp );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Site" ) )
            {
              if ( !preload )
                {
                  Echo( ch, "Last connected from: %s\r\n", ReadWord( fp ) );
                }
              else
		{
		  ReadToEndOfLine( fp );
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
                  value = ReadInt( fp );

                  if ( file_ver < 3 )
		    {
		      sn = LookupSkill( ReadWord( fp ) );
		    }
                  else
		    {
		      sn = BSearchSkillExact( ReadWord( fp ), gsn_first_skill, gsn_first_weapon-1 );
		    }

                  if ( sn < 0 )
		    {
		      Bug( "%s (%d): unknown skill sn %d.",
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
                  value = ReadInt( fp );
                  sn = BSearchSkillExact( ReadWord( fp ), gsn_first_spell, gsn_first_skill-1 );

                  if ( sn < 0 )
		    {
		      Bug( "%s (%d): unknown spell sn %d.",
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
              if (!ch->ShortDescr)
                ch->ShortDescr = CopyString( "" );

              if (!ch->LongDescr)
                ch->LongDescr  = CopyString( "" );

              if (!ch->Description)
                ch->Description = CopyString( "" );

              if (!ch->PCData->Password)
                ch->PCData->Password = CopyString( "" );

              if (!ch->PCData->Email)
                ch->PCData->Email       = CopyString( "" );

              if (!ch->PCData->BamfIn)
                ch->PCData->BamfIn      = CopyString( "" );

              if (!ch->PCData->BamfOut)
                ch->PCData->BamfOut     = CopyString( "" );

              if (!ch->PCData->Bio)
                ch->PCData->Bio = CopyString( "" );

              if (!ch->PCData->Rank)
                ch->PCData->Rank        = CopyString( "" );

              if (!ch->PCData->Bestowments)
                ch->PCData->Bestowments = CopyString( "" );

              if (!ch->PCData->Title)
                ch->PCData->Title       = CopyString( "" );

              if (!ch->PCData->HomePage)
                ch->PCData->HomePage    = CopyString( "" );

              if (!ch->PCData->AuthedBy)
                ch->PCData->AuthedBy = CopyString( "" );

              if (!ch->PCData->Prompt )
                ch->PCData->Prompt      = CopyString( "" );

              ch->Editor                = NULL;
              killcnt = urange( 2, ((ch->TopLevel+3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
              if ( killcnt < MAX_KILLTRACK )
                ch->PCData->Killed[killcnt].Vnum = 0;
              {
                int ability;

                for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
                  {
                    if ( GetAbilityLevel( ch, ability ) == 0 )
		      {
			SetAbilityLevel( ch, ability, 1 );
		      }
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

              if ( !ch->PCData->Prompt )
		{
		  ch->PCData->Prompt = CopyString("");
		}

              if ( lastplayed != 0 )
                {
                  int hitgain = ( ( int ) ( current_time - lastplayed ) / 60 );
                  ch->Hit = urange( 1 , ch->Hit + hitgain , ch->MaxHit );
                  ch->Move = urange( 1 , ch->Move + hitgain , ch->MaxMove );

                  if ( IsJedi( ch ) )
		    {
		      ch->Mana = urange( 0 , ch->Mana + hitgain , ch->MaxMana );
		    }

                  ImproveMentalState( ch , hitgain );
                }

              for ( sn = 0; sn < TopSN; sn++ )
                {
                  if ( !SkillTable[sn]->Name )
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

          KEY( "Email", ch->PCData->Email,      ReadStringToTilde( fp ) );
          break;

        case 'T':
          KEY( "Targ",  ch->PCData->Target,     ReadStringToTilde( fp ) );
          KEY( "Toplevel",      ch->TopLevel,          ReadInt( fp ) );

          if ( !StrCmp( word, "Tongue" ) )
            {
              int value  = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp );
                  sn = BSearchSkillExact( ReadWord( fp ), gsn_first_tongue, gsn_TopSN-1 );

                  if ( sn < 0 )
		    {
		      Bug( "%s (%d): unknown tongue sn %d.",
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

          KEY( "Trust", ch->Trust, ReadInt( fp ) );
          /* Let no character be trusted higher than one below maxlevel -- Narn */
          ch->Trust = umin( ch->Trust, MAX_LEVEL - 1 );

          if ( !StrCmp( word, "Title" ) )
            {
              ch->PCData->Title = ReadStringToTilde( fp );

              if ( isalpha(ch->PCData->Title[0])
                   || isdigit(ch->PCData->Title[0]) )
                {
                  sprintf( buf, "%s", ch->PCData->Title );

                  if ( ch->PCData->Title )
                    FreeMemory( ch->PCData->Title );

                  ch->PCData->Title = CopyString( buf );
                }

              fMatch = true;
              break;
            }

          break;

        case 'V':
          if ( !StrCmp( word, "Vnum" ) )
            {
              ch->Prototype = GetProtoMobile( ReadInt( fp ) );
              fMatch = true;
              break;
            }

          KEY( "Version",       file_ver,               ReadInt( fp ) );
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
                  value = ReadInt( fp );
                  sn = BSearchSkillExact( ReadWord( fp ), gsn_first_weapon, gsn_first_tongue-1 );
                  if ( sn < 0 )
		    {
		      Bug( "%s (%d): unknown weapon sn %d.",
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

          KEY( "Wimpy", ch->Wimpy,              ReadInt( fp ) );
          KEY( "WizInvis",      ch->PCData->WizInvis,   ReadInt( fp ) );
          KEY( "Wanted",        ch->PCData->WantedFlags,  ReadInt( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "ReadCharacter: no match: %s", word );
        }
    }
}

void ReadObject( Character *ch, FILE *fp, short os_type )
{
  Object *obj = NULL;
  int iNest = 0;
  bool fNest = true; /* Yes, these should             */
  bool fVnum = true; /* indeed be initialized as true */
  Room *room = NULL;

  AllocateMemory( obj, Object, 1 );
  obj->Count     = 1;
  obj->WearLoc  = WEAR_NONE;
  obj->Weight    = 1;

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          if ( !StrCmp( word, "Affect" ) || !StrCmp( word, "AffectData" ) )
            {
              Affect *paf = NULL;
              int pafmod = 0;

              AllocateMemory( paf, Affect, 1 );

              if ( !StrCmp( word, "Affect" ) )
                {
                  paf->Type = ReadInt( fp );
                }
              else
                {
                  int sn = LookupSkill( ReadWord( fp ) );

                  if ( sn < 0 )
		    {
		      Bug( "%s (%d): unknown skill sn %d.",
			   __FUNCTION__, __LINE__, sn );
		    }
                  else
		    {
		      paf->Type = sn;
		    }
                }

              paf->Duration     = ReadInt( fp );
              pafmod            = ReadInt( fp );
              paf->Location     = ReadInt( fp );
              paf->AffectedBy   = ReadInt( fp );

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

              LINK(paf, obj->FirstAffect, obj->LastAffect, Next, Previous );
              fMatch                            = true;
              break;
            }

          KEY( "Actiondesc",    obj->ActionDescription,       ReadStringToTilde( fp ) );
          break;

        case 'C':
          KEY( "Cost",  obj->Cost,              ReadInt( fp ) );
          KEY( "Count", obj->Count,             ReadInt( fp ) );
          break;

        case 'D':
          KEY( "Description",   obj->Description,       ReadStringToTilde( fp ) );
          break;

        case 'E':
          KEY( "ExtraFlags",    obj->Flags,       ReadInt( fp ) );

          if ( !StrCmp( word, "ExtraDescr" ) )
            {
              ExtraDescription *ed = NULL;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->Keyword = ReadStringToTilde( fp );
              ed->Description = ReadStringToTilde( fp );
              LINK(ed, obj->FirstExtraDescription, obj->LastExtraDescription, Next, Previous );
              fMatch = true;
            }

          if ( !StrCmp( word, "End" ) )
            {
              if ( !fNest || !fVnum )
                {
                  Bug( "Fread_obj: incomplete object.", 0 );

                  if ( obj->Name )
                    FreeMemory( obj->Name );

                  if ( obj->Description )
                    FreeMemory( obj->Description );

                  if ( obj->ShortDescr )
                    FreeMemory( obj->ShortDescr );

                  FreeMemory( obj );
                  return;
                }
              else
                {
                  short wear_loc = obj->WearLoc;

                  if ( !obj->Name )
                    obj->Name = CopyString( obj->Prototype->Name );

                  if ( !obj->Description )
                    obj->Description = CopyString( obj->Prototype->Description );

                  if ( !obj->ShortDescr )
                    obj->ShortDescr = CopyString( obj->Prototype->ShortDescr );

                  if ( !obj->ActionDescription )
                    obj->ActionDescription = CopyString( obj->Prototype->ActionDescription );

                  LINK(obj, first_object, last_object, Next, Previous );
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
                          Bug( "Fread_obj: Corpse without room", 0);
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
			      Bug( "Fread_obj: too many layers %d", wear_loc );
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
			  Bug( "Fread_obj: nest layer missing %d", iNest-1 );
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
          KEY( "ItemType",      obj->ItemType,         (ItemTypes)ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Level", obj->Level,             ReadInt( fp ) );
          break;

        case 'N':
          KEY( "Name",  obj->Name,              ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Nest" ) )
            {
              iNest = ReadInt( fp );

              if ( iNest < 0 || iNest >= MAX_NEST )
                {
                  Bug( "Fread_obj: bad nest %d.", iNest );
                  iNest = 0;
                  fNest = false;
                }

              fMatch = true;
            }
          break;

        case 'R':
          KEY( "Room", room, GetRoom(ReadInt(fp)) );

        case 'S':
          KEY( "ShortDescr",    obj->ShortDescr,       ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Spell" ) )
            {
              int iValue = ReadInt( fp );
              int sn     = LookupSkill( ReadWord( fp ) );

              if ( iValue < 0 || iValue > 5 )
		{
		  Bug( "Fread_obj: bad iValue %d.", iValue );
		}
              else if ( sn < 0 )
		{
		  Bug( "%s (%d): unknown skill sn %d.",
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
          KEY( "Timer", obj->Timer,             ReadInt( fp ) );
          break;

        case 'V':
          if ( !StrCmp( word, "Values" ) )
            {
              int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0;
              const char *ln = ReadLine( fp );

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
              vnum_t vnum = ReadInt( fp );

              if ( ( obj->Prototype = GetProtoObject( vnum ) ) == NULL )
                {
                  fVnum = false;
                  Bug( "Fread_obj: bad vnum %d.", vnum );
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
          KEY( "WearFlags",     obj->WearFlags,        ReadInt( fp ) );
          KEY( "WearLoc",       obj->WearLoc,          (WearLocation)ReadInt( fp ) );
          KEY( "Weight",        obj->Weight,            ReadInt( fp ) );
          break;

        }

      if ( !fMatch )
        {
          ExtraDescription *ed = NULL;
          Affect *paf = NULL;

          Bug( "Fread_obj: no match." );
          Bug( word );
          ReadToEndOfLine( fp );

          if ( obj->Name )
            FreeMemory( obj->Name        );

          if ( obj->Description )
            FreeMemory( obj->Description );

          if ( obj->ShortDescr )
            FreeMemory( obj->ShortDescr );

          while ( (ed=obj->FirstExtraDescription) != NULL )
            {
              FreeMemory( ed->Keyword );
              FreeMemory( ed->Description );
              UNLINK( ed, obj->FirstExtraDescription, obj->LastExtraDescription, Next, Previous );
              FreeMemory( ed );
            }

          while ( (paf=obj->FirstAffect) != NULL )
            {
              UNLINK( paf, obj->FirstAffect, obj->LastAffect, Next, Previous );
              FreeMemory( paf );
            }

          FreeMemory( obj );
          return;
        }
    }
}

void SetAlarm( long seconds )
{
  alarm( seconds );
}

void WriteCorpses( const Character *ch, const char *name )
{
  const Object *corpse = NULL;
  FILE *fp = NULL;

  /* Name and ch support so that we dont have to have a char to save their
     corpses.. (ie: decayed corpses while offline) */
  if ( ch && IsNpc(ch) )
    {
      Bug( "Write_corpses: writing NPC corpse." );
      return;
    }

  if ( ch )
    {
      name = ch->Name;
    }

  /* Go by vnum, less chance of screwups. -- Altrag */
  for ( corpse = first_object; corpse; corpse = corpse->Next )
    {
      if ( corpse->Prototype->Vnum == OBJ_VNUM_CORPSE_PC
	   && corpse->InRoom != NULL && corpse->Value[OVAL_CORPSE_SKINNED] != 1
	   && !StrCmp(corpse->ShortDescr+14, name) )
	{
	  if ( !fp )
	    {
	      char buf[127];

	      sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name));

	      if ( !(fp = fopen(buf, "w")) )
		{
		  Bug( "Write_corpses: Cannot open file." );
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

      sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name));
      remove(buf);
    }
}

void LoadCorpses( void )
{
  DIR *dp = NULL;
  struct dirent *de = NULL;

  if ( !(dp = opendir(CORPSE_DIR)) )
    {
      Bug( "%s: can't open CORPSE_DIR", __FUNCTION__ );
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
              char letter = ReadChar( fpArea );

              if ( letter == '*' )
                {
                  ReadToEndOfLine(fpArea);
                  continue;
                }

              if ( letter != '#' )
                {
                  Bug( "%s: # not found.", __FUNCTION__ );
                  break;
                }

              word = ReadWord( fpArea );

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
                  Bug( "%s: bad section.", __FUNCTION__ );
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
      Bug( "Load_storeroom: can't open STOREROOM_DIR" );
      perror(STOREROOM_DIR);
      return;
    }

  falling = 1;

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          int iNest = 0;
          Object *tobj = NULL;
	  Object *tobj_next = NULL;
          Room *storeroom = NULL;

          sprintf(strArea, "%s%s", STOREROOM_DIR, de->d_name );
          fprintf(stderr, "Storeroom -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          storeroom = GetRoom(atoi(de->d_name));

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

          for ( iNest = 0; iNest < MAX_NEST; iNest++ )
	    {
	      rgObjNest[iNest] = NULL;
	    }

          for ( ; ; )
            {
              const char *word = NULL;
              char letter = ReadChar( fpArea );

              if ( letter == '*' )
                {
                  ReadToEndOfLine( fpArea );
                  continue;
                }

              if ( letter != '#' )
                {
                  Bug( "LoadStorerooms: # not found.", 0 );
                  Bug( de->d_name, 0 );
                  break;
                }

              word = ReadWord( fpArea );

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
		  Bug( "LoadStorerooms: bad section.", 0 );
		  Bug( de->d_name, 0 );
		  break;
		}
            }

          fclose( fpArea );

          for ( tobj = supermob->FirstCarrying; tobj; tobj = tobj_next )
            {
              tobj_next = tobj->NextContent;
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
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp = NULL;
  const Object *contents = NULL;

  if ( !room )
    {
      Bug( "SaveStoreroom: null room!" );
      return;
    }

  sprintf( strsave, "%s%ld",STOREROOM_DIR, room->Vnum );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      Bug( "Save_storeroom: fopen", 0 );
      Bug( strsave, 0 );

    }
  else
    {
      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);

      contents = room->LastContent;

      if (contents)
	{
	  WriteObject(NULL, contents, fp, 0, OS_CARRY );
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
      Bug( "Load_vendors: can't open VENDOR_DIR" );
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
	      char letter = ReadChar( fpArea );

              if ( letter == '*' )
                {
                  ReadToEndOfLine(fpArea);
                  continue;
                }

              if ( letter != '#' )
                {
                  Bug( "Load_vendor: # not found.", 0 );
                  break;
                }

              word = ReadWord( fpArea );

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
      fprintf( fp, "Name     %s~\n", mob->Name );
    }

  if ( StrCmp( mob->ShortDescr, mob->Prototype->ShortDescr) )
    {
      fprintf( fp, "Short %s~\n", mob->ShortDescr );
    }

  if ( StrCmp( mob->LongDescr, mob->Prototype->LongDescr) )
    {
      fprintf( fp, "Long  %s~\n", mob->LongDescr );
    }

  if ( StrCmp( mob->Description, mob->Prototype->Description) )
    {
      fprintf( fp, "Description %s~\n", mob->Description );
    }

  fprintf( fp, "Position %d\n", mob->Position );
  fprintf( fp, "Flags %d\n", mob->Flags );
  /* Might need these later --Shaddai
     DeEquipCharacter( mob );
     ReEquipCharacter( mob );
  */
  if ( mob->FirstCarrying )
    {
      WriteObject( mob, mob->LastCarrying, fp, 0, OS_CARRY );
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
  const char *word = feof( fp ) ? "EndMobile" : ReadWord( fp );

  if ( !StrCmp(word, "Vnum") )
    {
      int vnum = ReadInt( fp );

      mob = CreateMobile( GetProtoMobile(vnum) );

      if ( !mob )
        {
          for ( ; ; )
	    {
	      word = feof( fp ) ? "EndMobile" : ReadWord( fp );
	      /* So we don't get so many bug messages when something messes up
	       * --Shaddai
	       */
	      if ( !StrCmp( word, "EndMobile" ) )
		break;
	    }

          Bug("ReadMobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; )
	{
	  word = feof( fp ) ? "EndMobile" : ReadWord( fp );
	  /* So we don't get so many bug messages when something messes up
	   * --Shaddai
	   */
	  if ( !StrCmp( word, "EndMobile" ) )
	    {
	      break;
	    }
	}

      ExtractCharacter(mob, true);
      Bug("ReadMobile: Vnum not found", 0 );
      return NULL;
    }

  for ( ; ;)
    {
      word = feof( fp ) ? "EndMobile" : ReadWord( fp );
      fMatch = false;

      switch ( CharToUppercase(word[0]) )
	{
	case '*':
	  fMatch = true;
	  ReadToEndOfLine( fp );
	  break;

	case '#':
	  if ( !StrCmp( word, "#OBJECT" ) )
	    ReadObject ( mob, fp, OS_CARRY );
	case 'D':
	  KEY( "Description", mob->Description, ReadStringToTilde(fp));
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
	  KEY( "Flags", mob->Flags, ReadInt( fp ));
	  break;

	case 'L':
	  KEY( "Long", mob->LongDescr, ReadStringToTilde(fp ) );
	  break;

	case 'N':
	  KEY( "Name", mob->Name, ReadStringToTilde( fp ) );
	  break;

	case 'P':
	  KEY( "Position", mob->Position, (PositionType)ReadInt( fp ) );
	  break;

	case 'R':
	  KEY( "Room",  inroom, ReadInt(fp));
	  break;

	case 'S':
	  KEY( "Short", mob->ShortDescr, ReadStringToTilde(fp));
	  break;
	}

      if ( !fMatch )
	{
	  Bug( "ReadMobile: no match.", 0 );
	  Bug( word, 0 );
	}
    }

  return NULL;
}
