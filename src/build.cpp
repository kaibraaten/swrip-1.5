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

#include <cstring>
#include <cctype>
#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "skill.hpp"
#include "shop.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"

bool CanModifyRoom( const Character *ch, const Room *room )
{
  vnum_t vnum = room->Vnum;
  Area *pArea;

  if ( IsNpc( ch ) )
    return false;

  if ( GetTrustLevel( ch ) >= SysData.LevelToModifyProto )
    return true;

  if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
    {
      ch->Echo( "You must have an assigned area to modify this room.\r\n" );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.Room.First && vnum <= pArea->VnumRanges.Room.Last )
    return true;

  ch->Echo( "That room is not in your allocated range.\r\n" );
  return false;
}

bool CanModifyObject( const Character *ch, const Object *obj )
{
  vnum_t vnum = obj->Prototype->Vnum;
  Area *pArea;

  if ( IsNpc( ch ) )
    return false;

  if ( GetTrustLevel( ch ) >= SysData.LevelToModifyProto )
    return true;

  if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
    {
      ch->Echo( "You must have an assigned area to modify this object.\r\n" );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.Object.First && vnum <= pArea->VnumRanges.Object.Last )
    return true;

  ch->Echo( "That object is not in your allocated range.\r\n" );
  return false;
}

bool CanModifyCharacter( const Character *ch, const Character *mob )
{
  vnum_t vnum = INVALID_VNUM;
  Area *pArea = NULL;

  if ( mob == ch )
    {
      return true;
    }

  if ( !IsNpc( mob ) )
    {
      if ( GetTrustLevel( ch ) >= SysData.LevelToModifyProto && GetTrustLevel(ch) >
           GetTrustLevel( mob ) )
	{
	  return true;
	}
      else
	{
	  ch->Echo( "You can't do that.\r\n" );
	}

      return false;
    }

  vnum = mob->Prototype->Vnum;

  if ( IsNpc( ch ) )
    {
      return false;
    }

  if ( GetTrustLevel( ch ) >= SysData.LevelToModifyProto )
    {
      return true;
    }

  if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
    {
      ch->Echo( "You must have an assigned area to modify this mobile.\r\n" );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.Mob.First && vnum <= pArea->VnumRanges.Mob.Last )
    {
      return true;
    }

  ch->Echo( "That mobile is not in your allocated range.\r\n" );
  return false;
}

bool CanMedit( const Character *ch, const ProtoMobile *mob )
{
  vnum_t vnum = mob->Vnum;
  Area *pArea = NULL;

  if ( IsNpc( ch ) )
    {
      return false;
    }

  if ( GetTrustLevel( ch ) >= LEVEL_GREATER )
    {
      return true;
    }

  if ( !ch->PCData || !( pArea = ch->PCData->Build.Area ) )
    {
      ch->Echo( "You must have an assigned area to modify this mobile.\r\n" );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.Mob.First
       && vnum <= pArea->VnumRanges.Mob.Last )
    {
      return true;
    }

  ch->Echo( "That mobile is not in your allocated range.\r\n" );
  return false;
}

void FreeReset( Area *are, Reset *res )
{
  UNLINK( res, are->FirstReset, are->LastReset, Next, Previous );
  FreeMemory( res );
}

ExtraDescription *SetRExtra( Room *room, const std::string &keywords )
{
  ExtraDescription *ed;

  for ( ed = room->FirstExtraDescription; ed; ed = ed->Next )
    {
      if ( IsName( keywords, ed->Keyword ) )
        break;
    }
  if ( !ed )
    {
      AllocateMemory( ed, ExtraDescription, 1 );
      LINK( ed, room->FirstExtraDescription, room->LastExtraDescription, Next, Previous );
      ed->Keyword       = CopyString( keywords );
      ed->Description   = CopyString( "" );
      top_ed++;
    }
  return ed;
}

