#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "protomob.hpp"
#include "systemdata.hpp"

void do_give( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  char buf[MAX_INPUT_LENGTH];
  Character *victim = nullptr;
  Object *obj = nullptr;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  
  if ( !StrCmp( arg2, "to" ) && !argument.empty() )
    argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ch->Echo( "Give what to whom?\r\n" );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( IsNumber( arg1 ) )
    {
      /* 'give NNNN coins victim' */
      int amount = std::stoi(arg1);

      if ( amount <= 0
           || ( StrCmp( arg2, "credits" ) && StrCmp( arg2, "credit" ) ) )
        {
          ch->Echo( "Sorry, you can't do that.\r\n" );
          return;
        }

      argument = OneArgument( argument, arg2 );

      if ( !StrCmp( arg2, "to" ) && !argument.empty() )
        argument = OneArgument( argument, arg2 );
      
      if ( arg2.empty() )
        {
	  ch->Echo( "Give what to whom?\r\n" );
          return;
        }

      if ( ( victim = GetCharacterInRoom( ch, arg2 ) ) == NULL )
        {
          ch->Echo( "They aren't here.\r\n" );
          return;
        }

      if ( ch->Gold < amount )
        {
          ch->Echo( "Very generous of you, but you haven't got that many credits.\r\n" );
          return;
        }

      ch->Gold     -= amount;
      victim->Gold += amount;
      strcpy(buf, "$n gives you ");
      strcat(buf, arg1.c_str());
      strcat(buf, (amount > 1) ? " credits." : " credit.");

      Act( AT_ACTION, buf, ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n gives $N some credits.",  ch, NULL, victim, TO_NOTVICT );
      Act( AT_ACTION, "You give $N some credits.",  ch, NULL, victim, TO_CHAR    );
      ch->Echo( "OK.\r\n");
      MobProgBribeTrigger( victim, ch, amount );

      if ( IsBitSet( SysData.SaveFlags, SV_GIVE ) && !CharacterDiedRecently(ch) )
        SaveCharacter(ch);

      if ( IsBitSet( SysData.SaveFlags, SV_RECEIVE ) && !CharacterDiedRecently(victim) )
        SaveCharacter(victim);

      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      ch->Echo( "You do not have that item.\r\n" );
      return;
    }

  if ( obj->WearLoc != WEAR_NONE )
    {
      ch->Echo( "You must remove it first.\r\n" );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg2 ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      ch->Echo( "You can't let go of it.\r\n" );
      return;
    }

  if ( victim->CarryNumber + (GetObjectCount(obj)/obj->Count) > GetCarryCapacityNumber( victim ) )
    {
      Act( AT_PLAIN, "$N has $S hands full.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( victim->CarryWeight + (GetObjectWeight(obj)/obj->Count) > GetCarryCapacityWeight( victim ) )
    {
      Act( AT_PLAIN, "$N can't carry that much weight.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !CanSeeObject( victim, obj ) )
    {
      Act( AT_PLAIN, "$N can't see it.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IsNpc(victim) && victim->Prototype && victim->Prototype->Shop )
    {

      if ( !victim->Owner.empty() && StrCmp( ch->Name, victim->Owner ) )
        {
          ch->Echo( "This isn't your vendor!\r\n" );
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

  if ( IsBitSet( SysData.SaveFlags, SV_GIVE ) && !CharacterDiedRecently(ch) )
    SaveCharacter(ch);

  if ( IsBitSet( SysData.SaveFlags, SV_RECEIVE ) && !CharacterDiedRecently(victim) )
    SaveCharacter(victim);
}

