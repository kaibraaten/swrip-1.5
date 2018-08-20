#include <cassert>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "log.hpp"
#include "object.hpp"
#include "protoobject.hpp"

void do_opedit( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];

  if ( IsNpc( ch ) )
    {
      ch->Echo("Mob's can't opedit\r\n");
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
          Log->Bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf" );
          ch->SubState = SUB_NONE;
          return;
        }

      {
        MPROG_DATA *mprog = (MPROG_DATA*)ch->dest_buf;

        if ( mprog->comlist )
          {
            FreeMemory( mprog->comlist );
          }
        
        mprog->comlist = CopyBuffer( ch );
      }
      
      StopEditing( ch );
      return;
    }

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  int value = atoi( arg3 );

  if ( IsNullOrEmpty( arg1) || IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("Syntax: opedit <object> <command> [number] <program> <value>\r\n");
      ch->Echo("\r\n");
      ch->Echo("Command being one of:\r\n");
      ch->Echo("  add delete insert edit list\r\n");
      ch->Echo("Program being one of:\r\n");
      ch->Echo("  act speech rand wear remove sac zap get\r\n");
      ch->Echo("  drop damage repair greet exa use\r\n");
      ch->Echo("  pull push (for levers,pullchains,buttons)\r\n");
      ch->Echo("\r\n");
      ch->Echo("Object should be in your inventory to edit.\r\n");
      return;
    }

  Object *obj = nullptr;
  
  if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
      obj = GetCarriedObject( ch, arg1 );
      
      if ( obj == nullptr )
	{
          ch->Echo("You aren't carrying that.\r\n");
          return;
        }
    }
  else
    {
      obj = GetObjectAnywhere( ch, arg1 );
      
      if ( obj == nullptr )
        {
          ch->Echo("Nothing like that in all the realms.\r\n");
          return;
        }
    }

  if ( !CanModifyObject( ch, obj ) )
    return;

  if ( !IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      ch->Echo("An object must have a prototype flag to be opset.\r\n");
      return;
    }

  const std::list<MPROG_DATA*> &mudProgs(obj->Prototype->mprog.MudProgs());
  
  SetCharacterColor( AT_GREEN, ch );

  if ( !StrCmp( arg2, "list" ) )
    {
      int cnt = 0;

      if ( mudProgs.empty() )
        {
          ch->Echo("That object has no obj programs.\r\n");
          return;
        }

      for(const MPROG_DATA *mprg : mudProgs)
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
      if ( mudProgs.empty() )
        {
          ch->Echo("That object has no obj programs.\r\n");
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

      for(MPROG_DATA *mprg : mudProgs)
        {
          if ( ++cnt == value )
            {
              EditMobProg( ch, mprg, mptype, argument );
              obj->Prototype->mprog.progtypes = 0;

              for(MPROG_DATA *inner : mudProgs)
                {
                  obj->Prototype->mprog.progtypes |= inner->type;
                }
              
              return;
            }
        }

      ch->Echo("Program not found.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "delete" ) )
    {
      if ( mudProgs.empty() )
	{
          ch->Echo("That object has no obj programs.\r\n");
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
      
      for(const MPROG_DATA *mprg : mudProgs)
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
      int num = count_if(std::begin(mudProgs), std::end(mudProgs),
                         [mptype](const auto mprg)
                         {
                           return IsBitSet(mprg->type, mptype);
                         });

      auto result = Filter(mudProgs,
                           [&cnt, value](auto)
                           {
                             return (++cnt) == value;
                           });
      
      assert(!result.empty());

      MPROG_DATA *progToDelete = result.front();
      obj->Prototype->mprog.Remove(progToDelete);
      FreeMemory( progToDelete->arglist );
      FreeMemory( progToDelete->comlist );
      delete progToDelete;

      if ( num <= 1 )
        {
          RemoveBit( obj->Prototype->mprog.progtypes, mptype );
        }

      ch->Echo("Program removed.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "insert" ) )
    {
      if ( mudProgs.empty() )
        {
          ch->Echo("That object has no obj programs.\r\n");
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

      auto result = Filter(mudProgs,
                           [&cnt, value](auto mprg)
                           {
                             return (++cnt) == value;
                           });

      if(!result.empty())
        {
          MPROG_DATA *mprg = new MPROG_DATA();
          obj->Prototype->mprog.progtypes |= ( 1 << mptype );
          EditMobProg( ch, mprg, mptype, argument );
          obj->Prototype->mprog.InsertBefore(value, mprg);
        }
      else
        {
          ch->Echo("Program not found.\r\n");
        }
      
      return;
    }

  if ( !StrCmp( arg2, "add" ) )
    {
      int mptype = GetMudProgFlag( arg2 );

      if ( mptype == -1 )
        {
          ch->Echo("Unknown program type.\r\n");
          return;
        }

      MPROG_DATA *mprg = new MPROG_DATA();

      obj->Prototype->mprog.Add(mprg);
      obj->Prototype->mprog.progtypes |= ( 1 << mptype );
      EditMobProg( ch, mprg, mptype, argument );
      return;
    }

  do_opedit( ch, "" );
}

