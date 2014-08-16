#include "character.h"
#include "mud.h"

extern ProtoMobile *mob_index_hash[MAX_KEY_HASH];

void do_minvoke( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex;
  Character *victim;
  short vnum;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: minvoke <vnum>.\r\n", ch );
      return;
    }

  if ( !is_number( arg ) )
    {
      char arg2[MAX_INPUT_LENGTH];
      int  hash, cnt;
      int  count = number_argument( arg, arg2 );

      vnum = -1;
      for ( hash = cnt = 0; hash < MAX_KEY_HASH; hash++ )
        for ( pMobIndex = mob_index_hash[hash];
              pMobIndex;
              pMobIndex = pMobIndex->next )
          if ( nifty_is_name( arg2, pMobIndex->player_name )
               &&   ++cnt == count )
            {
              vnum = pMobIndex->vnum;
              break;
	    }
      if ( vnum == -1 )
        {
          send_to_char( "No such mobile exists.\r\n", ch );
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
          send_to_char( "Huh?\r\n", ch );
          return;
        }

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to invoke this mobile.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_m_vnum
           &&   vnum > pArea->hi_m_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if ( ( pMobIndex = get_mob_index( vnum ) ) == NULL )
    {
      send_to_char( "No mobile has that vnum.\r\n", ch );
      return;
    }

  victim = create_mobile( pMobIndex );
  char_to_room( victim, ch->in_room );
  act( AT_IMMORT, "$n has created $N!", ch, NULL, victim, TO_ROOM );
  send_to_char( "Ok.\r\n", ch );
}
