#include "mud.h"
#include "character.h"

void do_suicide( Character *ch, char *argument )
{
  char  logbuf[MAX_STRING_LENGTH];

  Object *obj;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      SendToCharacter( "Yeah right!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "&RIf you really want to delete this character type suicide and your password.\r\n", ch );
      return;
    }

  if ( StrCmp( EncodeString( argument ), ch->pcdata->pwd ) )
    {
      SendToCharacter( "Sorry wrong password.\r\n", ch );
      sprintf( logbuf , "%s attempting to commit suicide... WRONG PASSWORD!" , ch->name );
      log_string( logbuf );
      return;
    }

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL

       ||   ( obj->value[3] != WEAPON_VIBRO_BLADE ) )
    {
      SendToCharacter( "You need to wield a blade to slit your throat!.\r\n", ch );
      return;
    }

  Act( AT_BLOOD, "With a sad determination and trembling hands you slit your own throat!",  ch, NULL, NULL, TO_CHAR    );
  Act( AT_BLOOD, "Cold shivers run down your spine as you watch $n slit $s own throat!",  ch, NULL, NULL, TO_ROOM );
  sprintf( logbuf , "%s just committed suicide." , ch->name );
  log_string( logbuf );

  SetCurrentGlobalCharacter(ch);
  RawKill( ch, ch );
}
