/***************************************************************************
*                   Star Wars: Rise in Power MUD Codebase                  *
*--------------------------------------------------------------------------*
* SWRiP Code Additions and changes from the SWReality and Smaug Code       *
* copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
*--------------------------------------------------------------------------*
* Star Wars Reality Code Additions and changes from the Smaug Code         *
* copyright (c) 1997 by Sean Cooper                                        *
* -------------------------------------------------------------------------*
* Starwars and Starwars Names copyright(c) Lucasfilm Ltd.                  *
*--------------------------------------------------------------------------*
* SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
* SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
* Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
* ------------------------------------------------------------------------ *
* Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
* Chastain, Michael Quan, and Mitchell Tse.                                *
* Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
* Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
* ------------------------------------------------------------------------ *
*		   New Star Wars Skills Unit    			   *   
****************************************************************************/

#include <math.h> 
#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"

void    add_reinforcements  args( ( CHAR_DATA *ch ) );
ch_ret  one_hit             args( ( CHAR_DATA *ch, CHAR_DATA *victim, int dt ) );
int     xp_compute                ( CHAR_DATA *ch , CHAR_DATA *victim );
ROOM_INDEX_DATA *generate_exit( ROOM_INDEX_DATA *in_room, EXIT_DATA **pexit );
int ris_save( CHAR_DATA *ch, int chance, int ris );
CHAR_DATA *get_char_room_mp( CHAR_DATA *ch, char *argument );
bool    autofly(SHIP_DATA *ship);
bool    aff_paralysis( CHAR_DATA *ch, CHAR_DATA *victim );

extern int      top_affect;

   

void do_makeblade( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    int charge = 0;
    bool checktool, checkdura, checkbatt, checkoven, checkstaff; 
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum;
    AFFECT_DATA *paf;
    AFFECT_DATA *paf2;
            
    strcpy( arg , argument );
    
    switch( ch->substate )
    { 
    	default:
    	        
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makeblade <name>\n\r&w", ch);
                  return;   
                }
 
    	        checktool = FALSE;
                checkdura = FALSE;
                checkbatt = FALSE;
                checkoven = FALSE;
        
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_DURASTEEL )
          	    checkdura = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                  checkbatt = TRUE;

                  if (obj->item_type == ITEM_OVEN)
                  checkoven = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a vibro-blade.\n\r", ch);
                   return;
                }
 
                if ( !checkdura )
                {
                   send_to_char( "&RYou need something to make it out of.\n\r", ch);
                   return;
                }

                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a power source for your blade.\n\r", ch);
                   return;
                }
                
                if ( !checkoven )
                {
                   send_to_char( "&RYou need a small furnace to heat the metal.\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makeblade]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of crafting a vibroblade.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makeblade , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makeblade );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;

    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeblade]);
    vnum = 10422;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checktool = FALSE;
    checkdura = FALSE;
    checkbatt = FALSE;
    checkoven = FALSE;
    checkstaff = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_OVEN)
          checkoven = TRUE;
       if (obj->item_type == ITEM_DURASTEEL  && checkdura == FALSE)
       {
          checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_STAFF && checkstaff == FALSE)
       {
          checkstaff = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE )
       {
          charge = UMAX( 5, obj->value[0] ); 
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makeblade]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkbatt ) || ( !checkoven ) )
    {
       send_to_char( "&RYou activate your newly created vibroblade.\n\r", ch);
       send_to_char( "&RIt hums softly for a few seconds then begins to shake violently.\n\r", ch);
       send_to_char( "&RIt finally shatters breaking apart into a dozen pieces.\n\r", ch);
       learn_from_failure( ch, gsn_makeblade );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_WEAPON;
    SET_BIT( obj->wear_flags, ITEM_WIELD );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    obj->weight = 3;
    STRFREE( obj->name );
    strcpy( buf, arg );
   if (!checkstaff)
    strcat( buf, " vibro-blade blade" );
   else
    strcat( buf, " force pike" );
   
    obj->name = STRALLOC( buf );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was left here." );
    obj->description = STRALLOC( buf );
    CREATE( paf, AFFECT_DATA, 1 );
    paf->type               = -1;
    paf->duration           = -1;
    paf->location           = get_atype( "backstab" );
    paf->modifier           = level/3;
    paf->bitvector          = 0;
    paf->next               = NULL;
    LINK( paf, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
   if ( !checkstaff )
   {
    CREATE( paf2, AFFECT_DATA, 1 );
    paf2->type               = -1;
    paf2->duration           = -1;
    paf2->location           = get_atype( "hitroll" );
    paf2->modifier           = -2;
    paf2->bitvector          = 0;
    paf2->next               = NULL;
    LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
   }
    obj->value[0] = INIT_WEAPON_CONDITION;      
   if( !checkstaff )
    obj->value[3] = WEAPON_VIBRO_BLADE;
   else
    obj->value[3] = WEAPON_FORCE_PIKE;

    obj->value[1] = (int) (level/20+8+obj->value[3]);      /* min dmg  */
    obj->value[2] = (int) (level/10+18+obj->value[3]);      /* max dmg */

    obj->value[4] = charge;
    obj->value[5] = charge;
    obj->cost = obj->value[2]*10;
                                                                    
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created blade.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes crafting a blade.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*200 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        
    learn_from_success( ch, gsn_makeblade );
}

void do_makeblaster( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    bool checktool, checkdura, checkbatt, checkoven, checkcond, checkcirc, checkammo, checkscope;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum, power, scope, ammo, counts, countp;
    AFFECT_DATA *paf;
    AFFECT_DATA *paf2;
    
    strcpy( arg , argument );
    
    switch( ch->substate )
    { 
    	default:
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makeblaster <name>\n\r&w", ch);
                  return;   
                }

    	        checktool = FALSE;
                checkdura = FALSE;
                checkbatt = FALSE;
                checkoven = FALSE;
                checkcond = FALSE;
                checkcirc = FALSE;
		checkscope = FALSE;
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_DURAPLAST)
          	    checkdura = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                    checkbatt = TRUE;
                  if (obj->item_type == ITEM_OVEN)
                    checkoven = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                    checkcirc = TRUE;
                  if (obj->item_type == ITEM_SUPERCONDUCTOR)
                    checkcond = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a blaster.\n\r", ch);
                   return;
                }
 
                if ( !checkdura )
                {
                   send_to_char( "&RYou need something to make it out of.\n\r", ch);
                   return;
                }

                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a power source for your blaster.\n\r", ch);
                   return;
                }
                
                if ( !checkoven )
                {
                   send_to_char( "&RYou need a small furnace to heat the plastics.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit board to control the firing mechanism.\n\r", ch);
                   return;
                }
                
                if ( !checkcond )
                {
                   send_to_char( "&RYou still need a small superconductor.\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makeblaster]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a blaster.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makeblaster , 1 );
    		   ch->dest_buf   = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makeblaster );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeblaster]);
    vnum = 10420;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checkammo= FALSE;
    checktool = FALSE;
    checkdura = FALSE;
    checkbatt = FALSE;
    checkoven = FALSE;
    checkcond = FALSE;
    checkcirc = FALSE;
    checkscope = FALSE;
    power     = 0;
    scope     = 0;
    ammo = 0;
    countp = 0;
    counts = 0;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_OVEN)
          checkoven = TRUE;
       if (obj->item_type == ITEM_DURAPLAST && checkdura == FALSE)
       {
          checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_AMMO && checkammo == FALSE)
       {
          ammo = obj->value[0];
          checkammo = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
       if (obj->item_type == ITEM_LENS && scope == 0)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          scope++;
       }
       if (obj->item_type == ITEM_SUPERCONDUCTOR && power<2)
       {
          power++;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcond = TRUE;
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
       }
       if (obj->item_type == ITEM_SCOPE && checkscope == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkscope = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makeblaster]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkbatt ) || ( !checkoven )  || ( !checkcond ) || ( !checkcirc) )
    {
       send_to_char( "&RYou hold up your new blaster and aim at a leftover piece of plastic.\n\r", ch);
       send_to_char( "&RYou slowly squeeze the trigger hoping for the best...\n\r", ch);
       send_to_char( "&RYour blaster backfires destroying your weapon and burning your hand.\n\r", ch);
       learn_from_failure( ch, gsn_makeblaster );
       return;
    }

    if (checkscope)
     power = 0;

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_WEAPON;
    SET_BIT( obj->wear_flags, ITEM_WIELD );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    obj->weight = 2+level/10;
    STRFREE( obj->name );
    strcpy( buf , arg );
    strcat( buf , " blaster");
    obj->name = STRALLOC( buf );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carelessly misplaced here." );
    obj->description = STRALLOC( buf );
    CREATE( paf, AFFECT_DATA, 1 );
    paf->type               = -1;
    paf->duration           = -1;
    paf->location           = get_atype( "hitroll" );
    paf->modifier           = URANGE( 0, 1+scope, level/30 );
    paf->bitvector          = 0;
    paf->next               = NULL;
    LINK( paf, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
    CREATE( paf2, AFFECT_DATA, 1 );
    paf2->type               = -1;
    paf2->duration           = -1;
    paf2->location           = get_atype( "damroll" );
    paf2->modifier           = URANGE( 0, power, level/30);
    paf2->bitvector          = 0;
    paf2->next               = NULL;
    LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
   if ( checkscope == TRUE )
   {
    CREATE( paf2, AFFECT_DATA, 1 );
    paf2->type               = -1;
    paf2->duration           = -1;
    paf2->location           = get_atype( "snipe" );
    paf2->modifier           = URANGE( 0, 30 , level/3);
    paf2->bitvector          = 0;
    paf2->next               = NULL;
    LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
   }
    ++top_affect;
    obj->value[0] = INIT_WEAPON_CONDITION;       /* condition  */
    obj->value[1] = (int) (level/10+15);      /* min dmg  */
    obj->value[2] = (int) (level/5+25);      /* max dmg  */
    obj->value[3] = WEAPON_BLASTER;
    obj->value[4] = ammo;
    obj->value[5] = 2000;
    obj->cost = obj->value[2]*50;
                                                                   
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created blaster.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new blaster.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
    learn_from_success( ch, gsn_makeblaster );
}

void do_makelightsaber( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int chance;
    bool checktool, checkdura, checkbatt, 
         checkoven, checkcond, checkcirc, checklens, checkgems, checkmirr;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum, level, gems, charge, gemtype;
    AFFECT_DATA *paf;
    AFFECT_DATA *paf2;
    
    strcpy( arg, argument );    
    
    switch( ch->substate )
    { 
    	default:
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makelightsaber <name>\n\r&w", ch);
                  return;   
                }

    	        checktool = FALSE;
                checkdura = FALSE;
                checkbatt = FALSE;
                checkoven = FALSE;
                checkcond = FALSE;
                checkcirc = FALSE;
                checklens = FALSE;
                checkgems = FALSE;
                checkmirr = FALSE;

                if ( !IS_SET( ch->in_room->room_flags, ROOM_SAFE ) || !IS_SET( ch->in_room->room_flags, ROOM_SILENCE ))
                {
                   send_to_char( "&RYou need to be in a quiet peaceful place to craft a lightsaber.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_LENS)
                    checklens = TRUE;
                  if (obj->item_type == ITEM_CRYSTAL)
                    checkgems = TRUE;                    
                  if (obj->item_type == ITEM_MIRROR)
                    checkmirr = TRUE;
                  if (obj->item_type == ITEM_DURAPLAST || obj->item_type == ITEM_DURASTEEL )
          	    checkdura = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                    checkbatt = TRUE;
                  if (obj->item_type == ITEM_OVEN)
                    checkoven = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                    checkcirc = TRUE;
                  if (obj->item_type == ITEM_SUPERCONDUCTOR)
                    checkcond = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a lightsaber.\n\r", ch);
                   return;
                }
 
                if ( !checkdura )
                {
                   send_to_char( "&RYou need something to make it out of.\n\r", ch);
                   return;
                }

                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a power source for your lightsaber.\n\r", ch);
                   return;
                }
                
                if ( !checkoven )
                {
                   send_to_char( "&RYou need a small furnace to heat and shape the components.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit board.\n\r", ch);
                   return;
                }
                
                if ( !checkcond )
                {
                   send_to_char( "&RYou still need a small superconductor for your lightsaber.\n\r", ch);
                   return;
                }
                
                if ( !checklens )
                {
                   send_to_char( "&RYou still need a lens to focus the beam.\n\r", ch);
                   return;
                }
                
                if ( !checkgems )
                {
                   send_to_char( "&RLightsabers require 1 to 3 gems to work properly.\n\r", ch);
                   return;
                }
                
                if ( !checkmirr )
                {
                   send_to_char( "&RYou need a high intesity reflective cup to create a lightsaber.\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_lightsaber_crafting]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of crafting a lightsaber.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makelightsaber , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_lightsaber_crafting );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_lightsaber_crafting]);
    vnum = 10421;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checktool = FALSE;
    checkdura = FALSE;
    checkbatt = FALSE;
    checkoven = FALSE;
    checkcond = FALSE;
    checkcirc = FALSE;
    checklens = FALSE;
    checkgems = FALSE;
    checkmirr = FALSE;
    gems = 0;
    charge = 0;
    gemtype =0;

    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_OVEN)
          checkoven = TRUE;
       if ( (obj->item_type == ITEM_DURAPLAST || obj->item_type == ITEM_DURASTEEL) && checkdura == FALSE)
       {
          checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_DURASTEEL && checkdura == FALSE)
       {
          checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
       {
          charge = UMIN(obj->value[1], 10);
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
       if (obj->item_type == ITEM_SUPERCONDUCTOR && checkcond == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcond = TRUE;
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
       }
       if (obj->item_type == ITEM_LENS && checklens == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checklens = TRUE;
       }
       if (obj->item_type == ITEM_MIRROR && checkmirr == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkmirr = TRUE;
       }
       if (obj->item_type == ITEM_CRYSTAL && gems < 3)
       {
          gems++;
          if ( gemtype < obj->value[0] )
             gemtype = obj->value[0];
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkgems = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_lightsaber_crafting]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkbatt ) || ( !checkoven ) 
                                       || ( !checkmirr ) || ( !checklens ) || ( !checkgems ) || ( !checkcond ) || ( !checkcirc) )
    
    {
       send_to_char( "&RYou hold up your new lightsaber and press the switch hoping for the best.\n\r", ch);
       send_to_char( "&RInstead of a blade of light, smoke starts pouring from the handle.\n\r", ch);
       send_to_char( "&RYou drop the hot handle and watch as it melts on away on the floor.\n\r", ch);
       learn_from_failure( ch, gsn_lightsaber_crafting );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_WEAPON;
    SET_BIT( obj->wear_flags, ITEM_WIELD );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    SET_BIT( obj->extra_flags, ITEM_ANTI_SOLDIER );
    SET_BIT( obj->extra_flags, ITEM_ANTI_THIEF );
    SET_BIT( obj->extra_flags, ITEM_ANTI_HUNTER );
    SET_BIT( obj->extra_flags, ITEM_ANTI_PILOT );
    SET_BIT( obj->extra_flags, ITEM_ANTI_CITIZEN );
    obj->level = level;
    obj->weight = 5;
    STRFREE( obj->name );
    obj->name = STRALLOC( "lightsaber saber" );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carelessly misplaced here." );
    obj->description = STRALLOC( buf );
    STRFREE( obj->action_desc );
    strcpy( buf, arg );
    strcat( buf, " ignites with a hum and a soft glow." );
    obj->action_desc = STRALLOC( buf );
    CREATE( paf, AFFECT_DATA, 1 );
    paf->type               = -1;
    paf->duration           = -1;
    paf->location           = get_atype( "hitroll" );
    paf->modifier           = URANGE( 0, gems, level/30 );
    paf->bitvector          = 0;
    paf->next               = NULL;
    LINK( paf, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
    CREATE( paf2, AFFECT_DATA, 1 );
    paf2->type               = -1;
    paf2->duration           = -1;
    paf2->location           = get_atype( "parry" );
    paf2->modifier           = ( level/3 );
    paf2->bitvector          = 0;
    paf2->next               = NULL;
    LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
    obj->value[0] = INIT_WEAPON_CONDITION;       /* condition  */
    obj->value[1] = (int) (level/10+gemtype*2);      /* min dmg  */
    obj->value[2] = (int) (level/5+gemtype*6);      /* max dmg */
    obj->value[3] = WEAPON_LIGHTSABER;
    obj->value[4] = charge;
    obj->value[5] = charge;
    obj->cost = obj->value[2]*75;
                                                                    
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created lightsaber.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new lightsaber.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 , exp_level(ch->skill_level[FORCE_ABILITY]+1) );
         gain_exp(ch, xpgain, FORCE_ABILITY);
         ch_printf( ch , "You gain %d force experience.", xpgain );
    }
        learn_from_success( ch, gsn_lightsaber_crafting );
}


void do_makespice( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int chance;
    OBJ_DATA *obj;
        
    switch( ch->substate )
    { 
    	default:
    	        strcpy( arg, argument );
    	        
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RFrom what?\n\r&w", ch);
                  return;   
                }
    	        
    	        if ( !IS_SET( ch->in_room->room_flags, ROOM_REFINERY ) )
                {
                   send_to_char( "&RYou need to be in a refinery to create drugs from spice.\n\r", ch);
                   return;
                }
                
                if ( ms_find_obj(ch) )
                      return;
                
                if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
                {
                        send_to_char( "&RYou do not have that item.\n\r&w", ch );
                        return;
                }                                                            
                
                if ( obj->item_type != ITEM_RAWSPICE )
                {
                       send_to_char( "&RYou can't make a drug out of that\n\r&w",ch);
                       return;
                }
                
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_spice_refining]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of refining spice into a drug.\n\r", ch);
    		   act( AT_PLAIN, "$n begins working on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 10 , do_makespice , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out what to do with the stuff.\n\r",ch);
	        learn_from_failure( ch, gsn_spice_refining );
    	   	return;	
    	
    	case 1:
    		if ( !ch->dest_buf )
    		   return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are distracted and are unable to finish your work.\n\r&w", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
           send_to_char( "You seem to have lost your spice!\n\r", ch );
           return;
    }                                                            
    if ( obj->item_type != ITEM_RAWSPICE )
    {
          send_to_char( "&RYou get your tools mixed up and can't finish your work.\n\r&w",ch);
          return;
    }
    
    obj->value[1] = URANGE (10, obj->value[1], ( IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_spice_refining]) ) +10);
    strcpy( buf, obj->name );
    STRFREE( obj->name );
    strcat( buf, " drug spice" );
    obj->name = STRALLOC( buf );
    strcpy( buf, "a drug made from " );
    strcat( buf, obj->short_descr );   
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf ); 
    strcat( buf, " was foolishly left lying around here." );
    STRFREE( obj->description );
    obj->description = STRALLOC( buf ); 
    obj->item_type = ITEM_SPICE;
    
    send_to_char( "&GYou finish your work.\n\r", ch);
    act( AT_PLAIN, "$n finishes $s work.", ch,
         NULL, argument , TO_ROOM );
    
    if ( !obj->cost )
      obj->cost = 500;
    obj->cost += obj->value[1]*10;
    obj->cost *= 2;
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
                 
    learn_from_success( ch, gsn_spice_refining );
    	
}

