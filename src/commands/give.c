#include <string.h>
#include "mud.h"
#include "character.h"

void do_give( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char buf  [MAX_INPUT_LENGTH];
  Character *victim;
  Object  *obj;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  
  if ( !StrCmp( arg2, "to" ) && !IsNullOrEmpty( argument ) )
    argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Give what to whom?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( IsNumber( arg1 ) )
    {
      /* 'give NNNN coins victim' */
      int amount;

      amount   = atoi(arg1);
      if ( amount <= 0
           || ( StrCmp( arg2, "credits" ) && StrCmp( arg2, "credit" ) ) )
        {
          SendToCharacter( "Sorry, you can't do that.\r\n", ch );
          return;
        }

      argument = OneArgument( argument, arg2 );

      if ( !StrCmp( arg2, "to" ) && !IsNullOrEmpty( argument ) )
        argument = OneArgument( argument, arg2 );
      
      if ( IsNullOrEmpty( arg2 ) )
        {
	  SendToCharacter( "Give what to whom?\r\n", ch );
          return;
        }

      if ( ( victim = GetCharacterInRoom( ch, arg2 ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }

      if ( ch->gold < amount )
        {
          SendToCharacter( "Very generous of you, but you haven't got that many credits.\r\n", ch );
          return;
        }

      ch->gold     -= amount;
      victim->gold += amount;
      strcpy(buf, "$n gives you ");
      strcat(buf, arg1);
      strcat(buf, (amount > 1) ? " credits." : " credit.");

      Act( AT_ACTION, buf, ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n gives $N some credits.",  ch, NULL, victim, TO_NOTVICT );
      Act( AT_ACTION, "You give $N some credits.",  ch, NULL, victim, TO_CHAR    );
      SendToCharacter( "OK.\r\n", ch );
      MobProgBribeTrigger( victim, ch, amount );

      if ( IsBitSet( sysdata.save_flags, SV_GIVE ) && !CharacterDiedRecently(ch) )
        SaveCharacter(ch);

      if ( IsBitSet( sysdata.save_flags, SV_RECEIVE ) && !CharacterDiedRecently(victim) )
        SaveCharacter(victim);

      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "You do not have that item.\r\n", ch );
      return;
    }

  if ( obj->wear_loc != WEAR_NONE )
    {
      SendToCharacter( "You must remove it first.\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg2 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      SendToCharacter( "You can't let go of it.\r\n", ch );
      return;
    }

  if ( victim->carry_number + (GetObjectCount(obj)/obj->count) > GetCarryCapacityNumber( victim ) )
    {
      Act( AT_PLAIN, "$N has $S hands full.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( victim->carry_weight + (GetObjectWeight(obj)/obj->count) > GetCarryCapacityWeight( victim ) )
    {
      Act( AT_PLAIN, "$N can't carry that much weight.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !CanSeeObject( victim, obj ) )
    {
      Act( AT_PLAIN, "$N can't see it.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IsNpc(victim) && victim->Prototype && victim->Prototype->pShop )
    {

      if ( victim->owner && StrCmp( ch->name, victim->owner ) )
        {
          SendToCharacter ("This isnt your vendor!\r\n",ch);
          return;
        }
    }

  if (IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) && !CharacterCanTakePrototype( victim ) )
    {
      Act( AT_PLAIN, "You cannot give that to $N!", ch, NULL, victim, TO_CHAR );
      return;
    }

  SeparateOneObjectFromGroup( obj );
  ObjectFromCharacter( obj );
  Act( AT_ACTION, "$n gives $p to $N.", ch, obj, victim, TO_NOTVICT );
  Act( AT_ACTION, "$n gives you $p.",   ch, obj, victim, TO_VICT    );
  Act( AT_ACTION, "You give $p to $N.", ch, obj, victim, TO_CHAR    );
  obj = ObjectToCharacter( obj, victim );

  MobProgGiveTrigger( victim, ch, obj );

  if ( IsBitSet( sysdata.save_flags, SV_GIVE ) && !CharacterDiedRecently(ch) )
    SaveCharacter(ch);
  if ( IsBitSet( sysdata.save_flags, SV_RECEIVE ) && !CharacterDiedRecently(victim) )
    SaveCharacter(victim);
}
