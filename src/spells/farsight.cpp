#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

extern char *spell_target_name;

ch_ret spell_farsight( int sn, int level, Character *ch, void *vo )
{
  Room *location = nullptr;
  Room *original = nullptr;
  Character *victim = nullptr;
  Skill *skill = GetSkill(sn);
  int saving = 0;

  /* The spell fails if the victim isn't playing, the victim is the caster,
     the target room has private, solitary, noastral, death or proto flags,
     the caster's room is norecall, the victim is too high in level, the
     victim is a proto mob, the victim makes the saving throw or the pkill
     flag on the caster is not the same as on the victim.  Got it?
  */

  saving = GetRandomPercent();

  if ( ( victim = GetCharacterAnywhere( ch, spell_target_name ) ) == NULL
       ||   victim == ch
       ||   !victim->InRoom
       ||   IsBitSet(victim->InRoom->Flags, ROOM_PRIVATE)
       ||   IsBitSet(victim->InRoom->Flags, ROOM_PROTOTYPE)
       ||       (IsNpc(victim) && IsBitSet(victim->Flags, ACT_PROTOTYPE))
       ||  (IsNpc(victim) && SaveVsSpellStaff( level, victim ))
       || saving <= 50 )
    {
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  location = victim->InRoom;
  if (!location)
    {
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }
  SuccessfulCasting( skill, ch, victim, NULL );
  original = ch->InRoom;
  CharacterFromRoom( ch );
  CharacterToRoom( ch, location );
  do_look( ch, "auto" );
  CharacterFromRoom( ch );
  CharacterToRoom( ch, original );
  return rNONE;
}
