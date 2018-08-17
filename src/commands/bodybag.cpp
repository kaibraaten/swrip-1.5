#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

void do_bodybag( Character *ch, char *argument )
{
  char buf2[MAX_STRING_LENGTH];
  char buf3[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Object *obj = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Bodybag whom?\r\n" );
      return;
    }

  /* make sure the buf3 is clear? */
  sprintf(buf3, " ");
  /* check to see if vict is playing? */
  sprintf(buf2, "the corpse of %s", arg);

  bool found = false;

  for ( obj = FirstObject; obj; obj = obj->Next )
    {
      if ( obj->InRoom
           && !StrCmp( buf2, obj->ShortDescr )
           && (obj->Prototype->Vnum == OBJ_VNUM_CORPSE_PC ) )
        {
          found = true;
          ch->Echo( "Bagging body: [%5d] %-28s [%5d] %s\r\n",
                    obj->Prototype->Vnum,
                    obj->ShortDescr,
                    obj->InRoom->Vnum,
                    obj->InRoom->Name );
          ObjectFromRoom(obj);
          obj = ObjectToCharacter(obj, ch);
          obj->Timer = -1;
          SaveCharacter( ch );
        }
    }

  if ( !found )
    {
      ch->Echo( "You couldn't find any %s\r\n", buf2 );
    }
}

