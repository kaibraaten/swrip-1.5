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
    const CraftingMaterial *Materials = nullptr;
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
    std::shared_ptr<Character> Engineer;
    CraftRecipe *Recipe = nullptr;
    FoundMaterial *FoundMaterials = nullptr;
    std::string CommandArgument;
};

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
    CraftRecipe *Recipe = nullptr;
};

static void AfterDelay(CraftingSession *session);
static void AbortSession(CraftingSession *session);
static bool CheckMaterials(CraftingSession *session, bool extract);
static size_t CountCraftingMaterials(const CraftingMaterial *material);
static FoundMaterial *AllocateFoundMaterials(const CraftingMaterial *recipeMaterials);
static bool CheckSkillLevel(const CraftingSession *session);
static std::string GetItemTypeNameExtended(ItemTypes itemType, int extraInfo);
static FoundMaterial *GetUnfoundMaterial(const CraftingSession *session, std::shared_ptr<Object> obj);
static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> eventArgs);
static void CheckRequirementsHandler(void *userData, std::shared_ptr<CheckRequirementsEventArgs> args);

CraftingMaterial::CraftingMaterial(ItemTypes type,
                                   std::initializer_list<size_t> flagBits)
    : ItemType(type),
    Flags(CreateBitSet<Flag::MAX>(flagBits))
{

}

void do_craftingengine(std::shared_ptr<Character> ch, std::string argument)
{
    assert(!IsNpc(ch));

    CraftingSession *session = ch->PCData->CraftingSession;

    assert(session != nullptr);
    assert(ch->SubState == SUB_PAUSE || ch->SubState == SUB_TIMER_DO_ABORT);

    switch(ch->SubState)
    {
    default:
        break;

    case SUB_PAUSE:
        AfterDelay(session);
        break;

    case SUB_TIMER_DO_ABORT:
        AbortSession(session);
        break;
    }
}

static void AfterDelay(CraftingSession *session)
{
    CraftRecipe *recipe = session->pImpl->Recipe;
    std::shared_ptr<Character> ch = session->pImpl->Engineer;
    int the_chance = ch->PCData->Learned[recipe->Skill];
    bool hasMaterials = CheckMaterials(session, true);
    int level = ch->PCData->Learned[recipe->Skill];
    std::shared_ptr<ProtoObject> proto = recipe->Prototype;
    std::string itemType = GetItemTypeNameExtended(proto->ItemType, proto->Value[OVAL_WEAPON_TYPE]);

    ch->SubState = SUB_NONE;

    if(GetRandomPercent() > the_chance * 2 || !hasMaterials)
    {
        ch->Echo("&RYou hold up your newly created %s.\r\n", itemType.c_str());
        ch->Echo("&RIt suddenly dawns upon you that you have created the most useless\r\n");
        ch->Echo("&R%s you've ever seen. You quickly hide your mistake...&d\r\n", itemType.c_str());
        LearnFromFailure(ch, recipe->Skill);
        FreeCraftingSession(session);
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

    FreeCraftingSession(session);
}

static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> eventArgs)
{
    CraftingSession *session = eventArgs->CraftingSession;
    FinishedCraftingUserData *data = (FinishedCraftingUserData *)userData;
    auto ch = GetEngineer(session);
    std::string itemType = GetItemTypeNameExtended(eventArgs->Object->ItemType, eventArgs->Object->Value[OVAL_WEAPON_TYPE]);
    char actBuf[MAX_STRING_LENGTH];
    long xpgain = 0;
    std::shared_ptr<Skill> skill = Skills->GetSkill(data->Recipe->Skill);

    ch->Echo("&GYou finish your work and hold up your newly created %s.&d\r\n",
             itemType.c_str());
    sprintf(actBuf, "$n finishes making $s new %s.", itemType.c_str());
    Act(AT_PLAIN, actBuf, ch, NULL, NULL, ActTarget::Room);

    xpgain = umin(eventArgs->Object->Cost * 100,
                  GetRequiredXpForLevel(GetAbilityLevel(ch, skill->Guild) + 1)
                  - GetRequiredXpForLevel(GetAbilityLevel(ch, skill->Guild)));
    GainXP(ch, skill->Guild, xpgain);
    ch->Echo("You gain %ld %s experience.", xpgain, AbilityName[skill->Guild]);

    LearnFromSuccess(ch, data->Recipe->Skill);

    delete data;
}

static void CheckRequirementsHandler(void *userData, std::shared_ptr<CheckRequirementsEventArgs> args)
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

static void AbortSession(CraftingSession *session)
{
    auto ch = session->pImpl->Engineer;
    ch->SubState = SUB_NONE;
    ch->Echo("&RYou are interrupted and fail to finish your work.&d\r\n");

    auto abortEventArgs = std::make_shared<AbortCraftingEventArgs>();
    abortEventArgs->CraftingSession = session;
    session->OnAbort.Raise(abortEventArgs);

    FreeCraftingSession(session);
}

std::shared_ptr<Character> GetEngineer(const CraftingSession *session)
{
    return session->pImpl->Engineer;
}

