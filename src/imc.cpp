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

#ifdef __STRICT_ANSI__
/* To include the prototype for various non-ANSI C functions */
#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#endif

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cctype>
#if !defined(_WIN32)
#include <unistd.h>
#endif
#include <cerrno>
#if defined(__OpenBSD__) || defined(__FreeBSD__)
#include <sys/types.h>
#endif
#include <utility/sha256.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "social.hpp"
#include "pcdata.hpp"
#include "log.hpp"

#include <ctime>

#define IMC_BUFF_SIZE 16384

#define IMC_VERSION_STRING "IMC2 Freedom CL-2.2 "
#define IMC_VERSION 2

/* Number of entries to keep in the channel histories */
#define MAX_IMCHISTORY 20
#define MAX_IMCTELLHISTORY 20

/* Remcon: Ask and ye shall receive. */
#define IMC_DIR          DATA_DIR "imc/"

#define IMC_CHANNEL_FILE IMC_DIR "imc.channels"
#define IMC_CONFIG_FILE  IMC_DIR "imc.config"
#define IMC_BAN_FILE     IMC_DIR "imc.ignores"
#define IMC_UCACHE_FILE  IMC_DIR "imc.ucache"
#define IMC_COLOR_FILE   IMC_DIR "imc.color"
#define IMC_HELP_FILE    IMC_DIR "imc.help"
#define IMC_CMD_FILE     IMC_DIR "imc.commands"
#define IMC_HOTBOOT_FILE IMC_DIR "imc.hotboot"
#define IMC_WHO_FILE     IMC_DIR "imc.who"

/* Connection states stuff */
enum imc_constates
  {
    IMC_OFFLINE, IMC_AUTH1, IMC_AUTH2, IMC_ONLINE
  };

typedef enum
  {
    IMCPERM_NOTSET, IMCPERM_NONE, IMCPERM_MORT, IMCPERM_IMM, IMCPERM_ADMIN,
   IMCPERM_IMP
  } imc_permissions;

#define LGST 4096 /* Large String */
#define SMST 1024 /* Small String */

/* Channel flags, only one so far, but you never know when more might be useful
 */
#define IMCCHAN_LOG      (1 <<  0)

/* Player flags */
#define IMC_TELL         (1 <<  0)
#define IMC_DENYTELL     (1 <<  1)
#define IMC_BEEP         (1 <<  2)
#define IMC_DENYBEEP     (1 <<  3)
#define IMC_INVIS        (1 <<  4)
#define IMC_PRIVACY      (1 <<  5)
#define IMC_DENYFINGER   (1 <<  6)
#define IMC_AFK          (1 <<  7)
#define IMC_COLORFLAG    (1 <<  8)
#define IMC_PERMOVERRIDE (1 <<  9)

#define IMCPERM(ch)           (CH_IMCDATA((ch))->imcperm)
#define IMCFLAG(ch)           (CH_IMCDATA((ch))->imcflag)
#define FIRST_IMCIGNORE(ch)   (CH_IMCDATA((ch))->imcfirst_ignore)
#define LAST_IMCIGNORE(ch)    (CH_IMCDATA((ch))->imclast_ignore)
#define IMC_LISTEN(ch)        (CH_IMCDATA((ch))->imc_listen)
#define IMC_DENY(ch)          (CH_IMCDATA((ch))->imc_denied)
#define IMC_RREPLY(ch)        (CH_IMCDATA((ch))->rreply)
#define IMC_RREPLY_NAME(ch)   (CH_IMCDATA((ch))->rreply_name)
#define IMC_EMAIL(ch)         (CH_IMCDATA((ch))->email)
#define IMC_HOMEPAGE(ch)      (CH_IMCDATA((ch))->homepage)
#define IMC_AIM(ch)           (CH_IMCDATA((ch))->aim)
#define IMC_ICQ(ch)           (CH_IMCDATA((ch))->icq)
#define IMC_YAHOO(ch)         (CH_IMCDATA((ch))->yahoo)
#define IMC_MSN(ch)           (CH_IMCDATA((ch))->msn)
#define IMC_COMMENT(ch)       (CH_IMCDATA((ch))->comment)
#define IMCTELLHISTORY(ch,x)  (CH_IMCDATA((ch))->imc_tellhistory[(x)])
#define IMCISINVIS(ch)        ( IsBitSet( IMCFLAG((ch)), IMC_INVIS ) )
#define IMCAFK(ch)            ( IsBitSet( IMCFLAG((ch)), IMC_AFK ) )

#define CH_IMCDATA(ch)           ((ch)->PCData->imcchardata)
#define CH_IMCLEVEL(ch)          ((ch)->TopLevel)
#define CH_IMCNAME(ch)           ((ch)->Name)
#define CH_IMCSEX(ch)            ((ch)->Sex)
#define CH_IMCTITLE(ch)          ((ch)->PCData->Title)
#define SOCIAL_DATA Social
#define CH_IMCRANK(ch)           ((ch)->PCData->Rank)

/* Macro taken from DOTD codebase. Fcloses a file, then nulls its pointer for safety. */
#define IMCFCLOSE(fp)  fclose((fp)); (fp)=NULL;

/*
 * Memory allocation macros.
 */
#define IMCCREATE(result, type, number)                           \
do                                                                \
  {                                                                 \
    if (!((result) = (type *) calloc ((number), sizeof(type))))   \
      {                                                             \
        imclog( "Malloc failure @ %s:%d\n", __FILE__, __LINE__ );   \
        abort();                                                    \
      }                                                             \
  } while(0)

#define IMCRECREATE(result, type, number)                               \
do                                                                      \
  {                                                                       \
    if(!((result) = (type *)realloc((result), sizeof(type) * (number)))) \
      {                                                                    \
	imclog( "Realloc failure @ %s:%d\n", __FILE__, __LINE__ );        \
	abort();                                                          \
      }                                                                    \
  } while(0)

#define IMCDISPOSE(point)     \
do                            \
  {                             \
    if((point))                \
      {                          \
	free((point));          \
	(point) = NULL;         \
      }                          \
  } while(0)

#define IMCSTRALLOC strdup
#define IMCSTRFREE IMCDISPOSE

/* double-linked list handling macros -Thoric ( From the Smaug codebase ) */
/* Updated by Scion 8/6/1999 */
#define IMCLINK(link, first, last, next, prev)  \
do                                              \
  {                                               \
    if ( !(first) )                              \
      {                                            \
	(first) = (link);                         \
	(last) = (link);                          \
      }                                            \
    else                                         \
      (last)->next = (link);                    \
    (link)->next = NULL;                         \
    if ((first) == (link))                       \
      (link)->prev = NULL;                      \
    else                                         \
      (link)->prev = (last);                    \
    (last) = (link);                             \
  } while(0)

#define IMCINSERT(link, insert, first, next, prev)    \
do                                                    \
  {                                                     \
    (link)->prev = (insert)->prev;                     \
    if ( !(insert)->prev )                             \
      (first) = (link);                               \
    else                                               \
      (insert)->prev->next = (link);                  \
    (insert)->prev = (link);                           \
    (link)->next = (insert);                           \
  } while(0)

#define IMCUNLINK(link, first, last, next, prev) \
do                                               \
  {                                                \
    if ( !(link)->prev )                          \
      {                                             \
	(first) = (link)->next;                    \
        if((first))                                \
	  (first)->prev = NULL;                   \
      }                                             \
    else                                          \
      {                                             \
	(link)->prev->next = (link)->next;         \
      }                                             \
    if( !(link)->next )                           \
      {                                             \
	(last) = (link)->prev;                     \
        if((last))                                 \
	  (last)->next = NULL;                    \
      }                                             \
    else                                          \
      {                                             \
	(link)->next->prev = (link)->prev;         \
      }                                             \
  } while(0)

int imcwait;   /* Reconnect timer */
int imcconnect_attempts;   /* How many times have we tried to reconnect? */
unsigned long imc_sequencenumber;   /* sequence# for outgoing packets */
bool imcpacketdebug = false;
bool default_packets_registered = false; /* Cheesy global for a stupid problem!*/
time_t imcucache_clock; /* prune ucache stuff regularly */
time_t imc_time;  /* Current clock time for the client */

/* No real functional difference in alot of this, but double linked lists DO seem to handle better,
* and they look alot neater too. Yes, readability IS important! - Samson */
typedef struct imc_channel IMC_CHANNEL;   /* Channels, both local and non-local*/
typedef struct imc_packet IMC_PACKET;  /* It's a packet! */
typedef struct imc_packet_data IMC_PDATA; /* Extra data fields for packets */
typedef struct imc_remoteinfo REMOTEINFO; /* Information on a mud connected to  IMC */
typedef struct imc_ban_data IMC_BAN;   /* Mud level bans */
typedef struct imc_ignore IMC_IGNORE;  /* Player level ignores */
typedef struct imcucache_data IMCUCACHE_DATA;   /* User cache data for gender targetting socials */
typedef struct imc_color_table IMC_COLOR; /* The Color config */
typedef struct imc_command_table IMC_CMD_DATA;  /* Command table */
typedef struct imc_help_table IMC_HelpFile; /* Help table */
typedef struct imc_cmd_alias IMC_ALIAS;   /* Big, bad, bloated command alias thing */
typedef struct imc_packet_handler IMC_PHANDLER; /* custom packet handlers added dynamically */
typedef struct who_template WHO_TEMPLATE; /* The who templates */

typedef void IMC_FUN( Character * ch, const char *argument );
#define IMC_CMD( name ) static void (name)( Character *ch, const char *argument )

typedef void PACKET_FUN( IMC_PACKET * q, const char *packet );
#define PFUN( name ) static void (name)( IMC_PACKET *q, const char *packet )

static void imclog( const char *format, ... );
static void imcbug( const char *format, ... );
static void imc_printf( Character * ch, const char *fmt, ... );
static void imcPagerPrintf( Character * ch, const char *fmt, ... );
static const char *imc_funcname( IMC_FUN * func );
static IMC_FUN *imc_function( const char *func );
static const char *imc_send_social( Character * ch, const char *argument, int telloption );
static void imc_save_config( void );
static void imc_save_channels( void );

static IMC_CHANNEL *imc_findchannel( const char *name );
static void imc_register_packet_handler( const char *name, PACKET_FUN * func );
static IMC_PACKET *imc_newpacket( const char *from, const char *type, const char *to);
static void imc_addtopacket( IMC_PACKET * p, const char *fmt, ... );
static void imc_write_packet( IMC_PACKET * p );
static char *imc_getData( char *output, const char *key, const char *packet );
static Character *imc_find_user( const char *name );
static char *imc_nameof( const char *src );
static char *imc_mudof( const char *src );
static void imc_send_tell( const char *from, const char *to, const char *txt,
			   int reply );

/* Oh yeah, baby, that raunchy looking Merc structure just got the
 * facelift of the century.
 * Thanks to Thoric and friends for the slick idea.
 */
struct imc_cmd_alias
{
  IMC_ALIAS *next;
  IMC_ALIAS *prev;
  char *Name;
};

struct imc_command_table
{
  IMC_CMD_DATA *next;
  IMC_CMD_DATA *prev;
  IMC_ALIAS *first_alias;
  IMC_ALIAS *last_alias;
  IMC_FUN *function;
  char *Name;
  int level;
  bool connected;
};

struct imc_help_table
{
  IMC_HelpFile *next;
  IMC_HelpFile *prev;
  char *Name;
  char *text;
  int level;
};

struct imc_color_table
{
  IMC_COLOR *next;
  IMC_COLOR *prev;
  char *Name; /* the name of the color */
  char *mudtag;  /* What the mud uses for the raw tag */
  char *imctag;  /* The imc tilde code that represents the mudtag to the network */
};

struct imc_ignore
{
  IMC_IGNORE *next;
  IMC_IGNORE *prev;
  char *Name;
};

struct imcucache_data
{
  IMCUCACHE_DATA *next;
  IMCUCACHE_DATA *prev;
  char *Name;
  time_t time;
  int gender;
};

struct imc_channel
{
  IMC_CHANNEL *next;
  IMC_CHANNEL *prev;
  char *Name; /* name of channel */
  char *owner;   /* owner (singular) of channel */
  char *operators;  /* current operators of channel */
  char *invited;
  char *excluded;
  char *local_name; /* Operational localname */
  char *regformat;
  char *emoteformat;
  char *socformat;
  char *history[MAX_IMCHISTORY];
  long flags;
  short level;
  bool open;
  bool refreshed;
};

struct imc_packet_data
{
  IMC_PDATA *next;
  IMC_PDATA *prev;
  char field[IMC_BUFF_SIZE];
};

struct imc_packet
{
  IMC_PDATA *first_data;
  IMC_PDATA *last_data;
  char from[SMST];
  char to[SMST];
  char type[SMST];
  char route[SMST]; /* This is only used internally and not sent */
};

/* The mud's connection data for the server */
struct imc_siteinfo
{
  char *servername; /* name of server */
  char *rhost;   /* DNS/IP of server */
  char *network; /* Network name of the server, set at keepalive - Samson */
  char *serverpw;   /* server password */
  char *clientpw;   /* client password */
  char *localname;  /* One word localname */
  char *fullname;   /* FULL name of mud */
  char *ihost;   /* host AND port of mud */
  char *email;   /* contact address (email) */
  char *www;  /* homepage */
  char *base; /* The mud's codebase name */
  char *details; /* BRIEF description of mud */
  int iport;  /* The port the mud itself is on */
  int minlevel;  /* Minimum player level */
  int immlevel;  /* Immortal level */
  int adminlevel;   /* Admin level */
  int implevel;  /* Implementor level */
  unsigned short rport;   /* remote port of server */
  bool sha256;   /* Client will support SHA-256 authentication */
  bool sha256pass;  /* Client is using SHA-256 authentication */
  bool autoconnect; /* Do we autoconnect on bootup or not? - Samson */

  /*
   * Conection parameters - These don't save in the config file
   */
  char inbuf[IMC_BUFF_SIZE]; /* input buffer */
  char incomm[IMC_BUFF_SIZE];
  char *outbuf;  /* output buffer */
  char *versionid;  /* Transient version id for the imclist */
  unsigned long outsize;
  int outtop;
  socket_t Desc;   /* descriptor */
  unsigned short state;   /* connection state */
};

struct imc_remoteinfo
{
  REMOTEINFO *next;
  REMOTEINFO *prev;
  char *Name;
  char *version;
  char *network;
  char *path;
  char *url;

  struct
  {
    char *host;
    char *port;
  } remote;

  bool expired;
};

/* A mudwide ban */
struct imc_ban_data
{
  IMC_BAN *next;
  IMC_BAN *prev;
  char *Name;
};

struct imc_packet_handler
{
  IMC_PHANDLER *next;
  IMC_PHANDLER *prev;
  PACKET_FUN *func;
  char *Name;
};

struct who_template
{
  char *head;
  char *plrheader;
  char *immheader;
  char *plrline;
  char *immline;
  char *tail;
  char *Master;
};

struct imcchar_data
{
  IMC_IGNORE *imcfirst_ignore;  /* List of ignored people */
  IMC_IGNORE *imclast_ignore;
  char *rreply;  /* IMC reply-to */
  char *rreply_name;   /* IMC reply-to shown to char */
  char *imc_listen; /* Channels the player is listening to */
  char *imc_denied; /* Channels the player has been denied use of */
  char *imc_tellhistory[MAX_IMCTELLHISTORY];   /* History of received imctells\ - Samson 1-21-04 */
  char *email;   /* Person's email address - for imcfinger - Samson 3-21-04 */
  char *homepage;   /* Person's homepage - Samson 3-21-04 */
  char *aim;  /* Person's AOL Instant Messenger screenname - Samson 3-21-04 */
  char *yahoo;   /* Person's Y! screenname - Samson 3-21-04 */
  char *msn;  /* Person's MSN Messenger screenname - Samson 3-21-04 */
  char *comment; /* Person's personal comment - Samson 3-21-04 */
  long imcflag;  /* Flags set on the player */
  int icq; /* Person's ICQ UIN Number - Samson 3-21-04 */
  int imcperm;   /* Permission level for the player */
};

const char *const imcperm_names[] = {
   "Notset", "None", "Mort", "Imm", "Admin", "Imp"
};

SiteInfo *this_imcmud;
IMC_CHANNEL *first_imc_channel;
IMC_CHANNEL *last_imc_channel;
REMOTEINFO *first_rinfo;
REMOTEINFO *last_rinfo;
IMC_BAN *first_imc_ban;
IMC_BAN *last_imc_ban;
IMCUCACHE_DATA *first_imcucache;
IMCUCACHE_DATA *last_imcucache;
IMC_COLOR *first_imc_color;
IMC_COLOR *last_imc_color;
IMC_CMD_DATA *first_imc_command;
IMC_CMD_DATA *last_imc_command;
IMC_HelpFile *first_imc_help;
IMC_HelpFile *last_imc_help;
IMC_PHANDLER *first_phandler;
IMC_PHANDLER *last_phandler;
WHO_TEMPLATE *whot;

/*******************************************
 * String buffering and logging functions. *
 ******************************************/

/* Generic log function which will route the log messages to the appropriate system logging function */
static void imclog( const char *format, ... )
{
   char buf[LGST], buf2[LGST];
   va_list ap;

   va_start( ap, format );
   vsprintf( buf, format, ap );
   va_end( ap );

   sprintf( buf2, "IMC: %s", buf );

   LogPrintf( buf2 );
}

/* Generic bug logging function which will route the message to the appropriate function that handles bug logs */
static void imcbug( const char *format, ... )
{
  char buf[LGST];
  va_list ap;

  va_start( ap, format );
  vsprintf( buf, format, ap );
  va_end( ap );

  Log->Bug(" IMC: %s", buf);
}

/*
   Original Code from SW:FotE 1.1
   Reworked strrep function. 
   Fixed a few glaring errors. It also will not overrun the bounds of a string.
   -- Xorith
*/
static char *imcstrrep( const char *src, const char *sch, const char *rep )
{
   int lensrc = strlen( src ), lensch = strlen( sch ), lenrep = strlen( rep ), x, y, in_p;
   static char newsrc[LGST];
   bool searching = false;

   newsrc[0] = '\0';

   for( x = 0, in_p = 0; x < lensrc; x++, in_p++ )
   {
      if( src[x] == sch[0] )
      {
         searching = true;
         for( y = 0; y < lensch; y++ )
            if( src[x + y] != sch[y] )
               searching = false;

         if( searching )
         {
            for( y = 0; y < lenrep; y++, in_p++ )
            {
               if( in_p == ( LGST - 1 ) )
               {
                  newsrc[in_p] = '\0';
                  return newsrc;
               }
               if( src[x - 1] == sch[0] )
               {
                  if( rep[0] == '\033' )
                  {
                     if( y < lensch )
                     {
                        if( y == 0 )
                           newsrc[in_p - 1] = sch[y];
                        else
                           newsrc[in_p] = sch[y];
                     }
                     else
                        y = lenrep;
                  }
                  else
                  {
                     if( y == 0 )
                        newsrc[in_p - 1] = rep[y];
                     newsrc[in_p] = rep[y];
                  }
               }
               else
                  newsrc[in_p] = rep[y];
            }
            x += lensch - 1;
            in_p--;
            searching = false;
            continue;
         }
      }
      if( in_p == ( LGST - 1 ) )
      {
         newsrc[in_p] = '\0';
         return newsrc;
      }
      newsrc[in_p] = src[x];
   }
   newsrc[in_p] = '\0';
   return newsrc;
}

static const char *imcOneArgument( const char *argument, char *arg_first )
{
   char cEnd;
   int count = 0;

   if( arg_first )
      arg_first[0] = '\0';

   if( IsNullOrEmpty( argument ) )
      return NULL;

   while( isspace( (int) *argument ) )
      argument++;

   cEnd = ' ';
   
   if( *argument == '\'' || *argument == '"' )
      cEnd = *argument++;

   while( !IsNullOrEmpty( argument ) && ++count <= UCHAR_MAX )
   {
      if( *argument == cEnd )
      {
         argument++;
         break;
      }

      if( arg_first )
         *arg_first++ = *argument++;
      else
         argument++;
   }

   if( arg_first )
      *arg_first = '\0';

   while( isspace( (int) *argument ) )
      argument++;

   return argument;
}

/********************************
 * User level output functions. *
 *******************************/

static char *imc_strip_colors( const char *txt )
{
   IMC_COLOR *color;
   static char tbuf[LGST];

   strncpy( tbuf, txt, LGST );
   for( color = first_imc_color; color; color = color->next )
      strncpy( tbuf, imcstrrep( tbuf, color->imctag, "" ), LGST );

   for( color = first_imc_color; color; color = color->next )
      strncpy( tbuf, imcstrrep( tbuf, color->mudtag, "" ), LGST );
   return tbuf;
}

/* Now tell me this isn't cleaner than the mess that was here before. -- Xorith */
/* Yes, Xorith it is. Now, how about this update? Much less hassle with no hardcoded table! -- Samson */
/* convert from imc color -> mud color */
static const char *color_itom( const char *txt, Character * ch )
{
   IMC_COLOR *color;
   static char tbuf[LGST];

   if( IsNullOrEmpty( txt ) )
      return "";

   if( IsBitSet( IMCFLAG( ch ), IMC_COLORFLAG ) )
   {
      strncpy( tbuf, txt, LGST );
      for( color = first_imc_color; color; color = color->next )
         strncpy( tbuf, imcstrrep( tbuf, color->imctag, color->mudtag ), LGST );
   }
   else
      strncpy( tbuf, imc_strip_colors( txt ), LGST );

   return tbuf;
}

/* convert from mud color -> imc color */
static const char *color_mtoi( const char *txt )
{
   IMC_COLOR *color;
   static char tbuf[LGST];

   if( IsNullOrEmpty( txt ) )
      return "";

   strncpy( tbuf, txt, LGST );
   for( color = first_imc_color; color; color = color->next )
      strncpy( tbuf, imcstrrep( tbuf, color->mudtag, color->imctag ), LGST );

   return tbuf;
}

/* Generic SendToCharacter type function to send to the proper code for each codebase */
static void imc_to_char( const char *txt, Character * ch )
{
   char buf[LGST * 2];

   sprintf( buf, "%s\033[0m", color_itom( txt, ch ) );
   SendToCharacter( buf, ch );
}

/* Modified version of Smaug's Echo_color function */
static void imc_printf( Character * ch, const char *fmt, ... )
{
   char buf[LGST];
   va_list args;

   va_start( args, fmt );
   vsprintf( buf, fmt, args );
   va_end( args );

   imc_to_char( buf, ch );
}

/* Generic SendToPager type function to send to the proper code for each codebase */
static void imc_to_pager( const char *txt, Character * ch )
{
   char buf[LGST * 2];

   sprintf( buf, "%s\033[0m", color_itom( txt, ch ) );
   SendToPager( buf, ch );
}

/* Generic PagerPrintf type function */
static void imcPagerPrintf( Character * ch, const char *fmt, ... )
{
   char buf[LGST];
   va_list args;

   va_start( args, fmt );
   vsprintf( buf, fmt, args );
   va_end( args );

   imc_to_pager( buf, ch );
}

/********************************
 * Low level utility functions. *
 ********************************/

/* Does the list have the member in it? */
static bool imc_hasname( const char *list, const char *member )
{
  if( IsNullOrEmpty( list ) )
    return false;

  if( !strstr( list, member ) )
    return false;

  return true;
}

/* Add a new member to the list, provided it's not already there */
static void imc_addname( char **list, const char *member )
{
   char newlist[LGST];

   if( imc_hasname( *list, member ) )
      return;

   if( !list )
      strncpy( newlist, member, LGST );
   else
      sprintf( newlist, "%s %s", *list, member );

   IMCSTRFREE( *list );
   *list = IMCSTRALLOC( newlist );
}

/* Remove a member from a list, provided it's there. */
static void imc_removename( char **list, const char *member )
{
   char newlist[LGST];

   if( !imc_hasname( *list, member ) )
      return;

   strncpy( newlist, imcstrrep( *list, member, "" ), LGST );

   IMCSTRFREE( *list );
   *list = IMCSTRALLOC( newlist );
}

static char *imc_nameof( const char *src )
{
   static char name[SMST];
   size_t x;

   for( x = 0; x < strlen( src ); x++ )
   {
      if( src[x] == '@' )
         break;
      name[x] = src[x];
   }
   name[x] = '\0';

   return name;
}

static char *imc_mudof( const char *src )
{
   static char mud[SMST];
   char *person;

   /*
    * In strict ISO C++ strchr takes non-const string as first argument,
    * resulting in error on some compilers.
    */
#ifdef __cplusplus
   if( !( person = strchr( (char*) src, '@' ) ) )
#else
   if( !( person = strchr( src, '@' ) ) )
#endif
      strncpy( mud, src, SMST );
   else
      strncpy( mud, person + 1, SMST );
   return mud;
}

static char *imc_channel_mudof( const char *src )
{
   static char mud[SMST];
   size_t x;

   for( x = 0; x < strlen( src ); x++ )
   {
      if( src[x] == ':' )
      {
         mud[x] = '\0';
         break;
      }
      mud[x] = src[x];
   }
   return mud;
}

static char *imc_channel_nameof( const char *src )
{
   static char name[SMST];
   size_t x, y = 0;
   bool colon = false;

   for( x = 0; x < strlen( src ); x++ )
   {
      if( src[x] == ':' )
      {
         colon = true;
         continue;
      }
      if( !colon )
         continue;
      name[y++] = src[x];
   }
   name[x] = '\0';

   return name;
}

static char *imc_makename( const char *person, const char *mud )
{
   static char name[SMST];

   sprintf( name, "%s@%s", person, mud );
   return name;
}

static char *escape_string( const char *src )
{
   static char newstr[LGST];
   size_t x, y = 0;
   bool quote = false, endquote = false;

   if( strchr( src, ' ' ) )
   {
      quote = true;
      endquote = true;
   }

   for( x = 0; x < strlen( src ); x++ )
   {
      if( src[x] == '=' && quote )
      {
         newstr[y] = '=';
         newstr[++y] = '"';
         quote = false;
      }
      else if( src[x] == '\n' )
      {
         newstr[y] = '\\';
         newstr[++y] = 'n';
      }
      else if( src[x] == '\r' )
      {
         newstr[y] = '\\';
         newstr[++y] = 'r';
      }
      else if( src[x] == '\\' )
      {
         newstr[y] = '\\';
         newstr[++y] = '\\';
      }
      else if( src[x] == '"' )
      {
         newstr[y] = '\\';
         newstr[++y] = '"';
      }
      else
         newstr[y] = src[x];
      y++;
   }

   if( endquote )
      newstr[y++] = '"';
   newstr[y] = '\0';
   return newstr;
}

/*
 * Returns a Character class which matches the string
 */
static Character *imc_find_user( const char *name )
{
   Descriptor *d;
   Character *vch = NULL;

   for( d = FirstDescriptor; d; d = d->Next )
   {
      if( ( vch = d->Character ? d->Character : d->Original ) != NULL && !strcasecmp( CH_IMCNAME( vch ), name )
          && d->ConnectionState == CON_PLAYING )
         return vch;
   }
   return NULL;
}

static char *imcgetname( const char *from )
{
   static char buf[SMST];
   char *mud, *name;

   mud = imc_mudof( from );
   name = imc_nameof( from );

   if( !strcasecmp( mud, this_imcmud->localname ) )
      strncpy( buf, imc_nameof( name ), SMST );
   else
      strncpy( buf, from, SMST );

   return buf;
}

/* check if a packet from a given source should be ignored */
static bool imc_isbanned( const char *who )
{
   IMC_BAN *mud;

   for( mud = first_imc_ban; mud; mud = mud->next )
   {
      if( !strcasecmp( mud->Name, imc_mudof( who ) ) )
         return true;
   }
   return false;
}

static bool imc_isignoring( Character * ch, const char *ignore )
{
   IMC_IGNORE *temp;

   for( temp = FIRST_IMCIGNORE( ch ); temp; temp = temp->next )
   {
      if( !strcasecmp( imc_nameof( temp->Name ), "*" ) )
      {
         if( !strcasecmp( imc_mudof( temp->Name ), imc_mudof( ignore ) ) )
            return true;
      }

      if( !strcasecmp( imc_mudof( temp->Name ), "*" ) )
      {
         if( !strcasecmp( imc_nameof( temp->Name ), imc_nameof( ignore ) ) )
            return true;
      }

      if( !StringPrefix( ignore, temp->Name ) )
         return true;
   }
   return false;
}

/* There should only one of these..... */
static void imc_delete_info( void )
{
   IMCSTRFREE( this_imcmud->servername );
   IMCSTRFREE( this_imcmud->rhost );
   IMCSTRFREE( this_imcmud->network );
   IMCSTRFREE( this_imcmud->clientpw );
   IMCSTRFREE( this_imcmud->serverpw );
   IMCDISPOSE( this_imcmud->outbuf );
   IMCSTRFREE( this_imcmud->localname );
   IMCSTRFREE( this_imcmud->fullname );
   IMCSTRFREE( this_imcmud->ihost );
   IMCSTRFREE( this_imcmud->email );
   IMCSTRFREE( this_imcmud->www );
   IMCSTRFREE( this_imcmud->details );
   IMCSTRFREE( this_imcmud->versionid );
   IMCSTRFREE( this_imcmud->base );
   IMCDISPOSE( this_imcmud );
}

/* delete the info entry "p" */
static void imc_delete_reminfo( REMOTEINFO * p )
{
   IMCUNLINK( p, first_rinfo, last_rinfo, next, prev );
   IMCSTRFREE( p->Name );
   IMCSTRFREE( p->version );
   IMCSTRFREE( p->network );
   IMCSTRFREE( p->path );
   IMCSTRFREE( p->url );
   IMCSTRFREE( p->remote.port );
   IMCSTRFREE( p->remote.host );
   IMCDISPOSE( p );
}

/* create a new info entry, insert into list */
static void imc_new_reminfo( const char *mud, const char *version, const char *netname, const char *url, const char *path )
{
   REMOTEINFO *p, *mud_prev;

   IMCCREATE( p, REMOTEINFO, 1 );

   p->Name = IMCSTRALLOC( mud );

   if( IsNullOrEmpty( url ) )
      p->url = IMCSTRALLOC( "Unknown" );
   else
      p->url = IMCSTRALLOC( url );

   if( IsNullOrEmpty( version ) )
      p->version = IMCSTRALLOC( "Unknown" );
   else
      p->version = IMCSTRALLOC( version );

   if( IsNullOrEmpty( netname ) )
      p->network = IMCSTRALLOC( this_imcmud->network );
   else
      p->network = IMCSTRALLOC( netname );

   if( IsNullOrEmpty( path ) )
      p->path = IMCSTRALLOC( "UNKNOWN" );
   else
      p->path = IMCSTRALLOC( path );

   p->expired = false;

   for( mud_prev = first_rinfo; mud_prev; mud_prev = mud_prev->next )
      if( strcasecmp( mud_prev->Name, mud ) >= 0 )
         break;

   if( !mud_prev )
      IMCLINK( p, first_rinfo, last_rinfo, next, prev );
   else
      IMCINSERT( p, mud_prev, first_rinfo, next, prev );
}

