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
#include <utility/oldevent.hpp>
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

class CraftingSession
{
public:
    Ceris::OldEvent<InterpretArgumentsEventArgs *> OnInterpretArguments;
    Ceris::OldEvent<CheckRequirementsEventArgs *> OnCheckRequirements;
    Ceris::OldEvent<MaterialFoundEventArgs *> OnMaterialFound;
    Ceris::OldEvent<SetObjectStatsEventArgs *> OnSetObjectStats;
    Ceris::OldEvent<FinishedCraftingEventArgs *> OnFinishedCrafting;
    Ceris::OldEvent<AbortCraftingEventArgs *> OnAbort;

    std::shared_ptr<Character> Engineer;
    CraftRecipe *Recipe = nullptr;
    FoundMaterial *FoundMaterials = nullptr;
    std::string CommandArgument;
};

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
static void FinishedCraftingHandler(void *userData, FinishedCraftingEventArgs *eventArgs);
static void CheckRequirementsHandler(void *userData, CheckRequirementsEventArgs *args);

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
    CraftRecipe *recipe = session->Recipe;
    std::shared_ptr<Character> ch = session->Engineer;
    int the_chance = ch->PCData->Learned[recipe->Skill];
    bool hasMaterials = CheckMaterials(session, true);
    int level = ch->PCData->Learned[recipe->Skill];
    std::shared_ptr<ProtoObject> proto = recipe->Prototype;
    std::string itemType = GetItemTypeNameExtended(proto->ItemType, proto->Value[OVAL_WEAPON_TYPE]);
    SetObjectStatsEventArgs eventArgs;
    FinishedCraftingEventArgs finishedCraftingEventArgs;

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

    eventArgs.CraftingSession = session;
    eventArgs.Object = object;
    session->OnSetObjectStats(&eventArgs);

    object = ObjectToCharacter(object, ch);

    finishedCraftingEventArgs.CraftingSession = session;
    finishedCraftingEventArgs.Object = object;
    session->OnFinishedCrafting(&finishedCraftingEventArgs);

    FreeCraftingSession(session);
}

static void FinishedCraftingHandler(void *userData, FinishedCraftingEventArgs *eventArgs)
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

static void CheckRequirementsHandler(void *userData, CheckRequirementsEventArgs *args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CraftingSession->Recipe->Flags.test(Flag::Crafting::NeedsWorkshop)
       && !CheckRoomFlag(ch->InRoom, Flag::Room::Factory))
    {
        ch->Echo("&RYou need to be in a factory or workshop to do that.&d\r\n");
        args->AbortSession = true;
    }

    if(args->CraftingSession->Recipe->Flags.test(Flag::Crafting::NeedsRefinery)
       && !CheckRoomFlag(ch->InRoom, Flag::Room::Refinery))
    {
        ch->Echo("&RYou need to be in a refinery to do that.&d\r\n");
        args->AbortSession = true;
    }
}

static void AbortSession(CraftingSession *session)
{
    auto ch = session->Engineer;
    AbortCraftingEventArgs abortEventArgs;

    ch->SubState = SUB_NONE;
    abortEventArgs.CraftingSession = session;

    ch->Echo("&RYou are interrupted and fail to finish your work.&d\r\n");

    session->OnAbort(&abortEventArgs);

    FreeCraftingSession(session);
}

std::shared_ptr<Character> GetEngineer(const CraftingSession *session)
{
    return session->Engineer;
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

    session->Engineer = engineer;
    session->Recipe = recipe;
    session->FoundMaterials = AllocateFoundMaterials(recipe->Materials);
    session->CommandArgument = commandArgument;

    engineer->PCData->CraftingSession = session;

    AddCheckRequirementsCraftingHandler(session, NULL, CheckRequirementsHandler);

    return session;
}

void FreeCraftingSession(CraftingSession *session)
{
    FreeCraftRecipe(session->Recipe);
    delete[] session->FoundMaterials;

    if(session->Engineer)
    {
        session->Engineer->PCData->CraftingSession = NULL;
    }

    delete session;
}

static bool CheckSkillLevel(const CraftingSession *session)
{
    auto ch = session->Engineer;
    int the_chance = IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[session->Recipe->Skill]);

    if(GetRandomPercent() >= the_chance)
    {
        ch->Echo("&RYou can't figure out what to do.&d\r\n");
        LearnFromFailure(ch, session->Recipe->Skill);
        return false;
    }

    return true;
}

