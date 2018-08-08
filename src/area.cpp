#include <cstring>
#include <cctype>
#include "area.hpp"
#include "mud.hpp"
#include "shop.hpp"
#include "reset.hpp"
#include "skill.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];

Area *FirstArea = NULL;
Area *LastArea = NULL;
Area *FirstBuild = NULL;
Area *LastBuild = NULL;
Area *FirstASort = NULL;
Area *LastASort = NULL;
Area *FirstBSort = NULL;
Area *LastBSort = NULL;

static void LoadArea( FILE *fp );
static void LoadAuthor( Area *tarea, FILE *fp );
static void LoadEconomy( Area *tarea, FILE *fp );
static void LoadResetMessage( Area *tarea, FILE *fp ); /* Rennard */
static void LoadFlags( Area *tarea, FILE *fp );
static void LoadMobiles( Area *tarea, FILE *fp );
static void LoadObjects( Area *tarea, FILE *fp );
static void LoadResets( Area *tarea, FILE *fp );
static void LoadRooms( Area *tarea, FILE *fp );
static void LoadShops( Area *tarea, FILE *fp );
static void LoadRepairs( Area *tarea, FILE *fp );
static void LoadSpecials( Area *tarea, FILE *fp );
static void LoadRanges( Area *tarea, FILE *fp );
static int MudProgNameToType( const char* name );
static MPROG_DATA *MobProgReadFile( const char* f, MPROG_DATA* mprg, ProtoMobile *pMobIndex );
static MPROG_DATA *ObjProgReadFile( const char* f, MPROG_DATA* mprg, ProtoObject *pObjIndex );
static MPROG_DATA *RoomProgReadFile( const char* f, MPROG_DATA* mprg, Room *pRoomIndex );
static void LoadMudProgs( Area *tarea, FILE* fp );
static void LoadObjProgs( Area *tarea, FILE* fp );
static void MobProgReadPrograms( FILE* fp, ProtoMobile *pMobIndex );
static void ObjProgReadPrograms( FILE* fp, ProtoObject *pObjIndex );
static void RoomProgReadPrograms( FILE* fp, Room *pRoomIndex );

void LoadAreaFile( Area *tarea, const char *filename )
{
  char buf[MAX_STRING_LENGTH];

  if ( fBootDb )
    tarea = LastArea;

  if ( !fBootDb && !tarea )
    {
      Log->Bug( "%s: null area!", __FUNCTION__ );
      return;
    }

  sprintf( buf, "%s%s", AREA_DIR, filename );

  if ( ( fpArea = fopen( buf, "r" ) ) == NULL )
    {
      Log->Bug( "%s: error loading file (can't open)", __FUNCTION__ );
      Log->Bug( filename );
      return;
    }

  for ( ; ; )
    {
      const char *word;

      if ( ReadChar( fpArea, Log ) != '#' )
        {
          Log->Bug( tarea->Filename );
          Log->Bug( "%s: # not found.", __FUNCTION__ );
          exit( 1 );
        }

      word = ReadWord( fpArea, Log );

      if ( word[0] == '$'               )
        {
	   break;
        }
      else if ( !StrCmp( word, "AREA"     ) )
        {
          if ( fBootDb )
            {
              LoadArea(fpArea);
              tarea = LastArea;
            }
          else
            {
              FreeMemory( tarea->Name );
              tarea->Name = ReadStringToTilde( fpArea, Log );
            }
        }
      else if ( !StrCmp( word, "AUTHOR"   ) ) LoadAuthor  (tarea, fpArea);
      else if ( !StrCmp( word, "FLAGS"    ) ) LoadFlags   (tarea, fpArea);
      else if ( !StrCmp( word, "RANGES"   ) ) LoadRanges  (tarea, fpArea);
      else if ( !StrCmp( word, "ECONOMY"  ) ) LoadEconomy (tarea, fpArea);
      else if ( !StrCmp( word, "RESETMSG" ) ) LoadResetMessage(tarea, fpArea);
      /* Rennard */
      else if ( !StrCmp( word, "MOBILES"  ) ) LoadMobiles (tarea, fpArea);
      else if ( !StrCmp( word, "MUDPROGS" ) ) LoadMudProgs(tarea, fpArea);
      else if ( !StrCmp( word, "OBJECTS"  ) ) LoadObjects (tarea, fpArea);
      else if ( !StrCmp( word, "OBJPROGS" ) ) LoadObjProgs(tarea, fpArea);
      else if ( !StrCmp( word, "RESETS"   ) ) LoadResets  (tarea, fpArea);
      else if ( !StrCmp( word, "ROOMS"    ) ) LoadRooms   (tarea, fpArea);
      else if ( !StrCmp( word, "SHOPS"    ) ) LoadShops   (tarea, fpArea);
      else if ( !StrCmp( word, "REPAIRS"  ) ) LoadRepairs (tarea, fpArea);
      else if ( !StrCmp( word, "SPECIALS" ) ) LoadSpecials(tarea, fpArea);
      else
        {
          Log->Bug( tarea->Filename );
          Log->Bug( "%s: bad section name.", __FUNCTION__ );

	  if ( fBootDb )
            {
              exit( 1 );
            }
          else
            {
              fclose( fpArea );
              fpArea = NULL;
              return;
            }
        }
    }

  fclose( fpArea );
  fpArea = NULL;

  if ( tarea )
    {
      if ( fBootDb )
        SortArea( tarea, false );

      fprintf( stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld Mobs: %5ld - %ld\n",
               tarea->Filename,
               tarea->VnumRanges.Room.First, tarea->VnumRanges.Room.Last,
               tarea->VnumRanges.Object.First, tarea->VnumRanges.Object.Last,
               tarea->VnumRanges.Mob.First, tarea->VnumRanges.Mob.Last );
      if ( !tarea->Author )
        tarea->Author = CopyString( "" );
      SetBit( tarea->Status, AREA_LOADED );
    }
  else
    fprintf( stderr, "(%s)\n", filename );
}

void FixAreaExits( Area *tarea )
{
  Room *pRoomIndex;
  Exit *pexit, *rev_exit;
  int rnum;

  for ( rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; rnum++ )
    {
      bool fexit = false;

      if ( (pRoomIndex = GetRoom( rnum )) == NULL )
        continue;

      for ( pexit = pRoomIndex->FirstExit; pexit; pexit = pexit->Next )
        {
          fexit = true;
          pexit->ReverseVnum = pRoomIndex->Vnum;

          if ( pexit->Vnum <= 0 )
	    pexit->ToRoom = NULL;
          else
            pexit->ToRoom = GetRoom( pexit->Vnum );
        }

      if ( !fexit )
        SetBit( pRoomIndex->Flags, ROOM_NO_MOB );
    }


  for ( rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; rnum++ )
    {
      if ( (pRoomIndex = GetRoom( rnum )) == NULL )
        continue;

      for ( pexit = pRoomIndex->FirstExit; pexit; pexit = pexit->Next )
        {
          if ( pexit->ToRoom && !pexit->ReverseExit )
            {
              rev_exit = GetExitTo( pexit->ToRoom, GetReverseDirection(pexit->Direction), pRoomIndex->Vnum );
              if ( rev_exit )
                {
                  pexit->ReverseExit  = rev_exit;
                  rev_exit->ReverseExit       = pexit;
                }
            }
        }
    }
}

