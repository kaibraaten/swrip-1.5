#include <string.h>
#include "mud.h"
#include "character.h"

static void OnStart( Character *ch, char *argument );
static void OnFinished( Character *ch );
static void OnAbort( Character *ch );

void do_makegrenade( Character *ch, char *argument )
{
  switch( ch->substate )
    {
    default:
      OnStart( ch, argument );
      break;

    case SUB_PAUSE:
      ch->substate = SUB_NONE;
      OnFinished( ch );
      break;

    case SUB_TIMER_DO_ABORT:
      ch->substate = SUB_NONE;
      OnAbort( ch );
      break;
    }
}

static void OnStart( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0;
  bool checktool = false;
  bool checkdrink = false;
  bool checkbatt = false;
  bool checkchem = false;
  bool checkcirc = false;
  Object *obj = NULL;

  strcpy( arg , argument );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "&RUsage: Makegrenade <name>\r\n&w", ch);
      return;
    }

  if ( !IsBitSet( ch->in_room->room_flags, ROOM_FACTORY ) )
    {
      SendToCharacter( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
      return;
    }

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
	checktool = true;
      if (obj->item_type == ITEM_DRINK_CON
	  && obj->value[OVAL_DRINK_CON_CURRENT_AMOUNT] == 0 )
	checkdrink = true;
      if (obj->item_type == ITEM_BATTERY)
	checkbatt = true;
      if (obj->item_type == ITEM_CIRCUIT)
	checkcirc = true;
      if (obj->item_type == ITEM_CHEMICAL)
	checkchem = true;
    }

  if ( !checktool )
    {
      SendToCharacter( "&RYou need toolkit to make a grenade.\r\n", ch);
      return;
    }

  if ( !checkdrink )
    {
      SendToCharacter( "&RYou will need an empty drink container to mix and hold the chemicals.\r\n", ch);
      return;
    }

  if ( !checkbatt )
    {
      SendToCharacter( "&RYou need a small battery for the timer.\r\n", ch);
      return;
    }

  if ( !checkcirc )
    {
      SendToCharacter( "&RYou need a small circuit for the timer.\r\n", ch);
      return;
    }

  if ( !checkchem )
    {
      SendToCharacter( "&RSome explosive chemicals would come in handy!\r\n", ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makegrenade]);

  if ( GetRandomPercent() < the_chance )
    {
      SendToCharacter( "&GYou begin the long process of making a grenade.\r\n", ch);
      Act( AT_PLAIN, "$n takes $s tools and a drink container and begins to work on something.", ch,
	   NULL, NULL , TO_ROOM );
      AddTimerToCharacter( ch , TIMER_DO_FUN , 25 , do_makegrenade , SUB_PAUSE );
      ch->dest_buf   = CopyString(arg);
      return;
    }
  else
    {
      SendToCharacter("&RYou can't figure out how to fit the parts together.\r\n",ch);
      LearnFromFailure( ch, gsn_makegrenade );
    }
}

static void OnFinished( Character *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level = 0;
  int the_chance = 0;
  int weight = 0;
  int strength = 0;
  bool checktool = false;
  bool checkdrink = false;
  bool checkbatt = false;
  bool checkchem = false;
  bool checkcirc = false;
  Object *obj = NULL;
  ProtoObject *pObjIndex = NULL;
  vnum_t vnum = INVALID_VNUM;
  long xpgain = 0;

  if ( !ch->dest_buf )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  FreeMemory( ch->dest_buf);

  level = IsNpc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makegrenade]);
  vnum = OBJ_VNUM_CRAFTING_GRENADE;

  if ( ( pObjIndex = GetProtoObject( vnum ) ) == NULL )
    {
      SendToCharacter( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = true;
      if (obj->item_type == ITEM_DRINK_CON && checkdrink == false
	  && obj->value[OVAL_DRINK_CON_CURRENT_AMOUNT] == 0 )
        {
          checkdrink = true;
          SeparateOneObjectFromGroup( obj );
          ObjectFromCharacter( obj );
          ExtractObject( obj );
        }
      if (obj->item_type == ITEM_BATTERY && checkbatt == false)
        {
          SeparateOneObjectFromGroup( obj );
          ObjectFromCharacter( obj );
          ExtractObject( obj );
          checkbatt = true;
        }
      if (obj->item_type == ITEM_CHEMICAL)
        {
          strength = urange( 10, obj->value[OVAL_CHEMICAL_STRENGTH], level * 5 );
          weight = obj->weight;
          SeparateOneObjectFromGroup( obj );
          ObjectFromCharacter( obj );
          ExtractObject( obj );
          checkchem = true;
        }
      if (obj->item_type == ITEM_CIRCUIT && checkcirc == false)
        {
          SeparateOneObjectFromGroup( obj );
          ObjectFromCharacter( obj );
          ExtractObject( obj );
          checkcirc = true;
        }
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makegrenade]) ;

  if ( GetRandomPercent() > the_chance*2  || ( !checktool ) || ( !checkdrink ) || ( !checkbatt ) || ( !checkchem ) || ( !checkcirc) )
    {
      SendToCharacter( "&RJust as you are about to finish your work,\r\nyour newly created grenade explodes in your hands...doh!\r\n", ch);
      LearnFromFailure( ch, gsn_makegrenade );
      return;
    }

  obj = CreateObject( pObjIndex, level );

  obj->item_type = ITEM_GRENADE;
  SetBit( obj->wear_flags, ITEM_HOLD );
  SetBit( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  obj->weight = weight;
  FreeMemory( obj->name );
  strcpy( buf , arg );
  strcat( buf , " grenade");
  obj->name = CopyString( buf );
  strcpy( buf, arg );
  FreeMemory( obj->short_descr );
  obj->short_descr = CopyString( buf );
  FreeMemory( obj->description );
  strcat( buf, " was carelessly misplaced here." );
  obj->description = CopyString( buf );
  obj->value[OVAL_EXPLOSIVE_MIN_DMG] = strength/2;
  obj->value[OVAL_EXPLOSIVE_MAX_DMG] = strength;
  obj->cost = obj->value[OVAL_EXPLOSIVE_MAX_DMG]*5;

  obj = ObjectToCharacter( obj, ch );

  SendToCharacter( "&GYou finish your work and hold up your newly created grenade.&w\r\n", ch);
  Act( AT_PLAIN, "$n finishes making $s new grenade.", ch,
       NULL, NULL , TO_ROOM );

  xpgain = umin( obj->cost*50 ,( GetRequiredXpForLevel(GetAbilityLevel( ch, ENGINEERING_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, ENGINEERING_ABILITY ) ) ) );
  GainXP(ch, ENGINEERING_ABILITY, xpgain );
  Echo( ch , "You gain %d engineering experience.", xpgain );

  LearnFromSuccess( ch, gsn_makegrenade );
}

static void OnAbort( Character *ch )
{
  FreeMemory( ch->dest_buf );
  SendToCharacter("&RYou are interupted and fail to finish your work.\r\n", ch);
}
