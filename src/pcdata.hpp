#ifndef _SWRIP_PCDATA_HPP_
#define _SWRIP_PCDATA_HPP_

#include <memory>
#include <array>
#include <list>
#include <bitset>
#include "types.hpp"
#include "constants.hpp"
#include "imc.hpp"

class Alias;
class Editor;
class KilledData;

namespace Flag::PCData {
enum : size_t
{
    _00,
    _01,
    Unauthed,
    _03,
    _04,
    Gag,
    Retired,
    _07,
    _08,
    _09,
    NoTitle,
    ShowRoomFlags,
    DoNotDisturb,
};
}

class PCData
{
public:
    PCData();
    virtual ~PCData();

    const std::list<std::shared_ptr<Alias>> &Aliases() const;
    void Add(std::shared_ptr<Alias> alias);
    void Remove(std::shared_ptr<Alias> alias);

    const std::list<std::shared_ptr<class Note>> &Comments() const;
    void Add(std::shared_ptr<class Note> comment);
    void Remove(std::shared_ptr<class Note> comment);

    std::string Password;

    struct
    {
        std::shared_ptr<class Clan> Clan;
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

    std::string Bestowments;      /* Special bestowed commands          */
    std::bitset<Flag::MAX> Flags; /* Whether the player is deadly and whatever else we add */

    int PKills = 0;               /* Number of pkills on behalf of clan */
    int PDeaths = 0;              /* Number of times pkilled (legally)  */
    int MKills = 0;               /* Number of mobs killed              */
    int MDeaths = 0;              /* Number of deaths due to mobs       */
    int IllegalPk = 0;            /* Number of illegal pk's committed   */

    long RestoreTime = 0;         /* The last time the char did a restore all */

    std::shared_ptr<Editor> TextEditor;

    struct
    {
        std::shared_ptr<class Area> Area;
        std::shared_ptr<class Plugin> Plugin;

        struct
        {
            struct
            {
                vnum_t First = INVALID_VNUM;
                vnum_t Last = INVALID_VNUM;
            } Room, Mob, Object;
        } VnumRanges;
    } Build;

    int WizInvis = 0;       /* wizinvis level */
    int MinSnoop = 0;      /* minimum snoop level */
    std::array<int, MAX_CONDS> Condition;
    std::array<int, MAX_SKILL> Learned;
    std::list<KilledData> Killed;
    AuthType AuthState = AuthType::None;
    time_t ReleaseDate = 0;   /* Auto-helling.. Altrag */
    vnum_t JailVnum = INVALID_VNUM;
    std::string HelledBy;
    std::string Bio;            /* Personal Bio */
    std::string AuthedBy;      /* what crazy imm authed this name ;) */
    std::string Prompt;         /* User config prompts */
    std::string SubPrompt;      /* Substate prompt */
    bool OpenedTourney = false;

    std::array<int, 10> Addiction;
    std::array<int, 10> DrugLevel;
    std::bitset<Flag::MAX> WantedOn;
    long Bank = 0;
    bool WhoCloak = false;

    std::string BettedOn;
    int BetAmount = 0;

    std::shared_ptr<Character> Pet;
    std::string AliasFocus;
    std::shared_ptr<class Note> Note;
    int Clones = 0;
    int Played = 0;
    time_t Logon = 0;
    time_t SaveTime = 0;
    std::shared_ptr<class CraftingSession> CraftingSession;
    IMC_CHARDATA *imcchardata = NULL;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

extern const std::array<const char *const, Flag::MAX> PcFlags;

#endif
