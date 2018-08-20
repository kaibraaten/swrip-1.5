#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

struct UserData
{
  const Character *ch;
  const Ship *ship;
};

/* Locals */
void show_char_to_char( const std::list<Character*> &list, Character *ch );

static void LookThroughShipWindow(Character *ch, const Ship *ship);
static bool ShowShipIfInVincinity(Ship *target, void *userData);
static void show_char_to_char_0( Character *victim, Character *ch );
static void show_char_to_char_1( Character *victim, Character *ch );
static void show_ships_to_char( const Room *room, const Character *ch );
static void show_visible_affects_to_char( Character *victim, Character *ch );
static void show_exit_to_char( Character *ch, Exit *pexit, short door );
static void show_no_arg( Character *ch, bool is_auto );

static char *get_sex( Character *ch );
static void look_under( Character *ch, const char *what, bool doexaprog );
static void look_in( Character *ch, const char *what, bool doexaprog );
static bool requirements_are_met( Character *ch );

void do_look( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  Exit *pexit = NULL;
  Character *victim = NULL;
  char *pdesc = NULL;
  bool doexaprog = false;
  DirectionType door = DIR_INVALID;
  int number = 0, cnt = 0;
  bool is_auto = false;

  if( !requirements_are_met( ch ) )
    {
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  doexaprog = StrCmp( "noprog", arg2 ) && StrCmp( "noprog", arg3 );
  is_auto = !StrCmp( arg1, "auto" );

  if ( IsNullOrEmpty( arg1 ) || is_auto )
    {
      show_no_arg( ch, is_auto );
      return;
    }

  if ( !StrCmp( arg1, "under" ) )
    {
      look_under( ch, arg2, doexaprog );
      return;
    }

  if ( !StrCmp( arg1, "i" ) || !StrCmp( arg1, "in" ) )
    {
      look_in( ch, arg2, doexaprog );
      return;
    }

  pdesc = GetExtraDescription(arg1, ch->InRoom->ExtraDescriptions());

  if ( pdesc )
    {
      ch->Echo("\r\n");
      ch->Echo(pdesc);
      return;
    }

  door = GetDirection( arg1 );
  pexit = FindDoor( ch, arg1, true );

  if ( pexit )
    {
      show_exit_to_char( ch, pexit, door );
      return;
    }
  else if ( door != DIR_INVALID )
    {
      Log->Bug("%s:%s:%d: door != DIR_INVALID", __FUNCTION__, __FILE__, __LINE__);
      ch->Echo("Nothing special there.\r\n");
      return;
    }

  victim = GetCharacterInRoom( ch, arg1 );

  if ( victim )
    {
      show_char_to_char_1( victim, ch );
      return;
    }

  number = NumberArgument( arg1, arg );

  for ( Object *obj : Reverse(ch->Objects()) )
    {
      if ( CanSeeObject( ch, obj ) )
        {
          const auto objExtraDescriptions(obj->ExtraDescriptions());
          
          if ( (pdesc=GetExtraDescription(arg, objExtraDescriptions)) != NULL )
            {
              if ( (cnt += obj->Count) < number )
                continue;
              ch->Echo(pdesc);
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }

          const auto protoExtraDescriptions(obj->Prototype->ExtraDescriptions());

          if ( (pdesc=GetExtraDescription(arg, protoExtraDescriptions)) != NULL )
            {
              if ( (cnt += obj->Count) < number )
		continue;
              ch->Echo(pdesc);
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }

          if ( NiftyIsNamePrefix( arg, obj->Name ) )
            {
              if ( (cnt += obj->Count) < number )
                continue;

              pdesc = GetExtraDescription( obj->Name, protoExtraDescriptions );

              if ( !pdesc )
                pdesc = GetExtraDescription( obj->Name, objExtraDescriptions );

              if ( !pdesc )
                ch->Echo("You see nothing special.\r\n");
              else
                ch->Echo(pdesc);

              if ( doexaprog )
		{
		  ObjProgExamineTrigger( ch, obj );
		}

              return;
            }
        }
    }

  for(auto i = std::rbegin(ch->InRoom->Objects()); i != std::rend(ch->InRoom->Objects()); ++i)
    {
      Object *obj = *i;
      
      if ( CanSeeObject( ch, obj ) )
        {
          const auto objExtraDescriptions(obj->ExtraDescriptions());
          const auto protoExtraDescriptions(obj->Prototype->ExtraDescriptions());
          
          if ( (pdesc=GetExtraDescription(arg, objExtraDescriptions)) != NULL )
            {
              if ( (cnt += obj->Count) < number )
                continue;

              ch->Echo(pdesc);

              if ( doexaprog )
		ObjProgExamineTrigger( ch, obj );

              return;
            }

          if ( (pdesc=GetExtraDescription(arg, protoExtraDescriptions)) != NULL )
            {
              if ( (cnt += obj->Count) < number )
                continue;
              ch->Echo(pdesc);

              if ( doexaprog )
		ObjProgExamineTrigger( ch, obj );

              return;
            }

          if ( NiftyIsNamePrefix( arg, obj->Name ) )
	    {
              if ( (cnt += obj->Count) < number )
                continue;
              pdesc = GetExtraDescription( obj->Name, protoExtraDescriptions );
              if ( !pdesc )
                pdesc = GetExtraDescription( obj->Name, objExtraDescriptions );
              if ( !pdesc )
                ch->Echo("You see nothing special.\r\n");
              else
                ch->Echo(pdesc);
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }
        }
    }

  ch->Echo("You do not see that here.\r\n");
}

static void show_char_to_char_0( Character *victim, Character *ch )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf1[MAX_STRING_LENGTH];
  char message[MAX_STRING_LENGTH];

  if ( !IsNpc(victim) && !victim->Desc )
    {
      if ( !victim->Switched )          strcat( buf, "(Link Dead) "  );
      else
        if ( !IsAffectedBy(victim->Switched, AFF_POSSESS) )
          strcat( buf, "(Switched) " );
    }
  if ( !IsNpc(victim)
       && IsBitSet(victim->Flags, PLR_AFK) )                strcat( buf, "[AFK] ");

  if ( (!IsNpc(victim) && IsBitSet(victim->Flags, PLR_WIZINVIS))
       || (IsNpc(victim) && IsBitSet(victim->Flags, ACT_MOBINVIS)) )
    {
      if (!IsNpc(victim))
        sprintf( buf1,"(Invis %d) ", victim->PCData->WizInvis );
      else
	sprintf( buf1,"(Mobinvis %d) ", victim->MobInvis);

      strcat( buf, buf1 );
    }
  if ( IsAffectedBy(victim, AFF_INVISIBLE)   ) strcat( buf, "(Invis) "      );
  if ( IsAffectedBy(victim, AFF_HIDE)        ) strcat( buf, "(Stealth) "       );
  if ( IsAffectedBy(victim, AFF_PASS_DOOR)   ) strcat( buf, "(Translucent) ");
  if ( IsAffectedBy(victim, AFF_FAERIE_FIRE) ) strcat( buf, "&P(Pink Aura)&w "  );
  if ( IsEvil(victim)
       &&   IsAffectedBy(ch, AFF_DETECT_EVIL)     ) strcat( buf, "&R(Red Aura)&w "   );
  if ( ( victim->Mana > 10 )
       &&   ( IsAffectedBy( ch , AFF_DETECT_MAGIC ) || IsImmortal( ch ) ) )
    strcat( buf, "&B(Blue Aura)&w "  );
  if ( !IsNpc(victim) && IsBitSet(victim->Flags, PLR_LITTERBUG  ) )
    strcat( buf, "(LITTERBUG) "  );
  if ( IsNpc(victim) && IsImmortal(ch)
       && IsBitSet(victim->Flags, ACT_PROTOTYPE) ) strcat( buf, "(PROTO) " );
  if ( victim->Desc && victim->Desc->ConnectionState == CON_EDITING )
    strcat( buf, "(Writing) " );

  SetCharacterColor( AT_PERSON, ch );
  
  if ( victim->Position == victim->DefaultPosition && !IsNullOrEmpty( victim->LongDescr ) )
    {
      strcat( buf, victim->LongDescr );
      ch->Echo(buf);
      show_visible_affects_to_char( victim, ch );
      return;
    }

  if ( !IsNpc(victim) && !IsBitSet(ch->Flags, PLR_BRIEF) )
    strcat( buf, victim->PCData->Title );
  else
    strcat( buf, PERS( victim, ch ) );

  switch ( victim->Position )
    {
    case POS_DEAD:     strcat( buf, " is DEAD!!" );                     break;
    case POS_MORTAL:   strcat( buf, " is mortally wounded." );          break;
    case POS_INCAP:    strcat( buf, " is incapacitated." );             break;
    case POS_STUNNED:  strcat( buf, " is lying here stunned." );        break;
    case POS_SLEEPING:
      if (victim->On != NULL)
        {
          if (victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SLEEP_AT)
            {
              sprintf(message," is sleeping at %s",
                      victim->On->ShortDescr);
              if( ((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SLEEP_ON)
            {
              sprintf(message," is sleeping on %s",
                      victim->On->ShortDescr);
              if( ((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
		  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is sleeping in %s",
                      victim->On->ShortDescr);
	      
              if( ((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
	      
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->Position == POS_SITTING
              ||  ch->Position == POS_RESTING )
            strcat( buf, " is sleeping nearby." );
          else
            strcat( buf, " is deep in slumber here." );
        }
      break;
    case POS_RESTING:
      if (victim->On != NULL)
        {
          if (victim->On->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
            {
              sprintf(message," is resting at %s",
                      victim->On->ShortDescr);
              if( ((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->On->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
            {
              sprintf(message," is resting on %s",
                      victim->On->ShortDescr);
              if( ((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
	      strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is resting in %s",
                      victim->On->ShortDescr);

	      if( ((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");

              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->Position == POS_RESTING)
            strcat ( buf, " is sprawled out alongside you." );
          else if (ch->Position == POS_MOUNTED)
	    strcat ( buf, " is sprawled out at the foot of your mount." );
	  else
	    strcat (buf, " is sprawled out here." );
        }
      break;
    case POS_SITTING:
      if (victim->On != NULL)
        {
          if (victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SIT_AT)
            {
              sprintf(message," is sitting at %s",
                      victim->On->ShortDescr);
              if( (ch->Position == POS_SITTING)
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SIT_ON)
            {
              sprintf(message," is sitting on %s",
                      victim->On->ShortDescr);
              if( (ch->Position == POS_SITTING)
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
	      strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is sitting in %s",
                      victim->On->ShortDescr);
              if( (ch->Position == POS_SITTING)
                  && ch->On && (ch->On == victim->On ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->Position == POS_SITTING)
            strcat( buf, " sits here with you." );
          else
            if (ch->Position == POS_RESTING)
              strcat( buf, " sits nearby as you lie around." );
            else
              strcat( buf, " sits upright here." );
        }
      break;
    case POS_STANDING:
      if ( IsImmortal(victim) )
        strcat( buf, " is here before you." );
      else
        if ( ( victim->InRoom->Sector == SECT_UNDERWATER )
             && !IsAffectedBy(victim, AFF_AQUA_BREATH) && !IsNpc(victim) )
          strcat( buf, " is drowning here." );
        else
          if ( victim->InRoom->Sector == SECT_UNDERWATER )
            strcat( buf, " is here in the water." );
          else
            if ( ( victim->InRoom->Sector == SECT_OCEANFLOOR )
                 && !IsAffectedBy(victim, AFF_AQUA_BREATH) && !IsNpc(victim) )
              strcat( buf, " is drowning here." );
            else
              if ( victim->InRoom->Sector == SECT_OCEANFLOOR )
                strcat( buf, " is standing here in the water." );
              else
                if ( IsAffectedBy(victim, AFF_FLOATING)
                     || IsAffectedBy(victim, AFF_FLYING) )
		  strcat( buf, " is hovering here." );
                else
                  strcat( buf, " is standing here." );
      break;
    case POS_SHOVE:    strcat( buf, " is being shoved around." );       break;
    case POS_DRAG:     strcat( buf, " is being dragged around." );      break;
    case POS_MOUNTED:
      strcat( buf, " is here, upon " );
      if ( !victim->Mount )
        strcat( buf, "thin air???" );
      else
        if ( victim->Mount == ch )
          strcat( buf, "your back." );
        else
          if ( victim->InRoom == victim->Mount->InRoom )
            {
              strcat( buf, PERS( victim->Mount, ch ) );
              strcat( buf, "." );
            }
          else
            strcat( buf, "someone who left??" );
      break;
    case POS_FIGHTING:
      strcat( buf, " is here, fighting " );
      if ( !victim->Fighting )
        strcat( buf, "thin air???" );
      else if ( GetFightingOpponent( victim ) == ch )
        strcat( buf, "YOU!" );
      else if ( victim->InRoom == victim->Fighting->Who->InRoom )
        {
          strcat( buf, PERS( victim->Fighting->Who, ch ) );
          strcat( buf, "." );
        }
      else
        strcat( buf, "someone who left??" );
      break;

    default:
      break;
    }

  strcat( buf, "\r\n" );
  buf[0] = CharToUppercase(buf[0]);
  ch->Echo(buf);
  show_visible_affects_to_char( victim, ch );
}

static void show_char_to_char_1( Character *victim, Character *ch )
{
  Object *obj;
  int iWear;
  bool found;

  if ( CanSeeCharacter( victim, ch ) )
    {
      Act( AT_ACTION, "$n looks at you.", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n looks at $N.",  ch, NULL, victim, TO_NOTVICT );
    }

  ch->Echo("%s is a %s %s\r\n", victim->Name, get_sex( victim ), NpcRace[victim->Race] );

  if ( !IsNullOrEmpty( victim->Description ) )
    {
      ch->Echo(victim->Description);
    }
  else
    {
      Act( AT_PLAIN, "You see nothing special about $M.", ch, NULL, victim, TO_CHAR );
    }

  ShowCharacterCondition( ch, victim );

  found = false;

  if( ( (obj = GetEquipmentOnCharacter( victim, WEAR_OVER ) ) == NULL ) || obj->Value[2] == 0 || IsGreater(ch) )
    {
      for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
        {
          if ( ( obj = GetEquipmentOnCharacter( victim, (WearLocation)iWear ) ) != NULL
               && CanSeeObject( ch, obj )
	       && ( !IsNullOrEmpty( obj->Description )
		    || ( IsBitSet(ch->Flags, PLR_HOLYLIGHT)
			 || IsNpc(ch) ) ) )
            {
              if ( !found )
                {
                  ch->Echo("\r\n");
		  Act( AT_PLAIN, "$N is using:", ch, NULL, victim, TO_CHAR );
                  found = true;
                }
              ch->Echo(WhereName[iWear]);
              ch->Echo(FormatObjectToCharacter( obj, ch, true ));
              ch->Echo("\r\n");
            }
        }
    }
  else
    {
      ch->Echo(WhereName[WEAR_OVER]);
      ch->Echo(FormatObjectToCharacter( obj, ch, true ));
      ch->Echo("\r\n");
    }

  if ( IsNpc(ch) || victim == ch )
    return;

  if ( GetRandomPercent() < ch->PCData->Learned[gsn_peek] )
    {
      ch->Echo("\r\nYou peek at the inventory:\r\n");
      ShowObjectListToCharacter( victim->Objects(), ch, true, true );
      LearnFromSuccess( ch, gsn_peek );
    }
  else
    if ( ch->PCData->Learned[gsn_peek] )
      LearnFromFailure( ch, gsn_peek );
}

static void show_ships_to_char( const Room *room, const Character *ch )
{
  const int NUMBER_OF_COLUMNS = 2;
  int column = 0;
  
  for(const Ship *ship : room->Ships())
    {
      SetCharacterColor( AT_SHIP, ch );      
      ch ->Echo("%-35s", ship->Name );

      if(++column % NUMBER_OF_COLUMNS == 0)
        {
          ch->Echo("\r\n&w");
        }
      else
        {
          ch ->Echo("     ");
        }
    }

  if(++column % NUMBER_OF_COLUMNS == 0)
    {
      ch->Echo("\r\n&w");
    }
}

void show_char_to_char( const std::list<Character*> &list, Character *ch )
{
  for(Character *rch : list)
    {
      if ( rch == ch )
        continue;

      if ( CanSeeCharacter( ch, rch ) )
        {
          show_char_to_char_0( rch, ch );
        }
      else if ( rch->Race == RACE_DEFEL )
        {
          SetCharacterColor( AT_BLOOD, ch );
          ch->Echo("You see a pair of red eyes staring back at you.\r\n");
        }
      else if ( IsRoomDark( ch->InRoom )
                &&        IsAffectedBy(rch, AFF_INFRARED ) )
        {
          SetCharacterColor( AT_BLOOD, ch );
          ch->Echo("The red form of a living creature is here.\r\n");
        }
    }
}

static void show_visible_affects_to_char( Character *victim, Character *ch )
{
  char buf[MAX_STRING_LENGTH];

  if ( IsAffectedBy(victim, AFF_CHARM)       )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo("%s looks ahead free of expression.\r\n",
                 IsNpc( victim ) ? Capitalize(victim->ShortDescr) : (victim->Name) );
    }
  if ( !IsNpc(victim) && !victim->Desc
       &&    victim->Switched && IsAffectedBy(victim->Switched, AFF_POSSESS) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      strcpy( buf, PERS( victim, ch ) );
      strcat( buf, " appears to be in a deep trance...\r\n" );
    }
}

static char *get_sex( Character *ch )
{
  switch( ch->Sex )
    {
    case 1:
      return "male";

    case 2:
      return "female";

    default:
      return "undistinguished";
    }
}

static void look_under( Character *ch, const char *what, bool doexaprog )
{
  int count = 0;
  Object *obj = NULL;

  if ( IsNullOrEmpty( what ) )
    {
      ch->Echo("Look beneath what?\r\n");
      return;
    }

  obj = GetObjectHere( ch, what );

  if ( !obj )
    {
      ch->Echo("You do not see that here.\r\n");
      return;
    }

  if ( ch->CarryWeight + obj->Weight > GetCarryCapacityWeight( ch ) )
    {
      ch->Echo("It's too heavy for you to look under.\r\n");
      return;
    }

  count = obj->Count;
  obj->Count = 1;
  Act( AT_PLAIN, "You lift $p and look beneath it:", ch, obj, NULL, TO_CHAR );
  Act( AT_PLAIN, "$n lifts $p and looks beneath it:", ch, obj, NULL, TO_ROOM );
  obj->Count = count;

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
    {
      ShowObjectListToCharacter( obj->Objects(), ch, true, true );
    }
  else
    {
      ch->Echo("Nothing.\r\n");
    }

  if ( doexaprog )
    {
      ObjProgExamineTrigger( ch, obj );
    }
}

static bool requirements_are_met( Character *ch )
{
  if( !ch->Desc )
    {
      return false;
    }

  if ( ch->Position < POS_SLEEPING )
    {
      ch->Echo("You can't see anything but stars!\r\n" );

      return false;
    }

  if ( ch->Position == POS_SLEEPING )
    {
      ch->Echo("You can't see anything, you're sleeping!\r\n" );

      return false;
    }

  if ( IsBlind( ch ) )
    {
      ch->Echo("You can't see a thing!\r\n" );
      return false;
    }

  if ( !IsNpc(ch)
       && !IsBitSet(ch->Flags, PLR_HOLYLIGHT)
       && !IsAffectedBy(ch, AFF_TRUESIGHT)
       && IsRoomDark( ch->InRoom ) )
    {
      SetCharacterColor( AT_DGREY, ch );
      ch->Echo("It is pitch black...\r\n");
      show_char_to_char( ch->InRoom->Characters(), ch );

      return false;
    }

  return true;
}

static void look_in( Character *ch, const char *what, bool doexaprog )
{
  int count = 0;
  Object *obj = NULL;

  if ( IsNullOrEmpty( what ) )
    {
      ch->Echo("Look in what?\r\n");
      return;
    }

  obj = GetObjectHere( ch, what );

  if ( !obj )
    {
      ch->Echo("You do not see that here.\r\n");
      return;
    }

  switch ( obj->ItemType )
    {
    default:
      ch->Echo("That is not a container.\r\n");
      break;

    case ITEM_DRINK_CON:
      if ( obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] <= 0 )
	{
   ch->Echo("It is empty.\r\n");

	  if ( doexaprog )
	    {
	      ObjProgExamineTrigger( ch, obj );
	    }

	  break;
	}

      ch->Echo("It's %s full of a %s liquid.\r\n",
	    obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < obj->Value[OVAL_DRINK_CON_CAPACITY] / 4
	    ? "less than" :
	    obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 3 * obj->Value[OVAL_DRINK_CON_CAPACITY] / 4
	    ? "about"     : "more than",
	    LiquidTable[obj->Value[OVAL_DRINK_CON_LIQUID_TYPE]].Color
	    );

      if ( doexaprog )
	{
	  ObjProgExamineTrigger( ch, obj );
	}
      break;

    case ITEM_PORTAL:
      for(const Exit *pexit : ch->InRoom->Exits())
	{
	  if ( pexit->Direction == DIR_PORTAL
	       &&   IsBitSet(pexit->Flags, EX_PORTAL) )
	    {
	      Room *original = NULL;

	      if ( IsRoomPrivate( ch, pexit->ToRoom )
		   && GetTrustLevel(ch) < SysData.LevelToOverridePrivateFlag )
		{
		  SetCharacterColor( AT_WHITE, ch );
    ch->Echo("That room is private buster!\r\n");
		  return;
		}

	      original = ch->InRoom;
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, pexit->ToRoom );
	      do_look( ch, "auto" );
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, original );
	      return;
	    }
	}

      ch->Echo("You see a swirling chaos...\r\n");
      break;

    case ITEM_CONTAINER:
    case ITEM_CORPSE_NPC:
    case ITEM_CORPSE_PC:
    case ITEM_DROID_CORPSE:
      if ( IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
	{
   ch->Echo("It is closed.\r\n");
	  break;
	}

      count = obj->Count;
      obj->Count = 1;
      Act( AT_PLAIN, "$p contains:", ch, obj, NULL, TO_CHAR );
      obj->Count = count;
      ShowObjectListToCharacter( obj->Objects(), ch, true, true );

      if ( doexaprog )
	{
	  ObjProgExamineTrigger( ch, obj );
	}

      break;
    }
}

static void show_exit_to_char( Character *ch, Exit *pexit, short door )
{
  if ( !IsNullOrEmpty( pexit->Keyword ) )
    {
      if ( IsBitSet(pexit->Flags, EX_CLOSED)
	   && !IsBitSet(pexit->Flags, EX_WINDOW) )
	{
	  if ( IsBitSet(pexit->Flags, EX_SECRET)
	       && door != DIR_INVALID )
	    {
       ch->Echo("Nothing special there.\r\n");
	    }
	  else
	    {
	      Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->Keyword, TO_CHAR );
	    }

	  return;
	}

      if ( IsBitSet( pexit->Flags, EX_BASHED ) )
	{
	  Act(AT_RED, "The $d has been bashed from its hinges!",
	      ch, NULL, pexit->Keyword, TO_CHAR);
	}
    }

  if ( !IsNullOrEmpty( pexit->Description ) )
    {
      ch->Echo(pexit->Description);
    }
  else
    {
      ch->Echo("Nothing special there.\r\n");
    }

  /*
   * Ability to look into the next room                     -Thoric
   */
  if ( pexit->ToRoom
       && ( IsAffectedBy( ch, AFF_SCRYING )
	    || IsBitSet( pexit->Flags, EX_xLOOK )
	    || GetTrustLevel(ch) >= LEVEL_IMMORTAL ) )
    {
      Room *original = NULL;

      if ( !IsBitSet( pexit->Flags, EX_xLOOK )
	   && GetTrustLevel( ch ) < LEVEL_IMMORTAL )
	{
	  SetCharacterColor( AT_MAGIC, ch );
   ch->Echo("You attempt to scry...\r\n");

	  if (!IsNpc(ch) )
	    {
	      int percent = 99;

	      if( GetRandomPercent() > percent )
		{
    ch->Echo("You fail.\r\n");
		  return;
		}
	    }
	}

      if ( IsRoomPrivate( ch, pexit->ToRoom )
	   && GetTrustLevel(ch) < SysData.LevelToOverridePrivateFlag )
	{
	  SetCharacterColor( AT_WHITE, ch );
   ch->Echo("That room is private buster!\r\n");
	  return;
	}

      original = ch->InRoom;

      if ( pexit->Distance > 1 )
	{
	  Room *to_room = GenerateExit( ch->InRoom, &pexit );

	  if ( to_room )
	    {
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, to_room );
	    }
	  else
	    {
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, pexit->ToRoom );
	    }
	}
      else
	{
	  CharacterFromRoom( ch );
	  CharacterToRoom( ch, pexit->ToRoom );
	}

      do_look( ch, "auto" );
      CharacterFromRoom( ch );
      CharacterToRoom( ch, original );
    }
}

/* 'look' or 'look auto' */
static void show_no_arg( Character *ch, bool is_auto )
{
  SetCharacterColor( AT_RMNAME, ch);
  ch->Echo(ch->InRoom->Name);
  ch->Echo(" ");

  if ( !ch->Desc->Original )
    {
      if ((GetTrustLevel(ch) >= LEVEL_IMMORTAL) && (IsBitSet(ch->PCData->Flags, PCFLAG_ROOM)))
	{
	  SetCharacterColor(AT_PURPLE, ch);
          ch->Echo("{%d:%s}", ch->InRoom->Vnum, ch->InRoom->Area->Filename);

	  SetCharacterColor(AT_CYAN, ch);
          ch->Echo("[%s]", FlagString(ch->InRoom->Flags, RoomFlags ).c_str() );
	}
    }

  ch->Echo("\r\n");
  SetCharacterColor( AT_RMDESC, ch );

  if ( !IsNpc(ch) && !IsBitSet(ch->Flags, PLR_BRIEF ) )
    {
      ch->Echo(ch->InRoom->Description);
    }

  if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOEXIT) )
    {
      do_exits( ch, "" );
    }

  show_ships_to_char( ch->InRoom, ch );
  ShowShuttlesToCharacter( ch->InRoom->Shuttles(), ch );
  ShowObjectListToCharacter( ch->InRoom->Objects(), ch, false, false );
  show_char_to_char( ch->InRoom->Characters(),  ch );

  if ( !is_auto )
    {
      Ship *ship = GetShipFromCockpit(ch->InRoom->Vnum);

      if ( ship )
	{
          LookThroughShipWindow(ch, ship);
        }
    }
}

static void LookThroughShipWindow(Character *ch, const Ship *ship)
{
  SetCharacterColor(  AT_WHITE, ch );
  ch ->Echo("\r\nThrough the transparisteel windows you see:\r\n" );

  if ( ship->Location || ship->State == SHIP_LANDED )
    {
      Room *to_room = GetRoom( ship->Location );

      if ( to_room )
        {
          Room *original = ch->InRoom;

          ch->Echo("\r\n" );
          CharacterFromRoom( ch );
          CharacterToRoom( ch, to_room );
          do_glance( ch, "" );
          CharacterFromRoom( ch );
          CharacterToRoom( ch, original );
        }
      else
        {
          ch->Echo("no room?\r\n" );
        }
    }
  else if (ship->Spaceobject )
    {
      SetCharacterColor(  AT_GREEN, ch );

      for(const Spaceobject *spaceobject : Spaceobjects->Entities())
        {
          if ( IsSpaceobjectInRange( ship, spaceobject)
               && spaceobject->Name
               && StrCmp(spaceobject->Name,"") )
            {
              ch->Echo("%s\r\n", spaceobject->Name);
            }
        }
      
      struct UserData data { ch: ch, ship: ship };
      ForEachShip(ShowShipIfInVincinity, &data);
      ch->Echo("\r\n");
    }
}

static bool ShowShipIfInVincinity(Ship *target, void *userData)
{
  struct UserData *data = (struct UserData*)userData;
  const Character *ch = data->ch;
  const Ship *ship = data->ship;

  if ( target != ship && target->Spaceobject )
    {
      if( GetShipDistanceToShip( target, ship ) < 100 * ( ship->Instruments.Sensor + 10 ) * ( ( target->Class == SHIP_DEBRIS ? 2 : target->Class ) + 1 ) )
        {
          ch->Echo("%s    %.0f %.0f %.0f\r\n",
               target->Name,
               (target->Position.x - ship->Position.x),
               (target->Position.y - ship->Position.y),
               (target->Position.z - ship->Position.z));
        }
      else if ( GetShipDistanceToShip( target, ship ) < 100 * ( ship->Instruments.Sensor + 10 ) * ( ( target->Class == SHIP_DEBRIS ? 2 : target->Class ) + 3 ) )
        {
          if ( target->Class == FIGHTER_SHIP )
            {
              ch->Echo("A small metallic mass    %.0f %.0f %.0f\r\n",
                   (target->Position.x - ship->Position.x),
                   (target->Position.y - ship->Position.y),
                   (target->Position.z - ship->Position.z));
            }
          else if ( target->Class == MIDSIZE_SHIP )
            {
              ch->Echo("A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                   (target->Position.x - ship->Position.x),
                   (target->Position.y - ship->Position.y),
                   (target->Position.z - ship->Position.z));
            }
          else if ( target->Class == SHIP_DEBRIS )
            {
              ch->Echo("scattered metallic reflections    %.0f %.0f %.0f\r\n",
                   (target->Position.x - ship->Position.x),
                   (target->Position.y - ship->Position.y),
                   (target->Position.z - ship->Position.z));
            }
          else if ( target->Class >= CAPITAL_SHIP )
            {
              ch->Echo("A huge metallic mass    %.0f %.0f %.0f\r\n",
                   (target->Position.x - ship->Position.x),
                   (target->Position.y - ship->Position.y),
                   (target->Position.z - ship->Position.z));
            }
          else
            {
              /* Do nothing for other ship classes */
            }
        }
    }

  return true;
}


