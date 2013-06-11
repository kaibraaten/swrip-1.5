#include <string.h>
#include "mud.h"
#include "character.h"

void do_train( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *mob;
  bool tfound = FALSE;
  bool successful = FALSE;

  if ( IsNpc(ch) )
    return;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:

      if ( arg[0] == '\0' )
        {
          send_to_char( "Train what?\r\n", ch );
          send_to_char( "\r\nChoices: strength, intelligence, wisdom, dexterity, constitution or charisma\r\n", ch );
          return;
        }

      if ( !is_awake(ch) )
	{
          send_to_char( "In your dreams, or what?\r\n", ch );
          return;
        }

      for ( mob = ch->in_room->first_person; mob; mob = mob->next_in_room )
	{
	  if ( IsNpc(mob) && IS_SET(mob->act, ACT_TRAIN) )
	    {
	      tfound = TRUE;
	      break;
	    }
	}

      if ( (!mob) || (!tfound) )
        {
          send_to_char( "You can't do that here.\r\n", ch );
          return;
        }

      if ( str_cmp( arg, "str" ) && str_cmp( arg, "strength" )
           && str_cmp( arg, "dex" ) && str_cmp( arg, "dexterity" )
           && str_cmp( arg, "con" ) && str_cmp( arg, "constitution" )
           && str_cmp( arg, "cha" ) && str_cmp( arg, "charisma" )
           && str_cmp( arg, "wis" ) && str_cmp( arg, "wisdom" )
           && str_cmp( arg, "int" ) && str_cmp( arg, "intelligence" ) )
        {
          do_train ( ch , "" );
          return;
        }

      if ( !str_cmp( arg, "str" ) || !str_cmp( arg, "strength" ) )
        {
          if( mob->stats.perm_str <= ch->stats.perm_str || ch->stats.perm_str >= 20 + race_table[ch->race].stats.mod_str || ch->stats.perm_str >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already stronger than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin your weight training.\r\n", ch);
        }
      if ( !str_cmp( arg, "dex" ) || !str_cmp( arg, "dexterity" ) )
        {
          if( mob->stats.perm_dex <= ch->stats.perm_dex || ch->stats.perm_dex >= 20 + race_table[ch->race].stats.mod_dex || ch->stats.perm_dex >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already more dextrous than I.'",
                   mob, NULL, ch, TO_VICT );
	      return;
            }
          send_to_char("&GYou begin to work at some challenging tests of coordination.\r\n", ch);
        }
      if ( !str_cmp( arg, "int" ) || !str_cmp( arg, "intelligence" ) )
        {
          if( mob->stats.perm_int <= ch->stats.perm_int || ch->stats.perm_int >= 20 + race_table[ch->race].stats.mod_int || ch->stats.perm_int >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already more educated than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin your studies.\r\n", ch);
        }
      if ( !str_cmp( arg, "wis" ) || !str_cmp( arg, "wisdom" ) )
        {
          if( mob->stats.perm_wis <= ch->stats.perm_wis || ch->stats.perm_wis >= 20 + race_table[ch->race].stats.mod_wis || ch->stats.perm_wis >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already far wiser than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin contemplating several ancient texts in an effort to gain wisdom.\r\n", ch);
        }
      if ( !str_cmp( arg, "con" ) || !str_cmp( arg, "constitution" ) )
        {
          if( mob->stats.perm_con <= ch->stats.perm_con || ch->stats.perm_con >= 20 + race_table[ch->race].stats.mod_con || ch->stats.perm_con >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already healthier than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin your endurance training.\r\n", ch);
        }
      if ( !str_cmp( arg, "cha" ) || !str_cmp( arg, "charisma" ) )
        {
          if( mob->stats.perm_cha <= ch->stats.perm_cha || ch->stats.perm_cha >= 20 + race_table[ch->race].stats.mod_cha || ch->stats.perm_cha >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you already are more charming than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin lessons in maners and ettiquite.\r\n", ch);
        }
      add_timer ( ch , TIMER_DO_FUN , 10 , do_train , 1 );
      ch->dest_buf = str_dup(arg);
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char("&RYou fail to complete your training.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( number_bits ( 2 ) == 0 )
    {
      successful = TRUE;
    }

  if ( !str_cmp( arg, "str" ) || !str_cmp( arg, "strength" ) )
    {
      if ( !successful )
        {
          send_to_char("&RYou feel that you have wasted alot of energy for nothing...\r\n", ch);
          return;
        }
      send_to_char("&GAfter much of excercise you feel a little stronger.\r\n", ch);
      ch->stats.perm_str++;
      return;
    }

  if ( !str_cmp( arg, "dex" ) || !str_cmp( arg, "dexterity" ) )
    {
      if ( !successful )
        {
          send_to_char("&RAfter all that training you still feel like a clutz...\r\n", ch);
          return;
        }
      send_to_char("&GAfter working hard at many challenging tasks you feel a bit more coordinated.\r\n", ch);
      ch->stats.perm_dex++;
      return;
    }

  if ( !str_cmp( arg, "int" ) || !str_cmp( arg, "intelligence" ) )
    {
      if ( !successful )
        {
          send_to_char("&RHitting the books leaves you only with sore eyes...\r\n", ch);
          return;
        }
      send_to_char("&GAfter much study you feel alot more knowledgeable.\r\n", ch);
      ch->stats.perm_int++;
      return;
    }

  if ( !str_cmp( arg, "wis" ) || !str_cmp( arg, "wisdom" ) )
    {
      if ( !successful )
        {
          send_to_char("&RStudying the ancient texts has left you more confused than wise...\r\n", ch);
          return;
        }
      send_to_char("&GAfter contemplating several seemingly meaningless events you suddenly \r\nreceive a flash of insight into the workings of the uni\
verse.\r\n", ch);
      ch->stats.perm_wis++;
      return;
    }

  if ( !str_cmp( arg, "con" ) || !str_cmp( arg, "constitution" ) )
    {
      if ( !successful )
        {
          send_to_char("&RYou spend long a long arobics session ecersising very hard but finish \r\nfeeling only tired and out of breath....\r\n", ch);
          return;
        }
      send_to_char("&GAfter a long tiring excersise session you feel much healthier than before.\r\n", ch);
      ch->stats.perm_con++;
      return;
    }


  if ( !str_cmp( arg, "cha" ) || !str_cmp( arg, "charisma" ) )
    {
      if ( !successful )
        {
	  send_to_char("&RYou finish your self improvement session feeling a little depressed.\r\n", ch);
          return;
        }
      send_to_char("&GYou spend some time focusing on how to improve your personality and feel \r\nmuch better about yourself and the ways others see y\
ou.\r\n", ch);
      ch->stats.perm_cha++;
      return;
    }
}

