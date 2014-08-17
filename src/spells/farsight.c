#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_farsight( int sn, int level, Character *ch, void *vo )
{
  Room *location;
  Room *original;
  Character *victim;
  SKILLTYPE *skill = get_skilltype(sn);
  int saving;

  /* The spell fails if the victim isn't playing, the victim is the caster,
     the target room has private, solitary, noastral, death or proto flags,
     the caster's room is norecall, the victim is too high in level, the
     victim is a proto mob, the victim makes the saving throw or the pkill
     flag on the caster is not the same as on the victim.  Got it?
  */

  saving = GetRandomPercent();

  if ( ( victim = get_char_world( ch, spell_target_name ) ) == NULL
       ||   victim == ch
       ||   !victim->in_room
       ||   IsBitSet(victim->in_room->room_flags, ROOM_PRIVATE)
       ||   IsBitSet(victim->in_room->room_flags, ROOM_SOLITARY)
       ||   IsBitSet(victim->in_room->room_flags, ROOM_PROTOTYPE)
       ||       (IsNpc(victim) && IsBitSet(victim->act, ACT_PROTOTYPE))
       ||  (IsNpc(victim) && saves_spell_staff( level, victim ))
       || saving <= 50 )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  location = victim->in_room;
  if (!location)
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }
  successful_casting( skill, ch, victim, NULL );
  original = ch->in_room;
  char_from_room( ch );
  char_to_room( ch, location );
  do_look( ch, "auto" );
  char_from_room( ch );
  char_to_room( ch, original );
  return rNONE;
}
