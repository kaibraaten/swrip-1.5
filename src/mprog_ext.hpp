#ifndef _SWRIP_MPROG_EXT_HPP_
#define _SWRIP_MPROG_EXT_HPP_

#include <string>
#include <memory>
#include <list>
#include <vector>
#include <initializer_list>
#include <sstream>
#include <stdexcept>
#include <algorithm>

#include "repos/macrorepository.hpp"

std::list<std::string> SplitIntoList(std::string input);
std::vector<std::string> SplitIntoVector(std::string input);

template<typename ContainerT>
std::string JoinAsString(const ContainerT &container, const std::string &separator = "\r\n")
{
    return JoinAsString(std::cbegin(container), std::cend(container), separator);
}

template<typename Iter>
std::string JoinAsString(Iter begin, Iter end, const std::string &separator = "\r\n")
{
    std::ostringstream buf;

    std::for_each(begin, end, [&buf, separator](const auto &i)
                  {
                      buf << i << separator;
                  });

    return buf.str();
}

class MudProgMacroCode
{
public:
    MudProgMacroCode(const std::string &code) : Text(code)
    {
    }
    std::string Text;
};

class MudProgException : public std::logic_error
{
public:
    MudProgException(const std::string &message = "Unknown MudProg error")
        : std::logic_error(message)
    {

    }
};

class MudProgPreprocessor
{
public:
    virtual ~MudProgPreprocessor() = default;
    virtual void Process(std::vector<std::string> &script) = 0;
};

class RewriteElIfs : public MudProgPreprocessor
{
public:
    void Process(std::vector<std::string> &script) override;
};

class RewriteIfAnd : public MudProgPreprocessor
{
public:
    void Process(std::vector<std::string> &script) override;
};

class DiscardComments : public MudProgPreprocessor
{
public:
    void Process(std::vector<std::string> &script) override;
};

class ExpandMacros : public MudProgPreprocessor
{
public:
    ExpandMacros(std::shared_ptr<MacroRepository> repos);
    ~ExpandMacros();
    void Process(std::vector<std::string> &script) override;

private:
    class Impl;
    std::unique_ptr<Impl> pImpl;
};

class MudProgEnvironment
{
public:
    MudProgEnvironment(std::initializer_list<std::shared_ptr<MudProgPreprocessor>>);
    void PreprocessScript(std::string &com_list);

private:
    std::list<std::shared_ptr<MudProgPreprocessor>> _preprocessors;
};

#endif
