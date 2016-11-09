#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"

void do_buyvendor (Character *ch, std::string argument)
{
  Character *keeper;
  Object *deed;
  char buf[MAX_STRING_LENGTH];
  char buf1[MAX_STRING_LENGTH];
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;

  if (IsNpc(ch))
    return;

  if ( !StrCmp( argument, "yes" ) )
    {
      sprintf( buf, "%s/%s", VENDOR_DIR, Capitalize( ch->Name ) );
      remove( buf );
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, Capitalize( ch->Name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      SendToCharacter( "You already have a shop!\r\n", ch);
      SendToCharacter( "If you want to buy one anyway, type buyvendor yes.\r\n", ch);
      SendToCharacter( "Your old one will be deleted.\r\n", ch);
      return;
    }


  if (  (keeper = FindKeeperQ( ch, false ) )  == NULL  )
    {
      SendToCharacter ("There is no one to buy that from!\r\n", ch);
      return;
    }

  if ( ch->Gold < COST_BUY_VENDOR )
    {
      sprintf(buf1, "%s says, You are too poor!\r\n", keeper->Name);
      SendToCharacter (buf1, ch);
      return;
    }

  if ( (ch->TopLevel) < LEVEL_BUY_VENDOR )
    {
      sprintf (buf1, "you must be at least %d level.\r\n", LEVEL_BUY_VENDOR);
      SendToCharacter (buf1, ch);
      return;
    }

  if ( (GetProtoObject (OBJ_VNUM_DEED) ) == NULL )
    {
      Bug("BUYVENDOR: Deed is missing!");
      return;
    }

  deed = CreateObject ( GetProtoObject(OBJ_VNUM_DEED), 0);
  ObjectToCharacter (deed, ch);
  SendToCharacter("&bVery well, you may have a contract for a vendor.\r\n", ch);
  ch->Gold = ch->Gold - COST_BUY_VENDOR;
}
