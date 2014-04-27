#include "character.h"
#include "mud.h"

ch_ret spell_animate_dead( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *mob;
  OBJ_DATA  *corpse;
  OBJ_DATA  *corpse_next;
  OBJ_DATA  *obj;
  OBJ_DATA  *obj_next;
  bool      found;
  MOB_INDEX_DATA *pMobIndex;
  AFFECT_DATA af;
  char       buf[MAX_STRING_LENGTH];
  SKILLTYPE *skill = get_skilltype(sn);

  found = FALSE;

  for (corpse = ch->in_room->first_content; corpse; corpse = corpse_next)
    {
      corpse_next = corpse->next_content;

      if (corpse->item_type == ITEM_CORPSE_NPC && corpse->cost != -5)
        {
          found = TRUE;
          break;
        }
    }

  if( !found )
    {
      send_to_char("You cannot find a suitable corpse here.\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( get_mob_index(MOB_VNUM_ANIMATED_CORPSE) == NULL )
    {
      bug("Vnum 5 not found for spell_animate_dead!", 0);
      return rNONE;
    }


  if ( (pMobIndex = get_mob_index((short) abs(corpse->cost) )) == NULL )
    {
      bug("Can not find mob for cost of corpse, spell_animate_dead", 0);
      return rSPELL_FAILED;
    }

  if ( !is_npc(ch) )
    {
      if ( ch->mana - (pMobIndex->level*4) < 0 )
        {
          send_to_char("You do not have enough mana to reanimate this "
                       "corpse.\r\n", ch);
          return rSPELL_FAILED;
        }
      else
        ch->mana -= (pMobIndex->level*4);
    }

  if ( is_immortal(ch) || ( chance(ch, 75) && pMobIndex->level - ch->top_level < 10 ) )
    {
      mob = create_mobile( get_mob_index(MOB_VNUM_ANIMATED_CORPSE) );
      char_to_room( mob, ch->in_room );
      mob->top_level     = UMIN(ch->top_level / 2, pMobIndex->level);
      mob->race          = pMobIndex->race;     /* should be undead */

      /* Fix so mobs wont have 0 hps and crash mud - Scryn 2/20/96 */
      if (!pMobIndex->hitnodice)
        mob->max_hit      = pMobIndex->level * 8 + number_range(
                                                                pMobIndex->level * pMobIndex->level / 4,
                                                                pMobIndex->level * pMobIndex->level );
      else
        mob->max_hit     = dice(pMobIndex->hitnodice, pMobIndex->hitsizedice)
          + pMobIndex->hitplus;
      mob->max_hit       = UMAX( URANGE( mob->max_hit / 4,
                                         (mob->max_hit * corpse->value[3]) / 100,
                                         ch->top_level * dice(20,10)), 1 );


      mob->hit       = mob->max_hit;
      mob->damroll   = ch->top_level / 8;
      mob->hitroll   = ch->top_level / 6;
      mob->alignment = ch->alignment;

      act(AT_MAGIC, "$n makes $T rise from the grave!", ch, NULL, pMobIndex->short_descr, TO_ROOM);
      act(AT_MAGIC, "You make $T rise from the grave!", ch, NULL, pMobIndex->short_descr, TO_CHAR);

      sprintf(buf, "animated corpse %s", pMobIndex->player_name);
      STRFREE(mob->name);
      mob->name = STRALLOC(buf);

      sprintf(buf, "The animated corpse of %s", pMobIndex->short_descr);
      STRFREE(mob->short_descr);
      mob->short_descr = STRALLOC(buf);

      sprintf(buf, "An animated corpse of %s struggles with the horror of its undeath.\r\n", pMobIndex->short_descr);
      STRFREE(mob->long_descr);
      mob->long_descr = STRALLOC(buf);
      add_follower( mob, ch );
      af.type      = sn;
      af.duration  = (number_fuzzy( (level + 1) / 4 ) + 1) * DUR_CONV;
      af.location  = 0;
      af.modifier  = 0;
      af.bitvector = AFF_CHARM;
      affect_to_char( mob, &af );

      if (corpse->first_content)
        for( obj = corpse->first_content; obj; obj = obj_next)
          {
            obj_next = obj->next_content;
            obj_from_obj(obj);
            obj_to_room(obj, corpse->in_room);
          }

      separate_obj(corpse);
      extract_obj(corpse);
      return rNONE;
    }
  else
    {
      failed_casting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }
}
