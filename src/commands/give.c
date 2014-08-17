#include <string.h>
#include "mud.h"
#include "character.h"

void do_give( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char buf  [MAX_INPUT_LENGTH];
  Character *victim;
  OBJ_DATA  *obj;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  if ( !str_cmp( arg2, "to" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Give what to whom?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( is_number( arg1 ) )
    {
      /* 'give NNNN coins victim' */
      int amount;

      amount   = atoi(arg1);
      if ( amount <= 0
           || ( str_cmp( arg2, "credits" ) && str_cmp( arg2, "credit" ) ) )
        {
          send_to_char( "Sorry, you can't do that.\r\n", ch );
          return;
        }

      argument = one_argument( argument, arg2 );
      if ( !str_cmp( arg2, "to" ) && argument[0] != '\0' )
        argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
	  send_to_char( "Give what to whom?\r\n", ch );
          return;
        }

      if ( ( victim = get_char_room( ch, arg2 ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( ch->gold < amount )
        {
          send_to_char( "Very generous of you, but you haven't got that many credits.\r\n", ch );
          return;
        }

      ch->gold     -= amount;
      victim->gold += amount;
      strcpy(buf, "$n gives you ");
      strcat(buf, arg1);
      strcat(buf, (amount > 1) ? " credits." : " credit.");

      act( AT_ACTION, buf, ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n gives $N some credits.",  ch, NULL, victim, TO_NOTVICT );
      act( AT_ACTION, "You give $N some credits.",  ch, NULL, victim, TO_CHAR    );
      send_to_char( "OK.\r\n", ch );
      mprog_bribe_trigger( victim, ch, amount );
      if ( IsBitSet( sysdata.save_flags, SV_GIVE ) && !char_died(ch) )
        save_char_obj(ch);
      if ( IsBitSet( sysdata.save_flags, SV_RECEIVE ) && !char_died(victim) )
        save_char_obj(victim);
      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      send_to_char( "You do not have that item.\r\n", ch );
      return;
    }

  if ( obj->wear_loc != WEAR_NONE )
    {
      send_to_char( "You must remove it first.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg2 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      send_to_char( "You can't let go of it.\r\n", ch );
      return;
    }

  if ( victim->carry_number + (get_obj_number(obj)/obj->count) > GetCarryCapacityNumber( victim ) )
    {
      act( AT_PLAIN, "$N has $S hands full.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( victim->carry_weight + (get_obj_weight(obj)/obj->count) > GetCarryCapacityWeight( victim ) )
    {
      act( AT_PLAIN, "$N can't carry that much weight.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !CanSeeObject( victim, obj ) )
    {
      act( AT_PLAIN, "$N can't see it.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IsNpc(victim) && victim->pIndexData && victim->pIndexData->pShop )
    {

      if ( victim->owner && str_cmp( ch->name, victim->owner ) )
        {
          send_to_char ("This isnt your vendor!\r\n",ch);
          return;
        }
    }

  if (IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) && !can_take_proto( victim ) )
    {
      act( AT_PLAIN, "You cannot give that to $N!", ch, NULL, victim, TO_CHAR );
      return;
    }

  separate_obj( obj );
  obj_from_char( obj );
  act( AT_ACTION, "$n gives $p to $N.", ch, obj, victim, TO_NOTVICT );
  act( AT_ACTION, "$n gives you $p.",   ch, obj, victim, TO_VICT    );
  act( AT_ACTION, "You give $p to $N.", ch, obj, victim, TO_CHAR    );
  obj = obj_to_char( obj, victim );

  mprog_give_trigger( victim, ch, obj );

  if ( IsBitSet( sysdata.save_flags, SV_GIVE ) && !char_died(ch) )
    save_char_obj(ch);
  if ( IsBitSet( sysdata.save_flags, SV_RECEIVE ) && !char_died(victim) )
    save_char_obj(victim);
}
