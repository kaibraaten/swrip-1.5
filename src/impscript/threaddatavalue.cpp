#include "threaddatavalue.hpp"

ThreadDataValue::ThreadDataValue(std::condition_variable &scriptDone,
                                 std::condition_variable &wakeUp)
    : ScriptDone(scriptDone),
      WakeUp(wakeUp)
{

}

std::string ThreadDataValue::TypeName()
{
    return "threaddata";
}

std::string ThreadDataValue::ShowInfo()
{
    return TypeName();
}
