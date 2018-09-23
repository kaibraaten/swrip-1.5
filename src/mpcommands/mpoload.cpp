#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"

void do_mpoload( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  ProtoObject *pObjIndex = nullptr;
  Object *obj = nullptr;
  int level = 0;
  int timer = 0;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || !IsNumber( arg1 ) )
    {
      ProgBug( "Mpoload - Bad syntax", ch );
      return;
    }

  if ( arg2.empty() )
    {
      level = GetTrustLevel( ch );
    }
  else
    {
      /*
       * New feature from Alander.
       */
      if ( !IsNumber( arg2 ) )
        {
          ProgBug( "Mpoload - Bad level syntax", ch );
          return;
        }

      level = ToLong( arg2 );

      if ( level < 0 || level > GetTrustLevel( ch ) )
        {
          ProgBug( "Mpoload - Bad level", ch );
          return;
        }

      /*
       * New feature from Thoric.
       */
      timer = ToLong( argument );

      if ( timer < 0 )
        {
          ProgBug( "Mpoload - Bad timer", ch );
          return;
        }
    }

  if ( ( pObjIndex = GetProtoObject( ToLong( arg1 ) ) ) == NULL )
    {
      ProgBug( "Mpoload - Bad vnum arg", ch );
      return;
    }

  obj = CreateObject( pObjIndex, level );
  obj->Timer = timer;

  if ( IsBitSet( obj->WearFlags, ITEM_TAKE ) )
    {
      ObjectToCharacter( obj, ch );
    }
  else
    {
      ObjectToRoom( obj, ch->InRoom );
    }
}
