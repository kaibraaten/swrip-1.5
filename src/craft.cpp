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

#include <algorithm>
#include <cassert>
#include <utility/random.hpp>
#include "mud.hpp"
#include "craft.hpp"
#include "constants.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "repos/skillrepository.hpp"
#include "act.hpp"

class CraftRecipe
{
public:
    int Skill = 0;
    std::list<CraftingMaterial> Materials;
    int Duration = 0;
    std::shared_ptr<ProtoObject> Prototype;
    std::bitset<Flag::MAX> Flags;
};

class FoundMaterial
{
public:
    CraftingMaterial Material;
    bool Found = false;
    bool KeepFinding = false;
};

struct CraftingSession::Impl
{
    ~Impl();
    std::shared_ptr<Character> Engineer;
    std::shared_ptr<CraftRecipe> Recipe;
    FoundMaterial *FoundMaterials = nullptr;
    std::string CommandArgument;
};

CraftingSession::Impl::~Impl()
{
    delete[] FoundMaterials;
}

CraftingSession::CraftingSession()
    : pImpl(std::make_unique<Impl>())
{

}

CraftingSession::~CraftingSession()
{

}

class FinishedCraftingUserData
{
public:
    std::shared_ptr<CraftRecipe> Recipe;
};

static void AfterDelay(std::shared_ptr<CraftingSession> session);
static void AbortSession(std::shared_ptr<CraftingSession> session);
static bool CheckMaterials(std::shared_ptr<CraftingSession> session, bool extract);
static FoundMaterial* AllocateFoundMaterials(const std::list<CraftingMaterial> &recipeMaterials);
static bool CheckSkillLevel(std::shared_ptr<CraftingSession> session);
static std::string GetItemTypeNameExtended(ItemTypes itemType, int extraInfo);
static FoundMaterial *GetUnfoundMaterial(std::shared_ptr<CraftingSession> session, std::shared_ptr<Object> obj);
static void FinishedCraftingHandler(std::shared_ptr<FinishedCraftingUserData> data,
                                    std::shared_ptr<FinishedCraftingEventArgs> eventArgs);
static void CheckRequirementsHandler(std::shared_ptr<CheckRequirementsEventArgs> args);

CraftingMaterial::CraftingMaterial(ItemTypes type,
                                   std::initializer_list<size_t> flagBits)
    : ItemType(type),
    Flags(CreateBitSet<Flag::MAX>(flagBits))
{

}

void do_craftingengine(std::shared_ptr<Character> ch, std::string argument)
{
    assert(!IsNpc(ch));

    auto session = ch->PCData->CraftingSession;

    assert(session != nullptr);
    assert(ch->SubState == CharacterSubState::Pause
           || ch->SubState == CharacterSubState::TimerDoAbort);

    switch(ch->SubState)
    {
    default:
        break;

    case CharacterSubState::Pause:
        AfterDelay(session);
        break;

    case CharacterSubState::TimerDoAbort:
        AbortSession(session);
        break;
    }
}

static void AfterDelay(std::shared_ptr<CraftingSession> session)
{
    auto recipe = session->pImpl->Recipe;
    auto ch = GetEngineer(session);
    int the_chance = GetSkillLevel(ch, recipe->Skill);
    bool hasMaterials = CheckMaterials(session, true);
    int level = GetSkillLevel(ch, recipe->Skill);
    auto proto = recipe->Prototype;
    std::string itemType = GetItemTypeNameExtended(proto->ItemType, proto->Value[OVAL_WEAPON_TYPE]);

    ch->SubState = CharacterSubState::None;

    if(GetRandomPercent() > the_chance * 2 || !hasMaterials)
    {
        ch->Echo("&RYou hold up your newly created %s.\r\n", itemType.c_str());
        ch->Echo("&RIt suddenly dawns upon you that you have created the most useless\r\n");
        ch->Echo("&R%s you've ever seen. You quickly hide your mistake...&d\r\n", itemType.c_str());
        LearnFromFailure(ch, recipe->Skill);
        ch->PCData->CraftingSession = nullptr;
        return;
    }

    auto object = CreateObject(proto, level);

    auto eventArgs = std::make_shared<SetObjectStatsEventArgs>();
    eventArgs->CraftingSession = session;
    eventArgs->Object = object;
    session->OnSetObjectStats.Raise(eventArgs);

    object = ObjectToCharacter(object, ch);

    auto finishedCraftingEventArgs = std::make_shared<FinishedCraftingEventArgs>();
    finishedCraftingEventArgs->CraftingSession = session;
    finishedCraftingEventArgs->Object = object;
    session->OnFinishedCrafting.Raise(finishedCraftingEventArgs);
    ch->PCData->CraftingSession = nullptr;
}