/* find an info entry for "name" */
static REMOTEINFO *imc_find_reminfo( const char *name )
{
   REMOTEINFO *p;

   for( p = first_rinfo; p; p = p->next )
   {
      if( !strcasecmp( name, p->Name ) )
         return p;
   }
   return NULL;
}

static bool check_mud( Character * ch, const char *mud )
{
   REMOTEINFO *r = imc_find_reminfo( mud );

   if( !r )
   {
      imc_printf( ch, "~W%s ~cis not a valid mud name.\r\n", mud );
      return false;
   }

   if( r->expired )
   {
      imc_printf( ch, "~W%s ~cis not connected right now.\r\n", r->Name );
      return false;
   }
   return true;
}

static bool check_mudof( Character * ch, const char *mud )
{
   return check_mud( ch, imc_mudof( mud ) );
}

static int get_imcpermvalue( const char *flag )
{
   size_t x;

   for( x = 0; x < ( sizeof( imcperm_names ) / sizeof( imcperm_names[0] ) ); x++ )
      if( !strcasecmp( flag, imcperm_names[x] ) )
         return x;
   return -1;
}

static bool imccheck_permissions( Character * ch, int checkvalue, int targetvalue, bool enforceequal )
{
   if( checkvalue < 0 || checkvalue > IMCPERM_IMP )
   {
      imc_to_char( "Invalid permission setting.\r\n", ch );
      return false;
   }

   if( checkvalue > IMCPERM( ch ) )
   {
      imc_to_char( "You cannot set permissions higher than your own.\r\n", ch );
      return false;
   }

   if( checkvalue == IMCPERM( ch ) && IMCPERM( ch ) != IMCPERM_IMP && enforceequal )
   {
      imc_to_char( "You cannot set permissions equal to your own. Someone higher up must do this.\r\n", ch );
      return false;
   }

   if( IMCPERM( ch ) < targetvalue )
   {
      imc_to_char( "You cannot alter the permissions of someone or something above your own.\r\n", ch );
      return false;
   }
   return true;
}

static IMC_BAN *imc_newban( void )
{
   IMC_BAN *ban;

   IMCCREATE( ban, IMC_BAN, 1 );
   ban->Name = NULL;
   IMCLINK( ban, first_imc_ban, last_imc_ban, next, prev );
   return ban;
}

static void imc_addban( const char *what )
{
   IMC_BAN *ban;

   ban = imc_newban();
   ban->Name = IMCSTRALLOC( what );
}

static void imc_freeban( IMC_BAN * ban )
{
   IMCSTRFREE( ban->Name );
   IMCUNLINK( ban, first_imc_ban, last_imc_ban, next, prev );
   IMCDISPOSE( ban );
}

static bool imc_delban( const char *what )
{
   IMC_BAN *ban, *ban_next;

   for( ban = first_imc_ban; ban; ban = ban_next )
   {
      ban_next = ban->next;
      if( !strcasecmp( what, ban->Name ) )
      {
         imc_freeban( ban );
         return true;
      }
   }
   return false;
}

static IMC_CHANNEL *imc_findchannel( const char *name )
{
   IMC_CHANNEL *c;

   for( c = first_imc_channel; c; c = c->next )
      if( ( c->Name && !strcasecmp( c->Name, name ) ) || ( c->local_name && !strcasecmp( c->local_name, name ) ) )
         return c;
   return NULL;
}

static void imc_freechan( IMC_CHANNEL * c )
{
   int x;

   if( !c )
   {
      imcbug( "%s", "imc_freechan: Freeing NULL channel!" );
      return;
   }
   IMCUNLINK( c, first_imc_channel, last_imc_channel, next, prev );
   IMCSTRFREE( c->Name );
   IMCSTRFREE( c->owner );
   IMCSTRFREE( c->operators );
   IMCSTRFREE( c->invited );
   IMCSTRFREE( c->excluded );
   IMCSTRFREE( c->local_name );
   IMCSTRFREE( c->regformat );
   IMCSTRFREE( c->emoteformat );
   IMCSTRFREE( c->socformat );

   for( x = 0; x < MAX_IMCHISTORY; x++ )
      IMCSTRFREE( c->history[x] );
   IMCDISPOSE( c );
}

static void imcformat_channel( Character * ch, IMC_CHANNEL * d, int format, bool all )
{
   IMC_CHANNEL *c = NULL;
   char buf[LGST];

   if( all )
   {
      for( c = first_imc_channel; c; c = c->next )
      {
	if( IsNullOrEmpty( c->local_name ) )
            continue;

         if( format == 1 || format == 4 )
         {
            sprintf( buf, "~R[~Y%s~R] ~C%%s: ~c%%s", c->local_name );
            IMCSTRFREE( c->regformat );
            c->regformat = IMCSTRALLOC( buf );
         }
         if( format == 2 || format == 4 )
         {
            sprintf( buf, "~R[~Y%s~R] ~c%%s %%s", c->local_name );
            IMCSTRFREE( c->emoteformat );
            c->emoteformat = IMCSTRALLOC( buf );
         }
         if( format == 3 || format == 4 )
         {
            sprintf( buf, "~R[~Y%s~R] ~c%%s", c->local_name );
            IMCSTRFREE( c->socformat );
            c->socformat = IMCSTRALLOC( buf );
         }
      }
   }
   else
   {
     if( ch && IsNullOrEmpty( d->local_name ) )
      {
         imc_to_char( "This channel is not yet locally configured.\r\n", ch );
         return;
      }

      if( format == 1 || format == 4 )
      {
         sprintf( buf, "~R[~Y%s~R] ~C%%s: ~c%%s", d->local_name );
         IMCSTRFREE( d->regformat );
         d->regformat = IMCSTRALLOC( buf );
      }
      if( format == 2 || format == 4 )
      {
         sprintf( buf, "~R[~Y%s~R] ~c%%s %%s", d->local_name );
         IMCSTRFREE( d->emoteformat );
         d->emoteformat = IMCSTRALLOC( buf );
      }
      if( format == 3 || format == 4 )
      {
         sprintf( buf, "~R[~Y%s~R] ~c%%s", d->local_name );
         IMCSTRFREE( d->socformat );
         d->socformat = IMCSTRALLOC( buf );
      }
   }
   imc_save_channels();
}

static void imc_new_channel( const char *chan, const char *owner,
			     const char *ops, const char *invite,
			     const char *exclude,
			     bool copen, int perm, const char *lname )
{
   IMC_CHANNEL *c;

   if( IsNullOrEmpty( chan ) )
   {
      imclog( "%s: NULL channel name received, skipping", __FUNCTION__ );
      return;
   }

   if( !strchr( chan, ':' ) )
   {
      imclog( "%s: Improperly formatted channel name: %s", __FUNCTION__, chan );
      return;
   }

   IMCCREATE( c, IMC_CHANNEL, 1 );
   c->Name = IMCSTRALLOC( chan );
   c->owner = IMCSTRALLOC( owner );
   c->operators = IMCSTRALLOC( ops );
   c->invited = IMCSTRALLOC( invite );
   c->excluded = IMCSTRALLOC( exclude );

   if( !IsNullOrEmpty( lname ) )
      c->local_name = IMCSTRALLOC( lname );
   else
      c->local_name = imc_channel_nameof( c->Name );

   c->level = perm;
   c->refreshed = true;
   c->open = copen;
   IMCLINK( c, first_imc_channel, last_imc_channel, next, prev );
   imcformat_channel( NULL, c, 4, false );
}

/*
 * Read to end of line into static buffer [Taken from Smaug's ReadLine]
 */
/*
 * Standard ReadLine returns static buffer, while this one returns
 * dynamically allocated, which is why this must stay.
 */
static char *imcReadLine( FILE * fp )
{
  char line[LGST] = {'\0'};
  char *pline = line;
  char c = 0;
  int ln = 0;

  /*
   * Skip blanks.
   * Read first char.
   */
  do
    {
      if( feof( fp ) )
	{
	  imcbug( "%s", "imcReadLine: EOF encountered on read." );
	  strncpy( line, "", LGST );
	  return IMCSTRALLOC( line );
	}

      c = fgetc( fp );
    }
  while( isspace( (int) c ) );

  ungetc( c, fp );

  do
    {
      if( feof( fp ) )
	{
	  imcbug( "%s", "imcReadLine: EOF encountered on read." );
	  *pline = '\0';
	  return IMCSTRALLOC( line );
	}

      c = fgetc( fp );
      *pline++ = c;
      ln++;

      if( ln >= ( LGST - 1 ) )
	{
	  imcbug( "%s", "imcReadLine: line too long" );
	  break;
	}
    }
  while( c != '\n' && c != '\r' );

  do
    {
      c = fgetc( fp );
    }
  while( c == '\n' || c == '\r' );

  ungetc( c, fp );
  pline--;
  *pline = '\0';

  /*
   * Since tildes generally aren't found at the end of lines, this seems workable. Will enable reading old configs.
   */
  if( line[strlen( line ) - 1] == '~' )
    line[strlen( line ) - 1] = '\0';

  return IMCSTRALLOC( line );
}

/******************************************
 * Packet handling and routing functions. *
 ******************************************/

static void imc_register_packet_handler( const char *name, PACKET_FUN * func )
{
   IMC_PHANDLER *ph;

   for( ph = first_phandler; ph; ph = ph->next )
   {
      if( !strcasecmp( ph->Name, name ) )
      {
         imclog( "Unable to register packet type %s. Another module has already registered it.", name );
         return;
      }
   }

   IMCCREATE( ph, IMC_PHANDLER, 1 );

   ph->Name = IMCSTRALLOC( name );
   ph->func = func;

   IMCLINK( ph, first_phandler, last_phandler, next, prev );
}

static void imc_freepacket( IMC_PACKET * p )
{
   IMC_PDATA *data, *data_next;

   for( data = p->first_data; data; data = data_next )
   {
      data_next = data->next;

      IMCUNLINK( data, p->first_data, p->last_data, next, prev );
      IMCDISPOSE( data );
   }
   IMCDISPOSE( p );
}

static int find_next_esign( const char *string, int current )
{
   bool quote = false;

   if( string[current] == '=' )
      current++;

   for( ; string[current] != '\0'; current++ )
   {
      if( string[current] == '\\' && string[current + 1] == '"' )
      {
         current++;
         continue;
      }

      if( string[current] == '"' )
         quote = !quote;

      if( string[current] == '=' && !quote )
         break;
   }

   if( string[current] == '\0' )
      return -1;

   return current;
}

static char *imc_getData( char *output, const char *key, const char *packet )
{
   int current = 0;
   size_t i = 0;
   bool quote = false;

   output[0] = '\0';

   if( IsNullOrEmpty( packet ) || IsNullOrEmpty( key ) )
   {
      imcbug( "%s: Invalid input", __FUNCTION__ );
      return output;
   }

   while( ( current = find_next_esign( packet, current ) ) >= 0 )
   {
      if( strlen( key ) > ( size_t )current )
         continue;

      i = current - strlen( key );

      if( strncasecmp( &packet[i], key, strlen( key ) ) == 0 )
         break;
   }

   if( current < 0 )
      return output;

   current++;

   if( packet[current] == '"' )
   {
      quote = true;
      current++;
   }

   for( i = 0; packet[current] != '\0'; current++ )
   {
      if( packet[current] == '"' && quote )
         break;

      if( packet[current] == ' ' && !quote )
         break;

      if( packet[current] != '\\' )
      {
         output[i++] = packet[current];
         continue;
      }
      current++;

      if( packet[current] == 'n' )
         output[i++] = '\n';
      else if( packet[current] == 'r' )
         output[i++] = '\r';
      else if( packet[current] == '"' )
         output[i++] = '"';
      else if( packet[current] == '\\' )
         output[i++] = '\\';
      else
         output[i++] = packet[current];
   }
   output[i] = '\0';
   return output;
}

static void imc_write_buffer( const char *txt )
{
   char output[IMC_BUFF_SIZE];
   size_t length;

   /*
    * This should never happen 
    */
   if( !this_imcmud || this_imcmud->Desc == INVALID_SOCKET )
   {
      imcbug( "%s: Configuration or socket is invalid!", __FUNCTION__ );
      return;
   }

   /*
    * This should never happen either 
    */
   if( !this_imcmud->outbuf )
   {
      imcbug( "%s: Output buffer has not been allocated!", __FUNCTION__ );
      return;
   }

   sprintf( output, "%s\r\n", txt );
   length = strlen( output );

   /*
    * Expand the buffer as needed.
    */
   while( this_imcmud->outtop + length >= this_imcmud->outsize )
   {
      if( this_imcmud->outsize > 64000 )
      {
         /*
          * empty buffer 
          */
         this_imcmud->outtop = 0;
         imcbug( "Buffer overflow: %ld. Purging.", this_imcmud->outsize );
         return;
      }
      this_imcmud->outsize *= 2;
      IMCRECREATE( this_imcmud->outbuf, char, this_imcmud->outsize );
   }

   /*
    * Copy.
    */
   strncpy( this_imcmud->outbuf + this_imcmud->outtop, output, length );   /* Leave this one alone! BAD THINGS(TM) will happen if you don't! */
   this_imcmud->outtop += length;
   this_imcmud->outbuf[this_imcmud->outtop] = '\0';
}

/*
 * Convert a packet to text to then send to the buffer
 */
static void imc_write_packet( IMC_PACKET * p )
{
   IMC_PDATA *data;
   char txt[IMC_BUFF_SIZE];

   /*
    * Assemble your buffer, and at the same time disassemble the packet struct to free the memory 
    */
   sprintf( txt, "%s %lu %s %s %s", p->from, ++imc_sequencenumber, this_imcmud->localname, p->type, p->to );

   for( data = p->first_data; data; data = data->next )
     {
       sprintf( txt + strlen( txt ), "%s", data->field );
     }

   imc_freepacket( p );

   imc_write_buffer( txt );
}

static void imc_addtopacket( IMC_PACKET * p, const char *fmt, ... )
{
   IMC_PDATA *data;
   char pkt[IMC_BUFF_SIZE];
   va_list args;

   va_start( args, fmt );
   vsprintf( pkt, fmt, args );
   va_end( args );

   IMCCREATE( data, IMC_PDATA, 1 );
   sprintf( data->field, " %s", escape_string( pkt ) );
   IMCLINK( data, p->first_data, p->last_data, next, prev );
}

static IMC_PACKET *imc_newpacket( const char *from, const char *type, const char *to )
{
   IMC_PACKET *p;

   if( IsNullOrEmpty( type ) )
   {
      imcbug( "%s: Attempt to build packet with no type field.", __FUNCTION__ );
      return NULL;
   }

   if( IsNullOrEmpty( from ) )
   {
      imcbug( "%s: Attempt to build %s packet with no from field.", __FUNCTION__, type );
      return NULL;
   }

   if( IsNullOrEmpty( to ) )
   {
      imcbug( "%s: Attempt to build %s packet with no to field.", __FUNCTION__, type );
      return NULL;
   }

   IMCCREATE( p, IMC_PACKET, 1 );
   sprintf( p->from, "%s@%s", from, this_imcmud->localname );
   strncpy( p->type, type, SMST );
   strncpy( p->to, to, SMST );
   p->first_data = p->last_data = NULL;

   return p;
}

static void imc_update_tellhistory( Character * ch, const char *msg )
{
   char new_msg[LGST];
   struct tm *local = localtime( &imc_time );
   int x;

   sprintf( new_msg, "~R[%-2.2d:%-2.2d] %s", local->tm_hour, local->tm_min, msg );

   for( x = 0; x < MAX_IMCTELLHISTORY; x++ )
   {
     if( IsNullOrEmpty(IMCTELLHISTORY( ch, x )))
      {
         IMCTELLHISTORY( ch, x ) = IMCSTRALLOC( new_msg );
         break;
      }

      if( x == MAX_IMCTELLHISTORY - 1 )
      {
         int i;

         for( i = 1; i < MAX_IMCTELLHISTORY; i++ )
         {
            IMCSTRFREE( IMCTELLHISTORY( ch, i - 1 ) );
            IMCTELLHISTORY( ch, i - 1 ) = IMCSTRALLOC( IMCTELLHISTORY( ch, i ) );
         }
         IMCSTRFREE( IMCTELLHISTORY( ch, x ) );
         IMCTELLHISTORY( ch, x ) = IMCSTRALLOC( new_msg );
      }
   }
}

static void imc_send_tell( const char *from, const char *to, const char *txt, int reply )
{
   IMC_PACKET *p;

   p = imc_newpacket( from, "tell", to );
   imc_addtopacket( p, "text=%s", txt );
   if( reply > 0 )
      imc_addtopacket( p, "isreply=%d", reply );
   imc_write_packet( p );
}

PFUN( imc_recv_tell )
{
   Character *vic;
   char txt[LGST], isreply[SMST], buf[LGST];
   int reply;

   imc_getData( txt, "text", packet );
   imc_getData( isreply, "isreply", packet );
   reply = atoi( isreply );
   if( reply < 0 || reply > 2 )
      reply = 0;

   if( !( vic = imc_find_user( imc_nameof( q->to ) ) ) || IMCPERM( vic ) < IMCPERM_MORT )
   {
      sprintf( buf, "No player named %s exists here.", q->to );
      imc_send_tell( "*", q->from, buf, 1 );
      return;
   }

   if( strcasecmp( imc_nameof( q->from ), "ICE" ) )
   {
      if( IMCISINVIS( vic ) )
      {
         if( strcasecmp( imc_nameof( q->from ), "*" ) )
         {
            sprintf( buf, "%s is not receiving tells.", q->to );
            imc_send_tell( "*", q->from, buf, 1 );
         }
         return;
      }

      if( imc_isignoring( vic, q->from ) )
      {
         if( strcasecmp( imc_nameof( q->from ), "*" ) )
         {
            sprintf( buf, "%s is not receiving tells.", q->to );
            imc_send_tell( "*", q->from, buf, 1 );
         }
         return;
      }

      if( IsBitSet( IMCFLAG( vic ), IMC_TELL ) || IsBitSet( IMCFLAG( vic ), IMC_DENYTELL ) )
      {
         if( strcasecmp( imc_nameof( q->from ), "*" ) )
         {
            sprintf( buf, "%s is not receiving tells.", q->to );
            imc_send_tell( "*", q->from, buf, 1 );
         }
         return;
      }

      if( IMCAFK( vic ) )
      {
         if( strcasecmp( imc_nameof( q->from ), "*" ) )
         {
            sprintf( buf, "%s is currently AFK. Try back later.", q->to );
            imc_send_tell( "*", q->from, buf, 1 );
         }
         return;
      }

      if( strcasecmp( imc_nameof( q->from ), "*" ) )
      {
         IMCSTRFREE( IMC_RREPLY( vic ) );
         IMCSTRFREE( IMC_RREPLY_NAME( vic ) );
         IMC_RREPLY( vic ) = IMCSTRALLOC( q->from );
         IMC_RREPLY_NAME( vic ) = IMCSTRALLOC( imcgetname( q->from ) );
      }
   }

   /*
    * Tell social 
    */
   if( reply == 2 )
      sprintf( buf, "~WImctell: ~c%s\r\n", txt );
   else
      sprintf( buf, "~C%s ~cimctells you ~c'~W%s~c'~!\r\n", imcgetname( q->from ), txt );
   imc_to_char( buf, vic );
   imc_update_tellhistory( vic, buf );
}

PFUN( imc_recv_emote )
{
   Descriptor *d;
   Character *ch;
   char txt[LGST], lvl[SMST];
   int level;

   imc_getData( txt, "text", packet );
   imc_getData( lvl, "level", packet );

   level = get_imcpermvalue( lvl );
   if( level < 0 || level > IMCPERM_IMP )
      level = IMCPERM_IMM;

   for( d = FirstDescriptor; d; d = d->Next )
   {
      if( d->ConnectionState == CON_PLAYING && ( ch = d->Original ? d->Original : d->Character ) != NULL
          && IMCPERM( ch ) >= level )
         imc_printf( ch, "~p[~GIMC~p] %s %s\r\n", imcgetname( q->from ), txt );
   }
}

static void update_imchistory( IMC_CHANNEL * channel, const char *message )
{
   char msg[LGST], buf[LGST];
   struct tm *local;
   int x;

   if( !channel )
   {
      imcbug( "%s", "update_imchistory: NULL channel received!" );
      return;
   }

   if( IsNullOrEmpty( message ) )
   {
      imcbug( "%s", "update_imchistory: NULL message received!" );
      return;
   }

   strncpy( msg, message, LGST );
   for( x = 0; x < MAX_IMCHISTORY; x++ )
   {
      if( channel->history[x] == NULL )
      {
         local = localtime( &imc_time );
         sprintf( buf, "~R[%-2.2d/%-2.2d %-2.2d:%-2.2d] ~G%s",
                   local->tm_mon + 1, local->tm_mday, local->tm_hour, local->tm_min, msg );
         channel->history[x] = IMCSTRALLOC( buf );

         if( IsBitSet( channel->flags, IMCCHAN_LOG ) )
         {
            FILE *fp;
            sprintf( buf, "%s%s.log", IMC_DIR, channel->local_name );
            if( !( fp = fopen( buf, "a" ) ) )
            {
               perror( buf );
               imcbug( "Could not open file %s!", buf );
            }
            else
            {
               fprintf( fp, "%s\n", imc_strip_colors( channel->history[x] ) );
               IMCFCLOSE( fp );
            }
         }
         break;
      }

      if( x == MAX_IMCHISTORY - 1 )
      {
         int y;

         for( y = 1; y < MAX_IMCHISTORY; y++ )
         {
            int z = y - 1;

            if( channel->history[z] != NULL )
            {
               IMCSTRFREE( channel->history[z] );
               channel->history[z] = IMCSTRALLOC( channel->history[y] );
            }
         }

         local = localtime( &imc_time );
         sprintf( buf, "~R[%-2.2d/%-2.2d %-2.2d:%-2.2d] ~G%s",
                   local->tm_mon + 1, local->tm_mday, local->tm_hour, local->tm_min, msg );
         IMCSTRFREE( channel->history[x] );
         channel->history[x] = IMCSTRALLOC( buf );

         if( IsBitSet( channel->flags, IMCCHAN_LOG ) )
         {
            FILE *fp;
            sprintf( buf, "%s%s.log", IMC_DIR, channel->local_name );
            if( !( fp = fopen( buf, "a" ) ) )
            {
               perror( buf );
               imcbug( "Could not open file %s!", buf );
            }
            else
            {
               fprintf( fp, "%s\n", imc_strip_colors( channel->history[x] ) );
               IMCFCLOSE( fp );
            }
         }
      }
   }
}

static void imc_display_channel( IMC_CHANNEL * c, const char *from, char *txt, int emote )
{
   Descriptor *d;
   Character *ch;
   char buf[LGST], name[SMST];

   if( IsNullOrEmpty( c->local_name ) || !c->refreshed )
      return;

   if( emote < 2 )
      sprintf( buf, emote ? c->emoteformat : c->regformat, from, txt );
   else
      sprintf( buf, c->socformat, txt );

   for( d = FirstDescriptor; d; d = d->Next )
   {
      ch = d->Original ? d->Original : d->Character;

      if( !ch || d->ConnectionState != CON_PLAYING )
         continue;

      /*
       * Freaking stupid PCData crap! 
       */
      if( IsNpc( ch ) )
         continue;

      if( IMCPERM( ch ) < c->level || !imc_hasname( IMC_LISTEN( ch ), c->local_name ) )
         continue;

      /* User is ignoring the sender */
      if( imc_isignoring( ch, from ) )
         continue;

      if( !c->open )
      {
         sprintf( name, "%s@%s", CH_IMCNAME( ch ), this_imcmud->localname );
         if( !imc_hasname( c->invited, name ) && strcasecmp( c->owner, name ) )
            continue;
      }
      imc_printf( ch, "%s\r\n", buf );
   }
   update_imchistory( c, buf );
}

PFUN( imc_recv_pbroadcast )
{
   IMC_CHANNEL *c;
   char chan[SMST], txt[LGST], emote[SMST], sender[SMST];
   int em;

   imc_getData( chan, "channel", packet );
   imc_getData( txt, "text", packet );
   imc_getData( emote, "emote", packet );
   imc_getData( sender, "realfrom", packet );

   em = atoi( emote );
   if( em < 0 || em > 2 )
      em = 0;

   if( !( c = imc_findchannel( chan ) ) )
      return;

   imc_display_channel( c, sender, txt, em );
}

PFUN( imc_recv_broadcast )
{
   IMC_CHANNEL *c;
   char chan[SMST], txt[LGST], emote[SMST], sender[SMST];
   int em;

   imc_getData( chan, "channel", packet );
   imc_getData( txt, "text", packet );
   imc_getData( emote, "emote", packet );
   imc_getData( sender, "sender", packet );

   em = atoi( emote );
   if( em < 0 || em > 2 )
      em = 0;

   if( !( c = imc_findchannel( chan ) ) )
      return;

   if( IsNullOrEmpty( sender ) )
      imc_display_channel( c, q->from, txt, em );
   else
      imc_display_channel( c, sender, txt, em );
}

/* Send/recv private channel messages */
static void imc_sendmessage( const IMC_CHANNEL * c, const char *name, const char *text, int emote )
{
   IMC_PACKET *p;

   /*
    * Private channel 
    */
   if( !c->open )
   {
      char to[SMST];

      sprintf( to, "IMC@%s", imc_channel_mudof( c->Name ) );
      p = imc_newpacket( name, "ice-msg-p", to );
   }
   /*
    * Public channel 
    */
   else
      p = imc_newpacket( name, "ice-msg-b", "*@*" );

   imc_addtopacket( p, "channel=%s", c->Name );
   imc_addtopacket( p, "text=%s", text );
   imc_addtopacket( p, "emote=%d", emote );
   imc_addtopacket( p, "%s", "echo=1" );
   imc_write_packet( p );
}

PFUN( imc_recv_chanwhoreply )
{
   IMC_CHANNEL *c;
   Character *vic;
   char chan[SMST], list[IMC_BUFF_SIZE];

   imc_getData( chan, "channel", packet );
   imc_getData( list, "list", packet );

   if( !( c = imc_findchannel( chan ) ) )
      return;

   if( !( vic = imc_find_user( imc_nameof( q->to ) ) ) )
      return;

   imc_printf( vic, "~G%s", list );
}

static const char *get_local_chanwho( IMC_CHANNEL * c )
{
   Descriptor *d;
   Character *person;
   static char buf[IMC_BUFF_SIZE];
   int count = 0, col = 0;

   sprintf( buf, "The following people are listening to %s on %s:\r\n\r\n",
             c->local_name, this_imcmud->localname );

   for( d = FirstDescriptor; d; d = d->Next )
   {
      person = d->Original ? d->Original : d->Character;

      if( !person )
         continue;

      if( IMCISINVIS( person ) )
         continue;

      if( !imc_hasname( IMC_LISTEN( person ), c->local_name ) )
         continue;

      sprintf( buf + strlen( buf ), "%-15s", CH_IMCNAME( person ) );
      count++;
      if( ++col % 3 == 0 )
      {
         col = 0;
         sprintf( buf + strlen( buf ), "%s", "\r\n" );
      }
   }
   if( col != 0 )
      sprintf( buf + strlen( buf ), "%s", "\r\n" );
   /*
    * Send no response to a broadcast request if nobody is listening. 
    */
   if( count == 0 )
      strncat( buf, "Nobody\r\n", IMC_BUFF_SIZE );
   else
      strncat( buf, "\r\n", IMC_BUFF_SIZE );
   return buf;
}

PFUN( imc_recv_chanwho )
{
   IMC_PACKET *p;
   IMC_CHANNEL *c;
   char buf[IMC_BUFF_SIZE], lvl[SMST], channel[SMST], lname[SMST];
   int level;

   imc_getData( lvl, "level", packet );
   level = get_imcpermvalue( lvl );
   if( level < 0 || level > IMCPERM_IMP )
      level = IMCPERM_ADMIN;

   imc_getData( channel, "channel", packet );
   imc_getData( lname, "lname", packet );

   if( !( c = imc_findchannel( channel ) ) )
      return;

   if( !c->local_name )
      sprintf( buf, "Channel %s is not locally configured on %s\r\n", lname, this_imcmud->localname );
   else if( c->level > level )
      sprintf( buf, "Channel %s is above your permission level on %s\r\n", lname, this_imcmud->localname );
   else
   {
      char cwho[IMC_BUFF_SIZE];

      strncpy( cwho, get_local_chanwho( c ), IMC_BUFF_SIZE );

      if( ( !strcasecmp( cwho, "" ) || !strcasecmp( cwho, "Nobody" ) ) && !strcasecmp( q->to, "*" ) )
         return;
      strncpy( buf, cwho, IMC_BUFF_SIZE );
   }

   p = imc_newpacket( "*", "ice-chan-whoreply", q->from );
   imc_addtopacket( p, "channel=%s", c->Name );
   imc_addtopacket( p, "list=%s", buf );
   imc_write_packet( p );
}

static char *imccenterline( const char *string, int length )
{
   char stripped[300];
   static char outbuf[400];
   int amount;

   strncpy( stripped, imc_strip_colors( string ), 300 );
   amount = length - strlen( stripped );  /* Determine amount to put in front of line */

   if( amount < 1 )
      amount = 1;

   /*
    * Justice, you are the String God! 
    */
   sprintf( outbuf, "%*s%s%*s", ( amount / 2 ), "", string,
             ( ( amount / 2 ) * 2 ) == amount ? ( amount / 2 ) : ( ( amount / 2 ) + 1 ), "" );

   return outbuf;
}

