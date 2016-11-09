#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_throw( Character *ch, char *argument )
{
  Object *obj = NULL;
  Object *tmpobj = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  DirectionType dir = DIR_INVALID;
  Exit *pexit = NULL;
  Room *was_in_room = NULL;
  Room *to_room = NULL;
  Character *victim = NULL;
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  was_in_room = ch->InRoom;

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: throw <object> [direction] [target]\r\n", ch );
      return;
    }

  obj = GetEquipmentOnCharacter( ch, WEAR_MISSILE_WIELD );

  if ( !obj || !NiftyIsName( arg, obj->Name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !obj || !NiftyIsName( arg, obj->Name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_WIELD );

  if ( !obj || !NiftyIsName( arg, obj->Name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );

  if ( !obj || !NiftyIsName( arg, obj->Name ) )
    if ( !obj || !NiftyIsNamePrefix( arg, obj->Name ) )
      obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !obj || !NiftyIsNamePrefix( arg, obj->Name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_WIELD );

  if ( !obj || !NiftyIsNamePrefix( arg, obj->Name ) )
    obj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );

  if ( !obj || !NiftyIsNamePrefix( arg, obj->Name ) )
    {
      Echo( ch, "You don't seem to be holding or wielding %s.\r\n", arg );
      return;
    }

  if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
      Act( AT_PLAIN, "You can't throw $p.", ch, obj, NULL, TO_CHAR );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      victim = GetFightingOpponent( ch );

      if ( CharacterDiedRecently( victim ) )
        return;

      Act( AT_ACTION, "You throw $p at $N.", ch, obj, victim, TO_CHAR );
      Act( AT_ACTION, "$n throws $p at $N.", ch, obj, victim, TO_NOTVICT );
      Act( AT_ACTION, "$n throw $p at you.", ch, obj, victim, TO_VICT );
    }
  else if ( IsNullOrEmpty( arg2 ) )
    {
      sprintf( buf, "$n throws %s at the floor." , obj->ShortDescr );
      Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
      Echo( ch, "You throw %s at the floor.\r\n", obj->ShortDescr );

      victim = NULL;
    }
  else  if ( ( dir = GetDirection( arg2 ) ) != -1 )
    {
      if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
	{
          SendToCharacter( "Are you expecting to throw it through a wall!?\r\n", ch );
          return;
        }

      if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
        {
          SendToCharacter( "Are you expecting to throw it  through a door!?\r\n", ch );
          return;
        }

      switch ( dir )
        {
        case DIR_NORTH:
        case DIR_EAST:
          dir = (DirectionType)(dir + 2);
          break;

        case DIR_SOUTH:
        case DIR_WEST:
          dir = (DirectionType)(dir - 2);
          break;

        case DIR_UP:
        case DIR_NORTHWEST:
          dir = (DirectionType)(dir + 1);
          break;

        case DIR_DOWN:
        case DIR_SOUTHEAST:
          dir = (DirectionType)(dir - 1);
          break;

        case DIR_NORTHEAST:
          dir = (DirectionType)(dir + 3);
          break;

        case DIR_SOUTHWEST:
          dir = (DirectionType)(dir - 3);
          break;

        default:
          break;
        }

      to_room = NULL;
      if ( pexit->Distance > 1 )
        to_room = GenerateExit( ch->InRoom , &pexit );

      if ( to_room == NULL )
        to_room = pexit->ToRoom;

      CharacterFromRoom( ch );
      CharacterToRoom( ch, to_room );

      victim = GetCharacterInRoom( ch, arg3 );

      if ( victim )
        {
          if ( IsSafe( ch, victim ) )
            return;

          if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == victim )
            {
              Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
              return;
            }

          if ( !IsNpc( victim ) && IsBitSet( ch->Flags, PLR_NICE ) )
            {
              SendToCharacter( "You feel too nice to do that!\r\n", ch );
              return;
            }

          CharacterFromRoom( ch );
          CharacterToRoom( ch, was_in_room );


          if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
            {
              SetCharacterColor( AT_MAGIC, ch );
              SendToCharacter( "You'll have to do that elswhere.\r\n", ch );
              return;
            }

          to_room = NULL;
          if ( pexit->Distance > 1 )
            to_room = GenerateExit( ch->InRoom , &pexit );

          if ( to_room == NULL )
            to_room = pexit->ToRoom;

          CharacterFromRoom( ch );
          CharacterToRoom( ch, to_room );

	  sprintf( buf , "Someone throws %s at you from the %s." , obj->ShortDescr , GetDirectionName(dir) );
          Act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
          Act( AT_ACTION, "You throw %p at $N.", ch, obj, victim, TO_CHAR );
          sprintf( buf, "%s is thrown at $N from the %s." , obj->ShortDescr , GetDirectionName(dir) );
          Act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );


        }
      else
        {
          Echo( ch, "You throw %s %s.\r\n", obj->ShortDescr , GetDirectionName(GetDirection( arg2 ) ) );
          sprintf( buf, "%s is thrown from the %s." , obj->ShortDescr , GetDirectionName(dir) );
          Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );

        }
    }
  else if ( ( victim = GetCharacterInRoom( ch, arg2 ) ) != NULL )
    {
      if ( IsSafe( ch, victim ) )
        return;

      if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == victim )
        {
          Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }

      if ( !IsNpc( victim ) && IsBitSet( ch->Flags, PLR_NICE ) )
        {
          SendToCharacter( "You feel too nice to do that!\r\n", ch );
          return;
        }

    }
  else
    {
      Echo( ch, "They don't seem to be here!\r\n");
      return;
    }


  if ( obj == GetEquipmentOnCharacter( ch, WEAR_WIELD )
       && ( tmpobj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD)) != NULL )
    tmpobj->WearLoc = WEAR_WIELD;

  UnequipCharacter( ch, obj );
  SeparateOneObjectFromGroup( obj );
  ObjectFromCharacter( obj );
  obj = ObjectToRoom( obj, ch->InRoom );

  if ( obj->ItemType != ITEM_GRENADE )
    DamageObject ( obj );

  /* NOT NEEDED UNLESS REFERING TO OBJECT AGAIN

     if( IsObjectExtracted(obj) )
     return;
  */
  if ( ch->InRoom !=  was_in_room )
    {
      CharacterFromRoom( ch );
      CharacterToRoom( ch, was_in_room );
    }

  if ( !victim || CharacterDiedRecently( victim ) )
    LearnFromFailure( ch, gsn_throw );
  else
    {

      SetWaitState( ch, SkillTable[gsn_throw]->Beats );
      if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_throw] )
        {
          LearnFromSuccess( ch, gsn_throw );
          global_retcode = InflictDamage( ch, victim, GetRandomNumberFromRange( obj->Weight*2 , (obj->Weight*2 + ch->Stats.PermStr) ), TYPE_HIT );
        }
      else
        {
          LearnFromFailure( ch, gsn_throw );
          global_retcode = InflictDamage( ch, victim, 0, TYPE_HIT );
        }

      if ( IsNpc( victim ) && !CharacterDiedRecently( victim) )
        {
          if ( IsBitSet( victim->Flags , ACT_SENTINEL ) )
            {
              victim->WasSentinel = victim->InRoom;
              RemoveBit( victim->Flags, ACT_SENTINEL );
            }

	  StartHating( victim , ch );
          StartHunting( victim, ch );
	}
    }
}
