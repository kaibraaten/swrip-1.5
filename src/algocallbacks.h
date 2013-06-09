/*
 * Misc callback functions that are used with collections
 * and algorithms from the Ceris library.
 */

#ifndef _SWRIP_ALGOCALLBACKS_H_
#define _SWRIP_ALGOCALLBACKS_H_

/*
 * Checks if the character has its PLR_SOUND act flag set, and
 * if so send the message to character.
 *
 * void *element : The recipient of type Character.
 * void *userData : The message to send of type char*
 */
void SendSoundToPlayerCharacter( void *element, void *userData );

/*
 * Sends "The $d opens." to a character via the act() function.
 */
void ShowOpenDoorMessageToCharacter( void *element, void *userData );

/*
 * Sends "The $d closes." to a character via the act() function.
 */
void ShowCloseDoorMessageToCharacter( void *element, void *userData );

/*
 * Attack someone who bashed or cut open a door.
 *
 * void *element : The potential attacker.
 * void *userData : The person who bashed or cut open.
 */
void AttackBasher( void *element, void *userData );

#endif
