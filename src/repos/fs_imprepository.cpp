#include <filesystem>
#include <fstream>
#include <cstring>
#include "repos/imprepository.hpp"
#include "mud.hpp"

namespace fs = std::filesystem;
static const std::string IMPSCRIPT_DIR = DATA_DIR "scripts/";

static ImpScriptEntry ReadScript(const std::string &path);
static std::vector<ImpScriptEntry> GetScriptEntries(const std::string &pathToDir);

class FsImpRepository : public ImpRepository
{
public:
    std::vector<ImpScriptEntry> Entities() const
    {
        return GetScriptEntries(IMPSCRIPT_DIR);
    }
    
    std::vector<ImpScriptEntry> FindByPath(const std::string &path)
    {
        return std::vector<ImpScriptEntry>();
    }

    std::vector<ImpScriptEntry> FindByFullText(const std::string &path)
    {
        return std::vector<ImpScriptEntry>();
    }
};


std::shared_ptr<ImpRepository> NewFsImpRepository()
{
    return std::make_shared<FsImpRepository>();
}

static std::vector<ImpScriptEntry> GetScriptEntries(const std::string &pathToDir)
{
    try
    {
        std::vector<ImpScriptEntry> list;
        
        for(const auto &entry : fs::directory_iterator(pathToDir.empty() ? "." : pathToDir))
        {
            auto &path = entry.path();
            
            if(entry.is_directory())
            {
                auto result = GetScriptEntries(path.string());
                list.insert(list.end(), result.begin(), result.end());
                continue;
            }
            else if(!entry.is_regular_file())
            {
                continue;
            }
            else if(StringSuffix(".py", path.string()))
            {
                continue;
            }

            ImpScriptEntry script = ReadScript(path.string());
            list.push_back(script);
        }

        return list;
    }
    catch(const fs::filesystem_error &ex)
    {
        perror(ex.what());
        exit(1);
    }
}

static std::string GetPackageName(std::string path)
{
    auto pos = path.find_last_of('.');

    if(pos != std::string::npos)
    {
        path.erase(pos);
    }
    else
    {
        path.erase();
    }
    
    return path;
}

static std::string GetModuleName(std::string path)
{
    auto pos = path.find_last_of('.');

    if(pos != std::string::npos)
    {
        path.erase(0, pos + 1);
    }
    
    return path;
}

static std::vector<std::string> ReadScriptLines(const std::string &path)
{
    std::vector<std::string> code;
    std::ifstream file(path);

    if(file.is_open())
    {
        std::string line;

        while(std::getline(file, line))
        {
            code.push_back(line);
        }
    }

    return code;
}

static ImpScriptEntry ReadScript(const std::string &path)
{
    ImpScriptEntry script;
    std::string packagePath = path;
    packagePath.erase(0, IMPSCRIPT_DIR.size());
    packagePath.erase(packagePath.size() - 3);

    for(int i = 0; i < packagePath.size(); ++i)
    {
        if(packagePath[i] == '/')
        {
            packagePath[i] = '.';
        }
    }
    
    script.Package = GetPackageName(packagePath);
    script.Module = GetModuleName(packagePath);
    script.Body = ReadScriptLines(path);
    return script;
}
