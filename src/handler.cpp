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
#include <cassert>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "track.hpp"
#include "skill.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "playerrepository.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "exit.hpp"

extern Character *gch_prev;
extern Object *gobj_prev;

Character *cur_char = NULL;
Room *cur_room = NULL;
bool cur_char_died = false;
ch_ret global_retcode = rNONE;

int cur_obj = 0;
int cur_obj_serial = 0;
bool cur_obj_extracted = false;
obj_ret global_objcode = rNONE;

static Object *GroupObject( Object *obj1, Object *obj2 );

static void ExplodeRoom( Object *obj , Character *xch, Room *room );
static void ExplodeRoom_1( Object *obj , Character *xch, Room *room , int blast );
static void ExplodeRoom_2( Room *room , int blast );

void Explode( Object *obj )
{
  if ( !obj->ArmedBy.empty() )
    {
      Room *room = NULL;
      Character *xch = NULL;
      bool held = false;
      Object *objcont = obj;

      while ( objcont->InObject && !obj->CarriedBy )
	{
	  objcont = objcont->InObject;
	}

      for ( xch = FirstCharacter; xch; xch = xch->Next )
	{
	  if ( !IsNpc( xch ) && NiftyIsName( obj->ArmedBy, xch->Name ) )
	    {
	      if ( objcont->CarriedBy )
		{
		  Act( AT_WHITE, "$p EXPLODES in $n's hands!",
		       objcont->CarriedBy, obj, NULL, TO_ROOM );
		  Act( AT_WHITE, "$p EXPLODES in your hands!",
		       objcont->CarriedBy, obj, NULL, TO_CHAR );
		  room = xch->InRoom;
		  held = true;
		}
	      else if ( objcont->InRoom )
		{
		  room = objcont->InRoom;
		}
	      else
		{
		  room = NULL;
		}

	      if ( room )
		{
		  if ( !held && !room->Characters().empty())
		    {
                      Character *ch = room->Characters().front();
		      Act( AT_WHITE, "$p EXPLODES!", ch, obj, NULL, TO_ROOM );
		    }

		  ExplodeRoom( obj , xch, room );
		}
	    }
	}
    }

  MakeScraps(obj);
}

void ExplodeRoom( Object *obj, Character *xch, Room *room )
{
  int blast = (int) (obj->Value[OVAL_EXPLOSIVE_MAX_DMG] / 500) ;

  ExplodeRoom_1( obj , xch, room , blast );
  ExplodeRoom_2( room , blast );
}

void ExplodeRoom_1( Object *obj, Character *xch, Room *room, int blast )
{
  if ( IsBitSet( room->Flags, BFS_MARK ) )
    return;

  SetBit( room->Flags , BFS_MARK );

  std::list<Character*> copyOfCharacterList(room->Characters());

  for(Character *rch : copyOfCharacterList)
    {
      Act( AT_WHITE, "The shockwave from a massive explosion rips through your body!",
	   room->Characters().front(), obj, NULL, TO_ROOM );
      int dam = GetRandomNumberFromRange ( obj->Value[OVAL_EXPLOSIVE_MIN_DMG] , obj->Value[OVAL_EXPLOSIVE_MAX_DMG] );
      InflictDamage( rch, rch , dam, TYPE_UNDEFINED );

      if ( !CharacterDiedRecently(rch) )
        {
          if ( IsNpc( rch ) )
            {
              if ( IsBitSet( rch->Flags , ACT_SENTINEL ) )
                {
                  rch->WasSentinel = rch->InRoom;
                  RemoveBit( rch->Flags, ACT_SENTINEL );
                }

              StartHating( rch , xch );
              StartHunting( rch , xch );
            }
        }
    }

  std::list<Object*> objectsToScrap = Filter(room->Objects(),
                                             [obj](auto robj)
                                             {
                                               return robj != obj
                                                 && robj->ItemType != ITEM_SPACECRAFT
                                                 && robj->ItemType != ITEM_SCRAPS
                                                 && robj->ItemType != ITEM_CORPSE_NPC
                                                 && robj->ItemType != ITEM_CORPSE_PC
                                                 && robj->ItemType != ITEM_DROID_CORPSE;
                                             });

  for(Object *robj : objectsToScrap)
    {
      MakeScraps( robj );
    }

  /* other rooms */
  for(const Exit *pexit : room->Exits())
    {
      if ( pexit->ToRoom
	   && pexit->ToRoom != room )
	{
	  if ( blast > 0 )
	    {
	      int roomblast = blast - 1;
	      ExplodeRoom_1( obj , xch, pexit->ToRoom , roomblast );
	    }
	  else
	    {
	      EchoToRoom( AT_WHITE, pexit->ToRoom,
			  "You hear a loud EXPLOSION not to far from here." );
	    }
	}
    }
}

void ExplodeRoom_2( Room *room , int blast )
{
  if ( !IsBitSet( room->Flags, BFS_MARK ) )
    {
      return;
    }

  RemoveBit( room->Flags , BFS_MARK );

  if ( blast > 0 )
    {
      for(const Exit *pexit : room->Exits())
        {
          if ( pexit->ToRoom && pexit->ToRoom != room )
            {
              int roomblast = blast - 1;
              ExplodeRoom_2( pexit->ToRoom , roomblast );
            }
        }
    }
}

/*                                                              -Thoric
 * Return how much experience is required for ch to get to a certain level
 */
long GetRequiredXpForLevel( short level )
{
  long lvl = umax(0, level - 1);

  return lvl * lvl * 500;
}

/*
 * See if a player/mob can take a piece of prototype eq         -Thoric
 */
bool CharacterCanTakePrototype( const Character *ch )
{
  if ( IsImmortal(ch) )
    return true;
  else if ( IsNpc(ch) && IsBitSet(ch->Flags, ACT_PROTOTYPE) )
    return true;
  else
    return false;
}

static void ApplySkillAffect( Character *ch, int sn, int mod )
{
  if ( !IsNpc(ch) && ch->PCData->Learned[sn] > 0 )
    {
      ch->PCData->Learned[sn] =
	( ch->PCData->Learned[sn] >= 100 ? 100 : urange( 1, ch->PCData->Learned[sn] + mod, 100 ) );
    }
}
/*
 * Apply or remove an affect to a character.
 */