void SortArea( Area *pArea, bool proto )
{
  Area *area = NULL;
  Area *first_sort, *last_sort;
  bool found = false;

  if ( !pArea )
    {
      Log->Bug( "%s: NULL pArea", __FUNCTION__ );
      return;
    }

  if ( proto )
    {
      first_sort = FirstBSort;
      last_sort  = LastBSort;
    }
  else
    {
      first_sort = FirstASort;
      last_sort  = LastASort;
    }

  pArea->NextSort = NULL;
  pArea->PreviousSort = NULL;

  if ( !first_sort )
    {
      pArea->PreviousSort = NULL;
      pArea->NextSort = NULL;
      first_sort = pArea;
      last_sort = pArea;
      found = true;
    }
  else
    {
      for ( area = first_sort; area; area = area->NextSort )
        {
          if ( pArea->VnumRanges.Room.First < area->VnumRanges.Room.First )
            {
              if ( !area->PreviousSort )
                {
                  first_sort  = pArea;
                }
              else
                {
                  area->PreviousSort->NextSort = pArea;
                }
              
              pArea->PreviousSort = area->PreviousSort;
              pArea->NextSort = area;
              area->PreviousSort  = pArea;
              found = true;
              break;
            }
        }
    }
  
  if ( !found )
    {
      pArea->PreviousSort     = last_sort;
      pArea->NextSort     = NULL;
      last_sort->NextSort = pArea;
      last_sort      = pArea;
    }

  if ( proto )
    {
      FirstBSort = first_sort;
      LastBSort  = last_sort;
      }
  else
    {
      FirstASort = first_sort;
      LastASort  = last_sort;
    }
}

static void LoadArea( FILE *fp )
{
  Area *pArea;

  AllocateMemory( pArea, Area, 1 );
  pArea->Name           = ReadStringToTilde( fp, Log );
  pArea->Author       = CopyString( "unknown" );
  pArea->Filename       = CopyString( strArea );
  pArea->Age            = 15;
  pArea->LevelRanges.Soft.High  = MAX_LEVEL;
  pArea->LevelRanges.Hard.High  = MAX_LEVEL;

  LINK( pArea, FirstArea, LastArea, Next, Previous );
  top_area++;
}

static void LoadAuthor( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        {
          return;
        }
    }

  if ( tarea->Author )
    FreeMemory( tarea->Author );

  tarea->Author = ReadStringToTilde( fp, Log );
}

static void LoadEconomy( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        {
          return;
        }
    }

  tarea->HighEconomy   = ReadInt( fp, Log );
  tarea->LowEconomy    = ReadInt( fp, Log );
}

static void LoadResetMessage( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        {
          return;
        }
    }

  if ( tarea->ResetMessage )
    FreeMemory( tarea->ResetMessage );

  tarea->ResetMessage = ReadStringToTilde( fp, Log );
}

static void LoadFlags( Area *tarea, FILE *fp )
{
  const char *ln = NULL;
  int x1 = 0, x2 = 0;

  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        {
          return;
        }
    }

  ln = ReadLine( fp, Log );
  sscanf( ln, "%d %d", &x1, &x2 );
  tarea->Flags = x1;
  tarea->ResetFrequency = x2;

  if ( x2 )
    tarea->Age = x2;
}

static void LoadMobiles( Area *tarea, FILE *fp )
{
  ProtoMobile *pMobIndex = 0;
  const char *ln = NULL;
  int x1, x2, x3, x4, x5, x6, x7, x8;

  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        {
          return;
        }
    }

  for ( ; ; )
    {
      char buf[MAX_STRING_LENGTH];
      vnum_t vnum = INVALID_VNUM;
      int iHash = 0;
      bool oldmob = false;
      bool tmpBootDb = false;
      char letter = ReadChar( fp, Log );

      if ( letter != '#' )
        {
          Log->Bug( "%s: # not found.", __FUNCTION__ );

          if ( fBootDb )
            {
              ShutdownMud( "# not found" );
              exit( 1 );
            }
          else
            {
              return;
            }
        }

      vnum = ReadInt( fp, Log );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetProtoMobile( vnum ) )
        {
          if ( tmpBootDb )
            {
              Log->Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              pMobIndex = GetProtoMobile( vnum );
              sprintf( buf, "Cleaning mobile: %ld", vnum );
	      Log->LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
              CleanMobile( pMobIndex );
              oldmob = true;
            }
        }
      else
        {
          oldmob = false;
          AllocateMemory( pMobIndex, ProtoMobile, 1 );
        }

      fBootDb = tmpBootDb;
      pMobIndex->Vnum = vnum;

      if ( fBootDb )
        {
          if ( !tarea->VnumRanges.Mob.First )
            tarea->VnumRanges.Mob.First   = vnum;

          if ( vnum > tarea->VnumRanges.Mob.Last )
            tarea->VnumRanges.Mob.Last    = vnum;
        }

      pMobIndex->Name     = ReadStringToTilde( fp, Log );
      pMobIndex->ShortDescr     = ReadStringToTilde( fp, Log );
      pMobIndex->LongDescr      = ReadStringToTilde( fp, Log );
      pMobIndex->Description     = ReadStringToTilde( fp, Log );

      pMobIndex->LongDescr[0]   = CharToUppercase(pMobIndex->LongDescr[0]);
      pMobIndex->Description[0]  = CharToUppercase(pMobIndex->Description[0]);

      pMobIndex->Flags           = ReadInt( fp, Log ) | ACT_NPC;
      pMobIndex->AffectedBy     = ReadInt( fp, Log );
      pMobIndex->Shop           = NULL;
      pMobIndex->RepairShop           = NULL;
      pMobIndex->Alignment       = ReadInt( fp, Log );
      letter                     = ReadChar( fp, Log );
      pMobIndex->Level           = ReadInt( fp, Log );

      pMobIndex->MobThac0        = ReadInt( fp, Log );
      pMobIndex->ArmorClass      = ReadInt( fp, Log );
      pMobIndex->HitNoDice       = ReadInt( fp, Log );
      /* 'd'            */         ReadChar( fp, Log );
      pMobIndex->HitSizeDice     = ReadInt( fp, Log );
      /* '+'            */         ReadChar( fp, Log );
      pMobIndex->HitPlus         = ReadInt( fp, Log );
      pMobIndex->DamNoDice       = ReadInt( fp, Log );
      /* 'd'            */         ReadChar( fp, Log );
      pMobIndex->DamSizeDice     = ReadInt( fp, Log );
      /* '+'            */         ReadChar( fp, Log );
      pMobIndex->DamPlus         = ReadInt( fp, Log );
      pMobIndex->Gold            = ReadInt( fp, Log );
      pMobIndex->exp             = ReadInt( fp, Log );
      pMobIndex->Position        = (PositionType)ReadInt( fp, Log );
      pMobIndex->DefaultPosition = (PositionType)ReadInt( fp, Log );

      /*
       * Back to meaningful values.
       */
      pMobIndex->Sex             = (SexType) ReadInt( fp, Log );

      if ( letter != 'S' && letter != 'C' && letter != 'Z' )
        {
          Log->Bug( "%s: vnum %d: letter '%c' not Z, S or C.", __FUNCTION__, vnum,
               letter );
          ShutdownMud( "bad mob data" );
          exit( 1 );
        }

      if ( letter == 'C' || letter == 'Z' )
	{
          pMobIndex->Stats.PermStr       = ReadInt( fp, Log );
          pMobIndex->Stats.PermInt       = ReadInt( fp, Log );
          pMobIndex->Stats.PermWis       = ReadInt( fp, Log );
          pMobIndex->Stats.PermDex       = ReadInt( fp, Log );
          pMobIndex->Stats.PermCon       = ReadInt( fp, Log );
          pMobIndex->Stats.PermCha       = ReadInt( fp, Log );
          pMobIndex->Stats.PermLck       = ReadInt( fp, Log );
          pMobIndex->Saving.PoisonDeath  = ReadInt( fp, Log );
          pMobIndex->Saving.Wand         = ReadInt( fp, Log );
          pMobIndex->Saving.ParaPetri    = ReadInt( fp, Log );
          pMobIndex->Saving.Breath       = ReadInt( fp, Log );
          pMobIndex->Saving.SpellStaff   = ReadInt( fp, Log );

          ln = ReadLine( fp, Log );
          x1=x2=x3=x4=x5=x6=x7=0;
          sscanf( ln, "%d %d %d %d %d %d %d",
                  &x1, &x2, &x3, &x4, &x5, &x6, &x7 );

          pMobIndex->Race               = x1;
          pMobIndex->Height             = x3;
          pMobIndex->Weight             = x4;
          pMobIndex->Speaks             = x5;
          pMobIndex->Speaking           = x6;
          pMobIndex->NumberOfAttacks         = x7;

          if ( !pMobIndex->Speaks )
            pMobIndex->Speaks = RaceTable[pMobIndex->Race].Language | LANG_COMMON;

          if ( !pMobIndex->Speaking )
            pMobIndex->Speaking = RaceTable[pMobIndex->Race].Language;

          ln = ReadLine( fp, Log );
          x1=x2=x3=x4=x5=x6=x7=x8=0;
          sscanf( ln, "%d %d %d %d %d %d %d %d",
		  &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8 );

          pMobIndex->HitRoll            = x1;
          pMobIndex->DamRoll            = x2;
          pMobIndex->BodyParts             = x3;
          pMobIndex->Resistant          = x4;
          pMobIndex->Immune             = x5;
          pMobIndex->Susceptible        = x6;
          pMobIndex->AttackFlags            = x7;
          pMobIndex->DefenseFlags           = x8;
        }
      else
        {
          pMobIndex->Stats.PermStr  = 10;
          pMobIndex->Stats.PermDex  = 10;
          pMobIndex->Stats.PermInt  = 10;
          pMobIndex->Stats.PermWis  = 10;
          pMobIndex->Stats.PermCha  = 10;
          pMobIndex->Stats.PermCon  = 10;
          pMobIndex->Stats.PermLck  = 10;
          pMobIndex->Race            = 0;
          pMobIndex->BodyParts          = 0;
          pMobIndex->Resistant       = 0;
          pMobIndex->Immune          = 0;
          pMobIndex->Susceptible     = 0;
          pMobIndex->NumberOfAttacks      = 0;
          pMobIndex->AttackFlags         = 0;
          pMobIndex->DefenseFlags        = 0;
        }

      if ( letter == 'Z' ) /*  STar Wars Reality Complex Mob  */
        {
          ln = ReadLine( fp, Log );
          x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = 0;
          sscanf( ln, "%d %d %d %d %d %d %d %d",
		  &x1, &x2, &x3, &x4, &x5,  &x6,  &x7,  &x8);
          pMobIndex->VipFlags = x1;
        }

      letter = ReadChar( fp, Log );

      if ( letter == '>' )
        {
          ungetc( letter, fp );
          MobProgReadPrograms( fp, pMobIndex );
        }
      else
        {
          ungetc( letter,fp );
        }

      if ( !oldmob )
        {
          iHash                 = vnum % MAX_KEY_HASH;
          pMobIndex->Next       = MobIndexHash[iHash];
          MobIndexHash[iHash] = pMobIndex;
          top_mob_index++;
        }
    }
}

