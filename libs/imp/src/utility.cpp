#include "imp/utility.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    void CheckNumParams(const std::vector<std::shared_ptr<RuntimeValue>> &actArgs,
                        int nCorrect, const std::string &id, const ImpSyntax *where)
    {
        if(actArgs.size() != nCorrect)
        {
            RuntimeValue::RuntimeError("Wrong number of parameters to " + id + "!", where);
        }
    }
}
