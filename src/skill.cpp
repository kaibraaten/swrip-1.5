#include <cstring>
#ifndef _WIN32
#include <strings.h>
#endif
#include <cctype>
#include <utility/random.hpp>
#include "constants.hpp"
#include "skill.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "luascript.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "repos/skillrepository.hpp"
#include "act.hpp"
#include "systemdata.hpp"

extern std::string spell_target_name;       /* from magic.c */

static int CompareSkills(std::shared_ptr<Skill> *sk1, std::shared_ptr<Skill> *sk2);
static void PushSkillTable(lua_State *L);
static void PushSkill(lua_State *L, std::shared_ptr<Skill> skill);
static void PushSkillTeachers(lua_State *L, std::shared_ptr<Skill> skill);
static int L_SkillEntry(lua_State *L);
static std::shared_ptr<Skill> LoadSkillOrHerb(lua_State *L);
static void PushHerbTable(lua_State *L);

Skill::Skill()
    : UseRec(std::make_shared<timerset>())
{

}

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
bool CheckSkill(std::shared_ptr<Character> ch, const std::string &command, const std::string &argument)
{
    int sn = 0;
    int first = gsn_first_skill;
    int top = gsn_first_weapon - 1;
    struct timeval time_used;
    int mana = 0;
    std::shared_ptr<Skill> skill;

    /* bsearch for the skill */
    for(;;)
    {
        sn = (first + top) >> 1;
        skill = SkillTable[sn];
        const auto spellfunptr = skill->SpellFunction.target<ch_ret(*)(int, int, std::shared_ptr<Character>, const Vo&)>();
        
        if(CharToLowercase(command[0]) == CharToLowercase(skill->Name[0])
           && !StringPrefix(command, skill->Name)
           && (skill->SkillFunction != nullptr
               || (spellfunptr != nullptr && *spellfunptr != spell_null))
           && GetSkillLevel(ch, sn) > 0)
        {
            break;
        }

        if(first >= top)
        {
            return false;
        }

        if(StrCmp(command, skill->Name) < 1)
        {
            top = sn - 1;
        }
        else
        {
            first = sn + 1;
        }
    }

    if(!CheckPosition(ch, SkillTable[sn]->Position))
    {
        return true;
    }

    if(IsNpc(ch)
       && (IsAffectedBy(ch, Flag::Affect::Charm)
           || IsAffectedBy(ch, Flag::Affect::Possess)))
    {
        ch->Echo("For some reason, you seem unable to perform that...\r\n");
        Act(AT_GREY, "$n looks around.", ch, NULL, NULL, ActTarget::Room);
        return true;
    }

    /* check if mana is required */
    if(skill->Mana)
    {
        mana = IsNpc(ch) ? 0 : skill->Mana;

        if(!IsNpc(ch) && ch->Mana.Current < mana)
        {
            ch->Echo("You need to rest before using the Force any more.\r\n");
            return true;
        }
    }
    else
    {
        mana = 0;
    }

    /*
     * Is this a real do-fun, or a really a spell?
     */
    if(!skill->SkillFunction)
    {
        ch_ret retcode = rNONE;
        Vo vo;
        std::shared_ptr<Character> victim = NULL;
        std::shared_ptr<Object> obj;

        spell_target_name = "";

        switch(skill->Target)
        {
        default:
            Log->Bug("Check_skill: bad target for sn %d.", sn);
            ch->Echo("Something went wrong...\r\n");
            return true;

        case TAR_IGNORE:
            if(argument.empty())
            {
                if((victim = WhoFighting(ch)) != nullptr)
                {
                    spell_target_name = victim->Name;
                }
            }
            else
            {
                spell_target_name = argument;
            }
            break;

        case TAR_CHAR_OFFENSIVE:
            if(argument.empty()
               && (victim = WhoFighting(ch)) == nullptr)
            {
                ch->Echo("%s who?\r\n", Capitalize(skill->Name).c_str());
                return true;
            }
            else if(!argument.empty()
                    && (victim = GetCharacterInRoom(ch, argument)) == NULL)
            {
                ch->Echo("They aren't here.\r\n");
                return true;
            }

            if(IsSafe(ch, victim))
            {
                return true;
            }

            vo = victim;
            break;

        case TAR_CHAR_DEFENSIVE:
            if(!argument.empty()
               && (victim = GetCharacterInRoom(ch, argument)) == NULL)
            {
                ch->Echo("They aren't here.\r\n");
                return true;
            }

            if(!victim)
            {
                victim = ch;
            }

            vo = victim;
            break;

        case TAR_CHAR_SELF:
            vo = ch;
            break;

        case TAR_OBJ_INV:
            if((obj = GetCarriedObject(ch, argument)) == NULL)
            {
                ch->Echo("You can't find that.\r\n");
                return true;
            }

            vo = obj;
            break;
        }

        /* waitstate */
        SetWaitState(ch, skill->Beats);

        /* check for failure */
        if((GetRandomPercent() + skill->Difficulty * 5) > (IsNpc(ch) ? 75 : GetSkillLevel(ch, sn)))
        {
            FailedCasting(SkillTable[sn], ch, vo.Ch, obj);
            LearnFromFailure(ch, sn);

            if(mana)
            {
                ch->Mana.Current -= mana / 2;
            }

            return true;
        }

        if(mana)
        {
            ch->Mana.Current -= mana;
        }

        StartTimer(&time_used);

        if(!IsNpc(ch) && SysData.TopLevelFromAbility)
        {
            auto ability = SkillTable[sn]->Class;
            auto charLevel = GetAbilityLevel(ch, ability);
            retcode = skill->SpellFunction(sn, charLevel, ch, vo);
        }
        else
        {
            retcode = skill->SpellFunction(sn, ch->TopLevel(), ch, vo);
        }
        
        StopTimer(&time_used);
        UpdateNumberOfTimesUsed(&time_used, skill->UseRec);

        if(retcode == rCHAR_DIED || retcode == rERROR)
        {
            return true;
        }

        if(CharacterDiedRecently(ch))
        {
            return true;
        }

        if(retcode == rSPELL_FAILED)
        {
            LearnFromFailure(ch, sn);
            retcode = rNONE;
        }
        else
        {
            LearnFromSuccess(ch, sn);
        }

        if(skill->Target == TAR_CHAR_OFFENSIVE
           && victim != ch
           && !CharacterDiedRecently(victim))
        {
            auto charactersInRoom(ch->InRoom->Characters());

            for(auto vch : charactersInRoom)
            {
                if(victim == vch && !IsFighting(victim) && victim->Master != ch)
                {
                    retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
                    break;
                }
            }
        }

        return true;
    }

    if(mana)
    {
        ch->Mana.Current -= mana;
    }

    StartTimer(&time_used);
    skill->SkillFunction(ch, argument);
    StopTimer(&time_used);
    UpdateNumberOfTimesUsed(&time_used, skill->UseRec);

    return true;
}

