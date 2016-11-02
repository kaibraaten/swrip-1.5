#include "character.h"
#include "mud.h"
#include "area.h"

void do_mcreate( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ProtoMobile *pMobIndex = NULL;
  Character *mob = NULL;
  int vnum = 0, cvnum = 0;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "Mobiles cannot create.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  vnum = IsNumber( arg ) ? atoi( arg ) : -1;

  if ( vnum == -1 || IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: mcreate <vnum> [cvnum] <mobile name>\r\n", ch );
      return;
    }

  if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
    {
      SendToCharacter( "Bad number.\r\n", ch );
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
      SendToCharacter( "A mobile with that number already exists.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    return;

  if ( GetTrustLevel( ch ) <= LEVEL_IMMORTAL )
    {
      Area *pArea;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "You must have an assigned area to create mobiles.\r\n", ch );
          return;
        }
      if ( vnum < pArea->VnumRanges.Mob.First
           ||   vnum > pArea->VnumRanges.Mob.Last )
        {
          SendToCharacter( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  pMobIndex = MakeMobile( vnum, cvnum, argument );

  if ( !pMobIndex )
    {
      SendToCharacter( "Error.\r\n", ch );
      LogPrintf( "do_mcreate: MakeMobile failed." );
      return;
    }

  mob = CreateMobile( pMobIndex );
  CharacterToRoom( mob, ch->InRoom );
  Act( AT_IMMORT, "$n waves $s arms about, and $N appears at $s command!",
       ch, NULL, mob, TO_ROOM );
  Act( AT_IMMORT, "You wave your arms about, and $N appears at your command!",
       ch, NULL, mob, TO_CHAR );
}
