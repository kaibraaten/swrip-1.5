#include "character.h"
#include "mud.h"
#include "skill.h"

void do_takedrug( Character *ch, char *argument )
{
  Object *obj;
  Affect af;
  int drug;
  int sn;

  if ( argument[0] == '\0' || !StrCmp(argument, "") )
    {
      SendToCharacter( "Use what?\r\n", ch );
      return;
    }

  if( IsDroid(ch) )
    {
      SendToCharacter( "That would have no affect on you.\r\n", ch );
      return;
    }

  if ( (obj = FindObject(ch, argument, true)) == NULL )
    return;

  if ( obj->item_type == ITEM_DEVICE )
    {
      SendToCharacter( "Try holding it first.\r\n", ch );
      return;
    }

  if ( obj->item_type != ITEM_SPICE )
    {
      Act( AT_ACTION, "$n looks at $p and scratches $s head.", ch, obj, NULL, TO_ROOM );
      Act( AT_ACTION, "You can't quite figure out what to do with $p.", ch, obj, NULL, TO_CHAR );
      return;
    }

  SeparateOneObjectFromGroup( obj );

  if ( obj->in_obj )
    {
      Act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      Act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }

  if ( ch->fighting && GetRandomPercent() > (GetCurrentDexterity(ch) * 2 + 48) )
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

      drug = obj->value[0];

      SetWaitState( ch, PULSE_PER_SECOND/4 );

      GainCondition( ch, COND_THIRST, 1 );

      ch->pcdata->drug_level[drug] = umin(ch->pcdata->drug_level[drug]+obj->value[1] , 255);

      if ( ch->pcdata->drug_level[drug] >=255
	   || ch->pcdata->drug_level[drug] > ( ch->pcdata->addiction[drug]+100 ) )
        {
          Act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          Act( AT_POISON, "You feel sick. You may have taken too much.", ch, NULL, NULL, TO_CHAR );
          ch->mental_state = urange( 20, ch->mental_state + 5, 100 );
          af.type      = gsn_poison;
          af.location  = APPLY_INT;
          af.modifier  = -5;
          af.duration  = ch->pcdata->drug_level[drug];
          af.bitvector = AFF_POISON;
          AffectToCharacter( ch, &af );
          ch->hit = 1;
        }

      switch (drug)
        {
        default:
        case SPICE_GLITTERSTIM:
          sn=LookupSkill("true sight");

          if ( sn < MAX_SKILL && !IsAffectedBy( ch, AFF_TRUESIGHT ) )
            {
              af.type      = sn;
              af.location  = APPLY_AC;
              af.modifier  = -10;
              af.duration  = urange( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_TRUESIGHT;
              AffectToCharacter( ch, &af );
            }
          break;

        case SPICE_CARSANUM:
          sn=LookupSkill("heightened awareness");

          if ( sn < MAX_SKILL && !IsAffectedBy( ch, AFF_SANCTUARY ) )
            {
              af.type      = sn;
              af.location  = APPLY_NONE;
              af.modifier  = 0;
              af.duration  = urange( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_DETECT_HIDDEN;
              AffectToCharacter( ch, &af );
            }
          break;

	case SPICE_LUMNI:
          sn=LookupSkill("sanctuary");

          if ( sn < MAX_SKILL && !IsAffectedBy( ch, AFF_SANCTUARY ) )
            {
              af.type      = sn;
              af.location  = APPLY_NONE;
              af.modifier  = 0;
              af.duration  = urange( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_SANCTUARY;
              AffectToCharacter( ch, &af );
            }
          break;

        case SPICE_RYLL:
          af.type      = -1;
          af.location  = APPLY_CON;
          af.modifier  = 4;
          af.duration  = urange( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          AffectToCharacter( ch, &af );

          af.type      = -1;
          af.location  = APPLY_IMMUNE;
          af.modifier  = RIS_POISON;
          af.duration  = urange( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          AffectToCharacter( ch, &af );

          af.type      = -1;
          af.location  = APPLY_HIT;
          af.modifier  = 10;
          af.duration  = urange( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          AffectToCharacter( ch, &af );
          break;

        case SPICE_ANDRIS:
          af.type      = -1;
          af.location  = APPLY_PARRY;
          af.modifier  = 50;
          af.duration  = urange( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
	  AffectToCharacter( ch, &af );

          af.type      = -1;
          af.location  = APPLY_DEX;
          af.modifier  = 2;
          af.duration  = urange( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          AffectToCharacter( ch, &af );

          break;
        }
    }

  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_EATEN;

  ExtractObject( obj );
}
