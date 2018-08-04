#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_brandish( Character *ch, char *argument )
{
  Character *vch = NULL;
  Character *vch_next = NULL;
  Object *staff = NULL;
  ch_ret retcode = rNONE;
  int sn = 0;

  if ( ( staff = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL )
    {
      SendToCharacter( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( staff->ItemType != ITEM_STAFF )
    {
      SendToCharacter( "You can brandish only with a staff.\r\n", ch );
      return;
    }

  if ( ( sn = staff->Value[OVAL_STAFF_SPELL] ) < 0
       || sn >= TopSN
       || SkillTable[sn]->SpellFunction == NULL )
    {
      Log->Bug( "Do_brandish: bad sn %d.", sn );
      return;
    }

  SetWaitState( ch, 2 * PULSE_VIOLENCE );

  if ( staff->Value[OVAL_STAFF_CHARGES] > 0 )
    {
      if ( !ObjProgUseTrigger( ch, staff, NULL, NULL, NULL ) )
        {
          Act( AT_MAGIC, "$n brandishes $p.", ch, staff, NULL, TO_ROOM );
          Act( AT_MAGIC, "You brandish $p.",  ch, staff, NULL, TO_CHAR );
        }
      for ( vch = ch->InRoom->FirstPerson; vch; vch = vch_next )
	{
          vch_next      = vch->NextInRoom;
          if ( !IsNpc( vch ) && IsBitSet( vch->Flags, PLR_WIZINVIS )
               && vch->PCData->WizInvis >= LEVEL_IMMORTAL )
            continue;
          else
            switch ( SkillTable[sn]->Target )
              {
              default:
                Log->Bug( "Do_brandish: bad target for sn %d.", sn );
                return;

              case TAR_IGNORE:
                if ( vch != ch )
                  continue;
                break;

              case TAR_CHAR_OFFENSIVE:
                if ( IsNpc(ch) ? IsNpc(vch) : !IsNpc(vch) )
                  continue;
                break;

              case TAR_CHAR_DEFENSIVE:
                if ( IsNpc(ch) ? !IsNpc(vch) : IsNpc(vch) )
                  continue;
                break;

              case TAR_CHAR_SELF:
                if ( vch != ch )
                  continue;
                break;
              }

          retcode = CastSpellWithObject( staff->Value[OVAL_STAFF_SPELL],
                                         staff->Value[OVAL_STAFF_LEVEL], ch, vch, NULL );

          if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
            {
              Log->Bug( "do_brandish: char died", 0 );
              return;
            }
        }
    }

  if ( --staff->Value[OVAL_STAFF_CHARGES] <= 0 )
    {
      Act( AT_MAGIC, "$p blazes bright and vanishes from $n's hands!", ch, staff, NULL, TO_ROOM );
      Act( AT_MAGIC, "$p blazes bright and is gone!", ch, staff, NULL, TO_CHAR );

      if ( staff->Serial == cur_obj )
        global_objcode = rOBJ_USED;

      ExtractObject( staff );
    }
}
