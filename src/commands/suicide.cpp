#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_suicide( Character *ch, char *argument )
{
  Object *obj = NULL;

  if ( IsNpc(ch) || !ch->PCData )
    {
      SendToCharacter( "Yeah right!\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "&RIf you really want to delete this character type suicide and your password.\r\n", ch );
      return;
    }

  if ( StrCmp( EncodeString( argument ), ch->PCData->Password ) )
    {
      SendToCharacter( "Sorry wrong password.\r\n", ch );
      LogPrintf( "%s attempting to commit suicide... WRONG PASSWORD!" , ch->Name );
      return;
    }

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL

       ||   ( obj->Value[3] != WEAPON_VIBRO_BLADE ) )
    {
      SendToCharacter( "You need to wield a blade to slit your throat!.\r\n", ch );
      return;
    }

  Act( AT_BLOOD, "With a sad determination and trembling hands you slit your own throat!",  ch, NULL, NULL, TO_CHAR    );
  Act( AT_BLOOD, "Cold shivers run down your spine as you watch $n slit $s own throat!",  ch, NULL, NULL, TO_ROOM );
  LogPrintf( "%s just committed suicide." , ch->Name );

  SetCurrentGlobalCharacter(ch);
  RawKill( ch, ch );
}
