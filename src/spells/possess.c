#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_possess( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim;
  char buf[MAX_STRING_LENGTH];
  AFFECT_DATA af;
  SKILLTYPE *skill = get_skilltype(sn);

  if (ch->desc->original)
    {
      send_to_char("You are not in your original state.\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( (victim = get_char_room( ch, spell_target_name ) ) == NULL)
    {
      send_to_char("They aren't here!\r\n", ch);
      return rSPELL_FAILED;
    }

  if (victim == ch)
    {
      send_to_char("You can't possess yourself!\r\n", ch);
      return rSPELL_FAILED;
    }

  if (!IS_NPC(victim))
    {
      send_to_char("You can't possess another player!\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( victim->race == RACE_DROID )
    {
      send_to_char("The brain of a machine confuses you.\r\n", ch);
      return rSPELL_FAILED;
    }

  if (victim->desc)
    {
      ch_printf(ch, "%s is already possessed.\r\n", victim->short_descr);
      return rSPELL_FAILED;
    }

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IS_AFFECTED(victim, AFF_POSSESS)
       ||   level < (victim->top_level + 30)
       ||  victim->desc
       ||  !chance(ch, 25) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  send_to_char("You feel the hatred grow within you as you twist your victims mind!\r\n", ch);
  ch->alignment = ch->alignment - 50;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  af.type      = sn;
  af.duration  = 20 + (get_level( ch, FORCE_ABILITY ) - victim->top_level) / 2;
  af.location  = 0;
  af.modifier  = 0;
  af.bitvector = AFF_POSSESS;
  affect_to_char( victim, &af );

  sprintf(buf, "You have possessed %s!\r\n", victim->short_descr);

  ch->desc->character = victim;
  ch->desc->original  = ch;
  victim->desc        = ch->desc;
  ch->desc            = NULL;
  ch->switched        = victim;
  send_to_char( buf, victim );

  return rNONE;
}
