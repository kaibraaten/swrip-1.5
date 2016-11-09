#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"

void do_minvoke( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex;
  Character *victim;
  short vnum;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Syntax: minvoke <vnum>.\r\n", ch );
      return;
    }

  if ( !IsNumber( arg ) )
    {
      char arg2[MAX_INPUT_LENGTH];
      int  hash, cnt;
      int  count = NumberArgument( arg, arg2 );

      vnum = -1;
      for ( hash = cnt = 0; hash < MAX_KEY_HASH; hash++ )
        for ( pMobIndex = MobIndexHash[hash];
              pMobIndex;
              pMobIndex = pMobIndex->Next )
          if ( NiftyIsName( arg2, pMobIndex->Name )
               &&   ++cnt == count )
            {
              vnum = pMobIndex->Vnum;
              break;
	    }
      if ( vnum == -1 )
        {
          SendToCharacter( "No such mobile exists.\r\n", ch );
          return;
        }
    }
  else
    vnum = atoi( arg );

  if ( GetTrustLevel(ch) < LEVEL_CREATOR )
    {
      Area *pArea;

      if ( IsNpc(ch) )
        {
          SendToCharacter( "Huh?\r\n", ch );
          return;
        }

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "You must have an assigned area to invoke this mobile.\r\n", ch );
          return;
        }
      if ( vnum < pArea->VnumRanges.Mob.First
           &&   vnum > pArea->VnumRanges.Mob.Last )
        {
          SendToCharacter( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if ( ( pMobIndex = GetProtoMobile( vnum ) ) == NULL )
    {
      SendToCharacter( "No mobile has that vnum.\r\n", ch );
      return;
    }

  victim = CreateMobile( pMobIndex );
  CharacterToRoom( victim, ch->InRoom );
  Act( AT_IMMORT, "$n has created $N!", ch, NULL, victim, TO_ROOM );
  SendToCharacter( "Ok.\r\n", ch );
}
