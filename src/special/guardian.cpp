#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

bool spec_guardian( std::shared_ptr<Character> ch )
{
  char buf[MAX_STRING_LENGTH];
  const char *crime = "disturber of the peace";
  int max_evil = 300;
  Character *victim = nullptr;
  
  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  for(Character *ech : ch->InRoom->Characters())
    {
      if ( ech->Fighting
           && GetFightingOpponent( ech ) != ch
           && ech->Alignment < max_evil )
        {
          max_evil = ech->Alignment;
          victim = ech;
          break;
        }
    }

  if ( victim )
    {
      if( ch->InRoom->Flags.test( Flag::Room::Safe ) )
        {
          sprintf( buf, "%s is a %s! As well as a COWARD!",
                   victim->Name.c_str(), crime );
          do_yell( ch, buf );
          return true;
        }
      else
        {
          sprintf( buf, "%s is a %s! PROTECT THE INNOCENT!!",
                   victim->Name.c_str(), crime );
          do_shout( ch, buf );
          HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
          return true;
        }
    }
  
  return false;
}
