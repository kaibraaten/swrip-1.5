#include "character.h"
#include "mud.h"
#include "skill.h"

void do_drink( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  int liquid = 0;

  argument = OneArgument( argument, arg );
  /* munch optional words */
  if ( !StrCmp( arg, "from" ) && !IsNullOrEmpty( argument ) )
    argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      for ( obj = ch->InRoom->FirstContent; obj; obj = obj->NextContent )
        if ( (obj->ItemType == ITEM_FOUNTAIN)
             ||   (obj->ItemType == ITEM_BLOOD) )
          break;

      if ( !obj )
        {
          SendToCharacter( "Drink what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj = GetObjectHere( ch, arg ) ) == NULL )
        {
          SendToCharacter( "You can't find it.\r\n", ch );
          return;
        }
    }

  if ( obj->Count > 1 && obj->ItemType != ITEM_FOUNTAIN )
    SeparateOneObjectFromGroup(obj);

  if ( !IsNpc(ch) && ch->PCData->Condition[COND_DRUNK] > 40 )
    {
      SendToCharacter( "You fail to reach your mouth.  *Hic*\r\n", ch );
      return;
    }

  switch ( obj->ItemType )
    {
    default:
      if ( obj->CarriedBy == ch )
        {
          Act( AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, TO_CHAR );
        }
      else
        {
          Act( AT_ACTION, "$n gets down and tries to drink from $p... (Is $e feeling ok?)", ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You get down on the ground and try to drink from $p...", ch, obj, NULL, TO_CHAR );
        }
      break;

    case ITEM_POTION:
      if ( obj->CarriedBy == ch )
        do_quaff( ch, obj->Name );
      else
        SendToCharacter( "You're not carrying that.\r\n", ch );
      break;

    case ITEM_FOUNTAIN:
      if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
        {
          Act( AT_ACTION, "$n drinks from the fountain.", ch, NULL, NULL, TO_ROOM );
	  SendToCharacter( "You take a long thirst quenching drink.\r\n", ch );
        }

      if ( !IsNpc(ch) )
        ch->PCData->Condition[COND_THIRST] = 40;
      break;

    case ITEM_DRINK_CON:
      if ( obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] <= 0 )
        {
          SendToCharacter( "It is already empty.\r\n", ch );
          return;
        }

      if ( ( liquid = obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] ) >= LIQ_MAX )
        {
          Bug( "Do_drink: bad liquid number %d.", liquid );
          liquid = obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = LIQ_WATER;
        }

      if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
        {
          Act( AT_ACTION, "$n drinks $T from $p.",
               ch, obj, LiquidTable[liquid].Name, TO_ROOM );
          Act( AT_ACTION, "You drink $T from $p.",
               ch, obj, LiquidTable[liquid].Name, TO_CHAR );
        }

      GainCondition( ch, COND_DRUNK,
                      LiquidTable[liquid].Affect[COND_DRUNK  ] );
      GainCondition( ch, COND_FULL,
                      LiquidTable[liquid].Affect[COND_FULL   ] );
      GainCondition( ch, COND_THIRST,
                      LiquidTable[liquid].Affect[COND_THIRST ] );

      if ( !IsNpc(ch) )
        {
          if ( ch->PCData->Condition[COND_DRUNK]  > 24 )
            SendToCharacter( "You feel quite sloshed.\r\n", ch );
          else if ( ch->PCData->Condition[COND_DRUNK]  > 18 )
	    SendToCharacter( "You feel very drunk.\r\n", ch );
	  else if ( ch->PCData->Condition[COND_DRUNK]  > 12 )
	    SendToCharacter( "You feel drunk.\r\n", ch );
	  else if ( ch->PCData->Condition[COND_DRUNK]  > 8 )
	    SendToCharacter( "You feel a little drunk.\r\n", ch );
	  else if ( ch->PCData->Condition[COND_DRUNK]  > 5 )
	    SendToCharacter( "You feel light headed.\r\n", ch );

          if ( ch->PCData->Condition[COND_FULL]   > 40 )
            SendToCharacter( "You are full.\r\n", ch );

          if ( ch->PCData->Condition[COND_THIRST] > 40 )
            SendToCharacter( "You feel bloated.\r\n", ch );
          else if ( ch->PCData->Condition[COND_THIRST] > 36 )
	    SendToCharacter( "Your stomach is sloshing around.\r\n", ch );
	  else if ( ch->PCData->Condition[COND_THIRST] > 30 )
	    SendToCharacter( "You do not feel thirsty.\r\n", ch );
        }

      if ( obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] > 0 )
        {
          /* The drink was poisoned! */
          Affect af;

          Act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          Act( AT_POISON, "You sputter and gag.", ch, NULL, NULL, TO_CHAR );
          ch->MentalState = urange( 20, ch->MentalState + 5, 100 );
          af.Type       = gsn_poison;
          af.Duration   = 3 * obj->Value[OVAL_DRINK_CON_POISON_STRENGTH];
          af.Location   = APPLY_NONE;
          af.Modifier   = 0;
          af.AffectedBy = AFF_POISON;
          JoinAffect( ch, &af );
        }

      obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] -= 1;
      break;
    }

  SetWaitState(ch, PULSE_PER_SECOND );
}