void do_makegrenade( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance, weight = 0, strength = 0;
    bool checktool, checkdrink, checkbatt, checkchem, checkcirc;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum;
    
    strcpy( arg , argument );
    
    switch( ch->substate )
    { 
    	default:
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makegrenade <name>\n\r&w", ch);
                  return;   
                }

    	        checktool  = FALSE;
                checkdrink = FALSE;
                checkbatt  = FALSE;
                checkchem  = FALSE;
                checkcirc  = FALSE;

                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_DRINK_CON && obj->value[1] == 0 )
          	    checkdrink = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                    checkbatt = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                    checkcirc = TRUE;
                  if (obj->item_type == ITEM_CHEMICAL)
                    checkchem = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a grenade.\n\r", ch);
                   return;
                }
 
                if ( !checkdrink )
                {
                   send_to_char( "&RYou will need an empty drink container to mix and hold the chemicals.\n\r", ch);
                   return;
                }

                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a small battery for the timer.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit for the timer.\n\r", ch);
                   return;
                }
                
                if ( !checkchem )
                {
                   send_to_char( "&RSome explosive chemicals would come in handy!\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makegrenade]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a grenade.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a drink container and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makegrenade , 1 );
    		   ch->dest_buf   = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makegrenade );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makegrenade]);
    vnum = 10425;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checktool = FALSE;
    checkdrink = FALSE;
    checkbatt = FALSE;
    checkchem = FALSE;
    checkcirc = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_DRINK_CON && checkdrink == FALSE && obj->value[1] == 0 )
       {
          checkdrink = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
       if (obj->item_type == ITEM_CHEMICAL)
       {
          strength = URANGE( 10, obj->value[0], level * 5 );
          weight = obj->weight;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkchem = TRUE;
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makegrenade]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkdrink ) || ( !checkbatt ) || ( !checkchem ) || ( !checkcirc) )
    {
       send_to_char( "&RJust as you are about to finish your work,\n\ryour newly created grenade explodes in your hands...doh!\n\r", ch);
       learn_from_failure( ch, gsn_makegrenade );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_GRENADE;
    SET_BIT( obj->wear_flags, ITEM_HOLD );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    obj->weight = weight;
    STRFREE( obj->name );
    strcpy( buf , arg );
    strcat( buf , " grenade");
    obj->name = STRALLOC( buf );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carelessly misplaced here." );
    obj->description = STRALLOC( buf );
    obj->value[0] = strength/2;
    obj->value[1] = strength;
    obj->cost = obj->value[1]*5;
                                                                   
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created grenade.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new grenade.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makegrenade );
}

void do_makelandmine( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance, strength = 0, weight = 0;
    bool checktool, checkdrink, checkbatt, checkchem, checkcirc;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum;
    
    strcpy( arg , argument );
    
    switch( ch->substate )
    { 
    	default:
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makelandmine <name>\n\r&w", ch);
                  return;   
                }

    	        checktool  = FALSE;
                checkdrink = FALSE;
                checkbatt  = FALSE;
                checkchem  = FALSE;
                checkcirc  = FALSE;

                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_DRINK_CON && obj->value[1] == 0 )
          	    checkdrink = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                    checkbatt = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                    checkcirc = TRUE;
                  if (obj->item_type == ITEM_CHEMICAL)
                    checkchem = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a landmine.\n\r", ch);
                   return;
                }
 
                if ( !checkdrink )
                {
                   send_to_char( "&RYou will need an empty drink container to mix and hold the chemicals.\n\r", ch);
                   return;
                }

                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a small battery for the detonator.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit for the detonator.\n\r", ch);
                   return;
                }
                
                if ( !checkchem )
                {
                   send_to_char( "&RSome explosive chemicals would come in handy!\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makelandmine]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a landmine.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a drink container and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makelandmine , 1 );
    		   ch->dest_buf   = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makelandmine );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makelandmine]);
    vnum = 10427;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checktool = FALSE;
    checkdrink = FALSE;
    checkbatt = FALSE;
    checkchem = FALSE;
    checkcirc = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_DRINK_CON && checkdrink == FALSE && obj->value[1] == 0 )
       {
          checkdrink = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
       if (obj->item_type == ITEM_CHEMICAL)
       {
          strength = URANGE( 10, obj->value[0], level * 5 );
          weight = obj->weight;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkchem = TRUE;
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makelandmine]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkdrink ) || ( !checkbatt ) || ( !checkchem ) || ( !checkcirc) )
    {
       send_to_char( "&RJust as you are about to finish your work,\n\ryour newly created landmine explodes in your hands...doh!\n\r", ch);
       learn_from_failure( ch, gsn_makelandmine );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_LANDMINE;
    SET_BIT( obj->wear_flags, ITEM_HOLD );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    obj->weight = weight;
    STRFREE( obj->name );
    strcpy( buf , arg );
    strcat( buf , " landmine");
    obj->name = STRALLOC( buf );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carelessly misplaced here." );
    obj->description = STRALLOC( buf );
    obj->value[0] = strength/2;
    obj->value[1] = strength;
    obj->cost = obj->value[1]*5;
                                                                   
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created landmine.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new landmine.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makelandmine );
}
void do_makelight( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance, strength = 0;
    bool checktool, checkbatt, checkchem, checkcirc, checklens;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum;
    
    strcpy( arg , argument );
    
    switch( ch->substate )
    { 
    	default:
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makeflashlight <name>\n\r&w", ch);
                  return;   
                }

    	        checktool  = FALSE;
                checkbatt  = FALSE;
                checkchem  = FALSE;
                checkcirc  = FALSE;
                checklens = FALSE;

                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                    checkbatt = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                    checkcirc = TRUE;
                  if (obj->item_type == ITEM_CHEMICAL)
                    checkchem = TRUE; 
                  if (obj->item_type == ITEM_LENS)
                    checklens = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a light.\n\r", ch);
                   return;
                }
                
                if ( !checklens )
                {
                   send_to_char( "&RYou need a lens to make a light.\n\r", ch);
                   return;
                }
 
                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a battery for the light to work.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit.\n\r", ch);
                   return;
                }
                
                if ( !checkchem )
                {
                   send_to_char( "&RSome chemicals to light would come in handy!\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makelight]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a light.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 10 , do_makelight , 1 );
    		   ch->dest_buf   = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makelight );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makelight]);
    vnum = 10428;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checktool = FALSE;
    checklens = FALSE;
    checkbatt = FALSE;
    checkchem = FALSE;
    checkcirc = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
       {
          strength = obj->value[0];
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
       if (obj->item_type == ITEM_CHEMICAL)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkchem = TRUE;
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
       }
       if (obj->item_type == ITEM_LENS && checklens == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checklens = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makelight]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checklens ) || ( !checkbatt ) || ( !checkchem ) || ( !checkcirc) )
    {
       send_to_char( "&RJust as you are about to finish your work,\n\ryour newly created light explodes in your hands...doh!\n\r", ch);
       learn_from_failure( ch, gsn_makelight );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_LIGHT;
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    obj->weight = 3;
    STRFREE( obj->name );
    strcpy( buf , arg );
    strcat( buf , " light");
    obj->name = STRALLOC( buf );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carelessly misplaced here." );
    obj->description = STRALLOC( buf );
    obj->value[2] = strength;
    obj->cost = obj->value[2];
                                                                   
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created light.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new light.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*100 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makelight );
}

void do_makejewelry( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    bool checktool, checkoven, checkmetal; 
    OBJ_DATA *obj;
    OBJ_DATA *metal = NULL;
    int value, cost;
            
    argument = one_argument( argument, arg );
    strcpy ( arg2, argument);
    
    if ( !str_cmp( arg, "body" )
    || !str_cmp( arg, "head" )
    || !str_cmp( arg, "legs" )
    || !str_cmp( arg, "arms" )
    || !str_cmp( arg, "about" )
    || !str_cmp( arg, "waist" )
    || !str_cmp( arg, "hold" )
    || !str_cmp( arg, "feet" )
    || !str_cmp( arg, "over" )
    || !str_cmp( arg, "floating" )
    || !str_cmp( arg, "hands" ) )
    {
        send_to_char( "&RYou cannot make jewelry for that body part.\n\r&w", ch);
        send_to_char( "&RTry MAKEARMOR.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "shield" ) )
    {
        send_to_char( "&RYou cannot make jewelry worn as a shield.\n\r&w", ch);
        send_to_char( "&RTry MAKESHIELD.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "wield" ) )
    {
        send_to_char( "&RAre you going to fight with your jewelry?\n\r&w", ch);
        send_to_char( "&RTry MAKEBLADE...\n\r&w", ch);
        return;
    }
    
    switch( ch->substate )
    { 
    	default:
    	        
    	        if ( arg2[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makejewelry <wearloc> <name>\n\r&w", ch);
                  return;
                }
 
    	        checktool = FALSE;
                checkoven = FALSE;
                checkmetal = FALSE;
        
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_OVEN)
          	    checkoven = TRUE;
                  if (obj->item_type == ITEM_RARE_METAL)
          	    checkmetal = TRUE;
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need a toolkit.\n\r", ch);
                   return;
                }
 
                if ( !checkoven )
                {
                   send_to_char( "&RYou need an oven.\n\r", ch);
                   return;
                }
                
                if ( !checkmetal )
                {
                   send_to_char( "&RYou need some precious metal.\n\r", ch);
                   return;
                }

    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makejewelry]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of creating some jewelry.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s toolkit and some metal and begins to work.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 15 , do_makejewelry , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   ch->dest_buf_2 = str_dup(arg2);
    		   return;
	        }
	        send_to_char("&RYou can't figure out what to do.\n\r",ch);
	        learn_from_failure( ch, gsn_makejewelry );
    	   	return;

    	case 1:
    		if ( !ch->dest_buf )
    		     return;
    		if ( !ch->dest_buf_2 )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		strcpy(arg2, ch->dest_buf_2);
    		DISPOSE( ch->dest_buf_2);
    		break;

    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		DISPOSE( ch->dest_buf_2 );
    		ch->substate = SUB_NONE;
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }

    ch->substate = SUB_NONE;

    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makejewelry]);

    checkmetal = FALSE;
    checkoven = FALSE;
    checktool = FALSE;
    value=0;
    cost=0;

    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_OVEN)
          checkoven = TRUE;
       if (obj->item_type == ITEM_RARE_METAL && checkmetal == FALSE)
       {
          checkmetal = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          metal = obj;
       }
       if (obj->item_type == ITEM_CRYSTAL)
       {
          cost += obj->cost;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
    }

    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makejewelry]) ;
                
    if ( number_percent( ) > chance*2  || ( !checkoven ) || ( !checktool ) || ( !checkmetal ) )
    {
       send_to_char( "&RYou hold up your newly created jewelry.\n\r", ch);
       send_to_char( "&RIt suddenly dawns upon you that you have created the most useless\n\r", ch);
       send_to_char( "&Rpiece of junk you've ever seen. You quickly hide your mistake...\n\r", ch);
       learn_from_failure( ch, gsn_makejewelry );
       return;
    }

    obj = metal; 

    obj->item_type = ITEM_ARMOR;
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    value = get_wflag( arg );
    if ( value < 0 || value > 31 )
        SET_BIT( obj->wear_flags, ITEM_WEAR_NECK );
    else
        SET_BIT( obj->wear_flags, 1 << value );
    obj->level = level;
    STRFREE( obj->name );
    strcpy( buf, arg2 );
    obj->name = STRALLOC( buf );
    strcpy( buf, arg2 );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was dropped here." );
    obj->description = STRALLOC( buf );
    obj->value[0] = obj->value[1];
    obj->cost *= 10;
    obj->cost += cost;
                                                                    
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created jewelry.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes sewing some new jewelry.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*100 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makejewelry );

}

void do_makearmor( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    bool checksew, checkfab; 
    OBJ_DATA *obj;
    OBJ_DATA *material = NULL;
    int value;
            
    argument = one_argument( argument, arg );
    strcpy ( arg2, argument);
    
    if ( !str_cmp( arg, "eyes" )
    || !str_cmp( arg, "ears" )
    || !str_cmp( arg, "finger" )
    || !str_cmp( arg, "neck" )
    || !str_cmp( arg, "floating" )
    || !str_cmp( arg, "wrist" ) )
    {
        send_to_char( "&RYou cannot make clothing for that body part.\n\r&w", ch);
        send_to_char( "&RTry MAKEJEWELRY.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "shield" ) )
    {
        send_to_char( "&RYou cannot make clothing worn as a shield.\n\r&w", ch);
        send_to_char( "&RTry MAKESHIELD.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "wield" ) )
    {
        send_to_char( "&RAre you going to fight with your clothing?\n\r&w", ch);
        send_to_char( "&RTry MAKEBLADE...\n\r&w", ch);
        return;
    }
    
    switch( ch->substate )
    { 
    	default:
    	        
    	        if ( arg2[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makearmor <wearloc> <name>\n\r&w", ch);
                  return;   
                }
 
    	        checksew = FALSE;
                checkfab = FALSE;
        
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_FABRIC)
                    checkfab = TRUE;
                  if (obj->item_type == ITEM_THREAD)
          	    checksew = TRUE;
                }
                
                if ( !checkfab )
                {
                   send_to_char( "&RYou need some sort of fabric or material.\n\r", ch);
                   return;
                }

                if ( !checksew )
                {
                   send_to_char( "&RYou need a needle and some thread.\n\r", ch);
                   return;
                }

    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makearmor]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of creating some armor.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s sewing kit and some material and begins to work.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 15 , do_makearmor , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   ch->dest_buf_2 = str_dup(arg2);
    		   return;
	        }
	        send_to_char("&RYou can't figure out what to do.\n\r",ch);
	        learn_from_failure( ch, gsn_makearmor );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		if ( !ch->dest_buf_2 )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		strcpy(arg2, ch->dest_buf_2);
    		DISPOSE( ch->dest_buf_2);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		DISPOSE( ch->dest_buf_2 );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makearmor]);
    
    checksew = FALSE;
    checkfab = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_THREAD)
          checksew = TRUE;
       if (obj->item_type == ITEM_FABRIC && checkfab == FALSE)
       {
          checkfab = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          material = obj;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makearmor]) ;
                
    if ( number_percent( ) > chance*2  || ( !checkfab ) || ( !checksew ) )
    {
       send_to_char( "&RYou hold up your newly created armor.\n\r", ch);
       send_to_char( "&RIt suddenly dawns upon you that you have created the most useless\n\r", ch);
       send_to_char( "&Rgarment you've ever seen. You quickly hide your mistake...\n\r", ch);
       learn_from_failure( ch, gsn_makearmor );
       return;
    }

    obj = material; 

    obj->item_type = ITEM_ARMOR;
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    value = get_wflag( arg );
    if ( value < 0 || value > 31 )
        SET_BIT( obj->wear_flags, ITEM_WEAR_BODY );                    
    else
        SET_BIT( obj->wear_flags, 1 << value );
    obj->level = level;
    STRFREE( obj->name );
    strcpy( buf, arg2 );
    obj->name = STRALLOC( buf );
    strcpy( buf, arg2 );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was dropped here." );
    obj->description = STRALLOC( buf );
    obj->value[0] = obj->value[1];
    obj->cost *= 10;

    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created garment.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes sewing some new armor.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*100 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makearmor );
}


