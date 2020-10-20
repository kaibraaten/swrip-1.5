#ifndef _IMP_RUNTIME_STANDARDLIBRARY_HPP_
#define _IMP_RUNTIME_STANDARDLIBRARY_HPP_

#include <imp/runtime/runtimescope.hpp>

namespace Imp
{
    class StandardLibrary : public RuntimeScope
    {
    public:
        StandardLibrary(std::shared_ptr<RuntimeScope> outer = nullptr);
    };
}

#endif