static char *imcrankbuffer( Character * ch )
{
   static char rbuf[SMST];

   if( IMCPERM( ch ) >= IMCPERM_IMM )
   {
      strncpy( rbuf, "~YStaff", SMST );

      if( !IsNullOrEmpty( CH_IMCRANK( ch ) ) )
         sprintf( rbuf, "~Y%s", color_mtoi( CH_IMCRANK( ch ) ) );
   }
   else
   {
      strncpy( rbuf, "~BPlayer", SMST );

      if( !IsNullOrEmpty( CH_IMCRANK( ch ) ) )
         sprintf( rbuf, "~B%s", color_mtoi( CH_IMCRANK( ch ) ) );
   }
   return rbuf;
}

static void imc_send_whoreply( const char *to, const char *txt )
{
   IMC_PACKET *p;

   p = imc_newpacket( "*", "who-reply", to );
   imc_addtopacket( p, "text=%s", txt );
   imc_write_packet( p );
}

static void imc_send_who( const char *from, const char *to, const char *type )
{
   IMC_PACKET *p;

   p = imc_newpacket( from, "who", to );
   imc_addtopacket( p, "type=%s", type );
   imc_write_packet( p );
}

static char *break_newlines( char *argument, char *arg_first )
{
   char cEnd;
   int count = 0;

   if( arg_first )
      arg_first[0] = '\0';

   if( IsNullOrEmpty( argument ) )
      return NULL;

   while( isspace( (int) *argument ) )
      argument++;

   cEnd = '\n';
   if( *argument == '\'' || *argument == '"' )
      cEnd = *argument++;

   while( !IsNullOrEmpty( argument ) && ++count <= UCHAR_MAX )
   {
      if( *argument == cEnd )
      {
         argument++;
         break;
      }

      if( arg_first )
         *arg_first++ = *argument++;
      else
         argument++;
   }

   if( arg_first )
      *arg_first = '\0';

   while( isspace( (int) *argument ) )
      argument++;

   return argument;
}

static char *multiline_center( char *splitme )
{
   static char newline[LGST];
   char arg[SMST];

   newline[0] = '\0';
   while( 1 )
   {
     if( IsNullOrEmpty( splitme ) )
       break;

      splitme = break_newlines( splitme, arg );

      if( strstr( arg, "<center>" ) )
      {
         strncpy( arg, imcstrrep( arg, "<center>", "" ), SMST );
         strncpy( arg, imccenterline( arg, 78 ), SMST );
      }
      strncat( newline, arg, LGST - 1);
      strncat( newline, "\n", LGST );
   }
   return newline;
}

static char *process_who_head( int plrcount )
{
   static char head[LGST];
   char pcount[SMST];

   strncpy( head, whot->head, LGST );
   sprintf( pcount, "%d", plrcount );

   strncpy( head, imcstrrep( head, "<%plrcount%>", pcount ), LGST );
   strncpy( head, multiline_center( head ), LGST );

   return head;
}

static char *process_who_tail( int plrcount )
{
   static char tail[LGST];
   char pcount[SMST];

   strncpy( tail, whot->tail, LGST );
   sprintf( pcount, "%d", plrcount );

   strncpy( tail, imcstrrep( tail, "<%plrcount%>", pcount ), LGST );
   strncpy( tail, multiline_center( tail ), LGST );

   return tail;
}

static char *process_plrline( char *plrrank, char *plrflags, char *plrname, char *plrtitle )
{
   static char pline[LGST];

   strncpy( pline, whot->immline, LGST );
   strncpy( pline, imcstrrep( pline, "<%charrank%>", plrrank ), LGST );
   strncpy( pline, imcstrrep( pline, "<%charflags%>", plrflags ), LGST );
   strncpy( pline, imcstrrep( pline, "<%charname%>", plrname ), LGST );
   strncpy( pline, imcstrrep( pline, "<%chartitle%>", plrtitle ), LGST );
   strncat( pline, "\n", LGST );

   return pline;
}

static char *process_immline( char *plrrank, char *plrflags, char *plrname, char *plrtitle )
{
   static char pline[LGST];

   strncpy( pline, whot->immline, LGST );
   strncpy( pline, imcstrrep( pline, "<%charrank%>", plrrank ), LGST );
   strncpy( pline, imcstrrep( pline, "<%charflags%>", plrflags ), LGST );
   strncpy( pline, imcstrrep( pline, "<%charname%>", plrname ), LGST );
   strncpy( pline, imcstrrep( pline, "<%chartitle%>", plrtitle ), LGST );
   strncat( pline, "\n", LGST );

   return pline;
}

static char *process_who_template( char *head, char *tail, char *plrlines, char *immlines, char *plrheader, char *immheader )
{
   static char master[LGST];

   strncpy( master, whot->Master, LGST );
   strncpy( master, imcstrrep( master, "<%head%>", head ), LGST );
   strncpy( master, imcstrrep( master, "<%tail%>", tail ), LGST );
   strncpy( master, imcstrrep( master, "<%plrheader%>", plrheader ), LGST );
   strncpy( master, imcstrrep( master, "<%immheader%>", immheader ), LGST );
   strncpy( master, imcstrrep( master, "<%plrline%>", plrlines ), LGST );
   strncpy( master, imcstrrep( master, "<%immline%>", immlines ), LGST );

   return master;
}

static char *imc_assemble_who( void )
{
   Character *person;
   Descriptor *d;
   int pcount = 0;
   bool plr = false, imm = false;
   char plrheader[SMST] = {'\0'};
   char immheader[SMST] = {'\0'};
   char rank[SMST];
   char flags[SMST];
   char name[SMST];
   char title[SMST];
   char plrline[SMST];
   char immline[SMST];
   char plrlines[LGST] = {'\0'};
   char immlines[LGST] = {'\0'};
   char head[LGST];
   char tail[LGST];
   static char master[LGST];  /* The final result that gets returned */

   for( d = FirstDescriptor; d; d = d->Next )
   {
      person = d->Original ? d->Original : d->Character;

      if( person && d->ConnectionState == CON_PLAYING )
      {
         if( IMCPERM( person ) <= IMCPERM_NONE || IMCPERM( person ) >= IMCPERM_IMM )
            continue;

         if( IMCISINVIS( person ) )
            continue;

         ++pcount;

         if( !plr )
         {
            strncpy( plrheader, whot->plrheader, SMST );
            plr = true;
         }

         strncpy( rank, imcrankbuffer( person ), SMST );

         if( IMCAFK( person ) )
            strncpy( flags, "AFK", SMST );
         else
            strncpy( flags, "---", SMST );

         strncpy( name, CH_IMCNAME( person ), SMST );
         strncpy( title, color_mtoi( CH_IMCTITLE( person ) ), SMST );
         strncpy( plrline, process_plrline( rank, flags, name, title ), SMST );
         strncat( plrlines, plrline, LGST - 1 );
      }
   }

   imm = false;
   for( d = FirstDescriptor; d; d = d->Next )
   {
      person = d->Original ? d->Original : d->Character;

      if( person && d->ConnectionState == CON_PLAYING )
      {
         if( IMCPERM( person ) <= IMCPERM_NONE || IMCPERM( person ) < IMCPERM_IMM )
            continue;

         if( IMCISINVIS( person ) )
            continue;

         ++pcount;

         if( !imm )
         {
            strncpy( immheader, whot->immheader, SMST );
            imm = true;
         }

         strncpy( rank, imcrankbuffer( person ), SMST );

         if( IMCAFK( person ) )
            strncpy( flags, "AFK", SMST );
         else
            strncpy( flags, "---", SMST );

         strncpy( name, CH_IMCNAME( person ), SMST );
         strncpy( title, color_mtoi( CH_IMCTITLE( person ) ), SMST );
         strncpy( immline, process_immline( rank, flags, name, title ), SMST );
         strncat( immlines, immline, LGST - 1 );
      }
   }

   strncpy( head, process_who_head( pcount ), LGST );
   strncpy( tail, process_who_tail( pcount ), LGST );
   strncpy( master, process_who_template( head, tail, plrlines, immlines, plrheader, immheader ), LGST );

   return master;
}

static void imc_process_who( char *from )
{
   char whoreply[IMC_BUFF_SIZE];

   strncpy( whoreply, imc_assemble_who(), IMC_BUFF_SIZE );
   imc_send_whoreply( from, whoreply );
}

/* Finger code */
static void imc_process_finger( const char *from, const char *type )
{
   Character *victim;
   char buf[IMC_BUFF_SIZE], to[SMST];

   if( IsNullOrEmpty( type ) )
      return;

   type = imcOneArgument( type, to );
   if( !( victim = imc_find_user( type ) ) )
   {
      imc_send_whoreply( from, "No such player is online.\r\n" );
      return;
   }

   if( IMCISINVIS( victim ) || IMCPERM( victim ) < IMCPERM_MORT )
   {
      imc_send_whoreply( from, "No such player is online.\r\n" );
      return;
   }

   sprintf( buf,
             "\r\n~cPlayer Profile for ~W%s~c:\r\n"
             "~W-------------------------------\r\n"
             "~cStatus: ~W%s\r\n"
             "~cPermission level: ~W%s\r\n"
             "~cListening to channels [Names may not match your mud]: ~W%s\r\n",
             CH_IMCNAME( victim ), ( IMCAFK( victim ) ? "AFK" : "Lurking about" ),
             imcperm_names[IMCPERM( victim )],
             !IsNullOrEmpty( IMC_LISTEN( victim ) ) ? IMC_LISTEN( victim ) : "None" );

   if( !IsBitSet( IMCFLAG( victim ), IMC_PRIVACY ) )
      sprintf( buf + strlen( buf ),
                "~cEmail   : ~W%s\r\n"
                "~cHomepage: ~W%s\r\n"
                "~cICQ     : ~W%d\r\n"
                "~cAIM     : ~W%s\r\n"
                "~cYahoo   : ~W%s\r\n"
                "~cMSN     : ~W%s\r\n",
                !IsNullOrEmpty( IMC_EMAIL( victim ) ) ? IMC_EMAIL( victim ) : "None",
                !IsNullOrEmpty( IMC_HOMEPAGE( victim )  ) ? IMC_HOMEPAGE( victim ) : "None",
                IMC_ICQ( victim ),
                !IsNullOrEmpty( IMC_AIM( victim ) ) ? IMC_AIM( victim ) : "None",
                !IsNullOrEmpty( IMC_YAHOO( victim ) ) ? IMC_YAHOO( victim ) : "None",
                !IsNullOrEmpty( IMC_MSN( victim ) ) ? IMC_MSN( victim ) : "None" );

   sprintf( buf + strlen( buf ), "~W%s\r\n",
             !IsNullOrEmpty( IMC_COMMENT( victim ) ) ? IMC_COMMENT( victim ) : "" );

   imc_send_whoreply( from, buf );
}

PFUN( imc_recv_who )
{
   char type[SMST], buf[IMC_BUFF_SIZE];

   imc_getData( type, "type", packet );

   if( !strcasecmp( type, "who" ) )
   {
      imc_process_who( q->from );
      return;
   }
   else if( strstr( type, "finger" ) )
   {
      imc_process_finger( q->from, type );
      return;
   }
   else if( !strcasecmp( type, "info" ) )
   {
      sprintf( buf, "\r\n~WMUD Name    : ~c%s\r\n", this_imcmud->localname );
      sprintf( buf + strlen( buf ), "~WHost        : ~c%s\r\n", this_imcmud->ihost );
      sprintf( buf + strlen( buf ), "~WAdmin Email : ~c%s\r\n", this_imcmud->email );
      sprintf( buf + strlen( buf ), "~WWebsite     : ~c%s\r\n", this_imcmud->www );
      sprintf( buf + strlen( buf ), "~WIMC2 Version: ~c%s\r\n", this_imcmud->versionid );
      sprintf( buf + strlen( buf ), "~WDetails     : ~c%s\r\n", this_imcmud->details );
   }
   else
      sprintf( buf, "%s is not a valid option. Options are: who, finger, or info.\r\n", type );

   imc_send_whoreply( q->from, buf );
}

PFUN( imc_recv_whoreply )
{
   Character *vic;
   char txt[IMC_BUFF_SIZE];

   if( !( vic = imc_find_user( imc_nameof( q->to ) ) ) )
      return;

   imc_getData( txt, "text", packet );
   imc_to_pager( txt, vic );
}

static void imc_send_whoisreply( char *to, char *data )
{
   IMC_PACKET *p;

   p = imc_newpacket( "*", "whois-reply", to );
   imc_addtopacket( p, "text=%s", data );
   imc_write_packet( p );
}

PFUN( imc_recv_whoisreply )
{
   Character *vic;
   char txt[LGST];

   imc_getData( txt, "text", packet );

   if( ( vic = imc_find_user( imc_nameof( q->to ) ) ) != NULL )
      imc_to_char( txt, vic );
}

static void imc_send_whois( const char *from, const char *user )
{
   IMC_PACKET *p;

   p = imc_newpacket( from, "whois", user );
   imc_write_packet( p );
}

PFUN( imc_recv_whois )
{
   Character *vic;
   char buf[LGST];

   if( ( vic = imc_find_user( imc_nameof( q->to ) ) ) != NULL && !IMCISINVIS( vic ) )
   {
      sprintf( buf, "~RIMC Locate: ~Y%s@%s: ~cOnline.\r\n", CH_IMCNAME( vic ), this_imcmud->localname );
      imc_send_whoisreply( q->from, buf );
   }
}

PFUN( imc_recv_beep )
{
   Character *vic = NULL;
   char buf[LGST];

   if( !( vic = imc_find_user( imc_nameof( q->to ) ) ) || IMCPERM( vic ) < IMCPERM_MORT )
   {
      sprintf( buf, "No player named %s exists here.", q->to );
      imc_send_tell( "*", q->from, buf, 1 );
      return;
   }

   if( IMCISINVIS( vic ) )
   {
      if( strcasecmp( imc_nameof( q->from ), "*" ) )
      {
         sprintf( buf, "%s is not receiving beeps.", q->to );
         imc_send_tell( "*", q->from, buf, 1 );
      }
      return;
   }

   if( imc_isignoring( vic, q->from ) )
   {
      if( strcasecmp( imc_nameof( q->from ), "*" ) )
      {
         sprintf( buf, "%s is not receiving beeps.", q->to );
         imc_send_tell( "*", q->from, buf, 1 );
      }
      return;
   }

   if( IsBitSet( IMCFLAG( vic ), IMC_BEEP ) || IsBitSet( IMCFLAG( vic ), IMC_DENYBEEP ) )
   {
      if( strcasecmp( imc_nameof( q->from ), "*" ) )
      {
         sprintf( buf, "%s is not receiving beeps.", q->to );
         imc_send_tell( "*", q->from, buf, 1 );
      }
      return;
   }

   if( IMCAFK( vic ) )
   {
      if( strcasecmp( imc_nameof( q->from ), "*" ) )
      {
         sprintf( buf, "%s is currently AFK. Try back later.", q->to );
         imc_send_tell( "*", q->from, buf, 1 );
      }
      return;
   }

   /*
    * always display the true name here 
    */
   imc_printf( vic, "~c\a%s imcbeeps you.~!\r\n", q->from );
}

static void imc_send_beep( const char *from, const char *to )
{
   IMC_PACKET *p;

   p = imc_newpacket( from, "beep", to );
   imc_write_packet( p );
}

PFUN( imc_recv_isalive )
{
   REMOTEINFO *r;
   char version[SMST], netname[SMST], url[SMST], host[SMST], iport[SMST];

   imc_getData( version, "versionid", packet );
   imc_getData( netname, "networkname", packet );
   imc_getData( url, "url", packet );
   imc_getData( host, "host", packet );
   imc_getData( iport, "port", packet );

   if( !( r = imc_find_reminfo( imc_mudof( q->from ) ) ) )
   {
      imc_new_reminfo( imc_mudof( q->from ), version, netname, url, q->route );
      return;
   }

   r->expired = false;

   if( !IsNullOrEmpty( url ) )
   {
      IMCSTRFREE( r->url );
      r->url = IMCSTRALLOC( url );
   }

   if( !IsNullOrEmpty( version ) )
   {
      IMCSTRFREE( r->version );
      r->version = IMCSTRALLOC( version );
   }

   if( !IsNullOrEmpty( netname ) )
   {
      IMCSTRFREE( r->network );
      r->network = IMCSTRALLOC( netname );
   }

   if( !IsNullOrEmpty( q->route ) )
   {
      IMCSTRFREE( r->path );
      r->path = IMCSTRALLOC( q->route );
   }

   if( !IsNullOrEmpty( host ) )
   {
      IMCSTRFREE( r->remote.host );
      r->remote.host = IMCSTRALLOC( host );
   }

   if( !IsNullOrEmpty( iport ) )
   {
      IMCSTRFREE( r->remote.port );
      r->remote.port = IMCSTRALLOC( iport );
   }
}

PFUN( imc_send_keepalive )
{
   IMC_PACKET *p;

   if( q )
      p = imc_newpacket( "*", "is-alive", q->from );
   else
      p = imc_newpacket( "*", "is-alive", packet );
   imc_addtopacket( p, "versionid=%s", this_imcmud->versionid );
   imc_addtopacket( p, "url=%s", this_imcmud->www );
   imc_addtopacket( p, "host=%s", this_imcmud->ihost );
   imc_addtopacket( p, "port=%d", this_imcmud->iport );
   imc_write_packet( p );
}

static void imc_request_keepalive( void )
{
   IMC_PACKET *p;

   p = imc_newpacket( "*", "keepalive-request", "*@*" );
   imc_write_packet( p );

   imc_send_keepalive( NULL, "*@*" );
}

static void imc_firstrefresh( void )
{
   IMC_PACKET *p;

   p = imc_newpacket( "*", "ice-refresh", "IMC@$" );
   imc_write_packet( p );
}

PFUN( imc_recv_iceupdate )
{
   IMC_CHANNEL *c;
   char chan[SMST], owner[SMST], ops[SMST], invite[SMST], exclude[SMST], policy[SMST], level[SMST], lname[SMST];
   int perm;
   bool copen;

   imc_getData( chan, "channel", packet );
   imc_getData( owner, "owner", packet );
   imc_getData( ops, "operators", packet );
   imc_getData( invite, "invited", packet );
   imc_getData( exclude, "excluded", packet );
   imc_getData( policy, "policy", packet );
   imc_getData( level, "level", packet );
   imc_getData( lname, "localname", packet );

   if( !strcasecmp( policy, "open" ) )
      copen = true;
   else
      copen = false;

   perm = get_imcpermvalue( level );
   if( perm < 0 || perm > IMCPERM_IMP )
      perm = IMCPERM_ADMIN;

   if( !( c = imc_findchannel( chan ) ) )
   {
      imc_new_channel( chan, owner, ops, invite, exclude, copen, perm, lname );
      return;
   }

   if( IsNullOrEmpty( chan ) )
   {
      imclog( "%s: NULL channel name received, skipping", __FUNCTION__ );
      return;
   }

   IMCSTRFREE( c->Name );
   IMCSTRFREE( c->owner );
   IMCSTRFREE( c->operators );
   IMCSTRFREE( c->invited );
   IMCSTRFREE( c->excluded );

   c->Name = IMCSTRALLOC( chan );
   c->owner = IMCSTRALLOC( owner );
   c->operators = IMCSTRALLOC( ops );
   c->invited = IMCSTRALLOC( invite );
   c->excluded = IMCSTRALLOC( exclude );
   c->open = copen;
   if( c->level == IMCPERM_NOTSET )
      c->level = perm;

   c->refreshed = true;
}

PFUN( imc_recv_icedestroy )
{
   IMC_CHANNEL *c;
   char chan[SMST];

   imc_getData( chan, "channel", packet );

   if( !( c = imc_findchannel( chan ) ) )
      return;

   imc_freechan( c );
   imc_save_channels();
}

static int imctodikugender( int gender )
{
   int sex = 0;

   if( gender == 0 )
      sex = SEX_MALE;

   if( gender == 1 )
      sex = SEX_FEMALE;

   if( gender > 1 )
      sex = SEX_NEUTRAL;

   return sex;
}

static int dikutoimcgender( int gender )
{
   int sex = 0;

   if( gender > 2 || gender < 0 )
      sex = 2;

   if( gender == SEX_MALE )
      sex = 0;

   if( gender == SEX_FEMALE )
      sex = 1;

   return sex;
}

static int imc_get_ucache_gender( const char *name )
{
   IMCUCACHE_DATA *user;

   for( user = first_imcucache; user; user = user->next )
   {
      if( !strcasecmp( user->Name, name ) )
         return user->gender;
   }

   /*
    * -1 means you aren't in the list and need to be put there. 
    */
   return -1;
}

/* Saves the ucache info to disk because it would just be spamcity otherwise */
static void imc_save_ucache( void )
{
   FILE *fp;
   IMCUCACHE_DATA *user;

   if( !( fp = fopen( IMC_UCACHE_FILE, "w" ) ) )
   {
      imclog( "%s", "Couldn't write to IMC2 ucache file." );
      return;
   }

   for( user = first_imcucache; user; user = user->next )
   {
      fprintf( fp, "%s", "#UCACHE\n" );
      fprintf( fp, "Name %s\n", user->Name );
      fprintf( fp, "Sex  %d\n", user->gender );
      fprintf( fp, "Time %ld\n", ( long int )user->time );
      fprintf( fp, "%s", "End\n\n" );
   }
   fprintf( fp, "%s", "#END\n" );
   IMCFCLOSE( fp );
}

static void imc_prune_ucache( void )
{
   IMCUCACHE_DATA *ucache, *next_ucache;

   for( ucache = first_imcucache; ucache; ucache = next_ucache )
   {
      next_ucache = ucache->next;

      /*
       * Info older than 30 days is removed since this person likely hasn't logged in at all 
       */
      if( imc_time - ucache->time >= 2592000 )
      {
         IMCSTRFREE( ucache->Name );
         IMCUNLINK( ucache, first_imcucache, last_imcucache, next, prev );
         IMCDISPOSE( ucache );
      }
   }
   imc_save_ucache();
}

/* Updates user info if they exist, adds them if they don't. */
static void imc_ucache_update( const char *name, int gender )
{
   IMCUCACHE_DATA *user;

   for( user = first_imcucache; user; user = user->next )
   {
      if( !strcasecmp( user->Name, name ) )
      {
         user->gender = gender;
         user->time = imc_time;
         return;
      }
   }
   IMCCREATE( user, IMCUCACHE_DATA, 1 );
   user->Name = IMCSTRALLOC( name );
   user->gender = gender;
   user->time = imc_time;
   IMCLINK( user, first_imcucache, last_imcucache, next, prev );

   imc_save_ucache();
}

static void imc_send_ucache_update( const char *visname, int gender )
{
   IMC_PACKET *p;

   p = imc_newpacket( visname, "user-cache", "*@*" );
   imc_addtopacket( p, "gender=%d", gender );

   imc_write_packet( p );
}

PFUN( imc_recv_ucache )
{
   char gen[SMST];
   int sex, gender;

   imc_getData( gen, "gender", packet );
   gender = atoi( gen );

   sex = imc_get_ucache_gender( q->from );

   if( sex == gender )
      return;

   imc_ucache_update( q->from, gender );
}

static void imc_send_ucache_request( char *targetuser )
{
   IMC_PACKET *p;
   char to[SMST];

   sprintf( to, "*@%s", imc_mudof( targetuser ) );
   p = imc_newpacket( "*", "user-cache-request", to );
   imc_addtopacket( p, "user=%s", targetuser );
   imc_write_packet( p );
}

PFUN( imc_recv_ucache_request )
{
   IMC_PACKET *p;
   char to[SMST], user[SMST];
   int gender;

   imc_getData( user, "user", packet );
   gender = imc_get_ucache_gender( user );

   /*
    * Gender of -1 means they aren't in the mud's ucache table. Don't waste the reply packet. 
    */
   if( gender == -1 )
      return;

   sprintf( to, "*@%s", imc_mudof( q->from ) );
   p = imc_newpacket( "*", "user-cache-reply", to );
   imc_addtopacket( p, "user=%s", user );
   imc_addtopacket( p, "gender=%d", gender );
   imc_write_packet( p );
}

PFUN( imc_recv_ucache_reply )
{
   char user[SMST], gen[SMST];
   int sex, gender;

   imc_getData( user, "user", packet );
   imc_getData( gen, "gender", packet );
   gender = atoi( gen );

   sex = imc_get_ucache_gender( user );

   if( sex == gender )
      return;

   imc_ucache_update( user, gender );
}

PFUN( imc_recv_closenotify )
{
   REMOTEINFO *r;
   char host[SMST];

   imc_getData( host, "host", packet );

   if( !( r = imc_find_reminfo( host ) ) )
      return;

   r->expired = true;
}

static void imc_register_default_packets( void )
{
   /*
    * Once registered, these are not cleared unless the mud is shut down 
    */
   if( default_packets_registered )
      return;

   imc_register_packet_handler( "keepalive-request", imc_send_keepalive );
   imc_register_packet_handler( "is-alive", imc_recv_isalive );
   imc_register_packet_handler( "ice-update", imc_recv_iceupdate );
   imc_register_packet_handler( "ice-msg-r", imc_recv_pbroadcast );
   imc_register_packet_handler( "ice-msg-b", imc_recv_broadcast );
   imc_register_packet_handler( "user-cache", imc_recv_ucache );
   imc_register_packet_handler( "user-cache-request", imc_recv_ucache_request );
   imc_register_packet_handler( "user-cache-reply", imc_recv_ucache_reply );
   imc_register_packet_handler( "tell", imc_recv_tell );
   imc_register_packet_handler( "emote", imc_recv_emote );
   imc_register_packet_handler( "ice-destroy", imc_recv_icedestroy );
   imc_register_packet_handler( "who", imc_recv_who );
   imc_register_packet_handler( "who-reply", imc_recv_whoreply );
   imc_register_packet_handler( "whois", imc_recv_whois );
   imc_register_packet_handler( "whois-reply", imc_recv_whoisreply );
   imc_register_packet_handler( "beep", imc_recv_beep );
   imc_register_packet_handler( "ice-chan-who", imc_recv_chanwho );
   imc_register_packet_handler( "ice-chan-whoreply", imc_recv_chanwhoreply );
   imc_register_packet_handler( "close-notify", imc_recv_closenotify );

   default_packets_registered = true;
}

static PACKET_FUN *pfun_lookup( const char *type )
{
   IMC_PHANDLER *ph;

   for( ph = first_phandler; ph; ph = ph->next )
      if( !strcasecmp( type, ph->Name ) )
         return ph->func;

   return NULL;
}

static void imc_parse_packet( const char *packet )
{
   IMC_PACKET *p;
   PACKET_FUN *pfun;
   char arg[SMST];
   unsigned long seq;

   IMCCREATE( p, IMC_PACKET, 1 );

   packet = imcOneArgument( packet, p->from );
   packet = imcOneArgument( packet, arg );
   seq = atol( arg );

   packet = imcOneArgument( packet, p->route );
   packet = imcOneArgument( packet, p->type );
   packet = imcOneArgument( packet, p->to );

   /*
    * Banned muds are silently dropped - thanks to WynterNyght@IoG for noticing this was missing. 
    */
   if( imc_isbanned( p->from ) )
   {
      IMCDISPOSE( p );
      return;
   }

   pfun = pfun_lookup( p->type );
   if( !pfun )
   {
      if( imcpacketdebug )
      {
         imclog( "PACKET: From %s, Seq %lu, Route %s, Type %s, To %s, EXTRA %s",
                 p->from, seq, p->route, p->type, p->to, packet );
         imclog( "No packet handler function has been defined for %s", p->type );
      }
      IMCDISPOSE( p );
      return;
   }
   ( *pfun ) ( p, packet );

   /*
    * This might seem slow, but we need to track muds who don't send is-alive packets 
    */
   if( !( imc_find_reminfo( imc_mudof( p->from ) ) ) )
      imc_new_reminfo( imc_mudof( p->from ), "Unknown", this_imcmud->network, "Unknown", p->route );

   IMCDISPOSE( p );
}

static void imc_finalize_connection( char *name, char *netname )
{
   this_imcmud->state = IMC_ONLINE;

   if( !IsNullOrEmpty( netname ) )
   {
      IMCSTRFREE( this_imcmud->network );
      this_imcmud->network = IMCSTRALLOC( netname );
   }

   IMCSTRFREE( this_imcmud->servername );
   this_imcmud->servername = IMCSTRALLOC( name );

   imclog( "Connected to %s. Network ID: %s",
	   name,
	   IsNullOrEmpty( netname ) ? netname : "Unknown" );

   imcconnect_attempts = 0;
   imc_request_keepalive();
   imc_firstrefresh();
}

/* Handle an autosetup response from a supporting server - Samson 8-12-03 */
static void imc_handle_autosetup( char *source, char *servername, char *cmd, char *txt, char *use_sha256 )
{
   if( !strcasecmp( cmd, "reject" ) )
   {
      if( !strcasecmp( txt, "connected" ) )
      {
         imclog( "There is already a mud named %s connected to the network.", this_imcmud->localname );
         ImcShutdown( false );
         return;
      }
      if( !strcasecmp( txt, "private" ) )
      {
         imclog( "%s is a private server. Autosetup denied.", servername );
         ImcShutdown( false );
         return;
      }
      if( !strcasecmp( txt, "full" ) )
      {
         imclog( "%s has reached its connection limit. Autosetup denied.", servername );
         ImcShutdown( false );
         return;
      }
      if( !strcasecmp( txt, "ban" ) )
      {
         imclog( "%s has banned your connection. Autosetup denied.", servername );
         ImcShutdown( false );
         return;
      }
      imclog( "%s: Invalid 'reject' response. Autosetup failed.", servername );
      imclog( "Data received: %s %s %s %s %s", source, servername, cmd, txt, use_sha256 );
      ImcShutdown( false );
      return;
   }

   if( !strcasecmp( cmd, "accept" ) )
   {
      imclog( "Autosetup completed successfully." );
      if( !IsNullOrEmpty( use_sha256 ) && !strcasecmp( use_sha256, "SHA256-SET" ) )
      {
         imclog( "SHA-256 Authentication has been enabled." );
         this_imcmud->sha256pass = true;
         imc_save_config();
      }
      imc_finalize_connection( servername, txt );
      return;
   }

   imclog( "%s: Invalid autosetup response.", servername );
   imclog( "Data received: %s %s %s %s %s", source, servername, cmd, txt, use_sha256 );
   ImcShutdown( false );
}

