#include <iostream>
#include <fstream>
#include <cstring>
#include <queue>
#include <thread>
#include <imp/scanner/scanner.hpp>
#include <imp/runtime/standardlibrary.hpp>
#include <imp/parser/program.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "experimentallibrary.hpp"

static std::list<std::string> LoadScript(const std::string &filename);
static void ShowUsage();
static std::shared_ptr<Imp::Program> MakeProg(const std::string &scriptname,
                                              const std::list<std::string> &code);
static std::shared_ptr<Imp::RuntimeScope> MakeScope();

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

        auto scope = MakeScope();
        auto prog = MakeProg(argv[2], code);
        prog->Eval(scope);
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

static std::shared_ptr<Imp::Program> MakeProg(const std::string &scriptname,
                                              const std::list<std::string> &code)
{
    auto scanner = std::make_shared<Imp::Scanner>(scriptname, code);
    auto prog = Imp::Program::Parse(scanner);
    return prog;
}

static std::shared_ptr<Imp::RuntimeScope> MakeScope()
{
    auto lib = std::make_shared<Imp::StandardLibrary>();
    //auto exprLib = std::make_shared<ExperimentalLibrary>(lib);
    auto globalScope = std::make_shared<Imp::RuntimeScope>(lib);
    globalScope->Assign("__scriptpath__", std::make_shared<Imp::StringValue>("scripts"));

    return globalScope;
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
