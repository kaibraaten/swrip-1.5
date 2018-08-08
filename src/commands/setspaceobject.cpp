#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "spaceobject.hpp"

void do_setspaceobject( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Spaceobject *spaceobject;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("Usage: setspaceobject <spaceobject> <field> <values>\r\n");
      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo("name type simulator\r\n");
      ch->Echo("xpos ypos zpos gravity secret%d-%d\r\n", 0, MAX_LANDINGSITE - 1 );
      ch->Echo("location%d-%d dock%d-%d\r\n", 0, MAX_LANDINGSITE - 1, 0, MAX_LANDINGSITE -1 );
      return;
    }

  spaceobject = GetSpaceobject( arg1 );

  if ( !spaceobject )
    {
      ch->Echo("No such spaceobject.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "simulator" ) )
    {
      spaceobject->IsSimulator = !spaceobject->IsSimulator;
      Spaceobjects->Save(spaceobject);
      return;
    }

  if( !StringPrefix( "secret", arg2 ) )
    {
      const char *option = "secret";

      if( !StrCmp( option, arg2 ) )
	{
   ch->Echo("Range is %s%d to %s%d.\r\n",
		option, 0, option, MAX_LANDINGSITE - 1 );
	  return;
	}
      else if( strlen( arg2 ) == strlen( option ) + 1 )
	{
	  const char *numBuf = arg2 + strlen( option );
	  size_t siteNum = strtol( numBuf, NULL, 10 );

	  if( siteNum >= MAX_LANDINGSITE )
	    {
       ch->Echo("Range is %s%d to %s%d.\r\n",
		    option, 0, option, MAX_LANDINGSITE - 1 );
	    }
	  else
	    {
	      LandingSite *site = &spaceobject->LandingSites[siteNum];
	      site->IsSecret = !site->IsSecret;
       ch->Echo("Done.\r\n");
	      Spaceobjects->Save(spaceobject);
	    }

	  return;
	}
    }

  if( !StringPrefix( "dock", arg2 ) )
    {
      const char *option = "dock";

      if( !StrCmp( option, arg2 ) )
        {
          ch->Echo("Range is %s%d to %s%d.\r\n",
                option, 0, option, MAX_LANDINGSITE - 1 );
          return;
        }
      else if( strlen( arg2 ) == strlen( option ) + 1 )
        {
          const char *numBuf = arg2 + strlen( option );
          size_t siteNum = strtol( numBuf, NULL, 10 );

          if( siteNum >= MAX_LANDINGSITE )
            {
              ch->Echo("Range is %s%d to %s%d.\r\n",
                    option, 0, option, MAX_LANDINGSITE - 1 );
            }
          else
            {
              LandingSite *site = &spaceobject->LandingSites[siteNum];
	      vnum_t vnum = strtol( argument, NULL, 10 );

	      if( !GetRoom( vnum ) && vnum != INVALID_VNUM )
		{
    ch->Echo("&RVnum %d doesn't exist.&d\r\n", vnum );
		  return;
		}

              site->Dock = vnum;
              ch->Echo("Done.\r\n");
              Spaceobjects->Save(spaceobject);
            }

          return;
        }
    }

  if( !StringPrefix( "location", arg2 ) )
    {
      const char *option = "location";

      if( !StrCmp( option, arg2 ) )
        {
          ch->Echo("Range is %s%d to %s%d.\r\n",
                option, 0, option, MAX_LANDINGSITE - 1 );
          return;
        }
      else if( strlen( arg2 ) == strlen( option ) + 1 )
        {
          const char *numBuf = arg2 + strlen( option );
          size_t siteNum = strtol( numBuf, NULL, 10 );

          if( siteNum >= MAX_LANDINGSITE )
            {
              ch->Echo("Range is %s%d to %s%d.\r\n",
                    option, 0, option, MAX_LANDINGSITE - 1 );
            }
          else
            {
              LandingSite *site = &spaceobject->LandingSites[siteNum];
	      FreeMemory( site->LocationName );
	      site->LocationName = CopyString( argument );
              ch->Echo("Done.\r\n");
              Spaceobjects->Save(spaceobject);
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

      if( sotype < SPACE_SUN || (size_t) sotype >= SpaceobjectTypeName.size() )
        {
          ch->Echo("Invalid type. Possible values:\r\n");

          for(const char * const name : SpaceobjectTypeName)
            {
              ch->Echo(" %s", name);
            }

          ch->Echo("\r\n");
          return;
        }

      spaceobject->Type = sotype;
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "xpos" ) )
    {
      spaceobject->Position.x = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "ypos" ) )
    {
      spaceobject->Position.y = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "zpos" ) )
    {
      spaceobject->Position.z = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "gravity" ) )
    {
      spaceobject->Gravity = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "hx" ) )
    {
      spaceobject->Heading.x = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "hy" ) )
    {
      spaceobject->Heading.y = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "hz" ) )
    {
      spaceobject->Heading.z = atoi( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "speed" ) )
    {
      int speed = atoi( argument );

      if( speed < 0 )
	{
   ch->Echo("&RSpeed must be zero or more.&d\r\n" );
	  return;
	}

      spaceobject->Speed = speed;
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if( GetSpaceobject( argument ) )
	{
   ch->Echo("&RThere's already another spaceobject with that name.&d\r\n" );
	  return;
	}

      unlink( GetSpaceobjectFilename( spaceobject ) );

      FreeMemory( spaceobject->Name );
      spaceobject->Name = CopyString( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  do_setspaceobject( ch, "" );
}

