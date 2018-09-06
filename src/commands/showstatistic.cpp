#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"

void do_showstatistic( Character *ch, std::string argument )
{
  int pclass = -1, iR = 0, iC = 0, iC2 = 0;
  const Race *race = NULL;
  bool chk_race = false;
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];
  int raceIndex = GetRaceFromName( argument );

  if ( raceIndex < 0 )
    {
      pclass = GetClassFromName( argument );
    }
  else
    {
      chk_race = true;
      race = &RaceTable[raceIndex];
      
      if( !RaceIsAvailableToPlayers( race ) )
	{
	  race = NULL;
	}
    }

  if( !race && pclass < 0 )
    {
      ch->Echo("No such race or class.\r\n");
      return;
    }

  if ( raceIndex == RACE_GOD )
    {
      ch->Echo("Gods are indefeasible...\r\n");
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
    {
      raceCh->Race = raceIndex;
      raceCh->Stats.PermStr       += race->Stats.ModStr;
      raceCh->Stats.PermInt       += race->Stats.ModInt;
      raceCh->Stats.PermWis       += race->Stats.ModWis;
      raceCh->Stats.PermDex       += race->Stats.ModDex;
      raceCh->Stats.PermCon       += race->Stats.ModCon;
      raceCh->Stats.PermCha       += race->Stats.ModCha;
    }
  else
    {
      raceCh->Ability.Main = pclass;
      raceCh->Race = 0;
    }

  if( chk_race )
    {
      ch->Echo("&R%s Statistics\r\n", race->Name );
      ch->Echo("&cStr: &C%d  &cWis: &C%d  &cInt: &C%d  &cDex: &C%d  &cCon: &C%d  &cCha: &C%d\r\n",
               raceCh->Stats.PermStr, raceCh->Stats.PermWis, raceCh->Stats.PermInt,
               raceCh->Stats.PermDex, raceCh->Stats.PermCon, raceCh->Stats.PermCha );
      ch->Echo("                     &B| &CCMB &B| &CPIL &B| &CENG &B| &CBH  &B| &CSMUG &B| &CDIP &B| &CLEA &B|" );

      for( iC = 0; iC < MAX_ABILITY; iC++ )
        {
          if( iC == FORCE_ABILITY && !SysData.CanChooseJedi )
	    {
	      continue;
	    }

          raceCh->Ability.Main = iC;
	  sprintf( buf, "\r\n&c%-20s &B| &C", Capitalize( AbilityName[iC] ).c_str() );

          for( iC2 = 0; iC2 < MAX_ABILITY; iC2++ )
            {
              if( iC2 == FORCE_ABILITY )
                continue;

              if( iC2 == COMMANDO_ABILITY )
                continue;

              if( iC2 == SMUGGLING_ABILITY )
                sprintf( buf2, "%-3d+ &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );
              else
                sprintf( buf2, "%-3d &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );

              strcat( buf, buf2 );
            }

          ch->Echo(buf);
        }
    }
  else
    {
      sprintf( buf, "&R%s Statistics\r\n", Capitalize(AbilityName[pclass]).c_str());
      ch->Echo(buf);

      ch->Echo("                     &B| &CCMB &B| &CPIL &B| &CENG &B| &CBH  &B| &CSMUG &B| &CDIP &B| &CLEA &B|" );

      for( iR = 0; iR < MAX_RACE; iR++ )
        {
          if(!RaceIsAvailableToPlayers(&RaceTable[iR]))
            {
              continue;
            }
          
          raceCh->Race = iR;
          raceCh->Stats.PermStr = 20 + RaceTable[raceCh->Race].Stats.ModStr;
          raceCh->Stats.PermInt = 20 + RaceTable[raceCh->Race].Stats.ModInt;
          raceCh->Stats.PermWis = 20 + RaceTable[raceCh->Race].Stats.ModWis;
          raceCh->Stats.PermDex = 20 + RaceTable[raceCh->Race].Stats.ModDex;
          raceCh->Stats.PermCon = 20 + RaceTable[raceCh->Race].Stats.ModCon;
          raceCh->Stats.PermCha = 20 + RaceTable[raceCh->Race].Stats.ModCha;
          sprintf( buf, "\r\n&c%-20s &B| &C", RaceTable[iR].Name );

          for( iC2 = 0; iC2 < FORCE_ABILITY; iC2++ )
            {
              if( iC2 == SMUGGLING_ABILITY )
                sprintf( buf2, "%-3d+ &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );
              else
                sprintf( buf2, "%-3d &B| &C", GetMaxAbilityLevel( raceCh, iC2 ) );

              strcat( buf, buf2 );
            }

          ch->Echo(buf);
        }
    }

  delete raceCh;
  delete desc;
}