void do_makecomlink( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int chance;
    bool checktool, checkgem, checkbatt, checkcirc;
    OBJ_DATA *obj;
    int value;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum;

    argument = one_argument( argument, arg );
    strcpy ( arg2, argument);

    if ( !str_cmp( arg, "body" )
    || !str_cmp( arg, "head" )
    || !str_cmp( arg, "legs" )
    || !str_cmp( arg, "arms" )
    || !str_cmp( arg, "about" )
    || !str_cmp( arg, "eyes" )
    || !str_cmp( arg, "waist" )
    || !str_cmp( arg, "hold" )
    || !str_cmp( arg, "feet" )
    || !str_cmp( arg, "hands" ) )
    {
        send_to_char( "&RYou cannot make a comlink for that body part.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "shield" ) )
    {
        send_to_char( "&RYou cannot make a comlink worn as a shield.\n\r&w", ch);
        send_to_char( "&RTry MAKESHIELD.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "wield" ) )
    {
        send_to_char( "&RAre you going to fight with your comlink?\n\r&w", ch);
        return;
    }

    switch( ch->substate )
    { 
    	default:
    	        if ( arg2[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makecomlink <wearloc> <name>\n\r&w", ch);
                  return;   
                }
 
                checktool = FALSE;
                checkgem = FALSE;
                checkbatt = FALSE;
                checkcirc = FALSE;
        
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_CRYSTAL)
          	    checkgem = TRUE;
                  if (obj->item_type == ITEM_BATTERY)
                  checkbatt = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                  checkcirc = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a comlink.\n\r", ch);
                   return;
                }
 
                if ( !checkgem )
                {
                   send_to_char( "&RYou need a small crystal.\n\r", ch);
                   return;
                }

                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a power source for your comlink.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit.\n\r", ch);
                   return;
                }

    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makecomlink]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a comlink.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 10 , do_makecomlink , 1 );
    		   ch->dest_buf = str_dup(arg);
            ch->dest_buf_2 = str_dup(arg2);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makecomlink );
    	   	return;

    	case 1:
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		if ( !ch->dest_buf_2 )
              return;
         strcpy(arg2, ch->dest_buf_2);
         DISPOSE( ch->dest_buf_2);
         break;
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }

    ch->substate = SUB_NONE;

    vnum = 10430;

    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }
    
    checktool = FALSE;
    checkgem  = FALSE;
    checkbatt = FALSE;
    checkcirc = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_CRYSTAL && checkgem == FALSE)
       {
          checkgem = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          checkcirc = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE )
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makecomlink]) ;

    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkcirc ) || ( !checkbatt ) || ( !checkgem ) )
    {
       send_to_char( "&RYou hold up your newly created comlink....\n\r", ch);
       send_to_char( "&Rand it falls apart in your hands.\n\r", ch);
       learn_from_failure( ch, gsn_makecomlink );
       return;
    }

    obj = create_object( pObjIndex, ch->top_level );
    
    obj->item_type = ITEM_COMLINK;
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    value = get_wflag( arg );
    if ( value < 0 || value > 31 )
        SET_BIT( obj->wear_flags, ITEM_WEAR_NECK );                    
    else
        SET_BIT( obj->wear_flags, 1 << value );
    obj->weight = 1;
    STRFREE( obj->name );
    strcpy( buf, arg2 );
    strcat( buf, " comlink" );
    obj->name = STRALLOC( buf );
    strcpy( buf, arg2 );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );
    STRFREE( obj->description );
    strcat( buf, " was left here." );
    obj->description = STRALLOC( buf );
    obj->cost = 50;

    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created comlink.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes crafting a comlink.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*100 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makecomlink );
     
}

void do_makeshield( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int chance;
    bool checktool, checkbatt, checkcond, checkcirc, checkgems;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum, level, charge, gemtype = 0;
    
    strcpy( arg, argument );    
    
    switch( ch->substate )
    { 
    	default:
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makeshield <name>\n\r&w", ch);
                  return;   
                }

    	        checktool = FALSE;
                checkbatt = FALSE;
                checkcond = FALSE;
                checkcirc = FALSE;
                checkgems = FALSE;

                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a workshop.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_CRYSTAL)
                    checkgems = TRUE;                    
                  if (obj->item_type == ITEM_BATTERY)
                    checkbatt = TRUE;
                  if (obj->item_type == ITEM_CIRCUIT)
                    checkcirc = TRUE;
                  if (obj->item_type == ITEM_SUPERCONDUCTOR)
                    checkcond = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make an energy shield.\n\r", ch);
                   return;
                }
 
                if ( !checkbatt )
                {
                   send_to_char( "&RYou need a power source for your energy shield.\n\r", ch);
                   return;
                }
                
                if ( !checkcirc )
                {
                   send_to_char( "&RYou need a small circuit board.\n\r", ch);
                   return;
                }
                
                if ( !checkcond )
                {
                   send_to_char( "&RYou still need a small superconductor for your energy shield.\n\r", ch);
                   return;
                }
                
                if ( !checkgems )
                {
                   send_to_char( "&RYou need a small crystal.\n\r", ch);
                   return;
                }
                
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makeshield]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of crafting an energy shield.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 20 , do_makeshield , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makeshield );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeshield]);
    vnum = 10429;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checktool = FALSE;
    checkbatt = FALSE;
    checkcond = FALSE;
    checkcirc = FALSE;
    checkgems = FALSE;
    charge = 0;

    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;

       if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
       {
          charge = UMIN(obj->value[1], 10);
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
       }
       if (obj->item_type == ITEM_SUPERCONDUCTOR && checkcond == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcond = TRUE;
       }
       if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
       }
       if (obj->item_type == ITEM_CRYSTAL && checkgems == FALSE)
       {
          gemtype = obj->value[0];
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkgems = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makeshield]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkbatt )
                                       || ( !checkgems ) || ( !checkcond ) || ( !checkcirc) )
    
    {
       send_to_char( "&RYou hold up your new energy shield and press the switch hoping for the best.\n\r", ch);
       send_to_char( "&RInstead of a field of energy being created, smoke starts pouring from the device.\n\r", ch);
       send_to_char( "&RYou drop the hot device and watch as it melts on away on the floor.\n\r", ch);
       learn_from_failure( ch, gsn_makeshield );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_ARMOR;
    SET_BIT( obj->wear_flags, ITEM_WIELD );
    SET_BIT( obj->wear_flags, ITEM_WEAR_SHIELD );
    obj->level = level;
    obj->weight = 2;
    STRFREE( obj->name );
    obj->name = STRALLOC( "energy shield" );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carelessly misplaced here." );
    obj->description = STRALLOC( buf );
    obj->value[0] = (int) (level/10+gemtype*2);      /* condition */
    obj->value[1] = (int) (level/10+gemtype*2);      /* armor */
    obj->value[4] = charge;
    obj->value[5] = charge;
    obj->cost = obj->value[2]*100;
                                                                    
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created energy shield.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new energy shield.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makeshield );

}

void do_makecontainer( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    bool checksew, checkfab; 
    OBJ_DATA *obj;
    OBJ_DATA *material = NULL;
    int value;
            
    argument = one_argument( argument, arg );
    strcpy( arg2 , argument );
    
    if ( !str_cmp( arg, "eyes" )
    || !str_cmp( arg, "ears" )
    || !str_cmp( arg, "finger" )
    || !str_cmp( arg, "neck" )
    || !str_cmp( arg, "floating" )
    || !str_cmp( arg, "over" )
    || !str_cmp( arg, "wrist" ) )
    {
        send_to_char( "&RYou cannot make a container for that body part.\n\r&w", ch);
        send_to_char( "&RTry MAKEJEWELRY.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "feet" ) 
    || !str_cmp( arg, "hands" ) )
    {
        send_to_char( "&RYou cannot make a container for that body part.\n\r&w", ch);
        send_to_char( "&RTry MAKEARMOR.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "shield" ) )
    {
        send_to_char( "&RYou cannot make a container a shield.\n\r&w", ch);
        send_to_char( "&RTry MAKESHIELD.\n\r&w", ch);
        return;
    }
    if ( !str_cmp( arg, "wield" ) )
    {
        send_to_char( "&RAre you going to fight with a container?\n\r&w", ch);
        send_to_char( "&RTry MAKEBLADE...\n\r&w", ch);
        return;
    }
    
    switch( ch->substate )
    { 
    	default:
    	        
    	        if ( arg2[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makecontainer <wearloc> <name>\n\r&w", ch);
                  return;   
                }
 
    	        checksew = FALSE;
                checkfab = FALSE;
        
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_FABRIC)
                    checkfab = TRUE;
                  if (obj->item_type == ITEM_THREAD)
          	    checksew = TRUE;
                }
                
                if ( !checkfab )
                {
                   send_to_char( "&RYou need some sort of fabric or material.\n\r", ch);
                   return;
                }
 
                if ( !checksew )
                {
                   send_to_char( "&RYou need a needle and some thread.\n\r", ch);
                   return;
                }

    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makecontainer]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of creating a bag.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s sewing kit and some material and begins to work.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 10 , do_makecontainer , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   ch->dest_buf_2 = str_dup(arg2);
    		   return;
	        }
	        send_to_char("&RYou can't figure out what to do.\n\r",ch);
	        learn_from_failure( ch, gsn_makecontainer );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		if ( !ch->dest_buf_2 )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		strcpy(arg2, ch->dest_buf_2);
    		DISPOSE( ch->dest_buf_2);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		DISPOSE( ch->dest_buf_2 );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makecontainer]);
    
    checksew = FALSE;
    checkfab = FALSE;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_THREAD)
          checksew = TRUE;
       if (obj->item_type == ITEM_FABRIC && checkfab == FALSE)
       {
          checkfab = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          material = obj;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makecontainer]) ;
                
    if ( number_percent( ) > chance*2  || ( !checkfab ) || ( !checksew ) )
    {
       send_to_char( "&RYou hold up your newly created container.\n\r", ch);
       send_to_char( "&RIt suddenly dawns upon you that you have created the most useless\n\r", ch);
       send_to_char( "&Rcontainer you've ever seen. You quickly hide your mistake...\n\r", ch);
       learn_from_failure( ch, gsn_makecontainer );
       return;
    }

    obj = material; 

    obj->item_type = ITEM_CONTAINER;
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    value = get_wflag( arg );
    if ( value < 0 || value > 31 )
        SET_BIT( obj->wear_flags, ITEM_HOLD );                    
    else
        SET_BIT( obj->wear_flags, 1 << value );
    obj->level = level;
    STRFREE( obj->name );
    strcpy( buf, arg2 );
    obj->name = STRALLOC( buf );
    strcpy( buf, arg2 );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was dropped here." );
    obj->description = STRALLOC( buf );
    obj->value[0] = level;
    obj->value[1] = 0;
    obj->value[2] = 0;      
    obj->value[3] = 10;      
    obj->cost *= 2;
                                                                    
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created container.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes sewing a new container.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*100 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
        learn_from_success( ch, gsn_makecontainer );
}

void do_makemissile( CHAR_DATA *ch, char *argument )
{
    /* don't think we really need this */
    send_to_char( "&RSorry, this skill isn't finished yet :(\n\r", ch);
}

void do_gemcutting( CHAR_DATA *ch, char *argument )
{
     send_to_char( "&RSorry, this skill isn't finished yet :(\n\r", ch);
}

