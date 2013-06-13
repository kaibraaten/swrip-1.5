#include "character.h"
#include "mud.h"

typedef struct ArrestData
{
  Character *PoliceOfficer;
  bool MadeArrest;
} ArrestData;

static bool IsVisiblePlayer( void *element, void *userData );
static void AttemptArrest( void *element, void *userData );

bool spec_police_jail( Character *cop )
{
  CerisList *playersInRoom = NULL;
  ArrestData data;

  if ( !is_awake(cop) || cop->fighting )
    return FALSE;

  data.PoliceOfficer = cop;
  data.MadeArrest = FALSE;
  playersInRoom = List_CopyIf( cop->in_room->People, IsVisiblePlayer, cop );

  List_ForEach( playersInRoom, AttemptArrest, &data );

  DestroyList( playersInRoom );
  return data.MadeArrest;
}

static bool IsVisiblePlayer( void *element, void *userData )
{
  const Character *victim = (Character*) element;
  const Character *cop = (Character*) userData;

  return !IsNpc( victim ) && can_see( cop, victim ) && number_bits( 1 ) == 0;
}

static void AttemptArrest( void *element, void *userData )
{
  Character *criminal = (Character*) element;
  ArrestData *data = (ArrestData*) userData;
  Character *cop = data->PoliceOfficer;
  int vip = 0;

  if( data->MadeArrest )
    {
      return;
    }

  for ( vip = 0 ; vip <= 31 ; vip++ )
    {
      if ( IS_SET( cop->vip_flags , 1 << vip )
	   && IS_SET( criminal->pcdata->wanted_flags , 1 << vip) )
	{
	  char buf[MAX_STRING_LENGTH];
	  ROOM_INDEX_DATA *jail = NULL;

	  sprintf( buf, "Hey you're wanted on %s!", planet_flags[vip] );
	  do_say( cop , buf );

	  if( 1 << vip == VIP_ADARI )
	    {
	      jail = get_room_index( ROOM_JAIL_ADARI );
	    }
	  else if( 1 << vip == VIP_MON_CALAMARI )
	    {
	      switch ( number_range(1,4) )
		{
		case 1:
		  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_1 );
		  break;

		case 2:
		  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_2 );
		  break;

		case 3:
		  jail = get_room_index( ROOM_JAIL_QUARREN_1 );
		  break;

		case 4:
		  jail = get_room_index( ROOM_JAIL_QUARREN_2 );
		  break;
		}
	    }

	  if ( jail )
	    {
	      REMOVE_BIT( criminal->pcdata->wanted_flags , 1 << vip );
	      act( AT_ACTION, "$n ushers $N off to jail.", cop, NULL, criminal, TO_NOTVICT );
	      act( AT_ACTION, "$n escorts you to jail.",   cop, NULL, criminal, TO_VICT    );
	      char_from_room( criminal );
	      char_to_room( criminal , jail );
	    }

	  data->MadeArrest = TRUE;
	  return;
	}
    }
}
