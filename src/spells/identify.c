#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_identify( int sn, int level, Character *ch, void *vo )
{
  /* Modified by Scryn to work on mobs/players/objs */
  Object *obj;
  Character *victim;
  Affect *paf;
  Skill *sktmp;
  Skill *skill = GetSkill(sn);

  if ( spell_target_name[0] == '\0' )
    {
      SendToCharacter( "What would you like identified?\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( ( obj = GetCarriedObject( ch, spell_target_name ) ) != NULL )
    {
      SetCharacterColor( AT_LBLUE, ch );
      ChPrintf( ch,
                 "Object '%s' is %s, special properties: %s %s.\r\nIts weight is %d, value is %d.\r\n",
                 obj->name,
                 AOrAn( GetItemTypeName( obj ) ),
                 FlagString( obj->extra_flags, object_flags ),
                 FlagString( obj->magic_flags, mag_flags ),
                 obj->weight,
                 obj->cost
                 );
      SetCharacterColor( AT_MAGIC, ch );

      switch ( obj->item_type )
        {
        case ITEM_PILL:
        case ITEM_SCROLL:
        case ITEM_POTION:
	  ChPrintf( ch, "Level %d spells of:", obj->value[0] );

          if ( obj->value[1] >= 0 && (sktmp=GetSkill(obj->value[1])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->name, ch );
              SendToCharacter( "'", ch );
            }

          if ( obj->value[2] >= 0 && (sktmp=GetSkill(obj->value[2])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->name, ch );
              SendToCharacter( "'", ch );
            }

          if ( obj->value[3] >= 0 && (sktmp=GetSkill(obj->value[3])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->name, ch );
              SendToCharacter( "'", ch );
            }

          SendToCharacter( ".\r\n", ch );
          break;

        case ITEM_DEVICE:
          ChPrintf( ch, "Has %d(%d) charges of level %d",
                     obj->value[1], obj->value[2], obj->value[0] );

          if ( obj->value[3] >= 0 && (sktmp=GetSkill(obj->value[3])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->name, ch );
              SendToCharacter( "'", ch );
            }

          SendToCharacter( ".\r\n", ch );
          break;

        case ITEM_WEAPON:
          ChPrintf( ch, "Damage is %d to %d (average %d).\r\n",
                     obj->value[1], obj->value[2],
                     ( obj->value[1] + obj->value[2] ) / 2 );
          if ( obj->value[3] == WEAPON_BLASTER )
            {
	      if (obj->blaster_setting == BLASTER_FULL)
                ChPrintf( ch, "It is set on FULL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HIGH)
                ChPrintf( ch, "It is set on HIGH power.\r\n");
              else if (obj->blaster_setting == BLASTER_NORMAL)
                ChPrintf( ch, "It is set on NORMAL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HALF)
                ChPrintf( ch, "It is set on HALF power.\r\n");
              else if (obj->blaster_setting == BLASTER_LOW)
                ChPrintf( ch, "It is set on LOW power.\r\n");
              else if (obj->blaster_setting == BLASTER_STUN)
                ChPrintf( ch, "It is set on STUN.\r\n");
              ChPrintf( ch, "It has %d out of %d charges.\r\n",
                         obj->value[4], obj->value[5] );
            }
          else if ( obj->value[3] == WEAPON_LIGHTSABER ||
                    obj->value[3] == WEAPON_VIBRO_BLADE ||
                    obj->value[3] == WEAPON_FORCE_PIKE)
            {
              ChPrintf( ch, "It has %d out of %d units of charge remaining.\r\n",
                         obj->value[4], obj->value[5] );
            }
          else if ( obj->value[3] == WEAPON_BOWCASTER )
            {
              ChPrintf( ch, "It has %d out of %d energy bolts remaining.\r\n",
                         obj->value[4], obj->value[5] );
            }
          break;

        case ITEM_AMMO:
          ChPrintf( ch, "It has %d charges.\r\n",
                     obj->value[0] );
          break;

        case ITEM_BOLT:
          ChPrintf( ch, "It has %d energy bolts.\r\n",
                     obj->value[0] );
          break;

        case ITEM_BATTERY:
          ChPrintf( ch, "It has %d units of charge.\r\n",
                     obj->value[0] );
          break;

        case ITEM_ARMOR:
	  ChPrintf( ch, "Current armor class is %d. ( based on current condition )\r\n", obj->value[0] );
          ChPrintf( ch, "Maximum armor class is %d. ( based on top condition )\r\n", obj->value[1] );
          ChPrintf( ch, "Applied armor class is %d. ( based condition and location worn )\r\n", GetObjectArmorClass(obj, obj->wear_loc) );
          break;
        }

      for ( paf = obj->Prototype->first_affect; paf; paf = paf->next )
        ShowAffectToCharacter( ch, paf );

      for ( paf = obj->first_affect; paf; paf = paf->next )
        ShowAffectToCharacter( ch, paf );

      return rNONE;
    }

  else if ( ( victim = GetCharacterInRoom( ch, spell_target_name ) ) != NULL )
    {

      if ( IsBitSet( victim->immune, RIS_MAGIC ) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( IsNpc(victim) )
        {
          ChPrintf(ch, "%s appears to be between level %d and %d.\r\n",
                    victim->name,
                    victim->top_level - (victim->top_level % 5),
                    victim->top_level - (victim->top_level % 5) + 5);
        }
      else
        {
          ChPrintf(ch, "%s appears to be level %d.\r\n", victim->name, victim->top_level);
        }

      ChPrintf(ch, "%s looks like %s.\r\n",
                victim->name, AOrAn(get_race(victim)));

      if ( (Chance(ch, 50) && ch->top_level >= victim->top_level + 10 )
           ||    IsImmortal(ch) )
        {
          ChPrintf(ch, "%s appears to be affected by: ", victim->name);

          if (!victim->first_affect)
	    {
              SendToCharacter( "nothing.\r\n", ch );
              return rNONE;
            }

          for ( paf = victim->first_affect; paf; paf = paf->next )
            {
              if (victim->first_affect != victim->last_affect)
                {
                  if( paf != victim->last_affect && (sktmp=GetSkill(paf->type)) != NULL )
                    ChPrintf( ch, "%s, ", sktmp->name );

                  if( paf == victim->last_affect && (sktmp=GetSkill(paf->type)) != NULL )
                    {
                      ChPrintf( ch, "and %s.\r\n", sktmp->name );
                      return rNONE;
                    }
                }
              else
                {
                  if ( (sktmp=GetSkill(paf->type)) != NULL )
                    ChPrintf( ch, "%s.\r\n", sktmp->name );
                  else
                    SendToCharacter( "\r\n", ch );
                  return rNONE;
                }
            }
        }
    }

  else
    {
      ChPrintf(ch, "You can't find %s!\r\n", spell_target_name );
      return rSPELL_FAILED;
    }

  return rNONE;
}
