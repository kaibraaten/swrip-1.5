#include <cassert>
#include <utility/algorithms.hpp>
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
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];

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

      {
        MPROG_DATA *mprog = (MPROG_DATA*)ch->dest_buf;

        if ( mprog->comlist )
          FreeMemory( mprog->comlist );

        mprog->comlist = CopyBuffer( ch );
        StopEditing( ch );
      }
      return;
    }

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  int value = atoi( arg3 );

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

  Character *victim = nullptr;
  
  if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
      victim = GetCharacterInRoom( ch, arg1 );
      
      if ( victim == nullptr )
        {
          ch->Echo("They aren't here.\r\n");
          return;
	}
    }
  else
    {
      victim = GetCharacterAnywhere( ch, arg1 );
      
      if ( victim == nullptr )
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

  const std::list<MPROG_DATA*> &mobProgs = victim->Prototype->mprog.MudProgs();
  
  SetCharacterColor( AT_GREEN, ch );

  if ( !StrCmp( arg2, "list" ) )
    {
      if ( mobProgs.empty() )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
          return;
        }

      int cnt = 0;

      for(const MPROG_DATA *mprg : mobProgs)
        {
          ch->Echo("%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   MobProgTypeToName( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
        }
      
      return;
    }

  if ( !StrCmp( arg2, "edit" ) )
    {
      if ( mobProgs.empty() )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
          return;
        }

      argument = OneArgument( argument, arg4 );

      int mptype = 0;
      
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
        {
          mptype = -1;
        }
      
      if ( value < 1 )
        {
          ch->Echo("Program not found.\r\n");
          return;
        }

      int cnt = 0;

      for(MPROG_DATA *mprg : mobProgs)
        {
          if ( ++cnt == value )
            {
              EditMobProg( ch, mprg, mptype, argument );
              victim->Prototype->mprog.progtypes = 0;

              for(MPROG_DATA *inner : mobProgs)
                {
                  victim->Prototype->mprog.progtypes |= inner->type;
                }
              
              return;
            }
        }

      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "delete" ) )
    {
      if ( mobProgs.empty() )
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

      int cnt = 0;
      bool found = false;
      int mptype = 0;

      for(const MPROG_DATA *mprg : mobProgs)
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
      int num = count_if(std::begin(mobProgs), std::end(mobProgs),
                         [mptype](const auto mprg)
                         {
                           return IsBitSet(mprg->type, mptype);
                         });
      auto result = Filter(mobProgs,
                           [&cnt, value](auto)
                           {
                             return (++cnt) == value;
                           });

      assert(!result.empty());
      
      MPROG_DATA *progToDelete = result.front();
      victim->Prototype->mprog.Remove(progToDelete);
      FreeMemory( progToDelete->arglist );
      FreeMemory( progToDelete->comlist );
      delete progToDelete;
      
      if ( num <= 1 )
        {
          RemoveBit( victim->Prototype->mprog.progtypes, mptype );
        }

      ch->Echo("Program removed.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "insert" ) )
    {
      if ( mobProgs.empty() )
        {
          ch->Echo("That mobile has no mob programs.\r\n");
          return;
        }

      argument = OneArgument( argument, arg4 );
      int mptype = GetMudProgFlag( arg4 );

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
      auto result = Filter(mobProgs,
                           [&cnt, value](auto mprg)
                           {
                             return (++cnt) == value;
                           });

      if(!result.empty())
        {
          MPROG_DATA *mprg = new MPROG_DATA();
          victim->Prototype->mprog.progtypes |= ( 1 << mptype );
          EditMobProg( ch, mprg, mptype, argument );
          victim->Prototype->mprog.InsertBefore(value, mprg);
        }
      else
        {
          ch->Echo("Program not found.\r\n");
        }
      
      return;
    }

  if ( !StrCmp( arg2, "add" ) )
    {
      int mptype = GetMudProgFlag( arg3 );

      if ( mptype == -1 )
        {
          ch->Echo("Unknown program type.\r\n");
          return;
        }

      MPROG_DATA *mprg = new MPROG_DATA();

      victim->Prototype->mprog.Add(mprg);
      victim->Prototype->mprog.progtypes     |= ( 1 << mptype );
      EditMobProg( ch, mprg, mptype, argument );
      return;
    }

  do_mpedit( ch, "" );
}

