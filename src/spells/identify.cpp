#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

extern char *spell_target_name;

ch_ret spell_identify( int sn, int level, Character *ch, void *vo )
{
  /* Modified by Scryn to work on mobs/players/objs */
  Object *obj;
  Character *victim;
  Affect *paf;
  Skill *sktmp;
  Skill *skill = GetSkill(sn);

  if ( IsNullOrEmpty( spell_target_name ) )
    {
      SendToCharacter( "What would you like identified?\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( ( obj = GetCarriedObject( ch, spell_target_name ) ) != NULL )
    {
      SetCharacterColor( AT_LBLUE, ch );
      Echo( ch,
                 "Object '%s' is %s, special properties: %s\r\nIts weight is %d, value is %d.\r\n",
                 obj->Name,
                 AOrAn( GetItemTypeName( obj ) ),
                 FlagString( obj->Flags, ObjectFlags ),
                 obj->Weight,
                 obj->Cost
                 );
      SetCharacterColor( AT_MAGIC, ch );

      switch ( obj->ItemType )
        {
        case ITEM_PILL:
        case ITEM_SCROLL:
        case ITEM_POTION:
	  Echo( ch, "Level %d spells of:", obj->Value[0] );

          if ( obj->Value[1] >= 0 && (sktmp=GetSkill(obj->Value[1])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->Name, ch );
              SendToCharacter( "'", ch );
            }

          if ( obj->Value[2] >= 0 && (sktmp=GetSkill(obj->Value[2])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->Name, ch );
              SendToCharacter( "'", ch );
            }

          if ( obj->Value[3] >= 0 && (sktmp=GetSkill(obj->Value[3])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->Name, ch );
              SendToCharacter( "'", ch );
            }

          SendToCharacter( ".\r\n", ch );
          break;

        case ITEM_DEVICE:
          Echo( ch, "Has %d(%d) charges of level %d",
                     obj->Value[1], obj->Value[2], obj->Value[0] );

          if ( obj->Value[3] >= 0 && (sktmp=GetSkill(obj->Value[3])) != NULL )
            {
              SendToCharacter( " '", ch );
              SendToCharacter( sktmp->Name, ch );
              SendToCharacter( "'", ch );
            }

          SendToCharacter( ".\r\n", ch );
          break;

        case ITEM_WEAPON:
          Echo( ch, "Damage is %d to %d (average %d).\r\n",
                     obj->Value[1], obj->Value[2],
                     ( obj->Value[1] + obj->Value[2] ) / 2 );
          if ( obj->Value[3] == WEAPON_BLASTER )
            {
	      if (obj->BlasterSetting == BLASTER_FULL)
                Echo( ch, "It is set on FULL power.\r\n");
              else if (obj->BlasterSetting == BLASTER_HIGH)
                Echo( ch, "It is set on HIGH power.\r\n");
              else if (obj->BlasterSetting == BLASTER_NORMAL)
                Echo( ch, "It is set on NORMAL power.\r\n");
              else if (obj->BlasterSetting == BLASTER_HALF)
                Echo( ch, "It is set on HALF power.\r\n");
              else if (obj->BlasterSetting == BLASTER_LOW)
                Echo( ch, "It is set on LOW power.\r\n");
              else if (obj->BlasterSetting == BLASTER_STUN)
                Echo( ch, "It is set on STUN.\r\n");
              Echo( ch, "It has %d out of %d charges.\r\n",
                         obj->Value[4], obj->Value[5] );
            }
          else if ( obj->Value[3] == WEAPON_LIGHTSABER ||
                    obj->Value[3] == WEAPON_VIBRO_BLADE ||
                    obj->Value[3] == WEAPON_FORCE_PIKE)
            {
              Echo( ch, "It has %d out of %d units of charge remaining.\r\n",
                         obj->Value[4], obj->Value[5] );
            }
          else if ( obj->Value[3] == WEAPON_BOWCASTER )
            {
              Echo( ch, "It has %d out of %d energy bolts remaining.\r\n",
                         obj->Value[4], obj->Value[5] );
            }
          break;

        case ITEM_AMMO:
          Echo( ch, "It has %d charges.\r\n",
                     obj->Value[0] );
          break;

        case ITEM_BOLT:
          Echo( ch, "It has %d energy bolts.\r\n",
                     obj->Value[0] );
          break;

        case ITEM_BATTERY:
          Echo( ch, "It has %d units of charge.\r\n",
                     obj->Value[0] );
          break;

        case ITEM_ARMOR:
	  Echo( ch, "Current armor class is %d. ( based on current condition )\r\n", obj->Value[0] );
          Echo( ch, "Maximum armor class is %d. ( based on top condition )\r\n", obj->Value[1] );
          Echo( ch, "Applied armor class is %d. ( based condition and location worn )\r\n", GetObjectArmorClass(obj, obj->WearLoc) );
          break;

	default:
	  break;
        }

      for ( paf = obj->Prototype->FirstAffect; paf; paf = paf->Next )
        ShowAffectToCharacter( ch, paf );

      for ( paf = obj->FirstAffect; paf; paf = paf->Next )
        ShowAffectToCharacter( ch, paf );

      return rNONE;
    }

  else if ( ( victim = GetCharacterInRoom( ch, spell_target_name ) ) != NULL )
    {

      if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( IsNpc(victim) )
        {
          Echo(ch, "%s appears to be between level %d and %d.\r\n",
                    victim->Name,
                    victim->TopLevel - (victim->TopLevel % 5),
                    victim->TopLevel - (victim->TopLevel % 5) + 5);
        }
      else
        {
          Echo(ch, "%s appears to be level %d.\r\n", victim->Name, victim->TopLevel);
        }

      Echo(ch, "%s looks like %s.\r\n",
                victim->Name, AOrAn(GetCharacterRace(victim)));

      if ( (Chance(ch, 50) && ch->TopLevel >= victim->TopLevel + 10 )
           ||    IsImmortal(ch) )
        {
          Echo(ch, "%s appears to be affected by: ", victim->Name);

          if (!victim->FirstAffect)
	    {
              SendToCharacter( "nothing.\r\n", ch );
              return rNONE;
            }

          for ( paf = victim->FirstAffect; paf; paf = paf->Next )
            {
              if (victim->FirstAffect != victim->LastAffect)
                {
                  if( paf != victim->LastAffect && (sktmp=GetSkill(paf->Type)) != NULL )
                    Echo( ch, "%s, ", sktmp->Name );

                  if( paf == victim->LastAffect && (sktmp=GetSkill(paf->Type)) != NULL )
                    {
                      Echo( ch, "and %s.\r\n", sktmp->Name );
                      return rNONE;
                    }
                }
              else
                {
                  if ( (sktmp=GetSkill(paf->Type)) != NULL )
                    Echo( ch, "%s.\r\n", sktmp->Name );
                  else
                    SendToCharacter( "\r\n", ch );
                  return rNONE;
                }
            }
        }
    }

  else
    {
      Echo(ch, "You can't find %s!\r\n", spell_target_name );
      return rSPELL_FAILED;
    }

  return rNONE;
}
