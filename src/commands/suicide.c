#include "mud.h"
#include "character.h"

void do_suicide( CHAR_DATA *ch, char *argument )
{
  char  logbuf[MAX_STRING_LENGTH];

  OBJ_DATA *obj;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "Yeah right!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "&RIf you really want to delete this character type suicide and your password.\r\n", ch );
      return;
    }

  if ( str_cmp( encode_string( argument ), ch->pcdata->pwd ) )
    {
      send_to_char( "Sorry wrong password.\r\n", ch );
      sprintf( logbuf , "%s attempting to commit suicide... WRONG PASSWORD!" , ch->name );
      log_string( logbuf );
      return;
    }

  if ( ( obj = get_eq_char( ch, WEAR_WIELD ) ) == NULL

       ||   ( obj->value[3] != WEAPON_VIBRO_BLADE ) )
    {
      send_to_char( "You need to wield a blade to slit your throat!.\r\n", ch );
      return;
    }

  act( AT_BLOOD, "With a sad determination and trembling hands you slit your own throat!",  ch, NULL, NULL, TO_CHAR    );
  act( AT_BLOOD, "Cold shivers run down your spine as you watch $n slit $s own throat!",  ch, NULL, NULL, TO_ROOM );
  sprintf( logbuf , "%s just committed suicide." , ch->name );
  log_string( logbuf );

  set_cur_char(ch);
  raw_kill( ch, ch );
}