void do_reinforcements( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    int chance, credits;
    
    if ( IS_NPC( ch ) || !ch->pcdata )
    	return;
    	
    strcpy( arg, argument );    
    
    switch( ch->substate )
    { 
    	default:
    	        if ( ch->backup_wait )
    	        {
    	            send_to_char( "&RYour reinforcements are already on the way.\n\r", ch );
    	            return;
    	        }
    	        
    	        if ( !ch->pcdata->clan )
    	        {
    	            send_to_char( "&RYou need to be a member of an organization before you can call for reinforcements.\n\r", ch );
    	            return;
    	        }    
    	        
    	        if ( ch->gold < ch->skill_level[LEADERSHIP_ABILITY] * 50 )
    	        {
    	            ch_printf( ch, "&RYou dont have enough credits to send for reinforcements.\n\r" );
    	            return;
    	        }    
    	        
    	        chance = (int) (ch->pcdata->learned[gsn_reinforcements]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin making the call for reinforcements.\n\r", ch);
    		   act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 1 , do_reinforcements , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou call for reinforcements but nobody answers.\n\r",ch);
	        learn_from_failure( ch, gsn_reinforcements );
    	   	return;	
    	
    	case 1:
    		if ( !ch->dest_buf )
    		   return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted before you can finish your call.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    send_to_char( "&GYour reinforcements are on the way.\n\r", ch);
    credits = ch->skill_level[LEADERSHIP_ABILITY] * 50;
    ch_printf( ch, "It cost you %d credits.\n\r", credits);
    ch->gold -= UMIN( credits , ch->gold );
             
    learn_from_success( ch, gsn_reinforcements );
    
    if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_STORMTROOPER;
    else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_NR_TROOPER;
    else
       ch->backup_mob = MOB_VNUM_MERCINARY;

    ch->backup_wait = number_range(1,2);
    
}

void do_postguard( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    int chance, credits;
    
    if ( IS_NPC( ch ) || !ch->pcdata )
    	return;
    	
    strcpy( arg, argument );    

    switch( ch->substate )
    { 
    	default:
    	        if ( ch->backup_wait )
    	        {
    	            send_to_char( "&RYou already have backup coming.\n\r", ch );
    	            return;
    	        }
    	        
    	        if ( !ch->pcdata->clan )
    	        {
    	            send_to_char( "&RYou need to be a member of an organization before you can call for a guard.\n\r", ch );
    	            return;
    	        }    
    	        
    	        if ( ch->gold < ch->skill_level[LEADERSHIP_ABILITY] * 30 )
    	        {
    	            ch_printf( ch, "&RYou dont have enough credits.\n\r", ch );
    	            return;
    	        }    
    	        
    	        chance = (int) (ch->pcdata->learned[gsn_postguard]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin making the call for reinforcements.\n\r", ch);
    		   act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 1 , do_postguard , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou call for a guard but nobody answers.\n\r",ch);
	        learn_from_failure( ch, gsn_postguard );
    	   	return;	
    	
    	case 1:
    		if ( !ch->dest_buf )
    		   return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted before you can finish your call.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    send_to_char( "&GYour guard is on the way.\n\r", ch);
    
    credits = ch->skill_level[LEADERSHIP_ABILITY] * 30;
    ch_printf( ch, "It cost you %d credits.\n\r", credits);
    ch->gold -= UMIN( credits , ch->gold );

    learn_from_success( ch, gsn_postguard );
    
    if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_IMP_GUARD;
    else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_NR_GUARD;
    else
       ch->backup_mob = MOB_VNUM_BOUNCER;

    ch->backup_wait = 1;

}

void add_reinforcements( CHAR_DATA *ch )
{
     MOB_INDEX_DATA  * pMobIndex;
     OBJ_DATA        * blaster;
     OBJ_INDEX_DATA  * pObjIndex;
     char 	       buf[MAX_INPUT_LENGTH];
     int multiplier = 1;

     if ( ( pMobIndex = get_mob_index( ch->backup_mob ) ) == NULL )
        return;

     sprintf(buf, "%s just posted a guard on %d!", ch->name, ch->in_room ? ch->in_room->vnum : 0 );
     bug(buf, 0);


     if ( ch->backup_mob == MOB_VNUM_STORMTROOPER ||
          ch->backup_mob == MOB_VNUM_NR_TROOPER   ||
          ch->backup_mob == MOB_VNUM_MERCINARY ||
          ch->backup_mob == MOB_VNUM_IMP_FORCES ||
          ch->backup_mob == MOB_VNUM_NR_FORCES   ||
          ch->backup_mob == MOB_VNUM_MERC_FORCES       )
     {


        CHAR_DATA * mob[3];
        int         mob_cnt;

         if ( ch->backup_mob == MOB_VNUM_IMP_FORCES ||
           ch->backup_mob == MOB_VNUM_NR_FORCES   ||
           ch->backup_mob == MOB_VNUM_MERC_FORCES )
         { multiplier = 2; }


        send_to_char( "Your reinforcements have arrived.\n\r", ch );
        for ( mob_cnt = 0 ; mob_cnt < 3 ; mob_cnt++ )
        {
            int ability;
            mob[mob_cnt] = create_mobile( pMobIndex );
            char_to_room( mob[mob_cnt], ch->in_room );
            act( AT_IMMORT, "$N has arrived.", ch, NULL, mob[mob_cnt], TO_ROOM );
            mob[mob_cnt]->top_level = multiplier / 1.4 * ch->skill_level[LEADERSHIP_ABILITY]/3;
            for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
                     mob[mob_cnt]->skill_level[ability] = mob[mob_cnt]->top_level;
            mob[mob_cnt]->hit = mob[mob_cnt]->top_level*15;
            mob[mob_cnt]->max_hit = mob[mob_cnt]->hit;
            mob[mob_cnt]->armor = 100- mob[mob_cnt]->top_level*2.5;
            mob[mob_cnt]->damroll = mob[mob_cnt]->top_level/5;
            mob[mob_cnt]->hitroll = mob[mob_cnt]->top_level/5;
            if ( ( pObjIndex = get_obj_index( OBJ_VNUM_BLASTECH_E11 ) ) != NULL )
            {
                 blaster = create_object( pObjIndex, mob[mob_cnt]->top_level );
                 obj_to_char( blaster, mob[mob_cnt] );
                 equip_char( mob[mob_cnt], blaster, WEAR_WIELD );
            } 
            if ( mob[mob_cnt]->master )
	       stop_follower( mob[mob_cnt] );
	    add_follower( mob[mob_cnt], ch );
            SET_BIT( mob[mob_cnt]->affected_by, AFF_CHARM );
            do_setblaster( mob[mob_cnt] , "full" );
        }
     }
     else
     {
        CHAR_DATA *mob;
        int ability;

       if ( ch->backup_mob == MOB_VNUM_IMP_ELITE ||
          ch->backup_mob == MOB_VNUM_NR_ELITE   ||
          ch->backup_mob == MOB_VNUM_MERC_ELITE )
       { multiplier = 2; }

        mob = create_mobile( pMobIndex );
        char_to_room( mob, ch->in_room );
        if ( ch->pcdata && ch->pcdata->clan )
        {
          char tmpbuf[MAX_STRING_LENGTH];

          STRFREE( mob->name );
          mob->name = STRALLOC( ch->pcdata->clan->name );
          sprintf( tmpbuf , "(%s) %s" , ch->pcdata->clan->name  , mob->long_descr );
          STRFREE( mob->long_descr );
          mob->long_descr = STRALLOC( tmpbuf );
        }
        act( AT_IMMORT, "$N has arrived.", ch, NULL, mob, TO_ROOM );
        send_to_char( "Your guard has arrived.\n\r", ch );
        mob->top_level = multiplier * ch->skill_level[LEADERSHIP_ABILITY] / 2;
        for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
            mob->skill_level[ability] = mob->top_level;
        mob->hit = mob->top_level*10;
        mob->max_hit = mob->hit;
        mob->armor = 100- mob->top_level*2.5;
        mob->damroll = mob->top_level/5;
        mob->hitroll = mob->top_level/5;
        if ( ( pObjIndex = get_obj_index( OBJ_VNUM_BLASTECH_E11 ) ) != NULL )
        {
            blaster = create_object( pObjIndex, mob->top_level );
            obj_to_char( blaster, mob );
            equip_char( mob, blaster, WEAR_WIELD );
        }

        /* for making this more accurate in the future */

        if ( mob->mob_clan )
           STRFREE ( mob->mob_clan );
        if ( ch->pcdata && ch->pcdata->clan )
           mob->mob_clan = STRALLOC( ch->pcdata->clan->name );
     }                    
}

void do_torture( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    int chance, dam;
    bool fail;
    
    if ( !IS_NPC(ch)
    &&  ch->pcdata->learned[gsn_torture] <= 0  )
    {
	send_to_char(
	    "Your mind races as you realize you have no idea how to do that.\n\r", ch );
	return;
    }

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't do that right now.\n\r", ch );
	return;
    }

    one_argument( argument, arg );

    if ( ch->mount )
    {
	send_to_char( "You can't get close enough while mounted.\n\r", ch );
	return;
    }

    if ( arg[0] == '\0' )
    {
	send_to_char( "Torture whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "Are you masacistic or what...\n\r", ch );
	return;
    }
    
    if ( !IS_AWAKE(victim) )
    {
	send_to_char( "You need to wake them first.\n\r", ch );
	return;
    }

    if ( is_safe( ch, victim ) )
      return;

    if ( victim->fighting )
    {
	send_to_char( "You can't torture someone whos in combat.\n\r", ch );
	return;
    }
    
    ch->alignment = ch->alignment -= 100;
    ch->alignment = URANGE( -1000, ch->alignment, 1000 );
    
    WAIT_STATE( ch, skill_table[gsn_torture]->beats );
    
    fail = FALSE;
    chance = ris_save( victim, (ch->skill_level[LEADERSHIP_ABILITY])/10, RIS_PARALYSIS );
    if ( chance == 1000 )
      fail = TRUE;
    else
      fail = saves_para_petri( chance, victim );

    if ( !IS_NPC(ch) && !IS_NPC(victim) )
      chance = sysdata.stun_plr_vs_plr;
    else
      chance = sysdata.stun_regular;
    if ( !fail
    && (  IS_NPC(ch)
    || (number_percent( ) + chance) < ch->pcdata->learned[gsn_torture] ) )
    {
	learn_from_success( ch, gsn_torture );
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	WAIT_STATE( victim, PULSE_VIOLENCE );
	act( AT_SKILL, "$N slowly tortures you. The pain is excruciating.", victim, NULL, ch, TO_CHAR );
	act( AT_SKILL, "You torture $N, leaving $M screaming in pain.", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n tortures $N, leaving $M screaming in agony!", ch, NULL, victim, TO_NOTVICT );
        
        dam = dice( ch->skill_level[LEADERSHIP_ABILITY]/80 , 4 );
        dam = URANGE( 0, victim->max_hit-10, dam ); 
        victim->hit -= dam;
        victim->max_hit -= dam;
        
        ch_printf( victim, "You lose %d permanent hit points." ,dam);
        ch_printf( ch, "They lose %d permanent hit points." , dam);
         
    }
    else
    {
	act( AT_SKILL, "$N tries to cut off your finger!", victim, NULL, ch, TO_CHAR );
	act( AT_SKILL, "You mess up big time.", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n tries to painfully torture $N.", ch, NULL, victim, TO_NOTVICT );
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
        global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
    }
    return;
    
}

void do_disguise( CHAR_DATA *ch, char *argument )
{
    int chance;
    sh_int gsn;

    if ( IS_NPC(ch) )
	return;

    if ( IS_SET( ch->pcdata->flags, PCFLAG_NOTITLE ))
    {
        send_to_char( "You try but the Force resists you.\n\r", ch );
        return;
    }



    if(ch->pcdata->learned[gsn_disguise] <= 0)
      gsn = gsn_cloak;
    else
      gsn = gsn_disguise;

    if ( argument[0] == '\0' )
    {
	send_to_char( "Change your title to what?\n\r", ch );
	return;
    }

    chance = (int) (ch->pcdata->learned[gsn]);

    if ( number_percent( ) > chance )
    {
        send_to_char( "You try to disguise yourself but fail.\n\r", ch );
        return;
    }

    if ( strlen(argument) > 50 )
	argument[50] = '\0';

    smash_tilde( argument );
    set_title( ch, argument );
    learn_from_success( ch, gsn );
    send_to_char( "Ok.\n\r", ch );
}

void do_mine( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    OBJ_DATA *obj;
    bool shovel;
    sh_int move;

   if ( ch->pcdata->learned[gsn_mine] <= 0 )
    {
      ch_printf( ch, "You have no idea how to do that.\n\r" );
      return;
    }

    one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
        send_to_char( "And what will you mine the room with?\n\r", ch );
        return;
    }

    if ( ms_find_obj(ch) )
        return;

    shovel = FALSE;
    for ( obj = ch->first_carrying; obj; obj = obj->next_content )
      if ( obj->item_type == ITEM_SHOVEL )
      {
	  shovel = TRUE;
	  break;
      }

    obj = get_obj_list_rev( ch, arg, ch->in_room->last_content );
    if ( !obj )
    {
        send_to_char( "You don't see on here.\n\r", ch );
        return;
    }

    separate_obj(obj);
    if ( obj->item_type != ITEM_LANDMINE )
    {
	act( AT_PLAIN, "That's not a landmine!", ch, obj, 0, TO_CHAR );
        return;
    }

    if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
	act( AT_PLAIN, "You cannot bury $p.", ch, obj, 0, TO_CHAR );
        return;
    }

    switch( ch->in_room->sector_type )
    {
	case SECT_CITY:
	case SECT_INSIDE:
	    send_to_char( "The floor is too hard to dig through.\n\r", ch );
	    return;
	case SECT_WATER_SWIM:
	case SECT_WATER_NOSWIM:
	case SECT_UNDERWATER:
	    send_to_char( "You cannot bury a mine in the water.\n\r", ch );
	    return;
	case SECT_AIR:
	    send_to_char( "What?  Bury a mine in the air?!\n\r", ch );
	    return;
    }

    if ( obj->weight > (UMAX(5, (can_carry_w(ch) / 10)))
    &&  !shovel )
    {
	send_to_char( "You'd need a shovel to bury something that big.\n\r", ch );
	return;
    }

    move = (obj->weight * 50 * (shovel ? 1 : 5)) / UMAX(1, can_carry_w(ch));
    move = URANGE( 2, move, 1000 );
    if ( move > ch->move )
    {
	send_to_char( "You don't have the energy to bury something of that size.\n\r", ch );
	return;
    }
    ch->move -= move;

    SET_BIT( obj->extra_flags, ITEM_BURRIED );
    WAIT_STATE( ch, URANGE( 10, move / 2, 100 ) );

    STRFREE ( obj->armed_by );
    obj->armed_by = STRALLOC ( ch->name );

    ch_printf( ch, "You arm and bury %s.\n\r", obj->short_descr );
    act( AT_PLAIN, "$n arms and buries $p.", ch, obj, NULL, TO_ROOM );

    learn_from_success( ch, gsn_mine );

    return;
}

void do_first_aid( CHAR_DATA *ch, char *argument )
{
   OBJ_DATA   *medpac;
   CHAR_DATA  *victim;
   int         heal;
   char        buf[MAX_STRING_LENGTH];

   if ( ch->position == POS_FIGHTING )
   {
         send_to_char( "You can't do that while fighting!\n\r",ch );
         return;
   }
   
   medpac = get_eq_char( ch, WEAR_HOLD );
   if ( !medpac || medpac->item_type != ITEM_MEDPAC )
   {
         send_to_char( "You need to be holding a medpac.\n\r",ch );
         return;
   }  

   if ( medpac->value[0] <= 0 )
   {
         send_to_char( "Your medpac seems to be empty.\n\r",ch );
         return;         
   }
   
   if ( argument[0] == '\0' )
      victim = ch;
   else
      victim = get_char_room( ch, argument );
            
   if ( !victim )
   {
       ch_printf( ch, "I don't see any %s here...\n\r" , argument );     
       return;
   }
   
   heal = number_range( 1, 150 );
   
   if ( heal > ch->pcdata->learned[gsn_first_aid]*2 )
   {
       ch_printf( ch, "You fail in your attempt at first aid.\n\r");     
       learn_from_failure( ch , gsn_first_aid );
       return;
   } 
      
   if ( victim == ch )
   {
       ch_printf( ch, "You tend to your wounds.\n\r");
       sprintf( buf , "$n uses %s to help heal $s wounds." , medpac->short_descr );        
       act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );  
   }
   else
   {
       sprintf( buf , "You tend to $N's wounds." );        
       act( AT_ACTION, buf, ch, NULL, victim, TO_CHAR );  
       sprintf( buf , "$n uses %s to help heal $N's wounds." , medpac->short_descr );        
       act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );  
       sprintf( buf , "$n uses %s to help heal your wounds." , medpac->short_descr );        
       act( AT_ACTION, buf, ch, NULL, victim, TO_VICT );  
   }

   --medpac->value[0];
   victim->hit += URANGE ( 0, heal , victim->max_hit - victim->hit );

   learn_from_success( ch , gsn_first_aid );
}

void do_snipe( CHAR_DATA *ch, char *argument )
{
   OBJ_DATA        * wield;
   char              arg[MAX_INPUT_LENGTH];  
   char              arg2[MAX_INPUT_LENGTH];
   sh_int            dir, dist;
   sh_int            max_dist = 1;
   EXIT_DATA       * pexit;
   ROOM_INDEX_DATA * was_in_room;
   ROOM_INDEX_DATA * to_room;
   CHAR_DATA       * victim = NULL;
   int               chance;
   char              buf[MAX_STRING_LENGTH];
   bool              pfound = FALSE;

   
   if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "You'll have to do that elswhere.\n\r", ch );
	return;
    }
     
   if ( get_eq_char( ch, WEAR_DUAL_WIELD ) != NULL )
   {
         send_to_char( "You can't do that while wielding two weapons.",ch );
         return;
   }
    
   wield = get_eq_char( ch, WEAR_WIELD );
   if ( !wield || wield->item_type != ITEM_WEAPON || wield->value[3] != WEAPON_BLASTER )
   {
         send_to_char( "You don't seem to be holding a blaster",ch );
         return;
   }  

   if ( !IS_NPC(ch) && ch->pcdata->learned[gsn_snipe]> 100)
     max_dist += (ch->pcdata->learned[gsn_snipe]) / 15;
     
   argument = one_argument( argument, arg );
   argument = one_argument( argument, arg2 );
   
   if ( ( dir = get_door( arg ) ) == -1 || arg2[0] == '\0' )
   {
     send_to_char( "Usage: snipe <dir> <target>\n\r", ch );
     return;
   }
 
   if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
   {
     send_to_char( "Are you expecting to fire through a wall!?\n\r", ch );
     return;
   }

   if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
   {
     send_to_char( "Are you expecting to fire through a door!?\n\r", ch );
     return;
   }

   was_in_room = ch->in_room;
   
   for ( dist = 0; dist <= max_dist; dist++ )   
   {
     if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
        break; 
     
     if ( !pexit->to_room )
        break;
     
    to_room = NULL;
    if ( pexit->distance > 1 )
       to_room = generate_exit( ch->in_room , &pexit );
    
    if ( to_room == NULL )
       to_room = pexit->to_room;
    
     char_from_room( ch );
     char_to_room( ch, to_room );    
     

     if ( IS_NPC(ch) && ( victim = get_char_room_mp( ch, arg2 ) ) != NULL )
     {
        pfound = TRUE;
        break;
     }
     else if ( !IS_NPC(ch) && ( victim = get_char_room( ch, arg2 ) ) != NULL )
     {
        pfound = TRUE;
        break;
     }


     if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
        break;
            
   }
   
   char_from_room( ch );
   char_to_room( ch, was_in_room );    
       
   if ( !pfound )
   {
       ch_printf( ch, "You don't see that person to the %s!\n\r", dir_name[dir] );
       char_from_room( ch );
       char_to_room( ch, was_in_room );    
       return;
   }
   
    if ( victim == ch )
    {
	send_to_char( "Shoot yourself ... really?\n\r", ch );
	return;
    }
    
    if ( IS_SET( victim->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "You can't shoot them there.\n\r", ch );
	return;
    }
 
    if ( is_safe( ch, victim ) )
	return;
    
    if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
    {
        act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
	send_to_char( "You do the best you can!\n\r", ch );
	return;
    }
    
    if ( !IS_NPC( victim ) && IS_SET( ch->act, PLR_NICE ) )
    {
      send_to_char( "You feel too nice to do that!\n\r", ch );
      return;
    }
    
    chance = IS_NPC(ch) ? 100
           : (int)  (ch->pcdata->learned[gsn_snipe]) ; 
    
    switch ( dir )
    {
        case 0:
        case 1:
           dir += 2;
           break;
        case 2:
        case 3:
           dir -= 2;
           break;
        case 4:
        case 7:
           dir += 1;
           break;
        case 5:
        case 8:
           dir -= 1;
           break;
        case 6:
           dir += 3;
           break;
        case 9:
           dir -=3;
           break;
    }
    
    char_from_room( ch );
    char_to_room( ch, victim->in_room );    
                
    if ( number_percent() < chance )
    {                         
       sprintf( buf , "A blaster shot fires at you from the %s." , dir_name[dir] );
       act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );      
       act( AT_ACTION, "You fire at $N.", ch, NULL, victim, TO_CHAR );         
       sprintf( buf, "A blaster shot fires at $N from the %s." , dir_name[dir] );
       act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );  
                                                   
       one_hit( ch, victim, TYPE_UNDEFINED );  
       
       if ( char_died(ch) ) 
          return;
          
       stop_fighting( ch , TRUE );
       
       learn_from_success( ch, gsn_snipe );              
    }
    else
    {
       act( AT_ACTION, "You fire at $N but don't even come close.", ch, NULL, victim, TO_CHAR );         
       sprintf( buf, "A blaster shot fired from the %s barely misses you." , dir_name[dir] );
       act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );  
       learn_from_failure( ch, gsn_snipe );
    }
            
    char_from_room( ch );
    char_to_room( ch, was_in_room );    
     
   if ( IS_NPC(ch) )                               
      WAIT_STATE( ch, 1 * PULSE_VIOLENCE );
   else
   {
   	if ( number_percent() < ch->pcdata->learned[gsn_third_attack] )
   	     WAIT_STATE( ch, 1 * PULSE_PER_SECOND );
   	else if ( number_percent() < ch->pcdata->learned[gsn_second_attack] )
   	     WAIT_STATE( ch, 2 * PULSE_PER_SECOND );
   	else 
   	     WAIT_STATE( ch, 3 * PULSE_PER_SECOND );
   }
   if ( IS_NPC( victim ) && !char_died(victim) )
   {
      if ( IS_SET( victim->act , ACT_SENTINEL ) )
      {
         victim->was_sentinel = victim->in_room;
         REMOVE_BIT( victim->act, ACT_SENTINEL );
      }
      
      start_hating( victim , ch );
      start_hunting( victim, ch );
     
   } 
   
}

