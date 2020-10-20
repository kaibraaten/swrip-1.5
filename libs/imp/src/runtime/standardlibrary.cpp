#include <iostream>
#include "imp/runtime/standardlibrary.hpp"
#include "imp/runtime/functionvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/floatvalue.hpp"
#include "imp/runtime/dictvalue.hpp"
#include "imp/runtime/listvalue.hpp"

namespace Imp
{
    static void CheckNumParams(const std::vector<std::shared_ptr<RuntimeValue>> &actArgs, int nCorrect, const std::string &id, ImpSyntax *where)
    {
        if(actArgs.size() != nCorrect)
        {
            RuntimeValue::RuntimeError("Wrong number of parameters to " + id + "!", where);
        }
    }

    class RangeFunc : public FunctionValue
    {
    public:
        RangeFunc()
            : FunctionValue("range")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 2, "range", where);
            auto v1 = actualParams[0];
            auto v2 = actualParams[1];

            if((dynamic_cast<IntValue *>(v1.get())) == nullptr
               || (dynamic_cast<IntValue *>(v2.get())) == nullptr)
            {
                RuntimeValue::RuntimeError("Type error in range().", where);
            }

            std::deque<std::shared_ptr<RuntimeValue>> range;

            for(long i = v1->GetIntValue("range() param1", where);
                i < v2->GetIntValue("range() param2", where);
                ++i)
            {
                range.push_back(std::make_shared<IntValue>(i));
            }

            return std::make_shared<ListValue>(range);
        }
    };

    class InputFunc : public FunctionValue
    {
    public:
        InputFunc()
            : FunctionValue("input")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "input", where);
            auto v1 = actualParams[0];

            if((dynamic_cast<IntValue *>(v1.get())) == nullptr)
            {
                RuntimeValue::RuntimeError("Type error in input().", where);
            }

            std::cout << v1->GetStringValue("input() param", where);
            std::string line;
            std::getline(std::cin, line);
            return std::make_shared<StringValue>(line);
        }
    };

    class StrFunc : public FunctionValue
    {
    public:
        StrFunc()
            : FunctionValue("str")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "str", where);
            auto v1 = actualParams[0];
            return v1->EvalStr(where);
        }
    };

    class IntFunc : public FunctionValue
    {
    public:
        IntFunc()
            : FunctionValue("int")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "int", where);
            auto param = actualParams[0];
            std::shared_ptr<IntValue> retVal;

            if(dynamic_cast<StringValue *>(param.get()))
            {
                long value = 0; // param.getStringValue("int() param", where)

                if(cantConvert)
                {
                    RuntimeValue::RuntimeError("Could not convert value to int: " + param->ShowInfo(), where);
                }

                retVal = std::make_shared<IntValue>(value);
            }
            else if(dynamic_cast<IntValue *>(param.get())
                    || dynamic_cast<FloatValue *>(param.get()))
            {
                retVal = std::make_shared<IntValue>((long)param->GetFloatValue("int() param", where));
            }
            else
            {
                RuntimeValue::RuntimeError("Type error for int().", where);
            }

            return retVal;
        }
    };

    ///////////////////////////////////////////////////////////////////////////////
    // Standard library scope
    StandardLibrary::StandardLibrary(std::shared_ptr<RuntimeScope> outer)
        : RuntimeScope(outer)
    {
        Assign("range", std::make_shared<RangeFunc>());
        Assign("input", std::make_shared<InputFunc>());
        Assign("str", std::make_shared<StrFunc>());
    }
}
