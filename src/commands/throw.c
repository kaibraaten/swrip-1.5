#include "character.h"
#include "mud.h"

void do_throw( Character *ch, char *argument )
{
  Object        * obj;
  Object        * tmpobj;
  char              arg[MAX_INPUT_LENGTH];
  char              arg2[MAX_INPUT_LENGTH];
  char              arg3[MAX_INPUT_LENGTH];
  short            dir;
  Exit       * pexit;
  Room * was_in_room;
  Room * to_room;
  Character       * victim;
  char              buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  was_in_room = ch->in_room;

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Usage: throw <object> [direction] [target]\r\n", ch );
      return;
    }

  obj = GetEquipmentOnCharacter( ch, WEAR_MISSILE_WIELD );

  if ( !obj || !NiftyIsName( arg, obj->name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );
  if ( !obj || !NiftyIsName( arg, obj->name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_WIELD );
  if ( !obj || !NiftyIsName( arg, obj->name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );
  if ( !obj || !NiftyIsName( arg, obj->name ) )
    if ( !obj || !NiftyIsNamePrefix( arg, obj->name ) )
      obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );
  if ( !obj || !NiftyIsNamePrefix( arg, obj->name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_WIELD );
  if ( !obj || !NiftyIsNamePrefix( arg, obj->name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );
  if ( !obj || !NiftyIsNamePrefix( arg, obj->name ) )
    {
      ChPrintf( ch, "You don't seem to be holding or wielding %s.\r\n", arg );
      return;
    }

  if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
      act( AT_PLAIN, "You can't throw $p.", ch, obj, NULL, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      victim = who_fighting( ch );
      if ( char_died ( victim ) )
        return;
      act( AT_ACTION, "You throw $p at $N.", ch, obj, victim, TO_CHAR );
      act( AT_ACTION, "$n throws $p at $N.", ch, obj, victim, TO_NOTVICT );
      act( AT_ACTION, "$n throw $p at you.", ch, obj, victim, TO_VICT );
    }
  else if ( arg2[0] == '\0' )
    {
      sprintf( buf, "$n throws %s at the floor." , obj->short_descr );
      act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
      ChPrintf( ch, "You throw %s at the floor.\r\n", obj->short_descr );

      victim = NULL;
    }
  else  if ( ( dir = GetDirection( arg2 ) ) != -1 )
    {
      if ( ( pexit = GetExit( ch->in_room, dir ) ) == NULL )
	{
          SendToCharacter( "Are you expecting to throw it through a wall!?\r\n", ch );
          return;
        }


      if ( IsBitSet( pexit->exit_info, EX_CLOSED ) )
        {
          SendToCharacter( "Are you expecting to throw it  through a door!?\r\n", ch );
          return;
        }


      switch ( dir )
        {
        case 0:
        case 1:
          dir += 2;
          break;
        case 2:
        case 3:
          dir -= 2;
          break;
        case 4:
        case 7:
          dir += 1;
          break;
        case 5:
        case 8:
          dir -= 1;
          break;
        case 6:
          dir += 3;
          break;
        case 9:
          dir -=3;
          break;
        }

      to_room = NULL;
      if ( pexit->distance > 1 )
        to_room = GenerateExit( ch->in_room , &pexit );

      if ( to_room == NULL )
        to_room = pexit->to_room;

      char_from_room( ch );
      char_to_room( ch, to_room );

      victim = get_char_room( ch, arg3 );

      if ( victim )
        {
          if ( is_safe( ch, victim ) )
            return;

          if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == victim )
            {
              act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
              return;
            }

          if ( !IsNpc( victim ) && IsBitSet( ch->act, PLR_NICE ) )
            {
              SendToCharacter( "You feel too nice to do that!\r\n", ch );
              return;
            }

          char_from_room( ch );
          char_to_room( ch, was_in_room );


          if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
            {
              SetCharacterColor( AT_MAGIC, ch );
              SendToCharacter( "You'll have to do that elswhere.\r\n", ch );
              return;
            }

          to_room = NULL;
          if ( pexit->distance > 1 )
            to_room = GenerateExit( ch->in_room , &pexit );

          if ( to_room == NULL )
            to_room = pexit->to_room;

          char_from_room( ch );
          char_to_room( ch, to_room );

	  sprintf( buf , "Someone throws %s at you from the %s." , obj->short_descr , GetDirectionName(dir) );
          act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
          act( AT_ACTION, "You throw %p at $N.", ch, obj, victim, TO_CHAR );
          sprintf( buf, "%s is thrown at $N from the %s." , obj->short_descr , GetDirectionName(dir) );
          act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );


        }
      else
        {
          ChPrintf( ch, "You throw %s %s.\r\n", obj->short_descr , GetDirectionName(GetDirection( arg2 ) ) );
          sprintf( buf, "%s is thrown from the %s." , obj->short_descr , GetDirectionName(dir) );
          act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );

        }
    }
  else if ( ( victim = get_char_room( ch, arg2 ) ) != NULL )
    {
      if ( is_safe( ch, victim ) )
        return;

      if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }

      if ( !IsNpc( victim ) && IsBitSet( ch->act, PLR_NICE ) )
        {
          SendToCharacter( "You feel too nice to do that!\r\n", ch );
          return;
        }

    }
  else
    {
      ChPrintf( ch, "They don't seem to be here!\r\n");
      return;
    }


  if ( obj == GetEquipmentOnCharacter( ch, WEAR_WIELD )
       && ( tmpobj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD)) != NULL )
    tmpobj->wear_loc = WEAR_WIELD;

  UnequipCharacter( ch, obj );
  separate_obj( obj );
  obj_from_char( obj );
  obj = obj_to_room( obj, ch->in_room );

  if ( obj->item_type != ITEM_GRENADE )
    DamageObject ( obj );

  /* NOT NEEDED UNLESS REFERING TO OBJECT AGAIN

     if( obj_extracted(obj) )
     return;
  */
  if ( ch->in_room !=  was_in_room )
    {
      char_from_room( ch );
      char_to_room( ch, was_in_room );
    }

  if ( !victim || char_died( victim ) )
    learn_from_failure( ch, gsn_throw );
  else
    {

      SetWaitState( ch, skill_table[gsn_throw]->beats );
      if ( IsNpc(ch) || GetRandomPercent( ) < ch->pcdata->learned[gsn_throw] )
        {
          learn_from_success( ch, gsn_throw );
          global_retcode = damage( ch, victim, GetRandomNumberFromRange( obj->weight*2 , (obj->weight*2 + ch->stats.perm_str) ), TYPE_HIT );
        }
      else
        {
          learn_from_failure( ch, gsn_throw );
          global_retcode = damage( ch, victim, 0, TYPE_HIT );
        }

      if ( IsNpc( victim ) && !char_died ( victim) )
        {
          if ( IsBitSet( victim->act , ACT_SENTINEL ) )
            {
              victim->was_sentinel = victim->in_room;
              RemoveBit( victim->act, ACT_SENTINEL );
            }

	  start_hating( victim , ch );
          start_hunting( victim, ch );
	}
    }
}