/* syntax throw <obj> [direction] [target] */

void do_throw( CHAR_DATA *ch, char *argument )
{
   OBJ_DATA        * obj;
   OBJ_DATA        * tmpobj;
   char              arg[MAX_INPUT_LENGTH];  
   char              arg2[MAX_INPUT_LENGTH];
   char              arg3[MAX_INPUT_LENGTH];
   sh_int            dir;
   EXIT_DATA       * pexit;
   ROOM_INDEX_DATA * was_in_room;
   ROOM_INDEX_DATA * to_room;
   CHAR_DATA       * victim;
   char              buf[MAX_STRING_LENGTH];


   argument = one_argument( argument, arg );
   argument = one_argument( argument, arg2 );
   argument = one_argument( argument, arg3 );
   
   was_in_room = ch->in_room;
      
   if ( arg[0] == '\0' )
   {
     send_to_char( "Usage: throw <object> [direction] [target]\n\r", ch );
     return;
   }

     
   obj = get_eq_char( ch, WEAR_MISSILE_WIELD );
   if ( !obj || !nifty_is_name( arg, obj->name ) )
      obj = get_eq_char( ch, WEAR_HOLD );
      if ( !obj || !nifty_is_name( arg, obj->name ) )
          obj = get_eq_char( ch, WEAR_WIELD );
          if ( !obj || !nifty_is_name( arg, obj->name ) )
              obj = get_eq_char( ch, WEAR_DUAL_WIELD );
              if ( !obj || !nifty_is_name( arg, obj->name ) )
   if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
      obj = get_eq_char( ch, WEAR_HOLD );
      if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
          obj = get_eq_char( ch, WEAR_WIELD );
          if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
              obj = get_eq_char( ch, WEAR_DUAL_WIELD );
              if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
   {
         ch_printf( ch, "You don't seem to be holding or wielding %s.\n\r", arg );
         return;
   }  

    if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
	act( AT_PLAIN, "You can't throw $p.", ch, obj, NULL, TO_CHAR );
	return;
    }

   if ( ch->position == POS_FIGHTING )
   {
       victim = who_fighting( ch );
       if ( char_died ( victim ) )
           return;
       act( AT_ACTION, "You throw $p at $N.", ch, obj, victim, TO_CHAR );
       act( AT_ACTION, "$n throws $p at $N.", ch, obj, victim, TO_NOTVICT );
       act( AT_ACTION, "$n throw $p at you.", ch, obj, victim, TO_VICT );        
   }
   else if ( arg2[0] == '\0' )
   {
       sprintf( buf, "$n throws %s at the floor." , obj->short_descr );
       act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );  
       ch_printf( ch, "You throw %s at the floor.\n\r", obj->short_descr );
       
       victim = NULL;
   }
   else  if ( ( dir = get_door( arg2 ) ) != -1 )
   {
      if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
      {
         send_to_char( "Are you expecting to throw it through a wall!?\n\r", ch );
         return;
      }

      
      if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
      {
          send_to_char( "Are you expecting to throw it  through a door!?\n\r", ch );
          return;
      }
      
      
      switch ( dir )
      {
        case 0:
        case 1:
           dir += 2;
           break;
        case 2:
        case 3:
           dir -= 2;
           break;
        case 4:
        case 7:
           dir += 1;
           break;
        case 5:
        case 8:
           dir -= 1;
           break;
        case 6:
           dir += 3;
           break;
        case 9:
           dir -=3;
           break;
      }

      to_room = NULL;
      if ( pexit->distance > 1 )
       to_room = generate_exit( ch->in_room , &pexit );
    
      if ( to_room == NULL )
       to_room = pexit->to_room;
    

      char_from_room( ch );
      char_to_room( ch, to_room );    
     
      victim = get_char_room( ch, arg3 );

      if ( victim )
      { 
        if ( is_safe( ch, victim ) )
	return;
    
        if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
        {
        act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
	return;
        }
    
        if ( !IS_NPC( victim ) && IS_SET( ch->act, PLR_NICE ) )
        {
        send_to_char( "You feel too nice to do that!\n\r", ch );
        return;
        }
    
        char_from_room( ch );
        char_to_room( ch, was_in_room );    

      
        if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
        {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "You'll have to do that elswhere.\n\r", ch );
	return;
        }
       
        to_room = NULL;
        if ( pexit->distance > 1 )
           to_room = generate_exit( ch->in_room , &pexit );
    
        if ( to_room == NULL )
           to_room = pexit->to_room;
    
       
        char_from_room( ch );
        char_to_room( ch, to_room );    
        
        sprintf( buf , "Someone throws %s at you from the %s." , obj->short_descr , dir_name[dir] );
        act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );      
        act( AT_ACTION, "You throw %p at $N.", ch, obj, victim, TO_CHAR );         
        sprintf( buf, "%s is thrown at $N from the %s." , obj->short_descr , dir_name[dir] );
        act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );  


      }
      else
      {   
         ch_printf( ch, "You throw %s %s.\n\r", obj->short_descr , dir_name[get_dir( arg2 )] );
         sprintf( buf, "%s is thrown from the %s." , obj->short_descr , dir_name[dir] );
         act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );  

      }
   }
   else if ( ( victim = get_char_room( ch, arg2 ) ) != NULL )
   {
        if ( is_safe( ch, victim ) )
	return;
    
        if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
        {
        act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
	return;
        }
    
        if ( !IS_NPC( victim ) && IS_SET( ch->act, PLR_NICE ) )
        {
        send_to_char( "You feel too nice to do that!\n\r", ch );
        return;
        }

   }
   else
   {
       ch_printf( ch, "They don't seem to be here!\n\r");
       return;         
   }

   
   if ( obj == get_eq_char( ch, WEAR_WIELD )
   && ( tmpobj = get_eq_char( ch, WEAR_DUAL_WIELD)) != NULL )
       tmpobj->wear_loc = WEAR_WIELD;

   unequip_char( ch, obj );
   separate_obj( obj );
   obj_from_char( obj );
   obj = obj_to_room( obj, ch->in_room );
   
   if ( obj->item_type != ITEM_GRENADE )
       damage_obj ( obj );
   
/* NOT NEEDED UNLESS REFERING TO OBJECT AGAIN 

   if( obj_extracted(obj) )
      return;
*/
   if ( ch->in_room !=  was_in_room )
   {
     char_from_room( ch );
     char_to_room( ch, was_in_room );    
   }
   
   if ( !victim || char_died( victim ) )
       learn_from_failure( ch, gsn_throw );
   else
   {

       WAIT_STATE( ch, skill_table[gsn_throw]->beats );
       if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_throw] )
       {
	 learn_from_success( ch, gsn_throw );
	 global_retcode = damage( ch, victim, number_range( obj->weight*2 , (obj->weight*2 + ch->perm_str) ), TYPE_HIT );
       }
       else
       {
	 learn_from_failure( ch, gsn_throw );
	 global_retcode = damage( ch, victim, 0, TYPE_HIT );
       }
    
       if ( IS_NPC( victim ) && !char_died ( victim) )
       {
          if ( IS_SET( victim->act , ACT_SENTINEL ) )
          {
             victim->was_sentinel = victim->in_room;
             REMOVE_BIT( victim->act, ACT_SENTINEL );
          }
      
          start_hating( victim , ch );
          start_hunting( victim, ch );
     
       } 

   }
   
   return;                                   
  
}

void do_beg( CHAR_DATA *ch, char *argument )
{
    char buf  [MAX_STRING_LENGTH];
    char arg1 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    int percent, xp;
    int amount;

    if ( IS_NPC (ch) ) return;
    
    argument = one_argument( argument, arg1 );

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( arg1[0] == '\0' )
    {
	send_to_char( "Beg fo money from whom?\n\r", ch );
	return;
    }

    if ( ms_find_obj(ch) )
	return;

    if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }
    
    if ( victim->position == POS_FIGHTING )
    {
        send_to_char( "They're a little busy right now.\n\r" , ch );
        return;
    }
    
    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }
    
    if ( victim->position <= POS_SLEEPING )
    {
        send_to_char( "You might want to wake them first...\n\r" , ch );
        return;
    }

    if ( !IS_NPC( victim ) )
    {
	send_to_char( "You beg them for money.\n\r", ch );
	act( AT_ACTION, "$n begs you to give $s some change.\n\r", ch, NULL, victim, TO_VICT    );
	act( AT_ACTION, "$n begs $N for change.\n\r",  ch, NULL, victim, TO_NOTVICT );
	return;
    }
    
    WAIT_STATE( ch, skill_table[gsn_beg]->beats );
    percent  = number_percent( ) + ch->skill_level[SMUGGLING_ABILITY] + victim->top_level;

    if ( percent > ch->pcdata->learned[gsn_beg]  ) 
    {
	/*
	 * Failure.
	 */
	send_to_char( "You beg them for money but don't get any!\n\r", ch );
	act( AT_ACTION, "$n is really getting on your nerves with all this begging!\n\r", ch, NULL, victim, TO_VICT    );
	act( AT_ACTION, "$n begs $N for money.\n\r",  ch, NULL, victim, TO_NOTVICT );

        if ( victim->alignment < 0 && victim->top_level >= ch->top_level+5 )
	{
	  sprintf( buf, "%s is an annoying beggar and needs to be taught a lesson!", ch->name );
	  do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
	}
	
	learn_from_failure( ch, gsn_beg );

	return;
    }

    
    act( AT_ACTION, "$n begs $N for money.\n\r",  ch, NULL, victim, TO_NOTVICT );
    act( AT_ACTION, "$n begs you for money!\n\r", ch, NULL, victim, TO_VICT    );

    amount = UMIN( victim->gold , number_range(1, 10) );
    if ( amount <= 0 )
    {
        do_look( victim , ch->name );
	do_say( victim , "Sorry I have nothing to spare.\n\r" );
	learn_from_failure( ch, gsn_beg );
	return;
    }

	ch->gold     += amount;
	victim->gold -= amount;
	ch_printf( ch, "%s gives you %d credits.\n\r", victim->short_descr , amount );
	learn_from_success( ch, gsn_beg );
	xp = UMIN( amount*10 , ( exp_level( ch->skill_level[SMUGGLING_ABILITY]+1) - exp_level( ch->skill_level[SMUGGLING_ABILITY])  )  );    
        xp = UMIN( xp , xp_compute( ch, victim ) );
        gain_exp( ch, xp, SMUGGLING_ABILITY );  
        ch_printf( ch, "&WYou gain %ld smuggling experience points!\n\r", xp );
        act( AT_ACTION, "$N gives $n some money.\n\r",  ch, NULL, victim, TO_NOTVICT );
        act( AT_ACTION, "You give $n some money.\n\r", ch, NULL, victim, TO_VICT    );

	return;

}

void do_pickshiplock( CHAR_DATA *ch, char *argument )
{
   do_pick( ch, argument );
}