static void LoadObjects( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        {
          return;
        }
    }

  for ( ; ; )
    {
      ProtoObject *pObjIndex;
      const char *ln;
      int x1, x2, x3, x4, x5, x6;
      char buf[MAX_STRING_LENGTH];
      vnum_t vnum = INVALID_VNUM;
      int iHash = 0;
      bool tmpBootDb = false;
      bool oldobj = false;
      char letter = ReadChar( fp, Log );

      if ( letter != '#' )
	{
          Log->Bug( "%s: # not found.", __FUNCTION__ );

          if ( fBootDb )
            {
              ShutdownMud( "# not found" );
              exit( 1 );
            }
          else
            {
              return;
            }
        }

      vnum = ReadInt( fp, Log );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetProtoObject( vnum ) )
        {
          if ( tmpBootDb )
            {
              Log->Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              pObjIndex = GetProtoObject( vnum );
              sprintf( buf, "Cleaning object: %ld", vnum );
              Log->LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
	       CleanObject( pObjIndex );
              oldobj = true;
            }
        }
      else
        {
          oldobj = false;
          AllocateMemory( pObjIndex, ProtoObject, 1 );
        }

      fBootDb = tmpBootDb;

      pObjIndex->Vnum = vnum;

      if ( fBootDb )
        {
          if ( !tarea->VnumRanges.Object.First )
            tarea->VnumRanges.Object.First = vnum;

          if ( vnum > tarea->VnumRanges.Object.Last )
            tarea->VnumRanges.Object.Last = vnum;
        }

      pObjIndex->Name         = ReadStringToTilde( fp, Log );
      pObjIndex->ShortDescr  = ReadStringToTilde( fp, Log );
      pObjIndex->Description  = ReadStringToTilde( fp, Log );
      pObjIndex->ActionDescription  = ReadStringToTilde( fp, Log );

      /* Commented out by Narn, Apr/96 to allow item short descs like
         Bonecrusher and Oblivion */
      pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);

      ln = ReadLine( fp, Log );
      x1=x2=x3=x4=0;
      sscanf( ln, "%d %d %d %d",
	       &x1, &x2, &x3, &x4 );
      pObjIndex->ItemType              = (ItemTypes) x1;
      pObjIndex->Flags            = x2;
      pObjIndex->WearFlags             = x3;
      pObjIndex->Layers         = x4;

      ln = ReadLine( fp, Log );
      x1=x2=x3=x4=x5=x6=0;
      sscanf( ln, "%d %d %d %d %d %d",
              &x1, &x2, &x3, &x4, &x5, &x6 );
      pObjIndex->Value[0]               = x1;
      pObjIndex->Value[1]               = x2;
      pObjIndex->Value[2]               = x3;
      pObjIndex->Value[3]               = x4;
      pObjIndex->Value[4]               = x5;
      pObjIndex->Value[5]               = x6;
      pObjIndex->Weight         = ReadInt( fp, Log );
      pObjIndex->Weight = umax( 1, pObjIndex->Weight );
      pObjIndex->Cost                   = ReadInt( fp, Log );
      pObjIndex->Rent                   = ReadInt( fp, Log ); /* unused */

      for ( ; ; )
        {
          letter = ReadChar( fp, Log );

          if ( letter == 'A' )
            {
              Affect *paf;

              AllocateMemory( paf, Affect, 1 );
              paf->Type         = -1;
              paf->Duration             = -1;
              paf->Location             = ReadInt( fp, Log );
              if ( paf->Location == APPLY_WEAPONSPELL
                   ||   paf->Location == APPLY_WEARSPELL
		   ||   paf->Location == APPLY_REMOVESPELL
                   ||   paf->Location == APPLY_STRIPSN )
                paf->Modifier           = SkillNumberFromSlot( ReadInt(fp, Log) );
              else
                paf->Modifier           = ReadInt( fp, Log );
              paf->AffectedBy           = 0;
              LINK( paf, pObjIndex->FirstAffect, pObjIndex->LastAffect,
                    Next, Previous );
              top_affect++;
            }

          else if ( letter == 'E' )
            {
              ExtraDescription *ed;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->Keyword               = ReadStringToTilde( fp, Log );
              ed->Description           = ReadStringToTilde( fp, Log );
              LINK( ed, pObjIndex->FirstExtraDescription, pObjIndex->LastExtraDescription,
                    Next, Previous );
              top_ed++;
            }
          else if ( letter == '>' )
            {
              ungetc( letter, fp );
              ObjProgReadPrograms( fp, pObjIndex );
            }

          else
            {
              ungetc( letter, fp );
              break;
            }
        }

      /*
       * Translate spell "slot numbers" to internal "skill numbers."
       */
      switch ( pObjIndex->ItemType )
        {
        case ITEM_PILL:
        case ITEM_POTION:
          pObjIndex->Value[OVAL_PILL_SPELL1] = SkillNumberFromSlot( pObjIndex->Value[OVAL_PILL_SPELL1] );
          pObjIndex->Value[OVAL_PILL_SPELL2] = SkillNumberFromSlot( pObjIndex->Value[OVAL_PILL_SPELL2] );
          pObjIndex->Value[OVAL_PILL_SPELL3] = SkillNumberFromSlot( pObjIndex->Value[OVAL_PILL_SPELL3] );
          break;

        case ITEM_DEVICE:
          pObjIndex->Value[OVAL_DEVICE_SPELL] = SkillNumberFromSlot( pObjIndex->Value[OVAL_DEVICE_SPELL] );
          break;

        case ITEM_SALVE:
          pObjIndex->Value[OVAL_SALVE_SPELL1] = SkillNumberFromSlot( pObjIndex->Value[OVAL_SALVE_SPELL1] );
          pObjIndex->Value[OVAL_SALVE_SPELL2] = SkillNumberFromSlot( pObjIndex->Value[OVAL_SALVE_SPELL2] );
          break;

        default:
          break;
        }

      if ( !oldobj )
        {
          iHash                 = vnum % MAX_KEY_HASH;
          pObjIndex->Next       = ObjectIndexHash[iHash];
	  ObjectIndexHash[iHash] = pObjIndex;
          top_obj_index++;
        }
    }
}

