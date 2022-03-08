#ifndef _SWRIP_IMPSCRIPT_IMP_HPP_
#define _SWRIP_IMPSCRIPT_IMP_HPP_

#include <memory>
#include <string>
#include <vector>
#include <imp/runtime/runtimevalue.hpp>
#include <imp/runtime/runtimescope.hpp>
#include <imp/parser/program.hpp>

std::shared_ptr<Imp::RuntimeScope> MakeImpScope();
std::shared_ptr<Imp::Program> ParseImpProgram(const std::string &scriptname,
                                              const std::vector<std::string> &code);
void DispatchImpFunction(const std::string &funcName,
                         const std::vector<std::shared_ptr<Imp::RuntimeValue>> params,
                         const std::vector<std::string> &code,
                         const std::string &scriptname);

#endif
