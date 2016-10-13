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

#ifdef __STRICT_ANSI__
/* To include the prototype for strdup() */
#define _DEFAULT_SOURCE
#endif

#include <string.h>
#include <ctype.h>
#include "character.h"
#include "mud.h"
#include "command.h"
#include "social.h"
#include "skill.h"

/*
 * Log-all switch.
 */
bool fLogAll = false;

static char *ParseTarget( const Character *ch, char *oldstring );
static char *GetMultiCommand( Descriptor *d, char *argument );

/*
 * Character not in position for command?
 */
bool CheckPosition( const Character *ch, int position )
{
  if ( ch->Position < position )
    {
      switch( ch->Position )
        {
        case POS_DEAD:
          SendToCharacter( "A little difficult to do when you are DEAD...\r\n", ch );
          break;

        case POS_MORTAL:
        case POS_INCAP:
          SendToCharacter( "You are hurt far too bad for that.\r\n", ch );
          break;

        case POS_STUNNED:
          SendToCharacter( "You are too stunned to do that.\r\n", ch );
          break;

        case POS_SLEEPING:
          SendToCharacter( "In your dreams, or what?\r\n", ch );
          break;

        case POS_RESTING:
          SendToCharacter( "Nah... You feel too relaxed...\r\n", ch);
          break;

        case POS_SITTING:
          SendToCharacter( "You can't do that sitting down.\r\n", ch);
          break;

        case POS_FIGHTING:
          SendToCharacter( "No way! You are still fighting!\r\n", ch);
          break;

        }

      return false;
    }

  return true;
}

extern char lastplayercmd[MAX_INPUT_LENGTH*2];

/*
 * The main entry point for executing commands.
 * Can be recursively called from 'at', 'order', 'force'.
 */

char multicommand[MAX_INPUT_LENGTH];

static char *ParseTarget( const Character *ch, char *oldstring )
{
  const char *str = oldstring;
  int count = 0;
  char buf[MAX_INPUT_LENGTH] = {'\0'};
  char *point = buf;

  while( !IsNullOrEmpty( str ) )
    {
      if( *str != '$' )
        {
          count++;
          *point++ = *str++;
          continue;
        }

      ++str;

      if ( *str == '$' && !IsNullOrEmpty( ch->PCData->target ) )
        {
          char *i = CopyString(ch->PCData->target);
          ++str;

          while ( ( *point = *i ) != '\0' )
            {
              ++point, ++i, ++count;

              if (count > MAX_INPUT_LENGTH)
                {
                  Echo( ch, "Target substitution too long; not processed.\r\n" );
		  FreeMemory( i );
                  return oldstring;
                }
            }

	  FreeMemory( i );
        }
      else
        {
          *point++ = '$';
          count++;
        }
    }

  buf[count] = '\0';
  strcpy( oldstring, buf );

  return oldstring;
}

static char *GetMultiCommand( Descriptor *d, char *argument )
{
  int counter = 0;
  int counter2 = 0;
  char leftover[MAX_INPUT_LENGTH];

  multicommand[0] = '\0';

  for ( counter = 0; argument[counter] != '\0'; counter++ )
    {
      if ( argument[counter] == '|' && argument[counter+1] != '|' )
        {
          multicommand[counter] = '\0';
          counter++;

          for (counter2 = 0; argument[counter] != '\0'; counter2++,counter++)
	    {
	      leftover[counter2] = argument[counter];
	    }

          leftover[counter2] = '\0';
          strcpy( d->InComm, leftover );
          return (multicommand);
        }
      else if (argument[counter] == '|' && argument[counter+1] == '|')
	{
	  for (counter2 = counter; argument[counter2] != '\0'; counter2++)
	    {
	      argument[counter2] = argument[counter2 + 1];
	    }
	}

      multicommand[counter] = argument[counter];
    }

  d->InComm[0] = '\0';
  multicommand[counter] = '\0';

  return multicommand;
}

