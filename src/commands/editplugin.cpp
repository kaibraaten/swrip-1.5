#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "editor.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"

static void EditPluginShowSyntax(std::shared_ptr<Character> ch,
                                 std::string argument,
                                 std::shared_ptr<Plugin> plugin);
static void EditPluginDescription(std::shared_ptr<Character> ch,
                                  std::string argument,
                                  std::shared_ptr<Plugin> plugin);
static void EditPluginName(std::shared_ptr<Character> ch,
                           std::string argument,
                           std::shared_ptr<Plugin> plugin);
static void EditPluginShow(std::shared_ptr<Character> ch,
                           std::string argument,
                           std::shared_ptr<Plugin> plugin);
static void EditPluginSave(std::shared_ptr<Character> ch,
                           std::string argument,
                           std::shared_ptr<Plugin> plugin);
static void EditPluginCreate(std::shared_ptr<Character> ch, std::string argument);
static bool PluginIdIsValid(const std::string &id);

void do_editplugin(std::shared_ptr<Character> ch, std::string argument)
{
    std::string option;
    argument = OneArgument(argument, option);

    
    if(StrCmp(option, "create") == 0)
    {
        EditPluginCreate(ch, argument);
        return;
    }

    auto plugin = ch->PCData->Build.Plugin;
    
    if(plugin == nullptr)
    {
        ch->Echo("Use PASSIGN to edit a plugin.\r\n");
        return;
    }

    if(StrCmp(option, "save") == 0)
    {
        EditPluginSave(ch, argument, plugin);
    }
    else if(StrCmp(option, "show") == 0)
    {
        EditPluginShow(ch, argument, plugin);
    }
    else if(StrCmp(option, "name") == 0)
    {
        EditPluginName(ch, argument, plugin);
    }
    else if(StrCmp(option, "description") == 0
            || StrCmp(option, "desc") == 0
            || StrCmp(option, "descr") == 0)
    {
        EditPluginDescription(ch, argument, plugin);
    }
    else
    {
        EditPluginShowSyntax(ch, argument, plugin);
    }
}

static void EditPluginCreate(std::shared_ptr<Character> ch, std::string argument)
{
    if(argument.empty())
    {
        ch->Echo("&RSupply an identifier.&d\r\n");
        return;
    }

    if(GetPlugin(argument))
    {
        ch->Echo("&RA plugin with that identifier already exists.&d\r\n");
        return;
    }

    if(!PluginIdIsValid(argument))
    {
        ch->Echo("&RThe plugin ID contains invalid characters.&d\r\n");
        ch->Echo("&RMust begin with letter, then the rest must be a letter,\r\n");
        ch->Echo("number, or underscore.&d\r\n");
        return;
    }

    auto plugin = CreatePlugin(argument);
    SavePlugin(plugin);
    do_passign(ch, plugin->Id());
    ch->Echo("&GOk.&d\r\n");
}

static bool IsLetterAZ(char c)
{
    return ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || (c == '_');
}

static bool IsDigit(char c)
{
    return '0' <= c && c <= '9';
}

static bool PluginIdIsValid(const std::string &id)
{
    if(!IsLetterAZ(id[0]))
    {
        return false;
    }
    
    for(char c : id)
    {
        if(!IsLetterAZ(c) && !IsDigit(c) && c != '_')
        {
            return false;
        }
    }

    return true;
}

static void EditPluginSave(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Plugin> plugin)
{
    SavePlugin(plugin);
    ch->Echo("Ok.\r\n");
}

static void EditPluginShow(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Plugin> plugin)
{
    std::ostringstream buf;
    buf << std::string(80, '-') << "\r\n"
        << CenterString(ToUpper(plugin->Name()), 80, ' ') << "\r\n"
        << std::string(80, '-') << "\r\n";

    buf << "ID: " << plugin->Id() << "\r\n"
        << "Name: " << plugin->Name() << "\r\n"
        << "Description:\r\n" << plugin->Description();

    buf << "Rooms:\r\n";

    for(const auto &entry : plugin->Rooms())
    {
        vnum_t internalVnum = std::get<0>(entry);
        auto room = std::get<1>(entry);
        
        buf << " * " << internalVnum << " -> " << room->Vnum << ": " << room->Name << "\r\n";
    }

    buf << "Mobiles:\r\n";
    
    for(const auto &entry : plugin->Mobiles())
    {
        vnum_t internalVnum = std::get<0>(entry);
        auto mob = std::get<1>(entry);

        buf << " * " << internalVnum << " -> " << mob->Vnum
            << ": " << mob->Name << " (" << mob->ShortDescr << ")\r\n";
    }

    buf << "Objects:\r\n";
    
    for(const auto &entry : plugin->Objects())
    {
        vnum_t internalVnum = std::get<0>(entry);
        auto obj = std::get<1>(entry);

        buf << " * " << internalVnum << " -> " << obj->Vnum
            << ": " << obj->Name << " (" << obj->ShortDescr << ")\r\n";
    }

    ch->Echo("%s", buf.str().c_str());
}

static void EditPluginName(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Plugin> plugin)
{
    if(argument.empty())
    {
        ch->Echo("&RSupply a name.&d\r\n");
        return;
    }

    plugin->Name(argument);
    ch->Echo("Ok.\r\n");
}

static void EditPluginDescription(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Plugin> plugin)
{
    StartEditing(ch, plugin->Description(),
                 [plugin](const auto &txt)
                 {
                     plugin->Description(txt);
                 });
    SetEditorDesc(ch, "Plugin %s (%s) description.",
                  plugin->Name().c_str(), plugin->Id().c_str());
}

static void EditPluginShowSyntax(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Plugin> plugin)
{
    do_help(ch, "editplugin");
}
