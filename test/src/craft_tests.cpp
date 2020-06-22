#include <string>
#include <vector>
#include <cassert>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "object.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "protoobject.hpp"
#include "descriptor.hpp"
#include "room.hpp"
#include "craft.hpp"
#include "log.hpp"
#include "fakelogger.hpp"
#include "area.hpp"
#include "repos/objectrepository.hpp"
#include "repos/skillrepository.hpp"
#include "repos/homerepository.hpp"
#include "skill.hpp"

constexpr short gsn_mycraftingskill = 0;

static void CleanupCharacter(std::shared_ptr<Character> ch)
{
    auto timer = GetTimerPointer(ch, TIMER_CMD_FUN);

    if(timer != nullptr)
    {
        ExtractTimer(ch, timer);
    }

    while(!ch->Objects().empty())
    {
        auto obj = ch->Objects().front();
        ObjectFromCharacter(obj);
    }

    ch->PCData->CraftingSession = nullptr;
}

class NotRandomGenerator : public RandomGenerator
{
public:
    long GetRandomNumber(long min, long max) override
    {
        return (min + max) / 2;
    }

    long GetRandomPercent() override
    {
        return 50;
    }

    long RollDice(size_t numberOfDice, size_t numberOfSides) override
    {
        return numberOfDice * numberOfSides;
    }
};

class FakeObjectRepository : public ObjectRepository
{

};

class FakeSkillRepository : public SkillRepository
{
public:
    FakeSkillRepository()
    {
        _myCraftingSkill->Name = "makesomething";
        SkillTable[gsn_mycraftingskill] = _myCraftingSkill;
    }

    ~FakeSkillRepository()
    {
        SkillTable[gsn_mycraftingskill] = nullptr;
    }

    std::shared_ptr<Skill> GetSkill(int sn) override
    {
        return sn == gsn_mycraftingskill ? _myCraftingSkill : nullptr;
    }

    int LookupSkill(const std::string &name) override
    {
        return !StrCmp(name, _myCraftingSkill->Name) ? gsn_mycraftingskill : -1;
    }

private:
    std::shared_ptr<Skill> _myCraftingSkill = std::make_shared<Skill>();
};

class FakeHomeRepository : public HomeRepository
{
public:
    void Load() override
    {
    }
    void Save() const override
    {
    }

    void Load(std::shared_ptr<Home> home) override
    {
    }
    void Save(std::shared_ptr<Home> home) const override
    {
    }

    void Delete(std::shared_ptr<Home> home) override
    {
    }

    std::shared_ptr<Home> FindByVnum(vnum_t) const override
    {
        return nullptr;
    }
    std::list<std::shared_ptr<Home>> FindHomesForResident(const std::string &name) const override
    {
        return std::list<std::shared_ptr<Home>>();
    }

    bool IsResidentOf(const std::string &name, vnum_t room) const override
    {
        return false;
    }
};

class CraftTests : public ::testing::Test
{
protected:
    void SetUp() override
    {
        Log = new FakeLogger();
        Objects = new FakeObjectRepository();
        Skills = new FakeSkillRepository();
        Homes = std::make_shared<FakeHomeRepository>();

        SetRandomGenerator(new NotRandomGenerator());

        _resultantObject = std::make_shared<ProtoObject>(1);
        _resultantObject->Name = "crafted thingy";

        _location = std::make_shared<Room>();
        _area = std::make_shared<Area>();
        _location->Area = _area;
        _location->Flags = CreateBitSet<Flag::MAX>({ Flag::Room::Factory, Flag::Room::Refinery });

        _engineer = std::make_shared<Character>(std::make_unique<PCData>());
        MapCharacterAndDescriptor(_engineer, std::make_shared<NullDescriptor>());
        _engineer->PCData->Learned[gsn_mycraftingskill] = 100;

        CharacterToRoom(_engineer, _location);
    }

    void TearDown() override
    {
        CleanupCharacter(_engineer);
        _engineer = nullptr;

        _resultantObject = nullptr;
        _location = nullptr;

        _area = nullptr;

        delete Skills;
        Skills = nullptr;

        delete Objects;
        Objects = nullptr;

        delete Log;
        Log = nullptr;
    }

    std::list<std::shared_ptr<Object>> MakeMaterials() const
    {
        std::list<std::shared_ptr<Object>> output;

        for(const auto &m : _materials)
        {
            if(m.ItemType == ITEM_NONE)
            {
                continue;
            }

            std::shared_ptr<ProtoObject> proto = std::make_shared<ProtoObject>(GetNewVnum());
            proto->ItemType = m.ItemType;
            auto obj = std::make_shared<Object>(proto, 100);
            output.push_back(obj);

            assert(obj->ItemType == obj->Prototype->ItemType);
        }

        return output;
    }

    vnum_t GetNewVnum() const
    {
        return ++_lastVnum;
    }

    std::shared_ptr<Character> _engineer;
    std::shared_ptr<ProtoObject> _resultantObject;
    std::shared_ptr<Room> _location;
    std::shared_ptr<Area> _area;
    static const std::vector<CraftingMaterial> _materials;
    static vnum_t _lastVnum;
};