int GetSkillLevel(std::shared_ptr<Character> ch, short gsn)
{
    return IsNpc(ch) ? ch->TopLevel() : ch->PCData->Learned[gsn];
}

void LearnFromSuccess(std::shared_ptr<Character> ch, int sn)
{
    int adept = 0;
    int gain = 0;
    int sklvl = 0;
    int learn = 0;
    int percent = 0;
    int learn_chance = 0;

    if(IsNpc(ch) || GetSkillLevel(ch, sn) <= 0)
    {
        return;
    }

    if(sn == Skills->LookupSkill("meditate") && !IsJedi(ch))
    {
        if(GetSkillLevel(ch, sn) < 50
           || (GetAbilityLevel(ch, AbilityClass::Force) == 1
               && ch->PermStats.Frc > 0))
        {
            GainXP(ch, AbilityClass::Force, 25);
        }
    }

    sklvl = SkillTable[sn]->Level;

    if(SkillTable[sn]->Class == AbilityClass::None
       || SkillTable[sn]->Class == AbilityClass::Max)
    {
        return;
    }

    adept = (GetAbilityLevel(ch, SkillTable[sn]->Class) - SkillTable[sn]->Level) * 5 + 50;
    adept = umin(adept, 100);

    if(GetSkillLevel(ch, sn) >= adept)
    {
        return;
    }

    if(sklvl == 0 || sklvl > GetAbilityLevel(ch, SkillTable[sn]->Class))
    {
        sklvl = GetAbilityLevel(ch, SkillTable[sn]->Class);
    }

    if(GetSkillLevel(ch, sn) < 100)
    {
        learn_chance = GetSkillLevel(ch, sn) + (5 * SkillTable[sn]->Difficulty);
        percent = GetRandomPercent();

        if(percent >= learn_chance)
        {
            learn = 2;
        }
        else if(learn_chance - percent > 25)
        {
            return;
        }
        else
        {
            learn = 1;
        }

        ch->PCData->Learned[sn] = umin(adept, ch->PCData->Learned[sn] + learn);

        if(GetSkillLevel(ch, sn) == 100)      /* fully learned! */
        {
            gain = 50 * sklvl;
            SetCharacterColor(AT_WHITE, ch);
            ch->Echo("You are now an adept of %s! You gain %d bonus experience!\r\n",
                     SkillTable[sn]->Name.c_str(), gain);
        }
        else
        {
            gain = 10 * sklvl;

            if(!IsFighting(ch) && sn != gsn_hide && sn != gsn_sneak)
            {
                SetCharacterColor(AT_WHITE, ch);
                ch->Echo("You gain %d %s experience from your success!\r\n",
                         gain, AbilityName[(int)SkillTable[sn]->Class]);
            }
        }

        GainXP(ch, SkillTable[sn]->Class, gain);
    }
}

