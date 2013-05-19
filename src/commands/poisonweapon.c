#include "mud.h"

void do_poison_weapon( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  OBJ_DATA *pobj;
  OBJ_DATA *wobj;
  char      arg [ MAX_INPUT_LENGTH ];
  int       percent;

  if ( !IS_NPC( ch )
       &&  ch->pcdata->learned[gsn_poison_weapon] <= 0  )
    {
      send_to_char( "What do you think you are, a thief?\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "What are you trying to poison?\r\n",    ch );
      return;
    }
  if ( ch->fighting )
    {
      send_to_char( "While you're fighting?  Nice try.\r\n", ch );
      return;
    }
  if ( ms_find_obj(ch) )
    return;

  if ( !( obj = get_obj_carry( ch, arg ) ) )
    {
      send_to_char( "You do not have that weapon.\r\n",      ch );
      return;
    }
  if ( obj->item_type != ITEM_WEAPON )
    {
      send_to_char( "That item is not a weapon.\r\n",        ch );
      return;
    }
  if ( obj->value[3] != WEAPON_VIBRO_BLADE && obj->value[3] != WEAPON_FORCE_PIKE )
    {
      send_to_char( "You can not apply poison to that.\r\n",        ch );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_POISONED ) )
    {
      send_to_char( "That weapon is already poisoned.\r\n",  ch );
      return;
    }
  /* Now we have a valid weapon...check to see if we have the powder. */
  for ( pobj = ch->first_carrying; pobj; pobj = pobj->next_content )
    {
      if ( pobj->pIndexData->vnum == OBJ_VNUM_BLACK_POWDER )
        break;
    }
  if ( !pobj )
    {
      send_to_char( "You do not have the black poison powder.\r\n", ch );
      return;
    }
  /* Okay, we have the powder...do we have water? */
  for ( wobj = ch->first_carrying; wobj; wobj = wobj->next_content )
    {
      if ( wobj->item_type == ITEM_DRINK_CON
           && wobj->value[1]  >  0
           && wobj->value[2]  == 0 )
        break;
    }
  if ( !wobj )
    {
      send_to_char( "You have no water to mix with the powder.\r\n", ch );
      return;
    }
  /* And does the thief have steady enough hands? */
  if ( !IS_NPC( ch )
       &&  ( ch->pcdata->condition[COND_DRUNK] > 0 ) )
    {
      send_to_char("Your hands aren't steady enough to properly mix the poison.\r\n", ch );
      return;
    }
  WAIT_STATE( ch, skill_table[gsn_poison_weapon]->beats );

  percent = (number_percent( ) - get_curr_lck(ch) - 14);

  /* Check the skill percentage */
  separate_obj( pobj );
  separate_obj( wobj );
  if ( !IS_NPC( ch )
       && percent > ch->pcdata->learned[gsn_poison_weapon] )
    {
      set_char_color( AT_RED, ch );
      send_to_char( "You failed and spill some on yourself.  Ouch!\r\n", ch );
      set_char_color( AT_GREY, ch );
      damage( ch, ch, get_level( ch, HUNTING_ABILITY ), gsn_poison_weapon );
      act(AT_RED, "$n spills the poison all over!", ch, NULL, NULL, TO_ROOM );
      extract_obj( pobj );
      extract_obj( wobj );
      learn_from_failure( ch, gsn_poison_weapon );
      return;
    }
  separate_obj( obj );
  /* Well, I'm tired of waiting.  Are you? */
  act(AT_RED, "You mix $p in $P, creating a deadly poison!", ch, pobj, wobj, TO_CHAR );
  act(AT_RED, "$n mixes $p in $P, creating a deadly poison!",ch, pobj, wobj, TO_ROOM );
  act(AT_GREEN, "You pour the poison over $p, which glistens wickedly!",ch, obj, NULL, TO_CHAR  );
  act(AT_GREEN, "$n pours the poison over $p, which glistens wickedly!",ch, obj, NULL, TO_ROOM  );
  SET_BIT( obj->extra_flags, ITEM_POISONED );
  obj->cost *= get_level( ch, HUNTING_ABILITY ) / 2;
  /* Set an object timer.  Don't want proliferation of poisoned weapons */
  obj->timer = 10 + get_level( ch, HUNTING_ABILITY );

  if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
    if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
      obj->timer *= 2;

  if ( IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    obj->timer *= 2;

  /* WHAT?  All of that, just for that one bit?  How lame. ;) */
  act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_CHAR );
  act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_ROOM );
  extract_obj( pobj );
  extract_obj( wobj );
  learn_from_success( ch, gsn_poison_weapon );
}
