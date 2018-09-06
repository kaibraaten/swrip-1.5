#include <cassert>
#include "character.hpp"
#include "mud.hpp"
#include "shuttle.hpp"

static constexpr int MAX_STOPS_TO_DISPLAY = 4;

static void OutputShuttle(const Character *ch, const Shuttle *shuttle);

void do_pluogus( Character *ch, std::string argument )
{
  if ( !HasComlink( ch ) )
    {
      ch->Echo("You need a comlink to do that!\r\n");
      return;
    }

  const Shuttle *shuttle = Shuttles->FindByName("Serin Pluogus");

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

static void OutputShuttle(const Character *ch, const Shuttle *shuttle)
{
  assert(shuttle != nullptr);
  
  if(shuttle->Stops().empty())
    return;
  
  if (shuttle->CurrentStop() == nullptr)
    return;

  SetCharacterColor(AT_SHIP, ch);
  ch->Echo("%s Schedule Information:\r\n", shuttle->Name.c_str() );

  const ShuttleStop *stop = shuttle->CurrentStop();

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
