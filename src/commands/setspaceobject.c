#include <string.h>
#include "mud.h"
#include "character.h"

void do_setspaceobject( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Spaceobject *spaceobject;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: setspaceobject <spaceobject> <field> <values>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "name filename type trainer,\r\n", ch );
      send_to_char( "xpos ypos zpos gravity seca secb secc,\r\n", ch );
      send_to_char( "locationa locationb locationc doca docb docc\r\n", ch );
      send_to_char( "", ch );
      return;
    }

  spaceobject = spaceobject_from_name( arg1 );

  if ( !spaceobject )
    {
      send_to_char( "No such spaceobject.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "trainer" ) )
    {
      if ( spaceobject->trainer )
        spaceobject->trainer = 0;
      else
        spaceobject->trainer = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "seca" ) )
    {
      if ( spaceobject->landing_site.seca )
        spaceobject->landing_site.seca = 0;
      else
        spaceobject->landing_site.seca = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "secb" ) )
    {
      if ( spaceobject->landing_site.secb )
        spaceobject->landing_site.secb = 0;
      else
        spaceobject->landing_site.secb = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "secc" ) )
    {
      if ( spaceobject->landing_site.secc )
        spaceobject->landing_site.secc = 0;
      else
        spaceobject->landing_site.secc = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      int sotype = 0;

      if( IsNumber(argument) )
        {
          sotype = atoi( argument );
        }
      else
        {
          sotype = GetSpaceobjectType(argument);
        }

      if( sotype < 0 || sotype >= (int)GetSpaceobjectTypeSize() )
        {
          size_t n = 0;

          ch_printf(ch, "Invalid type. Possible values:\r\n");

          for(n = 0; n < GetSpaceobjectTypeSize(); ++n)
            {
              ch_printf(ch, " %s", GetSpaceobjectTypeTable()[n]);
            }

          ch_printf(ch, "\r\n");
          return;
        }

      spaceobject->type = sotype;
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "doca" ) )
    {
      spaceobject->landing_site.doca = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "docb" ) )
    {
      spaceobject->landing_site.docb = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "docc" ) )
    {
      spaceobject->landing_site.docc = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }


  if ( !StrCmp( arg2, "xpos" ) )
    {
      spaceobject->pos.x = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "ypos" ) )
    {
      spaceobject->pos.y = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "zpos" ) )
    {
      spaceobject->pos.z = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "gravity" ) )
    {
      spaceobject->gravity = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }
  if ( !StrCmp( arg2, "hx" ) )
    {
      spaceobject->head.x = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "hy" ) )
    {
      spaceobject->head.y = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "hz" ) )
    {
      spaceobject->head.z = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "speed" ) )
    {
      spaceobject->speed = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( spaceobject->name );
      spaceobject->name = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( spaceobject->filename );
      spaceobject->filename = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "locationa" ) )
    {
      FreeMemory( spaceobject->landing_site.locationa );
      spaceobject->landing_site.locationa = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }
  if ( !StrCmp( arg2, "locationb" ) )
    {
      FreeMemory( spaceobject->landing_site.locationb );
      spaceobject->landing_site.locationb = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }
  if ( !StrCmp( arg2, "locationc" ) )
    {
      FreeMemory( spaceobject->landing_site.locationc );
      spaceobject->landing_site.locationc = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  do_setspaceobject( ch, "" );
}
