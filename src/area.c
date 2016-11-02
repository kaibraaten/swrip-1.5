#include <ctype.h>
#include "area.h"
#include "mud.h"
#include "shop.h"
#include "reset.h"
#include "skill.h"

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
      Bug( "%s: null area!", __FUNCTION__ );
      return;
    }

  sprintf( buf, "%s%s", AREA_DIR, filename );

  if ( ( fpArea = fopen( buf, "r" ) ) == NULL )
    {
      Bug( "%s: error loading file (can't open)", __FUNCTION__ );
      Bug( filename );
      return;
    }

  for ( ; ; )
    {
      const char *word;

      if ( ReadChar( fpArea ) != '#' )
        {
          Bug( tarea->Filename );
          Bug( "%s: # not found.", __FUNCTION__ );
          exit( 1 );
        }

      word = ReadWord( fpArea );

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
              tarea->Name = ReadStringToTilde( fpArea );
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
          Bug( tarea->Filename );
          Bug( "%s: bad section name.", __FUNCTION__ );

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
      Bug( "%s: NULL pArea", __FUNCTION__ );
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
    for ( area = first_sort; area; area = area->NextSort )
      if ( pArea->VnumRanges.Room.First < area->VnumRanges.Room.First )
        {
          if ( !area->PreviousSort )
            first_sort  = pArea;
          else
            area->PreviousSort->NextSort = pArea;
          pArea->PreviousSort = area->PreviousSort;
          pArea->NextSort = area;
          area->PreviousSort  = pArea;
          found = true;
          break;
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
  pArea->Name           = ReadStringToTilde( fp );
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
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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

   tarea->Author = ReadStringToTilde( fp );
}

static void LoadEconomy( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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

  tarea->HighEconomy   = ReadInt( fp );
  tarea->LowEconomy    = ReadInt( fp );
}

static void LoadResetMessage( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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

  tarea->ResetMessage = ReadStringToTilde( fp );
}

static void LoadFlags( Area *tarea, FILE *fp )
{
  const char *ln = NULL;
  int x1 = 0, x2 = 0;

  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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

  ln = ReadLine( fp );
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
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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
      char letter = ReadChar( fp );

      if ( letter != '#' )
        {
          Bug( "%s: # not found.", __FUNCTION__ );

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

      vnum = ReadInt( fp );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetProtoMobile( vnum ) )
        {
          if ( tmpBootDb )
            {
              Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              pMobIndex = GetProtoMobile( vnum );
              sprintf( buf, "Cleaning mobile: %ld", vnum );
	      LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
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

      pMobIndex->Name     = ReadStringToTilde( fp );
      pMobIndex->ShortDescr     = ReadStringToTilde( fp );
      pMobIndex->LongDescr      = ReadStringToTilde( fp );
      pMobIndex->Description     = ReadStringToTilde( fp );

      pMobIndex->LongDescr[0]   = CharToUppercase(pMobIndex->LongDescr[0]);
      pMobIndex->Description[0]  = CharToUppercase(pMobIndex->Description[0]);

      pMobIndex->Flags           = ReadInt( fp ) | ACT_NPC;
      pMobIndex->AffectedBy     = ReadInt( fp );
      pMobIndex->Shop           = NULL;
      pMobIndex->RepairShop           = NULL;
      pMobIndex->Alignment       = ReadInt( fp );
      letter                     = ReadChar( fp );
      pMobIndex->Level           = ReadInt( fp );

      pMobIndex->MobThac0        = ReadInt( fp );
      pMobIndex->ArmorClass      = ReadInt( fp );
      pMobIndex->HitNoDice       = ReadInt( fp );
      /* 'd'            */         ReadChar( fp );
      pMobIndex->HitSizeDice     = ReadInt( fp );
      /* '+'            */         ReadChar( fp );
      pMobIndex->HitPlus         = ReadInt( fp );
      pMobIndex->DamNoDice       = ReadInt( fp );
      /* 'd'            */         ReadChar( fp );
      pMobIndex->DamSizeDice     = ReadInt( fp );
      /* '+'            */         ReadChar( fp );
      pMobIndex->DamPlus         = ReadInt( fp );
      pMobIndex->Gold            = ReadInt( fp );
      pMobIndex->exp             = ReadInt( fp );
      pMobIndex->Position        = (PositionType)ReadInt( fp );
      pMobIndex->DefaultPosition = (PositionType)ReadInt( fp );

      /*
       * Back to meaningful values.
       */
      pMobIndex->Sex             = (SexType) ReadInt( fp );

      if ( letter != 'S' && letter != 'C' && letter != 'Z' )
        {
          Bug( "%s: vnum %d: letter '%c' not Z, S or C.", __FUNCTION__, vnum,
               letter );
          ShutdownMud( "bad mob data" );
          exit( 1 );
        }

      if ( letter == 'C' || letter == 'Z' )
	{
          pMobIndex->Stats.PermStr       = ReadInt( fp );
          pMobIndex->Stats.PermInt       = ReadInt( fp );
          pMobIndex->Stats.PermWis       = ReadInt( fp );
          pMobIndex->Stats.PermDex       = ReadInt( fp );
          pMobIndex->Stats.PermCon       = ReadInt( fp );
          pMobIndex->Stats.PermCha       = ReadInt( fp );
          pMobIndex->Stats.PermLck       = ReadInt( fp );
          pMobIndex->Saving.PoisonDeath  = ReadInt( fp );
          pMobIndex->Saving.Wand         = ReadInt( fp );
          pMobIndex->Saving.ParaPetri    = ReadInt( fp );
          pMobIndex->Saving.Breath       = ReadInt( fp );
          pMobIndex->Saving.SpellStaff   = ReadInt( fp );

          ln = ReadLine( fp );
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

          ln = ReadLine( fp );
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
          ln = ReadLine( fp );
          x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = 0;
          sscanf( ln, "%d %d %d %d %d %d %d %d",
		  &x1, &x2, &x3, &x4, &x5,  &x6,  &x7,  &x8);
          pMobIndex->VipFlags = x1;
        }

      letter = ReadChar( fp );

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
          pMobIndex->Next       = mob_index_hash[iHash];
          mob_index_hash[iHash] = pMobIndex;
          top_mob_index++;
        }
    }
}

static void LoadObjects( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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
      char letter = ReadChar( fp );

      if ( letter != '#' )
	{
          Bug( "%s: # not found.", __FUNCTION__ );

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

      vnum = ReadInt( fp );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetProtoObject( vnum ) )
        {
          if ( tmpBootDb )
            {
              Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              pObjIndex = GetProtoObject( vnum );
              sprintf( buf, "Cleaning object: %ld", vnum );
              LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
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

      pObjIndex->Name         = ReadStringToTilde( fp );
      pObjIndex->ShortDescr  = ReadStringToTilde( fp );
      pObjIndex->Description  = ReadStringToTilde( fp );
      pObjIndex->ActionDescription  = ReadStringToTilde( fp );

      /* Commented out by Narn, Apr/96 to allow item short descs like
         Bonecrusher and Oblivion */
      pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);

      ln = ReadLine( fp );
      x1=x2=x3=x4=0;
      sscanf( ln, "%d %d %d %d",
	       &x1, &x2, &x3, &x4 );
      pObjIndex->ItemType              = (ItemTypes) x1;
      pObjIndex->Flags            = x2;
      pObjIndex->WearFlags             = x3;
      pObjIndex->Layers         = x4;

      ln = ReadLine( fp );
      x1=x2=x3=x4=x5=x6=0;
      sscanf( ln, "%d %d %d %d %d %d",
              &x1, &x2, &x3, &x4, &x5, &x6 );
      pObjIndex->Value[0]               = x1;
      pObjIndex->Value[1]               = x2;
      pObjIndex->Value[2]               = x3;
      pObjIndex->Value[3]               = x4;
      pObjIndex->Value[4]               = x5;
      pObjIndex->Value[5]               = x6;
      pObjIndex->Weight         = ReadInt( fp );
      pObjIndex->Weight = umax( 1, pObjIndex->Weight );
      pObjIndex->Cost                   = ReadInt( fp );
      pObjIndex->Rent                   = ReadInt( fp ); /* unused */

      for ( ; ; )
        {
          letter = ReadChar( fp );

          if ( letter == 'A' )
            {
              Affect *paf;

              AllocateMemory( paf, Affect, 1 );
              paf->Type         = -1;
              paf->Duration             = -1;
              paf->Location             = ReadInt( fp );
              if ( paf->Location == APPLY_WEAPONSPELL
                   ||   paf->Location == APPLY_WEARSPELL
		   ||   paf->Location == APPLY_REMOVESPELL
                   ||   paf->Location == APPLY_STRIPSN )
                paf->Modifier           = SkillNumberFromSlot( ReadInt(fp) );
              else
                paf->Modifier           = ReadInt( fp );
              paf->AffectedBy           = 0;
              LINK( paf, pObjIndex->FirstAffect, pObjIndex->LastAffect,
                    Next, Previous );
              top_affect++;
            }

          else if ( letter == 'E' )
            {
              ExtraDescription *ed;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->Keyword               = ReadStringToTilde( fp );
              ed->Description           = ReadStringToTilde( fp );
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
          pObjIndex->Next       = obj_index_hash[iHash];
	  obj_index_hash[iHash] = pObjIndex;
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
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );

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

          Bug( "%s: WARNING: resets already exist for this area.", __FUNCTION__ );

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
          LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
          CleanResets( tarea );
        }
    }

  for ( ; ; )
    {
      char letter;
      int extra, arg1, arg2, arg3;

      if ( ( letter = ReadChar( fp ) ) == 'S' )
        break;

      if ( letter == '*' )
        {
          ReadToEndOfLine( fp );
          continue;
        }

      extra     = ReadInt( fp );
      arg1      = ReadInt( fp );
      arg2      = ReadInt( fp );
      arg3      = (letter == 'G' || letter == 'R') ? 0 : ReadInt( fp );
      ReadToEndOfLine( fp );

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
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );
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
      char letter = ReadChar( fp );

      if ( letter != '#' )
        {
          Bug( "%s: # not found.", __FUNCTION__ );

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

      vnum = ReadInt( fp );

      if ( vnum == INVALID_VNUM )
        break;

      tmpBootDb = fBootDb;
      fBootDb = false;

      if ( GetRoom( vnum ) != NULL )
        {
          if ( tmpBootDb )
            {
              Bug( "%s: vnum %ld duplicated.", __FUNCTION__, vnum );
              ShutdownMud( "duplicate vnum" );
              exit( 1 );
            }
          else
            {
              char buf[MAX_STRING_LENGTH];
              pRoomIndex = GetRoom( vnum );
              sprintf( buf, "Cleaning room: %ld", vnum );
              LogStringPlus( buf, LOG_BUILD, SysData.LevelOfLogChannel );
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

      pRoomIndex->Name         = ReadStringToTilde( fp );
      pRoomIndex->Description  = ReadStringToTilde( fp );

      /* Area number                      ReadInt( fp ); */
      ln = ReadLine( fp );
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
          Bug( "%s: vnum %ld has bad sector_type %d.", __FUNCTION__, vnum,
	        pRoomIndex->Sector);
          pRoomIndex->Sector = SECT_CITY;
        }

      for ( ; ; )
        {
          letter = ReadChar( fp );

          if ( letter == 'S' )
            break;

          if ( letter == 'D' )
            {
              Exit *pexit;
              int locks;

              door = (DirectionType) ReadInt( fp );

              if ( door < DIR_NORTH || door > DIR_SOMEWHERE )
                {
                  Bug( "%s: vnum %d has bad door number %d.", __FUNCTION__, vnum,
                       door );

                  if ( fBootDb )
                    exit( 1 );
                }
              else
                {
                  pexit = MakeExit( pRoomIndex, NULL, door );
                  pexit->Description    = ReadStringToTilde( fp );
                  pexit->Keyword        = ReadStringToTilde( fp );
                  pexit->Flags      = 0;
                  ln = ReadLine( fp );
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
              ed->Keyword               = ReadStringToTilde( fp );
              ed->Description           = ReadStringToTilde( fp );
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
              Bug( "%s: vnum %d has flag '%c' not 'DES'.", __FUNCTION__, vnum,
                   letter );
              ShutdownMud( "Room flag not DES" );
              exit( 1 );
            }
        }

      if ( !oldroom )
        {
          iHash                  = vnum % MAX_KEY_HASH;
          pRoomIndex->Next       = room_index_hash[iHash];
          room_index_hash[iHash] = pRoomIndex;
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
      pShop->Keeper             = ReadInt( fp );

      if ( pShop->Keeper == INVALID_VNUM )
        break;

      for ( iTrade = 0; iTrade < MAX_TRADE; iTrade++ )
        pShop->BuyType[iTrade] = (ItemTypes)ReadInt( fp );

      pShop->ProfitBuy = ReadInt( fp );
      pShop->ProfitSell        = ReadInt( fp );
       pShop->ProfitBuy = urange( pShop->ProfitSell + 5, pShop->ProfitBuy, 1000 );
      pShop->ProfitSell        = urange( 0, pShop->ProfitSell, pShop->ProfitBuy - 5 );
      pShop->BusinessHours.Open  = ReadInt( fp );
      pShop->BusinessHours.Close = ReadInt( fp );
      ReadToEndOfLine( fp );
      pMobIndex         = GetProtoMobile( pShop->Keeper );
      pMobIndex->Shop  = pShop;

      if ( !first_shop )
        first_shop              = pShop;
      else
        last_shop->Next = pShop;

      pShop->Next               = NULL;
      pShop->Previous               = last_shop;
      last_shop         = pShop;
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
      rShop->Keeper             = ReadInt( fp );

      if ( rShop->Keeper == INVALID_VNUM )
	 break;

      for ( iFix = 0; iFix < MAX_FIX; iFix++ )
        rShop->FixType[iFix] = (ItemTypes)ReadInt( fp );

      rShop->ProfitFix = ReadInt( fp );
      rShop->ShopType  = ReadInt( fp );
      rShop->BusinessHours.Open  = ReadInt( fp );
      rShop->BusinessHours.Close = ReadInt( fp );
      ReadToEndOfLine( fp );
      pMobIndex         = GetProtoMobile( rShop->Keeper );
      pMobIndex->RepairShop  = rShop;

      if ( !first_repair )
        first_repair            = rShop;
      else
        last_repair->Next       = rShop;

      rShop->Next               = NULL;
      rShop->Previous           = last_repair;
      last_repair               = rShop;
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

      switch ( letter = ReadChar( fp ) )
        {
        default:
          Bug( "%s: letter '%c' not *MS.", __FUNCTION__, letter );
          exit( 1 );

        case 'S':
          return;

        case '*':
          break;

        case 'M':
          pMobIndex = GetProtoMobile( ReadInt ( fp ) );

          if ( !pMobIndex->spec_fun )
            {
              pMobIndex->spec_fun = SpecialLookup( ReadWord   ( fp ) );

              if ( pMobIndex->spec_fun == 0 )
                {
                  Bug( "%s: 'M': vnum %d.", __FUNCTION__, pMobIndex->Vnum );
                  exit( 1 );
                }
            }
          else if ( !pMobIndex->spec_2 )
            {
              pMobIndex->spec_2 = SpecialLookup( ReadWord( fp ) );

              if ( pMobIndex->spec_2 == 0 )
                {
                  Bug( "%s: 'M': vnum %ld.", __FUNCTION__, pMobIndex->Vnum );
                  exit( 1 );
                }
            }

	   break;
        }

      ReadToEndOfLine( fp );
    }
}

/*
 * Load soft / hard area ranges.
 */
static void LoadRanges( Area *tarea, FILE *fp )
{
  if ( !tarea )
    {
      Bug( "%s: no #AREA seen yet.", __FUNCTION__ );
      ShutdownMud( "No #AREA" );
      exit( 1 );
    }

  for ( ; ; )
    {
      int x1, x2, x3, x4;
      const char *ln = ReadLine( fp );

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
    switch ( letter = ReadChar( fp ) )
      {
      default:
        Bug( "%s: bad command '%c'.", __FUNCTION__, letter);
        exit(1);
        break;
      case 'S':
      case 's':
        ReadToEndOfLine( fp );
        return;
      case '*':
        ReadToEndOfLine( fp );
	 break;
      case 'M':
      case 'm':
        value = ReadInt( fp );
        if ( ( iMob = GetProtoMobile( value ) ) == NULL )
          {
            Bug( "%s: vnum %d doesnt exist", __FUNCTION__, value );
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
        working = MobProgReadFile( ReadWord( fp ), working, iMob );
        working->Next = NULL;
        ReadToEndOfLine( fp );
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
      Bug( "Mob: %d couldn't open mudprog file", pMobIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile ) )
    {
    case '>':
      break;
    case '|':
      Bug( "empty mudprog file." );
      exit( 1 );
      break;
    default:
      Bug( "in mudprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Bug( "mudprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Bug( "mprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile );
          mprg2->comlist       = ReadStringToTilde( progfile );
          switch ( letter = ReadChar( progfile ) )
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
              Bug( "in mudprog file syntax error." );
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

  if ( ( letter = ReadChar( fp ) ) != '>' )
    {
      Bug( "%s: vnum %d MUDPROG char", __FUNCTION__, pMobIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pMobIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
	  Bug( "%s: vnum %d MUDPROG type.", __FUNCTION__, pMobIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = MobProgReadFile( ReadStringToTilde( fp ), mprg,pMobIndex );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          mprg->comlist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
	      case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum );
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
      Bug( "Obj: %d couldnt open mudprog file", pObjIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile ) )
    {
    case '>':
      break;
    case '|':
      Bug( "empty objprog file." );
      exit( 1 );
      break;
    default:
      Bug( "in objprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Bug( "objprog file type error" );
          exit( 1 );
	   break;
        case IN_FILE_PROG:
          Bug( "objprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile );
          mprg2->comlist       = ReadStringToTilde( progfile );
          switch ( letter = ReadChar( progfile ) )
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
              Bug( "in objprog file syntax error." );
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
    switch ( letter = ReadChar( fp ) )
      {
      default:
        Bug( "%s: bad command '%c'.", __FUNCTION__, letter);
        exit(1);
        break;
      case 'S':
      case 's':
        ReadToEndOfLine( fp );
	return;
      case '*':
        ReadToEndOfLine( fp );
        break;
      case 'M':
      case 'm':
        value = ReadInt( fp );
        if ( ( iObj = GetProtoObject( value ) ) == NULL )
          {
            Bug( "%s: vnum %d doesnt exist", __FUNCTION__, value );
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
        working = ObjProgReadFile( ReadWord( fp ), working, iObj );
        working->Next = NULL;
        ReadToEndOfLine( fp );
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

  if ( ( letter = ReadChar( fp ) ) != '>' )
    {
      Bug( "%s: vnum %d OBJPROG char", __FUNCTION__, pObjIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pObjIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Bug( "%s: vnum %d OBJPROG type.", __FUNCTION__, pObjIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = ObjProgReadFile( ReadStringToTilde( fp ), mprg,pObjIndex );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
	       mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          mprg->comlist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum );
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
      Bug( "Room: %d couldnt open roomprog file", RoomIndex->Vnum );
      exit( 1 );
    }

  mprg2 = mprg;
  switch ( letter = ReadChar( progfile ) )
    {
    case '>':
       break;
    case '|':
      Bug( "empty roomprog file." );
      exit( 1 );
      break;
    default:
      Bug( "in roomprog file syntax error." );
      exit( 1 );
      break;
    }

  while ( !done )
    {
      mprg2->type = MudProgNameToType( ReadWord( progfile ) );
      switch ( mprg2->type )
        {
        case ERROR_PROG:
          Bug( "roomprog file type error" );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          Bug( "roomprog file contains a call to file." );
          exit( 1 );
          break;
        default:
          RoomIndex->mprog.progtypes = RoomIndex->mprog.progtypes | mprg2->type;
          mprg2->arglist       = ReadStringToTilde( progfile );
          mprg2->comlist       = ReadStringToTilde( progfile );
          switch ( letter = ReadChar( progfile ) )
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
              Bug( "in roomprog file syntax error." );
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

  if ( ( letter = ReadChar( fp ) ) != '>' )
    {
      Bug( "%s: vnum %d ROOMPROG char", __FUNCTION__, pRoomIndex->Vnum );
      exit( 1 );
    }
  AllocateMemory( mprg, MPROG_DATA, 1 );
  pRoomIndex->mprog.mudprogs = mprg;

  while ( !done )
    {
      mprg->type = MudProgNameToType( ReadWord( fp ) );
      switch ( mprg->type )
        {
        case ERROR_PROG:
          Bug( "%s: vnum %d ROOMPROG type.", __FUNCTION__, pRoomIndex->Vnum );
          exit( 1 );
          break;
        case IN_FILE_PROG:
          mprg = RoomProgReadFile( ReadStringToTilde( fp ), mprg,pRoomIndex );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
              AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum );
              exit( 1 );
              break;
            }
          break;
        default:
          pRoomIndex->mprog.progtypes = pRoomIndex->mprog.progtypes | mprg->type;
          mprg->arglist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          mprg->comlist        = ReadStringToTilde( fp );
          ReadToEndOfLine( fp );
          switch ( letter = ReadChar( fp ) )
            {
            case '>':
	      AllocateMemory( mprg->Next, MPROG_DATA, 1 );
              mprg = mprg->Next;
              break;
            case '|':
              mprg->Next = NULL;
              ReadToEndOfLine( fp );
              done = true;
              break;
            default:
              Bug( "%s: vnum %d bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum );
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
