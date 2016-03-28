#include <string.h>
#include "mud.h"
#include "character.h"
#include "spaceobject.h"

void do_setspaceobject( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Spaceobject *spaceobject;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Usage: setspaceobject <spaceobject> <field> <values>\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "name filename type simulator,\r\n", ch );
      SendToCharacter( "xpos ypos zpos gravity seca secb secc,\r\n", ch );
      SendToCharacter( "locationa locationb locationc doca docb docc\r\n", ch );
      SendToCharacter( "", ch );
      return;
    }

  spaceobject = GetSpaceobjectFromName( arg1 );

  if ( !spaceobject )
    {
      SendToCharacter( "No such spaceobject.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "simulator" ) )
    {
      spaceobject->IsSimulator = !spaceobject->IsSimulator;
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "seca" ) )
    {
      spaceobject->LandingSites.SecretA = !spaceobject->LandingSites.SecretA;
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "secb" ) )
    {
      spaceobject->LandingSites.SecretB = !spaceobject->LandingSites.SecretB;
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "secc" ) )
    {
      spaceobject->LandingSites.SecretC = !spaceobject->LandingSites.SecretC;
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      SpaceobjectType sotype = 0;

      if( IsNumber(argument) )
        {
          sotype = atoi( argument );
        }
      else
        {
          sotype = GetSpaceobjectType(argument);
        }

      if( sotype < SPACE_SUN || sotype >= GetSpaceobjectTypeSize() )
        {
          size_t n = 0;

          Echo(ch, "Invalid type. Possible values:\r\n");

          for(n = 0; n < GetSpaceobjectTypeSize(); ++n)
            {
              Echo(ch, " %s", SpaceobjectTypeName[n]);
            }

          Echo(ch, "\r\n");
          return;
        }

      spaceobject->Type = sotype;
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "doca" ) )
    {
      spaceobject->LandingSites.DocA = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "docb" ) )
    {
      spaceobject->LandingSites.DocB = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "docc" ) )
    {
      spaceobject->LandingSites.DocC = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }


  if ( !StrCmp( arg2, "xpos" ) )
    {
      spaceobject->Position.x = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "ypos" ) )
    {
      spaceobject->Position.y = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "zpos" ) )
    {
      spaceobject->Position.z = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "gravity" ) )
    {
      spaceobject->Gravity = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "hx" ) )
    {
      spaceobject->Heading.x = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "hy" ) )
    {
      spaceobject->Heading.y = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "hz" ) )
    {
      spaceobject->Heading.z = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "speed" ) )
    {
      int speed = atoi( argument );

      if( speed < 0 )
	{
	  Echo( ch, "&RSpeed must be zero or more.&d\r\n" );
	  return;
	}

      spaceobject->Speed = speed;
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if( GetSpaceobjectFromName( argument ) )
	{
	  Echo( ch, "&RThere's already another spaceobject with that name.&d\r\n" );
	  return;
	}

      FreeMemory( spaceobject->Name );
      spaceobject->Name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "locationa" ) )
    {
      FreeMemory( spaceobject->LandingSites.LocationAName );
      spaceobject->LandingSites.LocationAName = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "locationb" ) )
    {
      FreeMemory( spaceobject->LandingSites.LocationBName );
      spaceobject->LandingSites.LocationBName = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  if ( !StrCmp( arg2, "locationc" ) )
    {
      FreeMemory( spaceobject->LandingSites.LocationCName );
      spaceobject->LandingSites.LocationCName = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveSpaceobject( spaceobject );
      return;
    }

  do_setspaceobject( ch, "" );
}
