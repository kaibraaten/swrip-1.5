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
#include <utility/algorithms.hpp>
#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "skill.hpp"
#include "shop.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "systemdata.hpp"
#include "exit.hpp"

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
  delete res;
}

ExtraDescription *SetRExtra( Room *room, const std::string &keywords )
{
  ExtraDescription *ed = nullptr;
  bool found = false;

  for(auto i = std::begin(room->ExtraDescriptions());
      i != std::end(room->ExtraDescriptions()); ++i)
    {
      ed = *i;
      
      if ( IsName( keywords, ed->Keyword ) )
        {
          found = true;
          break;
        }
    }

  if ( !found )
    {
      ed = new ExtraDescription();
      room->Add(ed);
      ed->Keyword = keywords;
      top_ed++;
    }

  return ed;
}

bool DelRExtra( Room *room, const std::string &keywords )
{
  ExtraDescription *rmed = nullptr;
  bool found = false;

  for(auto i = std::begin(room->ExtraDescriptions());
      i != std::end(room->ExtraDescriptions()); ++i)
    {
      rmed = *i;

      if ( IsName( keywords, rmed->Keyword ) )
        {
          found = true;
          break;
        }
    }
  
  if ( !found )
    return false;

  room->Remove(rmed);
  delete rmed;
  top_ed--;
  return true;
}

ExtraDescription *SetOExtra( Object *obj, const std::string &keywords )
{
  ExtraDescription *ed = Find(obj->ExtraDescriptions(),
                              [keywords](auto descr)
                              {
                                return IsName(keywords, descr->Keyword);
                              });
  if ( ed == nullptr )
    {
      ed = new ExtraDescription();
      obj->Add(ed);
      ed->Keyword = keywords;
      top_ed++;
    }

  return ed;
}

bool DelOExtra( Object *obj, const std::string &keywords )
{
  ExtraDescription *rmed = Find(obj->ExtraDescriptions(),
                                [keywords](auto ed)
                                {
                                  return IsName( keywords, ed->Keyword );
                                });

  if ( rmed == nullptr )
    {
      return false;
    }

  obj->Remove(rmed);
  delete rmed;
  top_ed--;
  return true;
}

ExtraDescription *SetOExtraProto( ProtoObject *obj, const std::string &keywords )
{
  ExtraDescription *ed = Find(obj->ExtraDescriptions(),
                              [keywords](auto extra)
                              {
                                return IsName( keywords, extra->Keyword );
                              });
  if ( ed == nullptr )
    {
      ed = new ExtraDescription();
      obj->Add(ed);
      ed->Keyword = keywords;
      top_ed++;
    }

  return ed;
}

bool DelOExtraProto( ProtoObject *obj, const std::string &keywords )
{
  ExtraDescription *rmed = Find(obj->ExtraDescriptions(),
                                [keywords](auto ed)
                                {
                                  return IsName( keywords, ed->Keyword );
                                });

  if ( rmed == nullptr )
    {
      return false;
    }

  obj->Remove(rmed);
  delete rmed;
  top_ed--;
  return true;
}