bool DelRExtra( Room *room, const std::string &keywords )
{
  ExtraDescription *rmed;

  for ( rmed = room->FirstExtraDescription; rmed; rmed = rmed->Next )
    {
      if ( IsName( keywords, rmed->Keyword ) )
        break;
    }
  if ( !rmed )
    return false;
  
  UNLINK( rmed, room->FirstExtraDescription, room->LastExtraDescription, Next, Previous );
  FreeMemory( rmed->Keyword );
  FreeMemory( rmed->Description );
  FreeMemory( rmed );
  top_ed--;
  return true;
}

ExtraDescription *SetOExtra( Object *obj, const std::string &keywords )
{
  ExtraDescription *ed;

  for ( ed = obj->FirstExtraDescription; ed; ed = ed->Next )
    {
      if ( IsName( keywords, ed->Keyword ) )
        break;
    }
  if ( !ed )
    {
      AllocateMemory( ed, ExtraDescription, 1 );
      LINK( ed, obj->FirstExtraDescription, obj->LastExtraDescription, Next, Previous );
      ed->Keyword       = CopyString( keywords );
      ed->Description   = CopyString( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtra( Object *obj, const std::string &keywords )
{
  ExtraDescription *rmed;

  for ( rmed = obj->FirstExtraDescription; rmed; rmed = rmed->Next )
    {
      if ( IsName( keywords, rmed->Keyword ) )
        break;
    }
  if ( !rmed )
    return false;
  UNLINK( rmed, obj->FirstExtraDescription, obj->LastExtraDescription, Next, Previous );
  FreeMemory( rmed->Keyword );
  FreeMemory( rmed->Description );
  FreeMemory( rmed );
  top_ed--;
  return true;
}

ExtraDescription *SetOExtraProto( ProtoObject *obj, const std::string &keywords )
{
  ExtraDescription *ed;

  for ( ed = obj->FirstExtraDescription; ed; ed = ed->Next )
    {
      if ( IsName( keywords, ed->Keyword ) )
        break;
    }
  if ( !ed )
    {
      AllocateMemory( ed, ExtraDescription, 1 );
      LINK( ed, obj->FirstExtraDescription, obj->LastExtraDescription, Next, Previous );
      ed->Keyword       = CopyString( keywords );
      ed->Description   = CopyString( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtraProto( ProtoObject *obj, const std::string &keywords )
{
  ExtraDescription *rmed;

  for ( rmed = obj->FirstExtraDescription; rmed; rmed = rmed->Next )
    {
      if ( IsName( keywords, rmed->Keyword ) )
        break;
    }
  
  if ( !rmed )
    return false;

  UNLINK( rmed, obj->FirstExtraDescription, obj->LastExtraDescription, Next, Previous );
  FreeMemory( rmed->Keyword );
  FreeMemory( rmed->Description );
  FreeMemory( rmed );
  top_ed--;
  return true;
}

void FoldArea( Area *tarea, const std::string &filename, bool install )
{
  Reset *treset = NULL;
  Room *room = NULL;
  ProtoMobile *pMobIndex = NULL;
  ProtoObject *pObjIndex = NULL;
  MPROG_DATA *mprog = NULL;
  Exit *xit = NULL;
  ExtraDescription *ed = NULL;
  Affect *paf = NULL;
  Shop *pShop = NULL;
  RepairShop *pRepair = NULL;
  char buf[MAX_STRING_LENGTH];
  FILE *fpout = NULL;
  vnum_t vnum = INVALID_VNUM;
  int val0 = 0, val1 = 0, val2 = 0, val3 = 0, val4 = 0, val5 = 0;
  bool complexmob = false;
  char backup[MAX_STRING_LENGTH];

  sprintf( buf, "Saving %s...", tarea->Filename );
  Log->LogStringPlus( buf, LOG_NORMAL, LEVEL_GREATER );

  sprintf( buf, "%s%s", AREA_DIR, filename.c_str() );
  sprintf( backup, "%s%s.bak", AREA_DIR, filename.c_str() );
  rename( buf, backup );

  if ( ( fpout = fopen( buf, "w" ) ) == NULL )
    {
      Log->Bug( "%s: fopen", __FUNCTION__ );
      perror( filename.c_str() );
      return;
    }

  fprintf( fpout, "#AREA   %s~\n\n\n\n", tarea->Name );

  fprintf( fpout, "#AUTHOR %s~\n\n", tarea->Author );
  fprintf( fpout, "#RANGES\n");
  fprintf( fpout, "%d %d %d %d\n", tarea->LevelRanges.Soft.Low,
           tarea->LevelRanges.Soft.High,
           tarea->LevelRanges.Hard.Low,
           tarea->LevelRanges.Hard.High );
  fprintf( fpout, "$\n\n");

  if ( !IsNullOrEmpty(tarea->ResetMessage ))        /* Rennard */
    fprintf( fpout, "#RESETMSG %s~\n\n", tarea->ResetMessage );

  if ( tarea->ResetFrequency )
    fprintf( fpout, "#FLAGS\n%d %d\n\n",
             tarea->Flags, tarea->ResetFrequency );
  else
    fprintf( fpout, "#FLAGS\n%d\n\n", tarea->Flags );

  fprintf( fpout, "#ECONOMY %d %d\n\n", tarea->HighEconomy, tarea->LowEconomy );

  /* save mobiles */
  fprintf( fpout, "#MOBILES\n" );
  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( install )
        RemoveBit( pMobIndex->Flags, ACT_PROTOTYPE );
      if ( pMobIndex->Stats.PermStr != 13    ||   pMobIndex->Stats.PermInt   != 13
           ||   pMobIndex->Stats.PermWis != 13       ||   pMobIndex->Stats.PermDex   != 13
           ||   pMobIndex->Stats.PermCon != 13       ||   pMobIndex->Stats.PermCha   != 13
           ||   pMobIndex->Stats.PermLck != 13
           ||   pMobIndex->HitRoll  != 0        ||   pMobIndex->DamRoll    != 0
           ||   pMobIndex->Race  != 0
           ||   pMobIndex->AttackFlags       != 0   ||   pMobIndex->DefenseFlags   != 0
           ||   pMobIndex->Height        != 0   ||   pMobIndex->Weight     != 0
           ||   pMobIndex->Speaks        != 0   ||   pMobIndex->Speaking   != 0
           ||   pMobIndex->BodyParts        != 0   ||   pMobIndex->NumberOfAttacks != 0
           ||   pMobIndex->VipFlags !=0 )
        complexmob = true;
      else
        complexmob = false;
      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pMobIndex->Name          );
      fprintf( fpout,   "%s~\n",        pMobIndex->ShortDescr          );
      fprintf( fpout,   "%s~\n",        StripCarriageReturn(pMobIndex->LongDescr) );
      fprintf( fpout, "%s~\n",  StripCarriageReturn(pMobIndex->Description));
      fprintf( fpout, "%d %d %d %c\n",pMobIndex->Flags,
               pMobIndex->AffectedBy,
               pMobIndex->Alignment,
               complexmob ? 'Z' : 'S'           );
      /* C changed to Z for swreality vip_flags  */

      fprintf( fpout, "%d %d %d ",      pMobIndex->Level,
               pMobIndex->MobThac0,
               pMobIndex->ArmorClass                    );
      fprintf( fpout, "%dd%d+%d ",      pMobIndex->HitNoDice,
               pMobIndex->HitSizeDice,
               pMobIndex->HitPlus               );
      fprintf( fpout, "%dd%d+%d\n",     pMobIndex->DamNoDice,
               pMobIndex->DamSizeDice,
               pMobIndex->DamPlus               );
      fprintf( fpout, "%d 0\n", pMobIndex->Gold                 );
      fprintf( fpout, "%d %d %d\n",     pMobIndex->Position,
               pMobIndex->DefaultPosition,
               pMobIndex->Sex                   );
      if ( complexmob )
        {
          fprintf( fpout, "%d %d %d %d %d %d %d\n",
                   pMobIndex->Stats.PermStr,
                   pMobIndex->Stats.PermInt,
                   pMobIndex->Stats.PermWis,
                   pMobIndex->Stats.PermDex,
                   pMobIndex->Stats.PermCon,
                   pMobIndex->Stats.PermCha,
                   pMobIndex->Stats.PermLck );
          fprintf( fpout, "%d %d %d %d %d\n",
                   pMobIndex->Saving.PoisonDeath,
                   pMobIndex->Saving.Wand,
                   pMobIndex->Saving.ParaPetri,
                   pMobIndex->Saving.Breath,
                   pMobIndex->Saving.SpellStaff );
          fprintf( fpout, "%d 0 %d %d %d %d %d\n",
                   pMobIndex->Race,
                   pMobIndex->Height,
                   pMobIndex->Weight,
                   pMobIndex->Speaks,
                   pMobIndex->Speaking,
                   pMobIndex->NumberOfAttacks );
          fprintf( fpout, "%d %d %d %d %d %d %d %d\n",
                   pMobIndex->HitRoll,
                   pMobIndex->DamRoll,
                   pMobIndex->BodyParts,
                   pMobIndex->Resistant,
                   pMobIndex->Immune,
                   pMobIndex->Susceptible,
                   pMobIndex->AttackFlags,
                   pMobIndex->DefenseFlags );
          fprintf( fpout, "%d 0 0 0 0 0 0 0\n",
                   pMobIndex->VipFlags );
        }
      if ( pMobIndex->mprog.mudprogs )
        {
          for ( mprog = pMobIndex->mprog.mudprogs; mprog; mprog = mprog->Next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     MobProgTypeToName( mprog->type ),
                     mprog->arglist, StripCarriageReturn(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->VnumRanges.Mob.Last )
    tarea->VnumRanges.Mob.Last = vnum - 1;

  /* save objects */
  fprintf( fpout, "#OBJECTS\n" );
  for ( vnum = tarea->VnumRanges.Object.First; vnum <= tarea->VnumRanges.Object.Last; vnum++ )
    {
      if ( (pObjIndex = GetProtoObject( vnum )) == NULL )
        continue;

      if ( install )
        RemoveBit( pObjIndex->Flags, ITEM_PROTOTYPE );

      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pObjIndex->Name                 );
      fprintf( fpout, "%s~\n",  pObjIndex->ShortDescr          );
      fprintf( fpout, "%s~\n",  pObjIndex->Description          );
      fprintf( fpout, "%s~\n",  pObjIndex->ActionDescription          );
      if ( pObjIndex->Layers )
        fprintf( fpout, "%d %d %d %d\n",        pObjIndex->ItemType,
                 pObjIndex->Flags,
                 pObjIndex->WearFlags,
                 pObjIndex->Layers      );
      else
        fprintf( fpout, "%d %d %d\n",   pObjIndex->ItemType,
                 pObjIndex->Flags,
                 pObjIndex->WearFlags          );

      val0 = pObjIndex->Value[0];
      val1 = pObjIndex->Value[1];
      val2 = pObjIndex->Value[2];
      val3 = pObjIndex->Value[3];
      val4 = pObjIndex->Value[4];
      val5 = pObjIndex->Value[5];

      switch ( pObjIndex->ItemType )
        {
        case ITEM_PILL:
        case ITEM_POTION:
        case ITEM_SCROLL:
          if ( IS_VALID_SN(val1) )
	    val1 = SkillTable[val1]->Slot;

	  if ( IS_VALID_SN(val2) )
	    val2 = SkillTable[val2]->Slot;

	  if ( IS_VALID_SN(val3) )
	    val3 = SkillTable[val3]->Slot;
          break;
        case ITEM_DEVICE:
          if ( IS_VALID_SN(val3) )
	    val3 = SkillTable[val3]->Slot;
          break;
        case ITEM_SALVE:
          if ( IS_VALID_SN(val4) )
	    val4 = SkillTable[val4]->Slot;

	  if ( IS_VALID_SN(val5) )
	    val5 = SkillTable[val5]->Slot;
          break;

	default:
	  break;
        }
      if ( val4 || val5 )
        fprintf( fpout, "%d %d %d %d %d %d\n",val0,
                 val1,
                 val2,
                 val3,
                 val4,
                 val5 );
      else
        fprintf( fpout, "%d %d %d %d\n",        val0,
                 val1,
                 val2,
                 val3 );

      fprintf( fpout, "%d %d %d\n",     pObjIndex->Weight,
               pObjIndex->Cost,
               pObjIndex->Rent ? pObjIndex->Rent :
               (int) (pObjIndex->Cost / 10)             );

      for ( ed = pObjIndex->FirstExtraDescription; ed; ed = ed->Next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->Keyword, StripCarriageReturn( ed->Description )       );

      for ( paf = pObjIndex->FirstAffect; paf; paf = paf->Next )
        fprintf( fpout, "A\n%d %d\n", paf->Location,
                 ((paf->Location == APPLY_WEAPONSPELL
                   || paf->Location == APPLY_WEARSPELL
                   || paf->Location == APPLY_REMOVESPELL
                   || paf->Location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->Modifier))
                 ? SkillTable[paf->Modifier]->Slot : paf->Modifier             );

      if ( pObjIndex->mprog.mudprogs )
        {
          for ( mprog = pObjIndex->mprog.mudprogs; mprog; mprog = mprog->Next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     MobProgTypeToName( mprog->type ),
                     mprog->arglist, StripCarriageReturn(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }

  fprintf( fpout, "#0\n\n\n" );

  if ( install && vnum < tarea->VnumRanges.Object.Last )
    tarea->VnumRanges.Object.Last = vnum - 1;

  /* save rooms   */
  fprintf( fpout, "#ROOMS\n" );
  for ( vnum = tarea->VnumRanges.Room.First; vnum <= tarea->VnumRanges.Room.Last; vnum++ )
    {
      if ( (room = GetRoom( vnum )) == NULL )
        continue;
      if ( install )
        {
          Character *victim, *vnext;
          Object  *obj, *obj_next;

          /* remove prototype flag from room */
          RemoveBit( room->Flags, ROOM_PROTOTYPE );
          /* purge room of (prototyped) mobiles */
          for ( victim = room->FirstPerson; victim; victim = vnext )
            {
              vnext = victim->NextInRoom;
	      
              if ( IsNpc(victim) )
                ExtractCharacter( victim, true );
            }
          /* purge room of (prototyped) objects */
          for ( obj = room->FirstContent; obj; obj = obj_next )
            {
              obj_next = obj->NextContent;
              ExtractObject( obj );
            }
        }
      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  room->Name                      );
      fprintf( fpout, "%s~\n",  StripCarriageReturn( room->Description )   );
      if ( (room->TeleDelay > 0 && room->TeleVnum > 0) || room->Tunnel > 0 )
        fprintf( fpout, "0 %d %d %d %ld %d\n",   room->Flags,
                 room->Sector,
                 room->TeleDelay,
                 room->TeleVnum,
                 room->Tunnel           );
      else
        fprintf( fpout, "0 %d %d\n", room->Flags, room->Sector );

      for ( xit = room->FirstExit; xit; xit = xit->Next )
        {
          if ( IsBitSet(xit->Flags, EX_PORTAL) ) /* don't fold portals */
            continue;

          fprintf( fpout, "D%d\n",              xit->Direction );
          fprintf( fpout, "%s~\n",              StripCarriageReturn( xit->Description ) );
          fprintf( fpout, "%s~\n",              StripCarriageReturn( xit->Keyword ) );

	  if ( xit->Distance > 1 )
            fprintf( fpout, "%d %ld %ld %d\n",
		     xit->Flags & ~EX_BASHED,
                     xit->Key,
                     xit->Vnum,
                     xit->Distance );
          else
            fprintf( fpout, "%d %ld %ld\n",
		     xit->Flags & ~EX_BASHED,
                     xit->Key,
                     xit->Vnum );
        }

      for ( ed = room->FirstExtraDescription; ed; ed = ed->Next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->Keyword, StripCarriageReturn( ed->Description ));

      if ( room->mprog.mudprogs )
        {
          for ( mprog = room->mprog.mudprogs; mprog; mprog = mprog->Next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     MobProgTypeToName( mprog->type ),
                     mprog->arglist, StripCarriageReturn(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
      fprintf( fpout, "S\n" );
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->VnumRanges.Room.Last )
    tarea->VnumRanges.Room.Last = vnum - 1;

  /* save resets   */
  fprintf( fpout, "#RESETS\n" );
  for ( treset = tarea->FirstReset; treset; treset = treset->Next )
    {
      switch( treset->Command ) /* extra arg1 arg2 arg3 */
        {
        default:  case '*': break;
        case 'm': case 'M':
        case 'o': case 'O':
        case 'p': case 'P':
        case 'e': case 'E':
        case 'd': case 'D':
        case 't': case 'T':
          fprintf( fpout, "%c %d %d %d %d\n", CharToUppercase(treset->Command),
                   treset->MiscData, treset->Arg1, treset->Arg2, treset->Arg3 );
          break;
        case 'g': case 'G':
        case 'r': case 'R':
          fprintf( fpout, "%c %d %d %d\n", CharToUppercase( treset->Command ),
                   treset->MiscData, treset->Arg1, treset->Arg2 );
          break;
        }
    }
  fprintf( fpout, "S\n\n\n" );

  /* save shops */
  fprintf( fpout, "#SHOPS\n" );
  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( (pShop = pMobIndex->Shop) == NULL )
        continue;
      fprintf( fpout, " %ld   %2d %2d %2d %2d %2d   %3d %3d",
               pShop->Keeper,
               pShop->BuyType[0],
               pShop->BuyType[1],
               pShop->BuyType[2],
               pShop->BuyType[3],
               pShop->BuyType[4],
               pShop->ProfitBuy,
               pShop->ProfitSell );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pShop->BusinessHours.Open,
               pShop->BusinessHours.Close,
               pMobIndex->ShortDescr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save repair shops */
  fprintf( fpout, "#REPAIRS\n" );
  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( (pRepair = pMobIndex->RepairShop) == NULL )
        continue;
      fprintf( fpout, " %ld   %2d %2d %2d         %3d %3d",
               pRepair->Keeper,
               pRepair->FixType[0],
               pRepair->FixType[1],
               pRepair->FixType[2],
               pRepair->ProfitFix,
               pRepair->ShopType );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pRepair->BusinessHours.Open,
               pRepair->BusinessHours.Close,
               pMobIndex->ShortDescr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save specials */
  fprintf( fpout, "#SPECIALS\n" );
  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( pMobIndex->spec_fun )
        fprintf( fpout, "M  %ld %s\n",   pMobIndex->Vnum,
                 LookupSpecial( pMobIndex->spec_fun ) );
      if ( pMobIndex->spec_2 )
        fprintf( fpout, "M  %ld %s\n",   pMobIndex->Vnum,
                 LookupSpecial( pMobIndex->spec_2 ) );
    }
  fprintf( fpout, "S\n\n\n" );

  /* END */
  fprintf( fpout, "#$\n" );
  fclose( fpout );
}

void WriteAreaList( void )
{
  Area *tarea = NULL;
  FILE *fpout = fopen( AREA_DIR AREA_LIST, "w" );

  if ( !fpout )
    {
      Log->Bug( "%s: FATAL: cannot open area.lst for writing!\r\n", __FUNCTION__ );
      return;
    }

  for ( tarea = FirstArea; tarea; tarea = tarea->Next )
    fprintf( fpout, "%s\n", tarea->Filename );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void AddResetNested( Area *tarea, Object *obj )
{
  int limit;

  for ( obj = obj->FirstContent; obj; obj = obj->NextContent )
    {
      limit = obj->Prototype->Count;

      if ( limit < 1 )
        limit = 1;

      AddReset( tarea, 'P', 1, obj->Prototype->Vnum, limit,
                 obj->InObject->Prototype->Vnum );

      if ( obj->FirstContent )
        AddResetNested( tarea, obj );
    }
}

/*
 * Parse a reset command string into a reset_data structure
 */
Reset *ParseReset( const Area *tarea, char *argument, const Character *ch )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];
  char letter = '*';
  int extra = 0;
  int value = 0;
  Room *room = nullptr;
  Exit *pexit = nullptr;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg4 );

  int val1 = atoi( arg2 );
  int val2 = atoi( arg3 );
  int val3 = atoi( arg4 );
  
  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo( "Reset commands: mob obj give equip door rand trap hide.\r\n" );
      return NULL;
    }

  if ( !StrCmp( arg1, "hide" ) )
    {
      if ( !IsNullOrEmpty( arg2 ) && !GetProtoObject(val1) )
        {
          ch->Echo( "Reset: HIDE: no such object\r\n" );
          return NULL;
        }
      else
        {
          val1 = 0;
        }
      
      extra = 1;
      val2 = 0;
      val3 = 0;
      letter = 'H';
    }
  else if ( IsNullOrEmpty( arg2 ) )
    {
      ch->Echo( "Reset: not enough arguments.\r\n" );
      return NULL;
    }
  else if ( val1 < MIN_VNUM || val1 > MAX_VNUM )
    {
      ch->Echo( "Reset: value out of range. Must be between %ld and %s.\r\n",
                MIN_VNUM, PunctuateNumber( MAX_VNUM, NULL ) );
      return NULL;
    }
  else if ( !StrCmp( arg1, "mob" ) )
    {
      if ( !GetProtoMobile(val1) )
        {
          ch->Echo( "Reset: MOB: no such mobile\r\n" );
          return NULL;
        }
      
      if ( !GetRoom(val2) )
        {
          ch->Echo( "Reset: MOB: no such room\r\n" );
          return NULL;
        }
      
      if ( val3 < 1 )
        {
          val3 = 1;
        }
      
      letter = 'M';
    }
  else if ( !StrCmp( arg1, "obj" ) )
    {
      if ( !GetProtoObject(val1) )
        {
          ch->Echo( "Reset: OBJ: no such object\r\n" );
          return NULL;
        }
      
      if ( !GetRoom(val2) )
        {
          ch->Echo( "Reset: OBJ: no such room\r\n" );
          return NULL;
        }

      if ( val3 < 1 )
        {
          val3 = 1;
        }
      
      letter = 'O';
    }
  else if ( !StrCmp( arg1, "give" ) )
    {
      if ( !GetProtoObject(val1) )
        {
          ch->Echo( "Reset: GIVE: no such object\r\n" );
          return NULL;
        }

      if ( val2 < 1 )
        {
          val2 = 1;
        }
      
      val3 = val2;
      val2 = 0;
      extra = 1;
      letter = 'G';
    }
  else if ( !StrCmp( arg1, "equip" ) )
    {
      if ( !GetProtoObject(val1) )
        {
          ch->Echo( "Reset: EQUIP: no such object\r\n" );
          return NULL;
        }
      
      if ( !IsNumber(arg3) )
        {
          val2 = GetWearLocation(arg3);
        }
      
      if ( val2 < 0 || val2 >= MAX_WEAR )
        {
          ch->Echo( "Reset: EQUIP: invalid wear location\r\n" );
          return NULL;
        }
      
      if ( val3 < 1 )
        {
          val3 = 1;
        }
      
      extra  = 1;
      letter = 'E';
    }
  else if ( !StrCmp( arg1, "put" ) )
    {
      if ( !GetProtoObject(val1) )
        {
          ch->Echo( "Reset: PUT: no such object\r\n" );
          return NULL;
        }
      
      if ( val2 > 0 && !GetProtoObject(val2) )
        {
          ch->Echo( "Reset: PUT: no such container\r\n" );
          return NULL;
        }
      
      extra = umax(val3, 0);
      argument = OneArgument(argument, arg4);
      val3 = (IsNumber(argument) ? atoi(arg4) : 0);

      if ( val3 < 0 )
        {
          val3 = 0;
        }

      letter = 'P';
    }
  else if ( !StrCmp( arg1, "door" ) )
    {
      if ( (room = GetRoom(val1)) == NULL )
        {
          ch->Echo( "Reset: DOOR: no such room\r\n" );
          return NULL;
        }
      
      if ( val2 < 0 || val2 > 9 )
        {
          ch->Echo( "Reset: DOOR: invalid exit\r\n" );
          return NULL;
        }
      
      if ( (pexit = GetExit(room, (DirectionType)val2)) == NULL
           ||   !IsBitSet( pexit->Flags, EX_ISDOOR ) )
        {
          ch->Echo( "Reset: DOOR: no such door\r\n" );
          return NULL;
        }
      
      if ( val3 < 0 || val3 > 2 )
        {
          ch->Echo( "Reset: DOOR: invalid door state (0 = open, 1 = close, 2 = lock)\r\n" );
          return NULL;
        }
      
      letter = 'D';
      value = val3;
      val3  = val2;
      val2  = value;
    }
  else if ( !StrCmp( arg1, "rand" ) )
    {
      if ( !GetRoom(val1) )
        {
          ch->Echo( "Reset: RAND: no such room\r\n" );
          return NULL;
        }

      if ( val2 < 0 || val2 > 9 )
        {
          ch->Echo( "Reset: RAND: invalid max exit\r\n" );
          return NULL;
        }

      val3 = val2;
      val2 = 0;
      letter = 'R';
    }
  else if ( !StrCmp( arg1, "trap" ) )
    {
      if ( val2 < 1 || val2 > MAX_TRAPTYPE )
        {
          ch->Echo( "Reset: TRAP: invalid trap type\r\n" );
          return NULL;
        }

      if ( val3 < 0 || val3 > 10000 )
        {
          ch->Echo( "Reset: TRAP: invalid trap charges\r\n" );
          return NULL;
        }

      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg4 );
          value = GetTrapFlag( arg4 );

          if ( value >= 0 || value < (int)MAX_BIT )
            {
              SetBit( extra, 1 << value );
            }
          else
            {
              ch->Echo( "Reset: TRAP: bad flag\r\n" );
              return NULL;
            }
        }

      if ( IsBitSet(extra, TRAP_ROOM) && IsBitSet(extra, TRAP_OBJ) )
        {
          ch->Echo( "Reset: TRAP: Must specify room OR object, not both!\r\n" );
          return NULL;
        }

      if ( IsBitSet(extra, TRAP_ROOM) && !GetRoom(val1) )
        {
          ch->Echo( "Reset: TRAP: no such room\r\n" );
          return NULL;
        }

      if ( IsBitSet(extra, TRAP_OBJ)  && val1 > 0 && !GetProtoObject(val1) )
        {
          ch->Echo( "Reset: TRAP: no such object\r\n" );
          return NULL;
        }

      if (!IsBitSet(extra, TRAP_ROOM) && !IsBitSet(extra, TRAP_OBJ) )
        {
          ch->Echo( "Reset: TRAP: Must specify ROOM or OBJECT\r\n" );
          return NULL;
        }

      /* fix order */
      value = val1;
      val1  = val2;
      val2  = value;
      letter = 'T';
    }
  
  if ( letter == '*' )
    return NULL;
  else
    return MakeReset( letter, extra, val1, val3, val2 );
}

void EditMobProg( Character *ch, MPROG_DATA *mprg, int mptype, const std::string &argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;

      if ( mprg->arglist )
	{
	  FreeMemory( mprg->arglist );
	}

      mprg->arglist = CopyString( argument );
    }

  ch->SubState = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;

  if ( !mprg->comlist )
    {
      mprg->comlist = CopyString( "" );
    }

  StartEditing( ch, mprg->comlist );
  SetEditorDescription( ch, "MOBPROG script" );
}

/*
 * RoomProg Support
 */
void EditRoomProg( Character *ch, MPROG_DATA *mprg, int mptype, const std::string &argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;

      if ( mprg->arglist )
	{
	  FreeMemory( mprg->arglist );
	}

      mprg->arglist = CopyString( argument );
    }

  ch->SubState = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;

  if(!mprg->comlist)
    {
      mprg->comlist = CopyString("");
    }

  StartEditing( ch, mprg->comlist );
  SetEditorDescription( ch, "ROOMPROG script" );
}