static void LoadResets( Area *tarea, FILE *fp )
{
  /*bool not01 = false;*/
  int count = 0;

  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

      if ( fBootDb )
        {
          ShutdownMud( "No #AREA" );
          exit( 1 );
        }
      else
        return;
    }

  if ( tarea->FirstReset )
    {
      if ( fBootDb )
        {
          Reset *rtmp;

          Log->Bug( "%s: WARNING: resets already exist for this area.", __FUNCTION__ );

          for ( rtmp = tarea->FirstReset; rtmp; rtmp = rtmp->Next )
            ++count;
        }
      else
	{
          /*
           * Clean out the old resets
           */
          char buf[MAX_STRING_LENGTH];
          sprintf( buf, "Cleaning resets: %s", tarea->Name );
          Log->LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
          CleanResets( tarea );
        }
    }

  for ( ; ; )
    {
      char letter;
      int extra, arg1, arg2, arg3;

      if ( ( letter = ReadChar( fp, Log ) ) == 'S' )
        break;

      if ( letter == '*' )
        {
          ReadToEndOfLine( fp, Log );
          continue;
        }

      extra     = ReadInt( fp, Log );
      arg1      = ReadInt( fp, Log );
      arg2      = ReadInt( fp, Log );
      arg3      = (letter == 'G' || letter == 'R') ? 0 : ReadInt( fp, Log );
      ReadToEndOfLine( fp, Log );

      ++count;

      /* finally, add the reset */
      AddReset( tarea, letter, extra, arg1, arg2, arg3 );
       }

  RenumberPutResets(tarea);
}

static void LoadRooms( Area *tarea, FILE *fp )
{
  Room *pRoomIndex;
  const char *ln;

  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );
      ShutdownMud( "No #AREA" );
      exit( 1 );
    }

  for ( ; ; )
    {
      vnum_t vnum = INVALID_VNUM;
      DirectionType door = DIR_NORTH;
      int iHash = 0;
      bool tmpBootDb = false;
      bool oldroom = false;
      int x1, x2, x3, x4, x5, x6;
      char letter = ReadChar( fp, Log );

      if ( letter != '#' )
        {
          Log->Bug( "%s: # not found.", __FUNCTION__ );

          if ( fBootDb )
            {
              ShutdownMud( "# not found" );
              exit( 1 );
	      }
          else
            {
              return;
            }
        }

      vnum = ReadInt( fp, Log );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetRoom( vnum ) != NULL )
        {
          if ( tmpBootDb )
            {
              Log->Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              char buf[MAX_STRING_LENGTH];
              pRoomIndex = GetRoom( vnum );
              sprintf( buf, "Cleaning room: %ld", vnum );
              Log->LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
              CleanRoom( pRoomIndex );
              oldroom = true;
            }
        }
      else
        {
	  oldroom = false;
          AllocateMemory( pRoomIndex, Room, 1 );
        }

      fBootDb = tmpBootDb;
      pRoomIndex->Area          = tarea;
      pRoomIndex->Vnum          = vnum;

      if ( fBootDb )
        {
          if ( !tarea->VnumRanges.Room.First )
            tarea->VnumRanges.Room.First = vnum;

          if ( vnum > tarea->VnumRanges.Room.Last )
            tarea->VnumRanges.Room.Last = vnum;
        }

      pRoomIndex->Name         = ReadStringToTilde( fp, Log );
      pRoomIndex->Description  = ReadStringToTilde( fp, Log );

      /* Area number                      ReadInt( fp, Log ); */
      ln = ReadLine( fp, Log );
      x1=x2=x3=x4=x5=x6=0;
      sscanf( ln, "%d %d %d %d %d %d",
              &x1, &x2, &x3, &x4, &x5, &x6 );

      pRoomIndex->Flags            = x2;
      pRoomIndex->Sector           = (SectorType) x3;
      pRoomIndex->TeleDelay            = x4;
      pRoomIndex->TeleVnum             = x5;
      pRoomIndex->Tunnel                = x6;

      if (pRoomIndex->Sector <= SECT_INVALID || pRoomIndex->Sector >= SECT_MAX)
        {
          Log->Bug( "%s: vnum %ld has bad sector_type %d.", __FUNCTION__, vnum,
	        pRoomIndex->Sector);
          pRoomIndex->Sector = SECT_CITY;
        }

      for ( ; ; )
        {
          letter = ReadChar( fp, Log );

          if ( letter == 'S' )
            break;

          if ( letter == 'D' )
            {
              Exit *pexit;
              int locks;

              door = (DirectionType) ReadInt( fp, Log );

              if ( door < DIR_NORTH || door > DIR_SOMEWHERE )
                {
                  Log->Bug( "%s: vnum %d has bad door number %d.", __FUNCTION__, vnum,
                       door );

                  if ( fBootDb )
                    exit( 1 );
                }
              else
                {
                  pexit = MakeExit( pRoomIndex, NULL, door );
                  pexit->Description    = ReadStringToTilde( fp, Log );
                  pexit->Keyword        = ReadStringToTilde( fp, Log );
                  pexit->Flags      = 0;
                  ln = ReadLine( fp, Log );
                  x1=x2=x3=x4=0;
                  sscanf( ln, "%d %d %d %d",
			  &x1, &x2, &x3, &x4 );

                  locks                 = x1;
                  pexit->Key            = x2;
                  pexit->Vnum           = x3;
                  pexit->Direction           = door;
                  pexit->Distance       = x4;

                  switch ( locks )
                    {
                    case 1:
                      pexit->Flags = EX_ISDOOR;
                      break;

                    case 2:
                      pexit->Flags = EX_ISDOOR | EX_PICKPROOF;
                      break;

                    default:
                      pexit->Flags = locks;
                      break;
                    }
                }
            }
          else if ( letter == 'E' )
            {
              ExtraDescription *ed;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->Keyword               = ReadStringToTilde( fp, Log );
              ed->Description           = ReadStringToTilde( fp, Log );
              LINK( ed, pRoomIndex->FirstExtraDescription, pRoomIndex->LastExtraDescription,
                    Next, Previous );
              top_ed++;
            }
	   else if ( letter == '>' )
            {
              ungetc( letter, fp );
              RoomProgReadPrograms( fp, pRoomIndex );
            }
          else
            {
              Log->Bug( "%s: vnum %d has flag '%c' not 'DES'.", __FUNCTION__, vnum,
                   letter );
              ShutdownMud( "Room flag not DES" );
              exit( 1 );
            }
        }

      if ( !oldroom )
        {
          iHash                  = vnum % MAX_KEY_HASH;
          pRoomIndex->Next       = RoomIndexHash[iHash];
          RoomIndexHash[iHash] = pRoomIndex;
          top_room++;
        }
    }
}

static void LoadShops( Area *tarea, FILE *fp )
{
  for ( ; ; )
    {
      ProtoMobile *pMobIndex = NULL;
      int iTrade = 0;
      Shop *pShop = NULL;

      AllocateMemory( pShop, Shop, 1 );
      pShop->Keeper             = ReadInt( fp, Log );

      if ( pShop->Keeper == INVALID_VNUM )
        break;

      for ( iTrade = 0; iTrade < MAX_TRADE; iTrade++ )
        pShop->BuyType[iTrade] = (ItemTypes)ReadInt( fp, Log );

      pShop->ProfitBuy = ReadInt( fp, Log );
      pShop->ProfitSell        = ReadInt( fp, Log );
       pShop->ProfitBuy = urange( pShop->ProfitSell + 5, pShop->ProfitBuy, 1000 );
      pShop->ProfitSell        = urange( 0, pShop->ProfitSell, pShop->ProfitBuy - 5 );
      pShop->BusinessHours.Open  = ReadInt( fp, Log );
      pShop->BusinessHours.Close = ReadInt( fp, Log );
      ReadToEndOfLine( fp, Log );
      pMobIndex         = GetProtoMobile( pShop->Keeper );
      pMobIndex->Shop  = pShop;

      if ( !FirstShop )
        FirstShop              = pShop;
      else
        LastShop->Next = pShop;

      pShop->Next               = NULL;
      pShop->Previous               = LastShop;
      LastShop         = pShop;
      top_shop++;
    }
}

