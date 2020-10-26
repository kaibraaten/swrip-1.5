#ifndef _SWRIP_IMPSCRIPT_SCRIPTRUNNER_HPP_
#define _SWRIP_IMPSCRIPT_SCRIPTRUNNER_HPP_

#include <functional>
#include <memory>
#include <imp/runtime/runtimescope.hpp>
#include <imp/parser/program.hpp>

class ScriptRunner
{
public:
    ScriptRunner(std::shared_ptr<Imp::Program> prog,
                 std::shared_ptr<Imp::RuntimeScope> scope,
                 std::function<void(std::shared_ptr<Imp::Program>, std::shared_ptr<Imp::RuntimeScope>)> doAfterEval);
    ~ScriptRunner();
    double Resume();

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
