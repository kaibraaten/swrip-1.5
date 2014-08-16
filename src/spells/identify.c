#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_identify( int sn, int level, Character *ch, void *vo )
{
  /* Modified by Scryn to work on mobs/players/objs */
  OBJ_DATA *obj;
  Character *victim;
  Affect *paf;
  SKILLTYPE *sktmp;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( spell_target_name[0] == '\0' )
    {
      send_to_char( "What would you like identified?\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( ( obj = get_obj_carry( ch, spell_target_name ) ) != NULL )
    {
      set_char_color( AT_LBLUE, ch );
      ch_printf( ch,
                 "Object '%s' is %s, special properties: %s %s.\r\nIts weight is %d, value is %d.\r\n",
                 obj->name,
                 aoran( item_type_name( obj ) ),
                 flag_string( obj->extra_flags, object_flags ),
                 flag_string( obj->magic_flags, mag_flags ),
                 obj->weight,
                 obj->cost
                 );
      set_char_color( AT_MAGIC, ch );

      switch ( obj->item_type )
        {
        case ITEM_PILL:
        case ITEM_SCROLL:
        case ITEM_POTION:
	  ch_printf( ch, "Level %d spells of:", obj->value[0] );

          if ( obj->value[1] >= 0 && (sktmp=get_skilltype(obj->value[1])) != NULL )
            {
              send_to_char( " '", ch );
              send_to_char( sktmp->name, ch );
              send_to_char( "'", ch );
            }

          if ( obj->value[2] >= 0 && (sktmp=get_skilltype(obj->value[2])) != NULL )
            {
              send_to_char( " '", ch );
              send_to_char( sktmp->name, ch );
              send_to_char( "'", ch );
            }

          if ( obj->value[3] >= 0 && (sktmp=get_skilltype(obj->value[3])) != NULL )
            {
              send_to_char( " '", ch );
              send_to_char( sktmp->name, ch );
              send_to_char( "'", ch );
            }

          send_to_char( ".\r\n", ch );
          break;

        case ITEM_DEVICE:
          ch_printf( ch, "Has %d(%d) charges of level %d",
                     obj->value[1], obj->value[2], obj->value[0] );

          if ( obj->value[3] >= 0 && (sktmp=get_skilltype(obj->value[3])) != NULL )
            {
              send_to_char( " '", ch );
              send_to_char( sktmp->name, ch );
              send_to_char( "'", ch );
            }

          send_to_char( ".\r\n", ch );
          break;

        case ITEM_WEAPON:
          ch_printf( ch, "Damage is %d to %d (average %d).\r\n",
                     obj->value[1], obj->value[2],
                     ( obj->value[1] + obj->value[2] ) / 2 );
          if ( obj->value[3] == WEAPON_BLASTER )
            {
	      if (obj->blaster_setting == BLASTER_FULL)
                ch_printf( ch, "It is set on FULL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HIGH)
                ch_printf( ch, "It is set on HIGH power.\r\n");
              else if (obj->blaster_setting == BLASTER_NORMAL)
                ch_printf( ch, "It is set on NORMAL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HALF)
                ch_printf( ch, "It is set on HALF power.\r\n");
              else if (obj->blaster_setting == BLASTER_LOW)
                ch_printf( ch, "It is set on LOW power.\r\n");
              else if (obj->blaster_setting == BLASTER_STUN)
                ch_printf( ch, "It is set on STUN.\r\n");
              ch_printf( ch, "It has %d out of %d charges.\r\n",
                         obj->value[4], obj->value[5] );
            }
          else if ( obj->value[3] == WEAPON_LIGHTSABER ||
                    obj->value[3] == WEAPON_VIBRO_BLADE ||
                    obj->value[3] == WEAPON_FORCE_PIKE)
            {
              ch_printf( ch, "It has %d out of %d units of charge remaining.\r\n",
                         obj->value[4], obj->value[5] );
            }
          else if ( obj->value[3] == WEAPON_BOWCASTER )
            {
              ch_printf( ch, "It has %d out of %d energy bolts remaining.\r\n",
                         obj->value[4], obj->value[5] );
            }
          break;

        case ITEM_AMMO:
          ch_printf( ch, "It has %d charges.\r\n",
                     obj->value[0] );
          break;

        case ITEM_BOLT:
          ch_printf( ch, "It has %d energy bolts.\r\n",
                     obj->value[0] );
          break;

        case ITEM_BATTERY:
          ch_printf( ch, "It has %d units of charge.\r\n",
                     obj->value[0] );
          break;

        case ITEM_ARMOR:
	  ch_printf( ch, "Current armor class is %d. ( based on current condition )\r\n", obj->value[0] );
          ch_printf( ch, "Maximum armor class is %d. ( based on top condition )\r\n", obj->value[1] );
          ch_printf( ch, "Applied armor class is %d. ( based condition and location worn )\r\n", apply_ac(obj, obj->wear_loc) );
          break;
        }

      for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
        showaffect( ch, paf );

      for ( paf = obj->first_affect; paf; paf = paf->next )
        showaffect( ch, paf );

      return rNONE;
    }

  else if ( ( victim = get_char_room( ch, spell_target_name ) ) != NULL )
    {

      if ( IS_SET( victim->immune, RIS_MAGIC ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( is_npc(victim) )
        {
          ch_printf(ch, "%s appears to be between level %d and %d.\r\n",
                    victim->name,
                    victim->top_level - (victim->top_level % 5),
                    victim->top_level - (victim->top_level % 5) + 5);
        }
      else
        {
          ch_printf(ch, "%s appears to be level %d.\r\n", victim->name, victim->top_level);
        }

      ch_printf(ch, "%s looks like %s.\r\n",
                victim->name, aoran(get_race(victim)));

      if ( (chance(ch, 50) && ch->top_level >= victim->top_level + 10 )
           ||    is_immortal(ch) )
        {
          ch_printf(ch, "%s appears to be affected by: ", victim->name);

          if (!victim->first_affect)
	    {
              send_to_char( "nothing.\r\n", ch );
              return rNONE;
            }

          for ( paf = victim->first_affect; paf; paf = paf->next )
            {
              if (victim->first_affect != victim->last_affect)
                {
                  if( paf != victim->last_affect && (sktmp=get_skilltype(paf->type)) != NULL )
                    ch_printf( ch, "%s, ", sktmp->name );

                  if( paf == victim->last_affect && (sktmp=get_skilltype(paf->type)) != NULL )
                    {
                      ch_printf( ch, "and %s.\r\n", sktmp->name );
                      return rNONE;
                    }
                }
              else
                {
                  if ( (sktmp=get_skilltype(paf->type)) != NULL )
                    ch_printf( ch, "%s.\r\n", sktmp->name );
                  else
                    send_to_char( "\r\n", ch );
                  return rNONE;
                }
            }
        }
    }

  else
    {
      ch_printf(ch, "You can't find %s!\r\n", spell_target_name );
      return rSPELL_FAILED;
    }

  return rNONE;
}
