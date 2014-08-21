#include "character.h"
#include "mud.h"

void do_steal( Character *ch, char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  Character *victim, *mst;
  Object *obj , *obj_next;
  int percent, xp;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( ch->mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      SendToCharacter( "Steal what from whom?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( victim = GetCharacterInRoom( ch, arg2 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "That's pointless.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  SetWaitState( ch, skill_table[gsn_steal]->beats );
  percent  = GetRandomPercent() + ( IsAwake(victim) ? 10 : -50 )
    - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 13)
    + TimesKilled( ch, victim )*7;

  if ( ( IsBitSet( victim->immune, RIS_STEAL ) ) ||
       ( victim->position != POS_STUNNED && (victim->position == POS_FIGHTING
                                             ||   percent > ( IsNpc(ch) ? 90 : ch->pcdata->learned[gsn_steal] ) ) ) )
    {
      /*
       * Failure.
       */
      SendToCharacter( "Oops...\r\n", ch );
      Act( AT_ACTION, "$n tried to steal from you!\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n tried to steal from $N.\r\n",  ch, NULL, victim, TO_NOTVICT );

      if (IsNpc(victim))
	{
          sprintf( buf, "%s is a bloody thief!", ch->name );
          do_yell( victim, buf );
        }

      LearnFromFailure( ch, gsn_steal );
      if ( !IsNpc(ch) )
        {
          if ( CanLootVictim( ch, victim ) )
            {
              if ( IsNpc(victim) )
                global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
            }
          else
            {
              /* LogPrintf( buf ); */
              if ( IsNpc( ch ) )
                {
                  if ( (mst = ch->master) == NULL )
                    return;
                }
              else
                mst = ch;
              if ( IsNpc( mst ) )
                return;

            }
        }

      return;
    }

  if ( IsNpc(victim) )
    AddKill( ch, victim );  /* makes it harder to steal from same char */

  if ( !StrCmp( arg1, "credits"  )
       ||   !StrCmp( arg1, "credit" )
       ||   !StrCmp( arg1, "money"  ) )
    {
      int amount;

      amount = (int) (victim->gold * GetRandomNumberFromRange(1, 10) / 100);
      if ( amount <= 0 )
        {
          SendToCharacter( "You couldn't get any credits.\r\n", ch );
	  LearnFromFailure( ch, gsn_steal );
          return;
        }

      ch->gold     += amount;
      victim->gold -= amount;
      Echo( ch, "Aha!  You got %d credits.\r\n", amount );
      if ( !IsNpc(victim) || (ch->pcdata->learned[gsn_steal] < 50 ) )
        LearnFromSuccess( ch, gsn_steal );

      if ( IsNpc( victim ) )
	{
	  xp = umin( amount*10 , ( GetRequiredXpForLevel( GetAbilityLevel(ch, SMUGGLING_ABILITY ) + 1 ) - GetRequiredXpForLevel( GetAbilityLevel(ch, SMUGGLING_ABILITY))  ) / 35  );
	  xp = umin( xp , ComputeXP( ch, victim ) );
	  GainXP( ch, SMUGGLING_ABILITY, xp );
	  Echo( ch, "&WYou gain %ld smuggling experience!\r\n", xp );
	}
      return;
    }

  if ( ( obj = GetCarriedObject( victim, arg1 ) ) == NULL )
    {
      if ( victim->position <= POS_SLEEPING )
        {
          if ( ( obj = GetWornObject( victim, arg1 ) ) != NULL )
            {
              if ( (obj_next=GetEquipmentOnCharacter(victim, obj->wear_loc)) != obj )
                {
                  Echo( ch, "They are wearing %s on top of %s.\r\n", obj_next->short_descr, obj->short_descr);
                  SendToCharacter( "You'll have to steal that first.\r\n", ch );
                  LearnFromFailure( ch, gsn_steal );
                  return;
                }
              else
                UnequipCharacter( victim, obj );
            }
        }

      SendToCharacter( "You can't seem to find it.\r\n", ch );
      LearnFromFailure( ch, gsn_steal );
      return;
    }

  if ( !CanDropObject( ch, obj )
       ||   IS_OBJ_STAT(obj, ITEM_INVENTORY)
       ||        IS_OBJ_STAT(obj, ITEM_PROTOTYPE))
    {
      SendToCharacter( "You can't manage to pry it away.\r\n", ch );
      LearnFromFailure( ch, gsn_steal );
      return;
    }

  if ( ch->carry_number + (GetObjectCount(obj)/obj->count) > GetCarryCapacityNumber( ch ) )
    {
      SendToCharacter( "You have your hands full.\r\n", ch );
      LearnFromFailure( ch, gsn_steal );
      return;
    }

  if ( ch->carry_weight + (GetObjectWeight(obj)/obj->count) > GetCarryCapacityWeight( ch ) )
    {
      SendToCharacter( "You can't carry that much weight.\r\n", ch );
      LearnFromFailure( ch, gsn_steal );
      return;
    }

  SendToCharacter( "Ok.\r\n", ch );
  if ( IsNpc(victim)  || ch->pcdata->learned[gsn_steal] )
    LearnFromSuccess( ch, gsn_steal );
  if ( IsNpc( victim ) )
    {
      xp = umin( obj->cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel(ch, SMUGGLING_ABILITY) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY) ) ) / 10  );
      xp = umin( xp , ComputeXP( ch, victim ) );
      GainXP( ch, SMUGGLING_ABILITY, xp );
      Echo( ch, "&WYou gain %ld smuggling experience!\r\n", xp );
    }
  SeparateOneObjectFromGroup( obj );
  ObjectFromCharacter( obj );
  ObjectToCharacter( obj, ch );
}
