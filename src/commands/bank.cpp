#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_bank( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  long amount = 0;
  Character *victim = nullptr;

  argument = OneArgument( argument , arg1 );
  argument = OneArgument( argument , arg2 );
  argument = OneArgument( argument , arg3 );

  if ( IsNpc(ch) || !ch->PCData )
    return;

  if ( !IsAuthed(ch) )
    {
      ch->Echo("You can not access your bank account until after you've graduated from the academy.\r\n");
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->InRoom || !IsBitSet(ch->InRoom->Flags, ROOM_BANK) )
	{
          ch->Echo( "You must be in a bank or have a comlink to do that!\r\n" );
          return;
        }
    }

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo( "Usage: BANK <deposit|withdraw|balance|transfer> [amount] [receivee]\r\n" );
      return;
    }

  if ( !IsNullOrEmpty( arg2 ) )
    amount = atoi(arg2);

  if ( !StringPrefix( arg1 , "deposit" ) )
    {
      if ( amount  <= 0 )
        {
          ch->Echo( "You may only deposit amounts greater than zero.\r\n" );
          do_bank( ch , "" );
          return;
        }

      if ( ch->Gold < amount )
        {
          ch->Echo( "You don't have that many credits on you.\r\n" );
          return;
        }

      ch->Gold -= amount;
      ch->PCData->Bank += amount;

      ch->Echo( "You deposit %ld credits into your account.\r\n", amount );
      return;
    }
  else if ( !StringPrefix( arg1 , "withdrawl" ) )
    {
      if ( amount  <= 0 )
        {
          ch->Echo( "You may only withdraw amounts greater than zero.\r\n" );
          do_bank( ch , "" );
          return;
        }

      if ( ch->PCData->Bank < amount )
        {
          ch->Echo( "You don't have that many credits in your account.\r\n" );
          return;
        }

      ch->Gold += amount;
      ch->PCData->Bank -= amount;

      ch->Echo( "You withdraw %ld credits from your account.\r\n", amount );
      return;
    }
  else if ( !StringPrefix( arg1 , "balance" ) )
    {
      ch->Echo( "You have %ld credits in your account.\r\n", ch->PCData->Bank );
      return;
    }
  else if ( !StringPrefix( arg1 , "transfer" ) )
    {
      if( ( ( victim = GetCharacterAnywhere(ch, arg3) ) == NULL ))
        {
          ch->Echo("No such player online.\r\n");
          return;
        }

      if( ( IsNpc(victim)))
        {
          ch->Echo("No such player online.\r\n");
          return;
        }


      if ( amount  <= 0 )
        {
          ch->Echo( "You may only transfer amounts greater than zero.\r\n" );
          do_bank( ch , "" );
          return;
        }

      if ( ch->PCData->Bank < amount )
        {
          ch->Echo( "You don't have that many credits in your account.\r\n" );
          return;
        }

      ch->PCData->Bank -= amount;
      victim->PCData->Bank += amount;

      ch->Echo( "You transfer %ld credits to %s's account.\r\n", amount, victim->Name );
      victim->Echo( "%s transfers %ld credits to your account.\r\n", ch->Name, amount);
      return;
    }
  else
    {
      do_bank( ch , "" );
      return;
    }
}

