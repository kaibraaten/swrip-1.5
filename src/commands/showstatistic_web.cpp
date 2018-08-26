#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "descriptor.hpp"

void do_showstatistic_web( Character *ch, char *argument )
{
  int race = 0, pclass = 0, iR = 0, iC = 0, iC2 = 0;
  bool chk_race = false;
  FILE *whoout = fopen( WEBWHO_FILE, "w" );

  if( !whoout )
    {
      Log->Bug( "fopen: WEBWHO won't open" );
      return;
    }

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

  Descriptor *desc = new NullDescriptor();
  Character *raceCh = new Character(new PCData(), desc);
  raceCh->TopLevel = 1;
  raceCh->InRoom = GetRoom( ROOM_VNUM_LIMBO );
  raceCh->Stats.PermStr = 20;
  raceCh->Stats.PermInt = 20;
  raceCh->Stats.PermWis = 20;
  raceCh->Stats.PermDex = 20;
  raceCh->Stats.PermCon = 20;
  raceCh->Stats.PermCha = 20;
  raceCh->Stats.PermLck = 3;

  if( chk_race )
    raceCh->Race = race;
  else
    {
      raceCh->Ability.Main = pclass;
      raceCh->Race = 0;
    }

  raceCh->Stats.PermStr       += RaceTable[raceCh->Race].Stats.ModStr;
  raceCh->Stats.PermInt       += RaceTable[raceCh->Race].Stats.ModInt;
  raceCh->Stats.PermWis       += RaceTable[raceCh->Race].Stats.ModWis;
  raceCh->Stats.PermDex       += RaceTable[raceCh->Race].Stats.ModDex;
  raceCh->Stats.PermCon       += RaceTable[raceCh->Race].Stats.ModCon;
  raceCh->Stats.PermCha       += RaceTable[raceCh->Race].Stats.ModCha;

  if( chk_race )
    {
      fprintf( whoout, "&R%s Statistics\r\n", RaceTable[race].Name );
      fprintf( whoout, "&cStr: &C%d  &cWis: &C%d  &cInt: &C%d  &cDex: &C%d  &cCon: &C%d  &cCha: &C%d\r\n",
               raceCh->Stats.PermStr, raceCh->Stats.PermWis, raceCh->Stats.PermInt,
               raceCh->Stats.PermDex, raceCh->Stats.PermCon, raceCh->Stats.PermCha );

      for( iC = 0; iC < MAX_ABILITY; iC++ )
        {
          if( iC == FORCE_ABILITY )
            continue;
          raceCh->Ability.Main = iC;
          fprintf( whoout, "\r\n&c%-20s &B| &C", AbilityName[iC] );
          for( iC2 = 0; iC2 < MAX_ABILITY; iC2++ )
            {
	      if( iC2 == FORCE_ABILITY )
                continue;
              if( iC2 == COMMANDO_ABILITY )
                continue;

              if( iC2 == SMUGGLING_ABILITY )
                fprintf( whoout, "%-3d+ &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );
              else
                fprintf( whoout, "%-3d &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );
            }
        }
    }
  else
    {
      fprintf( whoout, "&R%s Statistics\r\n", AbilityName[pclass]);

      for( iR = 0; iR < MAX_RACE; iR++ )
        {
          raceCh->Race = iR;
          raceCh->Stats.PermStr = 20 + RaceTable[raceCh->Race].Stats.ModStr;
          raceCh->Stats.PermInt = 20 + RaceTable[raceCh->Race].Stats.ModInt;
          raceCh->Stats.PermWis = 20 + RaceTable[raceCh->Race].Stats.ModWis;
          raceCh->Stats.PermDex = 20 + RaceTable[raceCh->Race].Stats.ModDex;
          raceCh->Stats.PermCon = 20 + RaceTable[raceCh->Race].Stats.ModCon;
          raceCh->Stats.PermCha = 20 + RaceTable[raceCh->Race].Stats.ModCha;
          fprintf( whoout, "\r\n&c%-20s &B| &C", RaceTable[iR].Name );

          for( iC2 = 0; iC2 < FORCE_ABILITY; iC2++ )
            {
              if( iC2 == SMUGGLING_ABILITY )
                fprintf( whoout, "%-3d+ &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );
              else
                fprintf( whoout, "%-3d &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );
            }
        }
    }
  
  delete raceCh;
  delete desc;
}