void do_hijack( CHAR_DATA *ch, char *argument )
{
    int chance; 
    SHIP_DATA *ship;
    char buf[MAX_STRING_LENGTH];
    char buf2[MAX_STRING_LENGTH];
    CHAR_DATA *p, *p_prev, *victim;


    	        if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    	        {
    	            send_to_char("&RYou must be in the cockpit of a ship to do that!\n\r",ch);
    	            return;
    	        }

    	        if ( ship->class > SHIP_PLATFORM )
    	        {
    	            send_to_char("&RThis isn't a spacecraft!\n\r",ch);
    	            return;
    	        }
    	        
    	        if ( (ship = ship_from_pilotseat(ch->in_room->vnum)) == NULL )  
    	        {
    	            send_to_char("&RYou don't seem to be in the pilot seat!\n\r",ch);
    	            return;
    	        }
    	        
    	        if ( check_pilot( ch , ship ) )
    	        {
    	            send_to_char("&RWhat would be the point of that!\n\r",ch);
    	            return;
    	        }

    	        if ( ship->type == MOB_SHIP && get_trust(ch) < 102 )
    	        {
    	            send_to_char("&RThis ship isn't pilotable by mortals at this point in time...\n\r",ch);
    	            return;
    	        }
    	        
                if  ( ship->class == SHIP_PLATFORM )
                {
                   send_to_char( "You can't do that here.\n\r" , ch );
                   return;
                }
    
    	        if ( ship->lastdoc != ship->location )
                {
                     send_to_char("&rYou don't seem to be docked right now.\n\r",ch);
                     return;
                }
    
    	        if ( ship->shipstate != SHIP_LANDED && ship->shipstate != SHIP_DISABLED )
    	        {
    	            send_to_char("The ship is not docked right now.\n\r",ch);
    	            return;
    	        }
                
                if ( ship->shipstate == SHIP_DISABLED )
    	        {
    	            send_to_char("The ships drive is disabled .\n\r",ch);
    	            return;
    	        }
                
                chance = IS_NPC(ch) ? ch->top_level
	                 : (int)  (ch->pcdata->learned[gsn_hijack]) ;
                if ( number_percent( ) > chance )
    		{  
    		    send_to_char("You fail to figure out the correct launch code.\n\r",ch);
                   learn_from_failure( ch, gsn_hijack );
    	            return;
                }
                
    	        if ( ship->class == FIGHTER_SHIP )
                    chance = IS_NPC(ch) ? ch->top_level
	                 : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
                if ( ship->class == MIDSIZE_SHIP )
                    chance = IS_NPC(ch) ? ch->top_level
	                 : (int)  (ch->pcdata->learned[gsn_midships]) ;
                if ( ship->class == CAPITAL_SHIP )
                    chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_capitalships]);
                if ( number_percent( ) < chance )
    		{  
                
    		   if (ship->hatchopen)
    		   {
    		     ship->hatchopen = FALSE;
    		     sprintf( buf , "The hatch on %s closes." , ship->name);
       	             echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
       	             echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch slides shut." );
       	           }
    		   set_char_color( AT_GREEN, ch );
    		   send_to_char( "Launch sequence initiated.\n\r", ch);
    		   act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
		        NULL, argument , TO_ROOM );
		   echo_to_ship( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
    		   sprintf( buf, "%s begins to launch.", ship->name );
    		   echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
    		   ship->shipstate = SHIP_LAUNCH;
    		   ship->currspeed = ship->realspeed;
    		   if ( ship->class == FIGHTER_SHIP )
                      learn_from_success( ch, gsn_starfighters );
                   if ( ship->class == MIDSIZE_SHIP )
                      learn_from_success( ch, gsn_midships );
                   if ( ship->class == CAPITAL_SHIP )
                      learn_from_success( ch, gsn_capitalships );

                   learn_from_success( ch, gsn_hijack );

       		for (p = last_char; p ; p = p_prev )

		{
			p_prev = p->prev;  /* TRI */
			if (!IS_NPC(p) && get_trust(p) >= LEVEL_GOD)
                        {
                          sprintf( buf2, "%s(%s)", ship->name, ship->personalname );
                          ch_printf(p, "&R[alarm] %s has been hijacked by %s!\n\r", buf2, ch->name);
                        }
        }

            if ( ship->alarm == 0 )
                return;
                if ( !str_cmp("Public",ship->owner) )
                    return;
             for ( victim = first_char; victim; victim = victim->next )
            {
                bool victim_comlink;
                OBJ_DATA *obj;

                if ( !check_pilot(victim,ship) )
                    continue;

                victim_comlink = FALSE;
                if ( IS_IMMORTAL(victim) )
                    victim_comlink = TRUE;
                for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
                {
                    if ( obj->pIndexData->item_type == ITEM_COMLINK )
                        victim_comlink = TRUE;
                }
                if ( !victim_comlink )
                    continue;

                if ( !IS_NPC( victim ) && victim->switched )
                    continue;

                if ( !IS_AWAKE(victim) || IS_SET(victim->in_room->room_flags,ROOM_SILENCE) )
                    continue;

                ch_printf(victim,"&R[alarm] %s has been hijacked!\n\r",ship->name);

            }

                   return;
                }
                set_char_color( AT_RED, ch );
	        send_to_char("You fail to work the controls properly!\n\r",ch);
	        if ( ship->class == FIGHTER_SHIP )
                    learn_from_failure( ch, gsn_starfighters );
                if ( ship->class == MIDSIZE_SHIP )
    	            learn_from_failure( ch, gsn_midships );
                if ( ship->class == CAPITAL_SHIP )
                    learn_from_failure( ch, gsn_capitalships );
    	   	return;	
    	
}