/*
 * Load a repair shop section.                                  -Thoric
 */
static void LoadRepairs( Area *tarea, FILE *fp )
{
  for ( ; ; )
    {
      ProtoMobile *pMobIndex;
      int iFix;
      RepairShop *rShop = NULL;

      AllocateMemory( rShop, RepairShop, 1 );
      rShop->Keeper             = ReadInt( fp, Log );

      if ( rShop->Keeper == INVALID_VNUM )
	 break;

      for ( iFix = 0; iFix < MAX_FIX; iFix++ )
        rShop->FixType[iFix] = (ItemTypes)ReadInt( fp, Log );

      rShop->ProfitFix = ReadInt( fp, Log );
      rShop->ShopType  = ReadInt( fp, Log );
      rShop->BusinessHours.Open  = ReadInt( fp, Log );
      rShop->BusinessHours.Close = ReadInt( fp, Log );
      ReadToEndOfLine( fp, Log );
      pMobIndex         = GetProtoMobile( rShop->Keeper );
      pMobIndex->RepairShop  = rShop;

      if ( !FirstRepairShop )
        FirstRepairShop            = rShop;
      else
        LastRepairShop->Next       = rShop;

      rShop->Next               = NULL;
      rShop->Previous           = LastRepairShop;
      LastRepairShop               = rShop;
      top_repair++;
    }
}

/*
 * Load spec proc declarations.
 */
static void LoadSpecials( Area *tarea, FILE *fp )
{
  for ( ; ; )
    {
      ProtoMobile *pMobIndex;
      char letter;

      switch ( letter = ReadChar( fp, Log ) )
        {
        default:
          Log->Bug( "%s: letter '%c' not *MS.", __FUNCTION__, letter );
          exit( 1 );

        case 'S':
          return;

        case '*':
          break;

        case 'M':
          pMobIndex = GetProtoMobile( ReadInt( fp, Log ) );

          if ( !pMobIndex->spec_fun )
            {
              pMobIndex->spec_fun = SpecialLookup( ReadWord( fp, Log ) );

              if ( pMobIndex->spec_fun == 0 )
                {
                  Log->Bug( "%s: 'M': vnum %d.", __FUNCTION__, pMobIndex->Vnum );
                  exit( 1 );
                }
            }
          else if ( !pMobIndex->spec_2 )
            {
              pMobIndex->spec_2 = SpecialLookup( ReadWord( fp, Log ) );

              if ( pMobIndex->spec_2 == 0 )
                {
                  Log->Bug( "%s: 'M': vnum %ld.", __FUNCTION__, pMobIndex->Vnum );
                  exit( 1 );
                }
            }

	   break;
        }

      ReadToEndOfLine( fp, Log );
    }
}

/*
 * Load soft / hard area ranges.
 */
static void LoadRanges( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Log->Bug( "%s: no #AREA seen yet.", __FUNCTION__ );
      ShutdownMud( "No #AREA" );
      exit( 1 );
    }

  for ( ; ; )
    {
      int x1, x2, x3, x4;
      const char *ln = ReadLine( fp, Log );

      if (ln[0] == '$')
        break;

      x1=x2=x3=x4=0;
      sscanf( ln, "%d %d %d %d",
              &x1, &x2, &x3, &x4 );

      tarea->LevelRanges.Soft.Low = x1;
      tarea->LevelRanges.Soft.High = x2;
      tarea->LevelRanges.Hard.Low = x3;
      tarea->LevelRanges.Hard.High = x4;
    }
}

static void LoadMudProgs( Area *tarea, FILE *fp )
{
  ProtoMobile *iMob;
  MPROG_DATA     *original;
  MPROG_DATA     *working;
  char            letter;
  int             value;

  for ( ; ; )
    switch ( letter = ReadChar( fp, Log ) )
      {
      default:
        Log->Bug( "%s: bad command '%c'.", __FUNCTION__, letter);
        exit(1);
        break;
      case 'S':
      case 's':
        ReadToEndOfLine( fp, Log );
        return;
      case '*':
        ReadToEndOfLine( fp, Log );
	 break;
      case 'M':
      case 'm':
        value = ReadInt( fp, Log );
        if ( ( iMob = GetProtoMobile( value ) ) == NULL )
          {
            Log->Bug( "%s: vnum %d doesnt exist", __FUNCTION__, value );
            exit( 1 );
          }

        /* Go to the end of the prog command list if other commands
           exist */

        if ( (original = iMob->mprog.mudprogs) != NULL )
          for ( ; original->Next; original = original->Next );

        AllocateMemory( working, MPROG_DATA, 1 );
        if ( original )
          original->Next = working;
        else
          iMob->mprog.mudprogs = working;
        working = MobProgReadFile( ReadWord( fp, Log ), working, iMob );
        working->Next = NULL;
        ReadToEndOfLine( fp, Log );
        break;
      }

  return;
}

/* mud prog functions */

/* This routine reads in scripts of MUDprograms from a file */

static int MudProgNameToType( const char *name )
{
  if ( !StrCmp( name, "in_file_prog"   ) )     return IN_FILE_PROG;
  if ( !StrCmp( name, "act_prog"       ) )    return ACT_PROG;
  if ( !StrCmp( name, "speech_prog"    ) )     return SPEECH_PROG;
  if ( !StrCmp( name, "rand_prog"      ) )     return RAND_PROG;
  if ( !StrCmp( name, "fight_prog"     ) )     return FIGHT_PROG;
  if ( !StrCmp( name, "hitprcnt_prog"  ) )     return HITPRCNT_PROG;
  if ( !StrCmp( name, "death_prog"     ) )     return DEATH_PROG;
  if ( !StrCmp( name, "entry_prog"     ) )     return ENTRY_PROG;
  if ( !StrCmp( name, "greet_prog"     ) )     return GREET_PROG;
  if ( !StrCmp( name, "all_greet_prog" ) )     return ALL_GREET_PROG;
  if ( !StrCmp( name, "give_prog"      ) )     return GIVE_PROG;
  if ( !StrCmp( name, "bribe_prog"     ) )     return BRIBE_PROG;
  if ( !StrCmp( name, "time_prog"     ) )      return TIME_PROG;
  if ( !StrCmp( name, "hour_prog"     ) )      return HOUR_PROG;
  if ( !StrCmp( name, "wear_prog"     ) )      return WEAR_PROG;
  if ( !StrCmp( name, "remove_prog"   ) )      return REMOVE_PROG;
  if ( !StrCmp( name, "sac_prog"      ) )      return SAC_PROG;
  if ( !StrCmp( name, "look_prog"     ) )      return LOOK_PROG;
  if ( !StrCmp( name, "exa_prog"      ) )      return EXA_PROG;
  if ( !StrCmp( name, "zap_prog"      ) )      return ZAP_PROG;
  if ( !StrCmp( name, "get_prog"      ) )      return GET_PROG;
  if ( !StrCmp( name, "drop_prog"     ) )      return DROP_PROG;
  if ( !StrCmp( name, "damage_prog"   ) )      return DAMAGE_PROG;
  if ( !StrCmp( name, "repair_prog"   ) )      return REPAIR_PROG;
  if ( !StrCmp( name, "greet_prog"    ) )      return GREET_PROG;
  if ( !StrCmp( name, "randiw_prog"   ) )      return RANDIW_PROG;
  if ( !StrCmp( name, "speechiw_prog" ) )      return SPEECHIW_PROG;
  if ( !StrCmp( name, "pull_prog"      ) )     return PULL_PROG;
  if ( !StrCmp( name, "push_prog"      ) )     return PUSH_PROG;
   if ( !StrCmp( name, "sleep_prog"    ) )      return SLEEP_PROG;
  if ( !StrCmp( name, "rest_prog"      ) )     return REST_PROG;
  if ( !StrCmp( name, "rfight_prog"   ) )      return FIGHT_PROG;
  if ( !StrCmp( name, "enter_prog"    ) )      return ENTRY_PROG;
  if ( !StrCmp( name, "leave_prog"    ) )      return LEAVE_PROG;
  if ( !StrCmp( name, "rdeath_prog"    ) )     return DEATH_PROG;
  if ( !StrCmp( name, "script_prog"    ) )     return SCRIPT_PROG;
  if ( !StrCmp( name, "use_prog"       ) )     return USE_PROG;
  return( ERROR_PROG );
}

