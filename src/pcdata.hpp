#ifndef _SWRIP_PCDATA_HPP_
#define _SWRIP_PCDATA_HPP_

#include <array>
#include <list>
#include "types.hpp"
#include "constants.hpp"
#include "imc.hpp"

class PCData
{
public:
  PCData();
  virtual ~PCData();

  const std::list<Alias*> &Aliases() const;
  void Add(Alias *alias);
  void Remove(Alias *alias);

  const std::list<class Note*> &Comments() const;
  void Add(class Note *comment);
  void Remove(class Note *comment);
  
  std::string Password;

  struct
  {
    class Clan *Clan = NULL;
    std::string ClanName;
    int Salary = 0;
    long SalaryDate = 0;
  } ClanInfo;

  std::string HomePage;
  std::string Email;

  std::string BamfIn;
  std::string BamfOut;

  std::string Rank;
  std::string Title;

  std::string Bestowments;    /* Special bestowed commands       */
  int Flags = 0;            /* Whether the player is deadly and whatever else we add.      */

  int PKills = 0;         /* Number of pkills on behalf of clan */
  int PDeaths = 0;        /* Number of times pkilled (legally)  */
  int MKills = 0;         /* Number of mobs killed                   */
  int MDeaths = 0;        /* Number of deaths due to mobs       */
  int IllegalPk = 0;     /* Number of illegal pk's committed   */

  long OutcastTime = 0;     /* The time at which the char was outcast */
  long RestoreTime = 0;     /* The last time the char did a restore all */

  struct
  {
    class Area *Area = NULL;

    struct
    {
      struct
      {
        vnum_t First = INVALID_VNUM;
        vnum_t Last = INVALID_VNUM;
      } Room, Mob, Object;
    } VnumRanges;
  } Build;

  short WizInvis = 0;       /* wizinvis level */
  short MinSnoop = 0;      /* minimum snoop level */
  std::array<int, MAX_CONDS> Condition;
  std::array<short, MAX_SKILL> Learned;
  std::list<KilledData> Killed;
  int AuthState = 0;
  time_t ReleaseDate = 0;   /* Auto-helling.. Altrag */
  vnum_t JailVnum = INVALID_VNUM;
  std::string HelledBy;
  std::string Bio;            /* Personal Bio */
  std::string AuthedBy;      /* what crazy imm authed this name ;) */
  std::string Prompt;         /* User config prompts */
  std::string SubPrompt;      /* Substate prompt */
  bool OpenedTourney = false;

  std::array<short, 10> Addiction;
  std::array<short, 10> DrugLevel;
  int WantedFlags = 0;
  long Bank = 0;
  bool WhoCloak = false;

  std::string BettedOn;
  int BetAmount = 0;

  Character *Pet = NULL;
  std::string Target;
  class Note *Note = nullptr;
  short Clones = 0;
  int Played = 0;
  time_t Logon = 0;
  time_t SaveTime = 0;
  struct CraftingSession *CraftingSession = NULL;
  IMC_CHARDATA *imcchardata = NULL;

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

#endif