void LearnFromFailure(std::shared_ptr<Character> ch, int sn)
{

}

/*
 * Lookup a skill by name, only stopping at skills the player has.
 */
int ChLookupSkill(std::shared_ptr<Character> ch, const std::string &name)
{
    if(IsNpc(ch))
    {
        return Skills->LookupSkill(name);
    }

    for(int sn = 0; sn < TopSN; sn++)
    {
        if(SkillTable[sn]->Name.empty())
        {
            break;
        }

        if(GetSkillLevel(ch, sn) > 0
           && CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           && !StringPrefix(name, SkillTable[sn]->Name))
        {
            return sn;
        }
    }

    return -1;
}

/*
 * Lookup an herb by name.
 */
int LookupHerb(const std::string &name)
{
    int sn = 0;

    for(sn = 0; sn < TopHerb; sn++)
    {
        if(HerbTable[sn] == nullptr || HerbTable[sn]->Name.empty())
        {
            return -1;
        }

        if(CharToLowercase(name[0]) == CharToLowercase(HerbTable[sn]->Name[0])
           && !StringPrefix(name, HerbTable[sn]->Name))
        {
            return sn;
        }
    }

    return -1;
}

/*
 * Lookup a skill by name.
 */
int LookupSkill(const std::string &name)
{
    int sn;

    if((sn = BSearchSkill(name, gsn_first_spell, gsn_first_skill - 1)) == -1)
    {
        if((sn = BSearchSkill(name, gsn_first_skill, gsn_first_weapon - 1)) == -1)
        {
            if((sn = BSearchSkill(name, gsn_first_weapon, gsn_first_tongue - 1)) == -1)
            {
                if((sn = BSearchSkill(name, gsn_first_tongue, gsn_TopSN - 1)) == -1
                   && gsn_TopSN < TopSN)
                {
                    for(sn = gsn_TopSN; sn < TopSN; sn++)
                    {
                        if(!SkillTable[sn] || SkillTable[sn]->Name.empty())
                        {
                            return -1;
                        }

                        if(CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
                           && !StringPrefix(name, SkillTable[sn]->Name))
                        {
                            return sn;
                        }
                    }

                    return -1;
                }
            }
        }
    }

    return sn;
}