static bool imc_write_socket( void )
{
   const char *ptr = this_imcmud->outbuf;
   int nleft = this_imcmud->outtop, nwritten = 0;

   if( nleft <= 0 )
      return 1;

   while( nleft > 0 )
   {
      if( ( nwritten = send( this_imcmud->Desc, ptr, nleft, 0 ) ) == SOCKET_ERROR )
      {
         if( nwritten == -1 && errno == EAGAIN )
         {
            char *p2 = this_imcmud->outbuf;

            ptr += nwritten;

            while( !IsNullOrEmpty( ptr ) )
               *p2++ = *ptr++;

            *p2 = '\0';

            this_imcmud->outtop = strlen( this_imcmud->outbuf );
            return true;
         }

         if( nwritten < 0 )
            imclog( "Write error on socket: %s", strerror( errno ) );
         else
            imclog( "%s", "Connection close detected on socket write." );

         ImcShutdown( true );
         return false;
      }
      nleft -= nwritten;
      ptr += nwritten;
   }

   if( imcpacketdebug )
   {
      imclog( "Packet Sent: %s", this_imcmud->outbuf );
      imclog( "Bytes sent: %d", this_imcmud->outtop );
   }
   this_imcmud->outbuf[0] = '\0';
   this_imcmud->outtop = 0;
   return 1;
}

static void imc_process_authentication( const char *packet )
{
   char command[SMST], rname[SMST], pw[SMST], version[SMST], netname[SMST], use_sha256[SMST];
   char response[LGST];

   packet = imcOneArgument( packet, command );
   packet = imcOneArgument( packet, rname );
   packet = imcOneArgument( packet, pw );
   packet = imcOneArgument( packet, version ); /* This is more or less ignored */
   packet = imcOneArgument( packet, netname );
   packet = imcOneArgument( packet, use_sha256 );

   if( IsNullOrEmpty( rname ) )
   {
      imclog( "%s", "Incomplete authentication packet. Unable to connect." );
      ImcShutdown( false );
      return;
   }

   if( !strcasecmp( command, "SHA256-AUTH-INIT" ) )
   {
      char pwd[SMST];
      char *cryptpwd;
      long auth_value = 0;

      if( IsNullOrEmpty( pw ) )
      {
         imclog( "SHA-256 Authentication failure: No auth_value was returned by %s.", rname );
         ImcShutdown( false );
         return;
      }

      /*
       * Lets encrypt this bastard now! 
       */
      auth_value = atol( pw );
      sprintf( pwd, "%ld%s%s", auth_value, this_imcmud->clientpw, this_imcmud->serverpw );
      cryptpwd = sha256_crypt( pwd );

      sprintf( response, "SHA256-AUTH-RESP %s %s version=%d", this_imcmud->localname, cryptpwd, IMC_VERSION );
      imc_write_buffer( response );
      return;
   }

   /*
    * SHA-256 response is pretty simple. If you blew the authentication, it happened on the server anyway. 
    * * rname=servername pw=Networkname
    */
   if( !strcasecmp( command, "SHA256-AUTH-APPR" ) )
   {
      imclog( "%s", "SHA-256 Authentication completed." );
      imc_finalize_connection( rname, pw );
      return;
   }

   /*
    * The old way. Nice and icky, but still very much required for compatibility. 
    */
   if( !strcasecmp( command, "PW" ) )
   {
      if( strcasecmp( this_imcmud->serverpw, pw ) )
      {
         imclog( "%s sent an improper serverpassword.", rname );
         ImcShutdown( false );
         return;
      }

      imclog( "%s", "Standard Authentication completed." );
      if( !IsNullOrEmpty( use_sha256 ) && !strcasecmp( use_sha256, "SHA256-SET" ) )
      {
         imclog( "SHA-256 Authentication has been enabled." );
         this_imcmud->sha256pass = true;
         imc_save_config();
      }
      imc_finalize_connection( rname, netname );
      return;
   }

   /*
    * Should only be received from servers supporting this obviously
    * * arg1=autosetup name=servername pw=command version=response netname=SHA256-SET
    */
   if( !strcasecmp( command, "autosetup" ) )
   {
      imc_handle_autosetup( command, rname, pw, version, netname );
      return;
   }

   imclog( "Invalid authentication response received from %s!!", rname );
   imclog( "Data received: %s %s %s %s %s", command, rname, pw, version, netname );
   ImcShutdown( false );
}

/*
 * Transfer one line from input buffer to input line.
 */
static bool imc_read_buffer( void )
{
   size_t i = 0, j = 0;
   unsigned char ended = 0;
   int k = 0;

   if( IsNullOrEmpty( this_imcmud->inbuf ) )
      return 0;

   k = strlen( this_imcmud->incomm );

   if( k < 0 )
      k = 0;

   for( i = 0; this_imcmud->inbuf[i] != '\0'
        && this_imcmud->inbuf[i] != '\n' && this_imcmud->inbuf[i] != '\r' && i < IMC_BUFF_SIZE; i++ )
   {
      this_imcmud->incomm[k++] = this_imcmud->inbuf[i];
   }

   while( this_imcmud->inbuf[i] == '\n' || this_imcmud->inbuf[i] == '\r' )
   {
      ended = 1;
      i++;
   }

   this_imcmud->incomm[k] = '\0';

   while( ( this_imcmud->inbuf[j] = this_imcmud->inbuf[i + j] ) != '\0' )
      j++;

   this_imcmud->inbuf[j] = '\0';
   return ended;
}

static bool imc_read_socket( void )
{
   size_t iStart, iErr;
   short loop_count = 0;
   bool begin = true;

   iStart = strlen( this_imcmud->inbuf );

   for( ;; )
   {
      int nRead;

      if( ++loop_count > 100 ) /* Yay hackish error traps! 100 loops likely means she's stuck. Break out with whatever is there. */
         break;

      nRead = recv( this_imcmud->Desc, this_imcmud->inbuf + iStart, sizeof( this_imcmud->inbuf ) - 10 - iStart, 0 );
      iErr = errno;
      if( nRead > 0 )
      {
         iStart += nRead;

         if( iStart >= sizeof( this_imcmud->inbuf ) - 10 )
            break;

         begin = false;
      }
      else if( nRead == 0 && this_imcmud->state == IMC_ONLINE )
      {
         if( !begin )
            break;

         imclog( "%s", "Connection close detected on read of IMC2 socket." );
         return false;
      }
      else if( iErr == EAGAIN || iErr == EWOULDBLOCK )
         break;
      else if( nRead == SOCKET_ERROR )
      {
         imclog( "%s: Descriptor error on #%d: %s", __FUNCTION__, this_imcmud->Desc, strerror( iErr ) );
         return false;
      }
   }
   this_imcmud->inbuf[iStart] = '\0';
   return true;
}

void ImcLoop( void )
{
   fd_set in_set, out_set;
   struct timeval last_time, null_time;

   gettimeofday( &last_time, NULL );
   imc_time = ( time_t ) last_time.tv_sec;

   if( imcwait > 0 )
      imcwait--;

   /*
    * Condition reached only if network shutdown after startup 
    */
   if( imcwait == 1 )
   {
      if( ++imcconnect_attempts > 3 )
      {
         if( this_imcmud->sha256pass )
         {
            imclog( "%s", "Unable to reconnect using SHA-256, trying standard authentication." );
            this_imcmud->sha256pass = false;
            imc_save_config();
            imcconnect_attempts = 0;
         }
         else
         {
            imcwait = -2;
            imclog( "%s", "Unable to reestablish connection to server. Abandoning reconnect." );
            return;
         }
      }
      ImcStartup( true, INVALID_SOCKET, false );
      return;
   }

   if( this_imcmud->state == IMC_OFFLINE || this_imcmud->Desc == INVALID_SOCKET )
      return;

   /*
    * Will prune the cache once every 24hrs after bootup time 
    */
   if( imcucache_clock <= imc_time )
   {
      imcucache_clock = imc_time + 86400;
      imc_prune_ucache();
   }

   FD_ZERO( &in_set );
   FD_ZERO( &out_set );
   FD_SET( this_imcmud->Desc, &in_set );
   FD_SET( this_imcmud->Desc, &out_set );

   null_time.tv_sec = null_time.tv_usec = 0;

#ifdef AMIGA
   if( WaitSelect( this_imcmud->Desc + 1, &in_set, &out_set, NULL, &null_time, 0 ) == SOCKET_ERROR )
#else
   if( select( this_imcmud->Desc + 1, &in_set, &out_set, NULL, &null_time ) == SOCKET_ERROR )
#endif
   {
      perror( "ImcLoop: select: poll" );
      ImcShutdown( true );
      return;
   }

   if( FD_ISSET( this_imcmud->Desc, &in_set ) )
   {
      if( !imc_read_socket() )
      {
	if( !IsNullOrEmpty( this_imcmud->inbuf ) )
         {
            if( imc_read_buffer() )
            {
               if( !strcasecmp( this_imcmud->incomm, "SHA-256 authentication is required." ) )
               {
                  imclog( "%s", "Unable to reconnect using standard authentication, trying SHA-256." );
                  this_imcmud->sha256pass = true;
                  imc_save_config();
               }
               else
                  imclog( "Buffer contents: %s", this_imcmud->incomm );
            }
         }
         FD_CLR( this_imcmud->Desc, &out_set );
         ImcShutdown( true );
         return;
      }

      while( imc_read_buffer() )
      {
         if( imcpacketdebug )
            imclog( "Packet received: %s", this_imcmud->incomm );

         switch ( this_imcmud->state )
         {
            default:
            case IMC_OFFLINE:
            case IMC_AUTH1:  /* Auth1 can only be set when still trying to contact the server */
               break;

            case IMC_AUTH2:  /* Now you've contacted the server and need to process the authentication response */
               imc_process_authentication( this_imcmud->incomm );
               this_imcmud->incomm[0] = '\0';
               break;

            case IMC_ONLINE: /* You're up, pass the bastard off to the packet parser */
               imc_parse_packet( this_imcmud->incomm );
               this_imcmud->incomm[0] = '\0';
               break;
         }
      }
   }

   /*if( this_imcmud->Desc > 0*/
   if( this_imcmud->Desc != INVALID_SOCKET
       && this_imcmud->outtop > 0
       && FD_ISSET( this_imcmud->Desc, &out_set )
       && !imc_write_socket() )
   {
      this_imcmud->outtop = 0;
      ImcShutdown( true );
   }
}

/************************************
 * User login and logout functions. *
 ************************************/

static void imc_adjust_perms( Character * ch )
{
   if( !this_imcmud )
      return;

   /*
    * Ugly hack to let the permission system adapt freely, but retains the ability to override that adaptation
    * * in the event you need to restrict someone to a lower level, or grant someone a higher level. This of
    * * course comes at the cost of forgetting you may have done so and caused the override flag to be set, but hey.
    * * This isn't a perfect system and never will be. Samson 2-8-04.
    */
   if( !IsBitSet( IMCFLAG( ch ), IMC_PERMOVERRIDE ) )
   {
      if( CH_IMCLEVEL( ch ) < this_imcmud->minlevel )
         IMCPERM( ch ) = IMCPERM_NONE;
      else if( CH_IMCLEVEL( ch ) >= this_imcmud->minlevel && CH_IMCLEVEL( ch ) < this_imcmud->immlevel )
         IMCPERM( ch ) = IMCPERM_MORT;
      else if( CH_IMCLEVEL( ch ) >= this_imcmud->immlevel && CH_IMCLEVEL( ch ) < this_imcmud->adminlevel )
         IMCPERM( ch ) = IMCPERM_IMM;
      else if( CH_IMCLEVEL( ch ) >= this_imcmud->adminlevel && CH_IMCLEVEL( ch ) < this_imcmud->implevel )
         IMCPERM( ch ) = IMCPERM_ADMIN;
      else if( CH_IMCLEVEL( ch ) >= this_imcmud->implevel )
         IMCPERM( ch ) = IMCPERM_IMP;
   }
}

static void imc_char_login( Character * ch )
{
   char buf[SMST];
   int gender, sex;

   if( !this_imcmud )
      return;

   imc_adjust_perms( ch );

   if( this_imcmud->state != IMC_ONLINE )
   {
      if( IMCPERM( ch ) >= IMCPERM_IMM && imcwait == -2 )
         imc_to_char( "~RThe IMC2 connection is down. Attempts to reconnect were abandoned due to excessive failures.\r\n",
                      ch );
      return;
   }

   if( IMCPERM( ch ) < IMCPERM_MORT )
      return;

   sprintf( buf, "%s@%s", CH_IMCNAME( ch ), this_imcmud->localname );
   gender = imc_get_ucache_gender( buf );
   sex = dikutoimcgender( CH_IMCSEX( ch ) );

   if( gender == sex )
      return;

   imc_ucache_update( buf, sex );
   if( !IsBitSet( IMCFLAG( ch ), IMC_INVIS ) )
      imc_send_ucache_update( CH_IMCNAME( ch ), sex );
}

bool ImcLoadCharacter( Character * ch, FILE * fp, const char *word )
{
   bool fMatch = false;

   if( IsNpc( ch ) )
      return false;

   if( IMCPERM( ch ) == IMCPERM_NOTSET )
      imc_adjust_perms( ch );

   switch ( word[0] )
   {
      case 'I':
         KEY( "IMCPerm", IMCPERM( ch ), ReadInt( fp, Log ) );
         KEY( "IMCEmail", IMC_EMAIL( ch ), imcReadLine( fp ) );
         KEY( "IMCAIM", IMC_AIM( ch ), imcReadLine( fp ) );
         KEY( "IMCICQ", IMC_ICQ( ch ), ReadInt( fp, Log ) );
         KEY( "IMCYahoo", IMC_YAHOO( ch ), imcReadLine( fp ) );
         KEY( "IMCMSN", IMC_MSN( ch ), imcReadLine( fp ) );
         KEY( "IMCHomepage", IMC_HOMEPAGE( ch ), imcReadLine( fp ) );
         KEY( "IMCComment", IMC_COMMENT( ch ), imcReadLine( fp ) );
         if( !strcasecmp( word, "IMCFlags" ) )
         {
            IMCFLAG( ch ) = ReadInt( fp, Log );
            imc_char_login( ch );
            fMatch = true;
            break;
         }

         if( !strcasecmp( word, "IMClisten" ) )
         {
            IMC_LISTEN( ch ) = imcReadLine( fp );
            if( IMC_LISTEN( ch ) != NULL && this_imcmud->state == IMC_ONLINE )
            {
               IMC_CHANNEL *channel = NULL;
               const char *channels = IMC_LISTEN( ch );
               char arg[SMST];

               while( 1 )
               {
		 if( IsNullOrEmpty( channels ) )
		   break;
		 channels = imcOneArgument( channels, arg );

                  if( !( channel = imc_findchannel( arg ) ) )
                     imc_removename( &IMC_LISTEN( ch ), arg );
                  if( channel && IMCPERM( ch ) < channel->level )
                     imc_removename( &IMC_LISTEN( ch ), arg );
               }
            }
            fMatch = true;
            break;
         }

         if( !strcasecmp( word, "IMCdeny" ) )
         {
            IMC_DENY( ch ) = imcReadLine( fp );
            if( IMC_DENY( ch ) != NULL && this_imcmud->state == IMC_ONLINE )
            {
               IMC_CHANNEL *channel = NULL;
               const char *channels = IMC_DENY( ch );
               char arg[SMST];

               while( 1 )
               {
		 if( IsNullOrEmpty( channels ) )
                     break;
                  channels = imcOneArgument( channels, arg );

                  if( !( channel = imc_findchannel( arg ) ) )
                     imc_removename( &IMC_DENY( ch ), arg );
                  if( channel && IMCPERM( ch ) < channel->level )
                     imc_removename( &IMC_DENY( ch ), arg );
               }
            }
            fMatch = true;
            break;
         }

         if( !strcasecmp( word, "IMCignore" ) )
         {
            IMC_IGNORE *temp;

            IMCCREATE( temp, IMC_IGNORE, 1 );
            temp->Name = imcReadLine( fp );
            IMCLINK( temp, FIRST_IMCIGNORE( ch ), LAST_IMCIGNORE( ch ), next, prev );
            fMatch = true;
            break;
         }
         break;
   }
   return fMatch;
}

void ImcSaveCharacter( const Character * ch, FILE * fp )
{
   IMC_IGNORE *temp;

   if( IsNpc( ch ) )
      return;

   fprintf( fp, "IMCPerm      %d\n", IMCPERM( ch ) );
   fprintf( fp, "IMCFlags     %ld\n", ( long int )IMCFLAG( ch ) );
   if( !IsNullOrEmpty( IMC_LISTEN( ch ) ) )
      fprintf( fp, "IMCListen    %s\n", IMC_LISTEN( ch ) );
   if( !IsNullOrEmpty( IMC_DENY( ch ) ) )
      fprintf( fp, "IMCDeny      %s\n", IMC_DENY( ch ) );
   if( !IsNullOrEmpty( IMC_EMAIL( ch ) ) )
      fprintf( fp, "IMCEmail     %s\n", IMC_EMAIL( ch ) );
   if( !IsNullOrEmpty( IMC_HOMEPAGE( ch ) ) )
      fprintf( fp, "IMCHomepage  %s\n", IMC_HOMEPAGE( ch ) );
   if( IMC_ICQ( ch ) )
      fprintf( fp, "IMCICQ       %d\n", IMC_ICQ( ch ) );
   if( !IsNullOrEmpty( IMC_AIM( ch ) ) )
      fprintf( fp, "IMCAIM       %s\n", IMC_AIM( ch ) );
   if( !IsNullOrEmpty( IMC_YAHOO( ch ) ) )
      fprintf( fp, "IMCYahoo     %s\n", IMC_YAHOO( ch ) );
   if( !IsNullOrEmpty( IMC_MSN( ch ) ) )
      fprintf( fp, "IMCMSN       %s\n", IMC_MSN( ch ) );
   if( !IsNullOrEmpty( IMC_COMMENT( ch ) ) )
      fprintf( fp, "IMCComment   %s\n", IMC_COMMENT( ch ) );
   for( temp = FIRST_IMCIGNORE( ch ); temp; temp = temp->next )
      fprintf( fp, "IMCignore    %s\n", temp->Name );
}

void ImcFreeCharacter( Character * ch )
{
   IMC_IGNORE *ign, *ign_next;
   int x;

   if( IsNpc( ch ) )
      return;

   if( CH_IMCDATA( ch ) == NULL )
      return;

   for( ign = FIRST_IMCIGNORE( ch ); ign; ign = ign_next )
   {
      ign_next = ign->next;
      IMCSTRFREE( ign->Name );
      IMCUNLINK( ign, FIRST_IMCIGNORE( ch ), LAST_IMCIGNORE( ch ), next, prev );
      IMCDISPOSE( ign );
   }
   for( x = 0; x < MAX_IMCTELLHISTORY; x++ )
      IMCSTRFREE( IMCTELLHISTORY( ch, x ) );
   IMCSTRFREE( IMC_LISTEN( ch ) );
   IMCSTRFREE( IMC_DENY( ch ) );
   IMCSTRFREE( IMC_RREPLY( ch ) );
   IMCSTRFREE( IMC_RREPLY_NAME( ch ) );
   IMCSTRFREE( IMC_EMAIL( ch ) );
   IMCSTRFREE( IMC_HOMEPAGE( ch ) );
   IMCSTRFREE( IMC_AIM( ch ) );
   IMCSTRFREE( IMC_YAHOO( ch ) );
   IMCSTRFREE( IMC_MSN( ch ) );
   IMCSTRFREE( IMC_COMMENT( ch ) );
   IMCDISPOSE( CH_IMCDATA( ch ) );
}

void ImcInitializeCharacter( Character * ch )
{
   if( IsNpc( ch ) )
      return;

   IMCCREATE( CH_IMCDATA( ch ), IMC_CHARDATA, 1 );
   IMC_LISTEN( ch ) = NULL;
   IMC_DENY( ch ) = NULL;
   IMC_RREPLY( ch ) = NULL;
   IMC_RREPLY_NAME( ch ) = NULL;
   IMC_EMAIL( ch ) = NULL;
   IMC_HOMEPAGE( ch ) = NULL;
   IMC_AIM( ch ) = NULL;
   IMC_YAHOO( ch ) = NULL;
   IMC_MSN( ch ) = NULL;
   IMC_COMMENT( ch ) = NULL;
   IMCFLAG( ch ) = 0;
   SetBit( IMCFLAG( ch ), IMC_COLORFLAG );
   FIRST_IMCIGNORE( ch ) = NULL;
   LAST_IMCIGNORE( ch ) = NULL;
   IMCPERM( ch ) = IMCPERM_NOTSET;
}

/*******************************************
 * Network Startup and Shutdown functions. *
 *******************************************/

static void imc_loadhistory( void )
{
   char filename[256];
   FILE *tempfile;
   IMC_CHANNEL *tempchan = NULL;
   int x;

   for( tempchan = first_imc_channel; tempchan; tempchan = tempchan->next )
   {
      if( !tempchan->local_name )
         continue;

      sprintf( filename, "%s%s.hist", IMC_DIR, tempchan->local_name );

      if( !( tempfile = fopen( filename, "r" ) ) )
         continue;

      for( x = 0; x < MAX_IMCHISTORY; x++ )
      {
         if( feof( tempfile ) )
            tempchan->history[x] = NULL;
         else
            tempchan->history[x] = imcReadLine( tempfile );
      }
      IMCFCLOSE( tempfile );
      remove( filename );
   }
}

static void imc_savehistory( void )
{
   char filename[256];
   FILE *tempfile;
   IMC_CHANNEL *tempchan = NULL;
   int x;

   for( tempchan = first_imc_channel; tempchan; tempchan = tempchan->next )
   {
      if( !tempchan->local_name )
         continue;

      if( !tempchan->history[0] )
         continue;

      sprintf( filename, "%s%s.hist", IMC_DIR, tempchan->local_name );

      if( !( tempfile = fopen( filename, "w" ) ) )
         continue;

      for( x = 0; x < MAX_IMCHISTORY; x++ )
      {
         if( tempchan->history[x] != NULL )
            fprintf( tempfile, "%s\n", tempchan->history[x] );
      }
      IMCFCLOSE( tempfile );
   }
}

static void imc_save_channels( void )
{
   IMC_CHANNEL *c;
   FILE *fp;

   if( !( fp = fopen( IMC_CHANNEL_FILE, "w" ) ) )
   {
      imcbug( "Can't write to %s", IMC_CHANNEL_FILE );
      return;
   }

   for( c = first_imc_channel; c; c = c->next )
   {
     if( IsNullOrEmpty( c->local_name ) )
         continue;

      fprintf( fp, "%s", "#IMCCHAN\n" );
      fprintf( fp, "ChanName   %s\n", c->Name );
      fprintf( fp, "ChanLocal  %s\n", c->local_name );
      fprintf( fp, "ChanRegF   %s\n", c->regformat );
      fprintf( fp, "ChanEmoF   %s\n", c->emoteformat );
      fprintf( fp, "ChanSocF   %s\n", c->socformat );
      fprintf( fp, "ChanLevel  %d\n", c->level );
      fprintf( fp, "%s", "End\n\n" );
   }
   fprintf( fp, "%s", "#END\n" );
   IMCFCLOSE( fp );
}

static void imc_readchannel( IMC_CHANNEL * channel, FILE * fp )
{
   const char *word;
   bool fMatch;

   for( ;; )
   {
      word = feof( fp ) ? "End" : ReadWord( fp, Log );
      fMatch = false;

      switch ( word[0] )
      {
         case '*':
            fMatch = true;
            ReadToEndOfLine( fp, Log );
            break;

         case 'C':
            KEY( "ChanName", channel->Name, imcReadLine( fp ) );
            KEY( "ChanLocal", channel->local_name, imcReadLine( fp ) );
            KEY( "ChanRegF", channel->regformat, imcReadLine( fp ) );
            KEY( "ChanEmoF", channel->emoteformat, imcReadLine( fp ) );
            KEY( "ChanSocF", channel->socformat, imcReadLine( fp ) );
            KEY( "ChanLevel", channel->level, ReadInt( fp, Log ) );
            break;

         case 'E':
            if( !strcasecmp( word, "End" ) )
            {
               /*
                * Legacy support to convert channel permissions 
                */
               if( channel->level > IMCPERM_IMP )
               {
                  /*
                   * The IMCPERM_NONE condition should realistically never happen.... 
                   */
                  if( channel->level < this_imcmud->minlevel )
                     channel->level = IMCPERM_NONE;
                  else if( channel->level >= this_imcmud->minlevel && channel->level < this_imcmud->immlevel )
                     channel->level = IMCPERM_MORT;
                  else if( channel->level >= this_imcmud->immlevel && channel->level < this_imcmud->adminlevel )
                     channel->level = IMCPERM_IMM;
                  else if( channel->level >= this_imcmud->adminlevel && channel->level < this_imcmud->implevel )
                     channel->level = IMCPERM_ADMIN;
                  else if( channel->level >= this_imcmud->implevel )
                     channel->level = IMCPERM_IMP;
               }
            }
            return;
            break;
      }

      if( !fMatch )
         imcbug( "imc_readchannel: no match: %s", word );
   }
}

static void imc_loadchannels( void )
{
   FILE *fp;
   IMC_CHANNEL *channel;

   first_imc_channel = NULL;
   last_imc_channel = NULL;

   imclog( "%s", "Loading channels..." );

   if( !( fp = fopen( IMC_CHANNEL_FILE, "r" ) ) )
   {
      imcbug( "%s", "Can't open imc channel file" );
      return;
   }

   for( ;; )
   {
      char letter;
      char *word;

      letter = ReadChar( fp, Log );
      if( letter == '*' )
      {
         ReadToEndOfLine( fp, Log );
         continue;
      }

      if( letter != '#' )
      {
         imcbug( "%s", "imc_loadchannels: # not found." );
         break;
      }

      word = ReadWord( fp, Log );
      if( !strcasecmp( word, "IMCCHAN" ) )
      {
         int x;

         IMCCREATE( channel, IMC_CHANNEL, 1 );
         imc_readchannel( channel, fp );

         for( x = 0; x < MAX_IMCHISTORY; x++ )
            channel->history[x] = NULL;

         channel->refreshed = false;   /* Prevents crash trying to use a bogus channel */
         IMCLINK( channel, first_imc_channel, last_imc_channel, next, prev );
         imclog( "configured %s as %s", channel->Name, channel->local_name );
         continue;
      }
      else if( !strcasecmp( word, "END" ) )
         break;
      else
      {
         imcbug( "imc_loadchannels: bad section: %s.", word );
         continue;
      }
   }
   IMCFCLOSE( fp );
}

/* Save current mud-level ban list. Short, simple. */
static void imc_savebans( void )
{
   FILE *out;
   IMC_BAN *ban;

   if( !( out = fopen( IMC_BAN_FILE, "w" ) ) )
   {
      imcbug( "%s", "imc_savebans: error opening ban file for write" );
      return;
   }

   fprintf( out, "%s", "#IGNORES\n" );

   for( ban = first_imc_ban; ban; ban = ban->next )
      fprintf( out, "%s\n", ban->Name );

   fprintf( out, "%s", "#END\n" );

   IMCFCLOSE( out );
}

static void imc_readbans( void )
{
   FILE *inf;
   char *word;
   char temp[SMST];

   imclog( "%s", "Loading ban list..." );

   if( !( inf = fopen( IMC_BAN_FILE, "r" ) ) )
   {
      imcbug( "%s", "imc_readbans: couldn't open ban file" );
      return;
   }

   word = ReadWord( inf, Log );

   if( strcasecmp( word, "#IGNORES" ) )
   {
      imcbug( "%s", "imc_readbans: Corrupt file" );
      IMCFCLOSE( inf );
      return;
   }

   while( !feof( inf ) && !ferror( inf ) )
   {
     strncpy( temp, ReadWord( inf, Log ), SMST );
     
     if( !strcasecmp( temp, "#END" ) )
      {
         IMCFCLOSE( inf );
         return;
      }
      imc_addban( temp );
   }

   if( ferror( inf ) )
   {
      perror( "imc_readbans" );
      IMCFCLOSE( inf );
      return;
   }

   IMCFCLOSE( inf );
}

static void imc_readcolor( IMC_COLOR * color, FILE * fp )
{
   const char *word;
   bool fMatch;

   for( ;; )
   {
      word = feof( fp ) ? "End" : ReadWord( fp, Log );
      fMatch = false;

      switch ( word[0] )
      {
         case '*':
            fMatch = true;
            ReadToEndOfLine( fp, Log );
            break;

         case 'E':
            if( !strcasecmp( word, "End" ) )
               return;
            break;

         case 'I':
            KEY( "IMCtag", color->imctag, imcReadLine( fp ) );
            break;

         case 'M':
            KEY( "Mudtag", color->mudtag, imcReadLine( fp ) );
            break;

         case 'N':
            KEY( "Name", color->Name, imcReadLine( fp ) );
            break;
      }
      if( !fMatch )
         imcbug( "imc_readcolor: no match: %s", word );
   }
}

static void imc_load_color_table( void )
{
   FILE *fp;
   IMC_COLOR *color;

   first_imc_color = last_imc_color = NULL;

   imclog( "%s", "Loading IMC2 color table..." );

   if( !( fp = fopen( IMC_COLOR_FILE, "r" ) ) )
   {
      imclog( "%s", "No color table found." );
      return;
   }

   for( ;; )
   {
      char letter;
      char *word;

      letter = ReadChar( fp, Log );
      if( letter == '*' )
      {
         ReadToEndOfLine( fp, Log );
         continue;
      }

      if( letter != '#' )
      {
         imcbug( "%s", "imc_load_color_table: # not found." );
         break;
      }

      word = ReadWord( fp, Log );
      if( !strcasecmp( word, "COLOR" ) )
      {
         IMCCREATE( color, IMC_COLOR, 1 );
         imc_readcolor( color, fp );
         IMCLINK( color, first_imc_color, last_imc_color, next, prev );
         continue;
      }
      else if( !strcasecmp( word, "END" ) )
         break;
      else
      {
         imcbug( "imc_load_color_table: bad section: %s.", word );
         continue;
      }
   }
   IMCFCLOSE( fp );
}

static void imc_savehelps( void )
{
   FILE *fp;
   IMC_HelpFile *help;

   if( !( fp = fopen( IMC_HELP_FILE, "w" ) ) )
   {
      imclog( "%s", "Couldn't write to IMC2 help file." );
      return;
   }

   for( help = first_imc_help; help; help = help->next )
   {
      fprintf( fp, "%s", "#HELP\n" );
      fprintf( fp, "Name %s\n", help->Name );
      fprintf( fp, "Perm %s\n", imcperm_names[help->level] );
      fprintf( fp, "Text %s¢\n", help->text );
      fprintf( fp, "%s", "End\n\n" );
   }
   fprintf( fp, "%s", "#END\n" );
   IMCFCLOSE( fp );
}

