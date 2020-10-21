#include <iostream>
#include <fstream>
#include <imp/scanner/scanner.hpp>
#include <imp/runtime/standardlibrary.hpp>
#include <imp/parser/program.hpp>

static std::list<std::string> LoadScript(const std::string &filename);

int main(int argc, char *argv[])
{
    std::cout << "Imp interpreter version 1.0" << std::endl;
    
    if(argc < 2)
    {
        std::cout << "Usage: runimp <filename.py>" << std::endl;
        return 0;
    }

    try
    {
        auto code = LoadScript(argv[1]);
        auto scanner = std::make_shared<Imp::Scanner>(code);
        auto lib = std::make_shared<Imp::StandardLibrary>();
        auto globalScope = std::make_shared<Imp::RuntimeScope>(lib);

        auto prog = Imp::Program::Parse(scanner);

        prog->Eval(globalScope);
    }
    catch(const std::exception &ex)
    {
        std::cerr << ex.what() << std::endl;
    }
}

static std::list<std::string> LoadScript(const std::string &filename)
{
    std::list<std::string> code;
    std::ifstream file(filename);
    std::string line;

    while(std::getline(file, line))
    {
        code.push_back(line);
    }

    return code;
}
