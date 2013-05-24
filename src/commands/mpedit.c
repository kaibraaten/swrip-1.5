#include "character.h"
#include "mud.h"

/*
 * Mobprogram editing - cumbersome                              -Thoric
 */
void do_mpedit( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  CHAR_DATA  *victim;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( is_npc( ch ) )
    {
      send_to_char( "Mob's can't mpedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_mpedit: sub_mprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }

      mprog = (MPROG_DATA*)ch->dest_buf;

      if ( mprog->comlist )
        STRFREE( mprog->comlist );

      mprog->comlist = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  value = atoi( arg3 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: mpedit <victim> <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand fight hitprcnt greet allgreet\r\n", ch );
      send_to_char( "  entry give bribe death time hour script\r\n",    ch );
      return;
    }

  if ( get_trust( ch ) < LEVEL_GOD )
    {
      if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
	}
    }
  else
    {
      if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
        {
          send_to_char( "No one like that in all the realms.\r\n", ch );
          return;
        }
    }

  if ( get_trust( ch ) < get_trust( victim ) || !is_npc(victim) )
    {
      send_to_char( "You can't do that!\r\n", ch );
      return;
    }

  if ( !can_mmodify( ch, victim ) )
    return;

  if ( !IS_SET( victim->act, ACT_PROTOTYPE ) )
    {
      send_to_char( "A mobile must have a prototype flag to be mpset.\r\n", ch );
      return;
    }

  mprog = victim->pIndexData->mprog.mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ch_printf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !str_cmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( arg4[0] != '\0' )
        {
          mptype = get_mpflag( arg4 );
          if ( mptype == -1 )
            {
              send_to_char( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              victim->pIndexData->mprog.progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                victim->pIndexData->mprog.progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = FALSE;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IS_SET( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = victim->pIndexData->mprog.mudprogs;
          victim->pIndexData->mprog.mudprogs = mprg_next->next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->next;
            if ( ++cnt == (value - 1) )
              {
                mprg->next = mprg_next->next;
                break;
	      }
          }
      STRFREE( mprg_next->arglist );
      STRFREE( mprg_next->comlist );
      DISPOSE( mprg_next );
      if ( num <= 1 )
        REMOVE_BIT( victim->pIndexData->mprog.progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That mobile has no mob programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg4 );
      mptype = get_mpflag( arg4 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          send_to_char( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          CREATE( mprg, MPROG_DATA, 1 );
          victim->pIndexData->mprog.progtypes |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          victim->pIndexData->mprog.mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
	      victim->pIndexData->mprog.progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "add" ) )
    {
      mptype = get_mpflag( arg3 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next                     = mprg;
      else
        victim->pIndexData->mprog.mudprogs    = mprg;
      victim->pIndexData->mprog.progtypes     |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_mpedit( ch, "" );
}