static void imc_readhelp( IMC_HelpFile * help, FILE * fp )
{
   const char *word;
   char hbuf[LGST];
   int permvalue;
   bool fMatch;

   for( ;; )
   {
      word = feof( fp ) ? "End" : ReadWord( fp, Log );
      fMatch = false;

      switch ( word[0] )
      {
         case '*':
            fMatch = true;
            ReadToEndOfLine( fp, Log );
            break;

         case 'E':
            if( !strcasecmp( word, "End" ) )
               return;
            break;

         case 'N':
            KEY( "Name", help->Name, imcReadLine( fp ) );
            break;

         case 'P':
            if( !strcasecmp( word, "Perm" ) )
            {
               word = ReadWord( fp, Log );
               permvalue = get_imcpermvalue( word );

               if( permvalue < 0 || permvalue > IMCPERM_IMP )
               {
                  imcbug( "imc_readhelp: Command %s loaded with invalid permission. Set to Imp.", help->Name );
                  help->level = IMCPERM_IMP;
               }
               else
                  help->level = permvalue;
               fMatch = true;
               break;
            }
            break;

         case 'T':
            if( !strcasecmp( word, "Text" ) )
            {
               int num = 0;

               while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF
			 && hbuf[num] != '¢' && num < ( LGST - 2 ) )
                  num++;
               hbuf[num] = '\0';
               help->text = IMCSTRALLOC( hbuf );
               fMatch = true;
               break;
            }
            break;
      }
      if( !fMatch )
         imcbug( "imc_readhelp: no match: %s", word );
   }
}

static void imc_LoadHelpFiles( void )
{
   FILE *fp;
   IMC_HelpFile *help;

   first_imc_help = last_imc_help = NULL;

   imclog( "%s", "Loading IMC2 help file..." );

   if( !( fp = fopen( IMC_HELP_FILE, "r" ) ) )
   {
      imclog( "%s", "No help file found." );
      return;
   }

   for( ;; )
   {
      char letter;
      char *word;

      letter = ReadChar( fp, Log );
      if( letter == '*' )
      {
         ReadToEndOfLine( fp, Log );
         continue;
      }

      if( letter != '#' )
      {
         imcbug( "%s", "imc_LoadHelpFiles: # not found." );
         break;
      }

      word = ReadWord( fp, Log );
      if( !strcasecmp( word, "HELP" ) )
      {
         IMCCREATE( help, IMC_HelpFile, 1 );
         imc_readhelp( help, fp );
         IMCLINK( help, first_imc_help, last_imc_help, next, prev );
         continue;
      }
      else if( !strcasecmp( word, "END" ) )
         break;
      else
      {
         imcbug( "imc_LoadHelpFiles: bad section: %s.", word );
         continue;
      }
   }
   IMCFCLOSE( fp );
}

static void imc_savecommands( void )
{
   FILE *fp;
   IMC_CMD_DATA *cmd;
   IMC_ALIAS *alias;

   if( !( fp = fopen( IMC_CMD_FILE, "w" ) ) )
   {
      imclog( "%s", "Couldn't write to IMC2 command file." );
      return;
   }

   for( cmd = first_imc_command; cmd; cmd = cmd->next )
   {
      fprintf( fp, "%s", "#COMMAND\n" );
      fprintf( fp, "Name      %s\n", cmd->Name );
      if( cmd->function != NULL )
         fprintf( fp, "Code      %s\n", imc_funcname( cmd->function ) );
      else
         fprintf( fp, "%s", "Code      NULL\n" );
      fprintf( fp, "Perm      %s\n", imcperm_names[cmd->level] );
      fprintf( fp, "Connected %d\n", cmd->connected );
      for( alias = cmd->first_alias; alias; alias = alias->next )
         fprintf( fp, "Alias     %s\n", alias->Name );
      fprintf( fp, "%s", "End\n\n" );
   }
   fprintf( fp, "%s", "#END\n" );
   IMCFCLOSE( fp );
}

static void imc_readcommand( IMC_CMD_DATA * cmd, FILE * fp )
{
   IMC_ALIAS *alias;
   const char *word;
   int permvalue;
   bool fMatch;

   for( ;; )
   {
      word = feof( fp ) ? "End" : ReadWord( fp, Log );
      fMatch = false;

      switch ( word[0] )
      {
         case '*':
            fMatch = true;
            ReadToEndOfLine( fp, Log );
            break;

         case 'E':
            if( !strcasecmp( word, "End" ) )
               return;
            break;

         case 'A':
            if( !strcasecmp( word, "Alias" ) )
            {
               IMCCREATE( alias, IMC_ALIAS, 1 );
               alias->Name = imcReadLine( fp );
               IMCLINK( alias, cmd->first_alias, cmd->last_alias, next, prev );
               fMatch = true;
               break;
            }
            break;

         case 'C':
            KEY( "Connected", cmd->connected, ReadInt( fp, Log ) );
            if( !strcasecmp( word, "Code" ) )
            {
               word = ReadWord( fp, Log );
               cmd->function = imc_function( word );
               if( cmd->function == NULL )
                  imcbug( "imc_readcommand: Command %s loaded with invalid function. Set to NULL.", cmd->Name );
               fMatch = true;
               break;
            }
            break;

         case 'N':
            KEY( "Name", cmd->Name, imcReadLine( fp ) );
            break;

         case 'P':
            if( !strcasecmp( word, "Perm" ) )
            {
               word = ReadWord( fp, Log );
               permvalue = get_imcpermvalue( word );

               if( permvalue < 0 || permvalue > IMCPERM_IMP )
               {
                  imcbug( "imc_readcommand: Command %s loaded with invalid permission. Set to Imp.", cmd->Name );
                  cmd->level = IMCPERM_IMP;
               }
               else
                  cmd->level = permvalue;
               fMatch = true;
               break;
            }
            break;
      }
      if( !fMatch )
         imcbug( "imc_readcommand: no match: %s", word );
   }
}

static bool imc_LoadCommands( void )
{
   FILE *fp;
   IMC_CMD_DATA *cmd;

   first_imc_command = last_imc_command = NULL;

   imclog( "%s", "Loading IMC2 command table..." );

   if( !( fp = fopen( IMC_CMD_FILE, "r" ) ) )
   {
      imclog( "%s", "No command table found." );
      return false;
   }

   for( ;; )
   {
      char letter;
      char *word;

      letter = ReadChar( fp, Log );
      if( letter == '*' )
      {
         ReadToEndOfLine( fp, Log );
         continue;
      }

      if( letter != '#' )
      {
         imcbug( "%s", "imc_LoadCommands: # not found." );
         break;
      }

      word = ReadWord( fp, Log );
      if( !strcasecmp( word, "COMMAND" ) )
      {
         IMCCREATE( cmd, IMC_CMD_DATA, 1 );
         imc_readcommand( cmd, fp );
         IMCLINK( cmd, first_imc_command, last_imc_command, next, prev );
         continue;
      }
      else if( !strcasecmp( word, "END" ) )
         break;
      else
      {
         imcbug( "imc_LoadCommands: bad section: %s.", word );
         continue;
      }
   }
   IMCFCLOSE( fp );
   return true;
}

static void imc_readucache( IMCUCACHE_DATA * user, FILE * fp )
{
   const char *word;
   bool fMatch;

   for( ;; )
   {
      word = feof( fp ) ? "End" : ReadWord( fp, Log );
      fMatch = false;

      switch ( word[0] )
      {
         case '*':
            fMatch = true;
            ReadToEndOfLine( fp, Log );
            break;

         case 'N':
            KEY( "Name", user->Name, imcReadLine( fp ) );
            break;

         case 'S':
            KEY( "Sex", user->gender, ReadInt( fp, Log ) );
            break;

         case 'T':
            KEY( "Time", user->time, ReadInt( fp, Log ) );
            break;

         case 'E':
            if( !strcasecmp( word, "End" ) )
               return;
            break;
      }
      if( !fMatch )
         imcbug( "imc_readucache: no match: %s", word );
   }
}

static void imc_load_ucache( void )
{
   FILE *fp;
   IMCUCACHE_DATA *user;

   imclog( "%s", "Loading ucache data..." );

   if( !( fp = fopen( IMC_UCACHE_FILE, "r" ) ) )
   {
      imclog( "%s", "No ucache data found." );
      return;
   }

   for( ;; )
   {
      char letter;
      char *word;

      letter = ReadChar( fp, Log );
      if( letter == '*' )
      {
         ReadToEndOfLine( fp, Log );
         continue;
      }

      if( letter != '#' )
      {
         imcbug( "%s", "imc_load_ucahe: # not found." );
         break;
      }

      word = ReadWord( fp, Log );
      if( !strcasecmp( word, "UCACHE" ) )
      {
         IMCCREATE( user, IMCUCACHE_DATA, 1 );
         imc_readucache( user, fp );
         IMCLINK( user, first_imcucache, last_imcucache, next, prev );
         continue;
      }
      else if( !strcasecmp( word, "END" ) )
         break;
      else
      {
         imcbug( "imc_load_ucache: bad section: %s.", word );
         continue;
      }
   }
   IMCFCLOSE( fp );
   imc_prune_ucache();
   imcucache_clock = imc_time + 86400;
}

static void imc_save_config( void )
{
   FILE *fp;

   if( !( fp = fopen( IMC_CONFIG_FILE, "w" ) ) )
   {
      imclog( "%s", "Couldn't write to config file." );
      return;
   }

   fprintf( fp, "%s", "$IMCCONFIG\n\n" );
   fprintf( fp, "# %s config file.\n", this_imcmud->versionid );
   fprintf( fp, "%s", "# This file can now support the use of tildes in your strings.\n" );
   fprintf( fp, "%s", "# This information can be edited online using the 'imcconfig' command.\n" );
   fprintf( fp, "LocalName      %s\n", this_imcmud->localname );
   fprintf( fp, "Autoconnect    %d\n", this_imcmud->autoconnect );
   fprintf( fp, "MinPlayerLevel %d\n", this_imcmud->minlevel );
   fprintf( fp, "MinImmLevel    %d\n", this_imcmud->immlevel );
   fprintf( fp, "AdminLevel     %d\n", this_imcmud->adminlevel );
   fprintf( fp, "Implevel       %d\n", this_imcmud->implevel );
   fprintf( fp, "InfoName       %s\n", this_imcmud->fullname );
   fprintf( fp, "InfoHost       %s\n", this_imcmud->ihost );
   fprintf( fp, "InfoPort       %d\n", this_imcmud->iport );
   fprintf( fp, "InfoEmail      %s\n", this_imcmud->email );
   fprintf( fp, "InfoWWW        %s\n", this_imcmud->www );
   fprintf( fp, "InfoBase       %s\n", this_imcmud->base );
   fprintf( fp, "InfoDetails    %s\n\n", this_imcmud->details );
   fprintf( fp, "%s", "# Your server connection information goes here.\n" );
   fprintf( fp, "%s", "# This information should be available from the network you plan to join.\n" );
   fprintf( fp, "ServerAddr     %s\n", this_imcmud->rhost );
   fprintf( fp, "ServerPort     %d\n", this_imcmud->rport );
   fprintf( fp, "ClientPwd      %s\n", this_imcmud->clientpw );
   fprintf( fp, "ServerPwd      %s\n", this_imcmud->serverpw );
   fprintf( fp, "#SHA256 auth: 0 = disabled, 1 = enabled\n" );
   fprintf( fp, "SHA256         %d\n", this_imcmud->sha256 );
   if( this_imcmud->sha256pass )
   {
      fprintf( fp, "%s",
               "#Your server is expecting SHA256 authentication now. Do not remove this line unless told to do so.\n" );
      fprintf( fp, "SHA256Pwd      %d\n", this_imcmud->sha256pass );
   }
   fprintf( fp, "%s", "End\n\n" );
   fprintf( fp, "%s", "$END\n" );
   IMCFCLOSE( fp );
}

static void imcfread_config_file( FILE * fin )
{
   const char *word;
   bool fMatch;

   for( ;; )
   {
     word = feof( fin ) ? "end" : ReadWord( fin, Log );
      fMatch = false;

      switch ( word[0] )
      {
         case '#':
            fMatch = true;
            ReadToEndOfLine( fin, Log );
            break;

         case 'A':
           KEY( "Autoconnect", this_imcmud->autoconnect, ReadInt( fin, Log ) );
           KEY( "AdminLevel", this_imcmud->adminlevel, ReadInt( fin, Log ) );
            break;

         case 'C':
            KEY( "ClientPwd", this_imcmud->clientpw, imcReadLine( fin ) );
            break;

         case 'E':
            if( !strcasecmp( word, "End" ) )
            {
#if defined(IMCCHRONICLES)
               char lbuf1[LGST], lbuf2[LGST];

               sprintf( lbuf1, "%s %s.%s", CODEBASE_VERSION_TITLE, CODEBASE_VERSION_MAJOR, CODEBASE_VERSION_MINOR );
               if( this_imcmud->base )
                  IMCSTRFREE( this_imcmud->base );
               this_imcmud->base = IMCSTRALLOC( lbuf1 );

               sprintf( lbuf2, "%s%s", IMC_VERSION_STRING, this_imcmud->base );
               this_imcmud->versionid = IMCSTRALLOC( lbuf2 );
#endif
               return;
            }
            break;

         case 'I':
           KEY( "Implevel", this_imcmud->implevel, ReadInt( fin, Log ) );
            KEY( "InfoName", this_imcmud->fullname, imcReadLine( fin ) );
            KEY( "InfoHost", this_imcmud->ihost, imcReadLine( fin ) );
            KEY( "InfoPort", this_imcmud->iport, ReadInt( fin, Log ) );
            KEY( "InfoEmail", this_imcmud->email, imcReadLine( fin ) );
            KEY( "InfoWWW", this_imcmud->www, imcReadLine( fin ) );
            KEY( "InfoBase", this_imcmud->base, imcReadLine( fin ) );
            KEY( "InfoDetails", this_imcmud->details, imcReadLine( fin ) );
            break;

         case 'L':
            KEY( "LocalName", this_imcmud->localname, imcReadLine( fin ) );
            break;

         case 'M':
           KEY( "MinImmLevel", this_imcmud->immlevel, ReadInt( fin, Log ) );
           KEY( "MinPlayerLevel", this_imcmud->minlevel, ReadInt( fin, Log ) );
            break;

         case 'R':
            KEY( "RouterAddr", this_imcmud->rhost, imcReadLine( fin ) );
            KEY( "RouterPort", this_imcmud->rport, ReadInt( fin, Log ) );
            break;

         case 'S':
            KEY( "ServerPwd", this_imcmud->serverpw, imcReadLine( fin ) );
            KEY( "ServerAddr", this_imcmud->rhost, imcReadLine( fin ) );
            KEY( "ServerPort", this_imcmud->rport, ReadInt( fin, Log ) );
            KEY( "SHA256", this_imcmud->sha256, ReadInt( fin, Log ) );
            KEY( "SHA256Pwd", this_imcmud->sha256pass, ReadInt( fin, Log ) );
            break;
      }
      if( !fMatch )
         imcbug( "%s: Bad keyword: %s\r\n", __FUNCTION__, word );
   }
}

static bool imc_read_config( socket_t desc )
{
   FILE *fin;
   char cbase[SMST];

   if( this_imcmud != NULL )
      imc_delete_info();
   this_imcmud = NULL;

   imclog( "%s", "Loading IMC2 network data..." );

   if( !( fin = fopen( IMC_CONFIG_FILE, "r" ) ) )
   {
      imclog( "%s", "Can't open configuration file" );
      imclog( "%s", "Network configuration aborted." );
      return false;
   }

   for( ;; )
   {
      char letter;
      char *word;

      letter = ReadChar( fin, Log );

      if( letter == '#' )
      {
        ReadToEndOfLine( fin, Log );
         continue;
      }

      if( letter != '$' )
      {
         imcbug( "%s", "imc_read_config: $ not found" );
         break;
      }

      word = ReadWord( fin, Log );

      if( !strcasecmp( word, "IMCCONFIG" ) && this_imcmud == NULL )
      {
         IMCCREATE( this_imcmud, SiteInfo, 1 );

         /*
          * If someone can think of better default values, I'm all ears. Until then, keep your bitching to yourselves. 
          */
         this_imcmud->minlevel = 10;
         this_imcmud->immlevel = 101;
         this_imcmud->adminlevel = 113;
         this_imcmud->implevel = 115;
         this_imcmud->network = IMCSTRALLOC( "Unknown" );
         this_imcmud->sha256 = true;
         this_imcmud->sha256pass = false;
         this_imcmud->Desc = desc;

         imcfread_config_file( fin );
         continue;
      }
      else if( !strcasecmp( word, "END" ) )
         break;
      else
      {
         imcbug( "imc_read_config: Bad section in config file: %s", word );
         continue;
      }
   }
   IMCFCLOSE( fin );

   if( !this_imcmud )
   {
      imcbug( "%s", "imc_read_config: No server connection information!!" );
      imcbug( "%s", "Network configuration aborted." );
      return false;
   }

   if( !this_imcmud->rhost || !this_imcmud->clientpw || !this_imcmud->serverpw )
   {
      imcbug( "%s", "imc_read_config: Missing required configuration info." );
      imcbug( "%s", "Network configuration aborted." );
      return false;
   }

   if( IsNullOrEmpty( this_imcmud->localname ) )
   {
      imcbug( "%s", "imc_read_config: Mud name not loaded in configuration file." );
      imcbug( "%s", "Network configuration aborted." );
      return false;
   }

   if( IsNullOrEmpty( this_imcmud->fullname ) )
   {
      imcbug( "%s", "imc_read_config: Missing InfoName parameter in configuration file." );
      imcbug( "%s", "Network configuration aborted." );
      return false;
   }

   if( IsNullOrEmpty( this_imcmud->ihost ) )
   {
      imcbug( "%s", "imc_read_config: Missing InfoHost parameter in configuration file." );
      imcbug( "%s", "Network configuration aborted." );
      return false;
   }

   if( IsNullOrEmpty( this_imcmud->email ) )
   {
      imcbug( "%s", "imc_read_config: Missing InfoEmail parameter in configuration file." );
      imcbug( "%s", "Network configuration aborted." );
      return false;
   }

   if( IsNullOrEmpty( this_imcmud->base ) )
      this_imcmud->base = IMCSTRALLOC( "Unknown Codebase" );

   if( IsNullOrEmpty( this_imcmud->www ) )
      this_imcmud->www = IMCSTRALLOC( "Not specified" );

   if( IsNullOrEmpty( this_imcmud->details ) )
      this_imcmud->details = IMCSTRALLOC( "No details provided." );

   if( IsNullOrEmpty( this_imcmud->versionid ) )
   {
      sprintf( cbase, "%s%s", IMC_VERSION_STRING, this_imcmud->base );
      this_imcmud->versionid = IMCSTRALLOC( cbase );
   }
   return true;
}

static char *parse_who_header( char *head )
{
   static char newhead[LGST];
   char iport[SMST];

   sprintf( iport, "%d", this_imcmud->iport );
   strncpy( newhead, head, LGST );
   strncpy( newhead, imcstrrep( newhead, "<%mudfullname%>", this_imcmud->fullname ), LGST );
   strncpy( newhead, imcstrrep( newhead, "<%mudtelnet%>", this_imcmud->ihost ), LGST );
   strncpy( newhead, imcstrrep( newhead, "<%mudport%>", iport ), LGST );
   strncpy( newhead, imcstrrep( newhead, "<%mudurl%>", this_imcmud->www ), LGST );

   return newhead;
}

static char *parse_who_tail( char *tail )
{
   static char newtail[LGST];
   char iport[SMST];

   sprintf( iport, "%d", this_imcmud->iport );
   strncpy( newtail, tail, LGST );
   strncpy( newtail, imcstrrep( newtail, "<%mudfullname%>", this_imcmud->fullname ), LGST );
   strncpy( newtail, imcstrrep( newtail, "<%mudtelnet%>", this_imcmud->ihost ), LGST );
   strncpy( newtail, imcstrrep( newtail, "<%mudport%>", iport ), LGST );
   strncpy( newtail, imcstrrep( newtail, "<%mudurl%>", this_imcmud->www ), LGST );

   return newtail;
}

static void imc_delete_who_template( void )
{
   IMCSTRFREE( whot->head );
   IMCSTRFREE( whot->plrheader );
   IMCSTRFREE( whot->immheader );
   IMCSTRFREE( whot->plrline );
   IMCSTRFREE( whot->immline );
   IMCSTRFREE( whot->tail );
   IMCSTRFREE( whot->Master );
   IMCDISPOSE( whot );
}

