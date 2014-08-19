#include "mud.h"
#include "character.h"

void do_bank( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  long amount = 0;
  Character *victim;

  argument = OneArgument( argument , arg1 );
  argument = OneArgument( argument , arg2 );
  argument = OneArgument( argument , arg3 );

  if ( IsNpc(ch) || !ch->pcdata )
    return;

  if ( !IsAuthed(ch) )
    {
      SendToCharacter("You can not access your bank account until after you've graduated from the academy.\r\n", ch);
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->in_room || !IsBitSet(ch->in_room->room_flags, ROOM_BANK) )
	{
          SendToCharacter( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Usage: BANK <deposit|withdraw|balance|transfer> [amount] [receivee]\r\n", ch );
      return;
    }

  if (arg2[0] != '\0' )
    amount = atoi(arg2);

  if ( !StringPrefix( arg1 , "deposit" ) )
    {
      if ( amount  <= 0 )
        {
          SendToCharacter( "You may only deposit amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->gold < amount )
        {
          SendToCharacter( "You don't have that many credits on you.\r\n", ch );
          return;
        }

      ch->gold -= amount;
      ch->pcdata->bank += amount;

      ChPrintf( ch , "You deposit %ld credits into your account.\r\n" ,amount );
      return;
    }
  else if ( !StringPrefix( arg1 , "withdrawl" ) )
    {
      if ( amount  <= 0 )
        {
          SendToCharacter( "You may only withdraw amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->pcdata->bank < amount )
        {
          SendToCharacter( "You don't have that many credits in your account.\r\n", ch );
          return;
        }

      ch->gold += amount;
      ch->pcdata->bank -= amount;

      ChPrintf( ch , "You withdraw %ld credits from your account.\r\n" ,amount );
      return;

    }
  else if ( !StringPrefix( arg1 , "balance" ) )
    {
      ChPrintf( ch , "You have %ld credits in your account.\r\n" , ch->pcdata->bank );
      return;
    }
  else if ( !StringPrefix( arg1 , "transfer" ) )
    {
      if( ( ( victim = get_char_world(ch, arg3) ) == NULL ))
        {
          SendToCharacter("No such player online.\r\n", ch);
          return;
        }

      if( ( IsNpc(victim)))
        {
          SendToCharacter("No such player online.\r\n", ch);
          return;
        }


      if ( amount  <= 0 )
        {
          SendToCharacter( "You may only transfer amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->pcdata->bank < amount )
        {
          SendToCharacter( "You don't have that many credits in your account.\r\n", ch );
          return;
        }

      ch->pcdata->bank -= amount;
      victim->pcdata->bank += amount;

      ChPrintf( ch , "You transfer %ld credits to %s's account.\r\n" ,amount, victim->name );
      ChPrintf( victim , "%s transfers %ld credits to your account.\r\n" , ch->name , amount);
      return;

    }
  else
    {
      do_bank( ch , "" );
      return;
    }
}