void ModifyAffect( Character *ch, Affect *paf, bool fAdd )
{
  Object *wield = NULL;
  int mod = paf->Modifier;
  Skill *skill = NULL;
  ch_ret retcode = rNONE;

  if ( fAdd )
    {
      SetBit( ch->AffectedBy, paf->AffectedBy );
    }
  else
    {
      RemoveBit( ch->AffectedBy, paf->AffectedBy );

      /*
       * might be an idea to have a duration removespell which returns
       * the spell after the duration... but would have to store
       * the removed spell's information somewhere...           -Thoric
       */
      if ( (paf->Location % REVERSE_APPLY) == APPLY_REMOVESPELL )
	{
	  return;
	}

      switch( paf->Location % REVERSE_APPLY )
        {
        case APPLY_AFFECT:
	  RemoveBit( ch->AffectedBy, mod );
	  return;

        case APPLY_RESISTANT:
	  RemoveBit( ch->Resistant, mod );
	  return;

        case APPLY_IMMUNE:
	  RemoveBit( ch->Immune, mod );
	  return;

        case APPLY_SUSCEPTIBLE:
	  RemoveBit( ch->Susceptible, mod );
	  return;

        case APPLY_WEARSPELL:
	  /* affect only on wear */
	  return;

        case APPLY_REMOVE:
          SetBit( ch->AffectedBy, mod );
	  return;
        }

      mod = 0 - mod;
    }

  switch ( paf->Location % REVERSE_APPLY )
    {
    default:
      Log->Bug( "%s: unknown location %d.", __FUNCTION__, paf->Location );
      return;

    case APPLY_NONE:
      break;

    case APPLY_STR:
      ch->Stats.ModStr += mod;
      break;

    case APPLY_DEX:
      ch->Stats.ModDex += mod;
      break;

    case APPLY_INT:
      ch->Stats.ModInt += mod;
      break;

    case APPLY_WIS:
      ch->Stats.ModWis += mod;
      break;

    case APPLY_CON:
      ch->Stats.ModCon += mod;
      break;

    case APPLY_CHA:
      ch->Stats.ModCha += mod;
      break;

    case APPLY_LCK:
      ch->Stats.ModLck += mod;
      break;

    case APPLY_SEX:
      ch->Sex = (SexType)((ch->Sex + mod) % 3);

      if ( ch->Sex < SEX_NEUTRAL )
	{
	  ch->Sex = (SexType)((int)ch->Sex + 2);
	}

      ch->Sex = (SexType)urange( SEX_NEUTRAL, ch->Sex, SEX_FEMALE );
      break;

    case APPLY_LEVEL:
      break;

    case APPLY_AGE:
      break;

    case APPLY_HEIGHT:
      ch->Height += mod;
      break;

    case APPLY_WEIGHT:
      ch->Weight += mod;
      break;

    case APPLY_MANA:
      ch->MaxMana += mod;
      break;

    case APPLY_HIT:
      ch->MaxHit += mod;
      break;

    case APPLY_MOVE:
      ch->MaxMove += mod;
      break;

    case APPLY_GOLD:
      break;

    case APPLY_EXP:
      break;

    case APPLY_AC:
      ch->ArmorClass += mod;
      break;

    case APPLY_HITROLL:
      ch->HitRoll += mod;
      break;

    case APPLY_DAMROLL:
      ch->DamRoll += mod;
      break;

    case APPLY_SAVING_POISON:
      ch->Saving.PoisonDeath += mod;
      break;

    case APPLY_SAVING_ROD:
      ch->Saving.Wand += mod;
      break;

    case APPLY_SAVING_PARA:
      ch->Saving.ParaPetri += mod;
      break;

    case APPLY_SAVING_BREATH:
      ch->Saving.Breath += mod;
      break;

    case APPLY_SAVING_SPELL:
      ch->Saving.SpellStaff += mod;
      break;

    case APPLY_AFFECT:
      SetBit( ch->AffectedBy, mod );
      break;

    case APPLY_RESISTANT:
      SetBit( ch->Resistant, mod );
      break;

    case APPLY_IMMUNE:
      SetBit( ch->Immune, mod );
      break;

    case APPLY_SUSCEPTIBLE:
      SetBit( ch->Susceptible, mod );
      break;

    case APPLY_WEAPONSPELL:
      /* see fight.c */
      break;

    case APPLY_REMOVE:
      RemoveBit(ch->AffectedBy, mod);
      break;

    case APPLY_FULL:
      if ( !IsNpc(ch) )
	{
	  ch->PCData->Condition[COND_FULL] = urange( 0, ch->PCData->Condition[COND_FULL] + mod, 48 );
	}
      break;

    case APPLY_THIRST:
      if ( !IsNpc(ch) )
	{
	  ch->PCData->Condition[COND_THIRST] = urange( 0, ch->PCData->Condition[COND_THIRST] + mod, 48 );
	}
      break;

    case APPLY_DRUNK:
      if ( !IsNpc(ch) )
	{
	  ch->PCData->Condition[COND_DRUNK] = urange( 0, ch->PCData->Condition[COND_DRUNK] + mod, 48 );
	}
      break;

    case APPLY_MENTALSTATE:
      ch->MentalState = urange(-100, ch->MentalState + mod, 100);
      break;

    case APPLY_EMOTION:
      ch->EmotionalState = urange(-100, ch->EmotionalState + mod, 100);
      break;

    case APPLY_STRIPSN:
      if ( IS_VALID_SN(mod) )
	{
	  StripAffect( ch, mod );
	}
      else
	{
	  Log->Bug( "%s: APPLY_STRIPSN invalid sn %d", __FUNCTION__, mod );
	}
      break;

      /* spell cast upon wear/removal of an object      -Thoric */
    case APPLY_WEARSPELL:
    case APPLY_REMOVESPELL:
      if ( IsBitSet(ch->InRoom->Flags, ROOM_NO_MAGIC)
           || IsBitSet(ch->Immune, RIS_MAGIC)
           || saving_char == ch               /* so save/quit doesn't trigger */
           || loading_char == ch )    /* so loading doesn't trigger */
	{
	  return;
	}

      mod = abs(mod);

      if ( IS_VALID_SN(mod)
           && (skill = SkillTable[mod]) != NULL
           && skill->Type == SKILL_SPELL )
	{
	  if ( (retcode=skill->SpellFunction( mod, GetAbilityLevel( ch, FORCE_ABILITY ), ch, ch ) )
	       == rCHAR_DIED || CharacterDiedRecently(ch) )
	    {
	      return;
	    }
	}

      break;

      /* skill apply types      -Thoric */

    case APPLY_PALM:
      /* not implemented yet */
      break;

    case APPLY_TRACK:
      ApplySkillAffect( ch, gsn_track, mod );
      break;

    case APPLY_HIDE:
      ApplySkillAffect( ch, gsn_hide, mod );
      break;

    case APPLY_STEAL:
      ApplySkillAffect( ch, gsn_steal, mod );
      break;

    case APPLY_SNEAK:
      ApplySkillAffect( ch, gsn_sneak, mod );
      break;

    case APPLY_PICK:
      ApplySkillAffect( ch, gsn_pick_lock, mod );
      break;

    case APPLY_BACKSTAB:
      ApplySkillAffect( ch, gsn_backstab, mod );
      break;

    case APPLY_DETRAP:
      ApplySkillAffect( ch, gsn_detrap, mod );
      break;

    case APPLY_DODGE:
      ApplySkillAffect( ch, gsn_dodge, mod );
      break;

    case APPLY_PEEK:
      ApplySkillAffect( ch, gsn_peek, mod );
      break;

    case APPLY_SCAN:
      ApplySkillAffect( ch, gsn_scan, mod );
      break;

    case APPLY_GOUGE:
      ApplySkillAffect( ch, gsn_gouge, mod );
      break;

    case APPLY_SEARCH:
      ApplySkillAffect( ch, gsn_search, mod );
      break;

    case APPLY_DIG:
      ApplySkillAffect( ch, gsn_dig, mod );
      break;

    case APPLY_MOUNT:
      ApplySkillAffect( ch, gsn_mount, mod );
      break;

    case APPLY_DISARM:
      ApplySkillAffect( ch, gsn_disarm, mod );
      break;

    case APPLY_KICK:
      ApplySkillAffect( ch, gsn_kick, mod );
      break;

    case APPLY_PARRY:
      ApplySkillAffect( ch, gsn_parry, mod );
      break;

    case APPLY_BASH:
      ApplySkillAffect( ch, gsn_bash, mod );
      break;

    case APPLY_STUN:
      ApplySkillAffect( ch, gsn_stun, mod );
      break;

    case APPLY_PUNCH:
      ApplySkillAffect( ch, gsn_punch, mod );
      break;

    case APPLY_CLIMB:
      ApplySkillAffect( ch, gsn_climb, mod );
      break;

    case APPLY_GRIP:
      ApplySkillAffect( ch, gsn_grip, mod );
      break;

    case APPLY_SNIPE:
      ApplySkillAffect( ch, gsn_snipe, mod );
      break;
    }

  /*
   * Check for weapon wielding.
   * Guard against recursion (for weapons with affects).
   */
  if ( !IsNpc( ch )
       && saving_char != ch
       && ( wield = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) != NULL
       && GetObjectWeight(wield) > StrengthBonus[GetCurrentStrength(ch)].Wield )
    {
      static int depth;

      if ( depth == 0 )
        {
          depth++;
          Act( AT_ACTION, "You are too weak to wield $p any longer.",
               ch, wield, NULL, TO_CHAR );
          Act( AT_ACTION, "$n stops wielding $p.", ch, wield, NULL, TO_ROOM );
          UnequipCharacter( ch, wield );
          depth--;
        }
    }
}

/*
 * Give an affect to a char.
 */
void AffectToCharacter( Character *ch, Affect *paf )
{
  assert(ch != nullptr);
  assert(paf != nullptr);

  Affect *paf_new = new Affect();

  ch->Add(paf_new);
  paf_new->Type        = paf->Type;
  paf_new->Duration    = paf->Duration;
  paf_new->Location    = paf->Location;
  paf_new->Modifier    = paf->Modifier;
  paf_new->AffectedBy  = paf->AffectedBy;

  ModifyAffect( ch, paf_new, true );
}

/*
 * Remove an affect from a char.
 */
void RemoveAffect( Character *ch, Affect *paf )
{
  if ( ch->Affects().empty() )
    {
      Log->Bug( "%s: no affect.", __FUNCTION__ );
      return;
    }

  ModifyAffect( ch, paf, false );
  ch->Remove(paf);
  delete paf;
}

/*
 * Strip all affects of a given sn.
 */
void StripAffect( Character *ch, int sn )
{
  std::list<Affect*> affectsToRemove = Filter(ch->Affects(),
                                              [sn](const auto affect)
                                              {
                                                return affect->Type == sn;
                                              });

  for(Affect *affect : affectsToRemove)
    {
      RemoveAffect( ch, affect );
    }
}

/*
 * Add or enhance an affect.
 * Limitations put in place by Thoric, they may be high... but at least
 * they're there :)
 */
void JoinAffect( Character *ch, Affect *paf )
{
  for(Affect *paf_old : ch->Affects())
    {
      if ( paf_old->Type == paf->Type )
	{
	  paf->Duration = umin( 1000000, paf->Duration + paf_old->Duration );

	  if ( paf->Modifier )
	    {
	      paf->Modifier = umin( 5000, paf->Modifier + paf_old->Modifier );
	    }
	  else
	    {
	      paf->Modifier = paf_old->Modifier;
	    }

	  RemoveAffect( ch, paf_old );
	  break;
	}
    }

  AffectToCharacter( ch, paf );
}

/*
 * Move a char out of a room.
 */
