#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"

static bool is_legal_kill(Character *ch, Character *vch);

void do_hitall( Character *ch, char *argument )
{
  Character *vch = NULL;
  Character *vch_next = NULL;
  short nvict = 0;
  short nhit = 0;
  short percent = 0;

  if ( IsBitSet(ch->InRoom->Flags, ROOM_SAFE) )
    {
      SendToCharacter( "You cannot do that here.\r\n", ch);
      return;
    }

  if ( !ch->InRoom->FirstPerson )
    {
      SendToCharacter( "There's no one here!\r\n", ch );
      return;
    }

  percent = IsNpc(ch) ? 80 : ch->PCData->Learned[gsn_hitall];

  for ( vch = ch->InRoom->FirstPerson; vch; vch = vch_next )
    {
      vch_next = vch->NextInRoom;

      if ( IsInSameGroup(ch, vch) || !is_legal_kill(ch, vch) ||
           !CanSeeCharacter(ch, vch) || IsSafe(ch, vch) )
        continue;

      if ( ++nvict > GetAbilityLevel( ch, COMBAT_ABILITY ) / 5 )
        break;

      if ( IsBitSet(vch->Flags, PLR_AFK))
        {
          Log->Info("%s just attacked %s with HITALL with an afk flag on!.", ch->Name, vch->Name);
        }

      if ( Chance(ch, percent) )
        {
          nhit++;
          global_retcode = HitOnce(ch, vch, TYPE_UNDEFINED);
        }
      else
        global_retcode = InflictDamage(ch, vch, 0, TYPE_UNDEFINED);
      /* Fireshield, etc. could kill ch too.. :>.. -- Altrag */
      if ( global_retcode == rCHAR_DIED || global_retcode == rBOTH_DIED
           ||   CharacterDiedRecently(ch) )
        return;
    }
  if ( !nvict )
    {
      SendToCharacter( "There's no one here!\r\n", ch );
      return;
    }
  ch->Move = umax(0, ch->Move - nvict * 3 + nhit);

  if ( nhit )
    LearnFromSuccess(ch, gsn_hitall);
  else
    LearnFromFailure(ch, gsn_hitall);
}

static bool is_legal_kill(Character *ch, Character *vch)
{
  if ( IsNpc(ch) || IsNpc(vch) )
    return true;
  if ( IsSafe(ch,vch) )
    return false;
  return true;
}
