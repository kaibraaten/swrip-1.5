#include "character.h"
#include "mud.h"

void do_mcreate( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  MOB_INDEX_DATA *pMobIndex = NULL;
  Character *mob = NULL;
  int vnum = 0, cvnum = 0;

  if ( IsNpc(ch) )
    {
      send_to_char( "Mobiles cannot create.\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  vnum = is_number( arg ) ? atoi( arg ) : -1;

  if ( vnum == -1 || !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: mcreate <vnum> [cvnum] <mobile name>\r\n", ch );
      return;
    }

  if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
    {
      send_to_char( "Bad number.\r\n", ch );
      return;
    }

  one_argument( argument, arg2 );
  cvnum = atoi( arg2 );

  if ( cvnum != 0 )
    argument = one_argument( argument, arg2 );

  if ( cvnum < 1 )
    cvnum = 0;

  if ( get_mob_index( vnum ) )
    {
      send_to_char( "A mobile with that number already exists.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    return;

  if ( GetTrustedLevel( ch ) <= LEVEL_IMMORTAL )
    {
      AREA_DATA *pArea;

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to create mobiles.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_m_vnum
           ||   vnum > pArea->hi_m_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  pMobIndex = make_mobile( vnum, cvnum, argument );

  if ( !pMobIndex )
    {
      send_to_char( "Error.\r\n", ch );
      log_string( "do_mcreate: make_mobile failed." );
      return;
    }

  mob = create_mobile( pMobIndex );
  char_to_room( mob, ch->in_room );
  act( AT_IMMORT, "$n waves $s arms about, and $N appears at $s command!",
       ch, NULL, mob, TO_ROOM );
  act( AT_IMMORT, "You wave your arms about, and $N appears at your command!",
       ch, NULL, mob, TO_CHAR );
}