static void FinishedCraftingHandler(std::shared_ptr<FinishedCraftingUserData> data,
                                    std::shared_ptr<FinishedCraftingEventArgs> eventArgs)
{
    auto session = eventArgs->CraftingSession;
    auto ch = GetEngineer(session);
    std::string itemType = GetItemTypeNameExtended(eventArgs->Object->ItemType, eventArgs->Object->Value[OVAL_WEAPON_TYPE]);
    long xpgain = 0;
    std::shared_ptr<Skill> skill = Skills->GetSkill(data->Recipe->Skill);

    ch->Echo("&GYou finish your work and hold up your newly created %s.&d\r\n",
             itemType.c_str());
    std::string actBuf = FormatString("$n finishes making $s new %s.", itemType.c_str());
    Act(AT_PLAIN, actBuf, ch, nullptr, nullptr, ActTarget::Room);

    xpgain = umin(eventArgs->Object->Cost * 100,
                  GetRequiredXpForLevel(GetAbilityLevel(ch, skill->Class) + 1)
                  - GetRequiredXpForLevel(GetAbilityLevel(ch, skill->Class)));
    GainXP(ch, skill->Class, xpgain);
    ch->Echo("You gain %ld %s experience.", xpgain, AbilityName[(int)skill->Class]);

    LearnFromSuccess(ch, data->Recipe->Skill);
}

static void CheckRequirementsHandler(std::shared_ptr<CheckRequirementsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CraftingSession->pImpl->Recipe->Flags.test(Flag::Crafting::NeedsWorkshop)
       && !CheckRoomFlag(ch->InRoom, Flag::Room::Factory))
    {
        ch->Echo("&RYou need to be in a factory or workshop to do that.&d\r\n");
        args->AbortSession = true;
    }

    if(args->CraftingSession->pImpl->Recipe->Flags.test(Flag::Crafting::NeedsRefinery)
       && !CheckRoomFlag(ch->InRoom, Flag::Room::Refinery))
    {
        ch->Echo("&RYou need to be in a refinery to do that.&d\r\n");
        args->AbortSession = true;
    }
}

static void AbortSession(std::shared_ptr<CraftingSession> session)
{
    auto ch = GetEngineer(session);
    ch->SubState = CharacterSubState::None;
    ch->Echo("&RYou are interrupted and fail to finish your work.&d\r\n");

    auto abortEventArgs = std::make_shared<AbortCraftingEventArgs>();
    abortEventArgs->CraftingSession = session;
    session->OnAbort.Raise(abortEventArgs);

    ch->PCData->CraftingSession = nullptr;
}

std::shared_ptr<Character> GetEngineer(std::shared_ptr<CraftingSession> session)
{
    return session->pImpl->Engineer;
}

std::shared_ptr<CraftRecipe> AllocateCraftRecipe(int sn, std::initializer_list<CraftingMaterial> materialList, int duration,
                                                 std::shared_ptr<ProtoObject> prototypeObject,
                                                 std::initializer_list<size_t> flagBits)
{
    auto recipe = std::make_shared<CraftRecipe>();

    recipe->Skill = sn;
    recipe->Materials = materialList;
    recipe->Duration = duration;
    recipe->Prototype = prototypeObject;
    recipe->Flags = CreateBitSet<Flag::MAX>(flagBits);

    if(Skills->GetSkill(recipe->Skill) == nullptr)
    {
        Log->Bug("%s:%d %s(): Bad Skill %d",
                 __FILE__, __LINE__, __FUNCTION__, recipe->Skill);
    }

    if(recipe->Prototype == nullptr)
    {
        Log->Bug("%s:%d %s(): Bad ProtoObject",
                 __FILE__, __LINE__, __FUNCTION__);
    }

    return recipe;
}

static FoundMaterial *AllocateFoundMaterials(const std::list<CraftingMaterial> &recipeMaterials)
{
    FoundMaterial *foundMaterials = new FoundMaterial[recipeMaterials.size() + 1]; // Plus one to accomodate end-marker (ITEM_NONE).
    int i = 0;

    for(const auto &recmat : recipeMaterials)
    {
        foundMaterials[i].Material = recmat;
        ++i;
    }

    CraftingMaterial endMarker;
    foundMaterials[i].Material = endMarker;
    return foundMaterials;
}

std::shared_ptr<CraftingSession> AllocateCraftingSession(std::shared_ptr<CraftRecipe> recipe, std::shared_ptr<Character> engineer,
                                                         const std::string &commandArgument)
{
    auto session = std::make_shared<CraftingSession>();
    auto finishedCraftingUserData = std::make_shared<FinishedCraftingUserData>();
    finishedCraftingUserData->Recipe = recipe;
    session->OnFinishedCrafting.Add(finishedCraftingUserData, FinishedCraftingHandler);

    session->pImpl->Engineer = engineer;
    session->pImpl->Recipe = recipe;
    session->pImpl->FoundMaterials = AllocateFoundMaterials(recipe->Materials);
    session->pImpl->CommandArgument = commandArgument;

    engineer->PCData->CraftingSession = session;

    session->OnCheckRequirements.Add(CheckRequirementsHandler);

    return session;
}

