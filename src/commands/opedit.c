#include "character.h"
#include "mud.h"
#include "editor.h"

void do_opedit( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  Object   *obj;
  MPROG_DATA *mprog, *mprg, *mprg_next;
  int value, mptype, cnt;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Mob's can't opedit\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      SendToCharacter( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MPROG_EDIT:
      if ( !ch->dest_buf )
        {
          SendToCharacter( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_opedit: sub_oprog_edit: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
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

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      SendToCharacter( "Syntax: opedit <object> <command> [number] <program> <value>\r\n", ch );
      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "Command being one of:\r\n",                        ch );
      SendToCharacter( "  add delete insert edit list\r\n",                ch );
      SendToCharacter( "Program being one of:\r\n",                        ch );
      SendToCharacter( "  act speech rand wear remove sac zap get\r\n",  ch );
      SendToCharacter( "  drop damage repair greet exa use\r\n",ch );
      SendToCharacter( "  pull push (for levers,pullchains,buttons)\r\n",ch );
      SendToCharacter( "\r\n", ch);
      SendToCharacter( "Object should be in your inventory to edit.\r\n",ch);
      return;
    }

  if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
      if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
	{
          SendToCharacter( "You aren't carrying that.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj = get_obj_world( ch, arg1 ) ) == NULL )
        {
          SendToCharacter( "Nothing like that in all the realms.\r\n", ch );
          return;
        }
    }

  if ( !can_omodify( ch, obj ) )
    return;

  if ( !IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      SendToCharacter( "An object must have a prototype flag to be opset.\r\n", ch );
      return;
    }

  mprog = obj->Prototype->mprog.mudprogs;

  SetCharacterColor( AT_GREEN, ch );

  if ( !StrCmp( arg2, "list" ) )
    {
      cnt = 0;
      if ( !mprog )
        {
          SendToCharacter( "That object has no obj programs.\r\n", ch );
          return;
        }
      for ( mprg = mprog; mprg; mprg = mprg->next )
        ChPrintf( ch, "%d>%s %s\r\n%s\r\n",
                   ++cnt,
                   mprog_type_to_name( mprg->type ),
                   mprg->arglist,
                   mprg->comlist );
      return;
    }

  if ( !StrCmp( arg2, "edit" ) )
    {
      if ( !mprog )
        {
          SendToCharacter( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = OneArgument( argument, arg4 );
      if ( arg4[0] != '\0' )
        {
          mptype = GetMudProgFlag( arg4 );
          if ( mptype == -1 )
            {
              SendToCharacter( "Unknown program type.\r\n", ch );
              return;
            }
        }
      else
        mptype = -1;
      if ( value < 1 )
        {
          SendToCharacter( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value )
            {
              mpedit( ch, mprg, mptype, argument );
              obj->Prototype->mprog.progtypes = 0;
              for ( mprg = mprog; mprg; mprg = mprg->next )
                obj->Prototype->mprog.progtypes |= mprg->type;
              return;
            }
        }
      SendToCharacter( "Program not found.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "delete" ) )
    {
      int num;
      bool found;

      if ( !mprog )
	{
          SendToCharacter( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = OneArgument( argument, arg4 );
      if ( value < 1 )
        {
          SendToCharacter( "Program not found.\r\n", ch );
          return;
        }
      cnt = 0; found = false;
      for ( mprg = mprog; mprg; mprg = mprg->next )
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
          SendToCharacter( "Program not found.\r\n", ch );
          return;
        }
      cnt = num = 0;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        if ( IsBitSet( mprg->type, mptype ) )
          num++;
      if ( value == 1 )
        {
          mprg_next = obj->Prototype->mprog.mudprogs;
          obj->Prototype->mprog.mudprogs = mprg_next->next;
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
      FreeMemory( mprg_next->arglist );
      FreeMemory( mprg_next->comlist );
      FreeMemory( mprg_next );
      if ( num <= 1 )
        RemoveBit( obj->Prototype->mprog.progtypes, mptype );
      SendToCharacter( "Program removed.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "insert" ) )
    {
      if ( !mprog )
        {
          SendToCharacter( "That object has no obj programs.\r\n", ch );
          return;
        }
      argument = OneArgument( argument, arg4 );
      mptype = GetMudProgFlag( arg4 );
      if ( mptype == -1 )
        {
          SendToCharacter( "Unknown program type.\r\n", ch );
          return;
        }
      if ( value < 1 )
        {
          SendToCharacter( "Program not found.\r\n", ch );
          return;
        }
      if ( value == 1 )
        {
          AllocateMemory( mprg, MPROG_DATA, 1 );
          obj->Prototype->mprog.progtypes    |= ( 1 << mptype );
          mpedit( ch, mprg, mptype, argument );
          mprg->next = mprog;
          obj->Prototype->mprog.mudprogs = mprg;
          return;
        }
      cnt = 1;
      for ( mprg = mprog; mprg; mprg = mprg->next )
        {
          if ( ++cnt == value && mprg->next )
            {
              AllocateMemory( mprg_next, MPROG_DATA, 1 );
              obj->Prototype->mprog.progtypes |= ( 1 << mptype );
              mpedit( ch, mprg_next, mptype, argument );
              mprg_next->next = mprg->next;
	      mprg->next        = mprg_next;
              return;
            }
        }
      SendToCharacter( "Program not found.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "add" ) )
    {
      mptype = GetMudProgFlag( arg3 );
      if ( mptype == -1 )
        {
          SendToCharacter( "Unknown program type.\r\n", ch );
          return;
        }
      if ( mprog != NULL )
        for ( ; mprog->next; mprog = mprog->next );
      AllocateMemory( mprg, MPROG_DATA, 1 );
      if ( mprog )
        mprog->next                      = mprg;
      else
        obj->Prototype->mprog.mudprogs        = mprg;
      obj->Prototype->mprog.progtypes        |= ( 1 << mptype );
      mpedit( ch, mprg, mptype, argument );
      mprg->next = NULL;
      return;
    }

  do_opedit( ch, "" );
}