/*
 * Return a skilltype pointer based on sn                       -Thoric
 * Returns NULL if bad, unused or personal sn.
 */
std::shared_ptr<Skill> GetSkill(int sn)
{
    if(sn >= TYPE_PERSONAL)
    {
        return NULL;
    }

    if(sn >= TYPE_HERB)
    {
        return IS_VALID_HERB(sn - TYPE_HERB) ? HerbTable[sn - TYPE_HERB] : NULL;
    }

    if(sn >= TYPE_HIT)
    {
        return NULL;
    }

    return IS_VALID_SN(sn) ? SkillTable[sn] : NULL;
}

/*
 * Perform a binary search on a section of the skill table      -Thoric
 * Each different section of the skill table is sorted alphabetically
 */
int BSearchSkill(const std::string &name, int first, int top)
{
    for(;;)
    {
        int sn = (first + top) >> 1;

        if(CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           && !StringPrefix(name, SkillTable[sn]->Name))
        {
            return sn;
        }

        if(first >= top)
        {
            return -1;
        }

        if(StrCmp(name, SkillTable[sn]->Name) < 1)
        {
            top = sn - 1;
        }
        else
        {
            first = sn + 1;
        }
    }

    return -1;
}

/*
 * Perform a binary search on a section of the skill table      -Thoric
 * Each different section of the skill table is sorted alphabetically
 * Check for exact matches only
 */
int BSearchSkillExact(const std::string &name, int first, int top)
{
    for(;;)
    {
        int sn = (first + top) >> 1;

        if(!StringPrefix(name, SkillTable[sn]->Name))
        {
            return sn;
        }

        if(first >= top)
        {
            return -1;
        }

        if(StrCmp(name, SkillTable[sn]->Name) < 1)
        {
            top = sn - 1;
        }
        else
        {
            first = sn + 1;
        }
    }

    return -1;
}

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
int ChBSearchSkill(std::shared_ptr<Character> ch, const std::string &name, int first, int top)
{
    for(;;)
    {
        int sn = (first + top) >> 1;

        if(CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           && !StringPrefix(name, SkillTable[sn]->Name)
           && GetSkillLevel(ch, sn) > 0)
        {
            return sn;
        }

        if(first >= top)
        {
            return -1;
        }

        if(StrCmp(name, SkillTable[sn]->Name) < 1)
        {
            top = sn - 1;
        }
        else
        {
            first = sn + 1;
        }
    }

    return -1;
}

/*
 * Lookup a skill by slot number.
 * Used for object loading.
 */
int SkillNumberFromSlot(int slot)
{
    int sn = 0;

    if(slot <= 0)
    {
        return -1;
    }

    for(sn = 0; sn < TopSN; sn++)
    {
        if(slot == SkillTable[sn]->Slot)
        {
            return sn;
        }
    }

    if(fBootDb)
    {
        Log->Bug("%s: bad slot %d.", __FUNCTION__, slot);
        abort();
    }

    return -1;
}

/*
 * Sort the skill table with qsort
 */
void SortSkillTable()
{
    Log->Info("Sorting skill table...");
    qsort(&SkillTable[1], TopSN - 1, sizeof(std::shared_ptr<Skill>),
          (int(*)(const void *, const void *)) CompareSkills);
}

/*
 * Function used by qsort to sort skills
 */
static int CompareSkills(std::shared_ptr<Skill> *sk1, std::shared_ptr<Skill> *sk2)
{
    std::shared_ptr<Skill> skill1 = (*sk1);
    std::shared_ptr<Skill> skill2 = (*sk2);

    if(!skill1 && skill2)
    {
        return 1;
    }

    if(skill1 && !skill2)
    {
        return -1;
    }

    if(!skill1 && !skill2)
    {
        return 0;
    }

    if(skill1->Type < skill2->Type)
    {
        return -1;
    }

    if(skill1->Type > skill2->Type)
    {
        return 1;
    }

    return StrCmp(skill1->Name, skill2->Name);
}

