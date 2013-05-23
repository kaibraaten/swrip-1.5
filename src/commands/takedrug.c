#include "character.h"
#include "mud.h"

void do_takedrug( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  AFFECT_DATA af;
  int drug;
  int sn;

  if ( argument[0] == '\0' || !str_cmp(argument, "") )
    {
      send_to_char( "Use what?\r\n", ch );
      return;
    }

  if( is_droid(ch) )
    {
      send_to_char( "That would have no affect on you.\r\n", ch );
      return;
    }

  if ( (obj = find_obj(ch, argument, TRUE)) == NULL )
    return;

  if ( obj->item_type == ITEM_DEVICE )
    {
      send_to_char( "Try holding it first.\r\n", ch );
      return;
    }

  if ( obj->item_type != ITEM_SPICE )
    {
      act( AT_ACTION, "$n looks at $p and scratches $s head.", ch, obj, NULL, TO_ROOM );
      act( AT_ACTION, "You can't quite figure out what to do with $p.", ch, obj, NULL, TO_CHAR );
      return;
    }

  separate_obj( obj );

  if ( obj->in_obj )
    {
      act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }

  if ( ch->fighting && number_percent( ) > (get_curr_dex(ch) * 2 + 48) )
    {
      act( AT_MAGIC, "$n accidentally drops $p rendering it useless.", ch, obj, NULL, TO_ROOM );
      act( AT_MAGIC, "Oops... $p gets knocked from your hands rendering it completely useless!",
	   ch, obj, NULL ,TO_CHAR );
    }
  else
    {
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n takes $p.",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You take $p.", ch, obj, NULL, TO_CHAR );
        }

      if ( is_npc(ch) )
        {
          extract_obj( obj );
          return;
        }

      drug = obj->value[0];

      set_wait_state( ch, PULSE_PER_SECOND/4 );

      gain_condition( ch, COND_THIRST, 1 );

      ch->pcdata->drug_level[drug] = UMIN(ch->pcdata->drug_level[drug]+obj->value[1] , 255);

      if ( ch->pcdata->drug_level[drug] >=255
	   || ch->pcdata->drug_level[drug] > ( ch->pcdata->addiction[drug]+100 ) )
        {
          act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          act( AT_POISON, "You feel sick. You may have taken too much.", ch, NULL, NULL, TO_CHAR );
          ch->mental_state = URANGE( 20, ch->mental_state + 5, 100 );
          af.type      = gsn_poison;
          af.location  = APPLY_INT;
          af.modifier  = -5;
          af.duration  = ch->pcdata->drug_level[drug];
          af.bitvector = AFF_POISON;
          affect_to_char( ch, &af );
          ch->hit = 1;
        }

      switch (drug)
        {
        default:
        case SPICE_GLITTERSTIM:
          sn=skill_lookup("true sight");

          if ( sn < MAX_SKILL && !is_affected_by( ch, AFF_TRUESIGHT ) )
            {
              af.type      = sn;
              af.location  = APPLY_AC;
              af.modifier  = -10;
              af.duration  = URANGE( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_TRUESIGHT;
              affect_to_char( ch, &af );
            }
          break;

        case SPICE_CARSANUM:
          sn=skill_lookup("heightened awareness");

          if ( sn < MAX_SKILL && !is_affected_by( ch, AFF_SANCTUARY ) )
            {
              af.type      = sn;
              af.location  = APPLY_NONE;
              af.modifier  = 0;
              af.duration  = URANGE( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_DETECT_HIDDEN;
              affect_to_char( ch, &af );
            }
          break;

	case SPICE_LUMNI:
          sn=skill_lookup("sanctuary");

          if ( sn < MAX_SKILL && !is_affected_by( ch, AFF_SANCTUARY ) )
            {
              af.type      = sn;
              af.location  = APPLY_NONE;
              af.modifier  = 0;
              af.duration  = URANGE( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_SANCTUARY;
              affect_to_char( ch, &af );
            }
          break;

        case SPICE_RYLL:
          af.type      = -1;
          af.location  = APPLY_CON;
          af.modifier  = 4;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          af.type      = -1;
          af.location  = APPLY_IMMUNE;
          af.modifier  = RIS_POISON;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          af.type      = -1;
          af.location  = APPLY_HIT;
          af.modifier  = 10;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );
          break;

        case SPICE_ANDRIS:
          af.type      = -1;
          af.location  = APPLY_PARRY;
          af.modifier  = 50;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
	  affect_to_char( ch, &af );

          af.type      = -1;
          af.location  = APPLY_DEX;
          af.modifier  = 2;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          break;
        }
    }

  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_EATEN;

  extract_obj( obj );
}