void CharacterFromRoom( Character *ch )
{
  assert(ch != nullptr);
  assert(ch->InRoom != nullptr);

  Object *obj = nullptr;

  if ( !IsNpc(ch) )
    {
      --ch->InRoom->Area->NumberOfPlayers;
    }

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_LIGHT ) ) != NULL
       && obj->ItemType == ITEM_LIGHT
       && obj->Value[OVAL_LIGHT_POWER] != 0
       && ch->InRoom->Light > 0 )
    {
      --ch->InRoom->Light;
    }

  ch->InRoom->Remove(ch);

  if ( !IsNpc(ch)
       && GetTimer( ch, TIMER_SHOVEDRAG ) > 0 )
    RemoveTimer( ch, TIMER_SHOVEDRAG );
}

/*
 * Move a char into a room.
 */
void CharacterToRoom( Character *ch, Room *pRoomIndex )
{
  assert(ch != nullptr);
  assert(pRoomIndex != nullptr);
  Object *obj = nullptr;

  pRoomIndex->Add(ch);

  if ( !IsNpc(ch) )
    if ( ++ch->InRoom->Area->NumberOfPlayers > ch->InRoom->Area->MaxPlayers )
      ch->InRoom->Area->MaxPlayers = ch->InRoom->Area->NumberOfPlayers;

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_LIGHT ) ) != NULL
       &&   obj->ItemType == ITEM_LIGHT
       &&   obj->Value[OVAL_LIGHT_POWER] != 0 )
    ++ch->InRoom->Light;

  if ( !IsNpc(ch)
       &&    IsBitSet(ch->InRoom->Flags, ROOM_SAFE)
       &&    GetTimer(ch, TIMER_SHOVEDRAG) <= 0 )
    AddTimerToCharacter( ch, TIMER_SHOVEDRAG, 10, NULL, SUB_NONE );  /*-30 Seconds-*/

  /*
   * Delayed Teleport rooms                                     -Thoric
   * Should be the last thing checked in this function
   */
  if ( IsBitSet( ch->InRoom->Flags, ROOM_TELEPORT )
       &&        ch->InRoom->TeleDelay > 0 )
    {
      for ( const TeleportData *tele = FirstTeleport; tele; tele = tele->Next )
        if ( tele->FromRoom == pRoomIndex )
          return;

      TeleportData *tele = new TeleportData();
      LINK( tele, FirstTeleport, LastTeleport, Next, Previous );
      tele->FromRoom                = pRoomIndex;
      tele->TeleportTimer               = pRoomIndex->TeleDelay;
    }
}

/*
 * Give an obj to a char.
 */
Object *ObjectToCharacter( Object *obj, Character *ch )
{
  Object *oret = obj;
  bool skipgroup = false, grouped = false;
  int oweight = GetObjectWeight( obj );
  int onum = GetObjectCount( obj );
  int wear_loc = obj->WearLoc;
  int Flags = obj->Flags;

  if (IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      if (!IsImmortal( ch )
          && (IsNpc(ch) && !IsBitSet(ch->Flags, ACT_PROTOTYPE)) )
	{
	  return ObjectToRoom( obj, ch->InRoom );
	}
    }

  if ( loading_char == ch )
    {
      int x = 0;

      for ( x = 0; x < MAX_WEAR; x++ )
	{
	  int y = 0;

	  for ( y = 0; y < MAX_LAYERS; y++ )
	    {
	      if ( save_equipment[x][y] == obj )
		{
		  skipgroup = true;
		  break;
		}
	    }
	}
    }

  if ( !skipgroup )
    {
      for(Object *otmp : ch->Objects())
	{
          oret = GroupObject(otmp, obj);
          
	  if ( oret == otmp )
	    {
	      grouped = true;
	      break;
	    }
	}
    }

  if ( !grouped )
    {
      ch->Add(obj);
      obj->CarriedBy                   = ch;
      obj->InRoom                      = NULL;
      obj->InObject                       = NULL;
    }

  if (wear_loc == WEAR_NONE)
    {
      ch->CarryNumber  += onum;
      ch->CarryWeight  += oweight;
    }
  else if ( !IsBitSet(Flags, ITEM_MAGIC) && wear_loc != WEAR_FLOATING )
    {
      ch->CarryWeight  += oweight;
    }

  return (oret ? oret : obj);
}

/*
 * Take an obj from its character.
 */
void ObjectFromCharacter( Object *obj )
{
  Character *ch = obj->CarriedBy;
  assert(ch != nullptr);

  if ( obj->WearLoc != WEAR_NONE )
    UnequipCharacter( ch, obj );

  /* obj may drop during unequip... */
  if ( !obj->CarriedBy )
    return;

  ch->Remove(obj);

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) && !obj->Objects().empty() )
    EmptyObjectContents( obj, NULL, NULL );

  obj->InRoom   = NULL;
  obj->CarriedBy        = NULL;
  ch->CarryNumber      -= GetObjectCount( obj );
  ch->CarryWeight      -= GetObjectWeight( obj );
}

int CountCharactersOnObject(const Object *obj)
{
  if (obj->InRoom == NULL)
    {
      return 0;
    }
  
  const std::list<Character*> &people = obj->InRoom->Characters();
  int count = count_if(std::begin(people), std::end(people),
                       [obj](auto fch)
                       {
                         return fch->On == obj;
                       });

  return count;
}

/*
 * Find the ac value of an obj, including position effect.
 */
int GetObjectArmorClass( const Object *obj, int iWear )
{
  if ( obj->ItemType != ITEM_ARMOR )
    return 0;

  switch ( iWear )
    {
    case WEAR_BODY:
      return 3 * obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_HEAD:
      return 2 * obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_LEGS:
      return 2 * obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_FEET:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_HANDS:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_ARMS:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_SHIELD:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_FINGER_L:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_FINGER_R:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_NECK_1:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_NECK_2:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_ABOUT:
      return 2 * obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_WAIST:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_WRIST_L:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_WRIST_R:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_HOLD:
      return obj->Value[OVAL_ARMOR_CONDITION];

    case WEAR_EYES:
      return obj->Value[OVAL_ARMOR_CONDITION];
    }

  return 0;
}

/*
 * Count occurrences of an obj in a list.
 */
int CountOccurancesOfObjectInList( const ProtoObject *protoobj, const std::list<Object*> &list )
{
  return Count(list,
               [protoobj](const auto obj)
               {
                 return obj->Prototype == protoobj;
               });
}

/*
 * Move an obj out of a room.
 */
int falling = 0;

void ObjectFromRoom( Object *obj )
{
  Room *in_room = obj->InRoom;
  assert(in_room != nullptr);

  in_room->Remove(obj);

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) && !obj->Objects().empty() )
    EmptyObjectContents( obj, NULL, obj->InRoom );

  if (obj->ItemType == ITEM_FIRE)
    obj->InRoom->Light -= obj->Count;

  obj->CarriedBy   = NULL;
  obj->InRoom      = NULL;

  if ( obj->Prototype->Vnum == OBJ_VNUM_CORPSE_PC && falling == 0 )
    WriteCorpses( NULL, obj->ShortDescr.c_str() + 14 );
}

/*
 * Move an obj into a room.
 */
Object *ObjectToRoom( Object *obj, Room *pRoomIndex )
{
  short count = obj->Count;
  short item_type = obj->ItemType;

  for(Object *otmp : pRoomIndex->Objects())
    {
      Object *oret = GroupObject(otmp, obj);

      if(oret == otmp)
        {
          if (item_type == ITEM_FIRE)
            {
              pRoomIndex->Light += count;
            }
          
          return oret;
        }
    }

  pRoomIndex->Add(obj);
  obj->CarriedBy                               = NULL;
  obj->InObject                                   = NULL;

  if (item_type == ITEM_FIRE)
    pRoomIndex->Light += count;

  falling++;
  ObjectFallIfNoFloor( obj, false );
  falling--;

  if ( obj->Prototype->Vnum == OBJ_VNUM_CORPSE_PC && falling == 0 )
    WriteCorpses( NULL, obj->ShortDescr.c_str() + 14 );

  return obj;
}

/*
 * Move an object into an object.
 */
Object *ObjectToObject( Object *obj, Object *obj_to )
{
  if ( obj == obj_to )
    {
      Log->Bug( "Obj_to_obj: trying to put object inside itself: vnum %ld",
                obj->Prototype->Vnum );
      return obj;
    }
  /* Big carry_weight bug fix here by Thoric */
  if ( obj->CarriedBy != obj_to->CarriedBy )
    {
      if ( obj->CarriedBy )
        obj->CarriedBy->CarryWeight -= GetObjectWeight( obj );

      if ( obj_to->CarriedBy && obj_to->WearLoc != WEAR_FLOATING )
        obj_to->CarriedBy->CarryWeight += GetObjectWeight( obj );
    }

  for(Object *otmp : obj_to->Objects())
    {
      Object *oret = GroupObject(otmp, obj);
      
      if ( oret == otmp )
        {
          return oret;
        }
    }

  obj_to->Add(obj);
  obj->InObject                            = obj_to;
  obj->InRoom                   = NULL;
  obj->CarriedBy                        = NULL;

  return obj;
}

/*
 * Move an object out of an object.
 */
