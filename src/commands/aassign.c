#include "mud.h"
#include "character.h"
#include "area.h"

void do_aassign( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Area *tarea, *tmp;

  if ( IsNpc( ch ) )
    return;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Syntax: aassign <filename.are>\r\n", ch );
      return;
    }

  if ( !StrCmp( "none", argument )
       || !StrCmp( "null", argument )
       || !StrCmp( "clear", argument ) )
    {
      ch->PCData->Build.Area = NULL;
      AssignAreaTo( ch );

      if ( !ch->PCData->Build.Area )
        SendToCharacter( "Area pointer cleared.\r\n", ch );
      else
        SendToCharacter( "Originally assigned area restored.\r\n", ch );
      return;
    }

  sprintf( buf, "%s", argument );
  tarea = NULL;

  if ( GetTrustLevel(ch) >= LEVEL_GREATER
       ||  (IsName( buf, ch->PCData->Bestowments )
            &&   GetTrustLevel(ch) >= SysData.LevelToModifyProto) )
    for ( tmp = first_area; tmp; tmp = tmp->Next )
      if ( !StrCmp( buf, tmp->Filename ) )
        {
          tarea = tmp;
          break;
        }

  if ( !tarea )
    for ( tmp = first_build; tmp; tmp = tmp->Next )
      if ( !StrCmp( buf, tmp->Filename ) )
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
              SendToCharacter( "You do not have permission to use that area.\r\n", ch );
              return;
            }
        }

  if( !StrCmp( buf, "this" ) )
    {
      tarea = ch->InRoom->Area;
    }

  if ( !tarea )
    {
      if ( GetTrustLevel(ch) >= SysData.LevelToModifyProto )
        SendToCharacter( "No such area. Use 'zones'.\r\n", ch );
      else
        SendToCharacter( "No such area. Use 'newzones'.\r\n", ch );
      return;
    }
  ch->PCData->Build.Area = tarea;
  Echo( ch, "Assigning you: %s\r\n", tarea->Name );
}
