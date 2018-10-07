#include <cctype>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"
#include "repos/playerrepository.hpp"

void do_password( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  std::string pwdnew;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ch->Echo("Syntax: password <old> <new>.\r\n");
      return;
    }

  if ( StrCmp( EncodeString( arg1 ), ch->PCData->Password ) )
    {
      SetWaitState( ch, 40 );
      ch->Echo("Wrong password. Wait 10 seconds.\r\n");
      return;
    }

  if ( arg2.size() < 5 )
    {
      ch->Echo("New password must be at least five characters long.\r\n" );
      return;
    }

  /*
   * No tilde allowed because of player file format.
   */
  ch->PCData->Password = EncodeString( arg2 );

  if ( SysData.SaveFlags.test( Flag::AutoSave::ChangePassword ) )
    {
      PlayerCharacters->Save( ch );
    }
  
  ch->Echo("Ok.\r\n");
}