void ObjectFromObject( Object *obj )
{
  Object *obj_from = obj->InObject;
  assert(obj_from != nullptr);

  obj_from->Remove(obj);

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) && !obj->Objects().empty() )
    EmptyObjectContents( obj, obj->InObject, NULL );

  obj->InObject       = NULL;
  obj->InRoom      = NULL;
  obj->CarriedBy   = NULL;

  for ( ; obj_from; obj_from = obj_from->InObject )
    {
      if ( obj_from->CarriedBy && obj_from->WearLoc != WEAR_FLOATING )
        {
          obj_from->CarriedBy->CarryWeight -= GetObjectWeight( obj );
        }
    }
}

/*
 * Extract an obj from the world.
 */
void ExtractObject( Object *obj )
{
  assert(obj != nullptr);

  if ( IsObjectExtracted(obj) )
    {
      Log->Bug( "ExtractObject: obj %d already extracted!", obj->Prototype->Vnum );
      return;
    }

  if ( obj->ItemType == ITEM_PORTAL )
    RemovePortal( obj );

  if ( obj->CarriedBy )
    ObjectFromCharacter( obj );
  else
    if ( obj->InRoom )
      ObjectFromRoom( obj );
    else
      if ( obj->InObject )
        ObjectFromObject( obj );

  std::list<Object*> contents(obj->Objects());

  for(Object *obj_content : contents)
    {
      ExtractObject( obj_content );
    }
  
  std::list<Affect*> affects(obj->Affects());

  for(Affect *paf : affects)
    {
      obj->Remove(paf);
      delete paf;
    }

  std::list<ExtraDescription*> extraDescriptions(obj->ExtraDescriptions());

  for(ExtraDescription *ed : extraDescriptions)
    {
      delete ed;
      obj->Remove(ed);
    }
    
  if ( obj == gobj_prev )
    gobj_prev = obj->Previous;

  UNLINK( obj, FirstObject, LastObject, Next, Previous );
  /* shove onto extraction queue */
  QueueExtractedObject( obj );

  obj->Prototype->Count -= obj->Count;
  numobjsloaded -= obj->Count;
  --physicalobjects;

  if ( obj->Serial == cur_obj )
    {
      cur_obj_extracted = true;

      if ( global_objcode == rNONE )
        global_objcode = rOBJ_EXTRACTED;
    }
}

/*
 * Extract a char from the world.
 */
void ExtractCharacter( Character *ch, bool fPull )
{
  assert(ch != nullptr);
  assert(ch->InRoom != nullptr);
  assert(ch != supermob);

  if ( CharacterDiedRecently(ch) )
    {
      Log->Bug("ExtractCharacter: %s already died!", ch->Name.c_str() );
      return;
    }

  if ( ch == cur_char )
    cur_char_died = true;

  /* shove onto extraction queue */
  QueueExtractedCharacter( ch, fPull );

  if ( gch_prev == ch )
    gch_prev = ch->Previous;

  if ( fPull && !IsBitSet(ch->Flags, ACT_POLYMORPHED))
    DieFollower( ch );

  StopFighting( ch, true );

  if (IsBitSet(ch->InRoom->Flags, ROOM_ARENA))
    {
      ch->Hit = ch->MaxHit;
      ch->Mana = ch->MaxMana;
      ch->Move = ch->MaxMove;
    }

  if ( ch->Mount )
    {
      RemoveBit( ch->Mount->Flags, ACT_MOUNTED );
      ch->Mount = NULL;
      ch->Position = POS_STANDING;
    }

  if ( IsNpc(ch) && IsBitSet( ch->Flags, ACT_MOUNTED ) )
    for ( Character *wch = FirstCharacter; wch; wch = wch->Next )
      {
        if ( wch->Mount == ch )
          {
            wch->Mount = NULL;
            wch->Position = POS_STANDING;
          }
        if ( wch->PCData && wch->PCData->Pet == ch )
          {
            wch->PCData->Pet = NULL;
            if ( wch->InRoom == ch->InRoom )
              Act( AT_SOCIAL, "You mourn for the loss of $N.",
                   wch, NULL, ch, TO_CHAR );
          }
      }

  RemoveBit( ch->Flags, ACT_MOUNTED );

  while( !ch->Objects().empty() )
    {
      ExtractObject( ch->Objects().back() );
    }
  
  CharacterFromRoom( ch );

  if ( !fPull )
    {
      Room *location = GetRoom( WhereHome( ch ) );

      if ( !location )
        location = GetRoom( ROOM_VNUM_LIMBO );

      CharacterToRoom( ch, location );

      Act( AT_MAGIC, "$n appears from some strange swirling mists!", ch, NULL, NULL, TO_ROOM );
      ch->Position = POS_RESTING;
      return;
    }

  if ( IsNpc(ch) )
    {
      --ch->Prototype->Count;
      --nummobsloaded;
    }

  if ( ch->Desc && ch->Desc->Original && IsBitSet(ch->Flags, ACT_POLYMORPHED))
    do_revert( ch, "" );

  if ( ch->Desc && ch->Desc->Original )
    do_return( ch, "" );

  for ( Character *wch = FirstCharacter; wch; wch = wch->Next )
    if ( wch->Reply == ch )
      wch->Reply = NULL;

  UNLINK( ch, FirstCharacter, LastCharacter, Next, Previous );

  if (ch->Desc != nullptr)
    {
      assert(ch->Desc->Character == ch);

      ch->Desc->Character = NULL;
      CloseDescriptor( ch->Desc, false );
      ch->Desc = NULL;

      PlayerCharacters->Remove(ch);
    }
}

/*
 * Find a char in the room.
 */
Character *GetCharacterInRoom( const Character *ch, std::string argument )
{
  std::string arg;
  vnum_t vnum = INVALID_VNUM;

  int number = NumberArgument( argument, arg );

  if ( !StrCmp( arg, "self" ) )
    return (Character*)ch;

  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber( arg ) )
    vnum = std::stoi( arg );

  int count  = 0;

  for(Character *rch : ch->InRoom->Characters())
    {
      if ( CanSeeCharacter( ch, rch )
           && (( (NiftyIsName( arg, rch->Name )
                  || (!IsNpc(rch) && NiftyIsName( arg, rch->PCData->Title )))
                 ||  (IsNpc(rch) && vnum == rch->Prototype->Vnum))) )
        {
          if ( number == 0 && !IsNpc(rch) )
            return rch;
          else if ( ++count == number )
            return rch;
        }
    }
  
  if ( vnum != INVALID_VNUM )
    return NULL;

  /* If we didn't find an exact match, run through the list of characters
     again looking for prefix matching, ie gu == guard.
     Added by Narn, Sept/96
  */
  count  = 0;

  for(Character *rch : ch->InRoom->Characters())
    {
      if ( !CanSeeCharacter( ch, rch ) ||
           (!NiftyIsNamePrefix( arg, rch->Name ) &&
            (IsNpc(rch) || (!IsNpc(rch) && !NiftyIsNamePrefix( arg, rch->PCData->Title )))))
        continue;
      
      if ( number == 0 && !IsNpc(rch) )
        return rch;
      else if ( ++count == number )
        return rch;
    }

  return NULL;
}

/*
 * Find a char in the world.
 */
Character *GetCharacterAnywhere( const Character *ch, std::string argument )
{
  std::string arg;
  vnum_t vnum = INVALID_VNUM;

  int number = NumberArgument( argument, arg );
  int count  = 0;

  if ( !StrCmp( arg, "self" ) )
    return (Character*)ch;

  /*
   * Allow reference by vnum for saints+                        -Thoric
   */
  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber( arg ) )
    vnum = std::stoi( arg );

  /* check the room for an exact match */
  for(Character *wch : ch->InRoom->Characters())
    {
      if ( (NiftyIsName( arg, wch->Name )
            ||  (IsNpc(wch) && vnum == wch->Prototype->Vnum)) && IsWizVis(ch,wch))
        {
          if ( number == 0 && !IsNpc(wch) )
            return wch;
          else if ( ++count == number )
            return wch;
        }
    }
  
  count = 0;

  /* check the world for an exact match */
  for ( Character *wch = FirstCharacter; wch; wch = wch->Next )
    {
      if ( (NiftyIsName( arg, wch->Name )
            ||  (IsNpc(wch) && vnum == wch->Prototype->Vnum)) && IsWizVis(ch,wch) )
        {
          if ( number == 0 && !IsNpc(wch) )
            return wch;
          else if ( ++count == number  )
            return wch;
        }
    }
  
  /* bail out if looking for a vnum match */
  if ( vnum != INVALID_VNUM )
    return NULL;

  /*
   * If we didn't find an exact match, check the room for
   * for a prefix match, ie gu == guard.
   * Added by Narn, Sept/96
   */
  count  = 0;

  for(Character *wch : ch->InRoom->Characters())
    {
      if ( !NiftyIsNamePrefix( arg, wch->Name ) )
        continue;

      if ( number == 0 && !IsNpc(wch) && IsWizVis(ch,wch))
        return wch;
      else if ( ++count == number  && IsWizVis(ch, wch) )
        return wch;
    }

  /*
   * If we didn't find a prefix match in the room, run through the full list
   * of characters looking for prefix matching, ie gu == guard.
   * Added by Narn, Sept/96
   */
  count  = 0;

  for ( Character *wch = FirstCharacter; wch; wch = wch->Next )
    {
      if ( !NiftyIsNamePrefix( arg, wch->Name ) )
        continue;
      if ( number == 0 && !IsNpc(wch) && IsWizVis(ch, wch) )
        return wch;
      else
        if ( ++count == number  && IsWizVis(ch, wch) )
          return wch;
    }

  return NULL;
}

