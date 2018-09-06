#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

#define RESTORE_INTERVAL 21600

void do_restore( Character *ch, std::string arg )
{
  if ( arg.empty() )
    {
      ch->Echo("Restore whom?\r\n");
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      Character *vch = nullptr;
      Character *vch_next = nullptr;

      if ( !ch->PCData )
        return;

      if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
        {
          if ( IsNpc( ch ) )
            {
              ch->Echo("You can't do that.\r\n");
              return;
            }
          else
            {
              if ( current_time - last_restore_all_time < RESTORE_INTERVAL )
                {
                  ch->Echo("Sorry, you can't do a restore all yet.\r\n");
                  do_restoretime( ch, "" );
                  return;
                }
            }
        }

      last_restore_all_time    = current_time;
      ch->PCData->RestoreTime = current_time;
      SaveCharacter( ch );
      ch->Echo("Ok.\r\n");

      for ( vch = FirstCharacter; vch; vch = vch_next )
        {
          vch_next = vch->Next;

          if ( !IsNpc( vch ) && !IsImmortal( vch ) )
	    {
              vch->Hit = vch->MaxHit;
              vch->Mana = vch->MaxMana;
              vch->Move = vch->MaxMove;
              vch->PCData->Condition[COND_BLOODTHIRST] = (10 + vch->TopLevel);
              UpdatePosition(vch);
              Act( AT_IMMORT, "$n has restored you.", ch, NULL, vch, TO_VICT);
            }
        }
    }
  else
    {
      Character *victim = nullptr;

      if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
        {
          ch->Echo("They aren't here.\r\n");
          return;
        }

      if ( GetTrustLevel( ch ) < LEVEL_CREATOR
           &&  victim != ch
           && !( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) ) )
        {
          ch->Echo("You can't do that.\r\n");
          return;
        }

      victim->Hit  = victim->MaxHit;
      victim->Mana = victim->MaxMana;
      victim->Move = victim->MaxMove;

      if ( victim->PCData )
        victim->PCData->Condition[COND_BLOODTHIRST] = (10 + victim->TopLevel);

      UpdatePosition( victim );

      if ( ch != victim )
        Act( AT_IMMORT, "$n has restored you.", ch, NULL, victim, TO_VICT );

      ch->Echo("Ok.\r\n");
      return;
    }
}
