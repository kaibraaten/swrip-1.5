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

#include <cstring>
#include <strings.h>
#include <cctype>
#include <cassert>
#include "character.hpp"
#include "mud.hpp"
#include "command.hpp"
#include "social.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

/*
 * Log-all switch.
 */
bool fLogAll = false;

static char *ParseTarget( const Character *ch, char *oldstring );
static char *GetMultiCommand( Descriptor *d, char *argument );

/*
 * Character not in position for command?
 */
bool CheckPosition( const Character *ch, PositionType position )
{
  if ( ch->Position < position )
    {
      switch( ch->Position )
        {
        case POS_DEAD:
          ch->Echo( "A little difficult to do when you are DEAD...\r\n" );
          break;

        case POS_MORTAL:
        case POS_INCAP:
          ch->Echo( "You are hurt far too bad for that.\r\n" );
          break;

        case POS_STUNNED:
          ch->Echo( "You are too stunned to do that.\r\n" );
          break;

        case POS_SLEEPING:
          ch->Echo( "In your dreams, or what?\r\n" );
          break;

        case POS_RESTING:
          ch->Echo( "Nah... You feel too relaxed...\r\n" );
          break;

        case POS_SITTING:
          ch->Echo( "You can't do that sitting down.\r\n" );
          break;

        case POS_FIGHTING:
          ch->Echo( "No way! You are still fighting!\r\n" );
          break;

	default:
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

      if ( *str == '$' && !IsNullOrEmpty( ch->PCData->Target ) )
        {
          char *i = CopyString(ch->PCData->Target);
          ++str;

          while ( ( *point = *i ) != '\0' )
            {
              ++point, ++i, ++count;

              if (count > MAX_INPUT_LENGTH)
                {
                  ch->Echo( "Target substitution too long; not processed.\r\n" );
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

static bool _CommandFunctionEquals(const Command *command, const CmdFun *function)
{
  return command->Function == function;
}

struct CommandFindData
{
  Character *ch;
  const char *command;
};

static bool _CheckTrustAndBestowments(const Command *cmd, const struct CommandFindData *data)
{
  const char *command = data->command;
  const Character *ch = data->ch;
  int trust = GetTrustLevel(ch);

  if ( !StringPrefix( command, cmd->Name )
       && (cmd->Level <= trust
           ||(!IsNpc(ch) && !IsNullOrEmpty( ch->PCData->Bestowments )
              && IsName( cmd->Name, ch->PCData->Bestowments )
              && cmd->Level <= (trust + 5) ) ) )
    {
      return true;
    }
  else
    {
      return false;
    }
}

void Interpret( Character *ch, char *argument )
{
  assert(ch != nullptr);

  char command[MAX_INPUT_LENGTH];
  char logline[MAX_INPUT_LENGTH];
  char logname[MAX_INPUT_LENGTH];
  Timer *timer = NULL;
  Command *cmd = NULL;
  int loglvl = 0;
  bool found = false;
  struct timeval time_used;
  long tmptime = 0;

  if ( ch->SubState == SUB_REPEATCMD )
    {
      CmdFun *fun = ch->LastCommand;

      assert(fun != nullptr);

      const List *commands = GetEntities(CommandRepository);
      cmd = (Command*) FindIfInList(commands, (Predicate*) _CommandFunctionEquals, (const void*)fun);
      found = cmd != NULL;

      if ( !found )
        {
          Log->Bug( "Interpret: SUB_REPEATCMD: last_cmd invalid" );
          return;
        }

      sprintf( logline, "(%s) %s", cmd->Name, argument );
    }

  if ( !cmd )
    {
      /* Changed the order of these ifchecks to prevent crashing. */
      if (IsNullOrEmpty(argument))
        {
          Log->Bug( "Interpret: null argument!", 0 );
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
          ch->Echo( "You're totally frozen!\r\n" );
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


      if ( !IsNpc(ch) && ch->PCData && ch->PCData->Target )
	{
	  if ( !IsNullOrEmpty( ch->PCData->Target ) )
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
      {
        struct CommandFindData findData;
        const List *commands = GetEntities(CommandRepository);
	findData.ch = ch;
	findData.command = command;
        cmd = (Command*) FindIfInList(commands, (Predicate*) _CheckTrustAndBestowments, &findData);

        if(cmd != NULL)
          {
            found = true;
          }
        else
          {
            found = false;
          }
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

      Log->LogStringPlus( log_buf, loglvl, ch->TopLevel );
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
      CharacterSubState tempsub = ch->SubState;

      ch->SubState = SUB_TIMER_DO_ABORT;
      timer->DoFun(ch,"");

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
	   && !ImcCommandHook( ch, command, argument ))
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
		      Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->Keyword, TO_CHAR );
		    }
                  else
		    {
		      ch->Echo( "You cannot do that here.\r\n" );
		    }

                  return;
                }

              MoveCharacter( ch, pexit, 0 );
              return;
            }

          ch->Echo( "Huh?\r\n" );
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
      ch->Echo( "You aren't thinking very clearly...\r\n" );
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
      Log->LogStringPlus(log_buf, LOG_NORMAL, GetTrustLevel(ch));
    }
}

void SendTimer(struct timerset *vtime, Character *ch)
{
  struct timeval ntime;
  int carry = 0;

  if ( vtime->NumberOfTimesUsed == 0 )
    {
      return;
    }

  ntime.tv_sec  = vtime->TotalTime.tv_sec / vtime->NumberOfTimesUsed;
  carry = (vtime->TotalTime.tv_sec % vtime->NumberOfTimesUsed) * 1000000;
  ntime.tv_usec = (vtime->TotalTime.tv_usec + carry) / vtime->NumberOfTimesUsed;
  ch->Echo("Has been used %d times this boot.\r\n", vtime->NumberOfTimesUsed);
  ch->Echo("Time (in secs): min %d.%0.6d; avg: %d.%0.6d; max %d.%0.6d\r\n",
           vtime->MinTime.tv_sec, vtime->MinTime.tv_usec, ntime.tv_sec,
           ntime.tv_usec, vtime->MaxTime.tv_sec, vtime->MaxTime.tv_usec);
}

void UpdateNumberOfTimesUsed(struct timeval *time_used, struct timerset *userec)
{
  userec->NumberOfTimesUsed++;

  if ( !timerisset(&userec->MinTime)
       || timercmp(time_used, &userec->MinTime, <) )
    {
      userec->MinTime.tv_sec  = time_used->tv_sec;
      userec->MinTime.tv_usec = time_used->tv_usec;
    }

  if ( !timerisset(&userec->MaxTime)
       || timercmp(time_used, &userec->MaxTime, >) )
    {
      userec->MaxTime.tv_sec  = time_used->tv_sec;
      userec->MaxTime.tv_usec = time_used->tv_usec;
    }

  userec->TotalTime.tv_sec  += time_used->tv_sec;
  userec->TotalTime.tv_usec += time_used->tv_usec;

  while ( userec->TotalTime.tv_usec >= 1000000 )
    {
      userec->TotalTime.tv_sec++;
      userec->TotalTime.tv_usec -= 1000000;
    }
}