/*
 * Find some object with a given index data.
 * Used by area-reset 'P', 'T' and 'H' commands.
 */
Object *GetInstanceOfObject( const ProtoObject *pObjIndex )
{
  Object *obj;

  for ( obj = LastObject; obj; obj = obj->Previous )
    if ( obj->Prototype == pObjIndex )
      return obj;

  return NULL;
}

/*
 * Find an obj in a list.
 */
Object *GetObjectInList( const Character *ch, std::string argument,
                         const std::list<Object*> &list )
{
  std::string arg;
  int number = NumberArgument( argument, arg );
  int count  = 0;

  for(Object *obj : list)
    {
      if ( CanSeeObject( ch, obj ) && NiftyIsName( arg, obj->Name ) )
        {
          if ( (count += obj->Count) >= number )
            {
              return obj;
            }
        }
    }
  
  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;

  for(Object *obj : list)
    {
      if ( CanSeeObject( ch, obj ) && NiftyIsNamePrefix( arg, obj->Name ) )
        {
          if ( (count += obj->Count) >= number )
            {
              return obj;
            }
        }
    }
  
  return nullptr;
}

/*
 * Find an obj in a list...going the other way                  -Thoric
 */
Object *GetObjectInListReverse( const Character *ch, std::string argument,
                                const std::list<Object*> &list )
{
  std::string arg;
  int count = 0;
  int number = NumberArgument( argument, arg );

  for(Object *obj : Reverse(list))
    {
      if ( CanSeeObject( ch, obj ) && NiftyIsName( arg, obj->Name ) )
        {
          if ( (count += obj->Count) >= number )
            {
              return obj;
            }
        }
    }
  
  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;

  for(Object *obj : Reverse(list))
    {
      if ( CanSeeObject( ch, obj ) && NiftyIsNamePrefix( arg, obj->Name ) )
        {
          if ( (count += obj->Count) >= number )
            {
              return obj;
            }
        }
    }
  
  return nullptr;
}

/*
 * Find an obj in the room or in inventory.
 */
Object *GetObjectHere( const Character *ch, std::string argument )
{
  Object *obj = nullptr;

  if ( !ch || !ch->InRoom )
    return NULL;

  obj = GetObjectInListReverse( ch, argument, ch->InRoom->Objects() );

  if ( obj )
    return obj;

  if ( ( obj = GetCarriedObject( ch, argument ) ) != NULL )
    return obj;

  if ( ( obj = GetWornObject( ch, argument ) ) != NULL )
    return obj;

  return NULL;
}

/*
 * Find an obj in the world.
 */
Object *GetObjectAnywhere( const Character *ch, std::string argument )
{
  std::string arg;
  Object *obj = nullptr;
  int number = 0, count = 0;
  vnum_t vnum = INVALID_VNUM;

  if (!ch)
    return NULL;

  if ( ( obj = GetObjectHere( ch, argument ) ) != NULL )
    return obj;

  number = NumberArgument( argument, arg );

  /*
   * Allow reference by vnum for saints+                        -Thoric
   */
  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber( arg ) )
    vnum = std::stoi( arg );

  count  = 0;

  for ( obj = FirstObject; obj; obj = obj->Next )
    if ( CanSeeObject( ch, obj ) && (NiftyIsName( arg, obj->Name )
                                    ||   vnum == obj->Prototype->Vnum) )
      if ( (count += obj->Count) >= number )
        return obj;

  /* bail out if looking for a vnum */
  if ( vnum != INVALID_VNUM )
    return NULL;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count  = 0;

  for ( obj = FirstObject; obj; obj = obj->Next )
    if ( CanSeeObject( ch, obj ) && NiftyIsNamePrefix( arg, obj->Name ) )
      if ( (count += obj->Count) >= number )
        return obj;

  return NULL;
}

/*
 * Generic get obj function that supports optional containers.  -Thoric
 * currently only used for "eat" and "quaff".
 */
Object *FindObject( Character *ch, std::string argument, bool carryonly )
{
  std::string arg1;
  std::string arg2;
  Object *obj = nullptr;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !StrCmp( arg2, "from" )
       && !argument.empty() )
    {
      argument = OneArgument( argument, arg2 );
    }
  
  if ( arg2.empty() )
    {
      if ( carryonly && ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
        {
          ch->Echo( "You do not have that item.\r\n" );
          return NULL;
        }
      else if ( !carryonly && ( obj = GetObjectHere( ch, arg1 ) ) == NULL )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg1.c_str(), TO_CHAR );
          return NULL;
        }
      
      return obj;
    }
  else
    {
      Object *container = nullptr;

      if ( carryonly
           && ( container = GetCarriedObject( ch, arg2 ) ) == NULL
           && ( container = GetWornObject( ch, arg2 ) ) == NULL )
        {
          ch->Echo( "You do not have that item.\r\n" );
          return NULL;
        }
      
      if ( !carryonly && ( container = GetObjectHere( ch, arg2 ) ) == NULL )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg2.c_str(), TO_CHAR );
          return NULL;
        }

      if ( !IS_OBJ_STAT(container, ITEM_COVERING )
           &&    IsBitSet(container->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, container->Name.c_str(), TO_CHAR );
          return NULL;
        }

      obj = GetObjectInList( ch, arg1, container->Objects() );

      if ( !obj )
        Act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
             "I see nothing like that beneath $p." :
             "I see nothing like that in $p.",
             ch, container, NULL, TO_CHAR );
      return obj;
    }

  return NULL;
}

int GetObjectCount( const Object *obj )
{
  return obj->Count;
}

/*
 * Return weight of an object, including weight of contents.
 */
int GetObjectWeight( const Object *obj )
{
  int weight = obj->Count * obj->Weight;

  for(const Object *inner : obj->Objects())
    {
      weight += GetObjectWeight( inner );
    }
  
  return weight;
}

/*
 * True if room is dark.
 */
bool IsRoomDark( const Room *pRoomIndex )
{
  assert(pRoomIndex != nullptr);

  if ( pRoomIndex->Light > 0 )
    return false;

  if ( IsBitSet(pRoomIndex->Flags, ROOM_DARK) )
    return true;

  if ( pRoomIndex->Sector == SECT_INSIDE
       ||   pRoomIndex->Sector == SECT_CITY )
    return false;

  if ( weather_info.Sunlight == SUN_SET
       ||   weather_info.Sunlight == SUN_DARK )
    return true;

  return false;
}

/*
 * True if room is private.
 */
bool IsRoomPrivate( const Character *ch, const Room *pRoomIndex )
{
  assert(ch != nullptr);
  assert(pRoomIndex != nullptr);

  if ( IsBitSet(pRoomIndex->Flags, ROOM_PLR_HOME) && ch->PlayerHome != pRoomIndex)
    return true;

  size_t count = pRoomIndex->Characters().size();

  if ( IsBitSet(pRoomIndex->Flags, ROOM_PRIVATE) && count >= 2 )
    return true;

  return false;
}

/*
 * Return ascii name of an item type.
 */
const char *GetItemTypeName( const Object *obj )
{
  if ( obj->ItemType <= ITEM_NONE || obj->ItemType > MAX_ITEM_TYPE )
    {
      Log->Bug( "%s: unknown type %d.", __FUNCTION__, obj->ItemType );
      return "(unknown)";
    }

  return ObjectTypes[obj->ItemType];
}

/*
 * Return ascii name of an affect location.
 */