static void imc_load_who_template( void )
{
   FILE *fp;
   char hbuf[LGST];
   char *word;
   int num;

   imclog( "%s", "Loading IMC2 who template..." );

   if( !( fp = fopen( IMC_WHO_FILE, "r" ) ) )
   {
      imclog( "%s: Unable to load template file for imcwho", __FUNCTION__ );
      whot = NULL;
      return;
   }

   if( whot )
      imc_delete_who_template();
   IMCCREATE( whot, WHO_TEMPLATE, 1 );

   do
   {
      word = ReadWord( fp, Log );
      hbuf[0] = '\0';
      num = 0;

      if( !strcasecmp( word, "Head:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->head = IMCSTRALLOC( parse_who_header( hbuf ) );
      }
      else if( !strcasecmp( word, "Tail:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->tail = IMCSTRALLOC( parse_who_tail( hbuf ) );
      }
      else if( !strcasecmp( word, "Plrline:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->plrline = IMCSTRALLOC( hbuf );
      }
      else if( !strcasecmp( word, "Immline:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->immline = IMCSTRALLOC( hbuf );
      }
      else if( !strcasecmp( word, "Immheader:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->immheader = IMCSTRALLOC( hbuf );
      }
      else if( !strcasecmp( word, "Plrheader:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->plrheader = IMCSTRALLOC( hbuf );
      }
      else if( !strcasecmp( word, "Master:" ) )
      {
         while( (signed char)( hbuf[num] = fgetc( fp ) ) != EOF && hbuf[num] != '¢' && num < ( LGST - 2 ) )
            ++num;
         hbuf[num] = '\0';
         whot->Master = IMCSTRALLOC( hbuf );
      }
   }
   while( !feof( fp ) );
   IMCFCLOSE( fp );
}

static void imc_load_templates( void )
{
   imc_load_who_template();
}

static socket_t ipv4_connect( void )
{
   struct sockaddr_in sa;
   struct hostent *hostp;
   int desc = INVALID_SOCKET;

   memset( &sa, 0, sizeof( sa ) );
   sa.sin_family = AF_INET;

#if !defined(WIN32) && !defined(AMIGA) && !defined(__MORPHOS__)
   /*
    * warning: this blocks. It would be better to farm the query out to
    * * another process, but that is difficult to do without lots of changes
    * * to the core mud code. You may want to change this code if you have an
    * * existing resolver process running.
    */
   if( !inet_aton( this_imcmud->rhost, &sa.sin_addr ) )
   {
      hostp = gethostbyname( this_imcmud->rhost );
      if( !hostp )
      {
         imclog( "%s", "imc_connect_to: Cannot resolve server hostname." );
         ImcShutdown( false );
         return INVALID_SOCKET;
      }
      memcpy( &sa.sin_addr, hostp->h_addr, hostp->h_length );
   }
#else
   sa.sin_addr.s_addr = inet_addr( this_imcmud->rhost );
#endif

   sa.sin_port = htons( this_imcmud->rport );

   desc = socket( AF_INET, SOCK_STREAM, 0 );
   if( desc == INVALID_SOCKET )
   {
      perror( "socket" );
      return INVALID_SOCKET;
   }

   if( SetNonBlockingSocket( desc ) == SOCKET_ERROR )
   {
      perror( "imc_connect: ioctlsocket failed" );
      closesocket( desc );
      return INVALID_SOCKET;
   }

   if( connect( desc, ( struct sockaddr * )&sa, sizeof( sa ) ) == SOCKET_ERROR )
   {
      if( errno != EINPROGRESS )
      {
         imclog( "%s: Failed connect: Error %d: %s", __FUNCTION__, errno, strerror( errno ) );
         perror( "connect" );
         closesocket( desc );
         return INVALID_SOCKET;
      }
   }
   return desc;
}

static bool imc_server_connect( void )
{
   char buf[LGST];
   socket_t desc = INVALID_SOCKET;

   if( !this_imcmud )
   {
      imcbug( "%s", "No connection data loaded" );
      return false;
   }

   if( this_imcmud->state != IMC_AUTH1 )
   {
      imcbug( "%s", "Connection is not in proper state." );
      return false;
   }

   if( this_imcmud->Desc != INVALID_SOCKET )
   {
      imcbug( "%s", "Already connected" );
      return false;
   }

   desc = ipv4_connect();

   if( desc == SOCKET_ERROR )
      return false;

   imclog( "Connecting to server (socket %d).", desc );

   this_imcmud->state = IMC_AUTH2;
   this_imcmud->Desc = desc;
   this_imcmud->inbuf[0] = '\0';
   this_imcmud->outsize = 1000;
   IMCCREATE( this_imcmud->outbuf, char, this_imcmud->outsize );

   /*
    * The MUD is electing to enable SHA256 - this is the default setting 
    */
   if( this_imcmud->sha256 )
   {
      /*
       * No SHA256 setup enabled.
       * * Situations where this might happen:
       * *
       * * 1. You are connecting for the first time. This is expected.
       * * 2. You are connecting to an older server which does not support it, so you will continue connecting this way.
       * * 3. You got stupid and deleted the SHA256 line in your config file after it got there. Ooops.
       * * 4. The server lost your data. In which case you'll need to do #3 because authentication will fail.
       * * 5. You let your connection lapse, and #4 happened because of it.
       * * 6. Gremlins. When in doubt, blame them.
       */
      if( !this_imcmud->sha256pass )
      {
         sprintf( buf, "PW %s %s version=%d autosetup %s SHA256",
                   this_imcmud->localname, this_imcmud->clientpw, IMC_VERSION, this_imcmud->serverpw );
      }
      /*
       * You have SHA256 working. Excellent. Lets send the new packet for it.
       * * Situations where this will fail:
       * *
       * * 1. You're a new connection, and for whatever dumb reason, the SHA256 line is in your config already.
       * * 2. You have SHA256 enabled and you're switching to a new server. This is generally not going to work well.
       * * 3. Something happened and the hashing failed. Resulting in authentication failure. Ooops.
       * * 4. The server lost your connection data.
       * * 5. You let your connection lapse, and #4 happened because of it.
       * * 6. Gremlins. When in doubt, blame them.
       */
      else
         sprintf( buf, "SHA256-AUTH-REQ %s", this_imcmud->localname );
   }
   /*
    * The MUD is electing not to use SHA256 for whatever reason - this must be specifically set 
    */
   else
      sprintf( buf, "PW %s %s version=%d autosetup %s",
                this_imcmud->localname, this_imcmud->clientpw, IMC_VERSION, this_imcmud->serverpw );

   imc_write_buffer( buf );
   return true;
}

static void imc_delete_templates( void )
{
   imc_delete_who_template();
}

static void free_imcdata( bool complete )
{
   REMOTEINFO *p, *pnext;
   IMC_BAN *ban, *ban_next;
   IMCUCACHE_DATA *ucache, *next_ucache;
   IMC_CMD_DATA *cmd, *cmd_next;
   IMC_ALIAS *alias, *alias_next;
   IMC_HelpFile *help, *help_next;
   IMC_COLOR *color, *color_next;
   IMC_PHANDLER *ph, *ph_next;
   IMC_CHANNEL *c, *c_next;

   for( c = first_imc_channel; c; c = c_next )
   {
      c_next = c->next;
      imc_freechan( c );
   }

   for( p = first_rinfo; p; p = pnext )
   {
      pnext = p->next;
      imc_delete_reminfo( p );
   }

   for( ban = first_imc_ban; ban; ban = ban_next )
   {
      ban_next = ban->next;
      imc_freeban( ban );
   }

   for( ucache = first_imcucache; ucache; ucache = next_ucache )
   {
      next_ucache = ucache->next;
      IMCSTRFREE( ucache->Name );
      IMCUNLINK( ucache, first_imcucache, last_imcucache, next, prev );
      IMCDISPOSE( ucache );
   }

   /*
    * This stuff is only killed off if the mud itself shuts down. For those of you Valgrinders out there. 
    */
   if( complete )
   {
      imc_delete_templates();

      for( cmd = first_imc_command; cmd; cmd = cmd_next )
      {
         cmd_next = cmd->next;

         for( alias = cmd->first_alias; alias; alias = alias_next )
         {
            alias_next = alias->next;

            IMCSTRFREE( alias->Name );
            IMCUNLINK( alias, cmd->first_alias, cmd->last_alias, next, prev );
            IMCDISPOSE( alias );
         }
         IMCSTRFREE( cmd->Name );
         IMCUNLINK( cmd, first_imc_command, last_imc_command, next, prev );
         IMCDISPOSE( cmd );
      }

      for( help = first_imc_help; help; help = help_next )
      {
         help_next = help->next;
         IMCSTRFREE( help->Name );
         IMCSTRFREE( help->text );
         IMCUNLINK( help, first_imc_help, last_imc_help, next, prev );
         IMCDISPOSE( help );
      }

      for( color = first_imc_color; color; color = color_next )
      {
         color_next = color->next;
         IMCSTRFREE( color->Name );
         IMCSTRFREE( color->mudtag );
         IMCSTRFREE( color->imctag );
         IMCUNLINK( color, first_imc_color, last_imc_color, next, prev );
         IMCDISPOSE( color );
      }

      for( ph = first_phandler; ph; ph = ph_next )
      {
         ph_next = ph->next;

         IMCSTRFREE( ph->Name );
         IMCUNLINK( ph, first_phandler, last_phandler, next, prev );
         IMCDISPOSE( ph );
      }
   }
}

void ImcCopyover( void )
{
   FILE *fp;

   if( this_imcmud && this_imcmud->state == IMC_ONLINE )
   {
      if( !( fp = fopen( IMC_HOTBOOT_FILE, "w" ) ) )
         imcbug( "%s: Unable to open IMC hotboot file for write.", __FUNCTION__ );
      else
      {
         fprintf( fp, "%s %s\n", ( this_imcmud->network ? this_imcmud->network : "Unknown" ),
                  ( this_imcmud->servername ? this_imcmud->servername : "Unknown" ) );
         IMCFCLOSE( fp );
         imc_savehistory();
      }
   }
}

/* Shutdown IMC2 */
void ImcShutdown( bool reconnect )
{
   if( this_imcmud && this_imcmud->state == IMC_OFFLINE )
      return;

   imclog( "%s", "Shutting down network." );

   if( this_imcmud->Desc != INVALID_SOCKET )
      closesocket( this_imcmud->Desc );
   this_imcmud->Desc = INVALID_SOCKET;

   imc_savehistory();
   free_imcdata( false );

   this_imcmud->state = IMC_OFFLINE;
   if( reconnect )
   {
      imcwait = 100; /* About 20 seconds or so */
      imclog( "%s", "Connection to server was lost. Reconnecting in approximately 20 seconds." );
   }
}

/* Startup IMC2 */
static bool ImcStartup_network( bool connected )
{
   imclog( "%s", "IMC2 Network Initializing..." );

   if( connected )
   {
      FILE *fp;
      char netname[SMST], server[SMST];

      if( !( fp = fopen( IMC_HOTBOOT_FILE, "r" ) ) )
         imcbug( "%s: Unable to load IMC hotboot file.", __FUNCTION__ );
      else
      {
         remove( IMC_HOTBOOT_FILE );

         fscanf( fp, "%s %s\n", netname, server );

         IMCSTRFREE( this_imcmud->network );
         this_imcmud->network = IMCSTRALLOC( netname );
         IMCSTRFREE( this_imcmud->servername );
         this_imcmud->servername = IMCSTRALLOC( server );
         IMCFCLOSE( fp );
	 remove(IMC_HOTBOOT_FILE);
      }
      this_imcmud->state = IMC_ONLINE;
      this_imcmud->inbuf[0] = '\0';
      this_imcmud->outsize = IMC_BUFF_SIZE;
      IMCCREATE( this_imcmud->outbuf, char, this_imcmud->outsize );
      imc_request_keepalive();
      imc_firstrefresh();
      return true;
   }

   this_imcmud->state = IMC_AUTH1;

   /*
    * Connect to server 
    */
   if( !imc_server_connect() )
   {
      this_imcmud->state = IMC_OFFLINE;
      return false;
   }

   return true;
}

void ImcStartup( bool force, socket_t desc, bool connected )
{
   imcwait = 0;

   if( this_imcmud && this_imcmud->state > IMC_OFFLINE )
   {
      imclog( "%s: Network startup called when already engaged!", __FUNCTION__ );
      return;
   }

   imc_time = time( NULL );
   imc_sequencenumber = imc_time;

   /*
    * The Command table is required for operation. Like.... duh? 
    */
   if( first_imc_command == NULL )
   {
      if( !imc_LoadCommands() )
      {
         imcbug( "%s: Unable to load command table!", __FUNCTION__ );
         return;
      }
   }

   /*
    * Configuration required for network operation. 
    */
   if( !imc_read_config( desc ) )
      return;

   /*
    * Lets register all the default packet handlers 
    */
   imc_register_default_packets();

   /*
    * Help information should persist even when the network is not connected... 
    */
   if( first_imc_help == NULL )
      imc_LoadHelpFiles();

   /*
    * ... as should the color table. 
    */
   if( first_imc_color == NULL )
      imc_load_color_table();

   /*
    * ... and the templates. Checks for whot being defined, but the others are loaded here to, so....
    */
   if( !whot )
      imc_load_templates();

   if( ( !this_imcmud->autoconnect && !force && !connected ) || ( connected && this_imcmud->Desc == INVALID_SOCKET ) )
   {
      imclog( "%s", "IMC2 network data loaded. Autoconnect not set. IMC2 will need to be connected manually." );
      return;
   }
   else
      imclog( "%s", "IMC2 network data loaded." );

   if( this_imcmud->autoconnect || force || connected )
   {
      if( ImcStartup_network( connected ) )
      {
         imc_loadchannels();
         imc_loadhistory();
         imc_readbans();
         imc_load_ucache();
      }
   }
}

/*****************************************
 * User level commands and social.hppooks. *
 *****************************************/

/* The imccommand command, aka icommand. Channel manipulation at the server level etc. */
IMC_CMD( imccommand )
{
   char cmd[SMST], chan[SMST], to[SMST];
   IMC_PACKET *p;
   IMC_CHANNEL *c;

   argument = imcOneArgument( argument, cmd );
   argument = imcOneArgument( argument, chan );

   if( !cmd[0] || !chan[0] )
   {
      imc_to_char( "Syntax: imccommand <command> <server:channel> [<data..>]\r\n", ch );
      imc_to_char( "Command access will depend on your privledges and what each individual server allows.\r\n", ch );
      return;
   }

   if( !( c = imc_findchannel( chan ) ) && strcasecmp( cmd, "create" ) )
   {
      imc_printf( ch, "There is no channel called %s known.\r\n", chan );
      return;
   }

   sprintf( to, "IMC@%s", c ? imc_channel_mudof( c->Name ) : imc_channel_mudof( chan ) );
   p = imc_newpacket( CH_IMCNAME( ch ), "ice-cmd", to );
   imc_addtopacket( p, "channel=%s", c ? c->Name : chan );
   imc_addtopacket( p, "command=%s", cmd );

   if( !IsNullOrEmpty( argument ) )
      imc_addtopacket( p, "data=%s", argument );

   imc_write_packet( p );

   imc_to_char( "Command sent.\r\n", ch );
}

/* need exactly 2 %s's, and no other format specifiers */
static bool verify_format( const char *fmt, short sneed )
{
   const char *c;
   int i = 0;

   c = fmt;
   while( ( c = strchr( c, '%' ) ) != NULL )
   {
      if( *( c + 1 ) == '%' ) /* %% */
      {
         c += 2;
         continue;
      }

      if( *( c + 1 ) != 's' ) /* not %s */
         return false;

      c++;
      i++;
   }
   if( i != sneed )
      return false;

   return true;
}

/* The imcsetup command, channel manipulation at the mud level etc, formatting and the like.
 * This command will not do "localization" since this is handled automatically now by ice-update packets.
 */
IMC_CMD( imcsetup )
{
   char imccmd[SMST], chan[SMST], arg1[SMST], buf[LGST];
   IMC_CHANNEL *c = NULL;
   int x;
   bool all = false;

   argument = imcOneArgument( argument, imccmd );
   argument = imcOneArgument( argument, chan );
   argument = imcOneArgument( argument, arg1 );

   if( IsNullOrEmpty( imccmd ) || IsNullOrEmpty( chan ) )
   {
      imc_to_char( "Syntax: imcsetup <command> <channel> [<data..>]\r\n", ch );
      imc_to_char( "Where 'command' is one of the following:\r\n", ch );
      imc_to_char( "delete rename perm regformat emoteformat socformat\r\n\r\n", ch );
      imc_to_char( "Where 'channel' is one of the following:\r\n", ch );

      for( c = first_imc_channel; c; c = c->next )
      {
	if( !IsNullOrEmpty( c->local_name ) )
            imc_printf( ch, "%s ", c->local_name );
         else
            imc_printf( ch, "%s ", c->Name );
      }
      imc_to_char( "\r\n", ch );
      return;
   }

   if( !strcasecmp( chan, "all" ) )
      all = true;
   else
   {
      if( !( c = imc_findchannel( chan ) ) )
      {
         imc_to_char( "Unknown channel.\r\n", ch );
         return;
      }
   }

   /*
    * Permission check -- Xorith 
    */
   if( c && c->level > IMCPERM( ch ) )
   {
      imc_to_char( "You cannot modify that channel.", ch );
      return;
   }

   if( !strcasecmp( imccmd, "delete" ) )
   {
      if( all )
      {
         imc_to_char( "You cannot perform a delete all on channels.\r\n", ch );
         return;
      }
      IMCSTRFREE( c->local_name );
      IMCSTRFREE( c->regformat );
      IMCSTRFREE( c->emoteformat );
      IMCSTRFREE( c->socformat );

      for( x = 0; x < MAX_IMCHISTORY; x++ )
         IMCSTRFREE( c->history[x] );

      imc_to_char( "Channel is no longer locally configured.\r\n", ch );

      if( !c->refreshed )
         imc_freechan( c );
      imc_save_channels();
      return;
   }

   if( !strcasecmp( imccmd, "rename" ) )
   {
      if( all )
      {
         imc_to_char( "You cannot perform a rename all on channels.\r\n", ch );
         return;
      }

      if( IsNullOrEmpty( arg1 ) )
      {
         imc_to_char( "Missing 'newname' argument for 'imcsetup rename'\r\n", ch ); /* Lets be more kind! -- X */
         imc_to_char( "Syntax: imcsetup rename <local channel> <newname>\r\n", ch );   /* Fixed syntax message -- X */
         return;
      }

      if( imc_findchannel( arg1 ) )
      {
         imc_to_char( "New channel name already exists.\r\n", ch );
         return;
      }

      /*
       * Small change here to give better feedback to the ch -- Xorith 
       */
      sprintf( buf, "Renamed channel '%s' to '%s'.\r\n", c->local_name, arg1 );
      IMCSTRFREE( c->local_name );
      c->local_name = IMCSTRALLOC( arg1 );
      imc_to_char( buf, ch );

      /*
       * Reset the format with the new local name 
       */
      imcformat_channel( ch, c, 4, false );
      imc_save_channels();
      return;
   }

   if( !strcasecmp( imccmd, "resetformats" ) )
   {
      if( all )
      {
         imcformat_channel( ch, NULL, 4, true );
         imc_to_char( "All channel formats have been reset to default.\r\n", ch );
      }
      else
      {
         imcformat_channel( ch, c, 4, false );
         imc_to_char( "The formats for this channel have been reset to default.\r\n", ch );
      }
      return;
   }

   if( !strcasecmp( imccmd, "regformat" ) )
   {
      if( !arg1[0] )
      {
         imc_to_char( "Syntax: imcsetup regformat <localchannel|all> <string>\r\n", ch ); /* Syntax Fix -- Xorith */
         return;
      }

      if( !verify_format( arg1, 2 ) )
      {
         imc_to_char( "Bad format - must contain exactly 2 %s's.\r\n", ch );
         return;
      }

      if( all )
      {
         for( c = first_imc_channel; c; c = c->next )
         {
            IMCSTRFREE( c->regformat );
            c->regformat = IMCSTRALLOC( arg1 );
         }
         imc_to_char( "All channel regular formats have been updated.\r\n", ch );
      }
      else
      {
         IMCSTRFREE( c->regformat );
         c->regformat = IMCSTRALLOC( arg1 );
         imc_to_char( "The regular format for this channel has been changed successfully.\r\n", ch );
      }
      imc_save_channels();
      return;
   }

   if( !strcasecmp( imccmd, "emoteformat" ) )
   {
      if( !arg1[0] )
      {
         imc_to_char( "Syntax: imcsetup emoteformat <localchannel|all> <string>\r\n", ch );  /* Syntax Fix -- Xorith */
         return;
      }

      if( !verify_format( arg1, 2 ) )
      {
         imc_to_char( "Bad format - must contain exactly 2 %s's.\r\n", ch );
         return;
      }

      if( all )
      {
         for( c = first_imc_channel; c; c = c->next )
         {
            IMCSTRFREE( c->emoteformat );
            c->emoteformat = IMCSTRALLOC( arg1 );
         }
         imc_to_char( "All channel emote formats have been updated.\r\n", ch );
      }
      else
      {
         IMCSTRFREE( c->emoteformat );
         c->emoteformat = IMCSTRALLOC( arg1 );
         imc_to_char( "The emote format for this channel has been changed successfully.\r\n", ch );
      }
      imc_save_channels();
      return;
   }

   if( !strcasecmp( imccmd, "socformat" ) )
   {
      if( !arg1[0] )
      {
         imc_to_char( "Syntax: imcsetup socformat <localchannel|all> <string>\r\n", ch ); /* Xorith */
         return;
      }

      if( !verify_format( arg1, 1 ) )
      {
         imc_to_char( "Bad format - must contain exactly 1 %s.\r\n", ch );
         return;
      }

      if( all )
      {
         for( c = first_imc_channel; c; c = c->next )
         {
            IMCSTRFREE( c->socformat );
            c->socformat = IMCSTRALLOC( arg1 );
         }
         imc_to_char( "All channel social formats have been updated.\r\n", ch );
      }
      else
      {
         IMCSTRFREE( c->socformat );
         c->socformat = IMCSTRALLOC( arg1 );
         imc_to_char( "The social format for this channel has been changed successfully.\r\n", ch );
      }
      imc_save_channels();
      return;
   }

   if( !strcasecmp( imccmd, "perm" ) || !strcasecmp( imccmd, "permission" ) || !strcasecmp( imccmd, "level" ) )
   {
      int permvalue = -1;

      if( all )
      {
         imc_to_char( "You cannot do a permissions all for channels.\r\n", ch );
         return;
      }

      if( !arg1[0] )
      {
         imc_to_char( "Syntax: imcsetup perm <localchannel> <permission>\r\n", ch );
         return;
      }

      permvalue = get_imcpermvalue( arg1 );
      if( permvalue < 0 || permvalue > IMCPERM_IMP )
      {
         imc_to_char( "Unacceptable permission setting.\r\n", ch );
         return;
      }

      /*
       * Added permission checking here -- Xorith 
       */
      if( permvalue > IMCPERM( ch ) )
      {
         imc_to_char( "You cannot set a permission higher than your own.\r\n", ch );
         return;
      }

      c->level = permvalue;

      imc_to_char( "Channel permissions changed.\r\n", ch );
      imc_save_channels();
      return;
   }
   imcsetup( ch, "" );
}

/* The imcchanlist command. Basic listing of channels. */
IMC_CMD( imcchanlist )
{
   IMC_CHANNEL *c = NULL;
   int count = 0; /* Count -- Xorith */
   char col = 'C';   /* Listening Color -- Xorith */

   if( !first_imc_channel )
   {
      imc_to_char( "~WThere are no known channels on this network.\r\n", ch );
      return;
   }

   if( !IsNullOrEmpty( argument ) )
   {
      if( !( c = imc_findchannel( argument ) ) )
      {
         imc_printf( ch, "There is no channel called %s here.\r\n", argument );
         return;
      }
   }

   if( c )
   {
      imc_printf( ch, "~WChannel  : %s\r\n\r\n", c->Name );
      imc_printf( ch, "~cLocalname: ~w%s\r\n", c->local_name );
      imc_printf( ch, "~cPerms    : ~w%s\r\n", imcperm_names[c->level] );
      imc_printf( ch, "~cPolicy   : %s\r\n", c->open ? "~gOpen" : "~yPrivate" );
      imc_printf( ch, "~cRegFormat: ~w%s\r\n", c->regformat );
      imc_printf( ch, "~cEmoFormat: ~w%s\r\n", c->emoteformat );
      imc_printf( ch, "~cSocFormat: ~w%s\r\n\r\n", c->socformat );
      imc_printf( ch, "~cOwner    : ~w%s\r\n", c->owner );
      imc_printf( ch, "~cOperators: ~w%s\r\n", c->operators );
      imc_printf( ch, "~cInvite   : ~w%s\r\n", c->invited );
      imc_printf( ch, "~cExclude  : ~w%s\r\n", c->excluded );
      return;
   }

   imc_printf( ch, "~c%-15s ~C%-15s ~B%-15s ~b%-7s ~!%s\r\n\r\n", "Name", "Local name", "Owner", "Perm", "Policy" );
   for( c = first_imc_channel; c; c = c->next )
   {
      if( IMCPERM( ch ) < c->level )
         continue;

      /*
       * If it's locally configured and we're not listening, then color it red -- Xorith 
       */
      if( c->local_name )
      {
         if( !imc_hasname( IMC_LISTEN( ch ), c->local_name ) )
            col = 'R';
         else
            col = 'C';  /* Otherwise, keep it Cyan -- X */
      }

      imc_printf( ch, "~c%-15.15s ~%c%-*.*s ~B%-15.15s ~b%-7s %s\r\n", c->Name, col,
                  c->local_name ? 15 : 17, c->local_name ? 15 : 17,
                  c->local_name ? c->local_name : "~Y(not local)  ", c->owner,
                  imcperm_names[c->level], c->refreshed ? ( c->open ? "~gOpen" : "~yPrivate" ) : "~Runknown" );
      count++; /* Keep a count -- Xorith */
   }
   /*
    * Show the count and a bit of text explaining the red color -- Xorith 
    */
   imc_printf( ch, "\r\n~W%d ~cchannels found.", count );
   imc_to_char( "\r\n~RRed ~clocal name indicates a channel not being listened to.\r\n", ch );
}

IMC_CMD( imclisten )
{
   IMC_CHANNEL *c;

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "~cCurrently tuned into:\r\n", ch );

      if( !IsNullOrEmpty( IMC_LISTEN( ch ) ) )
         imc_printf( ch, "~W%s", IMC_LISTEN( ch ) );
      else
         imc_to_char( "~WNone", ch );

      imc_to_char( "\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "all" ) )
   {
      for( c = first_imc_channel; c; c = c->next )
      {
         if( !c->local_name )
            continue;

         if( IMCPERM( ch ) >= c->level && !imc_hasname( IMC_LISTEN( ch ), c->local_name ) )
            imc_addname( &IMC_LISTEN( ch ), c->local_name );
      }
      imc_to_char( "~YYou are now listening to all available IMC2 channels.\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "none" ) )
   {
      for( c = first_imc_channel; c; c = c->next )
      {
         if( !c->local_name )
            continue;

         if( imc_hasname( IMC_LISTEN( ch ), c->local_name ) )
            imc_removename( &IMC_LISTEN( ch ), c->local_name );
      }
      imc_to_char( "~YYou no longer listen to any available IMC2 channels.\r\n", ch );
      return;
   }

   if( !( c = imc_findchannel( argument ) ) )
   {
      imc_to_char( "No such channel configured locally.\r\n", ch );
      return;
   }

   if( IMCPERM( ch ) < c->level )
   {
      imc_to_char( "No such channel configured locally.\r\n", ch );
      return;
   }

   if( imc_hasname( IMC_LISTEN( ch ), c->local_name ) )
   {
      imc_removename( &IMC_LISTEN( ch ), c->local_name );
      imc_to_char( "Channel off.\r\n", ch );
   }
   else
   {
      imc_addname( &IMC_LISTEN( ch ), c->local_name );
      imc_to_char( "Channel on.\r\n", ch );
   }
}

IMC_CMD( imctell )
{
   char buf[LGST], buf1[LGST];

   if( IsBitSet( IMCFLAG( ch ), IMC_DENYTELL ) )
   {
      imc_to_char( "You are not authorized to use imctell.\r\n", ch );
      return;
   }

   argument = imcOneArgument( argument, buf );

   if( IsNullOrEmpty( argument ) )
   {
      int x;

      imc_to_char( "Usage: imctell user@mud <message>\r\n", ch );
      imc_to_char( "Usage: imctell [on]/[off]\r\n\r\n", ch );
      imc_printf( ch, "~cThe last %d things you were told:\r\n", MAX_IMCTELLHISTORY );

      for( x = 0; x < MAX_IMCTELLHISTORY; x++ )
      {
         if( IMCTELLHISTORY( ch, x ) == NULL )
            break;
         imc_to_char( IMCTELLHISTORY( ch, x ), ch );
      }
      return;
   }

   if( !strcasecmp( argument, "on" ) )
   {
      RemoveBit( IMCFLAG( ch ), IMC_TELL );
      imc_to_char( "You now send and receive imctells.\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "off" ) )
   {
      SetBit( IMCFLAG( ch ), IMC_TELL );
      imc_to_char( "You no longer send and receive imctells.\r\n", ch );
      return;
   }

   if( IsBitSet( IMCFLAG( ch ), IMC_TELL ) )
   {
      imc_to_char( "You have imctells turned off.\r\n", ch );
      return;
   }

   if( IMCISINVIS( ch ) )
   {
      imc_to_char( "You are invisible.\r\n", ch );
      return;
   }

   if( !check_mudof( ch, buf ) )
      return;

   /*
    * Tell socials. Suggested by Darien@Sandstorm 
    */
   if( argument[0] == '@' )
   {
      const char *p, *p2;
      char buf2[SMST];

      argument++;
      while( isspace( (int) *argument ) )
         argument++;
      strncpy( buf2, argument, SMST );
      p = imc_send_social( ch, argument, 1 );

      if( IsNullOrEmpty( p ) )
         return;

      imc_send_tell( CH_IMCNAME( ch ), buf, p, 2 );
      p2 = imc_send_social( ch, buf2, 2 );

      if( IsNullOrEmpty( p2 ) )
         return;

      sprintf( buf1, "~WImctell ~C%s: ~c%s\r\n", buf, p2 );
   }
   else if( argument[0] == ',' )
   {
      argument++;
      while( isspace( (int) *argument ) )
         argument++;
      imc_send_tell( CH_IMCNAME( ch ), buf, color_mtoi( argument ), 1 );
      sprintf( buf1, "~WImctell: ~c%s %s\r\n", buf, argument );
   }
   else
   {
      imc_send_tell( CH_IMCNAME( ch ), buf, color_mtoi( argument ), 0 );
      sprintf( buf1, "~cYou imctell ~C%s ~c'~W%s~c'\r\n", buf, argument );
   }
   imc_to_char( buf1, ch );
   imc_update_tellhistory( ch, buf1 );
}

IMC_CMD( imcreply )
{
   char buf1[LGST];

   /*
    * just check for deny 
    */
   if( IsBitSet( IMCFLAG( ch ), IMC_DENYTELL ) )
   {
      imc_to_char( "You are not authorized to use imcreply.\r\n", ch );
      return;
   }

   if( IsBitSet( IMCFLAG( ch ), IMC_TELL ) )
   {
      imc_to_char( "You have imctells turned off.\r\n", ch );
      return;
   }

   if( IMCISINVIS( ch ) )
   {
      imc_to_char( "You are invisible.\r\n", ch );
      return;
   }

   if( !IMC_RREPLY( ch ) )
   {
      imc_to_char( "You haven't received an imctell yet.\r\n", ch );
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "imcreply what?\r\n", ch );
      return;
   }

   if( !check_mudof( ch, IMC_RREPLY( ch ) ) )
      return;

   /*
    * Tell socials. Suggested by Darien@Sandstorm 
    */
   if( argument[0] == '@' )
   {
      const char *p, *p2;
      char buf2[SMST];

      argument++;
      while( isspace( (int) *argument ) )
         argument++;
      strncpy( buf2, argument, SMST );
      p = imc_send_social( ch, argument, 1 );

      if( IsNullOrEmpty( p ) )
         return;

      imc_send_tell( CH_IMCNAME( ch ), IMC_RREPLY( ch ), p, 2 );
      p2 = imc_send_social( ch, buf2, 2 );

      if( IsNullOrEmpty( p2 ) )
         return;

      sprintf( buf1, "~WImctell ~C%s: ~c%s\r\n", IMC_RREPLY( ch ), p2 );
   }
   else if( argument[0] == ',' )
   {
      argument++;
      while( isspace( (int) *argument ) )
         argument++;
      imc_send_tell( CH_IMCNAME( ch ), IMC_RREPLY( ch ), color_mtoi( argument ), 1 );
      sprintf( buf1, "~WImctell: ~c%s %s\r\n", IMC_RREPLY( ch ), argument );
   }
   else
   {
      imc_send_tell( CH_IMCNAME( ch ), IMC_RREPLY( ch ), color_mtoi( argument ), 0 );
      sprintf( buf1, "~cYou imctell ~C%s ~c'~W%s~c'\r\n", IMC_RREPLY( ch ), argument );
   }
   imc_to_char( buf1, ch );
   imc_update_tellhistory( ch, buf1 );
}

IMC_CMD( imcwho )
{
  if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "imcwho which mud? See imclist for a list of connected muds.\r\n", ch );
      return;
   }

   /*
    * Now why didn't I think of this before for local who testing?
    * * Meant for testing only, so it needs >= Imm perms
    * * Otherwise people could use it to bypass wizinvis locally.
    */
   if( !strcasecmp( argument, this_imcmud->localname ) && IMCPERM( ch ) >= IMCPERM_IMM )
   {
      imc_to_char( imc_assemble_who(), ch );
      return;
   }

   if( !check_mud( ch, argument ) )
      return;

   imc_send_who( CH_IMCNAME( ch ), argument, "who" );
}

IMC_CMD( imclocate )
{
   char user[SMST];

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "imclocate who?\r\n", ch );
      return;
   }

   sprintf( user, "%s@*", argument );
   imc_send_whois( CH_IMCNAME( ch ), user );
}

IMC_CMD( imcfinger )
{
   char name[LGST], arg[SMST];

   if( IsBitSet( IMCFLAG( ch ), IMC_DENYFINGER ) )
   {
      imc_to_char( "You are not authorized to use imcfinger.\r\n", ch );
      return;
   }

   argument = imcOneArgument( argument, arg );

   if( IsNullOrEmpty( arg ) )
   {
      imc_to_char( "~wUsage: imcfinger person@mud\r\n", ch );
      imc_to_char( "~wUsage: imcfinger <field> <value>\r\n", ch );
      imc_to_char( "~wWhere field is one of:\r\n\r\n", ch );
      imc_to_char( "~wdisplay email homepage icq aim yahoo msn privacy comment\r\n", ch );
      return;
   }

   if( !strcasecmp( arg, "display" ) )
   {
      imc_to_char( "~GYour current information:\r\n\r\n", ch );
      imc_printf( ch, "~GEmail   : ~g%s\r\n",
		  !IsNullOrEmpty( IMC_EMAIL( ch ) ) ? IMC_EMAIL( ch ) : "None" );
      imc_printf( ch, "~GHomepage: ~g%s\r\n",
                  !IsNullOrEmpty( IMC_HOMEPAGE( ch ) ) ? IMC_HOMEPAGE( ch ) : "None" );
      imc_printf( ch, "~GICQ     : ~g%d\r\n", IMC_ICQ( ch ) );
      imc_printf( ch, "~GAIM     : ~g%s\r\n",
		  !IsNullOrEmpty( IMC_AIM( ch ) ) ? IMC_AIM( ch ) : "None" );
      imc_printf( ch, "~GYahoo   : ~g%s\r\n",
		  !IsNullOrEmpty( IMC_YAHOO( ch ) ) ? IMC_YAHOO( ch ) : "None" );
      imc_printf( ch, "~GMSN     : ~g%s\r\n",
		  !IsNullOrEmpty( IMC_MSN( ch ) ) ? IMC_MSN( ch ) : "None" );
      imc_printf( ch, "~GComment : ~g%s\r\n",
                  !IsNullOrEmpty( IMC_COMMENT( ch ) ) ? IMC_COMMENT( ch ) : "None" );
      imc_printf( ch, "~GPrivacy : ~g%s\r\n",
		  IsBitSet( IMCFLAG( ch ), IMC_PRIVACY ) ? "Enabled" : "Disabled" );
      return;
   }

   if( !strcasecmp( arg, "privacy" ) )
   {
      if( IsBitSet( IMCFLAG( ch ), IMC_PRIVACY ) )
      {
         RemoveBit( IMCFLAG( ch ), IMC_PRIVACY );
         imc_to_char( "Privacy flag removed. Your information will now be visible on imcfinger.\r\n", ch );
      }
      else
      {
         SetBit( IMCFLAG( ch ), IMC_PRIVACY );
         imc_to_char( "Privacy flag enabled. Your information will no longer be visible on imcfinger.\r\n", ch );
      }
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      if( this_imcmud->state != IMC_ONLINE )
      {
         imc_to_char( "The mud is not currently connected to IMC2.\r\n", ch );
         return;
      }

      if( !check_mudof( ch, arg ) )
         return;

      sprintf( name, "finger %s", imc_nameof( arg ) );
      imc_send_who( CH_IMCNAME( ch ), imc_mudof( arg ), name );
      return;
   }

   if( !strcasecmp( arg, "email" ) )
   {
      IMCSTRFREE( IMC_EMAIL( ch ) );
      IMC_EMAIL( ch ) = IMCSTRALLOC( argument );
      imc_printf( ch, "Your email address has changed to: %s\r\n", IMC_EMAIL( ch ) );
      return;
   }

   if( !strcasecmp( arg, "homepage" ) )
   {
      IMCSTRFREE( IMC_HOMEPAGE( ch ) );
      IMC_HOMEPAGE( ch ) = IMCSTRALLOC( argument );
      imc_printf( ch, "Your homepage has changed to: %s\r\n", IMC_HOMEPAGE( ch ) );
      return;
   }

   if( !strcasecmp( arg, "icq" ) )
   {
      IMC_ICQ( ch ) = atoi( argument );
      imc_printf( ch, "Your ICQ Number has changed to: %d\r\n", IMC_ICQ( ch ) );
      return;
   }

   if( !strcasecmp( arg, "aim" ) )
   {
      IMCSTRFREE( IMC_AIM( ch ) );
      IMC_AIM( ch ) = IMCSTRALLOC( argument );
      imc_printf( ch, "Your AIM Screenname has changed to: %s\r\n", IMC_AIM( ch ) );
      return;
   }

   if( !strcasecmp( arg, "yahoo" ) )
   {
      IMCSTRFREE( IMC_YAHOO( ch ) );
      IMC_YAHOO( ch ) = IMCSTRALLOC( argument );
      imc_printf( ch, "Your Yahoo Screenname has changed to: %s\r\n", IMC_YAHOO( ch ) );
      return;
   }

   if( !strcasecmp( arg, "msn" ) )
   {
      IMCSTRFREE( IMC_MSN( ch ) );
      IMC_MSN( ch ) = IMCSTRALLOC( argument );
      imc_printf( ch, "Your MSN Screenname has changed to: %s\r\n", IMC_MSN( ch ) );
      return;
   }

   if( !strcasecmp( arg, "comment" ) )
   {
      if( strlen( argument ) > 78 )
      {
         imc_to_char( "You must limit the comment line to 78 characters or less.\r\n", ch );
         return;
      }
      IMCSTRFREE( IMC_COMMENT( ch ) );
      IMC_COMMENT( ch ) = IMCSTRALLOC( argument );
      imc_printf( ch, "Your comment line has changed to: %s\r\n", IMC_COMMENT( ch ) );
      return;
   }
   imcfinger( ch, "" );
}

/* Removed imcquery and put in imcinfo. -- Xorith */
IMC_CMD( imcinfo )
{
  if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Syntax: imcinfo <mud>\r\n", ch );
      return;
   }

   if( !check_mud( ch, argument ) )
      return;

   imc_send_who( CH_IMCNAME( ch ), argument, "info" );
}

IMC_CMD( imcbeep )
{
   if( IsBitSet( IMCFLAG( ch ), IMC_DENYBEEP ) )
   {
      imc_to_char( "You are not authorized to use imcbeep.\r\n", ch );
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Usage: imcbeep user@mud\r\n", ch );
      imc_to_char( "Usage: imcbeep [on]/[off]\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "on" ) )
   {
      RemoveBit( IMCFLAG( ch ), IMC_BEEP );
      imc_to_char( "You now send and receive imcbeeps.\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "off" ) )
   {
      SetBit( IMCFLAG( ch ), IMC_BEEP );
      imc_to_char( "You no longer send and receive imcbeeps.\r\n", ch );
      return;
   }

   if( IsBitSet( IMCFLAG( ch ), IMC_BEEP ) )
   {
      imc_to_char( "You have imcbeep turned off.\r\n", ch );
      return;
   }

   if( IMCISINVIS( ch ) )
   {
      imc_to_char( "You are invisible.\r\n", ch );
      return;
   }

   if( !check_mudof( ch, argument ) )
      return;

   imc_send_beep( CH_IMCNAME( ch ), argument );
   imc_printf( ch, "~cYou imcbeep ~Y%s~c.\r\n", argument );
}

IMC_CMD( imclist )
{
   REMOTEINFO *p;
   char serverpath[LGST], netname[SMST];
   char *start, *onpath;
   int count = 1, end;

   /*
    * Silly little thing, but since imcchanlist <channel> works... why not? -- Xorith 
    */
   if( IsNullOrEmpty( argument ) )
   {
      imcinfo( ch, argument );
      return;
   }

   imcPagerPrintf( ch, "~WActive muds on %s:~!\r\n", this_imcmud->network );
   imcPagerPrintf( ch, "~c%-15.15s ~B%-40.40s~! ~g%-15.15s ~G%s", "Name", "IMC2 Version", "Network", "Server" );

   /*
    * Put local mud on the list, why was this not done? It's a mud isn't it? 
    */
   imcPagerPrintf( ch, "\r\n\r\n~c%-15.15s ~B%-40.40s ~g%-15.15s ~G%s",
                    this_imcmud->localname, this_imcmud->versionid, this_imcmud->network, this_imcmud->servername );

   for( p = first_rinfo; p; p = p->next, count++ )
   {
      if( !strcasecmp( p->network, "unknown" ) )
         strncpy( netname, this_imcmud->network, SMST );
      else
         strncpy( netname, p->network, SMST );
      /*
       * If there is more then one path use the second path 
       */
      if( !IsNullOrEmpty( p->path ) )
      {
         if( ( start = strchr( p->path, '!' ) ) != NULL )
         {
            start++;
            onpath = start;
            end = 0;
            for( onpath = start; *onpath != '!' && *onpath != '\0'; onpath++ )
            {
               serverpath[end] = *onpath;
               end++;
            }
            serverpath[end] = '\0';
         }
         else
            strncpy( serverpath, p->path, LGST );
      }
      imcPagerPrintf( ch, "\r\n~%c%-15.15s ~B%-40.40s ~g%-15.15s ~G%s",
                       p->expired ? 'R' : 'c', p->Name, p->version, netname, serverpath );
   }
   imcPagerPrintf( ch, "\r\n~WRed mud names indicate connections that are down." );
   imcPagerPrintf( ch, "\r\n~W%d muds on %s found.\r\n", count, this_imcmud->network );
}

IMC_CMD( imcconnect )
{
   if( this_imcmud && this_imcmud->state > IMC_OFFLINE )
   {
      imc_to_char( "The IMC2 network connection appears to already be engaged!\r\n", ch );
      return;
   }
   imcconnect_attempts = 0;
   imcwait = 0;
   ImcStartup( true, -1, false );
}

IMC_CMD( imcdisconnect )
{
   if( this_imcmud && this_imcmud->state == IMC_OFFLINE )
   {
      imc_to_char( "The IMC2 network connection does not appear to be engaged!\r\n", ch );
      return;
   }
   ImcShutdown( false );
}

IMC_CMD( imcconfig )
{
   char arg1[SMST];

   argument = imcOneArgument( argument, arg1 );

   if( IsNullOrEmpty( arg1 ) )
   {
      imc_to_char( "~wSyntax: &Gimc <field> [value]\r\n\r\n", ch );
      imc_to_char( "~wConfiguration info for your mud. Changes save when edited.\r\n", ch );
      imc_to_char( "~wYou may set the following:\r\n\r\n", ch );
      imc_to_char( "~wShow           : ~GDisplays your current configuration.\r\n", ch );
      imc_to_char( "~wLocalname      : ~GThe name IMC2 knows your mud by.\r\n", ch );
      imc_to_char( "~wAutoconnect    : ~GToggles automatic connection on reboots.\r\n", ch );
      imc_to_char( "~wMinPlayerLevel : ~GSets the minimum level IMC2 can see your players at.\r\n", ch );
      imc_to_char( "~wMinImmLevel    : ~GSets the level at which immortal commands become available.\r\n", ch );
      imc_to_char( "~wAdminlevel     : ~GSets the level at which administrative commands become available.\r\n", ch );
      imc_to_char( "~wImplevel       : ~GSets the level at which immplementor commands become available.\r\n", ch );
      imc_to_char( "~wInfoname       : ~GName of your mud, as seen from the imcquery info sheet.\r\n", ch );
      imc_to_char( "~wInfohost       : ~GTelnet address of your mud.\r\n", ch );
      imc_to_char( "~wInfoport       : ~GTelnet port of your mud.\r\n", ch );
      imc_to_char( "~wInfoemail      : ~GEmail address of the mud's IMC administrator.\r\n", ch );
      imc_to_char( "~wInfoWWW        : ~GThe Web address of your mud.\r\n", ch );
      imc_to_char( "~wInfoBase       : ~GThe codebase your mud uses.\r\n", ch );
      imc_to_char( "~wInfoDetails    : ~GSHORT Description of your mud.\r\n", ch );
      imc_to_char( "~wServerAddr     : ~GDNS or IP address of the server you mud connects to.\r\n", ch );
      imc_to_char( "~wServerPort     : ~GPort of the server your mud connects to.\r\n", ch );
      imc_to_char( "~wClientPwd      : ~GClient password for your mud.\r\n", ch );
      imc_to_char( "~wServerPwd      : ~GServer password for your mud.\r\n", ch );
      return;
   }

   if( !strcasecmp( arg1, "sha256" ) )
   {
      this_imcmud->sha256 = !this_imcmud->sha256;

      if( this_imcmud->sha256 )
         imc_to_char( "SHA-256 support enabled.\r\n", ch );
      else
         imc_to_char( "SHA-256 support disabled.\r\n", ch );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "sha256pass" ) )
   {
      this_imcmud->sha256pass = !this_imcmud->sha256pass;

      if( this_imcmud->sha256pass )
         imc_to_char( "SHA-256 Authentication enabled.\r\n", ch );
      else
         imc_to_char( "SHA-256 Authentication disabled.\r\n", ch );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "autoconnect" ) )
   {
      this_imcmud->autoconnect = !this_imcmud->autoconnect;

      if( this_imcmud->autoconnect )
         imc_to_char( "Autoconnect enabled.\r\n", ch );
      else
         imc_to_char( "Autoconnect disabled.\r\n", ch );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "show" ) )
   {
      imc_printf( ch, "~wLocalname      : ~G%s\r\n", this_imcmud->localname );
      imc_printf( ch, "~wAutoconnect    : ~G%s\r\n", this_imcmud->autoconnect ? "Enabled" : "Disabled" );
      imc_printf( ch, "~wMinPlayerLevel : ~G%d\r\n", this_imcmud->minlevel );
      imc_printf( ch, "~wMinImmLevel    : ~G%d\r\n", this_imcmud->immlevel );
      imc_printf( ch, "~wAdminlevel     : ~G%d\r\n", this_imcmud->adminlevel );
      imc_printf( ch, "~wImplevel       : ~G%d\r\n", this_imcmud->implevel );
      imc_printf( ch, "~wInfoname       : ~G%s\r\n", this_imcmud->fullname );
      imc_printf( ch, "~wInfohost       : ~G%s\r\n", this_imcmud->ihost );
      imc_printf( ch, "~wInfoport       : ~G%d\r\n", this_imcmud->iport );
      imc_printf( ch, "~wInfoemail      : ~G%s\r\n", this_imcmud->email );
      imc_printf( ch, "~wInfoWWW        : ~G%s\r\n", this_imcmud->www );
      imc_printf( ch, "~wInfoBase       : ~G%s\r\n", this_imcmud->base );
      imc_printf( ch, "~wInfoDetails    : ~G%s\r\n\r\n", this_imcmud->details );
      imc_printf( ch, "~wServerAddr     : ~G%s\r\n", this_imcmud->rhost );
      imc_printf( ch, "~wServerPort     : ~G%d\r\n", this_imcmud->rport );
      imc_printf( ch, "~wClientPwd      : ~G%s\r\n", this_imcmud->clientpw );
      imc_printf( ch, "~wServerPwd      : ~G%s\r\n", this_imcmud->serverpw );
      if( this_imcmud->sha256 )
         imc_to_char( "~RThis mud.hppas enabled SHA-256 authentication.\r\n", ch );
      else
         imc_to_char( "~RThis mud.hppas disabled SHA-256 authentication.\r\n", ch );
      if( this_imcmud->sha256 && this_imcmud->sha256pass )
         imc_to_char( "~RThe mud is using SHA-256 encryption to authenticate.\r\n", ch );
      else
         imc_to_char( "~RThe mud is using plain text passwords to authenticate.\r\n", ch );
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      imcconfig( ch, "" );
      return;
   }

   if( !strcasecmp( arg1, "minplayerlevel" ) )
   {
      int value = atoi( argument );

      imc_printf( ch, "Minimum level set to %d\r\n", value );
      this_imcmud->minlevel = value;
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "minimmlevel" ) )
   {
      int value = atoi( argument );

      imc_printf( ch, "Immortal level set to %d\r\n", value );
      this_imcmud->immlevel = value;
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "adminlevel" ) )
   {
      int value = atoi( argument );

      imc_printf( ch, "Admin level set to %d\r\n", value );
      this_imcmud->adminlevel = value;
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "implevel" ) && IMCPERM( ch ) == IMCPERM_IMP )
   {
      int value = atoi( argument );

      imc_printf( ch, "Implementor level set to %d\r\n", value );
      this_imcmud->implevel = value;
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "infoname" ) )
   {
      IMCSTRFREE( this_imcmud->fullname );
      this_imcmud->fullname = IMCSTRALLOC( argument );
      imc_save_config();
      imc_printf( ch, "Infoname change to %s\r\n", argument );
      return;
   }

   if( !strcasecmp( arg1, "infohost" ) )
   {
      IMCSTRFREE( this_imcmud->ihost );
      this_imcmud->ihost = IMCSTRALLOC( argument );
      imc_save_config();
      imc_printf( ch, "Infohost changed to %s\r\n", argument );
      return;
   }

   if( !strcasecmp( arg1, "infoport" ) )
   {
      this_imcmud->iport = atoi( argument );
      imc_save_config();
      imc_printf( ch, "Infoport changed to %d\r\n", this_imcmud->iport );
      return;
   }

   if( !strcasecmp( arg1, "infoemail" ) )
   {
      IMCSTRFREE( this_imcmud->email );
      this_imcmud->email = IMCSTRALLOC( argument );
      imc_save_config();
      imc_printf( ch, "Infoemail changed to %s\r\n", argument );
      return;
   }

   if( !strcasecmp( arg1, "infowww" ) )
   {
      IMCSTRFREE( this_imcmud->www );
      this_imcmud->www = IMCSTRALLOC( argument );
      imc_save_config();
      imc_printf( ch, "InfoWWW changed to %s\r\n", argument );
      imc_send_keepalive( NULL, "*@*" );
      return;
   }

   if( !strcasecmp( arg1, "infobase" ) )
   {
      char cbase[SMST];

      IMCSTRFREE( this_imcmud->base );
      this_imcmud->base = IMCSTRALLOC( argument );
      imc_save_config();
      imc_printf( ch, "Infobase changed to %s\r\n", argument );

      IMCSTRFREE( this_imcmud->versionid );
      sprintf( cbase, "%s%s", IMC_VERSION_STRING, this_imcmud->base );
      this_imcmud->versionid = IMCSTRALLOC( cbase );
      imc_send_keepalive( NULL, "*@*" );
      return;
   }

   if( !strcasecmp( arg1, "infodetails" ) )
   {
      IMCSTRFREE( this_imcmud->details );
      this_imcmud->details = IMCSTRALLOC( argument );
      imc_save_config();
      imc_to_char( "Infodetails updated.\r\n", ch );
      return;
   }

   if( this_imcmud->state != IMC_OFFLINE )
   {
      imc_printf( ch, "Cannot alter %s while the mud is connected to IMC.\r\n", arg1 );
      return;
   }

   if( !strcasecmp( arg1, "serveraddr" ) )
   {
      IMCSTRFREE( this_imcmud->rhost );
      this_imcmud->rhost = IMCSTRALLOC( argument );
      imc_printf( ch, "ServerAddr changed to %s\r\n", argument );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "serverport" ) )
   {
      this_imcmud->rport = atoi( argument );
      imc_printf( ch, "ServerPort changed to %d\r\n", this_imcmud->rport );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "clientpwd" ) )
   {
      IMCSTRFREE( this_imcmud->clientpw );
      this_imcmud->clientpw = IMCSTRALLOC( argument );
      imc_printf( ch, "Clientpwd changed to %s\r\n", argument );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "serverpwd" ) )
   {
      IMCSTRFREE( this_imcmud->serverpw );
      this_imcmud->serverpw = IMCSTRALLOC( argument );
      imc_printf( ch, "Serverpwd changed to %s\r\n", argument );
      imc_save_config();
      return;
   }

   if( !strcasecmp( arg1, "localname" ) )
   {
      IMCSTRFREE( this_imcmud->localname );
      this_imcmud->localname = IMCSTRALLOC( argument );
      this_imcmud->sha256pass = false;
      imc_save_config();
      imc_printf( ch, "Localname changed to %s\r\n", argument );
      return;
   }
   imcconfig( ch, "" );
}

