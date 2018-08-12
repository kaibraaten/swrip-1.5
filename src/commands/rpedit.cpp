#include "editor.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"

void do_rpedit( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  MPROG_DATA *mprog = nullptr, *mprg = nullptr, *mprg_next = nullptr;
  int value = 0, mptype = 0, cnt = 0;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Mob's can't rpedit\r\n");
      return;
    }

  if ( !ch->Desc )
    {
      ch->Echo("You have no descriptor\r\n");
      return;
    }

  switch( ch->SubState )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
	{
          ch->Echo("Fatal error: report to Thoric.\r\n");
          Log->Bug( "%s: SUB_MPROG_EDIT: NULL ch->dest_buf", __FUNCTION__ );
          ch->SubState = SUB_NONE;
          return;
        }

      mprog = (MPROG_DATA*)ch->dest_buf;

      if ( mprog->comlist )
        FreeMemory( mprog->comlist );

      mprog->comlist = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  value = atoi( arg2 );
  /* argument = OneArgument( argument, arg3 ); */

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Syntax: rpedit <command> [number] <program> <value>\r\n");
      ch->Echo("\r\n");
      ch->Echo("Command being one of:\r\n");
      ch->Echo("  add delete insert edit list\r\n");
      ch->Echo("Program being one of:\r\n");
      ch->Echo("  act speech rand sleep rest rfight enter\r\n");
      ch->Echo("  leave death\r\n");
      ch->Echo("\r\n");
      ch->Echo("You should be standing in room you wish to edit.\r\n");
      return;
    }

  if ( !CanModifyRoom( ch, ch->InRoom ) )
    return;

  mprog = ch->InRoom->mprog.mudprogs;

  SetCharacterColor( AT_GREEN, ch );

  if ( !StrCmp( arg1, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          ch->Echo("This room has no room programs.\r\n");
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->Next )
        ch->Echo("%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   MobProgTypeToName( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !StrCmp( arg1, "edit" ) )
    {
      if ( !mprog )
        {
          ch->Echo("This room has no room programs.\r\n");
          return;
        }

      argument = OneArgument( argument, arg3 );

      if ( !IsNullOrEmpty( arg3 ) )
        {
          mptype = GetMudProgFlag( arg3 );

	  if ( mptype == -1 )
            {
              ch->Echo("Unknown program type.\r\n");
              return;
            }
        }
      else
        mptype = -1;

      if ( value < 1 )
        {
          ch->Echo("Program not found.\r\n");
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->Next )
        {
          if ( ++cnt == value )
            {
	      EditMobProg( ch, mprg, mptype, argument );
              ch->InRoom->mprog.progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->Next )
                ch->InRoom->mprog.progtypes |= mprg->type;
              return;
            }
        }
      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg1, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          ch->Echo("That room has no room programs.\r\n");
          return;
        }
      argument = OneArgument( argument, arg3 );
      if ( value < 1 )
        {
          ch->Echo("Program not found.\r\n");
          return;
        }
      cnt = 0; found = false;
      for ( mprg = mprog; mprg; mprg = mprg->Next )
        {
          if ( ++cnt == value )
            {
              mptype = mprg->type;
              found = true;
              break;
            }
        }
      if ( !found )
        {
          ch->Echo("Program not found.\r\n");
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->Next )
        if ( IsBitSet( mprg->type, mptype ) )
	  num++;
      if ( value == 1 )
        {
          mprg_next = ch->InRoom->mprog.mudprogs;
          ch->InRoom->mprog.mudprogs = mprg_next->Next;
        }
      else
        for ( mprg = mprog; mprg; mprg = mprg_next )
          {
            mprg_next = mprg->Next;
            if ( ++cnt == (value - 1) )
              {
                mprg->Next = mprg_next->Next;
                break;
              }
          }
      FreeMemory( mprg_next->arglist );
      FreeMemory( mprg_next->comlist );
      FreeMemory( mprg_next );
      if ( num <= 1 )
        RemoveBit( ch->InRoom->mprog.progtypes, mptype );
      ch->Echo("Program removed.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          ch->Echo("That room has no room programs.\r\n");
          return;
        }
      argument = OneArgument( argument, arg3 );
      mptype = GetMudProgFlag( arg2 );
      if ( mptype == -1 )
        {
          ch->Echo("Unknown program type.\r\n");
          return;
        }
      if ( value < 1 )
        {
          ch->Echo("Program not found.\r\n");
          return;
        }
      if ( value == 1 )
	{
          AllocateMemory( mprg, MPROG_DATA, 1 );
          ch->InRoom->mprog.progtypes |= ( 1 << mptype );
          EditMobProg( ch, mprg, mptype, argument );
          mprg->Next = mprog;
          ch->InRoom->mprog.mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->Next )
        {
          if ( ++cnt == value && mprg->Next )
            {
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              ch->InRoom->mprog.progtypes |= ( 1 << mptype );
              EditMobProg( ch, mprg_next, mptype, argument );
              mprg_next->Next = mprg->Next;
              mprg->Next        = mprg_next;
              return;
            }
        }
      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg1, "add" ) )
    {
      mptype = GetMudProgFlag( arg2 );
      if ( mptype == -1 )
        {
          ch->Echo("Unknown program type.\r\n");
          return;
        }
      if ( mprog )
        for ( ; mprog->Next; mprog = mprog->Next );
      AllocateMemory( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->Next             = mprg;
      else
        ch->InRoom->mprog.mudprogs   = mprg;
      ch->InRoom->mprog.progtypes |= ( 1 << mptype );
      EditMobProg( ch, mprg, mptype, argument );
      mprg->Next = NULL;
      return;
    }

  do_rpedit( ch, "" );
}

