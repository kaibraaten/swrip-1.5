#include "mud.h"
#include "character.hpp"
#include "skill.h"

void do_eat( Character *ch, char *argument )
{
  Object *obj;
  ch_ret retcode;
  int foodcond;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Eat what?\r\n", ch );
      return;
    }

  if ( IsNpc(ch) || ch->PCData->Condition[COND_FULL] > 5 )
    if ( HasMentalStateToFindObject(ch) )
      return;

  if ( (obj = FindObject(ch, argument, true)) == NULL )
    return;

  if ( !IsImmortal(ch) )
    {
      if ( obj->ItemType != ITEM_FOOD && obj->ItemType != ITEM_PILL )
        {
          Act( AT_ACTION, "$n starts to nibble on $p... ($e must really be hungry)",  ch, obj, NULL, TO_ROOM );
	  Act( AT_ACTION, "You try to nibble on $p...", ch, obj, NULL, TO_CHAR );
          return;
        }

      if ( !IsNpc(ch) && ch->PCData->Condition[COND_FULL] > 40 )
        {
          SendToCharacter( "You are too full to eat more.\r\n", ch );
          return;
        }
    }

  /* required due to object grouping */
  SeparateOneObjectFromGroup( obj );

  SetWaitState( ch, PULSE_PER_SECOND/2 );

  if ( obj->InObject )
    {
      Act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->InObject, TO_CHAR );
      Act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->InObject, TO_ROOM );
    }
  if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( IsNullOrEmpty( obj->ActionDescription ) )
        {
          Act( AT_ACTION, "$n eats $p.",  ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You eat $p.", ch, obj, NULL, TO_CHAR );
        }
      else
        ActionDescription( ch, obj, NULL );
    }

  switch ( obj->ItemType )
    {
    case ITEM_FOOD:
      if ( obj->Timer > 0 && obj->Value[OVAL_FOOD_MAX_CONDITION] > 0 )
        foodcond = (obj->Timer * 10) / obj->Value[OVAL_FOOD_MAX_CONDITION];
      else
        foodcond = 10;

      if ( !IsNpc(ch) )
        {
          int condition = ch->PCData->Condition[COND_FULL];

          GainCondition( ch, COND_FULL, (obj->Value[OVAL_FOOD_SATISFACTION] * foodcond) / 10 );

          if ( condition <= 1 && ch->PCData->Condition[COND_FULL] > 1 )
            SendToCharacter( "You are no longer hungry.\r\n", ch );
          else if ( ch->PCData->Condition[COND_FULL] > 40 )
            SendToCharacter( "You are full.\r\n", ch );
        }

      if (  obj->Value[OVAL_FOOD_POISON] != 0
            ||   (foodcond < 4 && GetRandomNumberFromRange( 0, foodcond + 1 ) == 0) )
        {
          /* The food was poisoned! */
          Affect af;

          if ( obj->Value[OVAL_FOOD_POISON] != 0 )
            {
              Act( AT_POISON, "$n chokes and gags.", ch, NULL, NULL, TO_ROOM );
              Act( AT_POISON, "You choke and gag.", ch, NULL, NULL, TO_CHAR );
              ch->MentalState = urange( 20, ch->MentalState + 5, 100 );
            }
          else
            {
              Act( AT_POISON, "$n gags on $p.", ch, obj, NULL, TO_ROOM );
              Act( AT_POISON, "You gag on $p.", ch, obj, NULL, TO_CHAR );
              ch->MentalState = urange( 15, ch->MentalState + 5, 100 );
            }

          af.Type       = gsn_poison;
          af.Duration   = 2 * obj->Value[OVAL_FOOD_SATISFACTION] * (obj->Value[OVAL_FOOD_POISON] > 0 ? obj->Value[OVAL_FOOD_POISON] : 1);
          af.Location   = APPLY_NONE;
          af.Modifier   = 0;
          af.AffectedBy = AFF_POISON;
          JoinAffect( ch, &af );
        }
      break;

    case ITEM_PILL:
      /* allow pills to fill you, if so desired */
      if ( !IsNpc(ch) && obj->Value[OVAL_PILL_SATISFACTION] )
        {
          int condition = ch->PCData->Condition[COND_FULL];
          GainCondition( ch, COND_FULL, obj->Value[4] );

	  if ( condition <= 1 && ch->PCData->Condition[COND_FULL] > 1 )
            SendToCharacter( "You are no longer hungry.\r\n", ch );
          else if ( ch->PCData->Condition[COND_FULL] > 40 )
            SendToCharacter( "You are full.\r\n", ch );
        }
      retcode = CastSpellWithObject( obj->Value[OVAL_PILL_SPELL1], obj->Value[OVAL_PILL_LEVEL], ch, ch, NULL );

      if ( retcode == rNONE )
        retcode = CastSpellWithObject( obj->Value[OVAL_PILL_SPELL2], obj->Value[OVAL_PILL_LEVEL], ch, ch, NULL );

      if ( retcode == rNONE )
        retcode = CastSpellWithObject( obj->Value[OVAL_PILL_SPELL3], obj->Value[OVAL_PILL_LEVEL], ch, ch, NULL );

      break;

    default:
      break;
    }

  if ( obj->Serial == cur_obj )
    global_objcode = rOBJ_EATEN;

  ExtractObject( obj );
}