static MPROG_DATA *MobProgReadFile( const char *f, MPROG_DATA *mprg, ProtoMobile *pMobIndex )
{
  char        MUDProgfile[ MAX_INPUT_LENGTH ];
  FILE       *progfile;
  char        letter;
  MPROG_DATA *mprg_next, *mprg2;
  bool        done = false;

  sprintf( MUDProgfile, "%s%s", PROG_DIR, f );

  progfile = fopen( MUDProgfile, "r" );
  if ( !progfile )
    {
      Log->Bug( "Mob: %d couldn't open mudprog file", pMobIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile, Log ) )
    {
    case '>':
      break;
    case '|':
      Log->Bug( "empty mudprog file." );
      exit( 1 );
      break;
    default:
      Log->Bug( "in mudprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile, Log ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Log->Bug( "mudprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Log->Bug( "mprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile, Log );
          mprg2->comlist       = ReadStringToTilde( progfile, Log );
          switch ( letter = ReadChar( progfile, Log ) )
            {
            case '>':
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              mprg_next->Next = mprg2;
              mprg2 = mprg_next;
              break;
            case '|':
              done = true;
              break;
	       default:
              Log->Bug( "in mudprog file syntax error." );
              exit( 1 );
              break;
            }
          break;
        }
    }
  fclose( progfile );
  return mprg2;
}

/* This procedure is responsible for reading any in_file MUDprograms.
 */

static void MobProgReadPrograms( FILE *fp, ProtoMobile *pMobIndex)
{
  MPROG_DATA *mprg;
  char        letter;
  bool        done = false;

  if ( ( letter = ReadChar( fp, Log ) ) != '>' )
    {
      Log->Bug( "%s: vnum %d MUDPROG char", __FUNCTION__, pMobIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pMobIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp, Log ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
	  Log->Bug( "%s: vnum %d MUDPROG type.", __FUNCTION__, pMobIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = MobProgReadFile( ReadStringToTilde( fp, Log ), mprg,pMobIndex );
          ReadToEndOfLine( fp, Log );
          switch ( letter = ReadChar( fp, Log ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp, Log );
              done = true;
              break;
            default:
              Log->Bug( "%s: vnum %d bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp, Log );
          ReadToEndOfLine( fp, Log );
          mprg->comlist        = ReadStringToTilde( fp, Log );
          ReadToEndOfLine( fp, Log );
          switch ( letter = ReadChar( fp, Log ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
	      case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp, Log );
              done = true;
              break;
            default:
              Log->Bug( "%s: vnum %d bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        }
    }

  return;

}



/*************************************************************/
/* obj prog functions */
/* This routine transfers between alpha and numeric forms of the
 *  mob_prog bitvector types. This allows the use of the words in the
 *  mob/script files.
 */

/* This routine reads in scripts of OBJprograms from a file */


static MPROG_DATA *ObjProgReadFile( const char *f, MPROG_DATA *mprg, ProtoObject *pObjIndex )
{
  char        MUDProgfile[ MAX_INPUT_LENGTH ];
  FILE       *progfile;
  char        letter;
  MPROG_DATA *mprg_next, *mprg2;
  bool        done = false;

  sprintf( MUDProgfile, "%s%s", PROG_DIR, f );

  progfile = fopen( MUDProgfile, "r" );
  if ( !progfile )
    {
      Log->Bug( "Obj: %d couldnt open mudprog file", pObjIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile, Log ) )
    {
    case '>':
      break;
    case '|':
      Log->Bug( "empty objprog file." );
      exit( 1 );
      break;
    default:
      Log->Bug( "in objprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile, Log ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Log->Bug( "objprog file type error" );
          exit( 1 );
	   break;
        case IN_FILE_PROG:
          Log->Bug( "objprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile, Log );
          mprg2->comlist       = ReadStringToTilde( progfile, Log );
          switch ( letter = ReadChar( progfile, Log ) )
            {
            case '>':
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              mprg_next->Next = mprg2;
              mprg2 = mprg_next;
              break;
            case '|':
              done = true;
              break;
            default:
              Log->Bug( "in objprog file syntax error." );
              exit( 1 );
              break;
            }
          break;
        }
    }
  fclose( progfile );
  return mprg2;
}

/* Load a MUDprogram section from the area file.
 */
static void LoadObjProgs( Area *tarea, FILE *fp )
{
  ProtoObject *iObj;
  MPROG_DATA     *original;
  MPROG_DATA     *working;
  char            letter;
  int             value;

  for ( ; ; )
    switch ( letter = ReadChar( fp, Log ) )
      {
      default:
        Log->Bug( "%s: bad command '%c'.", __FUNCTION__, letter);
        exit(1);
        break;
      case 'S':
      case 's':
        ReadToEndOfLine( fp, Log );
	return;
      case '*':
        ReadToEndOfLine( fp, Log );
        break;
      case 'M':
      case 'm':
        value = ReadInt( fp, Log );
        if ( ( iObj = GetProtoObject( value ) ) == NULL )
          {
            Log->Bug( "%s: vnum %d doesnt exist", __FUNCTION__, value );
            exit( 1 );
          }

        /* Go to the end of the prog command list if other commands
           exist */

        if ( (original = iObj->mprog.mudprogs) != NULL )
          for ( ; original->Next; original = original->Next );

        AllocateMemory( working, MPROG_DATA, 1 );
        if ( original )
          original->Next = working;
        else
          iObj->mprog.mudprogs = working;
        working = ObjProgReadFile( ReadWord( fp, Log ), working, iObj );
        working->Next = NULL;
        ReadToEndOfLine( fp, Log );
        break;
      }

  return;
}

/* This procedure is responsible for reading any in_file OBJprograms.
 */

static void ObjProgReadPrograms( FILE *fp, ProtoObject *pObjIndex)
{
  MPROG_DATA *mprg;
  char        letter;
  bool        done = false;

  if ( ( letter = ReadChar( fp, Log ) ) != '>' )
    {
      Log->Bug( "%s: vnum %d OBJPROG char", __FUNCTION__, pObjIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pObjIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp, Log ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Log->Bug( "%s: vnum %d OBJPROG type.", __FUNCTION__, pObjIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = ObjProgReadFile( ReadStringToTilde( fp, Log ), mprg,pObjIndex );
          ReadToEndOfLine( fp, Log );
          switch ( letter = ReadChar( fp, Log ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
	       mprg->Next = NULL;
              ReadToEndOfLine( fp, Log );
              done = true;
              break;
            default:
              Log->Bug( "%s: vnum %d bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp, Log );
          ReadToEndOfLine( fp, Log );
          mprg->comlist        = ReadStringToTilde( fp, Log );
          ReadToEndOfLine( fp, Log );
          switch ( letter = ReadChar( fp, Log ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp, Log );
              done = true;
              break;
            default:
              Log->Bug( "%s: vnum %d bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        }
    }

  return;
}

/*************************************************************/
/* room prog functions */
/* This routine transfers between alpha and numeric forms of the
 *  mob_prog bitvector types. This allows the use of the words in the
 *  mob/script files.
 */

/* This routine reads in scripts of OBJprograms from a file */
static MPROG_DATA *RoomProgReadFile( const char *f, MPROG_DATA *mprg, Room *RoomIndex )
{
  char        MUDProgfile[ MAX_INPUT_LENGTH ];
  FILE       *progfile;
  char        letter;
  MPROG_DATA *mprg_next, *mprg2;
  bool        done = false;

  sprintf( MUDProgfile, "%s%s", PROG_DIR, f );

  progfile = fopen( MUDProgfile, "r" );
  if ( !progfile )
    {
      Log->Bug( "Room: %d couldnt open roomprog file", RoomIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile, Log ) )
    {
    case '>':
       break;
    case '|':
      Log->Bug( "empty roomprog file." );
      exit( 1 );
      break;
    default:
      Log->Bug( "in roomprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile, Log ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Log->Bug( "roomprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Log->Bug( "roomprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          RoomIndex->mprog.progtypes = RoomIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile, Log );
          mprg2->comlist       = ReadStringToTilde( progfile, Log );
          switch ( letter = ReadChar( progfile, Log ) )
            {
            case '>':
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              mprg_next->Next = mprg2;
              mprg2 = mprg_next;
              break;
	      case '|':
              done = true;
              break;
            default:
              Log->Bug( "in roomprog file syntax error." );
              exit( 1 );
              break;
            }
          break;
        }
    }
  fclose( progfile );
  return mprg2;
}

/* This procedure is responsible for reading any in_file ROOMprograms.
 */

static void RoomProgReadPrograms( FILE *fp, Room *pRoomIndex)
{
  MPROG_DATA *mprg;
  char        letter;
  bool        done = false;

  if ( ( letter = ReadChar( fp, Log ) ) != '>' )
    {
      Log->Bug( "%s: vnum %d ROOMPROG char", __FUNCTION__, pRoomIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pRoomIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp, Log ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Log->Bug( "%s: vnum %d ROOMPROG type.", __FUNCTION__, pRoomIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = RoomProgReadFile( ReadStringToTilde( fp, Log ), mprg,pRoomIndex );
          ReadToEndOfLine( fp, Log );
          switch ( letter = ReadChar( fp, Log ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp, Log );
              done = true;
              break;
            default:
              Log->Bug( "%s: vnum %d bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pRoomIndex->mprog.progtypes = pRoomIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp, Log );
          ReadToEndOfLine( fp, Log );
          mprg->comlist        = ReadStringToTilde( fp, Log );
          ReadToEndOfLine( fp, Log );

          switch ( letter = ReadChar( fp, Log ) )
            {
            case '>':
	      AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp, Log );
              done = true;
              break;
            default:
              Log->Bug( "%s: vnum %d bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        }
    }

  return;
}

Area *GetArea( const char *name )
{
  Area *area = NULL;

  for ( area = FirstArea; area; area = area->Next )
    {
      if ( !StrCmp( area->Filename, name ) || !StrCmp( area->Name, name ) )
        {
          break;
        }
    }

  return area;
}

/*
 * Repopulate areas periodically.
 */
void AreaUpdate( void )
{
  Area *pArea;

  for ( pArea = FirstArea; pArea; pArea = pArea->Next )
    {
      Character *pch;
      int reset_age = pArea->ResetFrequency ? pArea->ResetFrequency : 15;

      if ( (reset_age == -1 && pArea->Age == -1)
           ||    ++pArea->Age < (reset_age-1) )
        continue;

      /*
       * Check for PC's.
       */
      if ( pArea->NumberOfPlayers > 0 && pArea->Age == (reset_age-1) )
        {
          char buf[MAX_STRING_LENGTH];

          /* Rennard */
          if ( pArea->ResetMessage )
	     sprintf( buf, "%s\r\n", pArea->ResetMessage );
          else
            strcpy( buf, "You hear some squeaking sounds...\r\n" );
          for ( pch = FirstCharacter; pch; pch = pch->Next )
            {
              if ( !IsNpc(pch)
                   &&   IsAwake(pch)
                   &&   pch->InRoom
                   &&   pch->InRoom->Area == pArea )
                {
                  SetCharacterColor( AT_RESET, pch );
                  pch->Echo( buf );
                }
            }
        }

      /*
       * Check age and reset.
       * Note: Mud Academy resets every 3 minutes (not 15).
       */
      if ( pArea->NumberOfPlayers == 0 || pArea->Age >= reset_age )
        {
          Room *pRoomIndex;

          fprintf( stderr, "Resetting: %s\n", pArea->Filename );
          ResetArea( pArea );
          if ( reset_age == -1 )
            pArea->Age = -1;
          else
            pArea->Age = GetRandomNumberFromRange( 0, reset_age / 5 );
          pRoomIndex = GetRoom( ROOM_VNUM_SCHOOL );
          if ( pRoomIndex != NULL && pArea == pRoomIndex->Area
               &&   pArea->ResetFrequency == 0 )
            pArea->Age = 15 - 3;
        }
    }
}

/*
 * This could have other applications too.. move if needed. -- Altrag
 */
void CloseArea( Area *pArea )
{
  Character *ech;
  Character *ech_next;
  Object *eobj;
  Object *eobj_next;
  int icnt;
  Room *rid;
  Room *rid_next;
  ProtoObject *oid;
  ProtoObject *oid_next;
  ProtoMobile *mid;
  ProtoMobile *mid_next;
  Reset *ereset;
  Reset *ereset_next;
  ExtraDescription *eed;
  ExtraDescription *eed_next;
  Exit *exit_next;
  MPROG_ACT_LIST *mpact;
  MPROG_ACT_LIST *mpact_next;
  MPROG_DATA *mprog;
  MPROG_DATA *mprog_next;
  Affect *paf;
  Affect *paf_next;

  for ( ech = FirstCharacter; ech; ech = ech_next )
    {
      ech_next = ech->Next;

      if ( ech->Fighting )
        StopFighting( ech, true );
      if ( IsNpc(ech) )
        {
          /* if mob is in area, or part of area. */
          if ( urange(pArea->VnumRanges.Mob.First, ech->Prototype->Vnum,
                      pArea->VnumRanges.Mob.Last) == ech->Prototype->Vnum ||
               (ech->InRoom && ech->InRoom->Area == pArea) )
            ExtractCharacter( ech, true );
          continue;
        }
      if ( ech->InRoom && ech->InRoom->Area == pArea )
        do_recall( ech, "" );
    }
  for ( eobj = FirstObject; eobj; eobj = eobj_next )
    {
      eobj_next = eobj->Next;
      /* if obj is in area, or part of area. */
      if ( urange(pArea->VnumRanges.Object.First, eobj->Prototype->Vnum,
                  pArea->VnumRanges.Object.Last) == eobj->Prototype->Vnum ||
           (eobj->InRoom && eobj->InRoom->Area == pArea) )
        ExtractObject( eobj );
    }

  for ( icnt = 0; icnt < MAX_KEY_HASH; icnt++ )
     {
      for ( rid = RoomIndexHash[icnt]; rid; rid = rid_next )
        {
          Exit *exit_iter = NULL;
          rid_next = rid->Next;

          for ( exit_iter = rid->FirstExit; exit_iter; exit_iter = exit_next )
            {
              exit_next = exit_iter->Next;

              if ( rid->Area == pArea || exit_iter->ToRoom->Area == pArea )
                {
                  FreeMemory( exit_iter->Keyword );
                  FreeMemory( exit_iter->Description );
                  UNLINK( exit_iter, rid->FirstExit, rid->LastExit, Next, Previous );
                  FreeMemory( exit_iter );
                }
            }

          if ( rid->Area != pArea )
            continue;

          FreeMemory(rid->Name);
          FreeMemory(rid->Description);

          if ( rid->FirstPerson )
            {
              Log->Bug( "CloseArea: room with people #%d", rid->Vnum );

              for ( ech = rid->FirstPerson; ech; ech = ech_next )
                {
                  ech_next = ech->NextInRoom;

                  if ( ech->Fighting )
                    StopFighting( ech, true );

		  if ( IsNpc(ech) )
                    ExtractCharacter( ech, true );
                  else
                    do_recall( ech, "" );
                }
            }

          if ( rid->FirstContent )
            {
              Log->Bug( "CloseArea: room with contents #%d", rid->Vnum );

              for ( eobj = rid->FirstContent; eobj; eobj = eobj_next )
                {
                  eobj_next = eobj->NextContent;
                  ExtractObject( eobj );
                }
            }
          for ( eed = rid->FirstExtraDescription; eed; eed = eed_next )
            {
              eed_next = eed->Next;
              FreeMemory( eed->Keyword );
              FreeMemory( eed->Description );
              FreeMemory( eed );
            }
          for ( mpact = rid->mprog.mpact; mpact; mpact = mpact_next )
            {
              mpact_next = mpact->Next;
              FreeMemory( mpact->buf );
              FreeMemory( mpact );
            }

          for ( mprog = rid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->Next;
	      FreeMemory( mprog->arglist );
              FreeMemory( mprog->comlist );
              FreeMemory( mprog );
            }

          if ( rid == RoomIndexHash[icnt] )
            {
              RoomIndexHash[icnt] = rid->Next;
            }
          else
            {
              Room *trid;

              for ( trid = RoomIndexHash[icnt]; trid; trid = trid->Next )
                if ( trid->Next == rid )
                  break;

              if ( !trid )
                Log->Bug( "Close_area: rid not in hash list %d", rid->Vnum );
              else
                trid->Next = rid->Next;
            }
          FreeMemory(rid);
        }

      for ( mid = MobIndexHash[icnt]; mid; mid = mid_next )
        {
          mid_next = mid->Next;

          if ( mid->Vnum < pArea->VnumRanges.Mob.First
               || mid->Vnum > pArea->VnumRanges.Mob.Last )
            continue;

          FreeMemory( mid->Name );
          FreeMemory( mid->ShortDescr );
	  FreeMemory( mid->LongDescr  );
          FreeMemory( mid->Description );
          if ( mid->Shop )
            {
              UNLINK( mid->Shop, FirstShop, LastShop, Next, Previous );
              FreeMemory( mid->Shop );
            }

          if ( mid->RepairShop )
            {
              UNLINK( mid->RepairShop, FirstRepairShop, LastRepairShop, Next, Previous );
              FreeMemory( mid->RepairShop );
            }

          for ( mprog = mid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->Next;
              FreeMemory(mprog->arglist);
              FreeMemory(mprog->comlist);
              FreeMemory(mprog);
            }
          if ( mid == MobIndexHash[icnt] )
            MobIndexHash[icnt] = mid->Next;
          else
            {
              ProtoMobile *tmid;

              for ( tmid = MobIndexHash[icnt]; tmid; tmid = tmid->Next )
                if ( tmid->Next == mid )
                  break;
              if ( !tmid )
                Log->Bug( "Close_area: mid not in hash list %s", mid->Vnum );
              else
                tmid->Next = mid->Next;
            }

	  FreeMemory(mid);
        }

      for ( oid = ObjectIndexHash[icnt]; oid; oid = oid_next )
        {
          oid_next = oid->Next;

          if ( oid->Vnum < pArea->VnumRanges.Object.First
               || oid->Vnum > pArea->VnumRanges.Object.Last )
            continue;

          FreeMemory(oid->Name);
          FreeMemory(oid->ShortDescr);
          FreeMemory(oid->Description);
          FreeMemory(oid->ActionDescription);

          for ( eed = oid->FirstExtraDescription; eed; eed = eed_next )
            {
              eed_next = eed->Next;
              FreeMemory(eed->Keyword);
              FreeMemory(eed->Description);
              FreeMemory(eed);
            }
          for ( paf = oid->FirstAffect; paf; paf = paf_next )
            {
              paf_next = paf->Next;
              FreeMemory(paf);
            }
          for ( mprog = oid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->Next;
              FreeMemory(mprog->arglist);
              FreeMemory(mprog->comlist);
              FreeMemory(mprog);
            }
	  if ( oid == ObjectIndexHash[icnt] )
            ObjectIndexHash[icnt] = oid->Next;
          else
            {
              ProtoObject *toid;

              for ( toid = ObjectIndexHash[icnt]; toid; toid = toid->Next )
                if ( toid->Next == oid )
                  break;
              if ( !toid )
                Log->Bug( "Close_area: oid not in hash list %s", oid->Vnum );
              else
                toid->Next = oid->Next;
            }
          FreeMemory(oid);
        }
    }
  for ( ereset = pArea->FirstReset; ereset; ereset = ereset_next )
    {
      ereset_next = ereset->Next;
      FreeMemory(ereset);
    }
  FreeMemory(pArea->Name);
  FreeMemory(pArea->Filename);
  FreeMemory(pArea->Author);
  UNLINK( pArea, FirstBuild, LastBuild, Next, Previous );
  UNLINK( pArea, FirstASort, LastASort, NextSort, PreviousSort );
  FreeMemory( pArea );
}

void FreeArea( Area *are )
{
  FreeMemory( are->Name );
  FreeMemory( are->Filename );

  while ( are->FirstReset )
    FreeReset( are, are->FirstReset );

  FreeMemory( are );
}

void AssignAreaTo( Character *ch )
{
  if ( IsNpc( ch ) )
    {
      return;
    }
  
  if ( GetTrustLevel( ch ) >= LEVEL_AVATAR
       && ch->PCData->Build.VnumRanges.Room.First != INVALID_VNUM
       && ch->PCData->Build.VnumRanges.Room.Last != INVALID_VNUM)
    {
      char buf[MAX_STRING_LENGTH];
      char buf2[MAX_STRING_LENGTH];
      char taf[1024];
      Area *tmp = nullptr;
      bool created = false;
      Area *tarea = ch->PCData->Build.Area;

      sprintf( taf, "%s.are", Capitalize( ch->Name ) );

      if ( tarea == nullptr )
        {
          for ( tmp = FirstBuild; tmp; tmp = tmp->Next )
            {
              if ( !StrCmp( taf, tmp->Filename ) )
                {
                  tarea = tmp;
                  break;
                }
            }
        }

      if ( tarea == nullptr )
        {
          sprintf( buf, "Creating area entry for %s", ch->Name );
          Log->LogStringPlus( buf, LOG_NORMAL, ch->TopLevel );
          AllocateMemory( tarea, Area, 1 );
          LINK( tarea, FirstBuild, LastBuild, Next, Previous );
          sprintf( buf, "{PROTO} %s's area in progress", ch->Name );
          tarea->Name           = CopyString( buf );
          tarea->Filename       = CopyString( taf );
          sprintf( buf2, "%s", ch->Name );
          tarea->Author         = CopyString( buf2 );

	  created = true;
        }
      else
        {
          sprintf( buf, "Updating area entry for %s", ch->Name );
          Log->LogStringPlus( buf, LOG_NORMAL, ch->TopLevel );
        }

      tarea->VnumRanges.Room.First = ch->PCData->Build.VnumRanges.Room.First;
      tarea->VnumRanges.Object.First = ch->PCData->Build.VnumRanges.Object.First;
      tarea->VnumRanges.Mob.First = ch->PCData->Build.VnumRanges.Mob.First;
      tarea->VnumRanges.Room.Last  = ch->PCData->Build.VnumRanges.Room.Last;
      tarea->VnumRanges.Object.Last  = ch->PCData->Build.VnumRanges.Object.Last;
      tarea->VnumRanges.Mob.Last  = ch->PCData->Build.VnumRanges.Mob.Last;
      ch->PCData->Build.Area  = tarea;

      if ( created )
        {
          SortArea( tarea, true );
        }
    }
}

void CleanResets( Area *tarea )
{
  Reset *pReset, *pReset_next;

  for ( pReset = tarea->FirstReset; pReset; pReset = pReset_next )
    {
      pReset_next = pReset->Next;
      FreeMemory( pReset );
      --top_reset;
    }

  tarea->FirstReset    = NULL;
  tarea->LastReset     = NULL;
}

