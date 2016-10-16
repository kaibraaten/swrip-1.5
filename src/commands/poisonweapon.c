#include "character.h"
#include "mud.h"
#include "skill.h"

void do_poison_weapon( Character *ch, char *argument )
{
  Object *obj;
  Object *pobj;
  Object *wobj;
  char      arg [ MAX_INPUT_LENGTH ];
  int       percent;

  if ( !IsNpc( ch )
       &&  ch->PCData->Learned[gsn_poison_weapon] <= 0  )
    {
      SendToCharacter( "What do you think you are, a thief?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "What are you trying to poison?\r\n",    ch );
      return;
    }
  if ( ch->Fighting )
    {
      SendToCharacter( "While you're fighting?  Nice try.\r\n", ch );
      return;
    }
  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( !( obj = GetCarriedObject( ch, arg ) ) )
    {
      SendToCharacter( "You do not have that weapon.\r\n",      ch );
      return;
    }
  if ( obj->item_type != ITEM_WEAPON )
    {
      SendToCharacter( "That item is not a weapon.\r\n",        ch );
      return;
    }
  if ( obj->value[3] != WEAPON_VIBRO_BLADE && obj->value[3] != WEAPON_FORCE_PIKE )
    {
      SendToCharacter( "You can not apply poison to that.\r\n",        ch );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_POISONED ) )
    {
      SendToCharacter( "That weapon is already poisoned.\r\n",  ch );
      return;
    }
  /* Now we have a valid weapon...check to see if we have the powder. */
  for ( pobj = ch->FirstCarrying; pobj; pobj = pobj->NextContent )
    {
      if ( pobj->Prototype->Vnum == OBJ_VNUM_BLACK_POWDER )
        break;
    }
  if ( !pobj )
    {
      SendToCharacter( "You do not have the black poison powder.\r\n", ch );
      return;
    }
  /* Okay, we have the powder...do we have water? */
  for ( wobj = ch->FirstCarrying; wobj; wobj = wobj->NextContent )
    {
      if ( wobj->item_type == ITEM_DRINK_CON
           && wobj->value[1]  >  0
           && wobj->value[2]  == 0 )
        break;
    }
  if ( !wobj )
    {
      SendToCharacter( "You have no water to mix with the powder.\r\n", ch );
      return;
    }
  /* And does the thief have steady enough hands? */
  if ( !IsNpc( ch )
       &&  ( ch->PCData->Condition[COND_DRUNK] > 0 ) )
    {
      SendToCharacter("Your hands aren't steady enough to properly mix the poison.\r\n", ch );
      return;
    }
  SetWaitState( ch, SkillTable[gsn_poison_weapon]->Beats );

  percent = (GetRandomPercent() - GetCurrentLuck(ch) - 14);

  /* Check the skill percentage */
  SeparateOneObjectFromGroup( pobj );
  SeparateOneObjectFromGroup( wobj );
  if ( !IsNpc( ch )
       && percent > ch->PCData->Learned[gsn_poison_weapon] )
    {
      SetCharacterColor( AT_RED, ch );
      SendToCharacter( "You failed and spill some on yourself.  Ouch!\r\n", ch );
      SetCharacterColor( AT_GREY, ch );
      InflictDamage( ch, ch, GetAbilityLevel( ch, HUNTING_ABILITY ), gsn_poison_weapon );
      Act(AT_RED, "$n spills the poison all over!", ch, NULL, NULL, TO_ROOM );
      ExtractObject( pobj );
      ExtractObject( wobj );
      LearnFromFailure( ch, gsn_poison_weapon );
      return;
    }
  SeparateOneObjectFromGroup( obj );
  /* Well, I'm tired of waiting.  Are you? */
  Act(AT_RED, "You mix $p in $P, creating a deadly poison!", ch, pobj, wobj, TO_CHAR );
  Act(AT_RED, "$n mixes $p in $P, creating a deadly poison!",ch, pobj, wobj, TO_ROOM );
  Act(AT_GREEN, "You pour the poison over $p, which glistens wickedly!",ch, obj, NULL, TO_CHAR  );
  Act(AT_GREEN, "$n pours the poison over $p, which glistens wickedly!",ch, obj, NULL, TO_ROOM  );
  SetBit( obj->Flags, ITEM_POISONED );
  obj->cost *= GetAbilityLevel( ch, HUNTING_ABILITY ) / 2;
  /* Set an object timer.  Don't want proliferation of poisoned weapons */
  obj->timer = 10 + GetAbilityLevel( ch, HUNTING_ABILITY );

  if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
    if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
      obj->timer *= 2;

  if ( IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    obj->timer *= 2;

  /* WHAT?  All of that, just for that one bit?  How lame. ;) */
  Act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_CHAR );
  Act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_ROOM );
  ExtractObject( pobj );
  ExtractObject( wobj );
  LearnFromSuccess( ch, gsn_poison_weapon );
}
