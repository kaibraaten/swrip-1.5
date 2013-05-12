#include <string.h>
#include "mud.h"

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
  raceCh->perm_str = 20;
  raceCh->perm_int = 20;
  raceCh->perm_wis = 20;
  raceCh->perm_dex = 20;
  raceCh->perm_con = 20;
  raceCh->perm_cha = 20;
  raceCh->perm_lck = 3;

  if( chk_race )
    raceCh->race = race;
  else
    {
      raceCh->main_ability = pclass;
      raceCh->race = 0;
    }

  raceCh->perm_str       += race_table[raceCh->race].str_plus;
  raceCh->perm_int       += race_table[raceCh->race].int_plus;
  raceCh->perm_wis       += race_table[raceCh->race].wis_plus;
  raceCh->perm_dex       += race_table[raceCh->race].dex_plus;
  raceCh->perm_con       += race_table[raceCh->race].con_plus;
  raceCh->perm_cha       += race_table[raceCh->race].cha_plus;

  if( chk_race )
    {
      sprintf( buf, "&R%s Statistics\r\n", race_table[race].race_name );
      send_to_pager( buf, ch );
      sprintf( buf, "&cStr: &C%d  &cWis: &C%d  &cInt: &C%d  &cDex: &C%d  &cCon: &C%d  &cCha: &C%d\r\n",
               raceCh->perm_str, raceCh->perm_wis, raceCh->perm_int,
               raceCh->perm_dex, raceCh->perm_con, raceCh->perm_cha );
      send_to_pager( buf, ch );

      for( iC = 0; iC < MAX_ABILITY; iC++ )
        {
          if( iC == FORCE_ABILITY )
            continue;
          raceCh->main_ability = iC;
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
          raceCh->perm_str = 20 + race_table[raceCh->race].str_plus;
          raceCh->perm_int = 20 + race_table[raceCh->race].int_plus;
          raceCh->perm_wis = 20 + race_table[raceCh->race].wis_plus;
          raceCh->perm_dex = 20 + race_table[raceCh->race].dex_plus;
          raceCh->perm_con = 20 + race_table[raceCh->race].con_plus;
          raceCh->perm_cha = 20 + race_table[raceCh->race].cha_plus;
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