const char *GetAffectLocationName( int location )
{
  switch ( location )
    {
    case APPLY_NONE:            return "none";
    case APPLY_STR:             return "strength";
    case APPLY_DEX:             return "dexterity";
    case APPLY_INT:             return "intelligence";
    case APPLY_WIS:             return "wisdom";
    case APPLY_CON:             return "constitution";
    case APPLY_CHA:             return "charisma";
    case APPLY_LCK:             return "luck";
    case APPLY_SEX:             return "sex";
    case APPLY_LEVEL:           return "level";
    case APPLY_AGE:             return "age";
    case APPLY_MANA:            return "mana";
    case APPLY_HIT:             return "hp";
    case APPLY_MOVE:            return "moves";
    case APPLY_GOLD:            return "gold";
    case APPLY_EXP:             return "experience";
    case APPLY_AC:              return "armor class";
    case APPLY_HITROLL:         return "hit roll";
    case APPLY_DAMROLL:         return "damage roll";
    case APPLY_SAVING_POISON:   return "save vs poison";
    case APPLY_SAVING_ROD:      return "save vs rod";
    case APPLY_SAVING_PARA:     return "save vs paralysis";
    case APPLY_SAVING_BREATH:   return "save vs breath";
    case APPLY_SAVING_SPELL:    return "save vs spell";
    case APPLY_HEIGHT:          return "height";
    case APPLY_WEIGHT:          return "weight";
    case APPLY_AFFECT:          return "affected_by";
    case APPLY_RESISTANT:       return "resistant";
    case APPLY_IMMUNE:          return "immune";
    case APPLY_SUSCEPTIBLE:     return "susceptible";
    case APPLY_BACKSTAB:        return "backstab";
    case APPLY_PICK:            return "pick";
    case APPLY_TRACK:           return "track";
    case APPLY_STEAL:           return "steal";
    case APPLY_SNEAK:           return "sneak";
    case APPLY_HIDE:            return "hide";
    case APPLY_PALM:            return "palm";
    case APPLY_DETRAP:          return "detrap";
    case APPLY_DODGE:           return "dodge";
    case APPLY_PEEK:            return "peek";
    case APPLY_SCAN:            return "scan";
    case APPLY_GOUGE:           return "gouge";
    case APPLY_SEARCH:          return "search";
    case APPLY_MOUNT:           return "mount";
    case APPLY_DISARM:          return "disarm";
    case APPLY_KICK:            return "kick";
    case APPLY_PARRY:           return "parry";
    case APPLY_BASH:            return "bash";
    case APPLY_STUN:            return "stun";
    case APPLY_PUNCH:           return "punch";
    case APPLY_CLIMB:           return "climb";
    case APPLY_GRIP:            return "grip";
    case APPLY_SCRIBE:          return "scribe";
    case APPLY_BREW:            return "brew";
    case APPLY_WEAPONSPELL:     return "weapon spell";
    case APPLY_WEARSPELL:       return "wear spell";
    case APPLY_REMOVESPELL:     return "remove spell";
    case APPLY_MENTALSTATE:     return "mental state";
    case APPLY_EMOTION:         return "emotional state";
    case APPLY_STRIPSN:         return "dispel";
    case APPLY_REMOVE:          return "remove";
    case APPLY_DIG:             return "dig";
    case APPLY_FULL:            return "hunger";
    case APPLY_THIRST:          return "thirst";
    case APPLY_DRUNK:           return "drunk";
    case APPLY_BLOOD:           return "blood";
    case APPLY_SNIPE:           return "snipe";
    }

  Log->Bug( "%s: unknown location %d.", __FUNCTION__, location );
  return "(unknown)";
}

/*
 * Set off a trap (obj) upon character (ch)                     -Thoric
 */
