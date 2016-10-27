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

#include <time.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>
#include "mud.h"
#include "skill.h"

SpellFun *GetSpellFunction( const char *name )
{
#ifdef _WIN32
  SpellFun *fun_handle = (SpellFun*) GetProcAddress( SysData.DlHandle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, GetLastError() );
      return spell_notfound;
    }
#else
  SpellFun *fun_handle = (SpellFun*)(long)dlsym( SysData.DlHandle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, dlerror() );
      return spell_notfound;
    }
#endif

  return fun_handle;
}

CmdFun *GetSkillFunction( const char *name )
{
#ifdef _WIN32
  CmdFun *fun_handle = (CmdFun*) GetProcAddress( SysData.DlHandle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, GetLastError() );
      return skill_notfound;
    }
#else
  CmdFun *fun_handle = (CmdFun*)(long)dlsym( SysData.DlHandle, name );

  if( !fun_handle )
    {
      Bug( "Could not find symbol '%s': %s", name, dlerror() );
      return skill_notfound;
    }
#endif

  return fun_handle;
}

/*
 * Write skill data to a file
 */
static void WriteSkill( FILE *fpout, const Skill *skill )
{
  const SmaugAffect *aff = NULL;

  fprintf( fpout, "Name         %s~\n", skill->Name     );
  fprintf( fpout, "Type         %s\n",  SkillTypeName[skill->Type]);
  fprintf( fpout, "Flags        %u\n",  skill->Flags    );

  if ( skill->Target )
    {
      fprintf( fpout, "Target       %d\n",        skill->Target   );
    }

  if ( skill->Position )
    {
      fprintf( fpout, "Minpos       %d\n",        skill->Position );
    }

  if ( skill->Saves )
    {
      fprintf( fpout, "Saves        %d\n",        skill->Saves    );
    }

  if ( skill->Slot )
    {
      fprintf( fpout, "Slot         %d\n",        skill->Slot     );
    }

  if ( skill->Mana )
    {
      fprintf( fpout, "Mana         %d\n",        skill->Mana );
    }

  if ( skill->Beats )
    {
      fprintf( fpout, "Rounds       %d\n",        skill->Beats    );
    }

  if ( skill->Guild != -1 )
    {
      fprintf( fpout, "Guild        %d\n",        skill->Guild    );
    }

  if ( skill->SkillFunction || skill->SpellFunction )
    {
      fprintf( fpout, "Code         %s\n",        skill->FunctionName );
    }

  fprintf( fpout, "Dammsg       %s~\n", skill->Messages.NounDamage );

  if ( !IsNullOrEmpty( skill->Messages.WearOff ) )
    {
      fprintf( fpout, "Wearoff      %s~\n",       skill->Messages.WearOff );
    }


  if ( !IsNullOrEmpty( skill->Messages.Success.ToCaster ) )
    {
      fprintf( fpout, "Hitchar      %s~\n",       skill->Messages.Success.ToCaster );
    }

  if ( !IsNullOrEmpty( skill->Messages.Success.ToVictim ))
    {
      fprintf( fpout, "Hitvict      %s~\n",       skill->Messages.Success.ToVictim );
    }

  if ( !IsNullOrEmpty( skill->Messages.Success.ToRoom ) )
    {
      fprintf( fpout, "Hitroom      %s~\n",       skill->Messages.Success.ToRoom );
    }

  if ( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ) )
    {
      fprintf( fpout, "Misschar     %s~\n",       skill->Messages.Failure.ToCaster );
    }

  if ( !IsNullOrEmpty( skill->Messages.Failure.ToVictim ))
    {
      fprintf( fpout, "Missvict     %s~\n",       skill->Messages.Failure.ToVictim );
    }

  if ( !IsNullOrEmpty( skill->Messages.Failure.ToRoom ) )
    {
      fprintf( fpout, "Missroom     %s~\n",       skill->Messages.Failure.ToRoom );
    }

  if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToCaster ) )
    {
      fprintf( fpout, "Diechar      %s~\n",       skill->Messages.VictimDeath.ToCaster );
    }

  if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToVictim ) )
    {
      fprintf( fpout, "Dievict      %s~\n",       skill->Messages.VictimDeath.ToVictim );
    }

  if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToRoom ) )
    {
      fprintf( fpout, "Dieroom      %s~\n",       skill->Messages.VictimDeath.ToRoom );
    }

  if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToCaster ) )
    {
      fprintf( fpout, "Immchar      %s~\n",       skill->Messages.VictimImmune.ToCaster );
    }

  if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToVictim ) )
    {
      fprintf( fpout, "Immvict      %s~\n",       skill->Messages.VictimImmune.ToVictim );
    }

  if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToRoom ) )
    {
      fprintf( fpout, "Immroom      %s~\n",       skill->Messages.VictimImmune.ToRoom );
    }

  if ( !IsNullOrEmpty( skill->Dice ) )
    {
      fprintf( fpout, "Dice         %s~\n",       skill->Dice );
    }

  if ( skill->Value )
    {
      fprintf( fpout, "Value        %d\n",        skill->Value );
    }

  if ( skill->Difficulty )
    {
      fprintf( fpout, "Difficulty   %d\n",        skill->Difficulty );
    }

  if ( skill->Participants )
    {
      fprintf( fpout, "Participants %d\n",        skill->Participants );
    }

  if ( !IsNullOrEmpty( skill->Teachers ) )
    {
      fprintf( fpout, "Teachers     %s~\n",       skill->Teachers );
    }

  for ( aff = skill->Affects; aff; aff = aff->Next )
    {
      fprintf( fpout, "Affect       '%s' %d '%s' %d\n",
	       aff->Duration, aff->Location, aff->Modifier, aff->AffectedBy );
    }

  if ( skill->Alignment )
    {
      fprintf( fpout, "Alignment   %d\n", skill->Alignment );
    }

  if ( skill->Type != SKILL_HERB )
    {
      fprintf( fpout, "Minlevel     %d\n",      skill->Level        );
    }

  fprintf( fpout, "End\n\n" );
}

