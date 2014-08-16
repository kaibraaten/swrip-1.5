#include "mud.h"
#include "character.h"

void do_bank( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  long amount = 0;
  Character *victim;

  argument = one_argument( argument , arg1 );
  argument = one_argument( argument , arg2 );
  argument = one_argument( argument , arg3 );

  if ( IsNpc(ch) || !ch->pcdata )
    return;

  if ( is_not_authed(ch) )
    {
      send_to_char("You can not access your bank account until after you've graduated from the acadamey.\r\n", ch);
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->in_room || !IS_SET(ch->in_room->room_flags, ROOM_BANK) )
	{
          send_to_char( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage: BANK <deposit|withdraw|balance|transfer> [amount] [recievee]\r\n", ch );
      return;
    }

  if (arg2[0] != '\0' )
    amount = atoi(arg2);

  if ( !str_prefix( arg1 , "deposit" ) )
    {
      if ( amount  <= 0 )
        {
          send_to_char( "You may only deposit amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->gold < amount )
        {
          send_to_char( "You don't have that many credits on you.\r\n", ch );
          return;
        }

      ch->gold -= amount;
      ch->pcdata->bank += amount;

      ch_printf( ch , "You deposit %ld credits into your account.\r\n" ,amount );
      return;
    }
  else if ( !str_prefix( arg1 , "withdrawl" ) )
    {
      if ( amount  <= 0 )
        {
          send_to_char( "You may only withdraw amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->pcdata->bank < amount )
        {
          send_to_char( "You don't have that many credits in your account.\r\n", ch );
          return;
        }

      ch->gold += amount;
      ch->pcdata->bank -= amount;

      ch_printf( ch , "You withdraw %ld credits from your account.\r\n" ,amount );
      return;

    }
  else if ( !str_prefix( arg1 , "balance" ) )
    {
      ch_printf( ch , "You have %ld credits in your account.\r\n" , ch->pcdata->bank );
      return;
    }
  else if ( !str_prefix( arg1 , "transfer" ) )
    {
      if( ( ( victim = get_char_world(ch, arg3) ) == NULL ))
        {
          send_to_char("No such player online.\r\n", ch);
          return;
        }

      if( ( IsNpc(victim)))
        {
          send_to_char("No such player online.\r\n", ch);
          return;
        }


      if ( amount  <= 0 )
        {
          send_to_char( "You may only transfer amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->pcdata->bank < amount )
        {
          send_to_char( "You don't have that many credits in your account.\r\n", ch );
          return;
        }

      ch->pcdata->bank -= amount;
      victim->pcdata->bank += amount;

      ch_printf( ch , "You transfer %ld credits to %s's account.\r\n" ,amount, victim->name );
      ch_printf( victim , "%s transfers %ld credits to your account.\r\n" , ch->name , amount);
      return;

    }
  else
    {
      do_bank( ch , "" );
      return;
    }
}
