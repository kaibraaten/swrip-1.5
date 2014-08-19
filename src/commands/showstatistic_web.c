#include <string.h>
#include "mud.h"
#include "character.h"

void do_showstatistic_web( Character *ch, char *argument )
{
  PCData *pcdata;
  Character *raceCh;
  int race, pclass, iR, iC, iC2;
  bool chk_race = false;
  FILE *whoout;

  whoout = fopen( WEBWHO_FILE, "w" );

  if( !whoout )
    Bug( "fopen: WEBWHO won't open" );

  race = GetRaceFromName( argument );
  if ( race < 0 )
    pclass = GetClassFromName( argument );
  else
    chk_race = true;

  if( race < 0 && pclass < 0 )
    {
      fprintf( whoout, "No such race or class\r\n" );
      return;
    }

  if ( race == RACE_GOD )
    {
      fprintf( whoout, "Gods are indefeasible\r\n" );
      return;
    }

  AllocateMemory( raceCh, Character, 1 );
  raceCh->top_level = 1;
  raceCh->trust = 0;
  AllocateMemory( pcdata, PCData, 1 );
  raceCh->pcdata = pcdata;
  raceCh->in_room = GetRoom( ROOM_VNUM_LIMBO );
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

  raceCh->stats.perm_str       += RaceTable[raceCh->race].stats.mod_str;
  raceCh->stats.perm_int       += RaceTable[raceCh->race].stats.mod_int;
  raceCh->stats.perm_wis       += RaceTable[raceCh->race].stats.mod_wis;
  raceCh->stats.perm_dex       += RaceTable[raceCh->race].stats.mod_dex;
  raceCh->stats.perm_con       += RaceTable[raceCh->race].stats.mod_con;
  raceCh->stats.perm_cha       += RaceTable[raceCh->race].stats.mod_cha;

  if( chk_race )
    {
      fprintf( whoout, "&R%s Statistics\r\n", RaceTable[race].race_name );
      fprintf( whoout, "&cStr: &C%d  &cWis: &C%d  &cInt: &C%d  &cDex: &C%d  &cCon: &C%d  &cCha: &C%d\r\n",
               raceCh->stats.perm_str, raceCh->stats.perm_wis, raceCh->stats.perm_int,
               raceCh->stats.perm_dex, raceCh->stats.perm_con, raceCh->stats.perm_cha );

      for( iC = 0; iC < MAX_ABILITY; iC++ )
        {
          if( iC == FORCE_ABILITY )
            continue;
          raceCh->ability.main = iC;
          fprintf( whoout, "\r\n&c%-20s &B| &C", ability_name[iC] );
          for( iC2 = 0; iC2 < MAX_ABILITY; iC2++ )
            {
	      if( iC2 == FORCE_ABILITY )
                continue;
              if( iC2 == COMMANDO_ABILITY )
                continue;

              if( iC2 == SMUGGLING_ABILITY )
                fprintf( whoout, "%-3d+ &B| &C", max_level( raceCh, iC2 ) );
              else
                fprintf( whoout, "%-3d &B| &C", max_level( raceCh, iC2 ) );
            }
        }
    }
  else
    {
      fprintf( whoout, "&R%s Statistics\r\n", ability_name[pclass]);

      for( iR = 0; iR < MAX_RACE; iR++ )
        {
          raceCh->race = iR;
          raceCh->stats.perm_str = 20 + RaceTable[raceCh->race].stats.mod_str;
          raceCh->stats.perm_int = 20 + RaceTable[raceCh->race].stats.mod_int;
          raceCh->stats.perm_wis = 20 + RaceTable[raceCh->race].stats.mod_wis;
          raceCh->stats.perm_dex = 20 + RaceTable[raceCh->race].stats.mod_dex;
          raceCh->stats.perm_con = 20 + RaceTable[raceCh->race].stats.mod_con;
          raceCh->stats.perm_cha = 20 + RaceTable[raceCh->race].stats.mod_cha;
          fprintf( whoout, "\r\n&c%-20s &B| &C", RaceTable[iR].race_name );

          for( iC2 = 0; iC2 < FORCE_ABILITY; iC2++ )
            {
              if( iC2 == SMUGGLING_ABILITY )
                fprintf( whoout, "%-3d+ &B| &C", max_level( raceCh, iC2 ) );
              else
                fprintf( whoout, "%-3d &B| &C", max_level( raceCh, iC2 ) );
            }
        }
    }

  FreeMemory( raceCh->pcdata );
  FreeMemory( raceCh );
}
