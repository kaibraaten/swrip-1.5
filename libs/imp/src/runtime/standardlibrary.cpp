#include <iostream>
#include <sstream>
#include <cstdlib>
#include "imp/runtime/standardlibrary.hpp"
#include "imp/runtime/functionvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/floatvalue.hpp"
#include "imp/runtime/dictvalue.hpp"
#include "imp/runtime/listvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/utility.hpp"

namespace Imp
{
    class RangeFunc : public FunctionValue
    {
    public:
        RangeFunc()
            : FunctionValue("range")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
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

            for(int64_t i = v1->GetIntValue("range() param1", where);
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

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "input", where);
            auto v1 = actualParams[0];

            if((dynamic_cast<StringValue *>(v1.get())) == nullptr)
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

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "str", where);
            auto v1 = actualParams[0];
            return v1->EvalStr(where);
        }
    };

    class ListFunc : public FunctionValue
    {
    public:
        ListFunc()
            : FunctionValue("list")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "list", where);
            auto arg1 = actualParams[0];
            return arg1->EvalList(where);
        }
    };

    class IntFunc : public FunctionValue
    {
    public:
        IntFunc()
            : FunctionValue("int")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "int", where);
            auto param = actualParams[0];
            std::shared_ptr<IntValue> retVal;

            if(dynamic_cast<StringValue *>(param.get()))
            {
                std::string asStr = param->GetStringValue("int() param", where);

                if(InvalidInt(asStr))
                {
                    RuntimeValue::RuntimeError("Could not convert value to int: " + param->ShowInfo(), where);
                }

                retVal = std::make_shared<IntValue>(std::stol(asStr));
            }
            else if(dynamic_cast<IntValue *>(param.get())
                    || dynamic_cast<FloatValue *>(param.get()))
            {
                retVal = std::make_shared<IntValue>((int64_t)param->GetFloatValue("int() param", where));
            }
            else
            {
                RuntimeValue::RuntimeError("Type error for int().", where);
            }

            return retVal;
        }

    private:
        bool InvalidInt(const std::string &n) const
        {
            int start = 0;

            if(n[0] == '+' || n[0] == '-')
            {
                ++start;
            }

            for(int i = start; i < n.size(); ++i)
            {
                if(n[i] < '0' || n[i] > '9')
                {
                    return true;
                }
            }

            return false;
        }
    };

    class FloatFunc : public FunctionValue
    {
    public:
        FloatFunc()
            : FunctionValue("float")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "float", where);
            auto param = actualParams[0];
            std::shared_ptr<FloatValue> retVal;

            if(dynamic_cast<StringValue *>(param.get()))
            {
                std::string asStr = param->GetStringValue("float() param", where);

                if(InvalidFloat(asStr))
                {
                    RuntimeValue::RuntimeError("Could not convert value to float: " + param->ShowInfo(), where);
                }

                retVal = std::make_shared<FloatValue>(std::stod(asStr));
            }
            else if(dynamic_cast<IntValue *>(param.get())
                    || dynamic_cast<FloatValue *>(param.get()))
            {
                retVal = std::make_shared<FloatValue>(param->GetFloatValue("float() param", where));
            }
            else
            {
                RuntimeValue::RuntimeError("Type error for float().", where);
            }

            return retVal;
        }

    private:
        bool InvalidFloat(const std::string &n) const
        {
            int start = 0;
            int puncts = 0;

            if(n[0] == '+' || n[0] == '-')
            {
                ++start;
            }

            for(int i = start; i < n.size(); ++i)
            {
                if(n[i] == '.')
                {
                    ++puncts;

                    if(puncts > 1)
                    {
                        return true;
                    }
                }
                else if(n[i] < '0' || n[i] > '9')
                {
                    return true;
                }
            }

            return false;
        }
    };

    class PrintFunc : public FunctionValue
    {
    public:
        PrintFunc()
            : FunctionValue("print")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            std::ostringstream output;
            bool isFirst = true;

            for(auto param : actualParams)
            {
                if(!isFirst)
                {
                    output << " ";
                }

                output << param->EvalStr(where)->GetStringValue("print() param", where);
                isFirst = false;
            }

            std::cout << output.str() << std::endl;
            return std::make_shared<NoneValue>();
        }
    };

    class LenFunc : public FunctionValue
    {
    public:
        LenFunc()
            : FunctionValue("len")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "len", where);
            auto v1 = actualParams[0];
            return v1->EvalLen(where);
        }
    };

    class TypeFunc : public FunctionValue
    {
    public:
        TypeFunc()
            : FunctionValue("type")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "type", where);
            auto v1 = actualParams[0];
            return std::make_shared<StringValue>(v1->TypeName());
        }
    };

    class ExitFunc : public FunctionValue
    {
    public:
        ExitFunc()
            : FunctionValue("exit")
        {

        }

        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where) override
        {
            CheckNumParams(actualParams, 1, "exit", where);
            auto v1 = actualParams[0];
            
            if((dynamic_cast<IntValue *>(v1.get())) == nullptr)
            {
                RuntimeValue::RuntimeError("Type error for exit().", where);
            }

            exit(v1->GetIntValue("exit() param", where));
            return std::make_shared<NoneValue>();
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
        Assign("list", std::make_shared<ListFunc>());
        Assign("int", std::make_shared<IntFunc>());
        Assign("float", std::make_shared<FloatFunc>());
        Assign("print", std::make_shared<PrintFunc>());
        Assign("len", std::make_shared<LenFunc>());
        Assign("exit", std::make_shared<ExitFunc>());
        Assign("type", std::make_shared<TypeFunc>());
    }
}
