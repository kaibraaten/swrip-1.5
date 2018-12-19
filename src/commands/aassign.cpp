#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "systemdata.hpp"

void do_aassign( Character *ch, std::string argument )
{
  Area *tarea = nullptr, *tmp = nullptr;

  if ( IsNpc( ch ) )
    return;

  if ( argument.empty() )
    {
      ch->Echo( "Syntax: aassign <filename.are>\r\n" );
      return;
    }

  if ( !StrCmp( "none", argument )
       || !StrCmp( "null", argument )
       || !StrCmp( "clear", argument ) )
    {
      ch->PCData->Build.Area = NULL;
      AssignAreaTo( ch );

      if ( !ch->PCData->Build.Area )
        ch->Echo( "Area pointer cleared.\r\n" );
      else
        ch->Echo( "Originally assigned area restored.\r\n" );

      return;
    }

  if ( GetTrustLevel(ch) >= LEVEL_GREATER
       ||  (IsName( argument, ch->PCData->Bestowments )
            &&   GetTrustLevel(ch) >= SysData.LevelToModifyProto) )
    for ( tmp = FirstArea; tmp; tmp = tmp->Next )
      if ( !StrCmp( argument, tmp->Filename ) )
        {
          tarea = tmp;
          break;
        }

  if ( !tarea )
    for ( tmp = FirstBuild; tmp; tmp = tmp->Next )
      if ( !StrCmp( argument, tmp->Filename ) )
        {
          /*            if ( GetTrustLevel(ch) >= SysData.level_modify_proto  */
          if ( GetTrustLevel(ch) >= LEVEL_GREATER
               ||   IsName( tmp->Filename, ch->PCData->Bestowments ) )
            {
              tarea = tmp;
              break;
            }
          else
            {
              ch->Echo( "You do not have permission to use that area.\r\n" );
              return;
            }
        }

  if( !StrCmp( argument, "this" ) )
    {
      tarea = ch->InRoom->Area;
    }

  if ( !tarea )
    {
      if ( GetTrustLevel(ch) >= SysData.LevelToModifyProto )
        ch->Echo( "No such area. Use 'zones'.\r\n" );
      else
        ch->Echo( "No such area. Use 'newzones'.\r\n" );

      return;
    }
  
  ch->PCData->Build.Area = tarea;
  ch->Echo( "Assigning you: %s\r\n", tarea->Name.c_str() );
}

