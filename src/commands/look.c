#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "vector3_aux.h"
#include "ship.h"
#include "shuttle.h"
#include "character.h"
#include "skill.h"
#include "spaceobject.h"

/* Locals */
void show_char_to_char( Character *list, Character *ch );

static void show_char_to_char_0( Character *victim, Character *ch );
static void show_char_to_char_1( Character *victim, Character *ch );
static void show_ships_to_char( Ship *ship, Character *ch );
static void show_visible_affects_to_char( Character *victim, Character *ch );
static void show_exit_to_char( Character *ch, Exit *pexit, short door );
static void show_no_arg( Character *ch, bool is_auto );

static char *get_sex( Character *ch );
static void look_under( Character *ch, const char *what, bool doexaprog );
static void look_in( Character *ch, const char *what, bool doexaprog );
static bool requirements_are_met( Character *ch );

void do_look( Character *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  Exit *pexit;
  Character *victim;
  Object *obj;
  char *pdesc;
  bool doexaprog;
  short door;
  int number, cnt;
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

  pdesc = GetExtraDescription(arg1, ch->in_room->first_extradesc);

  if ( pdesc )
    {
      SendToCharacter( "\r\n", ch );
      SendToCharacter( pdesc, ch );
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
      Bug("%s:%s:%d: door != DIR_INVALID", __FUNCTION__, __FILE__, __LINE__);
      SendToCharacter( "Nothing special there.\r\n", ch );
      return;
    }

  victim = GetCharacterInRoom( ch, arg1 );

  if ( victim )
    {
      show_char_to_char_1( victim, ch );
      return;
    }

  number = NumberArgument( arg1, arg );

  for ( cnt = 0, obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if ( CanSeeObject( ch, obj ) )
        {
          if ( (pdesc=GetExtraDescription(arg, obj->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
                continue;
              SendToCharacter( pdesc, ch );
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }

          if ( (pdesc=GetExtraDescription(arg, obj->Prototype->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
		continue;
              SendToCharacter( pdesc, ch );
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }

          if ( NiftyIsNamePrefix( arg, obj->name ) )
            {
              if ( (cnt += obj->count) < number )
                continue;
              pdesc = GetExtraDescription( obj->name, obj->Prototype->first_extradesc );
              if ( !pdesc )
                pdesc = GetExtraDescription( obj->name, obj->first_extradesc );
              if ( !pdesc )
                SendToCharacter( "You see nothing special.\r\n", ch );
              else
                SendToCharacter( pdesc, ch );
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }
        }
    }

  for ( obj = ch->in_room->last_content; obj; obj = obj->prev_content )
    {
      if ( CanSeeObject( ch, obj ) )
        {
          if ( (pdesc=GetExtraDescription(arg, obj->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
                continue;

              SendToCharacter( pdesc, ch );

              if ( doexaprog )
		ObjProgExamineTrigger( ch, obj );

              return;
            }

          if ( (pdesc=GetExtraDescription(arg, obj->Prototype->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
                continue;
              SendToCharacter( pdesc, ch );

              if ( doexaprog )
		ObjProgExamineTrigger( ch, obj );

              return;
            }

          if ( NiftyIsNamePrefix( arg, obj->name ) )
	    {
              if ( (cnt += obj->count) < number )
                continue;
              pdesc = GetExtraDescription( obj->name, obj->Prototype->first_extradesc );
              if ( !pdesc )
                pdesc = GetExtraDescription( obj->name, obj->first_extradesc );
              if ( !pdesc )
                SendToCharacter( "You see nothing special.\r\n", ch );
              else
                SendToCharacter( pdesc, ch );
              if ( doexaprog ) ObjProgExamineTrigger( ch, obj );
              return;
            }
        }
    }

  SendToCharacter( "You do not see that here.\r\n", ch );
}

static void show_char_to_char_0( Character *victim, Character *ch )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf1[MAX_STRING_LENGTH];
  char message[MAX_STRING_LENGTH];

  if ( !IsNpc(victim) && !victim->desc )
    {
      if ( !victim->switched )          strcat( buf, "(Link Dead) "  );
      else
        if ( !IsAffectedBy(victim->switched, AFF_POSSESS) )
          strcat( buf, "(Switched) " );
    }
  if ( !IsNpc(victim)
       && IsBitSet(victim->act, PLR_AFK) )                strcat( buf, "[AFK] ");

  if ( (!IsNpc(victim) && IsBitSet(victim->act, PLR_WIZINVIS))
       || (IsNpc(victim) && IsBitSet(victim->act, ACT_MOBINVIS)) )
    {
      if (!IsNpc(victim))
        sprintf( buf1,"(Invis %d) ", victim->pcdata->wizinvis );
      else sprintf( buf1,"(Mobinvis %d) ", victim->mobinvis);
      strcat( buf, buf1 );
    }
  if ( IsAffectedBy(victim, AFF_INVISIBLE)   ) strcat( buf, "(Invis) "      );
  if ( IsAffectedBy(victim, AFF_HIDE)        ) strcat( buf, "(Stealth) "       );
  if ( IsAffectedBy(victim, AFF_PASS_DOOR)   ) strcat( buf, "(Translucent) ");
  if ( IsAffectedBy(victim, AFF_FAERIE_FIRE) ) strcat( buf, "&P(Pink Aura)&w "  );
  if ( IsEvil(victim)
       &&   IsAffectedBy(ch, AFF_DETECT_EVIL)     ) strcat( buf, "&R(Red Aura)&w "   );
  if ( ( victim->mana > 10 )
       &&   ( IsAffectedBy( ch , AFF_DETECT_MAGIC ) || IsImmortal( ch ) ) )
    strcat( buf, "&B(Blue Aura)&w "  );
  if ( !IsNpc(victim) && IsBitSet(victim->act, PLR_LITTERBUG  ) )
    strcat( buf, "(LITTERBUG) "  );
  if ( IsNpc(victim) && IsImmortal(ch)
       && IsBitSet(victim->act, ACT_PROTOTYPE) ) strcat( buf, "(PROTO) " );
  if ( victim->desc && victim->desc->connection_state == CON_EDITING )
    strcat( buf, "(Writing) " );

  SetCharacterColor( AT_PERSON, ch );
  
  if ( victim->position == victim->defposition && !IsNullOrEmpty( victim->long_descr ) )
    {
      strcat( buf, victim->long_descr );
      SendToCharacter( buf, ch );
      show_visible_affects_to_char( victim, ch );
      return;
    }

  if ( !IsNpc(victim) && !IsBitSet(ch->act, PLR_BRIEF) )
    strcat( buf, victim->pcdata->title );
  else
    strcat( buf, PERS( victim, ch ) );

  switch ( victim->position )
    {
    case POS_DEAD:     strcat( buf, " is DEAD!!" );                     break;
    case POS_MORTAL:   strcat( buf, " is mortally wounded." );          break;
    case POS_INCAP:    strcat( buf, " is incapacitated." );             break;
    case POS_STUNNED:  strcat( buf, " is lying here stunned." );        break;
    case POS_SLEEPING:
      if (victim->on != NULL)
        {
          if (victim->on->value[OVAL_FURNITURE_PREPOSITION] == SLEEP_AT)
            {
              sprintf(message," is sleeping at %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->on->value[OVAL_FURNITURE_PREPOSITION] == SLEEP_ON)
            {
              sprintf(message," is sleeping on %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
		  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is sleeping in %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->position == POS_SITTING
              ||  ch->position == POS_RESTING )
            strcat( buf, " is sleeping nearby." );
          else
            strcat( buf, " is deep in slumber here." );
        }
      break;
    case POS_RESTING:
      if (victim->on != NULL)
        {
          if (victim->on->value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
            {
              sprintf(message," is resting at %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->on->value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
            {
              sprintf(message," is resting on %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
	      strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is resting in %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->position == POS_RESTING)
            strcat ( buf, " is sprawled out alongside you." );
          else
            if (ch->position == POS_MOUNTED)
              strcat ( buf, " is sprawled out at the foot of your mount." );
            else
              strcat (buf, " is sprawled out here." );
        }
      break;
    case POS_SITTING:
      if (victim->on != NULL)
        {
          if (victim->on->value[OVAL_FURNITURE_PREPOSITION] == SIT_AT)
            {
              sprintf(message," is sitting at %s",
                      victim->on->short_descr);
              if( (ch->position == POS_SITTING)
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->on->value[OVAL_FURNITURE_PREPOSITION] == SIT_ON)
            {
              sprintf(message," is sitting on %s",
                      victim->on->short_descr);
              if( (ch->position == POS_SITTING)
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
	      strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is sitting in %s",
                      victim->on->short_descr);
              if( (ch->position == POS_SITTING)
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->position == POS_SITTING)
            strcat( buf, " sits here with you." );
          else
            if (ch->position == POS_RESTING)
              strcat( buf, " sits nearby as you lie around." );
            else
              strcat( buf, " sits upright here." );
        }
      break;
    case POS_STANDING:
      if ( IsImmortal(victim) )
        strcat( buf, " is here before you." );
      else
        if ( ( victim->in_room->Sector == SECT_UNDERWATER )
             && !IsAffectedBy(victim, AFF_AQUA_BREATH) && !IsNpc(victim) )
          strcat( buf, " is drowning here." );
        else
          if ( victim->in_room->Sector == SECT_UNDERWATER )
            strcat( buf, " is here in the water." );
          else
            if ( ( victim->in_room->Sector == SECT_OCEANFLOOR )
                 && !IsAffectedBy(victim, AFF_AQUA_BREATH) && !IsNpc(victim) )
              strcat( buf, " is drowning here." );
            else
              if ( victim->in_room->Sector == SECT_OCEANFLOOR )
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
      if ( !victim->mount )
        strcat( buf, "thin air???" );
      else
        if ( victim->mount == ch )
          strcat( buf, "your back." );
        else
          if ( victim->in_room == victim->mount->in_room )
            {
              strcat( buf, PERS( victim->mount, ch ) );
              strcat( buf, "." );
            }
          else
            strcat( buf, "someone who left??" );
      break;
    case POS_FIGHTING:
      strcat( buf, " is here, fighting " );
      if ( !victim->fighting )
        strcat( buf, "thin air???" );
      else if ( GetFightingOpponent( victim ) == ch )
        strcat( buf, "YOU!" );
      else if ( victim->in_room == victim->fighting->who->in_room )
        {
          strcat( buf, PERS( victim->fighting->who, ch ) );
          strcat( buf, "." );
        }
      else
        strcat( buf, "someone who left??" );
      break;
    }

  strcat( buf, "\r\n" );
  buf[0] = CharToUppercase(buf[0]);
  SendToCharacter( buf, ch );
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

  Echo( ch, "%s is a %s %s\r\n", victim->name, get_sex( victim ), npc_race[victim->race] );

  if ( !IsNullOrEmpty( victim->description ) )
    {
      SendToCharacter( victim->description, ch );
    }
  else
    {
      Act( AT_PLAIN, "You see nothing special about $M.", ch, NULL, victim, TO_CHAR );
    }

  ShowCharacterCondition( ch, victim );

  found = false;

  if( ( (obj = GetEquipmentOnCharacter( victim, WEAR_OVER ) ) == NULL ) || obj->value[2] == 0 || IsGreater(ch) )
    {
      for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
        {
          if ( ( obj = GetEquipmentOnCharacter( victim, iWear ) ) != NULL
               && CanSeeObject( ch, obj )
	       && ( !IsNullOrEmpty( obj->description )
		    || ( IsBitSet(ch->act, PLR_HOLYLIGHT)
			 || IsNpc(ch) ) ) )
            {
              if ( !found )
                {
                  SendToCharacter( "\r\n", ch );
		  Act( AT_PLAIN, "$N is using:", ch, NULL, victim, TO_CHAR );
                  found = true;
                }
              SendToCharacter( where_name[iWear], ch );
              SendToCharacter( FormatObjectToCharacter( obj, ch, true ), ch );
              SendToCharacter( "\r\n", ch );
            }
        }
    }
  else
    {
      SendToCharacter( where_name[WEAR_OVER], ch );
      SendToCharacter( FormatObjectToCharacter( obj, ch, true ), ch );
      SendToCharacter( "\r\n", ch );
    }

  if ( IsNpc(ch) || victim == ch )
    return;

  if ( GetRandomPercent() < ch->pcdata->learned[gsn_peek] )
    {
      SendToCharacter( "\r\nYou peek at the inventory:\r\n", ch );
      ShowObjectListToCharacter( victim->first_carrying, ch, true, true );
      LearnFromSuccess( ch, gsn_peek );
    }
  else
    if ( ch->pcdata->learned[gsn_peek] )
      LearnFromFailure( ch, gsn_peek );
}

static void show_ships_to_char( Ship *ship, Character *ch )
{
  Ship *rship;
  Ship *nship=NULL;

  for ( rship = ship; rship; rship = nship )
    {
      Echo( ch , "&C%-35s     ", rship->name );
      if ( ( nship = rship->next_in_room ) !=NULL )
        {
          Echo( ch , "%-35s", nship->name );
          nship = nship->next_in_room;
        }
      Echo( ch, "\r\n&w");
    }
}

void show_char_to_char( Character *list, Character *ch )
{
  Character *rch;

  for ( rch = list; rch; rch = rch->next_in_room )
    {
      if ( rch == ch )
        continue;

      if ( CanSeeCharacter( ch, rch ) )
        {
          show_char_to_char_0( rch, ch );
        }
      else if ( rch->race == RACE_DEFEL )
        {
          SetCharacterColor( AT_BLOOD, ch );
          SendToCharacter( "You see a pair of red eyes staring back at you.\r\n", ch );
        }
      else if ( IsRoomDark( ch->in_room )
                &&        IsAffectedBy(rch, AFF_INFRARED ) )
        {
          SetCharacterColor( AT_BLOOD, ch );
          SendToCharacter( "The red form of a living creature is here.\r\n", ch );
        }
    }
}

static void show_visible_affects_to_char( Character *victim, Character *ch )
{
  char buf[MAX_STRING_LENGTH];

  if ( IsAffectedBy(victim, AFF_CHARM)       )
    {
      SetCharacterColor( AT_MAGIC, ch );
      Echo( ch, "%s looks ahead free of expression.\r\n",
                 IsNpc( victim ) ? Capitalize(victim->short_descr) : (victim->name) );
    }
  if ( !IsNpc(victim) && !victim->desc
       &&    victim->switched && IsAffectedBy(victim->switched, AFF_POSSESS) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      strcpy( buf, PERS( victim, ch ) );
      strcat( buf, " appears to be in a deep trance...\r\n" );
    }
}

static char *get_sex( Character *ch )
{
  switch( ch->sex )
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
      SendToCharacter( "Look beneath what?\r\n", ch );
      return;
    }

  obj = GetObjectHere( ch, what );

  if ( !obj )
    {
      SendToCharacter( "You do not see that here.\r\n", ch );
      return;
    }

  if ( ch->carry_weight + obj->weight > GetCarryCapacityWeight( ch ) )
    {
      SendToCharacter( "It's too heavy for you to look under.\r\n", ch );
      return;
    }

  count = obj->count;
  obj->count = 1;
  Act( AT_PLAIN, "You lift $p and look beneath it:", ch, obj, NULL, TO_CHAR );
  Act( AT_PLAIN, "$n lifts $p and looks beneath it:", ch, obj, NULL, TO_ROOM );
  obj->count = count;

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
    {
      ShowObjectListToCharacter( obj->first_content, ch, true, true );
    }
  else
    {
      SendToCharacter( "Nothing.\r\n", ch );
    }

  if ( doexaprog )
    {
      ObjProgExamineTrigger( ch, obj );
    }
}

static bool requirements_are_met( Character *ch )
{
  if( !ch->desc )
    {
      return false;
    }

  if ( ch->position < POS_SLEEPING )
    {
      Echo( ch, "You can't see anything but stars!\r\n" );

      return false;
    }

  if ( ch->position == POS_SLEEPING )
    {
      Echo( ch, "You can't see anything, you're sleeping!\r\n" );

      return false;
    }

  if ( IsBlind( ch ) )
    {
      Echo( ch, "You can't see a thing!\r\n" );
      return false;
    }

  if ( !IsNpc(ch)
       && !IsBitSet(ch->act, PLR_HOLYLIGHT)
       && !IsAffectedBy(ch, AFF_TRUESIGHT)
       && IsRoomDark( ch->in_room ) )
    {
      SetCharacterColor( AT_DGREY, ch );
      SendToCharacter( "It is pitch black...\r\n", ch );
      show_char_to_char( ch->in_room->first_person, ch );

      return false;
    }

  return true;
}

static void look_in( Character *ch, const char *what, bool doexaprog )
{
  int count = 0;
  Object *obj = NULL;
  Exit *pexit = NULL;

  if ( IsNullOrEmpty( what ) )
    {
      SendToCharacter( "Look in what?\r\n", ch );
      return;
    }

  obj = GetObjectHere( ch, what );

  if ( !obj )
    {
      SendToCharacter( "You do not see that here.\r\n", ch );
      return;
    }

  switch ( obj->item_type )
    {
    default:
      SendToCharacter( "That is not a container.\r\n", ch );
      break;

    case ITEM_DRINK_CON:
      if ( obj->value[1] <= 0 )
	{
	  SendToCharacter( "It is empty.\r\n", ch );

	  if ( doexaprog )
	    {
	      ObjProgExamineTrigger( ch, obj );
	    }

	  break;
	}

      Echo( ch, "It's %s full of a %s liquid.\r\n",
                     obj->value[1] <     obj->value[0] / 4
		 ? "less than" :
                     obj->value[1] < 3 * obj->value[0] / 4
		 ? "about"     : "more than",
                     LiquidTable[obj->value[2]].liq_color
		 );

      if ( doexaprog )
	{
	  ObjProgExamineTrigger( ch, obj );
	}
      break;

    case ITEM_PORTAL:
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
	{
	  if ( pexit->vdir == DIR_PORTAL
	       &&   IsBitSet(pexit->exit_info, EX_PORTAL) )
	    {
	      Room *original = NULL;

	      if ( IsRoomPrivate( ch, pexit->to_room )
		   && GetTrustLevel(ch) < sysdata.level_override_private )
		{
		  SetCharacterColor( AT_WHITE, ch );
		  SendToCharacter( "That room is private buster!\r\n", ch );
		  return;
		}

	      original = ch->in_room;
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, pexit->to_room );
	      do_look( ch, "auto" );
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, original );
	      return;
	    }
	}

      SendToCharacter( "You see a swirling chaos...\r\n", ch );
      break;

    case ITEM_CONTAINER:
    case ITEM_CORPSE_NPC:
    case ITEM_CORPSE_PC:
    case ITEM_DROID_CORPSE:
      if ( IsBitSet(obj->value[1], CONT_CLOSED) )
	{
	  SendToCharacter( "It is closed.\r\n", ch );
	  break;
	}

      count = obj->count;
      obj->count = 1;
      Act( AT_PLAIN, "$p contains:", ch, obj, NULL, TO_CHAR );
      obj->count = count;
      ShowObjectListToCharacter( obj->first_content, ch, true, true );

      if ( doexaprog )
	{
	  ObjProgExamineTrigger( ch, obj );
	}

      break;
    }
}

static void show_exit_to_char( Character *ch, Exit *pexit, short door )
{
  if ( pexit->keyword )
    {
      if ( IsBitSet(pexit->exit_info, EX_CLOSED)
	   && !IsBitSet(pexit->exit_info, EX_WINDOW) )
	{
	  if ( IsBitSet(pexit->exit_info, EX_SECRET)
	       && door != DIR_INVALID )
	    {
	      SendToCharacter( "Nothing special there.\r\n", ch );
	    }
	  else
	    {
	      Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
	    }

	  return;
	}

      if ( IsBitSet( pexit->exit_info, EX_BASHED ) )
	{
	  Act(AT_RED, "The $d has been bashed from its hinges!",
	      ch, NULL, pexit->keyword, TO_CHAR);
	}
    }

  if ( !IsNullOrEmpty( pexit->description ) )
    {
      SendToCharacter( pexit->description, ch );
    }
  else
    {
      SendToCharacter( "Nothing special there.\r\n", ch );
    }

  /*
   * Ability to look into the next room                     -Thoric
   */
  if ( pexit->to_room
       && ( IsAffectedBy( ch, AFF_SCRYING )
	    || IsBitSet( pexit->exit_info, EX_xLOOK )
	    || GetTrustLevel(ch) >= LEVEL_IMMORTAL ) )
    {
      Room *original = NULL;

      if ( !IsBitSet( pexit->exit_info, EX_xLOOK )
	   && GetTrustLevel( ch ) < LEVEL_IMMORTAL )
	{
	  SetCharacterColor( AT_MAGIC, ch );
	  SendToCharacter( "You attempt to scry...\r\n", ch );

	  if (!IsNpc(ch) )
	    {
	      int percent = 99;

	      if( GetRandomPercent() > percent )
		{
		  SendToCharacter( "You fail.\r\n", ch );
		  return;
		}
	    }
	}

      if ( IsRoomPrivate( ch, pexit->to_room )
	   && GetTrustLevel(ch) < sysdata.level_override_private )
	{
	  SetCharacterColor( AT_WHITE, ch );
	  SendToCharacter( "That room is private buster!\r\n", ch );
	  return;
	}

      original = ch->in_room;

      if ( pexit->distance > 1 )
	{
	  Room *to_room = GenerateExit( ch->in_room, &pexit );

	  if ( to_room )
	    {
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, to_room );
	    }
	  else
	    {
	      CharacterFromRoom( ch );
	      CharacterToRoom( ch, pexit->to_room );
	    }
	}
      else
	{
	  CharacterFromRoom( ch );
	  CharacterToRoom( ch, pexit->to_room );
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
  SendToCharacter( ch->in_room->name, ch);
  SendToCharacter(" ", ch);

  if ( !ch->desc->original )
    {
      if ((GetTrustLevel(ch) >= LEVEL_IMMORTAL) && (IsBitSet(ch->pcdata->flags, PCFLAG_ROOM)))
	{
	  SetCharacterColor(AT_PURPLE, ch);
	  Echo(ch, "{%d:%s}", ch->in_room->vnum, ch->in_room->area->filename);

	  SetCharacterColor(AT_CYAN, ch);
	  Echo( ch, "[%s]", FlagString(ch->in_room->room_flags, room_flags ) );
	}
    }

  SendToCharacter( "\r\n", ch );
  SetCharacterColor( AT_RMDESC, ch );

  if ( !IsNpc(ch) && !IsBitSet(ch->act, PLR_BRIEF ) )
    {
      SendToCharacter( ch->in_room->description, ch );
    }

  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_AUTOEXIT) )
    {
      do_exits( ch, "" );
    }

  show_ships_to_char( ch->in_room->first_ship, ch );
  ShowShuttlesToCharacter( ch->in_room->first_shuttle, ch );
  ShowObjectListToCharacter( ch->in_room->first_content, ch, false, false );
  show_char_to_char( ch->in_room->first_person,  ch );

  if ( !is_auto )
    {
      Ship *ship = GetShipFromCockpit(ch->in_room->vnum);

      if ( ship )
	{
	  SetCharacterColor(  AT_WHITE, ch );
	  Echo( ch , "\r\nThrough the transparisteel windows you see:\r\n" );

	  if ( ship->location || ship->shipstate == SHIP_LANDED )
	    {
	      Room *to_room = GetRoom( ship->location );

	      if ( to_room )
		{
		  Room *original = ch->in_room;

		  Echo( ch, "\r\n" );
		  CharacterFromRoom( ch );
		  CharacterToRoom( ch, to_room );
		  do_glance( ch, "" );
		  CharacterFromRoom( ch );
		  CharacterToRoom( ch, original );
		}
	      else
		{
		  Echo( ch, "no room?\r\n" );
		}
	    }
	  else if (ship->spaceobject )
	    {
	      Ship *target = NULL;
	      Spaceobject *spaceobject = NULL;

	      SetCharacterColor(  AT_GREEN, ch );

	      for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
		{
		  if ( IsSpaceobjectInRange( ship, spaceobject)
		       && spaceobject->Name
		       && StrCmp(spaceobject->Name,"") )
		    {
		      Echo(ch, "%s\r\n", spaceobject->Name);
		    }
		}

	      for ( target = first_ship; target; target = target->next )
		{
		  if ( target != ship && target->spaceobject )
		    {
		      if( GetShipDistanceToShip( target, ship ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 1 ) )
			{
			  Echo(ch, "%s    %.0f %.0f %.0f\r\n",
				    target->name,
				    (target->pos.x - ship->pos.x),
				    (target->pos.y - ship->pos.y),
				    (target->pos.z - ship->pos.z));
			}
		      else if ( GetShipDistanceToShip( target, ship ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 3 ) )
			{
			  if ( target->sclass == FIGHTER_SHIP )
			    {
			      Echo(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }

			  if ( target->sclass == MIDSIZE_SHIP )
			    {
			      Echo(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }

			  if ( target->sclass == SHIP_DEBRIS )
			    {
			      Echo(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }
			  else if ( target->sclass >= CAPITAL_SHIP )
			    {
			      Echo(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }
			}
		    }
		}

	      Echo(ch,"\r\n");
	    }
	}
    }
}
