#include <imp/utility.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/skill_func.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

SkillFunc::SkillFunc()
    : Imp::FunctionValue("skill")
{

}

// If 1st param is Character, echo to that character.
std::shared_ptr<Imp::RuntimeValue> SkillFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "skill", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    std::shared_ptr<Character> ch;
    std::string skillName;
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in skill() param 1.", where);
    }

    if(dynamic_cast<Imp::StringValue*>(arg2.get()))
    {
        skillName = arg2->GetStringValue("skill() param 2", where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in skill() param 2.", where);
    }

    int gsn = LookupSkill(skillName);

    if(gsn == -1)
    {
        Imp::RuntimeValue::RuntimeError("Unknown skill: " + skillName, where);
    }

    return std::make_shared<Imp::IntValue>(GetSkillLevel(ch, gsn));
}
