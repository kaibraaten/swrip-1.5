/*
 *  New editor code
 *  Author: Cronel (cronel_kal@hotmail.com)
 *  of FrozenMUD (empire.digiunix.net 4000)
 *
 *  Permission to use and distribute this code is granted provided
 *  this header is retained and unaltered, and the distribution
 *  package contains all the original files unmodified.
 *  If you modify this code and use/distribute modified versions
 *  you must give credit to the original author(s).
 */
#ifndef _SWRIP_EDITOR_H_
#define _SWRIP_EDITOR_H_

#include "types.h"

void start_editing( CHAR_DATA *ch, char *data );
void stop_editing( CHAR_DATA *ch );
void edit_buffer( CHAR_DATA *ch, char *argument );
char *copy_buffer( CHAR_DATA *ch );
void set_editor_desc( CHAR_DATA *ch, const char *desc_fmt, ... );

#endif
