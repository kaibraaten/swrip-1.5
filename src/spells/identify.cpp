#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"
#include "protoobject.hpp"

extern std::string spell_target_name;

ch_ret spell_identify( int sn, int level, Character *ch, void *vo )
{
  /* Modified by Scryn to work on mobs/players/objs */
  Object *obj = nullptr;
  Character *victim = nullptr;
  Skill *skill = GetSkill(sn);

  if ( spell_target_name.empty() )
    {
      ch->Echo("What would you like identified?\r\n");
      return rSPELL_FAILED;
    }

  if ( ( obj = GetCarriedObject( ch, spell_target_name ) ) != NULL )
    {
      const Skill *sktmp = nullptr;
      
      SetCharacterColor( AT_LBLUE, ch );
      ch->Echo("Object '%s' is %s, special properties: %s\r\nIts weight is %d, value is %d.\r\n",
               obj->Name.c_str(),
               AOrAn( GetItemTypeName( obj ) ).c_str(),
               FlagString( obj->Flags, ObjectFlags ).c_str(),
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

      for(const Affect *paf : obj->Prototype->Affects())
        {
          ShowAffectToCharacter( ch, paf );
        }

      for(const Affect *paf : obj->Affects())
        {
          ShowAffectToCharacter( ch, paf );
        }
      
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
                    victim->Name.c_str(),
                    victim->TopLevel - (victim->TopLevel % 5),
                    victim->TopLevel - (victim->TopLevel % 5) + 5);
        }
      else
        {
          ch->Echo("%s appears to be level %d.\r\n",
                   victim->Name.c_str(), victim->TopLevel);
        }

      ch->Echo("%s looks like %s.\r\n",
                victim->Name.c_str(), AOrAn(GetCharacterRace(victim)).c_str());

      if ( (Chance(ch, 50) && ch->TopLevel >= victim->TopLevel + 10 )
           ||    IsImmortal(ch) )
        {
          ch->Echo("%s appears to be affected by: ", victim->Name.c_str());

          if ( victim->Affects().empty() )
	    {
              ch->Echo("nothing.\r\n");
              return rNONE;
            }

          for(const Affect *paf : victim->Affects())
            {
              const Skill *sktmp = nullptr;
              
              if (victim->Affects().size() == 1)
                {
                  if( paf != victim->Affects().back() && (sktmp=GetSkill(paf->Type)) != NULL )
                    ch->Echo("%s, ", sktmp->Name.c_str() );

                  if( paf == victim->Affects().back() && (sktmp=GetSkill(paf->Type)) != NULL )
                    {
                      ch->Echo("and %s.\r\n", sktmp->Name.c_str() );
                      return rNONE;
                    }
                }
              else
                {
                  if ( (sktmp=GetSkill(paf->Type)) != NULL )
                    ch->Echo("%s.\r\n", sktmp->Name.c_str() );
                  else
                    ch->Echo("\r\n");
                  return rNONE;
                }
            }
        }
    }

  else
    {
      ch->Echo("You can't find %s!\r\n", spell_target_name.c_str() );
      return rSPELL_FAILED;
    }

  return rNONE;
}

