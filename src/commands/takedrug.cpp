#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

void do_takedrug( Character *ch, std::string argument )
{
  Object *obj = NULL;
  Affect af;
  int drug = 0;
  int sn = 0;

  if ( argument.empty() )
    {
      ch->Echo("Use what?\r\n");
      return;
    }

  if( IsDroid(ch) )
    {
      ch->Echo("That would have no affect on you.\r\n");
      return;
    }

  if ( (obj = FindObject(ch, argument, true)) == NULL )
    return;

  if ( obj->ItemType == ITEM_DEVICE )
    {
      ch->Echo("Try holding it first.\r\n");
      return;
    }

  if ( obj->ItemType != ITEM_SPICE )
    {
      Act( AT_ACTION, "$n looks at $p and scratches $s head.",
           ch, obj, NULL, TO_ROOM );
      Act( AT_ACTION, "You can't quite figure out what to do with $p.",
           ch, obj, NULL, TO_CHAR );
      return;
    }

  SeparateOneObjectFromGroup( obj );

  if ( obj->InObject )
    {
      Act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->InObject, TO_CHAR );
      Act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->InObject, TO_ROOM );
    }

  if ( ch->Fighting && GetRandomPercent() > (GetCurrentDexterity(ch) * 2 + 48) )
    {
      Act( AT_MAGIC, "$n accidentally drops $p rendering it useless.", ch, obj, NULL, TO_ROOM );
      Act( AT_MAGIC, "Oops... $p gets knocked from your hands rendering it completely useless!",
	   ch, obj, NULL ,TO_CHAR );
    }
  else
    {
      if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
        {
          Act( AT_ACTION, "$n takes $p.",  ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You take $p.", ch, obj, NULL, TO_CHAR );
        }

      if ( IsNpc(ch) )
        {
          ExtractObject( obj );
          return;
        }

      drug = obj->Value[OVAL_SPICE_TYPE];
      SetWaitState( ch, PULSE_PER_SECOND/4 );
      GainCondition( ch, COND_THIRST, 1 );
      ch->PCData->DrugLevel[drug] = umin(ch->PCData->DrugLevel[drug] + obj->Value[OVAL_SPICE_GRADE] , 255);

      if ( ch->PCData->DrugLevel[drug] >=255
	   || ch->PCData->DrugLevel[drug] > ( ch->PCData->Addiction[drug]+100 ) )
        {
          Act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          Act( AT_POISON, "You feel sick. You may have taken too much.", ch, NULL, NULL, TO_CHAR );
          ch->MentalState = urange( 20, ch->MentalState + 5, 100 );
          af.Type      = gsn_poison;
          af.Location  = APPLY_INT;
          af.Modifier  = -5;
          af.Duration  = ch->PCData->DrugLevel[drug];
          af.AffectedBy = AFF_POISON;
          AffectToCharacter( ch, &af );
          ch->Hit = 1;
        }

      switch (drug)
        {
        default:
        case SPICE_GLITTERSTIM:
          sn=LookupSkill("true sight");

          if ( sn < MAX_SKILL && !IsAffectedBy( ch, AFF_TRUESIGHT ) )
            {
              af.Type      = sn;
              af.Location  = APPLY_AC;
              af.Modifier  = -10;
              af.Duration  = urange( 1, ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug] ,obj->Value[1] );
              af.AffectedBy = AFF_TRUESIGHT;
              AffectToCharacter( ch, &af );
            }
          break;

        case SPICE_CARSANUM:
          sn=LookupSkill("heightened awareness");

          if ( sn < MAX_SKILL && !IsAffectedBy( ch, AFF_SANCTUARY ) )
            {
              af.Type      = sn;
              af.Location  = APPLY_NONE;
              af.Modifier  = 0;
              af.Duration  = urange( 1, ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug] ,obj->Value[1] );
              af.AffectedBy = AFF_DETECT_HIDDEN;
              AffectToCharacter( ch, &af );
            }
          break;

	case SPICE_LUMNI:
          sn=LookupSkill("sanctuary");

          if ( sn < MAX_SKILL && !IsAffectedBy( ch, AFF_SANCTUARY ) )
            {
              af.Type      = sn;
              af.Location  = APPLY_NONE;
              af.Modifier  = 0;
              af.Duration  = urange( 1, ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug] ,obj->Value[1] );
              af.AffectedBy = AFF_SANCTUARY;
              AffectToCharacter( ch, &af );
            }
          break;

        case SPICE_RYLL:
          af.Type      = -1;
          af.Location  = APPLY_CON;
          af.Modifier  = 4;
          af.Duration  = urange( 1, 2*(ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug]) ,2*obj->Value[1] );
          af.AffectedBy = AFF_NONE;
          AffectToCharacter( ch, &af );

          af.Type      = -1;
          af.Location  = APPLY_IMMUNE;
          af.Modifier  = RIS_POISON;
          af.Duration  = urange( 1, 2*(ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug]) ,2*obj->Value[1] );
          af.AffectedBy = AFF_NONE;
          AffectToCharacter( ch, &af );

          af.Type      = -1;
          af.Location  = APPLY_HIT;
          af.Modifier  = 10;
          af.Duration  = urange( 1, 2*(ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug]) ,2*obj->Value[1] );
          af.AffectedBy = AFF_NONE;
          AffectToCharacter( ch, &af );
          break;

        case SPICE_ANDRIS:
          af.Type      = -1;
          af.Location  = APPLY_PARRY;
          af.Modifier  = 50;
          af.Duration  = urange( 1, 2*(ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug]) ,2*obj->Value[1] );
          af.AffectedBy = AFF_NONE;
	  AffectToCharacter( ch, &af );

          af.Type      = -1;
          af.Location  = APPLY_DEX;
          af.Modifier  = 2;
          af.Duration  = urange( 1, 2*(ch->PCData->DrugLevel[drug] - ch->PCData->Addiction[drug]) ,2*obj->Value[1] );
          af.AffectedBy = AFF_NONE;
          AffectToCharacter( ch, &af );

          break;
        }
    }

  if ( cur_obj == obj->Serial )
    global_objcode = rOBJ_EATEN;

  ExtractObject( obj );
}
