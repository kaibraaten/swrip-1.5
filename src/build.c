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

#include <string.h>
#include <ctype.h>
#include "reset.h"
#include "mud.h"
#include "character.h"
#include "editor.h"
#include "skill.h"

bool CanModifyRoom( const Character *ch, const Room *room )
{
  vnum_t vnum = room->Vnum;
  Area *pArea;

  if ( IsNpc( ch ) )
    return false;

  if ( GetTrustLevel( ch ) >= sysdata.level_modify_proto )
    return true;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      SendToCharacter( "You must have an assigned area to modify this room.\r\n", ch );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.FirstRoom && vnum <= pArea->VnumRanges.LastRoom )
    return true;

  SendToCharacter( "That room is not in your allocated range.\r\n", ch );
  return false;
}

bool CanModifyObject( const Character *ch, const Object *obj )
{
  vnum_t vnum = obj->Prototype->vnum;
  Area *pArea;

  if ( IsNpc( ch ) )
    return false;

  if ( GetTrustLevel( ch ) >= sysdata.level_modify_proto )
    return true;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      SendToCharacter( "You must have an assigned area to modify this object.\r\n", ch );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.FirstObject && vnum <= pArea->VnumRanges.LastObject )
    return true;

  SendToCharacter( "That object is not in your allocated range.\r\n", ch );
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
      if ( GetTrustLevel( ch ) >= sysdata.level_modify_proto && GetTrustLevel(ch) >
           GetTrustLevel( mob ) )
	{
	  return true;
	}
      else
	{
	  SendToCharacter( "You can't do that.\r\n", ch );
	}

      return false;
    }

  vnum = mob->Prototype->vnum;

  if ( IsNpc( ch ) )
    {
      return false;
    }

  if ( GetTrustLevel( ch ) >= sysdata.level_modify_proto )
    {
      return true;
    }

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      SendToCharacter( "You must have an assigned area to modify this mobile.\r\n", ch );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.FirstMob && vnum <= pArea->VnumRanges.LastMob )
    {
      return true;
    }

  SendToCharacter( "That mobile is not in your allocated range.\r\n", ch );
  return false;
}

bool CanMedit( const Character *ch, const ProtoMobile *mob )
{
  vnum_t vnum = mob->vnum;
  Area *pArea = NULL;

  if ( IsNpc( ch ) )
    {
      return false;
    }

  if ( GetTrustLevel( ch ) >= LEVEL_GREATER )
    {
      return true;
    }

  if ( !ch->pcdata || !( pArea = ch->pcdata->area ) )
    {
      SendToCharacter( "You must have an assigned area to modify this mobile.\r\n", ch );
      return false;
    }

  if ( vnum >= pArea->VnumRanges.FirstMob
       && vnum <= pArea->VnumRanges.LastMob )
    {
      return true;
    }

  SendToCharacter( "That mobile is not in your allocated range.\r\n", ch );
  return false;
}

void FreeReset( Area *are, Reset *res )
{
  UNLINK( res, are->first_reset, are->last_reset, next, prev );
  FreeMemory( res );
}

void FreeArea( Area *are )
{
  FreeMemory( are->name );
  FreeMemory( are->filename );

  while ( are->first_reset )
    FreeReset( are, are->first_reset );

  FreeMemory( are );
  are = NULL;
}

