#include <iostream>
#include <fstream>
#include <cstring>
#include <imp/scanner/scanner.hpp>
#include <imp/runtime/standardlibrary.hpp>
#include <imp/parser/program.hpp>
#include <imp/runtime/stringvalue.hpp>

static std::list<std::string> LoadScript(const std::string &filename);
static void ShowUsage();

int main(int argc, char *argv[])
{
    std::cout << "Imp interpreter version 1.0" << std::endl;
    
    if(argc < 3)
    {
        ShowUsage();
        return 0;
    }

    try
    {
        std::list<std::string> code;
        
        if(strcmp(argv[1], "-s") == 0)
        {
            code.push_back(argv[2]);
        }
        else if(strcmp(argv[1], "-f") == 0)
        {
            code = LoadScript(argv[2]);
        }
        else
        {
            ShowUsage();
            return 0;
        }
        
        auto scanner = std::make_shared<Imp::Scanner>(code);
        auto lib = std::make_shared<Imp::StandardLibrary>();
        auto globalScope = std::make_shared<Imp::RuntimeScope>(lib);
        globalScope->Assign("SCRIPT_PATH", std::make_shared<Imp::StringValue>("scripts"));
        auto prog = Imp::Program::Parse(scanner);

        prog->Eval(globalScope);
    }
    catch(const std::exception &ex)
    {
        std::cerr << ex.what() << std::endl;
    }
}

static void ShowUsage()
{
    std::cout << "Usage: runimp -s <small statement list>" << std::endl;
    std::cout << "       runimp -f <filename.py>" << std::endl;
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
