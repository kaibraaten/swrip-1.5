#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "repos/objectrepository.hpp"
#include "repos/playerrepository.hpp"

void do_bodybag( Character *ch, std::string arg )
{
  char buf2[MAX_STRING_LENGTH] = {'\0'};
  char buf3[MAX_STRING_LENGTH] = {'\0'};

  if ( arg.empty() )
    {
      ch->Echo( "Bodybag whom?\r\n" );
      return;
    }

  /* make sure the buf3 is clear? */
  sprintf(buf3, " ");
  /* check to see if vict is playing? */
  sprintf(buf2, "the corpse of %s", arg.c_str());

  bool found = false;

  for ( Object *obj : Objects->Entities() )
    {
      if ( obj->InRoom
           && !StrCmp( buf2, obj->ShortDescr )
           && (obj->Prototype->Vnum == OBJ_VNUM_CORPSE_PC ) )
        {
          found = true;
          ch->Echo( "Bagging body: [%5d] %-28s [%5d] %s\r\n",
                    obj->Prototype->Vnum,
                    obj->ShortDescr.c_str(),
                    obj->InRoom->Vnum,
                    obj->InRoom->Name.c_str() );
          ObjectFromRoom(obj);
          obj = ObjectToCharacter(obj, ch);
          obj->Timer = -1;
          PlayerCharacters->Save( ch );
        }
    }

  if ( !found )
    {
      ch->Echo( "You couldn't find any %s\r\n", buf2 );
    }
}