void AssignAreaTo( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char taf[1024];
  Area *tarea, *tmp;
  bool created = false;

  if ( IsNpc( ch ) )
    return;
  if ( GetTrustLevel( ch ) >= LEVEL_AVATAR
       &&   ch->pcdata->r_range_lo
       &&   ch->pcdata->r_range_hi )
    {
      tarea = ch->pcdata->area;
      sprintf( taf, "%s.are", Capitalize( ch->name ) );
      if ( !tarea )
        {
          for ( tmp = first_build; tmp; tmp = tmp->next )
            if ( !StrCmp( taf, tmp->filename ) )
              {
                tarea = tmp;
                break;
              }
        }
      if ( !tarea )
        {
          sprintf( buf, "Creating area entry for %s", ch->name );
          LogStringPlus( buf, LOG_NORMAL, ch->top_level );
          AllocateMemory( tarea, Area, 1 );
          LINK( tarea, first_build, last_build, next, prev );
          tarea->first_reset    = NULL;
          tarea->last_reset     = NULL;
          sprintf( buf, "{PROTO} %s's area in progress", ch->name );
          tarea->name           = CopyString( buf );
          tarea->filename       = CopyString( taf );
          sprintf( buf2, "%s", ch->name );
          tarea->author         = CopyString( buf2 );
          tarea->age            = 0;
          tarea->nplayer        = 0;

          created = true;
        }
      else
        {
          sprintf( buf, "Updating area entry for %s", ch->name );
          LogStringPlus( buf, LOG_NORMAL, ch->top_level );
        }
      tarea->VnumRanges.FirstRoom = ch->pcdata->r_range_lo;
      tarea->VnumRanges.FirstObject = ch->pcdata->o_range_lo;
      tarea->VnumRanges.FirstMob = ch->pcdata->m_range_lo;
      tarea->VnumRanges.LastRoom  = ch->pcdata->r_range_hi;
      tarea->VnumRanges.LastObject  = ch->pcdata->o_range_hi;
      tarea->VnumRanges.LastMob  = ch->pcdata->m_range_hi;
      ch->pcdata->area  = tarea;
      if ( created )
        SortArea( tarea, true );
    }
}

