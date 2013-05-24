#include <string.h>
#include "mud.h"
#include "character.h"

void do_showstatistic( CHAR_DATA *ch, char *argument )
{
  PC_DATA *pcdata;
  CHAR_DATA *raceCh;
  int race, pclass, iR, iC, iC2;
  bool chk_race = FALSE;
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if( !ch )
    do_showstatistic_web( NULL, argument );

  race = get_race_from_name( argument );
  if ( race < 0 )
    pclass = get_class_from_name( argument );
  else
    chk_race = TRUE;

  if( race < 0 && pclass < 0 )
    {
      send_to_char( "No such race or class.\r\n", ch );
      return;
    }

  if ( race == RACE_GOD )
    {
      send_to_char("Gods are indefeasible...\r\n",ch);
      return;
    }

  CREATE( raceCh, CHAR_DATA, 1 );
  raceCh->top_level = 1;
  raceCh->trust = 0;
  CREATE( pcdata, PC_DATA, 1 );
  raceCh->pcdata = pcdata;
  raceCh->in_room = get_room_index( ROOM_VNUM_LIMBO );
  raceCh->stats.perm_str = 20;
  raceCh->stats.perm_int = 20;
  raceCh->stats.perm_wis = 20;
  raceCh->stats.perm_dex = 20;
  raceCh->stats.perm_con = 20;
  raceCh->stats.perm_cha = 20;
  raceCh->stats.perm_lck = 3;

  if( chk_race )
    raceCh->race = race;
  else
    {
      raceCh->ability.main = pclass;
      raceCh->race = 0;
    }

  raceCh->stats.perm_str       += race_table[raceCh->race].stats.mod_str;
  raceCh->stats.perm_int       += race_table[raceCh->race].stats.mod_int;
  raceCh->stats.perm_wis       += race_table[raceCh->race].stats.mod_wis;
  raceCh->stats.perm_dex       += race_table[raceCh->race].stats.mod_dex;
  raceCh->stats.perm_con       += race_table[raceCh->race].stats.mod_con;
  raceCh->stats.perm_cha       += race_table[raceCh->race].stats.mod_cha;

  if( chk_race )
    {
      sprintf( buf, "&R%s Statistics\r\n", race_table[race].race_name );
      send_to_pager( buf, ch );
      sprintf( buf, "&cStr: &C%d  &cWis: &C%d  &cInt: &C%d  &cDex: &C%d  &cCon: &C%d  &cCha: &C%d\r\n",
               raceCh->stats.perm_str, raceCh->stats.perm_wis, raceCh->stats.perm_int,
               raceCh->stats.perm_dex, raceCh->stats.perm_con, raceCh->stats.perm_cha );
      send_to_pager( buf, ch );

      for( iC = 0; iC < MAX_ABILITY; iC++ )
        {
          if( iC == FORCE_ABILITY )
            continue;
          raceCh->ability.main = iC;
	  sprintf( buf, "\r\n&c%-20s &B| &C", ability_name[iC] );
          for( iC2 = 0; iC2 < MAX_ABILITY; iC2++ )
            {
              if( iC2 == FORCE_ABILITY )
                continue;
              if( iC2 == COMMANDO_ABILITY )
                continue;

              if( iC2 == SMUGGLING_ABILITY )
                sprintf( buf2, "%-3d+ &B| &C", max_level( raceCh, iC2 ) );
              else
                sprintf( buf2, "%-3d &B| &C", max_level( raceCh, iC2 ) );

              strcat( buf, buf2 );
            }
          send_to_pager( buf, ch );
        }
    }
  else
    {
      sprintf( buf, "&R%s Statistics\r\n", ability_name[pclass]);
      send_to_pager( buf, ch );

      for( iR = 0; iR < MAX_RACE; iR++ )
        {
          raceCh->race = iR;
          raceCh->stats.perm_str = 20 + race_table[raceCh->race].stats.mod_str;
          raceCh->stats.perm_int = 20 + race_table[raceCh->race].stats.mod_int;
          raceCh->stats.perm_wis = 20 + race_table[raceCh->race].stats.mod_wis;
          raceCh->stats.perm_dex = 20 + race_table[raceCh->race].stats.mod_dex;
          raceCh->stats.perm_con = 20 + race_table[raceCh->race].stats.mod_con;
          raceCh->stats.perm_cha = 20 + race_table[raceCh->race].stats.mod_cha;
          sprintf( buf, "\r\n&c%-20s &B| &C", race_table[iR].race_name );
          for( iC2 = 0; iC2 < FORCE_ABILITY; iC2++ )
            {
              if( iC2 == SMUGGLING_ABILITY )
                sprintf( buf2, "%-3d+ &B| &C", max_level( raceCh, iC2 ) );
              else
                sprintf( buf2, "%-3d &B| &C", max_level( raceCh, iC2 ) );
              strcat( buf, buf2 );
            }
          send_to_pager( buf, ch );
        }
    }

  DISPOSE( raceCh->pcdata );
  DISPOSE( raceCh );
}