void FoldArea( Area *tarea, const std::string &filename, bool install )
{
  const Reset *treset = NULL;
  Room *room = NULL;
  ProtoMobile *pMobIndex = NULL;
  ProtoObject *pObjIndex = NULL;
  const Shop *pShop = NULL;
  const RepairShop *pRepair = NULL;
  char buf[MAX_STRING_LENGTH];
  FILE *fpout = NULL;
  vnum_t vnum = INVALID_VNUM;
  int val0 = 0, val1 = 0, val2 = 0, val3 = 0, val4 = 0, val5 = 0;
  bool complexmob = false;
  char backup[MAX_STRING_LENGTH];

  sprintf( buf, "Saving %s...", tarea->Filename.c_str() );
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

  fprintf( fpout, "#AREA   %s~\n\n\n\n", tarea->Name.c_str() );

  fprintf( fpout, "#AUTHOR %s~\n\n", tarea->Author.c_str() );
  fprintf( fpout, "#RANGES\n");
  fprintf( fpout, "%d %d %d %d\n", tarea->LevelRanges.Soft.Low,
           tarea->LevelRanges.Soft.High,
           tarea->LevelRanges.Hard.Low,
           tarea->LevelRanges.Hard.High );
  fprintf( fpout, "$\n\n");

  if ( !tarea->ResetMessage.empty())        /* Rennard */
    fprintf( fpout, "#RESETMSG %s~\n\n", tarea->ResetMessage.c_str() );

  if ( tarea->ResetFrequency )
    fprintf( fpout, "#FLAGS\n%d %d\n\n",
             static_cast<int>( tarea->Flags.to_ulong() ), tarea->ResetFrequency );
  else
    fprintf( fpout, "#FLAGS\n%d\n\n",
             static_cast<int>( tarea->Flags.to_ulong() ) );

  fprintf( fpout, "#ECONOMY %d %d\n\n", tarea->HighEconomy, tarea->LowEconomy );

  /* save mobiles */
  fprintf( fpout, "#MOBILES\n" );

  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if( vnum == INVALID_VNUM )
        {
          continue;
        }
      
      if ( (pMobIndex = GetProtoMobile( vnum )) == NULL )
        continue;

      if ( install )
        RemoveBit( pMobIndex->Flags, ACT_PROTOTYPE );

      if ( pMobIndex->Stats.Str != 13
           ||   pMobIndex->Stats.Int   != 13
           ||   pMobIndex->Stats.Wis != 13
           ||   pMobIndex->Stats.Dex   != 13
           ||   pMobIndex->Stats.Con != 13       ||   pMobIndex->Stats.Cha   != 13
           ||   pMobIndex->Stats.Lck != 13
           ||   pMobIndex->HitRoll  != 0        ||   pMobIndex->DamRoll    != 0
           ||   pMobIndex->Race  != 0
           ||   pMobIndex->AttackFlags       != 0   ||   pMobIndex->DefenseFlags   != 0
           ||   pMobIndex->Height        != 0   ||   pMobIndex->Weight     != 0
           ||   pMobIndex->Speaks        != 0   ||   pMobIndex->Speaking   != 0
           ||   pMobIndex->NumberOfAttacks != 0
           ||   pMobIndex->VipFlags.any() )
        complexmob = true;
      else
        complexmob = false;
      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pMobIndex->Name.c_str()          );
      fprintf( fpout,   "%s~\n",        pMobIndex->ShortDescr.c_str()          );
      fprintf( fpout,   "%s~\n",        StripCarriageReturn(pMobIndex->LongDescr).c_str() );
      fprintf( fpout, "%s~\n",  StripCarriageReturn(pMobIndex->Description).c_str());
      fprintf( fpout, "%d %d %d %c\n",pMobIndex->Flags,
               pMobIndex->AffectedBy,
               pMobIndex->Alignment,
               complexmob ? 'Z' : 'S'           );
      /* C changed to Z for swreality vip_flags  */

      fprintf( fpout, "%d %d %d ",
               pMobIndex->Level,
               0, //pMobIndex->MobThac0,
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
                   pMobIndex->Stats.Str,
                   pMobIndex->Stats.Int,
                   pMobIndex->Stats.Wis,
                   pMobIndex->Stats.Dex,
                   pMobIndex->Stats.Con,
                   pMobIndex->Stats.Cha,
                   pMobIndex->Stats.Lck );
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
                   0, //pMobIndex->BodyParts,
                   pMobIndex->Resistant,
                   pMobIndex->Immune,
                   pMobIndex->Susceptible,
                   pMobIndex->AttackFlags,
                   pMobIndex->DefenseFlags );
          fprintf( fpout, "%d 0 0 0 0 0 0 0\n",
                   static_cast<int>( pMobIndex->VipFlags.to_ulong() ) );
        }
      
      if ( !pMobIndex->mprog.MudProgs().empty() )
        {
          for(const MPROG_DATA *mprog : pMobIndex->mprog.MudProgs())
            {
              fprintf( fpout, "> %s %s~\n%s~\n",
                       MobProgTypeToName( mprog->type ),
                       mprog->arglist, StripCarriageReturn(mprog->comlist).c_str() );
            }
          
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
      if( vnum == INVALID_VNUM )
        {
          continue;
        }
      
      if ( (pObjIndex = GetProtoObject( vnum )) == NULL )
        continue;

      if ( install )
        RemoveBit( pObjIndex->Flags, ITEM_PROTOTYPE );

      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pObjIndex->Name.c_str()                 );
      fprintf( fpout, "%s~\n",  pObjIndex->ShortDescr.c_str()          );
      fprintf( fpout, "%s~\n",  pObjIndex->Description.c_str()          );
      fprintf( fpout, "%s~\n",  pObjIndex->ActionDescription.c_str()          );

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

      for ( const ExtraDescription *ed : pObjIndex->ExtraDescriptions() )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->Keyword.c_str(), StripCarriageReturn( ed->Description ).c_str() );

      for(const Affect *paf : pObjIndex->Affects())
        fprintf( fpout, "A\n%d %d\n", paf->Location,
                 ((paf->Location == APPLY_WEAPONSPELL
                   || paf->Location == APPLY_WEARSPELL
                   || paf->Location == APPLY_REMOVESPELL
                   || paf->Location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->Modifier))
                 ? SkillTable[paf->Modifier]->Slot : paf->Modifier             );

      if ( !pObjIndex->mprog.MudProgs().empty() )
        {
          for(const MPROG_DATA *mprog : pObjIndex->mprog.MudProgs())
            {
              fprintf( fpout, "> %s %s~\n%s~\n",
                       MobProgTypeToName( mprog->type ),
                       mprog->arglist, StripCarriageReturn(mprog->comlist).c_str() );
            }
          
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
      if( vnum == INVALID_VNUM )
        {
          continue;
        }
      
      if ( (room = GetRoom( vnum )) == NULL )
        continue;

      if ( install )
        {
          /* remove prototype flag from room */
          room->Flags.reset( Flag::Room::Prototype );
          
          /* purge room of (prototyped) mobiles */
          std::list<Character*> charactersToExtract = Filter(room->Characters(),
                                                             [](auto victim)
                                                             {
                                                               return IsNpc(victim);
                                                             });
          
          for(Character *victim : charactersToExtract)
            {
              ExtractCharacter( victim, true );
            }

          /* purge room of (prototyped) objects */
          std::list<Object*> objectsToExtract(room->Objects());

          for(Object *obj : objectsToExtract)
            {
              ExtractObject( obj );
            }
        }
      fprintf( fpout, "#%ld\n",  vnum                            );
      fprintf( fpout, "%s~\n",  room->Name.c_str()                      );
      fprintf( fpout, "%s~\n",  StripCarriageReturn( room->Description ).c_str()   );
      if ( (room->TeleDelay > 0 && room->TeleVnum > 0) || room->Tunnel > 0 )
        fprintf( fpout, "0 %d %d %d %ld %d\n", static_cast<int>(room->Flags.to_ulong()),
                 room->Sector,
                 room->TeleDelay,
                 room->TeleVnum,
                 room->Tunnel           );
      else
        fprintf( fpout, "0 %d %d\n", static_cast<int>(room->Flags.to_ulong()), room->Sector );

      for(const Exit *xit : room->Exits())
        {
          if ( xit->Flags.test( Flag::Exit::Portal ) ) /* don't fold portals */
            {
              continue;
            }
          
          fprintf( fpout, "D%d\n", xit->Direction );
          fprintf( fpout, "%s~\n", StripCarriageReturn( xit->Description ).c_str() );
          fprintf( fpout, "%s~\n", StripCarriageReturn( xit->Keyword ).c_str() );

          std::bitset<Flag::MAX> flags = xit->Flags;
          flags.reset( Flag::Exit::Bashed );
          
	  if ( xit->Distance > 1 )
            fprintf( fpout, "%d %ld %ld %d\n",
		     static_cast<int>(xit->Flags.to_ulong()),
                     xit->Key,
                     xit->Vnum,
                     xit->Distance );
          else
            fprintf( fpout, "%d %ld %ld\n",
		     static_cast<int>(xit->Flags.to_ulong()),
                     xit->Key,
                     xit->Vnum );
        }

      for(const ExtraDescription *ed : room->ExtraDescriptions())
        {
          fprintf( fpout, "E\n%s~\n%s~\n",
                   ed->Keyword.c_str(), StripCarriageReturn( ed->Description ).c_str());
        }
      
      if ( !room->mprog.MudProgs().empty() )
        {
          for(const MPROG_DATA *mprog : room->mprog.MudProgs())
            {
              fprintf( fpout, "> %s %s~\n%s~\n",
                       MobProgTypeToName( mprog->type ),
                       mprog->arglist, StripCarriageReturn(mprog->comlist).c_str() );
            }
          
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
      if( vnum == INVALID_VNUM )
        {
          continue;
        }
      
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
               pMobIndex->ShortDescr.c_str() );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save repair shops */
  fprintf( fpout, "#REPAIRS\n" );
  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if( vnum == INVALID_VNUM )
        {
          continue;
        }
      
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
               pMobIndex->ShortDescr.c_str() );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save specials */
  fprintf( fpout, "#SPECIALS\n" );
  for ( vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++ )
    {
      if( vnum == INVALID_VNUM )
        {
          continue;
        }
      
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
    fprintf( fpout, "%s\n", tarea->Filename.c_str() );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void AddResetNested( Area *tarea, Object *root )
{
  for(Object *obj : root->Objects())
    {
      int limit = obj->Prototype->Count;

      if ( limit < 1 )
        {
          limit = 1;
        }
      
      AddReset( tarea, 'P', 1, obj->Prototype->Vnum, limit,
                obj->InObject->Prototype->Vnum );

      if ( !obj->Objects().empty() )
        {
          AddResetNested( tarea, obj );
        }
    }
}

/*
 * Parse a reset command string into a reset_data structure
 */
Reset *ParseReset( const Area *tarea, std::string argument, const Character *ch )
{
  std::string arg1;
  std::string arg2;
  std::string arg3;
  std::string arg4;
  char letter = '*';
  int extra = 0;
  int value = 0;
  Room *room = nullptr;
  Exit *pexit = nullptr;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg4 );

  int val1 = strtol( arg2.c_str(), nullptr, 10 );
  int val2 = strtol( arg3.c_str(), nullptr, 10 );
  int val3 = strtol( arg4.c_str(), nullptr, 10 );
    
  if ( arg1.empty() )
    {
      ch->Echo( "Reset commands: mob obj give equip door rand trap hide.\r\n" );
      return NULL;
    }

  if ( !StrCmp( arg1, "hide" ) )
    {
      if ( !arg2.empty() && !GetProtoObject(val1) )
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
  else if ( arg2.empty() )
    {
      ch->Echo( "Reset: not enough arguments.\r\n" );
      return NULL;
    }
  else if ( val1 < MIN_VNUM || val1 > MAX_VNUM )
    {
      ch->Echo( "Reset: value out of range. Must be between %d and %s.\r\n",
                MIN_VNUM, PunctuateNumber( MAX_VNUM ).c_str() );
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
      val3 = (IsNumber(argument) ? strtol( arg4.c_str(), nullptr, 10 ) : 0);

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
      
      if ( val2 < DIR_NORTH || val2 > DIR_SOUTHWEST )
        {
          ch->Echo( "Reset: DOOR: invalid exit\r\n" );
          return NULL;
        }
      
      if ( (pexit = GetExit(room, (DirectionType)val2)) == NULL
           || !pexit->Flags.test( Flag::Exit::IsDoor ) )
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

      if ( val2 < DIR_NORTH || val2 > DIR_SOUTHWEST )
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

      while ( !argument.empty() )
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