ExtraDescription *SetRExtra( Room *room, char *keywords )
{
  ExtraDescription *ed;

  for ( ed = room->FirstExtraDescription; ed; ed = ed->next )
    {
      if ( IsName( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      AllocateMemory( ed, ExtraDescription, 1 );
      LINK( ed, room->FirstExtraDescription, room->LastExtraDescription, next, prev );
      ed->keyword       = CopyString( keywords );
      ed->description   = CopyString( "" );
      top_ed++;
    }
  return ed;
}

bool DelRExtra( Room *room, char *keywords )
{
  ExtraDescription *rmed;

  for ( rmed = room->FirstExtraDescription; rmed; rmed = rmed->next )
    {
      if ( IsName( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return false;
  
  UNLINK( rmed, room->FirstExtraDescription, room->LastExtraDescription, next, prev );
  FreeMemory( rmed->keyword );
  FreeMemory( rmed->description );
  FreeMemory( rmed );
  top_ed--;
  return true;
}

ExtraDescription *SetOExtra( Object *obj, char *keywords )
{
  ExtraDescription *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( IsName( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      AllocateMemory( ed, ExtraDescription, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = CopyString( keywords );
      ed->description   = CopyString( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtra( Object *obj, char *keywords )
{
  ExtraDescription *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( IsName( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return false;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  FreeMemory( rmed->keyword );
  FreeMemory( rmed->description );
  FreeMemory( rmed );
  top_ed--;
  return true;
}

ExtraDescription *SetOExtraProto( ProtoObject *obj, char *keywords )
{
  ExtraDescription *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( IsName( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      AllocateMemory( ed, ExtraDescription, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = CopyString( keywords );
      ed->description   = CopyString( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtraProto( ProtoObject *obj, char *keywords )
{
  ExtraDescription *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( IsName( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return false;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  FreeMemory( rmed->keyword );
  FreeMemory( rmed->description );
  FreeMemory( rmed );
  top_ed--;
  return true;
}

void FoldArea( Area *tarea, char *filename, bool install )
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

  sprintf( buf, "Saving %s...", tarea->filename );
  LogStringPlus( buf, LOG_NORMAL, LEVEL_GREATER );

  sprintf( buf, "%s%s", AREA_DIR, filename );
  sprintf( backup, "%s%s.bak", AREA_DIR, filename );
  rename( buf, backup );

  if ( ( fpout = fopen( buf, "w" ) ) == NULL )
    {
      Bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
      return;
    }

  fprintf( fpout, "#AREA   %s~\n\n\n\n", tarea->name );

  fprintf( fpout, "#AUTHOR %s~\n\n", tarea->author );
  fprintf( fpout, "#RANGES\n");
  fprintf( fpout, "%d %d %d %d\n", tarea->LevelRanges.LowSoft,
           tarea->LevelRanges.HighSoft,
           tarea->LevelRanges.LowHard,
           tarea->LevelRanges.HighHard );
  fprintf( fpout, "$\n\n");
  if ( tarea->resetmsg )        /* Rennard */
    fprintf( fpout, "#RESETMSG %s~\n\n", tarea->resetmsg );
  if ( tarea->reset_frequency )
    fprintf( fpout, "#FLAGS\n%d %d\n\n",
             tarea->flags, tarea->reset_frequency );
  else
    fprintf( fpout, "#FLAGS\n%d\n\n", tarea->flags );

  fprintf( fpout, "#ECONOMY %d %d\n\n", tarea->high_economy, tarea->low_economy );

  /* save mobiles */
  fprintf( fpout, "#MOBILES\n" );
  for ( vnum = tarea->VnumRanges.FirstMob; vnum <= tarea->VnumRanges.LastMob; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( install )
        RemoveBit( pMobIndex->act, ACT_PROTOTYPE );
      if ( pMobIndex->stats.perm_str != 13    ||   pMobIndex->stats.perm_int   != 13
           ||   pMobIndex->stats.perm_wis != 13       ||   pMobIndex->stats.perm_dex   != 13
           ||   pMobIndex->stats.perm_con != 13       ||   pMobIndex->stats.perm_cha   != 13
           ||   pMobIndex->stats.perm_lck != 13
           ||   pMobIndex->hitroll  != 0        ||   pMobIndex->damroll    != 0
           ||   pMobIndex->race  != 0
           ||   pMobIndex->attacks       != 0   ||   pMobIndex->defenses   != 0
           ||   pMobIndex->height        != 0   ||   pMobIndex->weight     != 0
           ||   pMobIndex->speaks        != 0   ||   pMobIndex->speaking   != 0
           ||   pMobIndex->xflags        != 0   ||   pMobIndex->numattacks != 0
           ||   pMobIndex->vip_flags !=0 )
        complexmob = true;
      else
        complexmob = false;
      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pMobIndex->name          );
      fprintf( fpout,   "%s~\n",        pMobIndex->short_descr          );
      fprintf( fpout,   "%s~\n",        StripCarriageReturn(pMobIndex->long_descr) );
      fprintf( fpout, "%s~\n",  StripCarriageReturn(pMobIndex->description));
      fprintf( fpout, "%d %d %d %c\n",pMobIndex->act,
               pMobIndex->affected_by,
               pMobIndex->alignment,
               complexmob ? 'Z' : 'S'           );
      /* C changed to Z for swreality vip_flags  */

      fprintf( fpout, "%d %d %d ",      pMobIndex->level,
               pMobIndex->mobthac0,
               pMobIndex->ac                    );
      fprintf( fpout, "%dd%d+%d ",      pMobIndex->hitnodice,
               pMobIndex->hitsizedice,
               pMobIndex->hitplus               );
      fprintf( fpout, "%dd%d+%d\n",     pMobIndex->damnodice,
               pMobIndex->damsizedice,
               pMobIndex->damplus               );
      fprintf( fpout, "%d 0\n", pMobIndex->gold                 );
      fprintf( fpout, "%d %d %d\n",     pMobIndex->position,
               pMobIndex->defposition,
               pMobIndex->sex                   );
      if ( complexmob )
        {
          fprintf( fpout, "%d %d %d %d %d %d %d\n",
                   pMobIndex->stats.perm_str,
                   pMobIndex->stats.perm_int,
                   pMobIndex->stats.perm_wis,
                   pMobIndex->stats.perm_dex,
                   pMobIndex->stats.perm_con,
                   pMobIndex->stats.perm_cha,
                   pMobIndex->stats.perm_lck );
          fprintf( fpout, "%d %d %d %d %d\n",
                   pMobIndex->saving.poison_death,
                   pMobIndex->saving.wand,
                   pMobIndex->saving.para_petri,
                   pMobIndex->saving.breath,
                   pMobIndex->saving.spell_staff );
          fprintf( fpout, "%d 0 %d %d %d %d %d\n",
                   pMobIndex->race,
                   pMobIndex->height,
                   pMobIndex->weight,
                   pMobIndex->speaks,
                   pMobIndex->speaking,
                   pMobIndex->numattacks );
          fprintf( fpout, "%d %d %d %d %d %d %d %d\n",
                   pMobIndex->hitroll,
                   pMobIndex->damroll,
                   pMobIndex->xflags,
                   pMobIndex->resistant,
                   pMobIndex->immune,
                   pMobIndex->susceptible,
                   pMobIndex->attacks,
                   pMobIndex->defenses );
          fprintf( fpout, "%d 0 0 0 0 0 0 0\n",
                   pMobIndex->vip_flags );
        }
      if ( pMobIndex->mprog.mudprogs )
        {
          for ( mprog = pMobIndex->mprog.mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     MobProgTypeToName( mprog->type ),
                     mprog->arglist, StripCarriageReturn(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->VnumRanges.LastMob )
    tarea->VnumRanges.LastMob = vnum - 1;

  /* save objects */
  fprintf( fpout, "#OBJECTS\n" );
  for ( vnum = tarea->VnumRanges.FirstObject; vnum <= tarea->VnumRanges.LastObject; vnum++ )
    {
      if ( (pObjIndex = GetProtoObject( vnum )) == NULL )
        continue;
      if ( install )
        RemoveBit( pObjIndex->extra_flags, ITEM_PROTOTYPE );
      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pObjIndex->name                 );
      fprintf( fpout, "%s~\n",  pObjIndex->short_descr          );
      fprintf( fpout, "%s~\n",  pObjIndex->description          );
      fprintf( fpout, "%s~\n",  pObjIndex->action_desc          );
      if ( pObjIndex->layers )
        fprintf( fpout, "%d %d %d %d\n",        pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags,
                 pObjIndex->layers      );
      else
        fprintf( fpout, "%d %d %d\n",   pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags          );

      val0 = pObjIndex->value[0];
      val1 = pObjIndex->value[1];
      val2 = pObjIndex->value[2];
      val3 = pObjIndex->value[3];
      val4 = pObjIndex->value[4];
      val5 = pObjIndex->value[5];

      switch ( pObjIndex->item_type )
        {
        case ITEM_PILL:
        case ITEM_POTION:
        case ITEM_SCROLL:
          if ( IS_VALID_SN(val1) ) val1 = SkillTable[val1]->Slot;
          if ( IS_VALID_SN(val2) ) val2 = SkillTable[val2]->Slot;
          if ( IS_VALID_SN(val3) ) val3 = SkillTable[val3]->Slot;
          break;
        case ITEM_DEVICE:
          if ( IS_VALID_SN(val3) ) val3 = SkillTable[val3]->Slot;
          break;
        case ITEM_SALVE:
          if ( IS_VALID_SN(val4) ) val4 = SkillTable[val4]->Slot;
          if ( IS_VALID_SN(val5) ) val5 = SkillTable[val5]->Slot;
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

      fprintf( fpout, "%d %d %d\n",     pObjIndex->weight,
               pObjIndex->cost,
               pObjIndex->rent ? pObjIndex->rent :
               (int) (pObjIndex->cost / 10)             );

      for ( ed = pObjIndex->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, StripCarriageReturn( ed->description )       );

      for ( paf = pObjIndex->first_affect; paf; paf = paf->next )
        fprintf( fpout, "A\n%d %d\n", paf->Location,
                 ((paf->Location == APPLY_WEAPONSPELL
                   || paf->Location == APPLY_WEARSPELL
                   || paf->Location == APPLY_REMOVESPELL
                   || paf->Location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->Modifier))
                 ? SkillTable[paf->Modifier]->Slot : paf->Modifier             );

      if ( pObjIndex->mprog.mudprogs )
        {
          for ( mprog = pObjIndex->mprog.mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     MobProgTypeToName( mprog->type ),
                     mprog->arglist, StripCarriageReturn(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->VnumRanges.LastObject )
    tarea->VnumRanges.LastObject = vnum - 1;

  /* save rooms   */
  fprintf( fpout, "#ROOMS\n" );
  for ( vnum = tarea->VnumRanges.FirstRoom; vnum <= tarea->VnumRanges.LastRoom; vnum++ )
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
              vnext = victim->next_in_room;
	      
              if ( IsNpc(victim) )
                ExtractCharacter( victim, true );
            }
          /* purge room of (prototyped) objects */
          for ( obj = room->FirstContent; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
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

      for ( xit = room->FirstExit; xit; xit = xit->next )
        {
          if ( IsBitSet(xit->exit_info, EX_PORTAL) ) /* don't fold portals */
            continue;

          fprintf( fpout, "D%d\n",              xit->vdir );
          fprintf( fpout, "%s~\n",              StripCarriageReturn( xit->description ) );
          fprintf( fpout, "%s~\n",              StripCarriageReturn( xit->keyword ) );

	  if ( xit->distance > 1 )
            fprintf( fpout, "%d %ld %ld %d\n",
		     xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum,
                     xit->distance );
          else
            fprintf( fpout, "%d %ld %ld\n",
		     xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum );
        }

      for ( ed = room->FirstExtraDescription; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, StripCarriageReturn( ed->description ));

      if ( room->mprog.mudprogs )
        {
          for ( mprog = room->mprog.mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     MobProgTypeToName( mprog->type ),
                     mprog->arglist, StripCarriageReturn(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
      fprintf( fpout, "S\n" );
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->VnumRanges.LastRoom )
    tarea->VnumRanges.LastRoom = vnum - 1;

  /* save resets   */
  fprintf( fpout, "#RESETS\n" );
  for ( treset = tarea->first_reset; treset; treset = treset->next )
    {
      switch( treset->command ) /* extra arg1 arg2 arg3 */
        {
        default:  case '*': break;
        case 'm': case 'M':
        case 'o': case 'O':
        case 'p': case 'P':
        case 'e': case 'E':
        case 'd': case 'D':
        case 't': case 'T':
          fprintf( fpout, "%c %d %d %d %d\n", CharToUppercase(treset->command),
                   treset->extra, treset->arg1, treset->arg2, treset->arg3 );
          break;
        case 'g': case 'G':
        case 'r': case 'R':
          fprintf( fpout, "%c %d %d %d\n", CharToUppercase(treset->command),
                   treset->extra, treset->arg1, treset->arg2 );
          break;
        }
    }
  fprintf( fpout, "S\n\n\n" );

  /* save shops */
  fprintf( fpout, "#SHOPS\n" );
  for ( vnum = tarea->VnumRanges.FirstMob; vnum <= tarea->VnumRanges.LastMob; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( (pShop = pMobIndex->pShop) == NULL )
        continue;
      fprintf( fpout, " %ld   %2d %2d %2d %2d %2d   %3d %3d",
               pShop->keeper,
               pShop->buy_type[0],
               pShop->buy_type[1],
               pShop->buy_type[2],
               pShop->buy_type[3],
               pShop->buy_type[4],
               pShop->profit_buy,
               pShop->profit_sell );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pShop->business_hours.open,
               pShop->business_hours.close,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save repair shops */
  fprintf( fpout, "#REPAIRS\n" );
  for ( vnum = tarea->VnumRanges.FirstMob; vnum <= tarea->VnumRanges.LastMob; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( (pRepair = pMobIndex->rShop) == NULL )
        continue;
      fprintf( fpout, " %ld   %2d %2d %2d         %3d %3d",
               pRepair->keeper,
               pRepair->fix_type[0],
               pRepair->fix_type[1],
               pRepair->fix_type[2],
               pRepair->profit_fix,
               pRepair->shop_type );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pRepair->business_hours.open,
               pRepair->business_hours.close,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save specials */
  fprintf( fpout, "#SPECIALS\n" );
  for ( vnum = tarea->VnumRanges.FirstMob; vnum <= tarea->VnumRanges.LastMob; vnum++ )
    {
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;
      if ( pMobIndex->spec_fun )
        fprintf( fpout, "M  %ld %s\n",   pMobIndex->vnum,
                 LookupSpecial( pMobIndex->spec_fun ) );
      if ( pMobIndex->spec_2 )
        fprintf( fpout, "M  %ld %s\n",   pMobIndex->vnum,
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
      Bug( "%s: FATAL: cannot open area.lst for writing!\r\n", __FUNCTION__ );
      return;
    }

  for ( tarea = first_area; tarea; tarea = tarea->next )
    fprintf( fpout, "%s\n", tarea->filename );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void AddResetNested( Area *tarea, Object *obj )
{
  int limit;

  for ( obj = obj->first_content; obj; obj = obj->next_content )
    {
      limit = obj->Prototype->count;

      if ( limit < 1 )
        limit = 1;

      AddReset( tarea, 'P', 1, obj->Prototype->vnum, limit,
                 obj->in_obj->Prototype->vnum );

      if ( obj->first_content )
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
  char letter;
  int extra, val1, val2, val3;
  int value;
  Room *room;
  Exit *pexit;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg4 );
  extra = 0; letter = '*';
  val1 = atoi( arg2 );
  val2 = atoi( arg3 );
  val3 = atoi( arg4 );
  
  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Reset commands: mob obj give equip door rand trap hide.\r\n", ch );
      return NULL;
    }

  if ( !StrCmp( arg1, "hide" ) )
    {
      if ( !IsNullOrEmpty( arg2 ) && !GetProtoObject(val1) )
        {
          SendToCharacter( "Reset: HIDE: no such object\r\n", ch );
          return NULL;
        }
      else
        val1 = 0;
      extra = 1;
      val2 = 0;
      val3 = 0;
      letter = 'H';
    }
  else
    if ( IsNullOrEmpty( arg2 ) )
      {
        SendToCharacter( "Reset: not enough arguments.\r\n", ch );
        return NULL;
      }
    else
      if ( val1 < MIN_VNUM || val1 > MAX_VNUM )
        {
          Echo( ch, "Reset: value out of range. Must be between %ld and %s.\r\n",
		MIN_VNUM, PunctuateNumber( MAX_VNUM, NULL ) );
          return NULL;
        }
      else
        if ( !StrCmp( arg1, "mob" ) )
          {
            if ( !GetProtoMobile(val1) )
              {
                SendToCharacter( "Reset: MOB: no such mobile\r\n", ch );
                return NULL;
              }
            if ( !GetRoom(val2) )
              {
                SendToCharacter( "Reset: MOB: no such room\r\n", ch );
                return NULL;
              }
            if ( val3 < 1 )
              val3 = 1;
            letter = 'M';
          }
        else
          if ( !StrCmp( arg1, "obj" ) )
            {
              if ( !GetProtoObject(val1) )
                {
                  SendToCharacter( "Reset: OBJ: no such object\r\n", ch );
                  return NULL;
                }
              if ( !GetRoom(val2) )
                {
                  SendToCharacter( "Reset: OBJ: no such room\r\n", ch );
                  return NULL;
                }
              if ( val3 < 1 )
                val3 = 1;
              letter = 'O';
            }
          else
            if ( !StrCmp( arg1, "give" ) )
              {
                if ( !GetProtoObject(val1) )
                  {
                    SendToCharacter( "Reset: GIVE: no such object\r\n", ch );
                    return NULL;
                  }
                if ( val2 < 1 )
                  val2 = 1;
                val3 = val2;
                val2 = 0;
                extra = 1;
                letter = 'G';
              }
            else
              if ( !StrCmp( arg1, "equip" ) )
                {
                  if ( !GetProtoObject(val1) )
                    {
                      SendToCharacter( "Reset: EQUIP: no such object\r\n", ch );
                      return NULL;
                    }
                  if ( !IsNumber(arg3) )
                    val2 = GetWearLocation(arg3);
                  if ( val2 < 0 || val2 >= MAX_WEAR )
                    {
                      SendToCharacter( "Reset: EQUIP: invalid wear location\r\n", ch );
                      return NULL;
                    }
                  if ( val3 < 1 )
                    val3 = 1;
                  extra  = 1;
                  letter = 'E';
                }
              else
                if ( !StrCmp( arg1, "put" ) )
                  {
                    if ( !GetProtoObject(val1) )
                      {
                        SendToCharacter( "Reset: PUT: no such object\r\n", ch );
                        return NULL;
                      }
                    if ( val2 > 0 && !GetProtoObject(val2) )
                      {
                        SendToCharacter( "Reset: PUT: no such container\r\n", ch );
                        return NULL;
                      }
                    extra = umax(val3, 0);
                    argument = OneArgument(argument, arg4);
                    val3 = (IsNumber(argument) ? atoi(arg4) : 0);
                    if ( val3 < 0 )
                      val3 = 0;
                    letter = 'P';
                  }
                else
                  if ( !StrCmp( arg1, "door" ) )
                    {
                      if ( (room = GetRoom(val1)) == NULL )
                        {
                          SendToCharacter( "Reset: DOOR: no such room\r\n", ch );
                          return NULL;
                        }
                      if ( val2 < 0 || val2 > 9 )
                        {
                          SendToCharacter( "Reset: DOOR: invalid exit\r\n", ch );
                          return NULL;
                        }
                      if ( (pexit = GetExit(room, (DirectionType)val2)) == NULL
                           ||   !IsBitSet( pexit->exit_info, EX_ISDOOR ) )
                        {
                          SendToCharacter( "Reset: DOOR: no such door\r\n", ch );
                          return NULL;
                        }
                      if ( val3 < 0 || val3 > 2 )
                        {
                          SendToCharacter( "Reset: DOOR: invalid door state (0 = open, 1 = close, 2 = lock)\r\n", ch );
                          return NULL;
                        }
                      letter = 'D';
                      value = val3;
                      val3  = val2;
                      val2  = value;
                    }
                  else
                    if ( !StrCmp( arg1, "rand" ) )
                      {
                        if ( !GetRoom(val1) )
                          {
                            SendToCharacter( "Reset: RAND: no such room\r\n", ch );
                            return NULL;
                          }
                        if ( val2 < 0 || val2 > 9 )
                          {
                            SendToCharacter( "Reset: RAND: invalid max exit\r\n", ch );
                            return NULL;
                          }
                        val3 = val2;
                        val2 = 0;
                        letter = 'R';
                      }
                    else
                      if ( !StrCmp( arg1, "trap" ) )
                        {
                          if ( val2 < 1 || val2 > MAX_TRAPTYPE )
                            {
                              SendToCharacter( "Reset: TRAP: invalid trap type\r\n", ch );
                              return NULL;
                            }
                          if ( val3 < 0 || val3 > 10000 )
                            {
                              SendToCharacter( "Reset: TRAP: invalid trap charges\r\n", ch );
                              return NULL;
                            }

                          while ( !IsNullOrEmpty( argument ) )
                            {
                              argument = OneArgument( argument, arg4 );
                              value = GetTrapFlag( arg4 );

                              if ( value >= 0 || value < MAX_BIT )
				{
				  SetBit( extra, 1 << value );
				}
                              else
                                {
                                  SendToCharacter( "Reset: TRAP: bad flag\r\n", ch );
                                  return NULL;
                                }
                            }
                          if ( IsBitSet(extra, TRAP_ROOM) && IsBitSet(extra, TRAP_OBJ) )
                            {
                              SendToCharacter( "Reset: TRAP: Must specify room OR object, not both!\r\n", ch );
                              return NULL;
                            }
                          if ( IsBitSet(extra, TRAP_ROOM) && !GetRoom(val1) )
                            {
                              SendToCharacter( "Reset: TRAP: no such room\r\n", ch );
                              return NULL;
                            }
                          if ( IsBitSet(extra, TRAP_OBJ)  && val1>0 && !GetProtoObject(val1) )
                            {
                              SendToCharacter( "Reset: TRAP: no such object\r\n", ch );
                              return NULL;
                            }
                          if (!IsBitSet(extra, TRAP_ROOM) && !IsBitSet(extra, TRAP_OBJ) )
                            {
                              SendToCharacter( "Reset: TRAP: Must specify ROOM or OBJECT\r\n", ch );
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

void EditMobProg( Character *ch, MPROG_DATA *mprg, int mptype, char *argument )
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

  ch->substate = SUB_MPROG_EDIT;
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
void EditRoomProg( Character *ch, MPROG_DATA *mprg, int mptype, char *argument )
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

  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;

  if(!mprg->comlist)
    {
      mprg->comlist = CopyString("");
    }

  StartEditing( ch, mprg->comlist );
  SetEditorDescription( ch, "ROOMPROG script" );
}
