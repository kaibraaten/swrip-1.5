#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"
#include "log.hpp"

void do_buyvendor (Character *ch, std::string argument)
{
  Character *keeper = nullptr;
  Object *deed = nullptr;
  char buf[MAX_STRING_LENGTH];
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;

  if (IsNpc(ch))
    return;

  if ( !StrCmp( argument, "yes" ) )
    {
      sprintf( buf, "%s/%s", VENDOR_DIR, Capitalize( ch->Name ).c_str() );
      remove( buf );
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, Capitalize( ch->Name ).c_str() );

  if ( stat( strsave, &fst ) != -1 )
    {
      ch->Echo( "You already have a shop!\r\n");
      ch->Echo( "If you want to buy one anyway, type BUYVENDOR YES.\r\n");
      ch->Echo( "Your old one will be deleted.\r\n");
      return;
    }


  if ( (keeper = FindKeeperQ( ch, false ) ) == NULL )
    {
      ch->Echo("There is no one to buy that from!\r\n");
      return;
    }

  if ( ch->Gold < COST_BUY_VENDOR )
    {
      ch->Echo( "%s says, You are too poor!\r\n", keeper->Name.c_str());
      return;
    }

  if ( (ch->TopLevel) < LEVEL_BUY_VENDOR )
    {
      ch->Echo( "You must be at least level %d.\r\n", LEVEL_BUY_VENDOR);
      return;
    }

  if ( (GetProtoObject (OBJ_VNUM_DEED) ) == NULL )
    {
      Log->Bug("BUYVENDOR: Deed is missing!");
      return;
    }

  deed = CreateObject ( GetProtoObject(OBJ_VNUM_DEED), 0);
  ObjectToCharacter (deed, ch);
  ch->Echo("&bVery well, you may have a contract for a vendor.\r\n");
  ch->Gold = ch->Gold - COST_BUY_VENDOR;
}

