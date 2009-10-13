/***************************************************************************
*                   Star Wars: Rise in Power MUD Codebase                  *
*--------------------------------------------------------------------------*
* SWRiP Code Additions and changes from the SWReality and Smaug Code       *
* copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
*--------------------------------------------------------------------------*
* Star Wars Reality 1.0                                                    *
* copyright (c) 1997, 1998 by Sean Cooper                                  *
* -------------------------------------------------------------------------*
* Starwars and Starwars Names copyright (c) Lucasfilm Ltd.                 *
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
*			 IDENT protocol userid lookup module		   *
****************************************************************************/

/*	Donated to Realms of Despair by Tricops, author unknown.	    */

#if defined( macintosh )
#include <types.h>
#else
#include <sys/types.h>
#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <arpa/telnet.h>
#include <errno.h>
#include <netdb.h>
#include "mud.h"

extern int   maxdesc;
extern int   write   args( ( int fd, char *buf, int nbyte ) );
extern int   read    args( ( int fd, char *buf, int nbyte ) );
extern int   close   args( ( int fd ) );
void  nonblock     args( ( int s ) );
void  start_auth   args( ( struct descriptor_data *d ) );
void  read_auth    args( ( struct descriptor_data *d ) );
void  send_auth    args( ( struct descriptor_data *d ) );

/*
 * Initiate an IDENT commention
 */
void  start_auth( struct descriptor_data *d )
{
   struct  sockaddr_in	 sock;
   struct  servent	*serv;
   int     err, tlen;
   
   d->auth_fd = socket( AF_INET, SOCK_STREAM, 0 );
   err = errno;
   
   if ( d->auth_fd < 0 && err == EAGAIN )
     bug( "Can't allocate fd for authorization check", 0 );
   nonblock( d->auth_fd );
   
   tlen = sizeof( sock );
   getpeername( d->descriptor, ( struct sockaddr * )&sock, &tlen );
   serv = getservbyname( "ident", "tcp" );
   if ( !serv )
     sock.sin_port = htons( 113 );
   else
     sock.sin_port = serv->s_port;
   sock.sin_family = AF_INET;
     
   if ( connect( d->auth_fd, ( struct sockaddr *)&sock, sizeof(sock)) == -1
       && errno != EINPROGRESS )
   {
     /* Identd Denied */
/*     bug( "Unable to verify userid", 9 ); */
     close( d->auth_fd );
     d->auth_fd = -1;
     d->auth_state = 0;
     return;
   }
   
   d->auth_state |= ( FLAG_WRAUTH|FLAG_AUTH ); /* Successful, but not sent */
   if ( d->auth_fd > maxdesc ) maxdesc = d->auth_fd; 
     return;
}

/* send_auth */

void  send_auth( struct descriptor_data *d )
{
    struct  sockaddr_in  us, them;
    char    authbuf[32];
    int     ulen, tlen, z;
    
    tlen = ulen = sizeof( us );
  
    if ( getsockname( d->descriptor, ( struct sockaddr *)&us, &ulen )
    ||   getpeername( d->descriptor, ( struct sockaddr *)&them, &tlen ) )
    {
	bug( "auth getsockname error", 0 );
	goto authsenderr;
    }
  
    /* compose request */
    sprintf( authbuf, "%u , %u\r\n", 
	(unsigned int)ntohs(them.sin_port),
	(unsigned int)ntohs(us.sin_port));
  
    z = write( d->auth_fd, authbuf, strlen( authbuf ) );
  
    if ( z != strlen( authbuf ) )
    {
	if (d->atimes >= 19)
	{
/*	  sprintf( log_buf, "auth request, broken pipe [%d/%d]", z, errno );
	  log_string(log_buf); */
	  perror("send_auth");
	}
	authsenderr:
	close( d->auth_fd );
	if ( d->auth_fd == maxdesc ) maxdesc--; 
	d->auth_fd = -1;
	d->auth_state &= ~FLAG_AUTH;    /* Failure/Continue */
	d->auth_inc = 0;
	if ( d->atimes < 20 ) d->atimes++;
    }
    d->auth_state &= ~FLAG_WRAUTH;  /* Successfully sent request */
    return;
}

/* read_auth */
void  read_auth( struct descriptor_data *d )
{
    char     *s, *t;
    int      len;                    /* length read */
    char     ruser[20], system[8];   /* remote userid */
    u_short  remp = 0, locp = 0;     /* remote port, local port */
   *system = *ruser = '\0';
  
   /*
    * Can't allow any other reads from client fd while waiting on the
    * authfd to return a full valid string.  Use the client's input buffer
    * to buffer the authd reply.  May take more than one read.
    */
   
    if ( ( len = read( d->auth_fd, d->abuf + d->auth_inc,
     			sizeof( d->abuf ) - 1 - d->auth_inc ) ) >= 0 )
    {
	d->auth_inc += len;
	d->abuf[d->auth_inc] = '\0';
    }
    
    if ( ( len > 0 ) && ( d->auth_inc != ( sizeof( d->abuf ) - 1 ) )
    &&   (sscanf( d->abuf, "%hd , %hd : USERID : %*[^:]: %10s",
          &remp, &locp, ruser ) == 3 ) )
    {
	s = rindex( d->abuf, ':');
	*s++ = '\0';
	for ( t = ( rindex( d->abuf, ':' ) + 1 ); *t; t++ )
	  if ( !isspace(*t) )
	    break;
	strncpy( system, t, sizeof( system ) );
      
	for ( t = ruser; *s && ( t < ruser + sizeof( ruser ) ); s++ )
	  if ( !isspace( *s ) && *s != ':' )
	    *t++ = *s;
	*t = '\0';
 
	sprintf( log_buf, "auth reply ok, incoming user: [%s]", ruser );
        log_string_plus( log_buf, LOG_COMM, LEVEL_GOD );
/*      STRFREE(d->user);
      d->user = STRALLOC(ruser);*/
    }
    else if ( len != 0 )
    {
	if (!index( d->abuf, '\n' ) && !index( d->abuf, '\r' ) ) return;
	sprintf( log_buf, "bad auth reply: %s", d->abuf );
	log_string_plus( log_buf, LOG_COMM, LEVEL_GOD );
	ruser[0] = '\0';
    }
    close( d->auth_fd );
    if ( d->auth_fd == maxdesc )
      --maxdesc; 
    d->auth_inc = 0;
    *d->abuf = '\0';
    d->auth_fd = -1;
    d->auth_state = 0;

    if (ruser[0] == '\0' ) 
      strcpy(ruser, "(no auth)" );

    STRFREE(d->user);
    d->user = STRALLOC(ruser);
    return;
}

void nonblock( int s )
{
  if ( fcntl( s, F_SETFL, FNDELAY ) == -1 )
  {
    perror( "Noblock" );
    exit(2);
  }
}

/*
int workaround( struct descriptor_data *d )
{
   BAN_DATA *tmp;
   char *nicnamehost;
   
   sprintf( log_buf, "%s!%s@%s", d->name, d->user, d->host );
   nicknamehost = str_dup( log_buf );
   for ( tmp = ncsa_list; tmp; tmp = tmp->next )
   {
     if ( !match( tmp->user, nicknamehost ) )
     {
       FREE( nicknamehost );
       write_to_descriptor( d->descriptor, "NCSA telnet patch loaded.\n" );
       return 1;
     }
   }
   FREE(nicknamehost);
   return 0;
}
*/
