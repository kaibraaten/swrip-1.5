#include "character.h"
#include "mud.h"

void do_use( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argd[MAX_INPUT_LENGTH];
  Character *victim;
  OBJ_DATA *device;
  OBJ_DATA *obj;
  ch_ret retcode;

  argument = one_argument( argument, argd );
  argument = one_argument( argument, arg );

  if ( !str_cmp( arg , "on" ) )
    argument = one_argument( argument, arg );

  if ( argd[0] == '\0' )
    {
      send_to_char( "Use what?\r\n", ch );
      return;
    }

  if ( ( device = get_eq_char( ch, WEAR_HOLD ) ) == NULL ||
       !nifty_is_name(argd, device->name) )
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
      send_to_char( "You can't figure out what it is your supposed to do with it.\r\n", ch );
      return;
    }

  if ( device->value[2] <= 0 )
    {
      send_to_char( "It has no more charge left.", ch);
      return;
    }

  obj = NULL;
  if ( arg[0] == '\0' )
    {
      if ( ch->fighting )
        {
          victim = who_fighting( ch );
        }
      else
        {
          send_to_char( "Use on whom or what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( victim = get_char_room ( ch, arg ) ) == NULL
           &&   ( obj    = get_obj_here  ( ch, arg ) ) == NULL )
        {
          send_to_char( "You can't find your target.\r\n", ch );
          return;
        }
    }

  set_wait_state( ch, 1 * PULSE_VIOLENCE );

  if ( device->value[2] > 0 )
    {
      device->value[2]--;
      if ( victim )
        {
          if ( !oprog_use_trigger( ch, device, victim, NULL, NULL ) )
            {
              act( AT_MAGIC, "$n uses $p on $N.", ch, device, victim, TO_ROOM );
              act( AT_MAGIC, "You use $p on $N.", ch, device, victim, TO_CHAR );
            }
        }
      else
        {
          if ( !oprog_use_trigger( ch, device, NULL, obj, NULL ) )
            {
              act( AT_MAGIC, "$n uses $p on $P.", ch, device, obj, TO_ROOM );
              act( AT_MAGIC, "You use $p on $P.", ch, device, obj, TO_CHAR );
            }
        }

      retcode = obj_cast_spell( device->value[3], device->value[0], ch, victim, obj );
      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          bug( "do_use: char died", 0 );
          return;
        }
    }
}
