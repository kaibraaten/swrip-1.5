#include "imp/parser/program.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/statement.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    Program::Program(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<RuntimeValue> Program::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        for(auto statement : stmts)
        {
            statement->Eval(curScope);
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<Program> Program::Parse(std::shared_ptr<Scanner> s)
    {
        auto program = std::make_shared<Program>(s->CurLineNum());

        while(s->CurToken()->Kind() != TokenKind::EofToken)
        {
            program->stmts.push_back(Statement::Parse(s));
        }

        return program;
    }
}
