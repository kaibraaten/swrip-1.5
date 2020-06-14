#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"

static bool HasTakenOverdose(const Character *ch, int drug)
{
    return ch->PCData->DrugLevel[drug] >= 255
        || ch->PCData->DrugLevel[drug] > ch->PCData->Addiction[drug] + 100;
}

static void ApplyOverdose(Character *ch, int drug)
{
    ch->MentalState = urange(20, ch->MentalState + 5, 100);
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    af->Type = gsn_poison;
    af->Location = APPLY_INT;
    af->Modifier = -5;
    af->Duration = ch->PCData->DrugLevel[drug];
    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Poison });
    AffectToCharacter(ch, af);
    ch->HitPoints.Current = 1;
}

static void ApplyLumni(Character *ch, int spiceGrade)
{
    int sn = LookupSkill("sanctuary");

    if(sn < MAX_SKILL && !IsAffectedBy(ch, Flag::Affect::Sanctuary))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = sn;
        af->Location = APPLY_NONE;
        af->Modifier = 0;
        af->Duration = urange(1, ch->PCData->DrugLevel[SPICE_LUMNI]
                              - ch->PCData->Addiction[SPICE_LUMNI],
                              spiceGrade);
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Sanctuary });
        AffectToCharacter(ch, af);
    }
}

static void ApplyGlitterstim(Character *ch, int spiceGrade)
{
    int sn = LookupSkill("true sight");

    if(sn < MAX_SKILL && !IsAffectedBy(ch, Flag::Affect::TrueSight))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = sn;
        af->Location = APPLY_AC;
        af->Modifier = -10;
        af->Duration = urange(1, ch->PCData->DrugLevel[SPICE_GLITTERSTIM]
                              - ch->PCData->Addiction[SPICE_GLITTERSTIM],
                              spiceGrade);
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::TrueSight });
        AffectToCharacter(ch, af);
    }
}

static void ApplyCarsanum(Character *ch, int spiceGrade)
{
    int sn = LookupSkill("heightened awareness");

    if(sn < MAX_SKILL && !IsAffectedBy(ch, Flag::Affect::Sanctuary))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = sn;
        af->Location = APPLY_NONE;
        af->Modifier = 0;
        af->Duration = urange(1, ch->PCData->DrugLevel[SPICE_CARSANUM]
                              - ch->PCData->Addiction[SPICE_CARSANUM],
                              spiceGrade);
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Hide });
        AffectToCharacter(ch, af);
    }
}

static void ApplyRyll(Character *ch, int spiceGrade)
{
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    af->Type = -1;
    af->Location = APPLY_CON;
    af->Modifier = 4;
    af->Duration = urange(1, 2 * (ch->PCData->DrugLevel[SPICE_RYLL]
                                  - ch->PCData->Addiction[SPICE_RYLL]),
                          2 * spiceGrade);
    AffectToCharacter(ch, af);

    af = std::make_shared<Affect>();
    af->Type = -1;
    af->Location = APPLY_IMMUNE;
    af->Modifier = 1 << Flag::Ris::Poison;
    af->Duration = urange(1, 2 * (ch->PCData->DrugLevel[SPICE_RYLL]
                                  - ch->PCData->Addiction[SPICE_RYLL]),
                          2 * spiceGrade);
    AffectToCharacter(ch, af);

    af = std::make_shared<Affect>();
    af->Type = -1;
    af->Location = APPLY_HIT;
    af->Modifier = 10;
    af->Duration = urange(1, 2 * (ch->PCData->DrugLevel[SPICE_RYLL]
                                  - ch->PCData->Addiction[SPICE_RYLL]),
                          2 * spiceGrade);
    AffectToCharacter(ch, af);
}

