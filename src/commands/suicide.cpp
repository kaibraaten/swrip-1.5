#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_suicide( Character *ch, char *argument )
{
  Object *obj = NULL;

  if ( IsNpc(ch) || !ch->PCData )
    {
      ch->Echo("Yeah right!\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("&RIf you really want to delete this character type suicide and your password.\r\n");
      return;
    }

  if ( StrCmp( EncodeString( argument ), ch->PCData->Password ) )
    {
      ch->Echo("Sorry wrong password.\r\n");
      Log->Info( "%s attempting to commit suicide... WRONG PASSWORD!" , ch->Name );
      return;
    }

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL

       ||   ( obj->Value[3] != WEAPON_VIBRO_BLADE ) )
    {
      ch->Echo("You need to wield a blade to slit your throat!.\r\n");
      return;
    }

  Act( AT_BLOOD, "With a sad determination and trembling hands you slit your own throat!",  ch, NULL, NULL, TO_CHAR    );
  Act( AT_BLOOD, "Cold shivers run down your spine as you watch $n slit $s own throat!",  ch, NULL, NULL, TO_ROOM );
  Log->Info( "%s just committed suicide.", ch->Name );

  SetCurrentGlobalCharacter(ch);
  RawKill( ch, ch );
}

