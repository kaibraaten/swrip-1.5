#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "playerrepository.hpp"

static Character *get_waiting_desc( const Character *ch, const char *name );

void do_authorize( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo( "Usage:  authorize <player> <yes|name|no/deny>\r\n" );
      ch->Echo( "Pending authorizations:\r\n" );
      ch->Echo( " Chosen Character Name\r\n" );
      ch->Echo( "---------------------------------------------\r\n" );

      for(const Character *unauthed : PlayerCharacters->Entities())
        {
          if(IsWaitingForAuth(unauthed))
            {
              ch->Echo( " %s@%s new %s...\r\n",
                        unauthed->Name,
                        unauthed->Desc->Remote.Hostname,
                        RaceTable[unauthed->Race].Name );
            }
        }
      
      return;
    }

  Character *victim = get_waiting_desc( ch, arg1 );

  if ( victim == NULL )
    return;

  if ( IsNullOrEmpty( arg2 ) || !StrCmp( arg2,"accept" ) || !StrCmp( arg2,"yes" ))
    {
      victim->PCData->AuthState = 3;
      RemoveBit(victim->PCData->Flags, PCFLAG_UNAUTHED);

      if ( victim->PCData->AuthedBy )
        FreeMemory( victim->PCData->AuthedBy );

      victim->PCData->AuthedBy = CopyString( ch->Name );
      sprintf( buf, "%s authorized %s", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
      ch->Echo( "You have authorized %s.\r\n", victim->Name);

      victim->Echo("The MUD Administrators have accepted the name %s.\r\n"
                   "You are now fully authorized to play Rise in Power.\r\n", victim->Name);
    }
  else if ( !StrCmp( arg2, "no" ) || !StrCmp( arg2, "deny" ) )
    {
      victim->Echo( "You have been denied access.\r\n" );
      sprintf( buf, "%s denied authorization to %s", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
      ch->Echo( "You have denied %s.\r\n", victim->Name);
      do_quit(victim, "");
    }
  else if ( !StrCmp( arg2, "name" ) || !StrCmp(arg2, "n" ) )
    {
      sprintf( buf, "%s has denied %s's name", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
      victim->Echo("The MUD Administrators have found the name %s "
                   "to be unacceptable.\r\n"
                   "Use 'name' to change it to something more apropriate.\r\n", victim->Name);
      ch->Echo( "You requested %s change names.\r\n", victim->Name);
      victim->PCData->AuthState = 2;
    }
  else
    {
      ch->Echo("Invalid argument.\r\n");
    }
}

/*
 * Check if the name prefix uniquely identifies a char descriptor
 */
static Character *get_waiting_desc( const Character *ch, const char *name )
{
  Character *ret_char = nullptr;
  unsigned int number_of_hits = 0;

  for(Character *victim : PlayerCharacters->Entities())
    {
      if(IsWaitingForAuth(victim) && !StringPrefix(name, victim->Name))
        {
          if ( ++number_of_hits > 1 )
            {
              ch->Echo( "%s does not uniquely identify a char.\r\n", name );
              return nullptr;
            }
        }

      ret_char = victim;
    }
  
  if ( number_of_hits==1 )
    {
      return ret_char;
    }
  else
    {
      ch->Echo( "No one like that waiting for authorization.\r\n" );
      return nullptr;
    }
}