void Interpret( Character *ch, char *argument )
{
  char command[MAX_INPUT_LENGTH];
  char logline[MAX_INPUT_LENGTH];
  char logname[MAX_INPUT_LENGTH];
  Timer *timer = NULL;
  Command *cmd = NULL;
  int trust = 0;
  int loglvl = 0;
  bool found = false;
  struct timeval time_used;
  long tmptime = 0;

  if ( !ch )
    {
      Bug( "Interpret: null ch!", 0 );
      return;
    }

  if ( ch->SubState == SUB_REPEATCMD )
    {
      CmdFun *fun = ch->LastCommand;

      if ( fun == NULL )
        {
          ch->SubState = SUB_NONE;
          Bug( "Interpret: SUB_REPEATCMD with NULL last_cmd" );
          return;
        }
      else
        {
          int x = 0;

          /*
           * yes... we lose out on the hashing speediness here...
           * but the only REPEATCMDS are wizcommands (currently)
           */
          for ( x = 0; x < 126; x++ )
            {
              for ( cmd = CommandTable[x]; cmd; cmd = cmd->next )
		{
		  if ( cmd->Function == fun )
		    {
		      found = true;
		      break;
		    }
		}

              if ( found )
		{
		  break;
		}
            }

          if ( !found )
            {
              Bug( "Interpret: SUB_REPEATCMD: last_cmd invalid" );
              return;
            }

          sprintf( logline, "(%s) %s", cmd->Name, argument );
        }
    }

  if ( !cmd )
    {
      /* Changed the order of these ifchecks to prevent crashing. */
      if ( !argument || !StrCmp(argument,"") )
        {
          Bug( "Interpret: null argument!", 0 );
          return;
        }

      /*
       * Strip leading spaces.
       */
      while ( isspace(*argument) )
	{
	  argument++;
	}

      if ( IsNullOrEmpty( argument ) )
	{
	  return;
	}

      timer = GetTimerPointer( ch, TIMER_CMD_FUN );

      /*
       * Implement freeze command.
       */
      if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_FREEZE) )
        {
          SendToCharacter( "You're totally frozen!\r\n", ch );
          return;
        }

      /*
       * Grab the command word.
       * Special parsing so ' can be a command,
       *   also no spaces needed after punctuation.
       */
      strcpy( logline, argument );

      if( ch->Desc && (index(argument, '|')))
	{
	  argument = GetMultiCommand( ch->Desc, argument );
	}


      if ( !IsNpc(ch) && ch->PCData && ch->PCData->target )
	{
	  if ( !IsNullOrEmpty( ch->PCData->target ) )
	    {
	      if( index(argument, '$'))
		{
		  argument = ParseTarget(ch, argument);
		}
	    }
	}

      if ( !isalpha(argument[0]) && !isdigit(argument[0]) )
        {
          command[0] = argument[0];
          command[1] = '\0';
          argument++;

          while ( isspace(*argument) )
	    {
	      argument++;
	    }
        }
      else
	{
	  argument = OneArgument( argument, command );
	}

      /*
       * Look for command in command table.
       * Check for council powers and/or bestowments
       */

      trust = GetTrustLevel( ch );

      for ( cmd = CommandTable[CharToLowercase(command[0])%126]; cmd; cmd = cmd->next )
        if ( !StringPrefix( command, cmd->Name )
             && (cmd->Level <= trust
		 ||(!IsNpc(ch) && !IsNullOrEmpty( ch->PCData->bestowments )
		    && IsName( cmd->Name, ch->PCData->bestowments )
		    && cmd->Level <= (trust + 5) ) ) )
          {
            found = true;
            break;
          }

      /*
       * Turn off afk bit when any command performed.
       */
      if ( IsBitSet ( ch->Flags, PLR_AFK)  && (StrCmp(command, "AFK")))
        {
          RemoveBit( ch->Flags, PLR_AFK );
          Act( AT_GREY, "$n is no longer afk.", ch, NULL, NULL, TO_ROOM );
        }
    }

  /*
   * Log and snoop.
   */
  sprintf( lastplayercmd, "** %s: %s", ch->Name, logline );

  if ( found && cmd->Log == LOG_NEVER )
    {
      strcpy( logline, "XXXXXXXX XXXXXXXX XXXXXXXX" );
    }

  loglvl = found ? cmd->Log : LOG_NORMAL;

  if ( ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_LOG) )
       || fLogAll
       || loglvl == LOG_BUILD
       || loglvl == LOG_HIGH
       || loglvl == LOG_ALWAYS )
    {
      /* Added by Narn to show who is switched into a mob that executes
         a logged command.  Check for descriptor in case force is used. */
      if ( ch->Desc && ch->Desc->Original )
	{
	  sprintf( log_buf, "Log %s (%s): %s", ch->Name,
		   ch->Desc->Original->Name, logline );
	}
      else
	{
	  sprintf( log_buf, "Log %s: %s", ch->Name, logline );
	}

      /*
       * Make it so a 'log all' will send most output to the log
       * file only, and not spam the log channel to death       -Thoric
       */
      if ( fLogAll && loglvl == LOG_NORMAL
           && (IsNpc(ch) || !IsBitSet(ch->Flags, PLR_LOG)) )
	{
	  loglvl = LOG_ALL;
	}

      LogStringPlus( log_buf, loglvl, ch->TopLevel );
    }

  if ( ch->Desc && ch->Desc->SnoopBy )
    {
      sprintf( logname, "%s", ch->Name);
      WriteToBuffer( ch->Desc->SnoopBy, logname, 0 );
      WriteToBuffer( ch->Desc->SnoopBy, "% ",    2 );
      WriteToBuffer( ch->Desc->SnoopBy, logline, 0 );
      WriteToBuffer( ch->Desc->SnoopBy, "\r\n",  2 );
    }

  if ( timer )
    {
      int tempsub = ch->SubState;

      ch->SubState = SUB_TIMER_DO_ABORT;
      timer->do_fun(ch,"");

      if ( CharacterDiedRecently(ch) )
	{
	  return;
	}

      if ( ch->SubState != SUB_TIMER_CANT_ABORT )
        {
          ch->SubState = tempsub;
          ExtractTimer( ch, timer );
        }
      else
        {
          ch->SubState = tempsub;
          return;
        }
    }

  /*
   * Look for command in skill and socials table.
   */
  if ( !found )
    {
      if ( !CheckSkill( ch, command, argument )
           && !CheckAlias( ch, command, argument )
           && !CheckSocial( ch, command, argument )
#ifdef SWRIP_USE_IMC
	   && !ImcCommandHook( ch, command, argument )
#endif
	   )
        {
          Exit *pexit = NULL;

          /* check for an auto-matic exit command */
          if ( ( pexit = FindDoor( ch, command, true ) ) != NULL
               && IsBitSet( pexit->Flags, EX_xAUTO ) )
            {
              if ( IsBitSet( pexit->Flags, EX_CLOSED )
                   && ( !IsAffectedBy( ch, AFF_PASS_DOOR )
                       || IsBitSet( pexit->Flags, EX_NOPASSDOOR ) ) )
                {
                  if ( !IsBitSet( pexit->Flags, EX_SECRET ) )
		    {
		      Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
		    }
                  else
		    {
		      SendToCharacter( "You cannot do that here.\r\n", ch );
		    }

                  return;
                }

              MoveCharacter( ch, pexit, 0 );
              return;
            }

          SendToCharacter( "Huh?\r\n", ch );
        }

      return;
    }

  /*
   * Character not in position for command?
   */
  if ( !CheckPosition( ch, cmd->Position ) )
    {
      return;
    }

  /* Berserk check for flee.. maybe add drunk to this?.. but too much
     hardcoding is annoying.. -- Altrag */
  if ( !StrCmp(cmd->Name, "flee")
       && IsAffectedBy(ch, AFF_BERSERK) )
    {
      SendToCharacter( "You aren't thinking very clearly...\r\n", ch);
      return;
    }

  /*
   * Dispatch the command.
   */
  ch->PreviousCommand = ch->LastCommand;    /* haus, for automapping */
  ch->LastCommand = cmd->Function;
  StartTimer(&time_used);
  cmd->Function( ch, argument );
  StopTimer(&time_used);

  /*
   * Update the record of how many times this command has been used (haus)
   */
  UpdateNumberOfTimesUsed(&time_used, cmd->UseRec);
  tmptime = umin(time_used.tv_sec,19) * 1000000 + time_used.tv_usec;

  /* laggy command notice: command took longer than 1.5 seconds */
  if ( tmptime > 1500000 )
    {
      sprintf(log_buf, "[*****] LAG: %s: %s %s (R:%ld S:%d.%06d)",
	      ch->Name,
              cmd->Name,
	      (cmd->Log == LOG_NEVER ? "XXX" : argument),
              ch->InRoom ? ch->InRoom->Vnum : 0,
              (int) (time_used.tv_sec),
	      (int) (time_used.tv_usec) );
      LogStringPlus(log_buf, LOG_NORMAL, GetTrustLevel(ch));
    }
}