static void PushSkillTeachers(lua_State *L, std::shared_ptr<Skill> skill)
{
    if(!skill->Teachers.empty())
    {
        lua_pushstring(L, "Teachers");
        lua_newtable(L);

        for(auto teacher : skill->Teachers)
        {
            auto mobile = GetProtoMobile(teacher);

            if(mobile)
            {
                lua_pushstring(L, teacher.c_str());
                lua_pushstring(L, mobile->Name.c_str());
                lua_settable(L, -3);
            }
        }

        lua_settable(L, -3);
    }
}

void PushSkillMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    lua_pushstring(L, "Messages");
    lua_newtable(L);
    {
        LuaSetfieldString(L, "NounDamage", skill->Messages.NounDamage);
        LuaSetfieldString(L, "WearOff", skill->Messages.WearOff);

        lua_pushstring(L, "Success");
        lua_newtable(L);
        {
            LuaSetfieldString(L, "ToCaster", skill->Messages.Success.ToCaster);
            LuaSetfieldString(L, "ToVictim", skill->Messages.Success.ToVictim);
            LuaSetfieldString(L, "ToRoom", skill->Messages.Success.ToRoom);
        }
        lua_settable(L, -3);

        lua_pushstring(L, "Failure");
        lua_newtable(L);
        {
            LuaSetfieldString(L, "ToCaster", skill->Messages.Failure.ToCaster);
            LuaSetfieldString(L, "ToVictim", skill->Messages.Failure.ToVictim);
            LuaSetfieldString(L, "ToRoom", skill->Messages.Failure.ToRoom);
        }
        lua_settable(L, -3);

        lua_pushstring(L, "VictimDeath");
        lua_newtable(L);
        {
            LuaSetfieldString(L, "ToCaster", skill->Messages.VictimDeath.ToCaster);
            LuaSetfieldString(L, "ToVictim", skill->Messages.VictimDeath.ToVictim);
            LuaSetfieldString(L, "ToRoom", skill->Messages.VictimDeath.ToRoom);
        }
        lua_settable(L, -3);

        lua_pushstring(L, "VictimImmune");
        lua_newtable(L);
        {
            LuaSetfieldString(L, "ToCaster", skill->Messages.VictimImmune.ToCaster);
            LuaSetfieldString(L, "ToVictim", skill->Messages.VictimImmune.ToVictim);
            LuaSetfieldString(L, "ToRoom", skill->Messages.VictimImmune.ToRoom);
        }
        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

static void PushSkill(lua_State *L, std::shared_ptr<Skill> skill)
{
    static int idx = 0;
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", skill->Name);
    LuaSetfieldString(L, "Ability",
                      skill->Class > AbilityClass::None && skill->Class < AbilityClass::Max
                      ? AbilityName[static_cast<int>(skill->Class)] : "none");
    LuaSetfieldString(L, "Position", PositionName[skill->Position]);
    LuaSetfieldString(L, "Type", SkillTypeName[skill->Type]);

    if(skill->SpellFunction || skill->SkillFunction)
    {
        LuaSetfieldString(L, "Function", skill->FunctionName);
    }

    LuaSetfieldString(L, "Target", SpellTargetName[skill->Target]);

    if(skill->Slot)
    {
        LuaSetfieldNumber(L, "Slot", skill->Slot);
    }

    if(skill->Mana)
    {
        LuaSetfieldNumber(L, "Mana", skill->Mana);
    }

    if(skill->Beats)
    {
        LuaSetfieldNumber(L, "Beats", skill->Beats);
    }

    if(skill->Level && skill->Type != SKILL_HERB)
    {
        LuaSetfieldNumber(L, "Level", skill->Level);
    }

    if(!skill->Dice.empty())
    {
        LuaSetfieldString(L, "Dice", skill->Dice);
    }

    if(skill->Value)
    {
        LuaSetfieldNumber(L, "Value", skill->Value);
    }

    if(skill->Saves)
    {
        LuaSetfieldString(L, "Saves", SpellSaveName[skill->Saves]);
    }

    if(skill->Difficulty)
    {
        LuaSetfieldNumber(L, "Difficulty", skill->Difficulty);
    }

    if(skill->Participants)
    {
        LuaSetfieldNumber(L, "Participants", skill->Participants);
    }

    if(skill->Alignment)
    {
        LuaSetfieldNumber(L, "Alignment", skill->Alignment);
    }

    LuaPushFlags(L, skill->Flags, SpellFlag, "Flags");
    PushSkillTeachers(L, skill);
    LuaPushSmaugAffects(L, skill->Affects);
    PushSkillMessages(L, skill);
    lua_settable(L, -3);
}

static void PushSkillTable(lua_State *L)
{
    lua_newtable(L);

    for(int sn = 0; sn < TopSN; ++sn)
    {
        std::shared_ptr<Skill> skill = SkillTable[sn];

        if(!skill->Name.empty())
        {
            PushSkill(L, skill);
        }
    }

    lua_setglobal(L, "skills");
}

void SaveSkills()
{
    LuaSaveDataFile(SKILL_DATA_FILE, PushSkillTable, "skills");
}

static void LoadSkillTeachers(lua_State *L, std::shared_ptr<Skill> skill)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Teachers");

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            std::string vnumOrTag = lua_tostring(L, -2);
            skill->Teachers.push_back(vnumOrTag);
            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

static void LoadBasicMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    LuaGetfieldString(L, "NounDamage", &skill->Messages.NounDamage);
    LuaGetfieldString(L, "WearOff", &skill->Messages.WearOff);
}