vnum_t CraftTests::_lastVnum = INVALID_VNUM;

const std::vector<CraftingMaterial> CraftTests::_materials =
{
 { ITEM_TOOLKIT,        {} },
 { ITEM_OVEN,           {} },
 { ITEM_LENS,           { Flag::Crafting::Extract } },
 { ITEM_CRYSTAL,        { Flag::Crafting::Extract } },
 { ITEM_MIRROR,         { Flag::Crafting::Extract } },
 { ITEM_DURAPLAST,      { Flag::Crafting::Extract } },
 { ITEM_BATTERY,        { Flag::Crafting::Extract } },
 { ITEM_CIRCUIT,        { Flag::Crafting::Extract } },
 { ITEM_SUPERCONDUCTOR, { Flag::Crafting::Extract } },
 { ITEM_NONE,           {} }
};

template<typename EventArgs>
static void Counting_EventHandler(int *callCounter, EventArgs e)
{
    ++(*callCounter);
}

TEST_F(CraftTests, InterpretArgumentsHandler_IsCalledExactlyOnce)
{
    int callCounter = 0;
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnInterpretArguments.Add(&callCounter, Counting_EventHandler<std::shared_ptr<InterpretArgumentsEventArgs>>);

    StartCrafting(session);

    EXPECT_EQ(callCounter, 1);
}

TEST_F(CraftTests, CheckRequirementsHandler_IsCalledExactlyOnce)
{
    int callCounter = 0;
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnCheckRequirements.Add(&callCounter, Counting_EventHandler<std::shared_ptr<CheckRequirementsEventArgs>>);

    StartCrafting(session);

    EXPECT_EQ(callCounter, 1);
}

template<typename EventArgs>
static void Failing_EventHandler(EventArgs e)
{
    e->AbortSession = true;
}

TEST_F(CraftTests, When_InterpretArgumentsHandler_Fails_SessionNotStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnInterpretArguments.Add(Failing_EventHandler<std::shared_ptr<InterpretArgumentsEventArgs>>);

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

TEST_F(CraftTests, When_CheckRequirementsHandler_Fails_SessionNotStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnCheckRequirements.Add(Failing_EventHandler<std::shared_ptr<CheckRequirementsEventArgs>>);

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

template<typename EventArgs>
static void DoNothing_EventHandler(EventArgs e)
{
    // Intentionally empty
}

TEST_F(CraftTests, When_CheckArgumentsHandler_Succeeds_SessionIsStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnCheckRequirements.Add(DoNothing_EventHandler<std::shared_ptr<CheckRequirementsEventArgs>>);

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, When_InterpretArgumentsHandler_Succeeds_SessionIsStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnInterpretArguments.Add(DoNothing_EventHandler<std::shared_ptr<InterpretArgumentsEventArgs>>);

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenUnskilled_SessionNotStarted)
{
    const CraftingMaterial material;
    _engineer->PCData->Learned[gsn_mycraftingskill] = 0;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenSkilled_SessionIsStarted)
{
    const CraftingMaterial material;
    _engineer->PCData->Learned[gsn_mycraftingskill] = 100;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenUnskilled_AbortCraftingHandler_IsCalledExactlyOnce)
{
    int callCounter = 0;
    const CraftingMaterial material;
    _engineer->PCData->Learned[gsn_mycraftingskill] = 0;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnAbort.Add(&callCounter, Counting_EventHandler<std::shared_ptr<AbortCraftingEventArgs>>);

    StartCrafting(session);

    EXPECT_EQ(callCounter, 1);
}

TEST_F(CraftTests, When_InterpretArgumentsHandler_Fails_AbortCraftingHandler_IsCalledExactlyOnce)
{
    const CraftingMaterial material;
    int callCounter = 0;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnInterpretArguments.Add(Failing_EventHandler<std::shared_ptr<InterpretArgumentsEventArgs>>);
    session->OnAbort.Add(&callCounter, Counting_EventHandler<std::shared_ptr<AbortCraftingEventArgs>>);

    StartCrafting(session);

    EXPECT_EQ(callCounter, 1);
}

TEST_F(CraftTests, When_CheckRequirementsHandler_Fails_AbortCraftingHandler_IsCalledExactlyOnce)
{
    int callCounter = 0;
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnCheckRequirements.Add(Failing_EventHandler<std::shared_ptr<CheckRequirementsEventArgs>>);
    session->OnAbort.Add(&callCounter, Counting_EventHandler<std::shared_ptr<AbortCraftingEventArgs>>);

    StartCrafting(session);

    EXPECT_EQ(callCounter, 1);
}

TEST_F(CraftTests, WhenMissingAllMaterials_SessionNotStarted)
{
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, _materials.data(), 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenMissingSomeMaterials_SessionNotStarted)
{
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, _materials.data(), 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");

    auto objects = MakeMaterials();
    int i = 0;

    for(auto obj : objects)
    {
        if(++i % 2 == 0)
        {
            ObjectToCharacter(obj, _engineer);
        }
    }

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenHasAllMaterials_SessionIsStarted)
{
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, _materials.data(), 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");

    auto objects = MakeMaterials();

    for(auto obj : objects)
    {
        ObjectToCharacter(obj, _engineer);
    }

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenMissingOptionalMaterials_SessionIsStarted)
{
    auto materials = _materials;

    int i = 0;
    for(auto m : materials)
    {
        if(i % 2 == 0)
        {
            m.Flags.reset(Flag::Crafting::Optional);
        }
    }

    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, materials.data(), 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");

    auto objects = MakeMaterials();

    for(auto obj : objects)
    {
        if(find_if(std::begin(materials), std::end(materials),
                   [obj](const auto m)
                   {
                       return m.Flags.test(Flag::Crafting::Optional)
                           && m.ItemType == obj->ItemType;
                   }) == std::end(materials))
        {
            ObjectToCharacter(obj, _engineer);
        }
    }

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenWorkshopRequired_IfNotInWorkshop_SessionNotStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, { Flag::Crafting::NeedsWorkshop });
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    _engineer->InRoom->Flags.reset(Flag::Room::Factory);

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenWorkshopRequired_IfInWorkshop_SessionIsStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, { Flag::Crafting::NeedsWorkshop });
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    _engineer->InRoom->Flags.set(Flag::Room::Factory);

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenRefineryRequired_IfNotInRefinery_SessionNotStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, { Flag::Crafting::NeedsRefinery });
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    _engineer->InRoom->Flags.reset(Flag::Room::Refinery);

    StartCrafting(session);

    EXPECT_FALSE(IsCrafting(_engineer));
}

