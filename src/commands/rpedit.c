#include "editor.h"
#include "character.h"
#include "mud.h"

void do_rpedit( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( is_npc( ch ) )
    {
      send_to_char( "Mob's can't rpedit\r\n", ch );
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
          bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf", 0 );
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
  value = atoi( arg2 );
  /* argument = one_argument( argument, arg3 ); */

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: rpedit <command> [number] <program> <value>\r\n", ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Command being one of:\r\n",                        ch );
      send_to_char( "  add delete insert edit list\r\n",                ch );
      send_to_char( "Program being one of:\r\n",                        ch );
      send_to_char( "  act speech rand sleep rest rfight enter\r\n",  ch );
      send_to_char( "  leave death\r\n",                              ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "You should be standing in room you wish to edit.\r\n",ch);
      return;
    }

  if ( !can_rmodify( ch, ch->in_room ) )
    return;

  mprog = ch->in_room->mprog.mudprogs;

  set_char_color( AT_GREEN, ch );

  if ( !str_cmp( arg1, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          send_to_char( "This room has no room programs.\r\n", ch );
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

  if ( !str_cmp( arg1, "edit" ) )
    {
      if ( !mprog )
        {
          send_to_char( "This room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      if ( arg3[0] != '\0' )
        {
          mptype = get_mpflag( arg3 );
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
              ch->in_room->mprog.progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                ch->in_room->mprog.progtypes |= mprg->type;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          send_to_char( "That room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
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
          mprg_next = ch->in_room->mprog.mudprogs;
          ch->in_room->mprog.mudprogs = mprg_next->next;
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
        REMOVE_BIT( ch->in_room->mprog.progtypes, mptype );
      send_to_char( "Program removed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          send_to_char( "That room has no room programs.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg3 );
      mptype = get_mpflag( arg2 );
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
          ch->in_room->mprog.progtypes |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          ch->in_room->mprog.mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              CREATE( mprg_next, MPROG_DATA, 1 );
              ch->in_room->mprog.progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
              mprg->next        = mprg_next;
              return;
            }
        }
      send_to_char( "Program not found.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "add" ) )
    {
      mptype = get_mpflag( arg2 );
      if ( mptype == -1 )
        {
          send_to_char( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog )
        for ( ; mprog->next; mprog = mprog->next );
      CREATE( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next             = mprg;
      else
        ch->in_room->mprog.mudprogs   = mprg;
      ch->in_room->mprog.progtypes |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_rpedit( ch, "" );
}