static void LoadSuccessMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Success");

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldString(L, "ToCaster", &skill->Messages.Success.ToCaster);
        LuaGetfieldString(L, "ToVictim", &skill->Messages.Success.ToVictim);
        LuaGetfieldString(L, "ToRoom", &skill->Messages.Success.ToRoom);
    }
    else
    {
        Log->Bug("%s: Couldn't get Success messages", __FUNCTION__);
    }

    lua_pop(L, 1);
}

static void LoadFailureMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Failure");

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldString(L, "ToCaster", &skill->Messages.Failure.ToCaster);
        LuaGetfieldString(L, "ToVictim", &skill->Messages.Failure.ToVictim);
        LuaGetfieldString(L, "ToRoom", &skill->Messages.Failure.ToRoom);
    }

    lua_pop(L, 1);
}

static void LoadVictimDeathMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "VictimDeath");

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldString(L, "ToCaster", &skill->Messages.VictimDeath.ToCaster);
        LuaGetfieldString(L, "ToVictim", &skill->Messages.VictimDeath.ToVictim);
        LuaGetfieldString(L, "ToRoom", &skill->Messages.VictimDeath.ToRoom);
    }

    lua_pop(L, 1);
}

static void LoadVictimImmuneMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "VictimImmune");

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldString(L, "ToCaster", &skill->Messages.VictimImmune.ToCaster);
        LuaGetfieldString(L, "ToVictim", &skill->Messages.VictimImmune.ToVictim);
        LuaGetfieldString(L, "ToRoom", &skill->Messages.VictimImmune.ToRoom);
    }

    lua_pop(L, 1);
}

static void LoadSkillMessages(lua_State *L, std::shared_ptr<Skill> skill)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Messages");

    if(!lua_isnil(L, ++idx))
    {
        LoadBasicMessages(L, skill);
        LoadSuccessMessages(L, skill);
        LoadFailureMessages(L, skill);
        LoadVictimDeathMessages(L, skill);
        LoadVictimImmuneMessages(L, skill);
    }

    lua_pop(L, 1);
}