ch_ret SpringTrap( Character *ch, Object *obj )
{
  int dam;
  char *txt;
  char buf[MAX_STRING_LENGTH];
  int typ = obj->Value[OVAL_TRAP_TYPE];
  int lev = obj->Value[OVAL_TRAP_STRENGTH];
  ch_ret retcode = rNONE;

  switch(typ)
    {
    default:
      txt = "hit by a trap";                                    break;
    case TRAP_TYPE_POISON_GAS:
      txt = "surrounded by a green cloud of gas";               break;
    case TRAP_TYPE_POISON_DART:
      txt = "hit by a dart";                                    break;
    case TRAP_TYPE_POISON_NEEDLE:
      txt = "pricked by a needle";                              break;
    case TRAP_TYPE_POISON_DAGGER:
      txt = "stabbed by a dagger";                              break;
    case TRAP_TYPE_POISON_ARROW:
      txt = "struck with an arrow";                             break;
    case TRAP_TYPE_BLINDNESS_GAS:
      txt = "surrounded by a red cloud of gas";         break;
    case TRAP_TYPE_SLEEPING_GAS:
      txt = "surrounded by a yellow cloud of gas";              break;
    case TRAP_TYPE_FLAME:
      txt = "struck by a burst of flame";                       break;
    case TRAP_TYPE_EXPLOSION:
      txt = "hit by an explosion";                              break;
    case TRAP_TYPE_ACID_SPRAY:
      txt = "covered by a spray of acid";                       break;
    case TRAP_TYPE_ELECTRIC_SHOCK:
      txt = "suddenly shocked";                         break;
    case TRAP_TYPE_BLADE:
      txt = "sliced by a razor sharp blade";                    break;
    case TRAP_TYPE_SEX_CHANGE:
      txt = "surrounded by a mysterious aura";          break;
    }

  dam = GetRandomNumberFromRange( obj->Value[OVAL_TRAP_STRENGTH], obj->Value[OVAL_TRAP_STRENGTH] * 2);
  sprintf( buf, "You are %s!", txt );
  Act( AT_HITME, buf, ch, NULL, NULL, TO_CHAR );
  sprintf( buf, "$n is %s.", txt );
  Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );

  --obj->Value[OVAL_TRAP_CHARGE];

  if ( obj->Value[OVAL_TRAP_CHARGE] <= 0 )
    ExtractObject( obj );

  switch(typ)
    {
    default:
    case TRAP_TYPE_POISON_DART:
    case TRAP_TYPE_POISON_NEEDLE:
    case TRAP_TYPE_POISON_DAGGER:
    case TRAP_TYPE_POISON_ARROW:
      /* hmm... why not use spell_poison() here? */
      retcode = CastSpellWithObject( gsn_poison, lev, ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = InflictDamage( ch, ch, dam, TYPE_UNDEFINED );
      break;
    case TRAP_TYPE_POISON_GAS:
      retcode = CastSpellWithObject( gsn_poison, lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_BLINDNESS_GAS:
      retcode = CastSpellWithObject( gsn_blindness, lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_SLEEPING_GAS:
      retcode = CastSpellWithObject( LookupSkill("sleep"), lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_ACID_SPRAY:
      retcode = CastSpellWithObject( LookupSkill("acid blast"), lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_SEX_CHANGE:
      retcode = CastSpellWithObject( LookupSkill("change sex"), lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_FLAME:
    case TRAP_TYPE_EXPLOSION:
      retcode = CastSpellWithObject( gsn_fireball, lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_ELECTRIC_SHOCK:
    case TRAP_TYPE_BLADE:
      retcode = InflictDamage( ch, ch, dam, TYPE_UNDEFINED );
    }
  return retcode;
}

/*
 * Check an object for a trap                                   -Thoric
 */
ch_ret CheckObjectForTrap( Character *ch, const Object *obj, int flag )
{
  ch_ret retcode = rNONE;

  if ( obj->Objects().empty() )
    {
      return rNONE;
    }

  for(Object *check : obj->Objects())
    {
      if ( check->ItemType == ITEM_TRAP
	   && IsBitSet(check->Value[OVAL_TRAP_FLAGS], flag) )
	{
	  retcode = SpringTrap( ch, check );

	  if ( retcode != rNONE )
	    {
	      return retcode;
	    }
	}
    }

  return retcode;
}

/*
 * Check the room for a trap                                    -Thoric
 */
ch_ret CheckRoomForTraps( Character *ch, int flag )
{
  ch_ret retcode = rNONE;

  if ( !ch )
    {
      return rERROR;
    }

  if ( !ch->InRoom || ch->InRoom->Objects().empty())
    return rNONE;

  for(Object *check : ch->InRoom->Objects())
    {
      if ( check->ItemType == ITEM_LANDMINE && flag == TRAP_ENTER_ROOM )
        {
          Explode(check);
          return rNONE;
        }
      else if ( check->ItemType == ITEM_TRAP
                && IsBitSet(check->Value[OVAL_TRAP_FLAGS], flag) )
        {
          retcode = SpringTrap( ch, check );

          if ( retcode != rNONE )
	    {
	      return retcode;
	    }
        }
    }

  return retcode;
}

/*
 * return true if an object contains a trap                     -Thoric
 */
bool IsObjectTrapped( const Object *obj )
{
  return GetTrap(obj);
}

/*
 * If an object contains a trap, return the pointer to the trap -Thoric
 */
Object *GetTrap( const Object *obj )
{
  return Find(obj->Objects(),
              [](const auto check)
              {
                return check->ItemType == ITEM_TRAP;
              });
}

/*
 * Remove an exit from a room                                   -Thoric
 */
void ExtractExit( Room *room, Exit *pexit )
{
  room->Remove(pexit);

  if ( pexit->ReverseExit )
    pexit->ReverseExit->ReverseExit = NULL;

  delete pexit;
}

/*
 * clean out a room (leave list pointers intact )               -Thoric
 */
void CleanRoom( Room *room )
{
  assert(room != nullptr);

  room->Name.erase();
  room->Description.erase();

  std::list<ExtraDescription*> extraDescriptions(room->ExtraDescriptions());
  
  for(ExtraDescription *ed : extraDescriptions)
    {
      room->Remove(ed);
      delete ed;
      top_ed--;
    }

  while(!room->Exits().empty())
    {
      Exit *pexit = room->Exits().front();
      room->Remove(pexit);
      delete pexit;
      top_exit--;
    }
  
  room->Flags = 0;
  room->Sector = SECT_CITY;
  room->Light = 0;
}

/*
 * clean out an object (index) (leave list pointers intact )    -Thoric
 */
void CleanObject( ProtoObject *obj )
{
  obj->Name.erase();
  obj->ShortDescr.erase();
  obj->Description.erase();
  obj->ActionDescription.erase();
  obj->ItemType        = ITEM_NONE;
  obj->Flags      = 0;
  obj->WearFlags       = 0;
  obj->Count            = 0;
  obj->Weight           = 0;
  obj->Cost             = 0;

  obj->Value.fill(0);

  std::list<Affect*> affects(obj->Affects());

  for(Affect *paf : affects)
    {
      obj->Remove(paf);
      delete paf;
      top_affect--;
    }

  std::list<ExtraDescription*> extraDescriptions(obj->ExtraDescriptions());

  for(ExtraDescription *ed : obj->ExtraDescriptions())
    {
      delete ed;
      top_ed--;
      obj->Remove(ed);
    }
}

/*
 * clean out a mobile (index) (leave list pointers intact )     -Thoric
 */
void CleanMobile( ProtoMobile *mob )
{
  mob->Name.erase();
  mob->ShortDescr.erase();
  mob->LongDescr.erase();
  mob->Description.erase();
  mob->spec_fun = NULL;
  mob->spec_2   = NULL;
  mob->Shop    = NULL;
  mob->RepairShop    = NULL;
  mob->mprog.progtypes        = 0;

  std::list<MPROG_DATA*> mobProgs(mob->mprog.MudProgs());
  
  for(MPROG_DATA *mprog : mobProgs)
    {
      mob->mprog.Remove(mprog);
      FreeMemory( mprog->arglist );
      FreeMemory( mprog->comlist );
      delete mprog;
    }

  mob->Count     = 0;
  mob->Killed          = 0;
  mob->Sex       = SEX_NEUTRAL;
  mob->Level           = 0;
  mob->Flags       = 0;
  mob->AffectedBy     = 0;
  mob->Alignment         = 0;
  mob->MobThac0        = 0;
  mob->ArmorClass               = 0;
  mob->HitNoDice       = 0;
  mob->HitSizeDice = 0;
  mob->HitPlus         = 0;
  mob->DamNoDice         = 0;
  mob->DamSizeDice     = 0;
  mob->DamPlus   = 0;
  mob->Gold            = 0;
  mob->Position  = (PositionType) 0;
  mob->DefaultPosition = (PositionType) 0;
  mob->Height          = 0;
  mob->Weight    = 0;
}

/*
 * Show an affect verbosely to a character                      -Thoric
 */
void ShowAffectToCharacter( const Character *ch, const Affect *paf )
{
  assert(paf != nullptr);

  if ( paf->Location != APPLY_NONE && paf->Modifier != 0 )
    {
      char buf[MAX_STRING_LENGTH];

      switch( paf->Location )
        {
        default:
          sprintf( buf, "Affects %s by %d.\r\n",
                   GetAffectLocationName( paf->Location ), paf->Modifier );
          break;
        case APPLY_AFFECT:
          sprintf( buf, "Affects %s by",
                   GetAffectLocationName( paf->Location ) );

          for ( size_t x = 0; x < MAX_BIT ; x++ )
            {
              if ( IsBitSet( paf->Modifier, 1 << x ) )
                {
                  strcat( buf, " " );
                  strcat( buf, AffectFlags[x] );
                }
            }

          strcat( buf, "\r\n" );
          break;
        case APPLY_WEAPONSPELL:
        case APPLY_WEARSPELL:
        case APPLY_REMOVESPELL:
          sprintf( buf, "Casts spell '%s'\r\n",
                   IS_VALID_SN(paf->Modifier) ? SkillTable[paf->Modifier]->Name.c_str()
                   : "unknown" );
          break;
        case APPLY_RESISTANT:
        case APPLY_IMMUNE:
        case APPLY_SUSCEPTIBLE:
          sprintf( buf, "Affects %s by",
                   GetAffectLocationName( paf->Location ) );
          
          for (size_t x = 0; x < MAX_BIT; x++ )
            {
              if ( IsBitSet( paf->Modifier, 1 << x ) )
                {
                  strcat( buf, " " );
                  strcat( buf, RisFlags[x] );
                }
            }

          strcat( buf, "\r\n" );
          break;
        }

      ch->Echo("%s", buf);
    }
}

/*
 * Set the current global object to obj                         -Thoric
 */
void SetCurrentGlobalObject( Object *obj )
{
  cur_obj = obj->Serial;
  cur_obj_extracted = false;
  global_objcode = rNONE;
}

/*
 * Check the recently extracted object queue for obj            -Thoric
 */
bool IsObjectExtracted( const Object *obj )
{
  Object *cod;

  if ( !obj )
    return true;

  if ( obj->Serial == cur_obj
       &&   cur_obj_extracted )
    return true;

  for (cod = extracted_obj_queue; cod; cod = cod->Next )
    if ( obj == cod )
      return true;
  return false;
}

/*
 * Stick obj onto extraction queue
 */
void QueueExtractedObject( Object *obj )
{

  ++cur_qobjs;
  obj->Next = extracted_obj_queue;
  extracted_obj_queue = obj;
}

/*
 * Clean out the extracted object queue
 */
void CleanObjectQueue()
{
  Object *obj;

  while ( extracted_obj_queue )
    {
      obj = extracted_obj_queue;
      extracted_obj_queue = extracted_obj_queue->Next;
      delete obj;
      --cur_qobjs;
    }
}

/*
 * Set the current global character to ch                       -Thoric
 */
void SetCurrentGlobalCharacter( Character *ch )
{
  cur_char         = ch;
  cur_char_died  = false;
  cur_room         = ch->InRoom;
  global_retcode = rNONE;
}

/*
 * Check to see if ch died recently                             -Thoric
 */
bool CharacterDiedRecently( const Character *ch )
{
  ExtractedCharacter *ccd;

  if ( ch == cur_char && cur_char_died )
    return true;

  for (ccd = extracted_char_queue; ccd; ccd = ccd->Next )
    if ( ccd->Character == ch )
      return true;

  return false;
}

/*
 * Add ch to the queue of recently extracted characters         -Thoric
 */
void QueueExtractedCharacter( Character *ch, bool extract )
{
  assert(ch != nullptr);
  ExtractedCharacter *ccd = new ExtractedCharacter();

  ccd->Character                       = ch;
  ccd->InRoom                     = ch->InRoom;
  ccd->Extract          = extract;

  if ( ch == cur_char )
    ccd->RetCode                = global_retcode;
  else
    ccd->RetCode                = rCHAR_DIED;

  ccd->Next                     = extracted_char_queue;
  extracted_char_queue  = ccd;
  cur_qchars++;
}

/*
 * clean out the extracted character queue
 */
void CleanCharacterQueue()
{
  for ( ExtractedCharacter *ccd = extracted_char_queue; ccd; ccd = extracted_char_queue )
    {
      extracted_char_queue = ccd->Next;

      if ( ccd->Extract )
        FreeCharacter( ccd->Character );

      delete ccd;
      --cur_qchars;
    }
}

/*
 * Add a timer to ch                                            -Thoric
 * Support for "call back" time delayed commands
 */
void AddTimerToCharacter( Character *ch, short type, short count, CmdFun *fun, int value )
{
  Timer *timer = nullptr;

  for(Timer *iter : ch->Timers())
    {
      if ( iter->Type == type )
        {
          timer = iter;
          timer->Count  = count;
          timer->DoFun = fun;
          timer->Value     = value;
          break;
        }
    }
  
  if ( !timer )
    {
      timer = new Timer();
      timer->Count = count;
      timer->Type = type;
      timer->DoFun = fun;
      timer->Value = value;
      ch->Add(timer);
    }
}

Timer *GetTimerPointer( const Character *ch, short type )
{
  return Find(ch->Timers(),
              [type](auto timer)
              {
                return timer->Type == type;
              });
}

short GetTimer( const Character *ch, short type )
{
  Timer *timer = GetTimerPointer( ch, type );

  if ( timer != nullptr )
    return timer->Count;
  else
    return 0;
}

void ExtractTimer( Character *ch, Timer *timer )
{
  assert(ch != nullptr);
  assert(timer != nullptr);

  ch->Remove(timer);
  delete timer;
}

void RemoveTimer( Character *ch, short type )
{
  Timer *timer = GetTimerPointer(ch, type);

  if ( timer != nullptr )
    {
      ExtractTimer( ch, timer );
    }
}

bool InSoftRange( const Character *ch, const Area *tarea )
{
  if ( IsImmortal(ch) )
    return true;
  else if ( IsNpc(ch) )
    return true;
  else if ( ch->TopLevel >= tarea->LevelRanges.Soft.Low || ch->TopLevel <= tarea->LevelRanges.Soft.High )
    return true;
  else
    return false;
}

bool InHardRange( const Character *ch, const Area *tarea )
{
  if ( IsImmortal(ch) )
    return true;
  else if ( IsNpc(ch) )
    return true;
  else if ( ch->TopLevel >= tarea->LevelRanges.Hard.Low && ch->TopLevel <= tarea->LevelRanges.Hard.High )
    return true;
  else
    return false;
}

/*
 * Scryn, standard luck check 2/2/96
 */
bool Chance( const Character *ch, short percent )
{
  assert(ch != nullptr);

  /* Mental state bonus/penalty:  Your mental state is a ranged value with
   * zero (0) being at a perfect mental state (bonus of 10).
   * negative values would reflect how sedated one is, and
   * positive values would reflect how stimulated one is.
   * In most circumstances you'd do best at a perfectly balanced state.
   */

  short ms = 10 - abs(ch->MentalState);

  if ( (GetRandomPercent() - GetCurrentLuck(ch) + 13 - ms) <= percent )
    return true;
  else
    return false;
}

/*
 * Make a simple clone of an object (no extras...yet)           -Thoric
 */
Object *CopyObject( const Object *obj )
{
  Object *clone = new Object(obj->Prototype, obj->Level);

  clone->Name           = obj->Name;
  clone->ShortDescr    = obj->ShortDescr;
  clone->Description    = obj->Description;
  clone->ActionDescription = obj->ActionDescription;
  clone->ItemType      = obj->ItemType;
  clone->Flags    = obj->Flags;
  clone->WearFlags     = obj->WearFlags;
  clone->WearLoc       = obj->WearLoc;
  clone->Weight = obj->Weight;
  clone->Cost           = obj->Cost;
  clone->Timer  = obj->Timer;

  for( size_t oval = 0; oval < MAX_OVAL; ++oval )
    {
      clone->Value[oval] = obj->Value[oval];
    }

  ++obj->Prototype->Count;
  ++numobjsloaded;
  ++physicalobjects;
  cur_obj_serial = umax((cur_obj_serial + 1 ) & (BV30-1), 1);
  clone->Serial = clone->Prototype->Serial = cur_obj_serial;
  LINK( clone, FirstObject, LastObject, Next, Previous );
  return clone;
}

static bool HasSameOvalues( const Object *a, const Object *b )
{
  int oval = 0;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      if( a->Value[oval] != b->Value[oval] )
	{
	  return false;
	}
    }

  return true;
}

/*
 * If possible group obj2 into obj1                             -Thoric
 * This code, along with CopyObject, obj->Count, and special support
 * for it implemented throughout handler.c and save.c should show improved
 * performance on MUDs with players that hoard tons of potions and scrolls
 * as this will allow them to be grouped together both in memory, and in
 * the player files.
 */
static Object *GroupObject( Object *obj1, Object *obj2 )
{
  assert(obj1 != nullptr);
  assert(obj2 != nullptr);

  if ( obj1 == obj2 )
    return obj1;

  if ( obj1->Prototype == obj2->Prototype
       && !StrCmp( obj1->Name,         obj2->Name )
       && !StrCmp( obj1->ShortDescr,  obj2->ShortDescr )
       && !StrCmp( obj1->Description,  obj2->Description )
       && !StrCmp( obj1->ActionDescription,  obj2->ActionDescription )
       && obj1->ItemType    == obj2->ItemType
       && obj1->Flags  == obj2->Flags
       && obj1->WearFlags   == obj2->WearFlags
       && obj1->WearLoc     == obj2->WearLoc
       && obj1->Weight       == obj2->Weight
       && obj1->Cost         == obj2->Cost
       && obj1->Level        == obj2->Level
       && obj1->Timer        == obj2->Timer
       && HasSameOvalues( obj1, obj2 )
       && obj1->ExtraDescriptions().empty()
       && obj2->ExtraDescriptions().empty()
       && obj1->Affects().empty()
       && obj2->Affects().empty()
       && obj1->Objects().empty()
       && obj2->Objects().empty() )
    {
      obj1->Count += obj2->Count;
      obj1->Prototype->Count += obj2->Count;   /* to be decremented in */
      numobjsloaded += obj2->Count;             /* ExtractObject */
      ExtractObject( obj2 );
      return obj1;
    }

  return obj2;
}

/*
 * Split off a grouped object                                   -Thoric
 * decreased obj's count to num, and creates a new object containing the rest
 */
void SplitGroupedObject( Object *obj, int num )
{
  assert(obj != nullptr);
  
  int count = obj->Count;

  if ( count <= num || num == 0 )
    {
      return;
    }
  
  Object *rest = CopyObject(obj);
  --obj->Prototype->Count;     /* since CopyObject() ups this value */
  --numobjsloaded;
  rest->Count = obj->Count - num;
  obj->Count = num;

  if ( obj->CarriedBy )
    {
      obj->CarriedBy->Add(rest);
      rest->InRoom                     = NULL;
      rest->InObject                      = NULL;
    }
  else if ( obj->InRoom )
    {
      obj->InRoom->Add(rest);
      rest->CarriedBy                = NULL;
      rest->InObject                    = NULL;
    }
  else if ( obj->InObject )
    {
      obj->InObject->Add(rest);
      rest->InObject                   = obj->InObject;
      rest->InRoom                  = NULL;
      rest->CarriedBy               = NULL;
    }
}

void SeparateOneObjectFromGroup( Object *obj )
{
  SplitGroupedObject( obj, 1 );
}

/*
 * Empty an obj's contents... optionally into another obj, or a room
 */
bool EmptyObjectContents( Object *obj, Object *destobj, Room *destroom )
{
  assert(obj != nullptr);

  Character *ch = obj->CarriedBy;

  if ( destobj || (!destroom && !ch && (destobj = obj->InObject) != NULL) )
    {
      bool movedsome = false;
      std::list<Object*> objects(obj->Objects());

      for(Object *otmp : objects)
        {
          if ( destobj->ItemType == ITEM_CONTAINER
               && GetObjectWeight( otmp ) + GetObjectWeight( destobj )
               > destobj->Value[OVAL_CONTAINER_CAPACITY] )
	    {
	      continue;
	    }

          ObjectFromObject( otmp );
          ObjectToObject( otmp, destobj );
          movedsome = true;
        }

      return movedsome;
    }

  if ( destroom || (!ch && (destroom = obj->InRoom) != NULL) )
    {
      bool movedsome = false;

      for(auto i = std::begin(obj->Objects()), i_next = std::end(obj->Objects());
          i != std::end(obj->Objects()); i = i_next)
        {
          Object *otmp = *i;
          i_next = ++i;
          
          if ( ch && (otmp->Prototype->mprog.progtypes & DROP_PROG) && otmp->Count > 1 )
            {
              SeparateOneObjectFromGroup( otmp );
              ObjectFromObject( otmp );

              if(i_next == std::end(obj->Objects()))
                {
                  i_next = std::begin(obj->Objects());
                }
            }
          else
            {
              ObjectFromObject( otmp );
            }
          
          otmp = ObjectToRoom( otmp, destroom );

          if ( ch )
            {
              ObjProgDropTrigger( ch, otmp );           /* mudprogs */

              if ( CharacterDiedRecently(ch) )
                ch = NULL;
            }
          movedsome = true;
        }

      return movedsome;
    }

  if ( ch )
    {
      bool movedsome = false;
      std::list<Object*> objects(obj->Objects());

      for(Object *otmp : objects)
        {
          ObjectFromObject( otmp );
          ObjectToCharacter( otmp, ch );
          movedsome = true;
        }

      return movedsome;
    }

  Log->Bug( "EmptyObjectContents: could not determine a destination for vnum %ld",
            obj->Prototype->Vnum );
  return false;
}

/*
 * Add gold to an area's economy                                -Thoric
 */
void BoostEconomy( Area *tarea, int gold )
{
  while ( gold >= 1000000000 )
    {
      ++tarea->HighEconomy;
      gold -= 1000000000;
    }

  tarea->LowEconomy += gold;

  while ( tarea->LowEconomy >= 1000000000 )
    {
      ++tarea->HighEconomy;
      tarea->LowEconomy -= 1000000000;
    }
}

/*
 * Take gold from an area's economy                             -Thoric
 */
void LowerEconomy( Area *tarea, int gold )
{
  while ( gold >= 1000000000 )
    {
      tarea->HighEconomy -= 1;
      gold -= 1000000000;
    }

  tarea->LowEconomy -= gold;

  while ( tarea->LowEconomy < 0 )
    {
      tarea->HighEconomy -=1;
      tarea->LowEconomy += 1000000000;
    }
}

/*
 * Check to see if economy has at least this much gold             -Thoric
 */
bool EconomyHas( const Area *tarea, int gold )
{
  int hasgold = ((tarea->HighEconomy > 0) ? 1 : 0) * 1000000000
    + tarea->LowEconomy;

  if ( hasgold >= gold )
    return true;

  return false;
}

/*
 * Used in db.c when resetting a mob into an area                   -Thoric
 * Makes sure mob doesn't get more than 10% of that area's gold,
 * and reduces area economy by the amount of gold given to the mob
 */
void EconomizeMobileGold( Character *mob )
{
  assert(mob->InRoom != nullptr);

  /* make sure it isn't way too much */
  mob->Gold = umin( mob->Gold, mob->TopLevel * mob->TopLevel * 400 );

  Area *tarea = mob->InRoom->Area;
  long gold = ((tarea->HighEconomy > 0) ? 1 : 0) * 1000000000 + tarea->LowEconomy;
  mob->Gold = urange( 0, mob->Gold, gold / 100 );

  if ( mob->Gold != 0 )
    {
      LowerEconomy( tarea, mob->Gold );
    }
}

