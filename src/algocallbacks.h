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

#endif
