#include "character.h"
#include "mud.h"

typedef struct PoliceData
{
  Character *PoliceOfficer;
  bool FoundCriminal;
} PoliceData;

static bool IsVisiblePlayer( void *element, void *userData )
{
  const Character *victim = (Character*) element;
  const Character *cop = (Character*) userData;

  return !IsNpc( victim ) && can_see( cop, victim ) && number_bits( 1 ) == 0;
}

static void AttackCriminal( void *element, void *userData )
{
  Character *criminal = (Character*) element;
  PoliceData *data = (PoliceData*) userData;
  Character *cop = data->PoliceOfficer;
  int vip = 0;

  if( data->FoundCriminal )
    {
      return;
    }

  for ( vip = 0 ; vip < 32 ; vip++ )
    {
      if ( IS_SET( cop->vip_flags, 1 << vip )
	   && IS_SET( criminal->pcdata->wanted_flags, 1 << vip) )
	{
	  do_say( cop , "Got you!" );
	  REMOVE_BIT( criminal->pcdata->wanted_flags, 1 << vip );
	  multi_hit( cop, criminal, TYPE_UNDEFINED );
	  data->FoundCriminal = TRUE;
	  return;
	}
    }
}

bool spec_police_undercover( Character *cop )
{
  CerisList *playersInRoom = NULL;
  PoliceData data;

  if ( !is_awake(cop) || cop->fighting )
    {
      return FALSE;
    }

  data.PoliceOfficer = cop;
  data.FoundCriminal = FALSE;
  playersInRoom = List_CopyIf( cop->in_room->People, IsVisiblePlayer, cop );

  List_ForEach( playersInRoom, AttackCriminal, &data );

  DestroyList( playersInRoom );
  return data.FoundCriminal;
}
