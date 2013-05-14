#include "mud.h"

extern char *spell_target_name;

/*
 * Generic handler for new "SMAUG" spells                       -Thoric
 */
ch_ret spell_smaug( int sn, int level, CHAR_DATA *ch, void *vo )
{
  struct skill_type *skill = get_skilltype(sn);

  switch( skill->target )
    {
    case TAR_IGNORE:

      /* offensive area spell */
      if ( SPELL_FLAG(skill, SF_AREA)
           && ((SPELL_ACTION(skill) == SA_DESTROY
                &&   SPELL_CLASS(skill) == SC_LIFE)
               ||  (SPELL_ACTION(skill) == SA_CREATE
                    &&   SPELL_CLASS(skill) == SC_DEATH)))
        return spell_area_attack( sn, level, ch, vo );

      if ( SPELL_ACTION(skill) == SA_CREATE )
        {
          if ( SPELL_FLAG(skill, SF_OBJECT) )   /* create object */
            return spell_create_obj( sn, level, ch,  vo );
          if ( SPELL_CLASS(skill) == SC_LIFE )  /* create mob */
            return spell_create_mob( sn, level, ch,  vo );
        }

      /* affect a distant player */
      if ( SPELL_FLAG(skill, SF_DISTANT)
	   &&   SPELL_FLAG(skill, SF_CHARACTER))
        return spell_affect(sn, level, ch, get_char_world( ch, spell_target_name ));

      /* affect a player in this room (should have been TAR_CHAR_XXX) */
      if ( SPELL_FLAG(skill, SF_CHARACTER) )
        return spell_affect(sn, level, ch, get_char_room( ch, spell_target_name ));

      /* will fail, or be an area/group affect */
      return spell_affect( sn, level, ch, vo );

    case TAR_CHAR_OFFENSIVE:
      /* a regular damage inflicting spell attack */
      if ((SPELL_ACTION(skill) == SA_DESTROY
           &&   SPELL_CLASS(skill) == SC_LIFE)
          ||  (SPELL_ACTION(skill) == SA_CREATE
               &&   SPELL_CLASS(skill) == SC_DEATH)  )
        return spell_attack( sn, level, ch, vo );

      /* a nasty spell affect */
      return spell_affect( sn, level, ch, vo );

    case TAR_CHAR_DEFENSIVE:

    case TAR_CHAR_SELF:
      if ( vo && SPELL_ACTION(skill) == SA_DESTROY )
        {
          CHAR_DATA *victim = (CHAR_DATA *) vo;

          /* cure poison */
          if ( SPELL_DAMAGE(skill) == SD_POISON )
            {
              if ( is_affected( victim, gsn_poison ) )
                {
                  affect_strip( victim, gsn_poison );
                  victim->mental_state = URANGE( -100, victim->mental_state, -10 );
                  successful_casting( skill, ch, victim, NULL );
                  return rNONE;
                }
              failed_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }
          /* cure blindness */
          if ( SPELL_CLASS(skill) == SC_ILLUSION )
            {
              if ( is_affected( victim, gsn_blindness ) )
		{
                  affect_strip( victim, gsn_blindness );
                  successful_casting( skill, ch, victim, NULL );
                  return rNONE;
                }
              failed_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }
        }
      return spell_affect( sn, level, ch, vo );

    case TAR_OBJ_INV:
      return spell_obj_inv( sn, level, ch, vo );
    }
  return rNONE;
}
