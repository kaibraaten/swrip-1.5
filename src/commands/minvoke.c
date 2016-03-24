#include "character.h"
#include "mud.h"

extern ProtoMobile *mob_index_hash[MAX_KEY_HASH];

void do_minvoke( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex;
  Character *victim;
  short vnum;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
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
        for ( pMobIndex = mob_index_hash[hash];
              pMobIndex;
              pMobIndex = pMobIndex->next )
          if ( NiftyIsName( arg2, pMobIndex->name )
               &&   ++cnt == count )
            {
              vnum = pMobIndex->vnum;
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

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          SendToCharacter( "You must have an assigned area to invoke this mobile.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_m_vnum
           &&   vnum > pArea->hi_m_vnum )
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
  CharacterToRoom( victim, ch->in_room );
  Act( AT_IMMORT, "$n has created $N!", ch, NULL, victim, TO_ROOM );
  SendToCharacter( "Ok.\r\n", ch );
}