/* Modified this command so it's a little more helpful -- Xorith */
IMC_CMD( imcignore )
{
   int count;
   IMC_IGNORE *ign;
   char arg[SMST];

   argument = imcOneArgument( argument, arg );

   if( IsNullOrEmpty( arg ) )
   {
      imc_to_char( "You currently ignore the following:\r\n", ch );
      for( count = 0, ign = FIRST_IMCIGNORE( ch ); ign; ign = ign->next, count++ )
         imc_printf( ch, "%s\r\n", ign->Name );

      if( !count )
         imc_to_char( " none\r\n", ch );
      else
         imc_printf( ch, "\r\n[total %d]\r\n", count );
      imc_to_char( "For help on imcignore, type: IMCIGNORE HELP\r\n", ch );
      return;
   }

   if( !strcasecmp( arg, "help" ) )
   {
      imc_to_char( "~wTo see your current ignores  : ~GIMCIGNORE\r\n", ch );
      imc_to_char( "~wTo add an ignore             : ~GIMCIGNORE ADD <argument>\r\n", ch );
      imc_to_char( "~wTo delete an ignore          : ~GIMCIGNORE DELETE <argument>\r\n", ch );
      imc_to_char( "~WSee your MUD's help for more information.\r\n", ch );
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Must specify both action and name.\r\n", ch );
      imc_to_char( "Please see IMCIGNORE HELP for details.\r\n", ch );
      return;
   }

   if( !strcasecmp( arg, "delete" ) )
   {
      for( ign = FIRST_IMCIGNORE( ch ); ign; ign = ign->next )
      {
         if( !strcasecmp( ign->Name, argument ) )
         {
            IMCUNLINK( ign, FIRST_IMCIGNORE( ch ), LAST_IMCIGNORE( ch ), next, prev );
            IMCSTRFREE( ign->Name );
            IMCDISPOSE( ign );
            imc_to_char( "Entry deleted.\r\n", ch );
            return;
         }
      }
      imc_to_char( "Entry not found.\r\nPlease check your ignores by typing IMCIGNORE with no arguments.\r\n", ch );
      return;
   }

   if( !strcasecmp( arg, "add" ) )
   {
      IMCCREATE( ign, IMC_IGNORE, 1 );
      ign->Name = IMCSTRALLOC( argument );
      IMCLINK( ign, FIRST_IMCIGNORE( ch ), LAST_IMCIGNORE( ch ), next, prev );
      imc_printf( ch, "%s will now be ignored.\r\n", argument );
      return;
   }
   imcignore( ch, "help" );
}

/* Made this command a little more helpful --Xorith */
IMC_CMD( imcban )
{
   int count;
   IMC_BAN *ban;
   char arg[SMST];

   argument = imcOneArgument( argument, arg );

   if( IsNullOrEmpty( arg ) )
   {
      imc_to_char( "The mud currently bans the following:\r\n", ch );
      for( count = 0, ban = first_imc_ban; ban; ban = ban->next, count++ )
         imc_printf( ch, "%s\r\n", ban->Name );

      if( !count )
         imc_to_char( " none\r\n", ch );
      else
         imc_printf( ch, "\r\n[total %d]\r\n", count );
      imc_to_char( "Type: IMCBAN HELP for more information.\r\n", ch );
      return;
   }

   if( !strcasecmp( arg, "help" ) )
   {
      imc_to_char( "~wTo see the current bans             : ~GIMCBAN\r\n", ch );
      imc_to_char( "~wTo add a MUD to the ban list        : ~GIMCBAN ADD <argument>\r\n", ch );
      imc_to_char( "~wTo delete a MUD from the ban list   : ~GIMCBAN DELETE <argument>\r\n", ch );
      imc_to_char( "~WSee your MUD's help for more information.\r\n", ch );
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Must specify both action and name.\r\nPlease type IMCBAN HELP for more information\r\n", ch );
      return;
   }

   if( !strcasecmp( arg, "delete" ) )
   {
      if( imc_delban( argument ) )
      {
         imc_savebans();
         imc_to_char( "Entry deleted.\r\n", ch );
         return;
      }
      imc_to_char( "Entry not found.\r\nPlease type IMCBAN without arguments to see the current ban list.\r\n", ch );
   }

   if( !strcasecmp( arg, "add" ) )
   {
      imc_addban( argument );
      imc_savebans();
      imc_printf( ch, "Mud %s will now be banned.\r\n", argument );
      return;
   }
   imcban( ch, "" );
}

IMC_CMD( imc_deny_channel )
{
   char vic_name[SMST];
   Character *victim;
   IMC_CHANNEL *channel;

   argument = imcOneArgument( argument, vic_name );

   if( IsNullOrEmpty( vic_name ) || IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Usage: imcdeny <person> <local channel name>\r\n", ch );
      imc_to_char( "Usage: imcdeny <person> [tell/beep/finger]\r\n", ch );
      return;
   }

   if( !( victim = imc_find_user( vic_name ) ) )
   {
      imc_to_char( "No such person is currently online.\r\n", ch );
      return;
   }

   if( IMCPERM( ch ) <= IMCPERM( victim ) )
   {
      imc_to_char( "You cannot alter their settings.\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "tell" ) )
   {
      if( !IsBitSet( IMCFLAG( victim ), IMC_DENYTELL ) )
      {
         SetBit( IMCFLAG( victim ), IMC_DENYTELL );
         imc_printf( ch, "%s can no longer use imctells.\r\n", CH_IMCNAME( victim ) );
         return;
      }
      RemoveBit( IMCFLAG( victim ), IMC_DENYTELL );
      imc_printf( ch, "%s can use imctells again.\r\n", CH_IMCNAME( victim ) );
      return;
   }

   if( !strcasecmp( argument, "beep" ) )
   {
      if( !IsBitSet( IMCFLAG( victim ), IMC_DENYBEEP ) )
      {
         SetBit( IMCFLAG( victim ), IMC_DENYBEEP );
         imc_printf( ch, "%s can no longer use imcbeeps.\r\n", CH_IMCNAME( victim ) );
         return;
      }
      RemoveBit( IMCFLAG( victim ), IMC_DENYBEEP );
      imc_printf( ch, "%s can use imcbeeps again.\r\n", CH_IMCNAME( victim ) );
      return;
   }

   if( !strcasecmp( argument, "finger" ) )
   {
      if( !IsBitSet( IMCFLAG( victim ), IMC_DENYFINGER ) )
      {
         SetBit( IMCFLAG( victim ), IMC_DENYFINGER );
         imc_printf( ch, "%s can no longer use imcfingers.\r\n", CH_IMCNAME( victim ) );
         return;
      }
      RemoveBit( IMCFLAG( victim ), IMC_DENYFINGER );
      imc_printf( ch, "%s can use imcfingers again.\r\n", CH_IMCNAME( victim ) );
      return;
   }

   /*
    * Assumed to be denying a channel by this stage. 
    */
   if( !( channel = imc_findchannel( argument ) ) )
   {
      imc_to_char( "Unknown or unconfigured local channel. Check your channel name.\r\n", ch );
      return;
   }

   if( imc_hasname( IMC_DENY( victim ), channel->local_name ) )
   {
      imc_printf( ch, "%s can now listen to %s\r\n", CH_IMCNAME( victim ), channel->local_name );
      imc_removename( &IMC_DENY( victim ), channel->local_name );
   }
   else
   {
      imc_printf( ch, "%s can no longer listen to %s\r\n", CH_IMCNAME( victim ), channel->local_name );
      imc_addname( &IMC_DENY( victim ), channel->local_name );
   }
}

IMC_CMD( imcpermstats )
{
   Character *victim;

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Usage: imcperms <user>\r\n", ch );
      return;
   }

   if( !( victim = imc_find_user( argument ) ) )
   {
      imc_to_char( "No such person is currently online.\r\n", ch );
      return;
   }

   if( IMCPERM( victim ) < 0 || IMCPERM( victim ) > IMCPERM_IMP )
   {
      imc_printf( ch, "%s has an invalid permission setting!\r\n", CH_IMCNAME( victim ) );
      return;
   }

   imc_printf( ch, "~GPermissions for %s: %s\r\n", CH_IMCNAME( victim ), imcperm_names[IMCPERM( victim )] );
   imc_printf( ch, "~gThese permissions were obtained %s.\r\n",
               IsBitSet( IMCFLAG( victim ), IMC_PERMOVERRIDE ) ? "manually via imcpermset" : "automatically by level" );
}

IMC_CMD( imcpermset )
{
   Character *victim;
   char arg[SMST];
   int permvalue;

   argument = imcOneArgument( argument, arg );

   if( IsNullOrEmpty( arg ) )
   {
      imc_to_char( "Usage: imcpermset <user> <permission>\r\n", ch );
      imc_to_char( "Permission can be one of: None, Mort, Imm, Admin, Imp\r\n", ch );
      return;
   }

   if( !( victim = imc_find_user( arg ) ) )
   {
      imc_to_char( "No such person is currently online.\r\n", ch );
      return;
   }

   if( !strcasecmp( argument, "override" ) )
      permvalue = -1;
   else
   {
      permvalue = get_imcpermvalue( argument );

      if( !imccheck_permissions( ch, permvalue, IMCPERM( victim ), true ) )
         return;
   }

   /*
    * Just something to avoid looping through the channel clean-up --Xorith 
    */
   if( IMCPERM( victim ) == permvalue )
   {
      imc_printf( ch, "%s already has a permission level of %s.\r\n", CH_IMCNAME( victim ), imcperm_names[permvalue] );
      return;
   }

   if( permvalue == -1 )
   {
      RemoveBit( IMCFLAG( victim ), IMC_PERMOVERRIDE );
      imc_printf( ch, "~YPermission flag override has been removed from %s\r\n", CH_IMCNAME( victim ) );
      return;
   }

   IMCPERM( victim ) = permvalue;
   SetBit( IMCFLAG( victim ), IMC_PERMOVERRIDE );

   imc_printf( ch, "~YPermission level for %s has been changed to %s\r\n", CH_IMCNAME( victim ), imcperm_names[permvalue] );
   /*
    * Channel Clean-Up added by Xorith 9-24-03 
    */
   /*
    * Note: Let's not clean up IMC_DENY for a player. Never know... 
    */
   if( IMC_LISTEN( victim ) != NULL && this_imcmud->state == IMC_ONLINE )
   {
      IMC_CHANNEL *channel = NULL;
      const char *channels = IMC_LISTEN( victim );

      while( 1 )
      {
	if( IsNullOrEmpty( channels ) )
	  break;

	channels = imcOneArgument( channels, arg );

         if( !( channel = imc_findchannel( arg ) ) )
            imc_removename( &IMC_LISTEN( victim ), arg );
         if( channel && IMCPERM( victim ) < channel->level )
         {
            imc_removename( &IMC_LISTEN( victim ), arg );
            imc_printf( ch, "~WRemoving '%s' level channel: '%s', exceeding new permission of '%s'\r\n",
                        imcperm_names[channel->level], channel->local_name, imcperm_names[IMCPERM( victim )] );
         }
      }
   }
}

IMC_CMD( imcinvis )
{
   if( IsBitSet( IMCFLAG( ch ), IMC_INVIS ) )
   {
      RemoveBit( IMCFLAG( ch ), IMC_INVIS );
      imc_to_char( "You are now imcvisible.\r\n", ch );
   }
   else
   {
      SetBit( IMCFLAG( ch ), IMC_INVIS );
      imc_to_char( "You are now imcinvisible.\r\n", ch );
   }
}

IMC_CMD( imcchanwho )
{
   IMC_CHANNEL *c;
   IMC_PACKET *p;
   char chan[SMST], mud[SMST];

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Usage: imcchanwho <channel> [<mud> <mud> <mud> <...>|<all>]\r\n", ch );
      return;
   }

   argument = imcOneArgument( argument, chan );

   if( !( c = imc_findchannel( chan ) ) )
   {
      imc_to_char( "No such channel.\r\n", ch );
      return;
   }

   if( IMCPERM( ch ) < c->level )
   {
      imc_to_char( "No such channel.\r\n", ch );
      return;
   }

   if( !c->refreshed )
   {
      imc_printf( ch, "%s has not been refreshed yet.\r\n", c->Name );
      return;
   }

   if( strcasecmp( argument, "all" ) )
   {
     while( !IsNullOrEmpty( argument ) )
      {
         argument = imcOneArgument( argument, mud );

         if( !check_mud( ch, mud ) )
            continue;

         p = imc_newpacket( CH_IMCNAME( ch ), "ice-chan-who", mud );
         imc_addtopacket( p, "level=%d", IMCPERM( ch ) );
         imc_addtopacket( p, "channel=%s", c->Name );
         imc_addtopacket( p, "lname=%s", c->local_name ? c->local_name : c->Name );
         imc_write_packet( p );
      }
      return;
   }

   p = imc_newpacket( CH_IMCNAME( ch ), "ice-chan-who", "*" );
   imc_addtopacket( p, "level=%d", IMCPERM( ch ) );
   imc_addtopacket( p, "channel=%s", c->Name );
   imc_addtopacket( p, "lname=%s", c->local_name ? c->local_name : c->Name );
   imc_write_packet( p );

   imc_printf( ch, "~G%s", get_local_chanwho( c ) );
}

IMC_CMD( imcremoteadmin )
{
   REMOTEINFO *r;
   char server[SMST], cmd[SMST], to[SMST];
   char pwd[LGST];
   IMC_PACKET *p;

   argument = imcOneArgument( argument, server );
   argument = imcOneArgument( argument, pwd );
   argument = imcOneArgument( argument, cmd );

   if( IsNullOrEmpty( server ) || IsNullOrEmpty( cmd ) )
   {
      imc_to_char( "Syntax: imcadmin <server> <password> <command> [<data..>]\r\n", ch );
      imc_to_char( "You must be an approved server administrator to use remote commands.\r\n", ch );
      return;
   }

   if( !( r = imc_find_reminfo( server ) ) )
   {
      imc_printf( ch, "~W%s ~cis not a valid mud name.\r\n", server );
      return;
   }

   if( r->expired )
   {
      imc_printf( ch, "~W%s ~cis not connected right now.\r\n", r->Name );
      return;
   }

   sprintf( to, "IMC@%s", r->Name );
   p = imc_newpacket( CH_IMCNAME( ch ), "remote-admin", to );
   imc_addtopacket( p, "command=%s", cmd );

   if( !IsNullOrEmpty( argument ) )
      imc_addtopacket( p, "data=%s", argument );

   if( this_imcmud->sha256pass )
   {
      char cryptpw[LGST];
      char *hash;

      sprintf( cryptpw, "%ld%s", imc_sequencenumber + 1, pwd );
      hash = sha256_crypt( cryptpw );
      imc_addtopacket( p, "hash=%s", hash );
   }
   imc_write_packet( p );

   imc_to_char( "Remote command sent.\r\n", ch );
}

IMC_CMD( imchelp )
{
   char buf[LGST];
   IMC_HelpFile *help;
   int col, perm;

   if( IsNullOrEmpty( argument ) )
   {
      strncpy( buf, "~gHelp is available for the following commands:\r\n", LGST );
      strncat( buf, "~G---------------------------------------------\r\n", LGST );
      for( perm = IMCPERM_MORT; perm <= IMCPERM( ch ); perm++ )
      {
         col = 0;
         sprintf( buf + strlen( buf ), "\r\n~g%s helps:~G\r\n", imcperm_names[perm] );
         for( help = first_imc_help; help; help = help->next )
         {
            if( help->level != perm )
               continue;

            sprintf( buf + strlen( buf ), "%-15s", help->Name );
            if( ++col % 6 == 0 )
               strncat( buf, "\r\n", LGST );
         }
         if( col % 6 != 0 )
            strncat( buf, "\r\n", LGST );
      }
      imc_to_pager( buf, ch );
      return;
   }

   for( help = first_imc_help; help; help = help->next )
   {
      if( !strcasecmp( help->Name, argument ) )
      {
	if( IsNullOrEmpty( help->text ) )
            imc_printf( ch, "~gNo information available for topic ~W%s~g.\r\n", help->Name );
         else
            imc_printf( ch, "~g%s\r\n", help->text );
         return;
      }
   }
   imc_printf( ch, "~gNo help exists for topic ~W%s~g.\r\n", argument );
}

IMC_CMD( imccolor )
{
   if( IsBitSet( IMCFLAG( ch ), IMC_COLORFLAG ) )
   {
      RemoveBit( IMCFLAG( ch ), IMC_COLORFLAG );
      imc_to_char( "IMC2 color is now off.\r\n", ch );
   }
   else
   {
      SetBit( IMCFLAG( ch ), IMC_COLORFLAG );
      imc_to_char( "~RIMC2 c~Yo~Gl~Bo~Pr ~Ris now on. Enjoy :)\r\n", ch );
   }
}