TEST_F(CraftTests, WhenRefineryRequired_IfInRefinery_SessionIsStarted)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, { Flag::Crafting::NeedsRefinery });
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    _engineer->InRoom->Flags.set(Flag::Room::Refinery);

    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, AfterStartCrafting_CharacterHas_DoFunTimer)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    StartCrafting(session);

    auto timer = GetTimerPointer(_engineer, TIMER_CMD_FUN);

    EXPECT_NE(timer, nullptr);
}

#ifndef DEACTIVATE_FAILING_TESTS
TEST_F(CraftTests, AfterStartCrafting_CharacterHas_Correct_DoFunTimer)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    StartCrafting(session);

    auto timer = GetTimerPointer(_engineer, TIMER_CMD_FUN);

    EXPECT_EQ(timer->DoFun, &do_craftingengine);
}
#endif

TEST_F(CraftTests, AfterStartCrafting_CharacterIsCrafting)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    StartCrafting(session);

    EXPECT_TRUE(IsCrafting(_engineer));
}

TEST_F(CraftTests, AfterCallback_CharacterNoLongerCrafting)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    StartCrafting(session);
    auto timer = GetTimerPointer(_engineer, TIMER_CMD_FUN);
    _engineer->SubState = timer->Value;

    timer->DoFun(_engineer, "");

    EXPECT_FALSE(IsCrafting(_engineer));
}

static bool HasObjectInstanceOf(std::shared_ptr<Character> ch, std::shared_ptr<ProtoObject> proto)
{
    return Find(ch->Objects(),
                [proto](const auto obj)
                {
                    return obj->Prototype == proto;
                }) != nullptr;
}

TEST_F(CraftTests, AfterCallback_CharacterReceivedObject)
{
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    StartCrafting(session);
    auto timer = GetTimerPointer(_engineer, TIMER_CMD_FUN);
    _engineer->SubState = timer->Value;

    timer->DoFun(_engineer, "");

    EXPECT_TRUE(HasObjectInstanceOf(_engineer, _resultantObject));
}

TEST_F(CraftTests, AfterCallback_SetObjectStatsEventHandler_IsCalledExactlyOnce)
{
    int callCounter = 0;
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnSetObjectStats.Add(&callCounter, Counting_EventHandler<std::shared_ptr<SetObjectStatsEventArgs>>);
    StartCrafting(session);
    auto timer = GetTimerPointer(_engineer, TIMER_CMD_FUN);
    _engineer->SubState = timer->Value;

    timer->DoFun(_engineer, "");

    EXPECT_EQ(callCounter, 1);
}

TEST_F(CraftTests, AfterCallback_FinishedCraftingEventHandler_IsCalledExactlyOnce)
{
    int callCounter = 0;
    const CraftingMaterial material;
    auto recipe = AllocateCraftRecipe(gsn_mycraftingskill, &material, 0,
                                      _resultantObject, {});
    auto session = AllocateCraftingSession(recipe, _engineer, "");
    session->OnFinishedCrafting.Add(&callCounter, Counting_EventHandler<std::shared_ptr<FinishedCraftingEventArgs>>);

    StartCrafting(session);
    auto timer = GetTimerPointer(_engineer, TIMER_CMD_FUN);
    _engineer->SubState = timer->Value;

    timer->DoFun(_engineer, "");

    EXPECT_EQ(callCounter, 1);
}
