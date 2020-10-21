#include <imp/scanner/scanner.hpp>
#include <imp/runtime/standardlibrary.hpp>
#include <imp/parser/program.hpp>

int main(int arc, char *argv[])
{
    std::list<std::string> code = { "print('Hello world!')" };
    auto scanner = std::make_shared<Imp::Scanner>(code);
    auto lib = std::make_shared<Imp::StandardLibrary>();
    auto globalScope = std::make_shared<Imp::RuntimeScope>(lib);

    auto prog = Imp::Program::Parse(scanner);

    prog->Eval(globalScope);
}
