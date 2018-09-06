#include "character.hpp"
#include "mud.hpp"

void do_pardon( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Character *victim = nullptr;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ch->Echo("Syntax: pardon <character> <planet>.\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  ch->Echo("Syntax: pardon <character> <planet>.... But it doesn't work .... Tell Durga to hurry up and finish it :p\r\n");
}
