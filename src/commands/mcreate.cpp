#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_mcreate( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex = NULL;
  Character *mob = NULL;
  int vnum = 0, cvnum = 0;

  if ( IsNpc(ch) )
    {
      ch->Echo("Mobiles cannot create.\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  vnum = IsNumber( arg ) ? atoi( arg ) : -1;

  if ( vnum == -1 || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: mcreate <vnum> [cvnum] <mobile name>\r\n");
      return;
    }

  if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
    {
      ch->Echo("Bad number.\r\n");
      return;
    }

  OneArgument( argument, arg2 );
  cvnum = atoi( arg2 );

  if ( cvnum != 0 )
    argument = OneArgument( argument, arg2 );

  if ( cvnum < 1 )
    cvnum = 0;

  if ( GetProtoMobile( vnum ) )
    {
      ch->Echo("A mobile with that number already exists.\r\n");
      return;
    }

  if ( IsNpc( ch ) )
    return;

  if ( GetTrustLevel( ch ) <= LEVEL_IMMORTAL )
    {
      Area *pArea;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          ch->Echo("You must have an assigned area to create mobiles.\r\n");
          return;
        }
      if ( vnum < pArea->VnumRanges.Mob.First
           ||   vnum > pArea->VnumRanges.Mob.Last )
        {
          ch->Echo("That number is not in your allocated range.\r\n");
          return;
        }
    }

  pMobIndex = MakeMobile( vnum, cvnum, argument );

  if ( !pMobIndex )
    {
      ch->Echo("Error.\r\n");
      Log->Bug( "do_mcreate: MakeMobile failed." );
      return;
    }

  mob = CreateMobile( pMobIndex );
  CharacterToRoom( mob, ch->InRoom );
  Act( AT_IMMORT, "$n waves $s arms about, and $N appears at $s command!",
       ch, NULL, mob, TO_ROOM );
  Act( AT_IMMORT, "You wave your arms about, and $N appears at your command!",
       ch, NULL, mob, TO_CHAR );
}