CraftRecipe *AllocateCraftRecipe(int sn, const CraftingMaterial *materialList, int duration,
                                 std::shared_ptr<ProtoObject> prototypeObject,
                                 std::initializer_list<size_t> flagBits)
{
    CraftRecipe *recipe = new CraftRecipe();

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

void FreeCraftRecipe(CraftRecipe *recipe)
{
    delete recipe;
}

static size_t CountCraftingMaterials(const CraftingMaterial *material)
{
    size_t numberOfElements = 0;

    while(material->ItemType != ITEM_NONE)
    {
        ++numberOfElements;
        ++material;
    }

    ++numberOfElements; /* include ITEM_NONE */

    return numberOfElements;
}

static FoundMaterial *AllocateFoundMaterials(const CraftingMaterial *recipeMaterials)
{
    size_t numberOfElements = CountCraftingMaterials(recipeMaterials);
    FoundMaterial *foundMaterials = new FoundMaterial[numberOfElements];

    for(size_t i = 0; i < numberOfElements; ++i)
    {
        foundMaterials[i].Material = recipeMaterials[i];
        foundMaterials[i].Found = false;
        foundMaterials[i].KeepFinding = false;
    }

    return foundMaterials;
}

CraftingSession *AllocateCraftingSession(CraftRecipe *recipe, std::shared_ptr<Character> engineer,
                                         const std::string &commandArgument)
{
    CraftingSession *session = new CraftingSession();
    FinishedCraftingUserData *finishedCraftingUserData = new FinishedCraftingUserData();
    finishedCraftingUserData->Recipe = recipe;
    AddFinishedCraftingHandler(session, finishedCraftingUserData, FinishedCraftingHandler);

    session->pImpl->Engineer = engineer;
    session->pImpl->Recipe = recipe;
    session->pImpl->FoundMaterials = AllocateFoundMaterials(recipe->Materials);
    session->pImpl->CommandArgument = commandArgument;

    engineer->PCData->CraftingSession = session;

    AddCheckRequirementsCraftingHandler(session, NULL, CheckRequirementsHandler);

    return session;
}

void FreeCraftingSession(CraftingSession *session)
{
    FreeCraftRecipe(session->pImpl->Recipe);
    delete[] session->pImpl->FoundMaterials;

    if(session->pImpl->Engineer)
    {
        session->pImpl->Engineer->PCData->CraftingSession = NULL;
    }

    delete session;
}

static bool CheckSkillLevel(const CraftingSession *session)
{
    auto ch = session->pImpl->Engineer;
    int the_chance = IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[session->pImpl->Recipe->Skill]);

    if(GetRandomPercent() >= the_chance)
    {
        ch->Echo("&RYou can't figure out what to do.&d\r\n");
        LearnFromFailure(ch, session->pImpl->Recipe->Skill);
        return false;
    }

    return true;
}

void StartCrafting(CraftingSession *session)
{
    auto ch = session->pImpl->Engineer;
    
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
        FreeCraftingSession(session);
        return;
    }

    std::shared_ptr<ProtoObject> obj = session->pImpl->Recipe->Prototype;

    ch->Echo("&GYou begin the long process of creating %s.&d\r\n",
             AOrAn(GetItemTypeNameExtended(obj->ItemType, obj->Value[OVAL_WEAPON_TYPE])).c_str());

    Act(AT_PLAIN, "$n takes $s tools and some material and begins to work.",
        ch, nullptr, nullptr, ActTarget::Room);
    AddTimerToCharacter(ch, TIMER_CMD_FUN, session->pImpl->Recipe->Duration, do_craftingengine, SUB_PAUSE);
}

static bool CheckMaterials(CraftingSession *session, bool extract)
{
    std::shared_ptr<Character> ch = GetEngineer(session);
    bool foundAll = true;
    FoundMaterial *material = nullptr;

    auto carriedObjects = ch->Objects();

    for(auto obj : carriedObjects)
    {
        material = GetUnfoundMaterial(session, obj);

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

    material = session->pImpl->FoundMaterials;

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

static FoundMaterial *GetUnfoundMaterial(const CraftingSession *session, std::shared_ptr<Object> obj)
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

void AddInterpretArgumentsCraftingHandler(CraftingSession *session, void *userData,
                                          void(*handler)(void *, std::shared_ptr<InterpretArgumentsEventArgs>))
{
    session->OnInterpretArguments.Add(userData, handler);
}

void AddCheckRequirementsCraftingHandler(CraftingSession *session, void *userData,
                                         void(*handler)(void *, std::shared_ptr<CheckRequirementsEventArgs>))
{
    session->OnCheckRequirements.Add(userData, handler);
}

void AddMaterialFoundCraftingHandler(CraftingSession *session, void *userData,
                                     void(*handler)(void *, std::shared_ptr<MaterialFoundEventArgs>))
{
    session->OnMaterialFound.Add(userData, handler);
}

void AddSetObjectStatsCraftingHandler(CraftingSession *session, void *userData,
                                      void(*handler)(void *, std::shared_ptr<SetObjectStatsEventArgs>))
{
    session->OnSetObjectStats.Add(userData, handler);
}

void AddFinishedCraftingHandler(CraftingSession *session, void *userData,
                                void(*handler)(void *, std::shared_ptr<FinishedCraftingEventArgs>))
{
    session->OnFinishedCrafting.Add(userData, handler);
}

void AddAbortCraftingHandler(CraftingSession *session, void *userData,
                             void(*handler)(void *, std::shared_ptr<AbortCraftingEventArgs>))
{
    session->OnAbort.Add(userData, handler);
}

bool IsCrafting(std::shared_ptr<Character> ch)
{
    return ch->PCData->CraftingSession != nullptr;
}
