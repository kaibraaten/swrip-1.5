#include "character.h"
#include "mud.h"

void do_use( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argd[MAX_INPUT_LENGTH];
  Character *victim;
  Object *device;
  Object *obj;
  ch_ret retcode;

  argument = OneArgument( argument, argd );
  argument = OneArgument( argument, arg );

  if ( !StrCmp( arg , "on" ) )
    argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( argd ) )
    {
      SendToCharacter( "Use what?\r\n", ch );
      return;
    }

  if ( ( device = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL ||
       !NiftyIsName(argd, device->name) )
    {
      do_takedrug( ch , argd );
      return;
    }

  if ( device->item_type == ITEM_SPICE )
    {
      do_takedrug( ch , argd );
      return;
    }

  if ( device->item_type != ITEM_DEVICE )
    {
      SendToCharacter( "You can't figure out what it is your supposed to do with it.\r\n", ch );
      return;
    }

  if ( device->value[2] <= 0 )
    {
      SendToCharacter( "It has no more charge left.", ch);
      return;
    }

  obj = NULL;
  
  if ( IsNullOrEmpty( arg ) )
    {
      if ( ch->fighting )
        {
          victim = GetFightingOpponent( ch );
        }
      else
        {
          SendToCharacter( "Use on whom or what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( victim = GetCharacterInRoom ( ch, arg ) ) == NULL
           &&   ( obj    = GetObjectHere  ( ch, arg ) ) == NULL )
        {
          SendToCharacter( "You can't find your target.\r\n", ch );
          return;
        }
    }

  SetWaitState( ch, 1 * PULSE_VIOLENCE );

  if ( device->value[2] > 0 )
    {
      device->value[2]--;
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

      retcode = CastSpellWithObject( device->value[3], device->value[0], ch, victim, obj );
      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          Bug( "do_use: char died", 0 );
          return;
        }
    }
}
