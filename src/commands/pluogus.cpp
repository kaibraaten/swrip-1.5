#include <cassert>
#include "character.hpp"
#include "mud.hpp"
#include "shuttle.hpp"
#include "repos/shuttlerepository.hpp"

static constexpr int MAX_STOPS_TO_DISPLAY = 4;

static void OutputShuttle(const std::shared_ptr<Character> ch, std::shared_ptr<Shuttle> shuttle);

void do_pluogus( std::shared_ptr<Character> ch, std::string argument )
{
  if ( !HasComlink( ch ) )
    {
      ch->Echo("You need a comlink to do that!\r\n");
      return;
    }

  std::shared_ptr<Shuttle> shuttle = Shuttles->FindByName("Serin Pluogus");

  if (shuttle != nullptr)
    {
      OutputShuttle(ch, shuttle);
      ch->Echo("\r\n");
    }

  shuttle = Shuttles->FindByName("Serin Tocca");

  if (shuttle != nullptr)
    {
      OutputShuttle(ch, shuttle);
      ch->Echo("\r\n");
    }
}

static void OutputShuttle(const std::shared_ptr<Character> ch, std::shared_ptr<Shuttle> shuttle)
{
  assert(shuttle != nullptr);
  
  if(shuttle->Stops().empty())
    return;
  
  if (shuttle->CurrentStop() == nullptr)
    return;

  SetCharacterColor(AT_SHIP, ch);
  ch->Echo("%s Schedule Information:\r\n", shuttle->Name.c_str() );

  std::shared_ptr<ShuttleStop> stop = shuttle->CurrentStop();

  /* current port */
  if ( shuttle->State == SHUTTLE_STATE_LANDING || shuttle->State == SHUTTLE_STATE_LANDED )
    {
      ch->Echo("Currently docked at %s.\r\n",
               shuttle->CurrentStop()->Name.c_str() );
    }

  ch->Echo("Next stops: ");

  int stopsDisplayed = 0;

  auto pos = std::cbegin(shuttle->Stops()) + shuttle->CurrentNumber;
  
  while(true)
    {
      stopsDisplayed++;
      pos++;

      if(pos == std::cend(shuttle->Stops()))
        {
          pos = std::cbegin(shuttle->Stops());
        }

      stop = *pos;
      
      if (stopsDisplayed > MAX_STOPS_TO_DISPLAY)
        {
          break;
        }
      
      if ( !stop->Name.empty() )
        {
          ch->Echo("%s  ", stop->Name.c_str() );
        }
      else
        {
          ch->Echo("(unnamed)  ");
        }
    }

  ch->Echo("\r\n");
}