void StartCrafting(CraftingSession *session)
{
    auto ch = session->Engineer;
    InterpretArgumentsEventArgs interpretArgumentsEventArgs;
    CheckRequirementsEventArgs checkRequirementsEventArgs;

    interpretArgumentsEventArgs.CraftingSession = session;
    interpretArgumentsEventArgs.CommandArguments = session->CommandArgument;
    interpretArgumentsEventArgs.AbortSession = false;

    checkRequirementsEventArgs.CraftingSession = session;
    checkRequirementsEventArgs.AbortSession = false;

    session->OnInterpretArguments(&interpretArgumentsEventArgs);

    if(!interpretArgumentsEventArgs.AbortSession)
    {
        session->OnCheckRequirements(&checkRequirementsEventArgs);
    }

    if(interpretArgumentsEventArgs.AbortSession
       || checkRequirementsEventArgs.AbortSession
       || !CheckMaterials(session, false)
       || !CheckSkillLevel(session))
    {
        AbortCraftingEventArgs abortEventArgs;
        abortEventArgs.CraftingSession = session;

        session->OnAbort(&abortEventArgs);
        FreeCraftingSession(session);
        return;
    }

    std::shared_ptr<ProtoObject> obj = session->Recipe->Prototype;

    ch->Echo("&GYou begin the long process of creating %s.&d\r\n",
             AOrAn(GetItemTypeNameExtended(obj->ItemType, obj->Value[OVAL_WEAPON_TYPE])).c_str());

    Act(AT_PLAIN, "$n takes $s tools and some material and begins to work.",
        ch, NULL, NULL, ActTarget::Room);
    AddTimerToCharacter(ch, TIMER_CMD_FUN, session->Recipe->Duration, do_craftingengine, SUB_PAUSE);
}

static bool CheckMaterials(CraftingSession *session, bool extract)
{
    std::shared_ptr<Character> ch = GetEngineer(session);
    bool foundAll = true;
    FoundMaterial *material = NULL;

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
            MaterialFoundEventArgs args;
            args.CraftingSession = session;
            args.Object = obj;
            args.KeepFinding = false;

            if(material->Material.Flags.test(Flag::Crafting::Extract))
            {
                SeparateOneObjectFromGroup(obj);
                ObjectFromCharacter(obj);
                ExtractObject(obj);
            }

            session->OnMaterialFound(&args);
            material->KeepFinding = args.KeepFinding;
        }
    }

    material = session->FoundMaterials;

    while(material->Material.ItemType != ITEM_NONE)
    {
        if(!material->Found
           && !material->Material.Flags.test(Flag::Crafting::Optional))
        {
            std::shared_ptr<ProtoObject> proto = session->Recipe->Prototype;
            std::string itemTypeName = GetItemTypeNameExtended(material->Material.ItemType, 0);
            ReplaceChar(itemTypeName, '_', ' ');
            foundAll = false;
            ch->Echo("&RYou need %s to complete the %s.&d\r\n",
                     AOrAn(itemTypeName).c_str(),
                     GetItemTypeNameExtended(proto->ItemType, proto->Value[OVAL_WEAPON_TYPE]).c_str());
        }

        ++material;
    }

    delete[] session->FoundMaterials;
    session->FoundMaterials = AllocateFoundMaterials(session->Recipe->Materials);

    return foundAll;
}

static FoundMaterial *GetUnfoundMaterial(const CraftingSession *session, std::shared_ptr<Object> obj)
{
    FoundMaterial *material = session->FoundMaterials;

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
                                          void(*handler)(void *, InterpretArgumentsEventArgs *))
{
    session->OnInterpretArguments.Add(userData, handler);
}

void AddCheckRequirementsCraftingHandler(CraftingSession *session, void *userData,
                                         void(*handler)(void *, CheckRequirementsEventArgs *))
{
    session->OnCheckRequirements.Add(userData, handler);
}

void AddMaterialFoundCraftingHandler(CraftingSession *session, void *userData,
                                     void(*handler)(void *, MaterialFoundEventArgs *))
{
    session->OnMaterialFound.Add(userData, handler);
}

void AddSetObjectStatsCraftingHandler(CraftingSession *session, void *userData,
                                      void(*handler)(void *, SetObjectStatsEventArgs *))
{
    session->OnSetObjectStats.Add(userData, handler);
}

void AddFinishedCraftingHandler(CraftingSession *session, void *userData,
                                void(*handler)(void *, FinishedCraftingEventArgs *))
{
    session->OnFinishedCrafting.Add(userData, handler);
}

void AddAbortCraftingHandler(CraftingSession *session, void *userData,
                             void(*handler)(void *, AbortCraftingEventArgs *))
{
    session->OnAbort.Add(userData, handler);
}

bool IsCrafting(std::shared_ptr<Character> ch)
{
    return ch->PCData->CraftingSession != nullptr;
}