/*
 * Save the skill table to disk
 */
void OldSaveSkillTable( void )
{
  int x = 0;
  FILE *fpout = NULL;

  if ( (fpout=fopen( OLD_SKILL_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open skills.dat for writting", 0 );
      perror( OLD_SKILL_FILE );
      return;
    }

  for ( x = 0; x < TopSN; x++ )
    {
      if ( IsNullOrEmpty( SkillTable[x]->Name ) )
	{
	  break;
	}

      fprintf( fpout, "#SKILL\n" );
      WriteSkill( fpout, SkillTable[x] );
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

void OldSaveHerbTable( void )
{
  int x = 0;
  FILE *fpout = NULL;

  if ( (fpout=fopen( OLD_HERB_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open herbs.dat for writting", 0 );
      perror( OLD_HERB_FILE );
      return;
    }

  for ( x = 0; x < TopHerb; x++ )
    {
      if ( IsNullOrEmpty( HerbTable[x]->Name ) )
	{
	  break;
	}

      fprintf( fpout, "#HERB\n" );
      WriteSkill( fpout, HerbTable[x] );
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

static Skill *ReadSkill( FILE *fp )
{
  Skill *skill = NULL;
  AllocateMemory( skill, Skill, 1 );
  AllocateMemory( skill->UseRec, struct timerset, 1 );

  skill->Guild = -1;

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
          KEY( "Alignment",     skill->Alignment,       ReadInt( fp ) );

          if ( !StrCmp( word, "Affect" ) )
            {
              SmaugAffect *aff = NULL;

              AllocateMemory( aff, SmaugAffect, 1 );
              aff->Duration   = CopyString( ReadWord( fp ) );
              aff->Location   = ReadInt( fp );
              aff->Modifier   = CopyString( ReadWord( fp ) );
              aff->AffectedBy = ReadInt( fp );
              aff->Next = skill->Affects;
              skill->Affects = aff;
              fMatch = true;
              break;
            }
          break;

        case 'C':
          if ( !StrCmp( word, "Code" ) )
            {
	      SpellFun *spellfun = NULL;
	      CmdFun *dofun = NULL;
	      const char *w = ReadWord( fp );

	      fMatch = true;

	      if( ( spellfun = GetSpellFunction( w ) ) != spell_notfound
		  && !StringPrefix( "spell_", w ) )
		{
		  skill->SpellFunction = spellfun;
		  skill->FunctionName = CopyString( w );
		}
	      else if( ( dofun = GetSkillFunction( w ) ) != skill_notfound
		       && !StringPrefix( "do_", w ) )
		{
		  skill->SkillFunction = dofun;
		  skill->FunctionName = CopyString( w );
		}
	      else
		{
		  Bug( "%s: unknown skill/spell %s", __FUNCTION__, w );
		  skill->FunctionName = CopyString( "" );
		}

	      break;
            }

          break;

        case 'D':
          KEY( "Dammsg",        skill->Messages.NounDamage,     ReadStringToTilde( fp ) );
          KEY( "Dice",  skill->Dice,            ReadStringToTilde( fp ) );
          KEY( "Diechar",       skill->Messages.VictimDeath.ToCaster,        ReadStringToTilde( fp ) );
          KEY( "Dieroom",       skill->Messages.VictimDeath.ToRoom,        ReadStringToTilde( fp ) );
          KEY( "Dievict",       skill->Messages.VictimDeath.ToVictim,        ReadStringToTilde( fp ) );
          KEY( "Difficulty",    skill->Difficulty,      ReadInt( fp ) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
	    {
	      return skill;
	    }

          break;

        case 'F':
          KEY( "Flags", skill->Flags,           ReadInt( fp ) );
          break;

        case 'G':
          KEY( "Guild", skill->Guild,           ReadInt( fp ) );
          break;

        case 'H':
          KEY( "Hitchar",       skill->Messages.Success.ToCaster,        ReadStringToTilde( fp ) );
          KEY( "Hitroom",       skill->Messages.Success.ToRoom,        ReadStringToTilde( fp ) );
          KEY( "Hitvict",       skill->Messages.Success.ToVictim,        ReadStringToTilde( fp ) );
          break;

        case 'I':
          KEY( "Immchar",       skill->Messages.VictimImmune.ToCaster,        ReadStringToTilde( fp ) );
          KEY( "Immroom",       skill->Messages.VictimImmune.ToRoom,        ReadStringToTilde( fp ) );
          KEY( "Immvict",       skill->Messages.VictimImmune.ToVictim,        ReadStringToTilde( fp ) );
          break;

        case 'M':
          KEY( "Mana",  skill->Mana,        ReadInt( fp ) );
          KEY( "Minlevel",      skill->Level,       ReadInt( fp ) );
          KEY( "Minpos",        skill->Position, (PositionType)ReadInt( fp ) );
          KEY( "Misschar",      skill->Messages.Failure.ToCaster,       ReadStringToTilde( fp ) );
          KEY( "Missroom",      skill->Messages.Failure.ToRoom,       ReadStringToTilde( fp ) );
          KEY( "Missvict",      skill->Messages.Failure.ToVictim,       ReadStringToTilde( fp ) );
          break;

        case 'N':
          KEY( "Name",  skill->Name,            ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "Participants", skill->Participants,      ReadInt( fp ) );
          break;

        case 'R':
          KEY( "Rounds",        skill->Beats,           ReadInt( fp ) );
          break;

        case 'S':
          KEY( "Slot",  skill->Slot,            ReadInt( fp ) );
          KEY( "Saves", skill->Saves,           ReadInt( fp ) );
          break;

        case 'T':
          KEY( "Target",        skill->Target,          (target_types)ReadInt( fp ) );
          KEY( "Teachers",      skill->Teachers,        ReadStringToTilde( fp ) );
          KEY( "Type",  skill->Type,  GetSkillType(ReadWord( fp ))  );
          break;

        case 'V':
          KEY( "Value", skill->Value,           ReadInt( fp ) );
          break;

        case 'W':
          KEY( "Wearoff",       skill->Messages.WearOff,         ReadStringToTilde( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

void OldLoadSkillTable( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( OLD_SKILL_FILE, "r" ) ) != NULL )
    {
      TopSN = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_SkillTable: # not found.", 0 );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SKILL" ) )
            {
              if ( TopSN >= MAX_SKILL )
                {
                  Bug( "LoadSkillTable: more skills than MAX_SKILL %d", MAX_SKILL );
                  fclose( fp );
                  return;
                }

              SkillTable[TopSN++] = ReadSkill( fp );
              continue;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      Bug( "Load_SkillTable: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open skills.dat", 0 );
      exit(0);
    }
}

void LoadHerbTable( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( OLD_HERB_FILE, "r" ) ) != NULL )
    {
      TopHerb = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_HerbTable: # not found.", 0 );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "HERB"      ) )
            {
              if ( TopHerb >= MAX_HERB )
                {
                  Bug( "LoadHerbTable: more herbs than MAX_HERB %d", MAX_HERB );
                  fclose( fp );
                  return;
                }

              HerbTable[TopHerb++] = ReadSkill( fp );

              if ( HerbTable[TopHerb-1]->Slot == 0 )
		{
		  HerbTable[TopHerb-1]->Slot = TopHerb-1;
		}

              continue;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
	      break;
	    }
	  else
	    {
	      Bug( "Load_HerbTable: bad section." );
	      continue;
	    }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open herbs.dat", 0 );
      exit(0);
    }
}
