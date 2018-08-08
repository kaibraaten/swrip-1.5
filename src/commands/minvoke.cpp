#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_minvoke( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex = NULL;
  Character *victim = NULL;
  vnum_t vnum = INVALID_VNUM;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Syntax: minvoke <vnum>.\r\n");
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
          ch->Echo("No such mobile exists.\r\n");
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
          ch->Echo("Huh?\r\n");
          return;
        }

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          ch->Echo("You must have an assigned area to invoke this mobile.\r\n");
          return;
        }
      if ( vnum < pArea->VnumRanges.Mob.First
           &&   vnum > pArea->VnumRanges.Mob.Last )
        {
          ch->Echo("That number is not in your allocated range.\r\n");
          return;
        }
    }

  if ( ( pMobIndex = GetProtoMobile( vnum ) ) == NULL )
    {
      ch->Echo("No mobile has that vnum.\r\n");
      return;
    }

  victim = CreateMobile( pMobIndex );
  CharacterToRoom( victim, ch->InRoom );
  Act( AT_IMMORT, "$n has created $N!", ch, NULL, victim, TO_ROOM );
  ch->Echo("Ok.\r\n");
}

