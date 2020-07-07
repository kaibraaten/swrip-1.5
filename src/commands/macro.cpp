#include <sstream>
#include "mud.hpp"
#include "editor.hpp"
#include "character.hpp"
#include "mprog_ext.hpp"
#include "repos/macrorepository.hpp"

static std::string GetUsageText();
static void AddCommand(std::shared_ptr<Character> ch);
static void SaveCommand(std::shared_ptr<Character> ch);
static void ListCommand(std::shared_ptr<Character> ch, std::shared_ptr<MudProgMacroCode> macro);
static void EditCommand(std::shared_ptr<Character> ch, std::shared_ptr<MudProgMacroCode> macro);
static void UsageCommand(std::shared_ptr<Character> ch, std::shared_ptr<MudProgMacroCode> macro);

void do_macro(std::shared_ptr<Character> ch, std::string argument)
{
    std::string command;
    std::string macroname;

    macroname = OneArgument(argument, command);

    if(command.empty())
    {
        ch->Echo(GetUsageText());
        return;
    }

    auto macro = Macros->FindEntry(macroname);

    if(StrCmp(command, "add") == 0)
    {
        AddCommand(ch);        
    }
    else if(StrCmp(command, "save") == 0)
    {
        SaveCommand(ch);
    }
    else if(StrCmp(command, "list") == 0)
    {
        ListCommand(ch, macro);
    }
    else if(StrCmp(command, "edit") == 0)
    {
        EditCommand(ch, macro);
    }
    else if(StrCmp(command, "usage") == 0)
    {
        UsageCommand(ch, macro);
    }
    else
    {
        ch->Echo(GetUsageText());
    }
}

static std::string GetUsageText()
{
    std::ostringstream buf;

    buf << "Usage: macro add\r\n"
        << "       macro save\r\n"
        << "       macro list [macro name]\r\n"
        << "       macro edit <macro name>\r\n"
        << "       macro usage <macro name>\r\n"
        << "\r\n"
        << "Command descriptions:\r\n"
        << "  add   - Create a new entry.\r\n"
        << "  save  - Save all macros to storage.\r\n"
        << "  list  - List all macros, or show entry with given macro.\r\n"        
        << "  edit  - Edit the entry containing the given macro.\r\n"
        << "  usage - Show all references to the macro.\r\n"
        << "\r\n"
        << "Tip: To delete an entry, just save the editor with empty buffer.\r\n";

    return buf.str();
}

static void AddCommand(std::shared_ptr<Character> ch)
{
    StartEditing(ch, "",
                 [](const auto &txt)
                 {
                     auto macro = std::make_shared<MudProgMacroCode>(txt);
                     Macros->Add(macro);
                 });
    SetEditorDesc(ch, "New MudProg macro");
}

static void SaveCommand(std::shared_ptr<Character> ch)
{
    Macros->Save();
    ch->Echo("All macros saved.\r\n");
}

static void ListCommand(std::shared_ptr<Character> ch, std::shared_ptr<MudProgMacroCode> macro)
{
    if(macro == nullptr)
    {
        for(auto m : Macros->MacroNameList())
        {
            ch->Echo("%s\r\n", m.c_str());
        }

        if(Macros->Count() == 0)
        {
            ch->Echo("No macros created.\r\n");
        }
    }
    else
    {
        ch->Echo("%s\r\n", macro->Text.c_str());
    }
}

static void EditCommand(std::shared_ptr<Character> ch, std::shared_ptr<MudProgMacroCode> macro)
{
    if(macro != nullptr)
    {
        StartEditing(ch, macro->Text,
                     [ch, macro](const auto &txt)
                     {
                         macro->Text = txt;

                         auto scriptAsList = SplitIntoList(txt);

                         if(scriptAsList.empty())
                         {
                             auto macroToRemove = macro;
                             Macros->Remove(macroToRemove);
                             ch->Echo("Macro entry removed.\r\n");
                         }
                     });
        SetEditorDesc(ch, "Edit MudProg macro");
    }
    else
    {
        ch->Echo("There's no global macro with that name.\r\n");
    }
}

static void UsageCommand(std::shared_ptr<Character> ch, std::shared_ptr<MudProgMacroCode> macro)
{
    ch->Echo("&RNot implemented.&d\r\n");
}
