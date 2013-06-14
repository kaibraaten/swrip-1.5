#include "character.h"
#include "mud.h"

typedef struct CastingInfo
{
  const Character *Caster;
  int CastingLevel;
} CastingInfo;

static void MakeVisible( void *element, void *userData )
{
  Character *victim = (Character*) element;
  const CastingInfo *castingInfo = (CastingInfo*) userData;
  const Character *caster = castingInfo->Caster;
  int level = castingInfo->CastingLevel;

  if ( !IsNpc(victim) && IS_SET(victim->act, PLR_WIZINVIS) )
    {
      return;
    }

  if ( victim == caster || saves_spell_staff( level, victim ) )
    {
      return;
    }

  affect_strip( victim, gsn_invis );
  affect_strip( victim, gsn_mass_invis );
  affect_strip( victim, gsn_sneak );

  if ( victim->race != RACE_DEFEL )
    {
      REMOVE_BIT( victim->affected_by, AFF_HIDE );
    }

  REMOVE_BIT( victim->affected_by, AFF_INVISIBLE );

  if ( !permsneak(victim) )
    {
      REMOVE_BIT( victim->affected_by, AFF_SNEAK );
    }

  act( AT_MAGIC, "$n is revealed!", victim, NULL, NULL, TO_ROOM );
  act( AT_MAGIC, "You are revealed!", victim, NULL, NULL, TO_CHAR );
}

ch_ret spell_faerie_fog( int sn, int level, Character *caster, void *vo )
{
  CastingInfo castingInfo;

  castingInfo.Caster = caster;
  castingInfo.CastingLevel = level;

  act( AT_MAGIC, "$n conjures a cloud of purple smoke.", caster, NULL, NULL, TO_ROOM );
  act( AT_MAGIC, "You conjure a cloud of purple smoke.", caster, NULL, NULL, TO_CHAR );

  List_ForEach( caster->in_room->People, MakeVisible, &castingInfo );

  return rNONE;
}