IMC_CMD( imcafk )
{
   if( IsBitSet( IMCFLAG( ch ), IMC_AFK ) )
   {
      RemoveBit( IMCFLAG( ch ), IMC_AFK );
      imc_to_char( "You are no longer AFK to IMC2.\r\n", ch );
   }
   else
   {
      SetBit( IMCFLAG( ch ), IMC_AFK );
      imc_to_char( "You are now AFK to IMC2.\r\n", ch );
   }
}

IMC_CMD( imcdebug )
{
   imcpacketdebug = !imcpacketdebug;

   if( imcpacketdebug )
      imc_to_char( "Packet debug enabled.\r\n", ch );
   else
      imc_to_char( "Packet debug disabled.\r\n", ch );
}

/* This is very possibly going to be spammy as hell */
IMC_CMD( imc_show_ucache_contents )
{
   IMCUCACHE_DATA *user;
   int users = 0;

   imc_to_pager( "Cached user information\r\n", ch );
   imc_to_pager( "User                          | Gender ( 0 = Male, 1 = Female, 2 = Other )\r\n", ch );
   imc_to_pager( "--------------------------------------------------------------------------\r\n", ch );
   for( user = first_imcucache; user; user = user->next )
   {
      imcPagerPrintf( ch, "%-30s %d\r\n", user->Name, user->gender );
      users++;
   }
   imcPagerPrintf( ch, "%d users being cached.\r\n", users );
}

IMC_CMD( imccedit )
{
   IMC_CMD_DATA *cmd, *tmp;
   IMC_ALIAS *alias, *alias_next;
   char name[SMST], option[SMST];
   bool found = false, aliasfound = false;

   argument = imcOneArgument( argument, name );
   argument = imcOneArgument( argument, option );

   if( IsNullOrEmpty( name ) || IsNullOrEmpty( option ) )
   {
      imc_to_char( "Usage: imccedit <command> <create|delete|alias|rename|code|permission|connected> <field>.\r\n", ch );
      return;
   }

   for( cmd = first_imc_command; cmd; cmd = cmd->next )
   {
      if( !strcasecmp( cmd->Name, name ) )
      {
         found = true;
         break;
      }
      for( alias = cmd->first_alias; alias; alias = alias->next )
      {
         if( !strcasecmp( alias->Name, name ) )
            aliasfound = true;
      }
   }

   if( !strcasecmp( option, "create" ) )
   {
      if( found )
      {
         imc_printf( ch, "~gA command named ~W%s ~galready exists.\r\n", name );
         return;
      }

      if( aliasfound )
      {
         imc_printf( ch, "~g%s already exists as an alias for another command.\r\n", name );
         return;
      }

      IMCCREATE( cmd, IMC_CMD_DATA, 1 );
      cmd->Name = IMCSTRALLOC( name );
      cmd->level = IMCPERM( ch );
      cmd->connected = false;
      imc_printf( ch, "~gCommand ~W%s ~gcreated.\r\n", cmd->Name );

      if( !IsNullOrEmpty( argument ) )
      {
         cmd->function = imc_function( argument );
         if( cmd->function == NULL )
            imc_printf( ch, "~gFunction ~W%s ~gdoes not exist - set to NULL.\r\n", argument );
      }
      else
      {
         imc_to_char( "~gFunction set to NULL.\r\n", ch );
         cmd->function = NULL;
      }
      IMCLINK( cmd, first_imc_command, last_imc_command, next, prev );
      imc_savecommands();
      return;
   }

   if( !found )
   {
      imc_printf( ch, "~gNo command named ~W%s ~gexists.\r\n", name );
      return;
   }

   if( !imccheck_permissions( ch, cmd->level, cmd->level, false ) )
      return;

   if( !strcasecmp( option, "delete" ) )
   {
      imc_printf( ch, "~gCommand ~W%s ~ghas been deleted.\r\n", cmd->Name );
      for( alias = cmd->first_alias; alias; alias = alias_next )
      {
         alias_next = alias->next;

         IMCUNLINK( alias, cmd->first_alias, cmd->last_alias, next, prev );
         IMCSTRFREE( alias->Name );
         IMCDISPOSE( alias );
      }
      IMCUNLINK( cmd, first_imc_command, last_imc_command, next, prev );
      IMCSTRFREE( cmd->Name );
      IMCDISPOSE( cmd );
      imc_savecommands();
      return;
   }

   /*
    * MY GOD! What an inefficient mess you've made Samson! 
    */
   if( !strcasecmp( option, "alias" ) )
   {
      for( alias = cmd->first_alias; alias; alias = alias_next )
      {
         alias_next = alias->next;

         if( !strcasecmp( alias->Name, argument ) )
         {
            imc_printf( ch, "~W%s ~ghas been removed as an alias for ~W%s\r\n", argument, cmd->Name );
            IMCUNLINK( alias, cmd->first_alias, cmd->last_alias, next, prev );
            IMCSTRFREE( alias->Name );
            IMCDISPOSE( alias );
            imc_savecommands();
            return;
         }
      }

      for( tmp = first_imc_command; tmp; tmp = tmp->next )
      {
         if( !strcasecmp( tmp->Name, argument ) )
         {
            imc_printf( ch, "~W%s &gis already a command name.\r\n", argument );
            return;
         }
         for( alias = tmp->first_alias; alias; alias = alias->next )
         {
            if( !strcasecmp( argument, alias->Name ) )
            {
               imc_printf( ch, "~W%s ~gis already an alias for ~W%s\r\n", argument, tmp->Name );
               return;
            }
         }
      }

      IMCCREATE( alias, IMC_ALIAS, 1 );
      alias->Name = IMCSTRALLOC( argument );
      IMCLINK( alias, cmd->first_alias, cmd->last_alias, next, prev );
      imc_printf( ch, "~W%s ~ghas been added as an alias for ~W%s\r\n", alias->Name, cmd->Name );
      imc_savecommands();
      return;
   }

   if( !strcasecmp( option, "connected" ) )
   {
      cmd->connected = !cmd->connected;

      if( cmd->connected )
         imc_printf( ch, "~gCommand ~W%s ~gwill now require a connection to IMC2 to use.\r\n", cmd->Name );
      else
         imc_printf( ch, "~gCommand ~W%s ~gwill no longer require a connection to IMC2 to use.\r\n", cmd->Name );
      imc_savecommands();
      return;
   }

   if( !strcasecmp( option, "show" ) )
   {
      char buf[LGST];

      imc_printf( ch, "~gCommand       : ~W%s\r\n", cmd->Name );
      imc_printf( ch, "~gPermission    : ~W%s\r\n", imcperm_names[cmd->level] );
      imc_printf( ch, "~gFunction      : ~W%s\r\n", imc_funcname( cmd->function ) );
      imc_printf( ch, "~gConnection Req: ~W%s\r\n", cmd->connected ? "Yes" : "No" );
      if( cmd->first_alias )
      {
         int col = 0;
         strncpy( buf, "~gAliases       : ~W", LGST );
         for( alias = cmd->first_alias; alias; alias = alias->next )
         {
            sprintf( buf + strlen( buf ), "%s ", alias->Name );
            if( ++col % 10 == 0 )
               strncat( buf, "\r\n", LGST );
         }
         if( col % 10 != 0 )
            strncat( buf, "\r\n", LGST );
         imc_to_char( buf, ch );
      }
      return;
   }

   if( IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Required argument missing.\r\n", ch );
      imccedit( ch, "" );
      return;
   }

   if( !strcasecmp( option, "rename" ) )
   {
      imc_printf( ch, "~gCommand ~W%s ~ghas been renamed to ~W%s.\r\n", cmd->Name, argument );
      IMCSTRFREE( cmd->Name );
      cmd->Name = IMCSTRALLOC( argument );
      imc_savecommands();
      return;
   }

   if( !strcasecmp( option, "code" ) )
   {
      cmd->function = imc_function( argument );
      if( cmd->function == NULL )
         imc_printf( ch, "~gFunction ~W%s ~gdoes not exist - set to NULL.\r\n", argument );
      else
         imc_printf( ch, "~gFunction set to ~W%s.\r\n", argument );
      imc_savecommands();
      return;
   }

   if( !strcasecmp( option, "perm" ) || !strcasecmp( option, "permission" ) )
   {
      int permvalue = get_imcpermvalue( argument );

      if( !imccheck_permissions( ch, permvalue, cmd->level, false ) )
         return;

      cmd->level = permvalue;
      imc_printf( ch, "~gCommand ~W%s ~gpermission level has been changed to ~W%s.\r\n", cmd->Name,
                  imcperm_names[permvalue] );
      imc_savecommands();
      return;
   }
   imccedit( ch, "" );
}

IMC_CMD( imchedit )
{
   IMC_HelpFile *help;
   char name[SMST], cmd[SMST];
   bool found = false;

   argument = imcOneArgument( argument, name );
   argument = imcOneArgument( argument, cmd );

   if( IsNullOrEmpty( name ) || IsNullOrEmpty( cmd ) || IsNullOrEmpty( argument ) )
   {
      imc_to_char( "Usage: imchedit <topic> [name|perm] <field>\r\n", ch );
      imc_to_char( "Where <field> can be either name, or permission level.\r\n", ch );
      return;
   }

   for( help = first_imc_help; help; help = help->next )
   {
      if( !strcasecmp( help->Name, name ) )
      {
         found = true;
         break;
      }
   }

   if( !found )
   {
      imc_printf( ch, "~gNo help exists for topic ~W%s~g. You will need to add it to the helpfile manually.\r\n", name );
      return;
   }

   if( !strcasecmp( cmd, "name" ) )
   {
      imc_printf( ch, "~W%s ~ghas been renamed to ~W%s.\r\n", help->Name, argument );
      IMCSTRFREE( help->Name );
      help->Name = IMCSTRALLOC( argument );
      imc_savehelps();
      return;
   }

   if( !strcasecmp( cmd, "perm" ) )
   {
      int permvalue = get_imcpermvalue( argument );

      if( !imccheck_permissions( ch, permvalue, help->level, false ) )
         return;

      imc_printf( ch, "~gPermission level for ~W%s ~ghas been changed to ~W%s.\r\n", help->Name, imcperm_names[permvalue] );
      help->level = permvalue;
      imc_savehelps();
      return;
   }
   imchedit( ch, "" );
}

IMC_CMD( imcrefresh )
{
   REMOTEINFO *r, *rnext;

   for( r = first_rinfo; r; r = rnext )
   {
      rnext = r->next;
      imc_delete_reminfo( r );
   }
   imc_request_keepalive();
   imc_to_char( "Mud list is being refreshed.\r\n", ch );
}

IMC_CMD( imctemplates )
{
   imc_to_char( "Refreshing all templates.\r\n", ch );
   imc_load_templates();
}

IMC_CMD( imclast )
{
   IMC_PACKET *p = imc_newpacket( CH_IMCNAME( ch ), "imc-laston", this_imcmud->servername );

   if( !IsNullOrEmpty( argument ) )
      imc_addtopacket( p, "username=%s", argument );

   imc_write_packet( p );
}

IMC_CMD( imc_other )
{
   char buf[LGST];
   IMC_CMD_DATA *cmd;
   int col, perm;

   strncpy( buf, "~gThe following commands are available:\r\n", LGST );
   strncat( buf, "~G-------------------------------------\r\n\r\n", LGST );
   for( perm = IMCPERM_MORT; perm <= IMCPERM( ch ); perm++ )
   {
      col = 0;
      sprintf( buf + strlen( buf ), "\r\n~g%s commands:~G\r\n", imcperm_names[perm] );
      for( cmd = first_imc_command; cmd; cmd = cmd->next )
      {
         if( cmd->level != perm )
            continue;

         sprintf( buf + strlen( buf ), "%-15s", cmd->Name );
         if( ++col % 6 == 0 )
            strncat( buf, "\r\n", LGST );
      }
      if( col % 6 != 0 )
         strncat( buf, "\r\n", LGST );
   }
   imc_to_pager( buf, ch );
   imc_to_pager( "\r\n~gFor information about a specific command, see ~Wimchelp <command>~g.\r\n", ch );
}

static const char *imc_GetSocial( Character * ch, const char *sname, const char *person, const char *mud, int victim )
{
   static char socname[LGST];
   int i = 0;
   SOCIAL_DATA *social;
   static char lcSocName[LGST];

   socname[0] = '\0';

   /* lower-case the social name before asking the MUD */
   for (i = 0; i < LGST && sname[i] != '\0'; i++) {
     lcSocName[i] = tolower( (int) sname[i]);
   }

   if( ( social = Socials->FindByName( lcSocName ) ) == NULL )
   {
      imc_printf( ch, "~YSocial ~W%s~Y does not exist on this mud.\r\n", sname );
      return socname;
   }

   if( !IsNullOrEmpty( person ) && !IsNullOrEmpty( mud ) )
   {
     if( !IsNullOrEmpty( person ) && !strcasecmp( person, CH_IMCNAME( ch ) )
	 && !IsNullOrEmpty( mud ) && !strcasecmp( mud, this_imcmud->localname ) )
      {
	if( IsNullOrEmpty( social->OthersAuto ) )
         {
            imc_printf( ch, "~YSocial ~W%s~Y: Missing others_auto.\r\n", sname );
            return socname;
         }
         strncpy( socname, social->OthersAuto, LGST );
      }
      else
      {
         if( victim == 0 )
         {
	   if( IsNullOrEmpty( social->OthersFound ) )
            {
               imc_printf( ch, "~YSocial ~W%s~Y: Missing others_found.\r\n", sname );
               return socname;
            }
            strncpy( socname, social->OthersFound, LGST );
         }
         else if( victim == 1 )
         {
	   if( IsNullOrEmpty( social->VictimFound ) )
            {
               imc_printf( ch, "~YSocial ~W%s~Y: Missing vict_found.\r\n", sname );
               return socname;
            }
            strncpy( socname, social->VictimFound, LGST );
         }
         else
         {
	   if( IsNullOrEmpty( social->CharFound ) )
            {
               imc_printf( ch, "~YSocial ~W%s~Y: Missing char_found.\r\n", sname );
               return socname;
            }
            strncpy( socname, social->CharFound, LGST );
         }
      }
   }
   else
   {
      if( victim == 0 || victim == 1 )
      {
	if( IsNullOrEmpty( social->OthersNoArg ) )
         {
            imc_printf( ch, "~YSocial ~W%s~Y: Missing others_no_arg.\r\n", sname );
            return socname;
         }
         strncpy( socname, social->OthersNoArg, LGST );
      }
      else
      {
	if( IsNullOrEmpty( social->CharNoArg ) )
         {
            imc_printf( ch, "~YSocial ~W%s~Y: Missing char_no_arg.\r\n", sname );
            return socname;
         }
         strncpy( socname, social->CharNoArg, LGST );
      }
   }

   return socname;
}

static char *imc_act_string( const char *format, Character * ch, Character * vic )
{
   static const char *const he_she[] = { "it", "he", "she" };
   static const char *const him_her[] = { "it", "him", "her" };
   static const char *const his_her[] = { "its", "his", "her" };
   static char buf[LGST];
   char tmp_str[LGST];
   const char *i = "";
   char *point;
   bool should_upper = false;

   if( IsNullOrEmpty( format ) || !ch )
      return NULL;

   point = buf;

   while( !IsNullOrEmpty( format ) )
   {
      if( *format == '.' || *format == '?' || *format == '!' )
         should_upper = true;
      else if( should_upper == true && !isspace( (int) *format ) && *format != '$' )
         should_upper = false;

      if( *format != '$' )
      {
         *point++ = *format++;
         continue;
      }
      ++format;

      if( ( !vic ) && ( *format == 'N' || *format == 'E' || *format == 'M' || *format == 'S' || *format == 'K' ) )
         i = " !!!!! ";
      else
      {
         switch ( *format )
         {
            default:
               i = " !!!!! ";
               break;
            case 'n':
               i = imc_makename( CH_IMCNAME( ch ), this_imcmud->localname );
               break;
            case 'N':
               i = CH_IMCNAME( vic );
               break;

            case 'e':
               i = should_upper ?
                  Capitalize( he_she[urange( 0, CH_IMCSEX( ch ), 2 )] ) : he_she[urange( 0, CH_IMCSEX( ch ), 2 )];
               break;

            case 'E':
               i = should_upper ?
                  Capitalize( he_she[urange( 0, CH_IMCSEX( vic ), 2 )] ) : he_she[urange( 0, CH_IMCSEX( vic ), 2 )];
               break;

            case 'm':
               i = should_upper ?
                  Capitalize( him_her[urange( 0, CH_IMCSEX( ch ), 2 )] ) : him_her[urange( 0, CH_IMCSEX( ch ), 2 )];
               break;

            case 'M':
               i = should_upper ?
                  Capitalize( him_her[urange( 0, CH_IMCSEX( vic ), 2 )] ) : him_her[urange( 0, CH_IMCSEX( vic ), 2 )];
               break;

            case 's':
               i = should_upper ?
                  Capitalize( his_her[urange( 0, CH_IMCSEX( ch ), 2 )] ) : his_her[urange( 0, CH_IMCSEX( ch ), 2 )];
               break;

            case 'S':
               i = should_upper ?
                  Capitalize( his_her[urange( 0, CH_IMCSEX( vic ), 2 )] ) : his_her[urange( 0, CH_IMCSEX( vic ), 2 )];
               break;

            case 'k':
               imcOneArgument( CH_IMCNAME( ch ), tmp_str );
               i = ( char * )tmp_str;
               break;
            case 'K':
               imcOneArgument( CH_IMCNAME( vic ), tmp_str );
               i = ( char * )tmp_str;
               break;
         }
      }
      ++format;
      while( ( *point = *i ) != '\0' )
         ++point, ++i;
   }
   *point = 0;
   point++;
   *point = '\0';

   buf[0] = CharToUppercase( buf[0] );
   return buf;
}

static Character *imc_make_skeleton( const char *name )
{
   Character *skeleton;

   IMCCREATE( skeleton, Character, 1 );

   skeleton->Name = IMCSTRALLOC( name );
   skeleton->ShortDescr = IMCSTRALLOC( name );
   skeleton->InRoom = GetRoom( ROOM_VNUM_LIMBO );

   return skeleton;
}

static void imc_purge_skeleton( Character * skeleton )
{
   if( !skeleton )
      return;

   IMCSTRFREE( skeleton->Name );
   IMCSTRFREE( skeleton->ShortDescr );

   IMCDISPOSE( skeleton );
}

/* Socials can now be called anywhere you want them - like for instance, tells.
 * Thanks to Darien@Sandstorm for this suggestion. -- Samson 2-21-04
 */
static const char *imc_send_social( Character * ch, const char *argument, int telloption )
{
   Character *skeleton = NULL;
   char *ps;
   char socbuf[LGST];
   char msg[LGST];
   char arg1[SMST];
   char person[SMST] = {'\0'};
   char mud[SMST] = {'\0'};
   char buf[LGST];
   size_t x;

   /*
    * Name of social, remainder of argument is assumed to hold the target 
    */
   argument = imcOneArgument( argument, arg1 );

   if( !IsNullOrEmpty( argument ) )
   {
     /*
      * In strict ISO C++ strchr takes non-const string as first argument,
      * resulting in error on some compilers.
      */
#ifdef __cplusplus
     if( !( ps = strchr( (char*) argument, '@' ) ) )
#else
      if( !( ps = strchr( argument, '@' ) ) )
#endif
      {
         imc_to_char( "You need to specify a person@mud for a target.\r\n", ch );
         return "";
      }
      else
      {
         for( x = 0; x < strlen( argument ); x++ )
         {
            person[x] = argument[x];
            if( person[x] == '@' )
               break;
         }
         person[x] = '\0';

         ps[0] = '\0';
         strncpy( mud, ps + 1, SMST );
      }
   }

   if( telloption == 0 )
   {
      sprintf( socbuf, "%s", imc_GetSocial( ch, arg1, person, mud, 0 ) );

      if( IsNullOrEmpty( socbuf ) )
         return "";
   }

   if( telloption == 1 )
   {
      sprintf( socbuf, "%s", imc_GetSocial( ch, arg1, person, mud, 1 ) );

      if( IsNullOrEmpty( socbuf ) )
         return "";
   }

   if( telloption == 2 )
   {
      sprintf( socbuf, "%s", imc_GetSocial( ch, arg1, person, mud, 2 ) );

      if( IsNullOrEmpty( socbuf ) )
         return "";
   }

   if( !IsNullOrEmpty( argument ) )
   {
      int sex;

      sprintf( buf, "%s@%s", person, mud );
      sex = imc_get_ucache_gender( buf );
      if( sex == -1 )
      {
         imc_send_ucache_request( buf );
         sex = SEX_MALE;
      }
      else
         sex = imctodikugender( sex );

      skeleton = imc_make_skeleton( buf );
      CH_IMCSEX( skeleton ) = (SexType)sex;
   }

   strncpy( msg, ( char * )imc_act_string( socbuf, ch, skeleton ), LGST );
   if( skeleton )
      imc_purge_skeleton( skeleton );
   return ( color_mtoi( msg ) );
}

static const char *imc_funcname( IMC_FUN * func )
{
   if( func == imc_other )
      return ( "imc_other" );
   if( func == imclisten )
      return ( "imclisten" );
   if( func == imcchanlist )
      return ( "imcchanlist" );
   if( func == imclist )
      return ( "imclist" );
   if( func == imcinvis )
      return ( "imcinvis" );
   if( func == imcwho )
      return ( "imcwho" );
   if( func == imclocate )
      return ( "imclocate" );
   if( func == imctell )
      return ( "imctell" );
   if( func == imcreply )
      return ( "imcreply" );
   if( func == imcbeep )
      return ( "imcbeep" );
   if( func == imcignore )
      return ( "imcignore" );
   if( func == imcfinger )
      return ( "imcfinger" );
   if( func == imcinfo )
      return ( "imcinfo" );
   if( func == imccolor )
      return ( "imccolor" );
   if( func == imcafk )
      return ( "imcafk" );
   if( func == imcchanwho )
      return ( "imcchanwho" );
   if( func == imcconnect )
      return ( "imcconnect" );
   if( func == imcdisconnect )
      return ( "imcdisconnect" );
   if( func == imcpermstats )
      return ( "imcpermstats" );
   if( func == imc_deny_channel )
      return ( "imc_deny_channel" );
   if( func == imcpermset )
      return ( "imcpermset" );
   if( func == imcsetup )
      return ( "imcsetup" );
   if( func == imccommand )
      return ( "imccommand" );
   if( func == imcban )
      return ( "imcban" );
   if( func == imcconfig )
      return ( "imcconfig" );
   if( func == imc_show_ucache_contents )
      return ( "imc_show_ucache_contents" );
   if( func == imcremoteadmin )
      return ( "imcremoteadmin" );
   if( func == imcdebug )
      return ( "imcdebug" );
   if( func == imchedit )
      return ( "imchedit" );
   if( func == imchelp )
      return ( "imchelp" );
   if( func == imccedit )
      return ( "imccedit" );
   if( func == imcrefresh )
      return ( "imcrefresh" );
   if( func == imclast )
      return ( "imclast" );
   if( func == imctemplates )
      return ( "imctemplates" );
   return "";
}

static IMC_FUN *imc_function( const char *func )
{
   if( !strcasecmp( func, "imc_other" ) )
      return imc_other;
   if( !strcasecmp( func, "imclisten" ) )
      return imclisten;
   if( !strcasecmp( func, "imcchanlist" ) )
      return imcchanlist;
   if( !strcasecmp( func, "imclist" ) )
      return imclist;
   if( !strcasecmp( func, "imcinvis" ) )
      return imcinvis;
   if( !strcasecmp( func, "imcwho" ) )
      return imcwho;
   if( !strcasecmp( func, "imclocate" ) )
      return imclocate;
   if( !strcasecmp( func, "imctell" ) )
      return imctell;
   if( !strcasecmp( func, "imcreply" ) )
      return imcreply;
   if( !strcasecmp( func, "imcbeep" ) )
      return imcbeep;
   if( !strcasecmp( func, "imcignore" ) )
      return imcignore;
   if( !strcasecmp( func, "imcfinger" ) )
      return imcfinger;
   if( !strcasecmp( func, "imcinfo" ) )
      return imcinfo;
   if( !strcasecmp( func, "imccolor" ) )
      return imccolor;
   if( !strcasecmp( func, "imcafk" ) )
      return imcafk;
   if( !strcasecmp( func, "imcchanwho" ) )
      return imcchanwho;
   if( !strcasecmp( func, "imcconnect" ) )
      return imcconnect;
   if( !strcasecmp( func, "imcdisconnect" ) )
      return imcdisconnect;
   if( !strcasecmp( func, "imcpermstats" ) )
      return imcpermstats;
   if( !strcasecmp( func, "imc_deny_channel" ) )
      return imc_deny_channel;
   if( !strcasecmp( func, "imcpermset" ) )
      return imcpermset;
   if( !strcasecmp( func, "imcsetup" ) )
      return imcsetup;
   if( !strcasecmp( func, "imccommand" ) )
      return imccommand;
   if( !strcasecmp( func, "imcban" ) )
      return imcban;
   if( !strcasecmp( func, "imcconfig" ) )
      return imcconfig;
   if( !strcasecmp( func, "imc_show_ucache_contents" ) )
      return imc_show_ucache_contents;
   if( !strcasecmp( func, "imcremoteadmin" ) )
      return imcremoteadmin;
   if( !strcasecmp( func, "imcdebug" ) )
      return imcdebug;
   if( !strcasecmp( func, "imchelp" ) )
      return imchelp;
   if( !strcasecmp( func, "imccedit" ) )
      return imccedit;
   if( !strcasecmp( func, "imchedit" ) )
      return imchedit;
   if( !strcasecmp( func, "imcrefresh" ) )
      return imcrefresh;
   if( !strcasecmp( func, "imclast" ) )
      return imclast;
   if( !strcasecmp( func, "imctemplates" ) )
      return imctemplates;

   return NULL;
}

/* Check for IMC channels, return true to stop command processing, false otherwise */
bool ImcCommandHook( Character * ch, const char *command, const char *argument )
{
   IMC_CMD_DATA *cmd;
   IMC_ALIAS *alias;
   IMC_CHANNEL *c;
   const char *p;

   if( IsNpc( ch ) )
      return false;

   if( !this_imcmud )
   {
      imcbug( "%s", "Ooops. IMC being called with no configuration!" );
      return false;
   }

   if( !first_imc_command )
   {
      imcbug( "%s", "ACK! There's no damn command data loaded!" );
      return false;
   }

   if( IMCPERM( ch ) <= IMCPERM_NONE )
      return false;

   /*
    * Simple command Interpreter menu. Nothing overly fancy etc, but it beats trying to tie directly into the mud's
    * * own internal structures. Especially with the differences in codebases.
    */
   for( cmd = first_imc_command; cmd; cmd = cmd->next )
   {
      if( IMCPERM( ch ) < cmd->level )
         continue;

      for( alias = cmd->first_alias; alias; alias = alias->next )
      {
         if( !strcasecmp( command, alias->Name ) )
         {
            command = cmd->Name;
            break;
         }
      }

      if( !strcasecmp( command, cmd->Name ) )
      {
         if( cmd->connected == true && this_imcmud->state < IMC_ONLINE )
         {
            imc_to_char( "The mud is not currently connected to IMC2.\r\n", ch );
            return true;
         }

         if( cmd->function == NULL )
         {
            imc_to_char( "That command.hppas no code set. Inform the administration.\r\n", ch );
            imcbug( "ImcCommandHook: Command %s has no code set!", cmd->Name );
            return true;
         }

         ( *cmd->function ) ( ch, argument );
         return true;
      }
   }

   /*
    * Assumed to be aiming for a channel if you get this far down 
    */
   c = imc_findchannel( command );

   if( !c || c->level > IMCPERM( ch ) )
      return false;

   if( imc_hasname( IMC_DENY( ch ), c->local_name ) )
   {
      imc_printf( ch, "You have been denied the use of %s by the administration.\r\n", c->local_name );
      return true;
   }

   if( !c->refreshed )
   {
      imc_printf( ch, "The %s channel has not yet been refreshed by the server.\r\n", c->local_name );
      return true;
   }

   if( IsNullOrEmpty( argument ) )
   {
      int y;

      imc_printf( ch, "~cThe last %d %s messages:\r\n", MAX_IMCHISTORY, c->local_name );
      for( y = 0; y < MAX_IMCHISTORY; y++ )
      {
         if( c->history[y] != NULL )
            imc_printf( ch, "%s\r\n", c->history[y] );
         else
            break;
      }
      return true;
   }

   if( IMCPERM( ch ) >= IMCPERM_ADMIN && !strcasecmp( argument, "log" ) )
   {
      if( !IsBitSet( c->flags, IMCCHAN_LOG ) )
      {
         SetBit( c->flags, IMCCHAN_LOG );
         imc_printf( ch, "~RFile logging enabled for %s, PLEASE don't forget to undo this when it isn't needed!\r\n",
                     c->local_name );
      }
      else
      {
         RemoveBit( c->flags, IMCCHAN_LOG );
         imc_printf( ch, "~GFile logging disabled for %s.\r\n", c->local_name );
      }
      imc_save_channels();
      return true;
   }

   if( !imc_hasname( IMC_LISTEN( ch ), c->local_name ) )
   {
      imc_printf( ch, "You are not currently listening to %s. Use the imclisten command to listen to this channel.\r\n",
                  c->local_name );
      return true;
   }

   switch ( argument[0] )
   {
      case ',':
         /*
          * Strip the , and then extra spaces - Remcon 6-28-03 
          */
         argument++;
         while( isspace( (int) *argument ) )
            argument++;
         imc_sendmessage( c, CH_IMCNAME( ch ), color_mtoi( argument ), 1 );
         break;
      case '@':
         /*
          * Strip the @ and then extra spaces - Remcon 6-28-03 
          */
         argument++;

	 while( isspace( (int) *argument ) )
            argument++;

	 p = imc_send_social( ch, argument, 0 );

         if( IsNullOrEmpty( p ) )
            return true;

	 imc_sendmessage( c, CH_IMCNAME( ch ), p, 2 );
         break;
      default:
         imc_sendmessage( c, CH_IMCNAME( ch ), color_mtoi( argument ), 0 );
         break;
   }
   return true;
}

socket_t ImcGetSocket( SiteInfo *site )
{
  return site ? site->Desc : INVALID_SOCKET;
}
