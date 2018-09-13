#include <cctype>
#include "social.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "script.hpp"
#include "log.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "repos/socialrepository.hpp"

void FreeSocial( Social *social )
{
  delete social;
}

bool CheckSocial( Character *ch, const std::string &command, const std::string &argument )
{
  std::string arg;
  Character *victim = NULL;
  Social *social = Socials->FindByName(command);

  if (social == nullptr)
    {
      return false;
    }

  if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      ch->Echo( "You are anti-social!\r\n" );
      return true;
    }

  switch ( ch->Position )
    {
    case POS_DEAD:
      ch->Echo( "Lie still; you are DEAD.\r\n" );
      return true;

    case POS_INCAP:
    case POS_MORTAL:
      ch->Echo( "You are hurt far too bad for that.\r\n" );
      return true;

    case POS_STUNNED:
      ch->Echo( "You are too stunned to do that.\r\n" );
      return true;

    case POS_SLEEPING:
      /*
       * I just know this is the path to a 12" 'if' statement.  :(
       * But two players asked for it already!  -- Furey
       */
      if ( !StrCmp( social->Name, "snore" ) )
        {
          break;
        }

      ch->Echo( "In your dreams, or what?\r\n" );
      return true;

    default:
      break;
    }

  OneArgument( argument, arg );

  if ( arg.empty() )
    {
      Act( AT_SOCIAL, social->OthersNoArg, ch, NULL, victim, TO_ROOM    );
      Act( AT_SOCIAL, social->CharNoArg,   ch, NULL, victim, TO_CHAR    );
    }
  else if ( !( victim = GetCharacterInRoom( ch, arg ) ) )
    {
      ch->Echo( "They aren't here.\r\n" );
    }
  else if ( victim == ch )
    {
      Act( AT_SOCIAL, social->OthersAuto,   ch, NULL, victim, TO_ROOM    );
      Act( AT_SOCIAL, social->CharAuto,     ch, NULL, victim, TO_CHAR    );
    }
  else
    {
      Act( AT_SOCIAL, social->OthersFound,  ch, NULL, victim, TO_NOTVICT );
      Act( AT_SOCIAL, social->CharFound,    ch, NULL, victim, TO_CHAR    );
      Act( AT_SOCIAL, social->VictimFound,    ch, NULL, victim, TO_VICT    );

      if ( !IsNpc(ch) && IsNpc(victim)
           && !IsAffectedBy(victim, AFF_CHARM)
           && IsAwake(victim)
           && !IsBitSet( victim->Prototype->mprog.progtypes, ACT_PROG ) )
        {
          switch ( NumberBits( 4 ) )
            {
            case 0:
              if ( !IsBitSet(ch->InRoom->Flags, ROOM_SAFE )
                   && IsEvil(ch) )
                {
                  if ( !StrCmp( social->Name, "slap" ) || !StrCmp( social->Name, "punch" ) )
                    {
                      HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
                    }
                }
              else if ( IsNeutral(ch) )
                {
                  Act( AT_ACTION, "$n slaps $N.", victim, NULL, ch, TO_NOTVICT );
                  Act( AT_ACTION, "You slap $N.", victim, NULL, ch, TO_CHAR );
                  Act( AT_ACTION, "$n slaps you.", victim, NULL, ch, TO_VICT );
                }
              else
                {
                  Act( AT_ACTION, "$n acts like $N doesn't even exist.", victim, NULL, ch, TO_NOTVICT );
                  Act( AT_ACTION, "You just ignore $N.",  victim, NULL, ch, TO_CHAR    );
                  Act( AT_ACTION, "$n appears to be ignoring you.", victim, NULL, ch, TO_VICT    );
                }
              break;

            case 1:
            case 2:
	    case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
              Act( AT_SOCIAL, social->OthersFound, victim, NULL, ch, TO_NOTVICT );
              Act( AT_SOCIAL, social->CharFound, victim, NULL, ch, TO_CHAR );
              Act( AT_SOCIAL, social->VictimFound, victim, NULL, ch, TO_VICT );
              break;

            case 9:
            case 10:
            case 11:
            case 12:
              Act( AT_ACTION, "$n slaps $N.", victim, NULL, ch, TO_NOTVICT );
              Act( AT_ACTION, "You slap $N.", victim, NULL, ch, TO_CHAR );
              Act( AT_ACTION, "$n slaps you.", victim, NULL, ch, TO_VICT );
              break;
            }
        }
    }

  return true;
}
