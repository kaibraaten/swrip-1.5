#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "object.hpp"

void do_use( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argd[MAX_INPUT_LENGTH];
  Character *victim = nullptr;
  Object *device = nullptr;
  Object *obj = nullptr;
  ch_ret retcode = rNONE;

  argument = OneArgument( argument, argd );
  argument = OneArgument( argument, arg );

  if ( !StrCmp( arg , "on" ) )
    argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( argd ) )
    {
      ch->Echo("Use what?\r\n");
      return;
    }

  if ( ( device = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL ||
       !NiftyIsName(argd, device->Name) )
    {
      do_takedrug( ch , argd );
      return;
    }

  if ( device->ItemType == ITEM_SPICE )
    {
      do_takedrug( ch , argd );
      return;
    }

  if ( device->ItemType != ITEM_DEVICE )
    {
      ch->Echo("You can't figure out what it is your supposed to do with it.\r\n");
      return;
    }

  if ( device->Value[OVAL_DEVICE_CHARGES] <= 0 )
    {
      ch->Echo("It has no more charge left.");
      return;
    }

  obj = NULL;
  
  if ( IsNullOrEmpty( arg ) )
    {
      if ( ch->Fighting )
        {
          victim = GetFightingOpponent( ch );
        }
      else
        {
          ch->Echo("Use on whom or what?\r\n");
          return;
        }
    }
  else
    {
      if ( ( victim = GetCharacterInRoom ( ch, arg ) ) == NULL
           &&   ( obj    = GetObjectHere  ( ch, arg ) ) == NULL )
        {
          ch->Echo("You can't find your target.\r\n");
          return;
        }
    }

  SetWaitState( ch, 1 * PULSE_VIOLENCE );

  if ( device->Value[OVAL_DEVICE_CHARGES] > 0 )
    {
      device->Value[OVAL_DEVICE_CHARGES]--;

      if ( victim )
        {
          if ( !ObjProgUseTrigger( ch, device, victim, NULL, NULL ) )
            {
              Act( AT_MAGIC, "$n uses $p on $N.", ch, device, victim, TO_ROOM );
              Act( AT_MAGIC, "You use $p on $N.", ch, device, victim, TO_CHAR );
            }
        }
      else
        {
          if ( !ObjProgUseTrigger( ch, device, NULL, obj, NULL ) )
            {
              Act( AT_MAGIC, "$n uses $p on $P.", ch, device, obj, TO_ROOM );
              Act( AT_MAGIC, "You use $p on $P.", ch, device, obj, TO_CHAR );
            }
        }

      retcode = CastSpellWithObject( device->Value[OVAL_DEVICE_SPELL],
                                     device->Value[OVAL_DEVICE_LEVEL], ch, victim, obj );

      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          Log->Bug( "do_use: char died" );
          return;
        }
    }
}

