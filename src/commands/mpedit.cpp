#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "log.hpp"
#include "protomob.hpp"

/*
 * Mobprogram editing - cumbersome                              -Thoric
 */
void do_mpedit( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  Character  *victim;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Mob's can't EditMobProg\r\n");
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
  argument = OneArgument( argument, arg3 );
  value = atoi( arg3 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("Syntax: mpedit <victim> <command> [number] <program> <value>\r\n");
      ch->Echo("\r\n");
      ch->Echo("Command being one of:\r\n");
      ch->Echo("  add delete insert edit list\r\n");
      ch->Echo("Program being one of:\r\n");
      ch->Echo("  act speech rand fight hitprcnt greet allgreet\r\n");
      ch->Echo("  entry give bribe death time hour script\r\n");
      return;
    }

  if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
      if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
        {
          ch->Echo("They aren't here.\r\n");
          return;
	}
    }
  else
    {
      if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
        {
          ch->Echo("No one like that in all the realms.\r\n");
          return;
        }
    }

  if ( GetTrustLevel( ch ) < GetTrustLevel( victim ) || !IsNpc(victim) )
    {
      ch->Echo("You can't do that!\r\n");
      return;
    }

  if ( !CanModifyCharacter( ch, victim ) )
    return;

  if ( !IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
    {
      ch->Echo("A mobile must have a prototype flag to be mpset.\r\n");
      return;
    }

  mprog = victim->Prototype->mprog.mudprogs;

  SetCharacterColor( AT_GREEN, ch );

  if ( !StrCmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
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

  if ( !StrCmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
          return;
        }

      argument = OneArgument( argument, arg4 );

      if ( !IsNullOrEmpty( arg4 ) )
        {
          mptype = GetMudProgFlag( arg4 );

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
              victim->Prototype->mprog.progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->Next )
                victim->Prototype->mprog.progtypes |= mprg->type;
              return;
            }
        }
      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
          return;
        }
      argument = OneArgument( argument, arg4 );
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
          mprg_next = victim->Prototype->mprog.mudprogs;
          victim->Prototype->mprog.mudprogs = mprg_next->Next;
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
        RemoveBit( victim->Prototype->mprog.progtypes, mptype );
      ch->Echo("Program removed.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
          return;
        }
      argument = OneArgument( argument, arg4 );
      mptype = GetMudProgFlag( arg4 );
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
          victim->Prototype->mprog.progtypes |= ( 1 << mptype );
          EditMobProg( ch, mprg, mptype, argument );
          mprg->Next = mprog;
          victim->Prototype->mprog.mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->Next )
        {
          if ( ++cnt == value && mprg->Next )
            {
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
	      victim->Prototype->mprog.progtypes |= ( 1 << mptype );
              EditMobProg( ch, mprg_next, mptype, argument );
              mprg_next->Next = mprg->Next;
              mprg->Next        = mprg_next;
              return;
            }
        }
      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "add" ) )
    {
      mptype = GetMudProgFlag( arg3 );
      if ( mptype == -1 )
        {
          ch->Echo("Unknown program type.\r\n");
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->Next; mprog = mprog->Next );
      AllocateMemory( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->Next                     = mprg;
      else
        victim->Prototype->mprog.mudprogs    = mprg;
      victim->Prototype->mprog.progtypes     |= ( 1 << mptype );
      EditMobProg( ch, mprg, mptype, argument );
      mprg->Next = NULL;
      return;
    }

  do_mpedit( ch, "" );
}