static int L_SkillEntry(lua_State *L)
{
    std::shared_ptr<Skill> skill = LoadSkillOrHerb(L);

    if(skill)
    {
        if(TopSN >= MAX_SKILL)
        {
            Log->Bug("%s: more skills than MAX_SKILL %d", __FUNCTION__, MAX_SKILL);
            abort();
        }

        SkillTable[TopSN++] = skill;
    }

    return 0;
}

static std::shared_ptr<Skill> LoadSkillOrHerb(lua_State *L)
{
    std::string skillName;
    LuaGetfieldString(L, "Name", &skillName);

    if(skillName.empty())
    {
        Log->Bug("%s: Found skill without name", __FUNCTION__);
        return nullptr;
    }

    std::shared_ptr<Skill> skill = std::make_shared<Skill>();
    skill->Name = skillName;

    LuaGetfieldString(L, "Ability",
                      [skill](const std::string &abilityName)
                      {
                          skill->Class = GetAbility(abilityName);

                          if(skill->Class >= AbilityClass::Max)
                          {
                              skill->Class = AbilityClass::None;
                          }
                      });
    LuaGetfieldString(L, "Position",
                      [skill](const std::string &posName)
                      {
                          skill->Position = GetPosition(posName);

                          if(skill->Position < POS_DEAD || skill->Position >= MAX_POSITION)
                          {
                              skill->Position = DEFAULT_POSITION;
                          }
                      });
    LuaGetfieldString(L, "Type",
                      [skill](const std::string &typeName)
                      {
                          skill->Type = GetSkillType(typeName);

                          if(skill->Type < SKILL_UNKNOWN || skill->Type > SKILL_HERB)
                          {
                              Log->Bug("%s: Invalid skill type: %d", __FUNCTION__, skill->Type);
                              skill->Type = SKILL_UNKNOWN;
                          }
                      });
    LuaGetfieldString(L, "Function",
                      [skill](const std::string &funName)
                      {
                          auto spellfun = GetSpellFunction(funName);
                          const auto spellfunptr = spellfun.target<ch_ret(*)(int, int, std::shared_ptr<Character>, const Vo&)>();
                          auto dofun = GetSkillFunction(funName);
                          const auto dofunptr = dofun.target<void(*)(std::shared_ptr<Character>, std::string)>();
                          
                          if(spellfunptr != nullptr && *spellfunptr != spell_notfound
                             && !StringPrefix("spell_", funName))
                          {
                              skill->SpellFunction = spellfun;
                              skill->FunctionName = funName;
                          }
                          else if(dofunptr != nullptr && *dofunptr != skill_notfound
                                  && !StringPrefix("do_", funName))
                          {
                              skill->SkillFunction = dofun;
                              skill->FunctionName = funName;
                          }
                          else
                          {
                              Log->Bug("%s: unknown skill/spell code %s",
                                       __FUNCTION__, funName.c_str());
                          }
                      });
    LuaGetfieldString(L, "Target",
                      [skill](const std::string &targetName)
                      {
                          skill->Target = (SkillTargetType)GetSpellTarget(targetName);

                          if(skill->Target < TAR_IGNORE || skill->Target > TAR_OBJ_INV)
                          {
                              skill->Target = TAR_IGNORE;
                          }
                      });
    LuaGetfieldInt(L, "Slot", &skill->Slot);
    LuaGetfieldInt(L, "Mana", &skill->Mana);
    LuaGetfieldInt(L, "Beats", &skill->Beats);
    LuaGetfieldInt(L, "Level", &skill->Level);
    LuaGetfieldString(L, "Dice", &skill->Dice);
    LuaGetfieldInt(L, "Value", &skill->Value);
    LuaGetfieldInt(L, "Saves", &skill->Saves);
    LuaGetfieldInt(L, "Difficulty", &skill->Difficulty);
    LuaGetfieldInt(L, "Participants", &skill->Participants);
    LuaGetfieldInt(L, "Alignment", &skill->Alignment);

    skill->Flags = LuaLoadFlags(L, "Flags");
    LoadSkillTeachers(L, skill);
    skill->Affects = LuaLoadSmaugAffects(L);
    LoadSkillMessages(L, skill);

    return skill;
}

