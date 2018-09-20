#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "repos/objectrepository.hpp"

void do_vsearch( Character *ch, std::string arg )
{
  bool found = false;
  int obj_counter = 1;
  vnum_t argi = INVALID_VNUM;

  if( arg.empty() )
    {
      ch->Echo("Syntax: vsearch <vnum>\r\n");
      return;
    }

  SetCharacterColor( AT_PLAIN, ch );
  argi = ToLong(arg);

  if (argi < MIN_VNUM && argi > MAX_VNUM)
    {
      ch->Echo("Vnum out of range.\r\n");
      return;
    }

  for( const Object *obj : Objects->Entities() )
    {
      if ( !CanSeeObject( ch, obj ) || !( argi == obj->Prototype->Vnum ))
        continue;

      found = true;
      const Object *in_obj = nullptr;
      
      for ( in_obj = obj; in_obj->InObject != NULL;
            in_obj = in_obj->InObject );

      if ( in_obj->CarriedBy != NULL )
        ch->Echo("[%2d] Level %d %s carried by %s.\r\n",
                 obj_counter,
                 obj->Level, GetObjectShortDescription(obj).c_str(),
                 PERS( in_obj->CarriedBy, ch ).c_str() );
      else
        ch->Echo("[%2d] [%-5d] %s in %s.\r\n", obj_counter,
                 in_obj->InRoom ? in_obj->InRoom->Vnum : 0,
                 GetObjectShortDescription(obj).c_str(),
                 in_obj->InRoom == nullptr ?
                 "somewhere" : in_obj->InRoom->Name.c_str() );

      obj_counter++;
    }

  if ( !found )
    ch->Echo("Nothing like that in hell, earth, or heaven.\r\n" );
}
