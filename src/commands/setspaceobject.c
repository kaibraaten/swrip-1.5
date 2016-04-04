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
      SendToCharacter( "name filename type simulator\r\n", ch );
      Echo( ch, "xpos ypos zpos gravity secret%d-%d\r\n", 0, MAX_LANDINGSITE );
      Echo( ch, "location%d-%d dock%d-%d\r\n", 0, MAX_LANDINGSITE, 0, MAX_LANDINGSITE );
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

  if( !StringPrefix( "secret", arg2 ) )
    {
      const char *option = "secret";

      if( !StrCmp( option, arg2 ) )
	{
	  Echo( ch, "Range is %s%d to %s%d.\r\n",
		option, 0, option, MAX_LANDINGSITE );
	  return;
	}
      else if( strlen( arg2 ) == strlen( option ) + 1 )
	{
	  const char *numBuf = arg2 + strlen( option );
	  size_t siteNum = strtol( numBuf, NULL, 10 );

	  if( siteNum > MAX_LANDINGSITE )
	    {
	      Echo( ch, "Range is %s%d to %s%d.\r\n",
		    option, 0, option, MAX_LANDINGSITE );
	    }
	  else
	    {
	      LandingSite *site = &spaceobject->LandingSites[siteNum];
	      site->IsSecret = !site->IsSecret;
	      SendToCharacter( "Done.\r\n", ch );
	      SaveSpaceobject( spaceobject );
	    }

	  return;
	}
    }

  if( !StringPrefix( "dock", arg2 ) )
    {
      const char *option = "dock";

      if( !StrCmp( option, arg2 ) )
        {
          Echo( ch, "Range is %s%d to %s%d.\r\n",
                option, 0, option, MAX_LANDINGSITE );
          return;
        }
      else if( strlen( arg2 ) == strlen( option ) + 1 )
        {
          const char *numBuf = arg2 + strlen( option );
          size_t siteNum = strtol( numBuf, NULL, 10 );

          if( siteNum > MAX_LANDINGSITE )
            {
              Echo( ch, "Range is %s%d to %s%d.\r\n",
                    option, 0, option, MAX_LANDINGSITE );
            }
          else
            {
              LandingSite *site = &spaceobject->LandingSites[siteNum];
	      vnum_t vnum = strtol( argument, NULL, 10 );

	      if( !GetRoom( vnum ) && vnum != INVALID_VNUM )
		{
		  Echo( ch, "&RVnum %d doesn't exist.&d\r\n", vnum );
		  return;
		}

              site->Dock = vnum;
              SendToCharacter( "Done.\r\n", ch );
              SaveSpaceobject( spaceobject );
            }

          return;
        }
    }

  if( !StringPrefix( "location", arg2 ) )
    {
      const char *option = "location";

      if( !StrCmp( option, arg2 ) )
        {
          Echo( ch, "Range is %s%d to %s%d.\r\n",
                option, 0, option, MAX_LANDINGSITE );
          return;
        }
      else if( strlen( arg2 ) == strlen( option ) + 1 )
        {
          const char *numBuf = arg2 + strlen( option );
          size_t siteNum = strtol( numBuf, NULL, 10 );

          if( siteNum > MAX_LANDINGSITE )
            {
              Echo( ch, "Range is %s%d to %s%d.\r\n",
                    option, 0, option, MAX_LANDINGSITE );
            }
          else
            {
              LandingSite *site = &spaceobject->LandingSites[siteNum];
	      FreeMemory( site->LocationName );
	      site->LocationName = CopyString( argument );
              SendToCharacter( "Done.\r\n", ch );
              SaveSpaceobject( spaceobject );
            }

          return;
        }
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      SpaceobjectType sotype = SPACE_SUN;

      if( IsNumber(argument) )
        {
          sotype = (SpaceobjectType)atoi( argument );
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

  do_setspaceobject( ch, "" );
}
