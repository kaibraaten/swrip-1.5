#include <imp/runtime/stringvalue.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "impscript/impcharacter.hpp"
#include "impscript/imp.hpp"

void do_questlog(std::shared_ptr<Character> ch, std::string arguments)
{
    if(IsNpc(ch))
    {
        return;
    }

    std::vector<std::shared_ptr<Imp::RuntimeValue>> params =
        {
            std::make_shared<ImpCharacter>(ch),
            std::make_shared<Imp::StringValue>(arguments)
        };
    DispatchImpFunction("do_questlog",
                        params,
                        {"from commands.questlog import *"},
                        "<do_questlog>");
}
