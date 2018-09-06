#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"

/* lets the mobile destroy an object in its inventory
   it can also destroy a worn object and it can destroy
   items using all.xxxxx or just plain all of them */

void do_mpjunk( Character *ch, std::string arg )
{
  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( arg.empty() )
    {
      ProgBug( "Mpjunk - No argument", ch );
      return;
    }

  if ( StrCmp( arg, "all" ) && StringPrefix( "all.", arg ) )
    {
      Object *obj = GetWornObject(ch, arg);
      
      if ( obj != nullptr )
        {
          UnequipCharacter( ch, obj );
          ExtractObject( obj );
        }
      else
        {
          obj = GetCarriedObject(ch, arg);

          if(obj != nullptr)
            {
              ExtractObject( obj );
            }
        }
    }
  else
    {
      std::list<Object*> objectsToExtract = Filter(ch->Objects(),
                                                   [arg](auto obj)
                                                   {
                                                     return arg[3] == '\0'
                                                       || IsName(arg.substr( 4 ), obj->Name);
                                                   });
      for(Object *obj : objectsToExtract)
        {
          if ( obj->WearLoc != WEAR_NONE)
            {
              UnequipCharacter( ch, obj );
            }
          
          ExtractObject( obj );
        }
    }
}
