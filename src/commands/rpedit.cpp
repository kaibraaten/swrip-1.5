#include <cassert>
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

      {
        MPROG_DATA *mprog = (MPROG_DATA*)ch->dest_buf;

        if ( mprog->comlist )
          FreeMemory( mprog->comlist );

        mprog->comlist = CopyBuffer( ch );
        StopEditing( ch );
        return;
      }
    }

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  int value = atoi( arg2 );

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

  bool hasMudProgs = !ch->InRoom->mprog.MudProgs().empty();
  
  SetCharacterColor( AT_GREEN, ch );

  if ( !StrCmp( arg1, "list" ) )
    {
      int cnt = 0;

      if ( !hasMudProgs )
        {
          ch->Echo("This room has no room programs.\r\n");
          return;
        }

      for(const MPROG_DATA *mprg : ch->InRoom->mprog.MudProgs())
        {
          ch->Echo("%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   MobProgTypeToName( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
        }
      
      return;
    }

  if ( !StrCmp( arg1, "edit" ) )
    {
      int mptype = -1;
      
      if ( !hasMudProgs )
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
        {
          mptype = -1;
        }
      
      if ( value < 1 )
        {
          ch->Echo("Program not found.\r\n");
          return;
        }

      int cnt = 0;

      for(MPROG_DATA *mprg : ch->InRoom->mprog.MudProgs())
        {
          if ( ++cnt == value )
            {
	      EditMobProg( ch, mprg, mptype, argument );
              ch->InRoom->mprog.progtypes = 0;

              for(const MPROG_DATA *innerProg : ch->InRoom->mprog.MudProgs())
                {
                  ch->InRoom->mprog.progtypes |= innerProg->type;
                }
              
              return;
            }
        }

      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg1, "delete" ) )
    {
      if ( !hasMudProgs )
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

      int cnt = 0;
      bool found = false;
      int mptype = 0;
      
      for ( const MPROG_DATA *mprg : ch->InRoom->mprog.MudProgs())
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

      cnt = 0;
      int num = count_if(std::begin(ch->InRoom->mprog.MudProgs()),
                         std::end(ch->InRoom->mprog.MudProgs()),
                         [mptype](const auto mprg)
                         {
                           return IsBitSet(mprg->type, mptype);
                         });

      auto result = Filter(ch->InRoom->mprog.MudProgs(),
                           [&cnt, value](auto)
                           {
                             return (++cnt) == value;
                           });

      assert(!result.empty());

      MPROG_DATA *progToDelete = result.front();

      ch->InRoom->mprog.Remove(progToDelete);
      
      FreeMemory( progToDelete->arglist );
      FreeMemory( progToDelete->comlist );
      FreeMemory( progToDelete );

      if ( num <= 1 )
        {
          RemoveBit( ch->InRoom->mprog.progtypes, mptype );
        }
      
      ch->Echo("Program removed.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "insert" ) )
    {
      if ( !hasMudProgs )
        {
          ch->Echo("That room has no room programs.\r\n");
          return;
        }

      argument = OneArgument( argument, arg3 );
      int mptype = GetMudProgFlag( arg2 );

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

      int cnt = 0;
      
      auto result = Filter(ch->InRoom->mprog.MudProgs(),
                           [&cnt, value](auto mprg)
                           {
                             return (++cnt) == value;
                           });

      if(!result.empty())
	{
          MPROG_DATA *mprg = nullptr;
          AllocateMemory( mprg, MPROG_DATA, 1 );
          ch->InRoom->mprog.progtypes |= ( 1 << mptype );
          EditMobProg( ch, mprg, mptype, argument );
          ch->InRoom->mprog.InsertBefore(value, mprg);
        }
      else
        {
          ch->Echo("Program not found.\r\n");
        }
      
      return;
    }

  if ( !StrCmp( arg1, "add" ) )
    {
      int mptype = GetMudProgFlag( arg2 );

      if ( mptype == -1 )
        {
          ch->Echo("Unknown program type.\r\n");
          return;
        }

      MPROG_DATA *mprg = nullptr;
      AllocateMemory( mprg, MPROG_DATA, 1 );

      ch->InRoom->mprog.Add(mprg);
      ch->InRoom->mprog.progtypes |= ( 1 << mptype );
      EditMobProg( ch, mprg, mptype, argument );
      return;
    }

  do_rpedit( ch, "" );
}