void do_add_patrol ( CHAR_DATA *ch , char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    int chance, credits;
    
    if ( IS_NPC( ch ) || !ch->pcdata )
    	return;

    strcpy( arg, argument );    
    
    switch( ch->substate )
    { 
    	default:
    	        if ( ch->backup_wait )
    	        {
    	            send_to_char( "&RYou already have backup coming.\n\r", ch );
    	            return;
    	        }
    	        
    	        if ( !ch->pcdata->clan )
    	        {
    	            send_to_char( "&RYou need to be a member of an organization before you can call for a guard.\n\r", ch );
    	            return;
    	        }    
    	        
    	        if ( ch->gold < ch->skill_level[LEADERSHIP_ABILITY] * 30 )
    	        {
    	            ch_printf( ch, "&RYou dont have enough credits.\n\r", ch );
    	            return;
    	        }    
    	        
    	        chance = (int) (ch->pcdata->learned[gsn_addpatrol]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin making the call for reinforcements.\n\r", ch);
    		   act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 1 , do_add_patrol , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou call for a guard but nobody answers.\n\r",ch);
	        learn_from_failure( ch, gsn_addpatrol );
    	   	return;
    	
    	case 1:
    		if ( !ch->dest_buf )
    		   return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted before you can finish your call.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    send_to_char( "&GYour guard is on the way.\n\r", ch);
    
    credits = ch->skill_level[LEADERSHIP_ABILITY] * 30;
    ch_printf( ch, "It cost you %d credits.\n\r", credits);
    ch->gold -= UMIN( credits , ch->gold );

    learn_from_success( ch, gsn_addpatrol );
    
    if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_IMP_PATROL;
    else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_NR_PATROL;
    else
       ch->backup_mob = MOB_VNUM_MERC_PATROL;

    ch->backup_wait = 1;

}


void do_special_forces ( CHAR_DATA *ch , char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    int chance, credits;
    
    if ( IS_NPC( ch ) || !ch->pcdata )
    	return;
    	
    strcpy( arg, argument );    
    
    switch( ch->substate )
    { 
    	default:
    	        if ( ch->backup_wait )
    	        {
    	            send_to_char( "&RYour reinforcements are already on the way.\n\r", ch );
    	            return;
    	        }

    	        if ( !ch->pcdata->clan )
    	        {
    	            send_to_char( "&RYou need to be a member of an organization before you can call for reinforcements.\n\r", ch );
    	            return;
    	        }

    	        if ( ch->gold < ch->skill_level[LEADERSHIP_ABILITY] * 350 )
    	        {
    	            ch_printf( ch, "&RYou dont have enough credits to send for reinforcements.\n\r" );
    	            return;
    	        }

    	        chance = (int) (ch->pcdata->learned[gsn_specialforces]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin making the call for reinforcements.\n\r", ch);
    		   act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 1 , do_special_forces , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou call for reinforcements but nobody answers.\n\r",ch);
	        learn_from_failure( ch, gsn_specialforces );
    	   	return;

    	case 1:
    		if ( !ch->dest_buf )
    		   return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;

    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;
    	        send_to_char("&RYou are interupted before you can finish your call.\n\r", ch);
    	        return;
    }

    ch->substate = SUB_NONE;

    send_to_char( "&GYour reinforcements are on the way.\n\r", ch);
    credits = ch->skill_level[LEADERSHIP_ABILITY] * 350;
    ch_printf( ch, "It cost you %d credits.\n\r", credits);
    ch->gold -= UMIN( credits , ch->gold );

    learn_from_success( ch, gsn_specialforces );

    if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_IMP_FORCES;
    else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_NR_FORCES;
    else
       ch->backup_mob = MOB_VNUM_MERC_FORCES;

    ch->backup_wait = number_range(1,2);

}


void do_elite_guard ( CHAR_DATA *ch , char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    int chance, credits;
    
    if ( IS_NPC( ch ) || !ch->pcdata )
    	return;

    strcpy( arg, argument );

    switch( ch->substate )
    {
    	default:
    	        if ( ch->backup_wait )
    	        {
    	            send_to_char( "&RYou already have backup coming.\n\r", ch );
    	            return;
    	        }

    	        if ( !ch->pcdata->clan )
    	        {
    	            send_to_char( "&RYou need to be a member of an organization before you can call for a guard.\n\r", ch );
    	            return;
    	        }

    	        if ( ch->gold < ch->skill_level[LEADERSHIP_ABILITY] * 200 )
    	        {
    	            ch_printf( ch, "&RYou dont have enough credits.\n\r", ch );
    	            return;
    	        }

    	        chance = (int) (ch->pcdata->learned[gsn_eliteguard]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin making the call for reinforcements.\n\r", ch);
    		   act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 1 , do_elite_guard , 1 );
    		   ch->dest_buf = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou call for a guard but nobody answers.\n\r",ch);
	        learn_from_failure( ch, gsn_eliteguard );
    	   	return;

    	case 1:
    		if ( !ch->dest_buf )
    		   return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;

    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;
    	        send_to_char("&RYou are interupted before you can finish your call.\n\r", ch);
    	        return;
    }

    ch->substate = SUB_NONE;

    send_to_char( "&GYour guard is on the way.\n\r", ch);

    credits = ch->skill_level[LEADERSHIP_ABILITY] * 200;
    ch_printf( ch, "It cost you %d credits.\n\r", credits);
    ch->gold -= UMIN( credits , ch->gold );

    learn_from_success( ch, gsn_eliteguard );

    if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_IMP_ELITE;
    else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
       ch->backup_mob = MOB_VNUM_NR_ELITE;
    else
       ch->backup_mob = MOB_VNUM_MERC_ELITE;

    ch->backup_wait = 1;

}

void do_unjail ( CHAR_DATA *ch , char *argument )
{
    CHAR_DATA *victim =NULL;
    char arg[MAX_INPUT_LENGTH];

    argument = one_argument(argument, arg);
    
    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }
    
    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_NPC(victim) )
    {
	send_to_char( "That would be a waste of time.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }
    
    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }

    if ( victim->in_room->vnum == 6)
    {
      send_to_char( "Only an immortal can unhell someone.\n\r", ch );
      return;
    }  	
    send_to_char( "Jail restrictions released.\n\r", ch );
    victim->pcdata->jail_vnum = 0;
    victim->pcdata->release_date = 0;
    return;
}
void do_jail ( CHAR_DATA *ch , char *argument )
{
    CHAR_DATA *victim =NULL;
    CLAN_DATA   *clan =NULL;
    ROOM_INDEX_DATA *jail =NULL;
    char arg[MAX_INPUT_LENGTH];
    sh_int time;
    bool h_d = FALSE;
    struct tm *tms;

  argument = one_argument(argument, arg);
    
    if ( IS_NPC (ch) ) return;
    
    if ( !ch->pcdata || ( clan = ch->pcdata->clan ) == NULL )
    {
	send_to_char( "Only members of organizations can jail their enemies.\n\r", ch );
	return;
    }

    jail = get_room_index( clan->jail );
    if ( !jail && clan->mainclan )
       jail = get_room_index( clan->mainclan->jail );
    
    if ( !jail )
    {
	send_to_char( "Your orginization does not have a suitable prison.\n\r", ch );
	return;
    }

    if ( jail->area && ch->in_room->area 
    && jail->area != ch->in_room->area &&
    ( !jail->area->planet || jail->area->planet != ch->in_room->area->planet ) )
    {
         send_to_char( "Your organizations prison is to far away.\n\r", ch );
	 return;
    }
        
    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( arg[0] == '\0' )
    {
	send_to_char( "Jail who?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_NPC(victim) )
    {
	send_to_char( "That would be a waste of time.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }
    
    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }
    
  argument = one_argument(argument, arg);
  if ( !*arg || !is_number(arg) )
  {
    send_to_char( "Jail them for how long?\n\r", ch );
    return;
  }

  time = atoi(arg);
  if ( time < 0 )
  {
    send_to_char( "You cannot hell for negative time.\n\r", ch );
    return;
  }
  time = atoi(arg);
  if ( time == 0 && victim->in_room->vnum != 6)
  {
    send_to_char( "Jail restrictions released.\n\r", ch );
    victim->pcdata->jail_vnum = 0;
    victim->pcdata->release_date = 0;
    return;
  }

  if ( victim->position >= POS_SLEEPING )
  {
      send_to_char( "You will have to stun them first.\n\r" , ch );
      return;
  }


  argument = one_argument(argument, arg);
  if ( !*arg || !str_prefix(arg, "hours") )
    h_d = TRUE;
  else if ( str_prefix(arg, "days") )
  {
    send_to_char( "Is that value in hours or days?\n\r", ch );
    return;
  }
  else if ( time > 30 )
  {
    send_to_char( "You may not hell a person for more than 30 days at a time.\n\r", ch );
    return;
  }
  tms = localtime(&current_time);
  if ( h_d )
    tms->tm_hour += time;
  else
    tms->tm_mday += time;
  victim->pcdata->release_date = mktime(tms);
  victim->pcdata->helled_by = STRALLOC(ch->name);
  victim->pcdata->jail_vnum = jail->vnum;
  ch_printf(ch, "%s will be released from jail at %24.24s.\n\r", victim->name,
          ctime(&victim->pcdata->release_date));
  act(AT_MAGIC, "$n is dragged away.", victim, NULL, ch, TO_NOTVICT);
  char_from_room(victim);
    char_to_room ( victim , jail );
  act(AT_MAGIC, "$n is dragged in.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  ch_printf(victim, "Whoops. You broke too many laws.\n\r"
          "You shall remain in jail for %d %s%s.\n\r", time,
          (h_d ? "hour" : "day"), (time == 1 ? "" : "s"));
  save_char_obj(victim);	/* used to save ch, fixed by Thoric 09/17/96 */

  learn_from_success( ch , gsn_jail );

  return;
}

void do_smalltalk ( CHAR_DATA *ch , char *argument )
{
    char buf  [MAX_STRING_LENGTH];
    char arg1 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim = NULL;
    PLANET_DATA *planet = NULL;
    CLAN_DATA   *clan = NULL;
    int percent = 0;
    
   if ( IS_NPC(ch) || !ch->pcdata )
   {
       send_to_char( "What would be the point of that.\n\r", ch );
   }
    
    argument = one_argument( argument, arg1 );

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( arg1[0] == '\0' )
    {
	send_to_char( "Create smalltalk with whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }
    
    if ( victim->position == POS_FIGHTING )
    {
        send_to_char( "They're a little busy right now.\n\r" , ch );
        return;
    }
    

    if ( !IS_NPC(victim) || victim->vip_flags == 0 )
    {
        send_to_char( "Diplomacy would be wasted on them.\n\r" , ch );
        return;
    }
    
    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }
    
    if ( victim->position <= POS_SLEEPING )
    {
        send_to_char( "You might want to wake them first...\n\r" , ch );
        return;
    }

    WAIT_STATE( ch, skill_table[gsn_smalltalk]->beats );

    if ( percent - ch->skill_level[DIPLOMACY_ABILITY] + victim->top_level > ch->pcdata->learned[gsn_smalltalk]  ) 
    {
	/*
	 * Failure.
	 */
	send_to_char( "You attempt to make smalltalk with them.. but are ignored.\n\r", ch );
	act( AT_ACTION, "$n is really getting on your nerves with all this chatter!\n\r", ch, NULL, victim, TO_VICT    );
	act( AT_ACTION, "$n asks $N about the weather but is ignored.\n\r",  ch, NULL, victim, TO_NOTVICT );

        if ( victim->alignment < -500 && victim->top_level >= ch->top_level+5 )
	{
	  sprintf( buf, "SHUT UP %s!", ch->name );
	  do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
	}
	
	return;
    }
    
    send_to_char( "You strike up a short conversation with them.\n\r", ch );
    act( AT_ACTION, "$n smiles at you and says, 'hello'.\n\r", ch, NULL, victim, TO_VICT    );
    act( AT_ACTION, "$n chats briefly with $N.\n\r",  ch, NULL, victim, TO_NOTVICT );
    
    if ( IS_NPC(ch) || !ch->pcdata || !ch->pcdata->clan || !ch->in_room->area || !ch->in_room->area->planet )
      return;

    if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
       clan = ch->pcdata->clan;

    planet = ch->in_room->area->planet;

    if ( clan != planet->governed_by )
       return;

    planet->pop_support += 0.2;
    send_to_char( "Popular support for your organization increases slightly.\n\r", ch );

    gain_exp(ch, victim->top_level*10, DIPLOMACY_ABILITY);
    ch_printf( ch , "You gain %d diplomacy experience.\n\r", victim->top_level*10 );

    learn_from_success( ch, gsn_smalltalk );
        
    if ( planet->pop_support > 100 )
        planet->pop_support = 100;
}

void do_propeganda ( CHAR_DATA *ch , char *argument )
{
    char buf  [MAX_STRING_LENGTH];
    char arg1 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    PLANET_DATA *planet;
    CLAN_DATA   *clan;

   if ( IS_NPC(ch) || !ch->pcdata || !ch->in_room->area || !ch->in_room->area->planet || !ch->pcdata->clan)
   {
       send_to_char( "What would be the point of that.\n\r", ch );
       return;
   }

   planet = ch->in_room->area->planet;
    argument = one_argument( argument, arg1 );

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( arg1[0] == '\0' )
    {
	send_to_char( "Spread propeganda to who?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }

    if ( victim->position == POS_FIGHTING )
    {
        send_to_char( "They're a little busy right now.\n\r" , ch );
        return;
    }


    if ( victim->vip_flags == 0 )
    {
        send_to_char( "Diplomacy would be wasted on them.\n\r" , ch );
        return;
    }

    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }

    if ( victim->position <= POS_SLEEPING )
    {
        send_to_char( "You might want to wake them first...\n\r" , ch );
        return;
    }

    if ( !ch->pcdata->clan )
    {
      sprintf( buf, "You speak to them about the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
    ch_printf( ch, buf );
    act( AT_ACTION, "$n speaks about the planets organization.\n\r", ch, NULL, victim, TO_VICT    );
    act( AT_ACTION, "$n tells $N about the evils of their organization.\n\r",  ch, NULL, victim, TO_NOTVICT );
    }
   if ( ch->pcdata->clan )
   {
    if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
       clan = ch->pcdata->clan;

    planet = ch->in_room->area->planet;

    sprintf( buf, ", and the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
    ch_printf( ch, "You speak to them about the benifits of the %s%s.\n\r", ch->pcdata->clan->name,
        planet->governed_by == clan ? "" : buf );
    act( AT_ACTION, "$n speaks about his organization.\n\r", ch, NULL, victim, TO_VICT    );
    act( AT_ACTION, "$n tells $N about their organization.\n\r",  ch, NULL, victim, TO_NOTVICT );
   }
    WAIT_STATE( ch, skill_table[gsn_propeganda]->beats );

    if ( victim->top_level - get_curr_cha(ch) > ch->pcdata->learned[gsn_propeganda]  )
    {

        if ( (ch->pcdata->clan) ? planet->governed_by != clan : TRUE)
	{
	  sprintf( buf, "%s is a traitor!" , ch->name);
	  do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
	}

	return;
    }

    if ( planet->governed_by == clan )
    {
       planet->pop_support += .5 + ch->top_level/50;
       send_to_char( "Popular support for your organization increases.\n\r", ch );
    }
    else
    {
       planet->pop_support -= ch->top_level/50;
       send_to_char( "Popular support for the current government decreases.\n\r", ch );
    }

    gain_exp(ch, victim->top_level*100, DIPLOMACY_ABILITY);
    ch_printf( ch , "You gain %d diplomacy experience.\n\r", victim->top_level*100 );

    learn_from_success( ch, gsn_propeganda );

    if ( planet->pop_support > 100 )
        planet->pop_support = 100;
    if ( planet->pop_support < -100 )
        planet->pop_support = -100;

}

void do_bribe ( CHAR_DATA *ch , char *argument )
{
    char arg1 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    PLANET_DATA *planet;
    CLAN_DATA   *clan;
    int percent = 0;
    int amount = 0;

    if ( IS_NPC(ch) || !ch->pcdata || !ch->pcdata->clan || !ch->in_room->area || !ch->in_room->area->planet )
    {
      send_to_char( "What would be the point of that.\n\r", ch );
      return;
    }
    
    argument = one_argument( argument, arg1 );

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( argument[0] == '\0' )
    {
	send_to_char( "Bribe who how much?\n\r", ch );
	return;
    }

    amount = atoi( argument );

    if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( amount <= 0 )
    {
       	send_to_char( "A little bit more money would be a good plan.\n\r", ch );
	return;
    }
    
    if ( ch->gold < amount )
    {
        send_to_char( "Try getting that amount first.\n\r" , ch );
    return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }
    
    if ( victim->position == POS_FIGHTING )
    {
        send_to_char( "They're a little busy right now.\n\r" , ch );
        return;
    }
    
    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }
    
    if ( victim->position <= POS_SLEEPING )
    {
        send_to_char( "You might want to wake them first...\n\r" , ch );
        return;
    }

    if ( victim->vip_flags == 0 )
    {
        send_to_char( "Diplomacy would be wasted on them.\n\r" , ch );
        return;
    }
    
    ch->gold -= amount;
    victim->gold += amount;

	ch_printf( ch, "You give them a small gift on behalf of %s.\n\r", ch->pcdata->clan->name );
	act( AT_ACTION, "$n offers you a small bribe.\n\r", ch, NULL, victim, TO_VICT    );
	act( AT_ACTION, "$n gives $N some money.\n\r",  ch, NULL, victim, TO_NOTVICT );

    if ( !IS_NPC( victim ) )
	return;
    
    WAIT_STATE( ch, skill_table[gsn_bribe]->beats );

    if ( percent - amount + victim->top_level > ch->pcdata->learned[gsn_bribe]  ) 
        return;
            
    if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
       clan = ch->pcdata->clan;
       
    planet = ch->in_room->area->planet;
    
    
    if ( clan == planet->governed_by )
    {
      planet->pop_support += URANGE( 0.1 , amount/1000 , 2 );
      send_to_char( "Popular support for your organization increases slightly.\n\r", ch );

      amount = UMIN( amount ,( exp_level(ch->skill_level[DIPLOMACY_ABILITY]+1) - exp_level(ch->skill_level[DIPLOMACY_ABILITY]) ) );

      gain_exp(ch, amount , DIPLOMACY_ABILITY);
      ch_printf( ch , "You gain %d diplomacy experience.\n\r", amount );

      learn_from_success( ch, gsn_bribe );
    }

    if ( planet->pop_support > 100 )
        planet->pop_support = 100;
}

void do_seduce ( CHAR_DATA *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
  {
	 send_to_char( "Seduce whom?\n\r", ch );
	 return;
  }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
  {
	 send_to_char( "They aren't here.\n\r", ch );
	 return;
  }


  if ( IS_AFFECTED(victim, AFF_CHARM) && victim->master )
  {
	 act( AT_PLAIN, "But he'd rather follow $N!", ch, NULL, victim->master, TO_CHAR );
	 return;
  }

      if ( circle_follow( victim, ch ) )
    {
	send_to_char( "Following in loops is not allowed... sorry.\n\r", ch );
	return;
    }


    WAIT_STATE( ch, skill_table[gsn_seduce]->beats );

    if ( victim->top_level - get_curr_cha(ch) > ch->pcdata->learned[gsn_seduce] )
    {
      send_to_char("You failed.\n\r", ch);
      sprintf(buf, "%s failed to seduce you.", ch->name);
      send_to_char(buf, victim);
      global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
      return;
	}


    if ( victim->master )
	stop_follower( victim );

   learn_from_success( ch, gsn_seduce );

    add_follower( victim, ch );
    return;

}

void do_mass_propeganda ( CHAR_DATA *ch , char *argument )
{
    char buf  [MAX_STRING_LENGTH];
    char arg1 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    PLANET_DATA *planet;
    CLAN_DATA   *clan;
    int percent = 0;
    
   if ( IS_NPC(ch) || !ch->pcdata || !ch->pcdata->clan || !ch->in_room->area || !ch->in_room->area->planet )
   {
       send_to_char( "What would be the point of that.\n\r", ch );
       return;
   }
    
    argument = one_argument( argument, arg1 );

    if ( arg1[0] == '\0' )
    {
	send_to_char( "Spread propeganda to who?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( ch->position == POS_FIGHTING )
    {
        send_to_char( "Interesting combat technique.\n\r" , ch );
        return;
    }
    
    if ( victim->position == POS_FIGHTING )
    {
        send_to_char( "They're a little busy right now.\n\r" , ch );
        return;
    }
    

    if ( victim->vip_flags == 0 )
    {
        send_to_char( "Diplomacy would be wasted on them.\n\r" , ch );
        return;
    }
    
    if ( ch->position <= POS_SLEEPING )
    {
        send_to_char( "In your dreams or what?\n\r" , ch );
        return;
    }
    
    if ( victim->position <= POS_SLEEPING )
    {
        send_to_char( "You might want to wake them first...\n\r" , ch );
        return;
    }

    if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
       clan = ch->pcdata->clan;
       
    planet = ch->in_room->area->planet;
        
    sprintf( buf, ", and the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
    ch_printf( ch, "You speak to them about the benifits of the %s%s.\n\r", ch->pcdata->clan->name,
        planet->governed_by == clan ? "" : buf );
    act( AT_ACTION, "$n speaks about his organization.\n\r", ch, NULL, victim, TO_VICT    );
    act( AT_ACTION, "$n tells $N about their organization.\n\r",  ch, NULL, victim, TO_NOTVICT );

    WAIT_STATE( ch, skill_table[gsn_masspropeganda]->beats );

    if ( percent - get_curr_cha(ch) + victim->top_level > ch->pcdata->learned[gsn_masspropeganda]  ) 
    {

        if ( planet->governed_by != clan )
	{
	  sprintf( buf, "%s is a traitor!" , ch->name);
	  do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
	}
	
	return;
    }
    
    if ( planet->governed_by == clan )
    {
       planet->pop_support += (.5 + ch->top_level/50)*((planet->population)/2);
       send_to_char( "Popular support for your organization increases.\n\r", ch );
    }
    else
    {
       planet->pop_support -= (ch->top_level/50)*((planet->population)/2);
       send_to_char( "Popular support for the current government decreases.\n\r", ch );
    }
    
    gain_exp(ch, victim->top_level*100, DIPLOMACY_ABILITY);
    ch_printf( ch , "You gain %d diplomacy experience.\n\r", victim->top_level*100 );
    
    learn_from_success( ch, gsn_masspropeganda );
        
    if ( planet->pop_support > 100 )
        planet->pop_support = 100;
    if ( planet->pop_support < -100 )
        planet->pop_support = -100;

}

void do_gather_intelligence ( CHAR_DATA *ch , char *argument )
{
  CHAR_DATA *victim;

  char buf[MAX_STRING_LENGTH];

  int percent, chance;

  PLANET_DATA *planet;


  buf[0] = '\0';

  if(argument[0] == '\0')

  {

    send_to_char("You must input a name.\n\r", ch);

    return;

  }

    strcat(buf, "0.");

  strcat(buf, argument);


  WAIT_STATE( ch, skill_table[gsn_gather_intelligence]->beats );


  if( ( ( victim = get_char_world(ch, buf) ) == NULL ))

  {

    send_to_char("You fail to gather information on that individual.\n\r", ch);

    return;

  }



  if(IS_NPC(victim))

  {
    send_to_char("This person has not made much of a name for himself!\n\r", ch);
    return;
  }

  percent = number_percent( )*2;

  if ( IS_NPC(ch) || percent < ch->pcdata->learned[gsn_gather_intelligence] )
  {

    if ( ch == victim )
    {
      send_to_char( "I am sure you know enough about yourself right now", ch );
      return;
    }

    learn_from_success( ch, gsn_gather_intelligence );

    chance = number_percent( );

    if ( chance < 25 )
    {
      if ( ( planet = victim->in_room->area->planet ) == NULL )
      {
	     sprintf( buf, "Information has been recieved that %s is travelling.", victim->name );
        send_to_char(buf, ch);
        return;
      }
      else
      {
        sprintf( buf, "Information has been recieved that %s is on %s.", victim->name, planet->name );
        send_to_char(buf, ch);
        return;
      }
      return;
    }
    if ( chance < 30 )
    {
      if ( victim->pcdata->clan )
      {
        sprintf( buf, "%s seems to be involved with %s.", victim->name, victim->pcdata->clan->name );
        send_to_char( buf, ch );
        return;
      }
      else
      {
        sprintf( buf, "%s does not seem to be involved with any organization.", victim->name );
        send_to_char( buf, ch );
        return;
      }
      return;
    }

    if ( chance < 40 )
    {
      if ( victim->hit < ((victim->max_hit)/4) )
      {
        sprintf( buf, "Hospital records show that %s has had a very serious injury and has not fully recovered.", victim->name );
        send_to_char( buf, ch);
        return;
      }
      if ( victim->hit < ((victim->max_hit)/2) )
      {
        sprintf( buf, "Hospital records show that %s has had a serious injury and has begun to recover.", victim->name );
        send_to_char( buf, ch);
        return;
      }
      if ( victim->hit < ((victim->max_hit)) )
      {
        sprintf( buf, "Hospital records show that %s has had a minor injury recently.", victim->name );
        send_to_char( buf, ch);
        return;
      }
      if ( victim->hit == victim->max_hit )
      {
        sprintf( buf, "There has been no recently medical history for %s", victim->name );
        send_to_char( buf, ch);
        return;
      }
      return;
    }

    if ( chance < 50 )
    {
      switch(victim->main_ability)
      {
      case 0:
      sprintf( buf, "%s appears to have centered training on combat.", victim->name );
      break;
      case 1:
      sprintf( buf, "%s appears to have centered training on piloting ships.", victim->name );
      break;
      case 2:
      sprintf( buf, "%s appears to have centered training on engineering.", victim->name );
      break;
      case 3:
      sprintf( buf, "%s appears to have centered training on bounty hunting.", victim->name );
      break;
      case 4:
      sprintf( buf, "%s appears to have centered training on smuggling.",  victim->name );
      break;
      case 5:
      sprintf( buf, "%s appears to have centered training on diplomacy.", victim->name );
      break;
      case 6:
      sprintf( buf, "%s appears to have centered training on leadership.", victim->name );
      break;
      case 7:
      sprintf( buf, "%s appears to have centered attention on studying the force.", victim->name );
      break;
      case 8:
      sprintf( buf, "%s has not centered training on anything, but seems to mix smuggling with piloting abilities.", victim->name );
      break;
      default:
      break;
      }
      send_to_char( buf, ch );
      return;
    }

    if ( chance < 55 )
    {
      if ( victim->skill_level[7] > 1 )
      {
        if ( victim->mana > 1000 )
          sprintf( buf, "%s appears to have centered his attention on studying the force, and is rumored to excell at its use.", victim->name );
        else if ( victim->mana > 200 )
          sprintf( buf, "%s appears to have centered his attention on studying the force, and is rumored to have some skill.", victim->name );
        else
          sprintf( buf, "%s appears to have centered his attention on studying the force, and is rumored to have found some minor ability in it.", victim->name );
      }
        else
          sprintf( buf, "%s appears to have centered his attention on the mundane", victim->name );
        send_to_char( buf, ch );
        return;
    }

    send_to_char ( "You fail to gather information on that individual.", ch );
    return;
  }
  else
  {
    send_to_char ( "You fail to gather information on that individual.", ch );
    return;
  }

}

void do_bind ( CHAR_DATA *ch , char *argument )
{
  CHAR_DATA *victim;
  char logbuf[MAX_STRING_LENGTH];
  
    if ( argument[0] == '\0' )
    {
	send_to_char( "Bind whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, argument ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "Suicide is a mortal sin.\n\r", ch );
	return;
    }

    if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just bound %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }

    if ( is_safe( ch, victim ) )
       return;
        
    if ( IS_AFFECTED(ch, AFF_CHARM) ) 
    {
      if ( ch->master == victim )
      {
        act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
	return;
      }
    }

    if ( ch->position == POS_FIGHTING )
    {
	send_to_char( "You are a little busy!\n\r", ch );
	return;
    }

    ch->alignment -= 10;
    
    WAIT_STATE( ch, 1 * PULSE_VIOLENCE );

    if ( IS_NPC(victim) || number_percent( ) > ch->pcdata->learned[gsn_bind] )
    {
	send_to_char( "You fail.\n\r", ch );
	return;
    }

    if( victim->position != POS_STUNNED )    
      return;

    act( AT_YELLOW, "$n binds you up!",  ch, NULL, victim, TO_VICT    );
    act( AT_YELLOW, "You bind $N up.", ch, NULL, victim, TO_CHAR    );            
    act( AT_BLUE, "$n quickly binds $N, leaving $M helpless!", ch, NULL, victim, TO_NOTVICT );
    aff_paralysis( ch, victim );
    learn_from_success( ch, gsn_bind );
    return;
}    
  

bool aff_paralysis( CHAR_DATA *ch, CHAR_DATA *victim )
{
  AFFECT_DATA af;

  if ( !IS_AFFECTED( victim, AFF_PARALYSIS ) )
  {
  af.type      = gsn_stun;
  af.location  = APPLY_AC;
  af.modifier  = 20;
  af.duration  = 30;
  af.bitvector = AFF_PARALYSIS;
  affect_to_char( victim, &af );
  update_pos( victim );
  if ( IS_NPC(victim) )
   {
      start_hating( victim, ch );
      start_hunting( victim, ch );
      victim->was_stunned = 10;
   }
  }
  return TRUE;
}

void do_cutdoor( CHAR_DATA *ch, char *argument )
{
	CHAR_DATA *gch;
	EXIT_DATA *pexit;
	char       arg [ MAX_INPUT_LENGTH ];
 	OBJ_DATA *wield;
	int whichweap;	
	int SABER = 1;
	int PIKE = 0;

   if ( ( wield = get_eq_char( ch, WEAR_WIELD ) ) == NULL ||
            ( ( wield->value[3] != WEAPON_LIGHTSABER ) && ( wield->value[3] != WEAPON_FORCE_PIKE ) ) )
	{
	    send_to_char( "You need a lightsaber for that!\n\r", ch );
	    return;
	}

   if ( wield->value[3] == WEAPON_LIGHTSABER )
      whichweap = SABER;
   else
      whichweap = PIKE;
	if ( !IS_NPC( ch )
	&& ( (whichweap ? ch->pcdata->learned[gsn_lightsabers] <= 0 : ch->pcdata->learned[gsn_force_pikes] <= 0) || ch->pcdata->learned[gsn_cutdoor] <= 0 ))
	{
	    send_to_char( "You can not use it well enough to cut a door open.\n\r", ch );
	    return;
	}

	one_argument( argument, arg );

	if ( arg[0] == '\0' )
	{
	    send_to_char( "Cut what?\n\r", ch );
	    return;
	}

	if ( ch->fighting )
	{
	    send_to_char( "You can't break off your fight.\n\r", ch );
	    return;
	}

	if ( ( pexit = find_door( ch, arg, FALSE ) ) != NULL )
	{
	    ROOM_INDEX_DATA *to_room;
	    EXIT_DATA       *pexit_rev;
	    int              chance;
	    char	    *keyword;

	    if ( !IS_SET( pexit->exit_info, EX_CLOSED ) )
	    {
		send_to_char( "It is already open.\n\r", ch );
		return;
	    }

	    WAIT_STATE( ch, skill_table[gsn_cutdoor]->beats );

	    if ( IS_SET( pexit->exit_info, EX_SECRET ) )
		keyword = "wall";
	    else
		keyword = pexit->keyword;
	    if ( !IS_NPC(ch) )
		chance = ch->pcdata->learned[gsn_cutdoor] / 2;
	    else
		chance = 90;

	    if ( !IS_SET( pexit->exit_info, EX_BASHPROOF )
	    &&   ch->move >= 15
	    &&   number_percent( ) < ( chance + 4 * ( get_curr_str( ch ) - 19 ) ) )
	    {
		REMOVE_BIT( pexit->exit_info, EX_CLOSED );
		if ( IS_SET( pexit->exit_info, EX_LOCKED ) )
		REMOVE_BIT( pexit->exit_info, EX_LOCKED );
		SET_BIT( pexit->exit_info, EX_BASHED );

		act(AT_SKILL, "You cut open the $d!", ch, NULL, keyword, TO_CHAR );
		act(AT_SKILL, "$n cuts open the $d!",          ch, NULL, keyword, TO_ROOM );
		learn_from_success(ch, gsn_cutdoor);

		if ( (to_room = pexit->to_room) != NULL
		&&   (pexit_rev = pexit->rexit) != NULL
		&&    pexit_rev->to_room	== ch->in_room )
		{
			CHAR_DATA *rch;

			REMOVE_BIT( pexit_rev->exit_info, EX_CLOSED );
			if ( IS_SET( pexit_rev->exit_info, EX_LOCKED ) )
			  REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );
			SET_BIT( pexit_rev->exit_info, EX_BASHED );

			for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
			{
			    act(AT_SKILL, "The $d falls open!",
				rch, NULL, pexit_rev->keyword, TO_CHAR );
			}
		}
		damage( ch, ch, ( ch->max_hit / 20 ), gsn_cutdoor );

	    }
	    else
	    {
		act(AT_SKILL, "You cut at the $d, but you handle it badly and just score it.",
			ch, NULL, keyword, TO_CHAR );
		act(AT_SKILL, "$n cuts at the $d, but just scores it.",
			ch, NULL, keyword, TO_ROOM );
		damage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_cutdoor );
		learn_from_failure(ch, gsn_cutdoor);
	    }
	}    
	else
	{
	    act(AT_SKILL, "You slice at the wall, but just score it.",
		ch, NULL, NULL, TO_CHAR );
	    act(AT_SKILL, "$n cuts at the wall, but just scores it.",
		ch, NULL, NULL, TO_ROOM );
	    damage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_cutdoor );
	    learn_from_failure(ch, gsn_cutdoor);
	}
	if ( !char_died( ch ) )
	   for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
	   {
		 if ( IS_AWAKE( gch )
		 && !gch->fighting
		 && ( IS_NPC( gch ) && !IS_AFFECTED( gch, AFF_CHARM ) )
		 && ( ch->top_level - gch->top_level <= 4 )
		 && number_bits( 2 ) == 0 )
		 multi_hit( gch, ch, TYPE_UNDEFINED );
	   }

        return;
}

void do_makebowcaster( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    bool checktool, checkoven, checkdura, checkbow, checktinder, checkoil, checkammo;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum, power, scope, ammo;
    AFFECT_DATA *paf;
    AFFECT_DATA *paf2;
    
    strcpy( arg , argument );
    
    switch( ch->substate )
    { 
    	default:
    		if ( ch->race != RACE_WOOKIEE )
                {
                  send_to_char( "&ROnly wookiees have the knowledge to craft bowcasters.\n\r&w", ch);
                  return;   
                }
    		
    	        if ( arg[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makebowcaster <name>\n\r&w", ch);
                  return;   
                }

    	        checktool = FALSE;
                checkdura = FALSE;
                checkbow = FALSE;
                checkoven = FALSE;
                checktinder = FALSE;
                checkoil = FALSE;

                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_TOOLKIT)
                    checktool = TRUE;
                  if (obj->item_type == ITEM_DURAPLAST)
          	    checkdura = TRUE;
                  if (obj->item_type == ITEM_CROSSBOW)
                    checkbow = TRUE;
                  if (obj->item_type == ITEM_OVEN)
                    checkoven = TRUE;
                  if (obj->item_type == ITEM_TINDER)
                    checktinder = TRUE;
                  if (obj->item_type == ITEM_OIL)
                    checkoil = TRUE;                  
                }
                
                if ( !checktool )
                {
                   send_to_char( "&RYou need toolkit to make a blaster.\n\r", ch);
                   return;
                }
 
                if ( !checkdura )
                {
                   send_to_char( "&RYou need something to make it out of.\n\r", ch);
                   return;
                }

                if ( !checkoil )
                {
                   send_to_char( "&RYou need something to greeze the wood with.\n\r", ch);
                   return;
                }
                
                if ( !checkoven )
                {
                   send_to_char( "&RYou need a small furnace to heat the plastics.\n\r", ch);
                   return;
                }
                
                if ( !checkbow )
                {
                   send_to_char( "&RYou need a crossbow to start with.\n\r", ch);
                   return;
                }
                
                if ( !checktinder )
                {
                   send_to_char( "&RYou need wood to complete your bowcaster.\n\r", ch);
                   return;
                }
 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_makebowcaster]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a bowcaster.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makebowcaster , 1 );
    		   ch->dest_buf   = str_dup(arg);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_makebowcaster );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makebowcaster]);
    vnum = 10431;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checkammo= FALSE;
    checktool = FALSE;
    checkdura = FALSE;
    checkoil = FALSE;
    checkoven = FALSE;
    checktinder = FALSE;
    checkbow = FALSE;
    power     = 0;
    scope     = 0;
    ammo = 0;
    
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_TOOLKIT)
          checktool = TRUE;
       if (obj->item_type == ITEM_OVEN)
          checkoven = TRUE;
       if (obj->item_type == ITEM_DURAPLAST && checkdura == FALSE)
       {
          checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_BOLT && checkammo == FALSE)
       {
          ammo = obj->value[0];
          checkammo = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_OIL && checkoil == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkoil = TRUE;
       }
       if (obj->item_type == ITEM_LENS && scope < 2)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          scope++;
       }
       if (obj->item_type == ITEM_TINDER && power<4)
       {
          power++;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checktinder = TRUE;
       }
       if (obj->item_type == ITEM_CROSSBOW && checkbow == FALSE)
       {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbow = TRUE;
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_makebowcaster]) ;
                
    if ( number_percent( ) > chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkoil ) || ( !checkoven )  || ( !checktinder ) || ( !checkbow) )
    {
       send_to_char( "&RYou hold up your new bowcaster and aim at a leftover piece of plastic.\n\r", ch);
       send_to_char( "&RYou slowly draw back the bolt and squeeze the trigger hoping for the best...\n\r", ch);
       send_to_char( "&RYour bowcaster backfires destroying the firing mechanism and ruining your work.\n\r", ch);
       learn_from_failure( ch, gsn_makebowcaster );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_WEAPON;
    SET_BIT( obj->wear_flags, ITEM_WIELD );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    obj->weight = 2+level/7;
    STRFREE( obj->name );
    strcpy( buf , arg );
    strcat( buf , " bowcaster");
    obj->name = STRALLOC( buf );
    strcpy( buf, arg );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, " was carefully placed here." );
    obj->description = STRALLOC( buf );
    CREATE( paf, AFFECT_DATA, 1 );
    paf->type               = -1;
    paf->duration           = -1;
    paf->location           = get_atype( "hitroll" );
    paf->modifier           = URANGE( 0, 1+scope, level/30 );
    paf->bitvector          = 0;
    paf->next               = NULL;
    LINK( paf, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
    CREATE( paf2, AFFECT_DATA, 1 );
    paf2->type               = -1;
    paf2->duration           = -1;
    paf2->location           = get_atype( "damroll" );
    paf2->modifier           = URANGE( 0, power, level/30);
    paf2->bitvector          = 0;
    paf2->next               = NULL;
    LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
    ++top_affect;
    obj->value[0] = INIT_WEAPON_CONDITION;       /* condition  */
    obj->value[1] = (int) (level/10+25);      /* min dmg  */
    obj->value[2] = (int) (level/5+25);      /* max dmg  */
    obj->value[3] = WEAPON_BOWCASTER;
    obj->value[4] = ammo;
    obj->value[5] = 250;
    obj->cost = obj->value[2]*50;
                                                                   
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newest bowcaster.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new bowcaster.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
    learn_from_success( ch, gsn_makebowcaster );
}

