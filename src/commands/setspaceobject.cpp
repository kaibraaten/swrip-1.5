#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "spaceobject.hpp"
#include "repos/spaceobjectrepository.hpp"

void do_setspaceobject( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  std::shared_ptr<Spaceobject> spaceobject;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ch->Echo("Usage: setspaceobject <spaceobject> <field> <values>\r\n");
      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo("name type simulator\r\n");
      ch->Echo("xpos ypos zpos gravity secret%d-%lu\r\n", 0, MAX_LANDINGSITE - 1 );
      ch->Echo("location%d-%lu dock%d-%lu\r\n", 0, MAX_LANDINGSITE - 1, 0, MAX_LANDINGSITE -1 );
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
          ch->Echo("Range is %s%d to %s%lu.\r\n",
                   option, 0, option, MAX_LANDINGSITE - 1 );
	  return;
	}
      else if( arg2.size() == strlen( option ) + 1 )
	{
	  const char *numBuf = arg2.c_str() + strlen( option );
	  size_t siteNum = ToLong( numBuf );

	  if( siteNum >= MAX_LANDINGSITE )
	    {
              ch->Echo("Range is %s%d to %s%lu.\r\n",
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
          ch->Echo("Range is %s%d to %s%lu.\r\n",
                   option, 0, option, MAX_LANDINGSITE - 1 );
          return;
        }
      else if( arg2.size() == strlen( option ) + 1 )
        {
          const char *numBuf = arg2.c_str() + strlen( option );
          size_t siteNum = ToLong( numBuf );

          if( siteNum >= MAX_LANDINGSITE )
            {
              ch->Echo("Range is %s%d to %s%lu.\r\n",
                       option, 0, option, MAX_LANDINGSITE - 1 );
            }
          else
            {
              LandingSite *site = &spaceobject->LandingSites[siteNum];
	      vnum_t vnum = ToLong( argument );

	      if( !GetRoom( vnum ) && vnum != INVALID_VNUM )
		{
                  ch->Echo("&RVnum %ld doesn't exist.&d\r\n", vnum );
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
          ch->Echo("Range is %s%d to %s%lu.\r\n",
                   option, 0, option, MAX_LANDINGSITE - 1 );
          return;
        }
      else if( arg2.size() == strlen( option ) + 1 )
        {
          const char *numBuf = arg2.c_str() + strlen( option );
          size_t siteNum = ToLong( numBuf );

          if( siteNum >= MAX_LANDINGSITE )
            {
              ch->Echo("Range is %s%d to %s%lu.\r\n",
                       option, 0, option, MAX_LANDINGSITE - 1 );
            }
          else
            {
              LandingSite *site = &spaceobject->LandingSites[siteNum];
	      site->LocationName = argument;
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
          sotype = (SpaceobjectType) ToLong( argument );
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
      spaceobject->Position.x = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "ypos" ) )
    {
      spaceobject->Position.y = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "zpos" ) )
    {
      spaceobject->Position.z = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "gravity" ) )
    {
      spaceobject->Gravity = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "hx" ) )
    {
      spaceobject->Heading.x = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "hy" ) )
    {
      spaceobject->Heading.y = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "hz" ) )
    {
      spaceobject->Heading.z = ToLong( argument );
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  if ( !StrCmp( arg2, "speed" ) )
    {
      int speed = ToLong( argument );

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

      unlink( GetSpaceobjectFilename( spaceobject ).c_str() );

      spaceobject->Name = argument;
      ch->Echo("Done.\r\n");
      Spaceobjects->Save(spaceobject);
      return;
    }

  do_setspaceobject( ch, "" );
}