static bool CheckSkillLevel(std::shared_ptr<CraftingSession> session)
{
    auto ch = GetEngineer(session);
    int the_chance = GetSkillLevel(ch, session->pImpl->Recipe->Skill);

    if(GetRandomPercent() >= the_chance)
    {
        ch->Echo("&RYou can't figure out what to do.&d\r\n");
        LearnFromFailure(ch, session->pImpl->Recipe->Skill);
        return false;
    }

    return true;
}

void StartCrafting(std::shared_ptr<CraftingSession> session)
{
    auto ch = GetEngineer(session);

    auto checkRequirementsEventArgs = std::make_shared<CheckRequirementsEventArgs>();
    checkRequirementsEventArgs->CraftingSession = session;
    checkRequirementsEventArgs->AbortSession = false;

    auto interpretArgumentsEventArgs = std::make_shared<InterpretArgumentsEventArgs>();
    interpretArgumentsEventArgs->CraftingSession = session;
    interpretArgumentsEventArgs->CommandArguments = session->pImpl->CommandArgument;
    interpretArgumentsEventArgs->AbortSession = false;
    session->OnInterpretArguments.Raise(interpretArgumentsEventArgs);

    if(!interpretArgumentsEventArgs->AbortSession)
    {
        session->OnCheckRequirements.Raise(checkRequirementsEventArgs);
    }

    if(interpretArgumentsEventArgs->AbortSession
       || checkRequirementsEventArgs->AbortSession
       || !CheckMaterials(session, false)
       || !CheckSkillLevel(session))
    {
        auto abortEventArgs = std::make_shared<AbortCraftingEventArgs>();
        abortEventArgs->CraftingSession = session;
        session->OnAbort.Raise(abortEventArgs);
        ch->PCData->CraftingSession = nullptr;
        return;
    }

    auto obj = session->pImpl->Recipe->Prototype;

    ch->Echo("&GYou begin the long process of creating %s.&d\r\n",
             AOrAn(GetItemTypeNameExtended(obj->ItemType, obj->Value[OVAL_WEAPON_TYPE])).c_str());

    Act(AT_PLAIN, "$n takes $s tools and some material and begins to work.",
        ch, nullptr, nullptr, ActTarget::Room);
    AddTimerToCharacter(ch, TIMER_CMD_FUN, session->pImpl->Recipe->Duration, do_craftingengine, CharacterSubState::Pause);
}

static bool CheckMaterials(std::shared_ptr<CraftingSession> session, bool extract)
{
    auto ch = GetEngineer(session);
    bool foundAll = true;
    auto carriedObjects = ch->Objects();

    for(auto obj : carriedObjects)
    {
        FoundMaterial *material = GetUnfoundMaterial(session, obj);

        if(!material)
        {
            continue;
        }

        material->Found = true;

        if(extract)
        {
            auto args = std::make_shared<MaterialFoundEventArgs>();
            args->CraftingSession = session;
            args->Object = obj;
            args->KeepFinding = false;

            if(material->Material.Flags.test(Flag::Crafting::Extract))
            {
                SeparateOneObjectFromGroup(obj);
                ObjectFromCharacter(obj);
                ExtractObject(obj);
            }

            session->OnMaterialFound.Raise(args);
            material->KeepFinding = args->KeepFinding;
        }
    }

    FoundMaterial *material = session->pImpl->FoundMaterials;

    while(material->Material.ItemType != ITEM_NONE)
    {
        if(!material->Found
           && !material->Material.Flags.test(Flag::Crafting::Optional))
        {
            std::shared_ptr<ProtoObject> proto = session->pImpl->Recipe->Prototype;
            std::string itemTypeName = GetItemTypeNameExtended(material->Material.ItemType, 0);
            ReplaceChar(itemTypeName, '_', ' ');
            foundAll = false;
            ch->Echo("&RYou need %s to complete the %s.&d\r\n",
                     AOrAn(itemTypeName).c_str(),
                     GetItemTypeNameExtended(proto->ItemType, proto->Value[OVAL_WEAPON_TYPE]).c_str());
        }

        ++material;
    }

    delete[] session->pImpl->FoundMaterials;
    session->pImpl->FoundMaterials = AllocateFoundMaterials(session->pImpl->Recipe->Materials);

    return foundAll;
}

static FoundMaterial *GetUnfoundMaterial(std::shared_ptr<CraftingSession> session, std::shared_ptr<Object> obj)
{
    FoundMaterial *material = session->pImpl->FoundMaterials;

    while(material->Material.ItemType != ITEM_NONE)
    {
        if(obj->ItemType == material->Material.ItemType
           && (!material->Found || material->KeepFinding))
        {
            return material;
        }

        ++material;
    }

    return nullptr;
}

static std::string GetItemTypeNameExtended(ItemTypes itemType, int extraInfo)
{
    std::string type;

    if(itemType == ITEM_WEAPON)
    {
        type = GetWeaponTypeName(extraInfo);
    }
    else
    {
        type = ObjectTypes[itemType];
    }

    return type;
}

bool IsCrafting(std::shared_ptr<Character> ch)
{
    return ch->PCData->CraftingSession != nullptr;
}