static void ApplyAndris(Character *ch, int spiceGrade)
{
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    af->Type = -1;
    af->Location = APPLY_PARRY;
    af->Modifier = 50;
    af->Duration = urange(1, 2 * (ch->PCData->DrugLevel[SPICE_ANDRIS]
                                  - ch->PCData->Addiction[SPICE_ANDRIS]),
                          2 * spiceGrade);
    AffectToCharacter(ch, af);

    af = std::make_shared<Affect>();
    af->Type = -1;
    af->Location = APPLY_DEX;
    af->Modifier = 2;
    af->Duration = urange(1, 2 * (ch->PCData->DrugLevel[SPICE_ANDRIS]
                                  - ch->PCData->Addiction[SPICE_ANDRIS]),
                          2 * spiceGrade);
    AffectToCharacter(ch, af);
}

void do_takedrug(Character *ch, std::string argument)
{
    if(argument.empty())
    {
        ch->Echo("Use what?\r\n");
        return;
    }

    if(IsDroid(ch))
    {
        ch->Echo("That would have no affect on you.\r\n");
        return;
    }

    Object *obj = FindObject(ch, argument, true);

    if(obj == nullptr)
    {
        return;
    }

    if(obj->ItemType == ITEM_DEVICE)
    {
        ch->Echo("Try holding it first.\r\n");
        return;
    }

    if(obj->ItemType != ITEM_SPICE)
    {
        Act(AT_ACTION, "$n looks at $p and scratches $s head.",
            ch, obj, NULL, ActTarget::Room);
        Act(AT_ACTION, "You can't quite figure out what to do with $p.",
            ch, obj, NULL, ActTarget::Char);
        return;
    }

    SeparateOneObjectFromGroup(obj);

    if(obj->InObject)
    {
        Act(AT_PLAIN, "You take $p from $P.", ch, obj, obj->InObject, ActTarget::Char);
        Act(AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->InObject, ActTarget::Room);
    }

    if(ch->Fighting && GetRandomPercent() > (GetCurrentDexterity(ch) * 2 + 48))
    {
        Act(AT_MAGIC, "$n accidentally drops $p rendering it useless.", ch, obj, NULL, ActTarget::Room);
        Act(AT_MAGIC, "Oops... $p gets knocked from your hands rendering it completely useless!",
            ch, obj, NULL, ActTarget::Char);
    }
    else
    {
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, NULL))
        {
            Act(AT_ACTION, "$n takes $p.", ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You take $p.", ch, obj, NULL, ActTarget::Char);
        }

        if(IsNpc(ch))
        {
            ExtractObject(obj);
            return;
        }

        int drug = obj->Value[OVAL_SPICE_TYPE];
        SetWaitState(ch, PULSE_PER_SECOND / 4);
        GainCondition(ch, COND_THIRST, 1);
        ch->PCData->DrugLevel[drug] = umin(ch->PCData->DrugLevel[drug] + obj->Value[OVAL_SPICE_GRADE], 255);

        if(HasTakenOverdose(ch, drug))
        {
            Act(AT_POISON, "$n sputters and gags.", ch, NULL, NULL, ActTarget::Room);
            Act(AT_POISON, "You feel sick. You may have taken too much.", ch, NULL, NULL, ActTarget::Char);
            ApplyOverdose(ch, drug);
        }

        switch(drug)
        {
        default:
        case SPICE_GLITTERSTIM:
            ApplyGlitterstim(ch, obj->Value[OVAL_SPICE_GRADE]);
            break;

        case SPICE_CARSANUM:
            ApplyCarsanum(ch, obj->Value[OVAL_SPICE_GRADE]);
            break;

        case SPICE_LUMNI:
            ApplyLumni(ch, obj->Value[OVAL_SPICE_GRADE]);
            break;

        case SPICE_RYLL:
            ApplyRyll(ch, obj->Value[OVAL_SPICE_GRADE]);
            break;

        case SPICE_ANDRIS:
            ApplyAndris(ch, obj->Value[OVAL_SPICE_GRADE]);
            break;
        }
    }

    if(cur_obj == obj->Serial)
        global_objcode = rOBJ_EATEN;

    ExtractObject(obj);
}
