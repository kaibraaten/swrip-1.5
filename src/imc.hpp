/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

/* IMC2 Freedom Client - Developed by Mud Domain.
 *
 * Copyright 2004-2008 by Roger Libiez ( Samson )
 * Contributions by Johnathan Walker ( Xorith ), Copyright 2004
 * Additional contributions by Jesse Defer ( Garil ), Copyright 2004
 * Additional contributions by Rogel, Copyright 2004
 * Comments and suggestions welcome: http://www.mudbytes.net/imc2-support-forum
 * License terms are available in the imc2freedom.license file.
 */

#ifndef _SWRIP_IMC2_HPP_
#define _SWRIP_IMC2_HPP_

struct imc_siteinfo;
struct imcchar_data;

using SiteInfo = imc_siteinfo;      /* The given mud :) */
using IMC_CHARDATA = imcchar_data;  /* Player flags     */

extern SiteInfo *this_imcmud;

bool ImcCommandHook( Character * ch, const std::string &command,
                     const std::string &argument );
void ImcCopyover( void );
void ImcStartup( bool force, socket_t desc, bool connected );
void ImcShutdown( bool reconnect );
void ImcInitializeCharacter( Character * ch );
bool ImcLoadCharacter( Character * ch, FILE * fp, const std::string &word );
void ImcSaveCharacter( const Character * ch, FILE * fp );
void ImcFreeCharacter( Character * ch );
void ImcLoop( void );
socket_t ImcGetSocket( SiteInfo* );

struct lua_State;
void ImcSaveCharacter( lua_State *L, const Character *ch );

#endif
