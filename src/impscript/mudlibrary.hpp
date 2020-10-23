#ifndef _SWRIP_IMPSCRIPT_MUDLIBRARY_HPP_
#define _SWRIP_IMPSCRIPT_MUDLIBRARY_HPP_

#include <imp/runtime/runtimescope.hpp>

class MudLibrary : public Imp::RuntimeScope
{
public:
    MudLibrary(std::shared_ptr<Imp::RuntimeScope> outer = nullptr);
};

#endif
