#ifndef _IMP_UTILITY_HPP_
#define _IMP_UTILITY_HPP_

#include <vector>
#include <memory>
#include <string>

namespace Imp
{
    class RuntimeValue;
    class ImpSyntax;
    
    void CheckNumParams(const std::vector<std::shared_ptr<RuntimeValue>> &actArgs,
                        int nCorrect, const std::string &id, const ImpSyntax *where);
}

#endif
