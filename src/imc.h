/* IMC2 Freedom Client - Developed by Mud Domain.
 *
 * Copyright 2004-2008 by Roger Libiez ( Samson )
 * Contributions by Johnathan Walker ( Xorith ), Copyright 2004
 * Additional contributions by Jesse Defer ( Garil ), Copyright 2004
 * Additional contributions by Rogel, Copyright 2004
 * Comments and suggestions welcome: http://www.mudbytes.net/imc2-support-forum
 * License terms are available in the imc2freedom.license file.
 */

#ifndef _SWRIP_IMC2_H_
#define _SWRIP_IMC2_H_

typedef struct imc_siteinfo SITEINFO;  /* The given mud :) */
typedef struct imcchar_data IMC_CHARDATA; /* Player flags */

extern SITEINFO *this_imcmud;

bool imc_command_hook( Character * ch, const char *command,
		       const char *argument );
void imc_hotboot( void );
void imc_startup( bool force, socket_t desc, bool connected );
void imc_shutdown( bool reconnect );
void imc_initchar( Character * ch );
bool imc_loadchar( Character * ch, FILE * fp, const char *word );
void imc_savechar( const Character * ch, FILE * fp );
void imc_freechardata( Character * ch );
void imc_loop( void );
socket_t imc_getsocket( SITEINFO* );

#endif
