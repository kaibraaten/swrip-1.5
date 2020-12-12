#ifndef _SWRIP_IMPSCRIPT_SCRIPT_SCHEDULER_HPP_
#define _SWRIP_IMPSCRIPT_SCRIPT_SCHEDULER_HPP_

#include <memory>

class ScriptRunner;

void Schedule(std::shared_ptr<ScriptRunner> scriptRunner);
void DispatchScripts();
void AbortAllScripts();

#endif
