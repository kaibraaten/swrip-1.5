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
      ch->Echo("What would you like identified?\r\n");
      return rSPELL_FAILED;
    }

  if ( ( obj = GetCarriedObject( ch, spell_target_name ) ) != NULL )
    {
      SetCharacterColor( AT_LBLUE, ch );
      ch->Echo("Object '%s' is %s, special properties: %s\r\nIts weight is %d, value is %d.\r\n",
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
   ch->Echo("Level %d spells of:", obj->Value[0] );

          if ( obj->Value[1] >= 0 && (sktmp=GetSkill(obj->Value[1])) != NULL )
            {
              ch->Echo(" '");
              ch->Echo(sktmp->Name);
              ch->Echo("'");
            }

          if ( obj->Value[2] >= 0 && (sktmp=GetSkill(obj->Value[2])) != NULL )
            {
              ch->Echo(" '");
              ch->Echo(sktmp->Name);
              ch->Echo("'");
            }

          if ( obj->Value[3] >= 0 && (sktmp=GetSkill(obj->Value[3])) != NULL )
            {
              ch->Echo(" '");
              ch->Echo(sktmp->Name);
              ch->Echo("'");
            }

          ch->Echo(".\r\n");
          break;

        case ITEM_DEVICE:
          ch->Echo("Has %d(%d) charges of level %d",
                     obj->Value[1], obj->Value[2], obj->Value[0] );

          if ( obj->Value[3] >= 0 && (sktmp=GetSkill(obj->Value[3])) != NULL )
            {
              ch->Echo(" '");
              ch->Echo(sktmp->Name);
              ch->Echo("'");
            }

          ch->Echo(".\r\n");
          break;

        case ITEM_WEAPON:
          ch->Echo("Damage is %d to %d (average %d).\r\n",
                     obj->Value[1], obj->Value[2],
                     ( obj->Value[1] + obj->Value[2] ) / 2 );
          if ( obj->Value[3] == WEAPON_BLASTER )
            {
	      if (obj->BlasterSetting == BLASTER_FULL)
                ch->Echo("It is set on FULL power.\r\n");
              else if (obj->BlasterSetting == BLASTER_HIGH)
                ch->Echo("It is set on HIGH power.\r\n");
              else if (obj->BlasterSetting == BLASTER_NORMAL)
                ch->Echo("It is set on NORMAL power.\r\n");
              else if (obj->BlasterSetting == BLASTER_HALF)
                ch->Echo("It is set on HALF power.\r\n");
              else if (obj->BlasterSetting == BLASTER_LOW)
                ch->Echo("It is set on LOW power.\r\n");
              else if (obj->BlasterSetting == BLASTER_STUN)
                ch->Echo("It is set on STUN.\r\n");
              ch->Echo("It has %d out of %d charges.\r\n",
                         obj->Value[4], obj->Value[5] );
            }
          else if ( obj->Value[3] == WEAPON_LIGHTSABER ||
                    obj->Value[3] == WEAPON_VIBRO_BLADE ||
                    obj->Value[3] == WEAPON_FORCE_PIKE)
            {
              ch->Echo("It has %d out of %d units of charge remaining.\r\n",
                         obj->Value[4], obj->Value[5] );
            }
          else if ( obj->Value[3] == WEAPON_BOWCASTER )
            {
              ch->Echo("It has %d out of %d energy bolts remaining.\r\n",
                         obj->Value[4], obj->Value[5] );
            }
          break;

        case ITEM_AMMO:
          ch->Echo("It has %d charges.\r\n",
                     obj->Value[0] );
          break;

        case ITEM_BOLT:
          ch->Echo("It has %d energy bolts.\r\n",
                     obj->Value[0] );
          break;

        case ITEM_BATTERY:
          ch->Echo("It has %d units of charge.\r\n",
                     obj->Value[0] );
          break;

        case ITEM_ARMOR:
   ch->Echo("Current armor class is %d. ( based on current condition )\r\n", obj->Value[0] );
          ch->Echo("Maximum armor class is %d. ( based on top condition )\r\n", obj->Value[1] );
          ch->Echo("Applied armor class is %d. ( based condition and location worn )\r\n", GetObjectArmorClass(obj, obj->WearLoc) );
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
          ch->Echo("%s appears to be between level %d and %d.\r\n",
                    victim->Name,
                    victim->TopLevel - (victim->TopLevel % 5),
                    victim->TopLevel - (victim->TopLevel % 5) + 5);
        }
      else
        {
          ch->Echo("%s appears to be level %d.\r\n", victim->Name, victim->TopLevel);
        }

      ch->Echo("%s looks like %s.\r\n",
                victim->Name, AOrAn(GetCharacterRace(victim)));

      if ( (Chance(ch, 50) && ch->TopLevel >= victim->TopLevel + 10 )
           ||    IsImmortal(ch) )
        {
          ch->Echo("%s appears to be affected by: ", victim->Name);

          if (!victim->FirstAffect)
	    {
              ch->Echo("nothing.\r\n");
              return rNONE;
            }

          for ( paf = victim->FirstAffect; paf; paf = paf->Next )
            {
              if (victim->FirstAffect != victim->LastAffect)
                {
                  if( paf != victim->LastAffect && (sktmp=GetSkill(paf->Type)) != NULL )
                    ch->Echo("%s, ", sktmp->Name );

                  if( paf == victim->LastAffect && (sktmp=GetSkill(paf->Type)) != NULL )
                    {
                      ch->Echo("and %s.\r\n", sktmp->Name );
                      return rNONE;
                    }
                }
              else
                {
                  if ( (sktmp=GetSkill(paf->Type)) != NULL )
                    ch->Echo("%s.\r\n", sktmp->Name );
                  else
                    ch->Echo("\r\n");
                  return rNONE;
                }
            }
        }
    }

  else
    {
      ch->Echo("You can't find %s!\r\n", spell_target_name );
      return rSPELL_FAILED;
    }

  return rNONE;
}

