#include <deque>
#include <imp/utility.hpp>
#include <imp/runtime/listvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/funcs/characters_func.hpp"
#include "room.hpp"

CharactersFunc::CharactersFunc()
    : Imp::FunctionValue("characters")
{

}

std::shared_ptr<Imp::RuntimeValue> CharactersFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "characters", where);
    auto room = actualParams[0];

    if((dynamic_cast<ImpRoom*>(room.get())))
    {
        auto r = std::dynamic_pointer_cast<ImpRoom>(room)->Entity(where);
        std::deque<std::shared_ptr<Imp::RuntimeValue>> listData;

        for(auto ch : r->Characters())
        {
            listData.push_back(std::make_shared<ImpCharacter>(ch));
        }
        
        return std::make_shared<Imp::ListValue>(listData);
    }
    
    Imp::RuntimeValue::RuntimeError("Type error in characters().", where);
    return nullptr;
}
