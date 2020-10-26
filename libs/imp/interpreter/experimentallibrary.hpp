#ifndef _IMP_INTERPRETER_EXPERIMENTAL_LIBRARY_HPP_
#define _IMP_INTERPRETER_EXPERIMENTAL_LIBRARY_HPP_

#include <memory>
#include <imp/runtime/runtimescope.hpp>
#include <imp/parser/program.hpp>

class ScriptRunner
{
public:
    ScriptRunner(std::shared_ptr<Imp::Program> prog, std::shared_ptr<Imp::RuntimeScope> scope);
    ~ScriptRunner();
    double Resume();

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

class ExperimentalLibrary : public Imp::RuntimeScope
{
public:
    ExperimentalLibrary(std::shared_ptr<Imp::RuntimeScope> outer = nullptr);
};

#endif