void do_makedisguise( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    char arg1[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    char sexrace[MAX_INPUT_LENGTH];
    char buf[MAX_STRING_LENGTH];
    int level, chance;
    bool checkneedle, checkfabric, checkhair;
    OBJ_DATA *obj;
    OBJ_INDEX_DATA *pObjIndex;
    int vnum, sex, race;
//  AFFECT_DATA *paf;

    strcpy( arg, argument );

    switch( ch->substate )
    { 
    	default:

    		argument = one_argument( argument, arg1 );
		argument = one_argument( argument, arg2 );

    	        if ( !argument || argument[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
                {
                  send_to_char( "&RUsage: Makedisguise <sex> <race> <name>\n\r&w", ch);
                  return;   
                }

    	        checkneedle = FALSE;
                checkfabric = FALSE;
                checkhair = FALSE;
                
                if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
                {
                   send_to_char( "&RYou need to be in a factory or workshop to do that.\n\r", ch);
                   return;
                }
                
                for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
                {
                  if (obj->item_type == ITEM_THREAD)
                    checkneedle = TRUE;
                  if (obj->item_type == ITEM_DIS_FABRIC)
          	    checkfabric = TRUE;
                  if (obj->item_type == ITEM_HAIR)
                    checkhair = TRUE;
                }
                
                if( (sex = atoi(arg1)) > 2 || sex < 0 )
                {
                   send_to_char( "&RSex choices: 0 neutral, 1 male, 2 female.\n\r", ch);
                   return;
                }
                if( (race = atoi(arg2)) > 33 || sex < 0 )
                {
                   send_to_char( "&RIncorrect race: Help race for options, from 0 to 33.\n\r", ch);
                   return;
                }
                
                if ( !checkneedle )
                {
                   send_to_char( "&RYou need need and thread to make a blaster.\n\r", ch);
                   return;
                }
 
                if ( !checkfabric )
                {
                   send_to_char( "&RYou need something to make it out of.\n\r", ch);
                   return;
                }

//                if ( !checkhair )
//                {
//                   send_to_char( "&RYou need a power source for your blaster.\n\r", ch);
//                   return;
//                }
                
		sprintf( sexrace, "%d", (sex*1000) + race ); 
    	        chance = IS_NPC(ch) ? ch->top_level
	                 : (int) (ch->pcdata->learned[gsn_disguise]);
                if ( number_percent( ) < chance )
    		{
    		   send_to_char( "&GYou begin the long process of making a disguise.\n\r", ch);
    		   act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
		        NULL, argument , TO_ROOM );
		   add_timer ( ch , TIMER_DO_FUN , 25 , do_makedisguise , 1 );
    		   ch->dest_buf   = str_dup(sexrace);
    		   ch->dest_buf_2   = str_dup(argument);
    		   return;
	        }
	        send_to_char("&RYou can't figure out how to fit the parts together.\n\r",ch);
	        learn_from_failure( ch, gsn_disguise );
    	   	return;	
    	
    	case 1: 
    		if ( !ch->dest_buf )
    		     return;
    		strcpy(arg1, ch->dest_buf);
    		DISPOSE( ch->dest_buf);
    		strcpy(arg2, ch->dest_buf_2);
    		DISPOSE( ch->dest_buf_2);
    		break;
    		
    	case SUB_TIMER_DO_ABORT:
    		DISPOSE( ch->dest_buf );
    		ch->substate = SUB_NONE;    		                                   
    	        send_to_char("&RYou are interupted and fail to finish your work.\n\r", ch);
    	        return;
    }
    
    ch->substate = SUB_NONE;


    race = atoi(arg1)%1000;
    sex = atoi(arg1)/1000;
    
    level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_disguise]);
    vnum = 10420;
    
    if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
         send_to_char( "&RThe item you are trying to create is missing from the database.\n\rPlease inform the administration of this error.\n\r", ch );
         return;
    }

    checkneedle = FALSE;
    checkhair = FALSE;
    checkfabric = FALSE;

    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )     
    {
       if (obj->item_type == ITEM_THREAD)
          checkneedle = TRUE;
          
       if (obj->item_type == ITEM_DIS_FABRIC && checkfabric == FALSE)
       {
          checkfabric = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
       if (obj->item_type == ITEM_HAIR && checkhair == FALSE)
       {
          checkhair = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
       }
    }                            
    
    chance = IS_NPC(ch) ? ch->top_level
                : (int) (ch->pcdata->learned[gsn_disguise]) ;
                
    if ( number_percent( ) > chance*2  || ( !checkneedle ) || ( !checkfabric ) )
    {
//     send_to_char( "&RYou hold up your new blaster and aim at a leftover piece of plastic.\n\r", ch);
//     send_to_char( "&RYou slowly squeeze the trigger hoping for the best...\n\r", ch);
       send_to_char( "&RYour blaster backfires destroying your weapon and burning your hand.\n\r", ch);
       learn_from_failure( ch, gsn_disguise );
       return;
    }

    obj = create_object( pObjIndex, level );
    
    obj->item_type = ITEM_DISGUISE;
    SET_BIT( obj->wear_flags, ITEM_DISGUISE );
    SET_BIT( obj->wear_flags, ITEM_TAKE );
    obj->level = level;
    STRFREE( obj->name );
    strcpy( buf , arg2 );
    strcat( buf , " disguise");
    obj->name = STRALLOC( buf );
    strcpy( buf, arg2 );
    STRFREE( obj->short_descr );
    obj->short_descr = STRALLOC( buf );        
    STRFREE( obj->description );
    strcat( buf, argument );
    obj->description = STRALLOC( buf );

    obj->value[0] = INIT_WEAPON_CONDITION;  /* beginning condition  */
    obj->value[1] = INIT_WEAPON_CONDITION;      /* condition */
    obj->value[2] = race;      /* race */
    obj->value[3] = sex;	/* sex */
    obj->cost = 5000;
                                                                   
    obj = obj_to_char( obj, ch );
                                                            
    send_to_char( "&GYou finish your work and hold up your newly created disguise.&w\n\r", ch);
    act( AT_PLAIN, "$n finishes making $s new disguise.", ch,
         NULL, argument , TO_ROOM );
    
    {
         long xpgain;
         
         xpgain = UMIN( obj->cost*50 ,( exp_level(ch->skill_level[ENGINEERING_ABILITY]+1) - exp_level(ch->skill_level[ENGINEERING_ABILITY]) ) );
         gain_exp(ch, xpgain, ENGINEERING_ABILITY);
         ch_printf( ch , "You gain %d engineering experience.", xpgain );
    }
    learn_from_success( ch, gsn_disguise );
}