void SendTimer(struct timerset *vtime, Character *ch)
{
  struct timeval ntime;
  int carry = 0;

  if ( vtime->num_uses == 0 )
    {
      return;
    }

  ntime.tv_sec  = vtime->total_time.tv_sec / vtime->num_uses;
  carry = (vtime->total_time.tv_sec % vtime->num_uses) * 1000000;
  ntime.tv_usec = (vtime->total_time.tv_usec + carry) / vtime->num_uses;
  Echo(ch, "Has been used %d times this boot.\r\n", vtime->num_uses);
  Echo(ch, "Time (in secs): min %d.%0.6d; avg: %d.%0.6d; max %d.%0.6d"
            "\r\n", vtime->min_time.tv_sec, vtime->min_time.tv_usec, ntime.tv_sec,
            ntime.tv_usec, vtime->max_time.tv_sec, vtime->max_time.tv_usec);
}

void UpdateNumberOfTimesUsed(struct timeval *time_used, struct timerset *userec)
{
  userec->num_uses++;

  if ( !timerisset(&userec->min_time)
       || timercmp(time_used, &userec->min_time, <) )
    {
      userec->min_time.tv_sec  = time_used->tv_sec;
      userec->min_time.tv_usec = time_used->tv_usec;
    }

  if ( !timerisset(&userec->max_time)
       || timercmp(time_used, &userec->max_time, >) )
    {
      userec->max_time.tv_sec  = time_used->tv_sec;
      userec->max_time.tv_usec = time_used->tv_usec;
    }

  userec->total_time.tv_sec  += time_used->tv_sec;
  userec->total_time.tv_usec += time_used->tv_usec;

  while ( userec->total_time.tv_usec >= 1000000 )
    {
      userec->total_time.tv_sec++;
      userec->total_time.tv_usec -= 1000000;
    }
}