static int L_HerbEntry(lua_State *L)
{
    std::shared_ptr<Skill> herb = LoadSkillOrHerb(L);

    if(herb)
    {
        if(TopHerb >= MAX_HERB)
        {
            Log->Bug("%s: more herbs than MAX_HERB %d", __FUNCTION__, MAX_HERB);
            abort();
        }

        HerbTable[TopHerb++] = herb;
    }

    return 0;
}

void LoadSkills()
{
    LuaLoadDataFile(SKILL_DATA_FILE, L_SkillEntry, "SkillEntry");
}

static void PushHerbTable(lua_State *L)
{
    int sn = 0;
    lua_newtable(L);

    for(sn = 0; sn < TopHerb; ++sn)
    {
        std::shared_ptr<Skill> herb = HerbTable[sn];

        if(!herb->Name.empty())
        {
            PushSkill(L, herb);
        }
    }

    lua_setglobal(L, "herbs");
}

void SaveHerbs()
{
    LuaSaveDataFile(HERB_DATA_FILE, PushHerbTable, "herbs");
}

void LoadHerbs()
{
    LuaLoadDataFile(HERB_DATA_FILE, L_HerbEntry, "HerbEntry");
}

void ASSIGN_GSN(short &gsn, const std::string &skill)
{
    gsn = Skills->LookupSkill(skill);

    if(gsn == -1)
    {
        fprintf(stderr, "ASSIGN_GSN: Skill %s not found.\n", skill.c_str());
    }
}

bool IS_VALID_SN(int sn)
{
    return sn >= 0
        && sn < MAX_SKILL
        &&SkillTable[sn] != nullptr
        && !SkillTable[sn]->Name.empty();
}

bool IS_VALID_HERB(int sn)
{
    return sn >= 0
        && sn < MAX_HERB
        &&HerbTable[sn] != nullptr
        && !HerbTable[sn]->Name.empty();
}

bool SPELL_FLAG(std::shared_ptr<Skill> skill, size_t flag)
{
    return skill->Flags.test(flag);
}

long SPELL_DAMAGE(std::shared_ptr<Skill> skill)
{
    return skill->Flags.to_ulong() & 7;
}

long SPELL_ACTION(std::shared_ptr<Skill> skill)
{
    return skill->Flags.to_ulong() >> 3 & 7;
}

long SPELL_CLASS(std::shared_ptr<Skill> skill)
{
    return skill->Flags.to_ulong() >> 6 & 7;
}

long SPELL_POWER(std::shared_ptr<Skill> skill)
{
    return skill->Flags.to_ulong() >> 9 & 3;
}

void SET_SDAM(std::shared_ptr<Skill> skill, int val)
{
    skill->Flags = (skill->Flags.to_ulong() & SDAM_MASK) + (val & 7);
}

void SET_SACT(std::shared_ptr<Skill> skill, int val)
{
    skill->Flags = (skill->Flags.to_ulong() & SACT_MASK) + ((val & 7) << 3);
}

void SET_SCLA(std::shared_ptr<Skill> skill, int val)
{
    skill->Flags = (skill->Flags.to_ulong() & SCLA_MASK) + ((val & 7) << 6);
}

void SET_SPOW(std::shared_ptr<Skill> skill, int val)
{
    skill->Flags = (skill->Flags.to_ulong() & SPOW_MASK) + ((val & 3) << 9);
}

bool IS_FIRE(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_FIRE;
}

bool IS_COLD(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_COLD;
}

bool IS_ACID(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_ACID;
}

bool IS_ELECTRICITY(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_ELECTRICITY;
}

bool IS_ENERGY(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_ENERGY;
}

bool IS_DRAIN(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_DRAIN;
}

bool IS_POISON(int dt)
{
    return IS_VALID_SN(dt) && SPELL_DAMAGE(SkillTable[dt]) == SD_POISON;
}
