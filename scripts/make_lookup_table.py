#!/usr/bin/env python

import sys
import re
import os
import datetime

if __name__ == '__main__':
    commands = []
    spells = []
    specfuns = []
    
    with open('src/mud.hpp') as f:
        for line in f:
            if line.startswith('DECLARE_CMD_FUN'):
                match = re.search('DECLARE_CMD_FUN\((.*)\)', line)
                commands.append(match.group(1))
            elif line.startswith('DECLARE_SPELL_FUN'):
                match = re.search('DECLARE_SPELL_FUN\((.*)\)', line)
                spells.append(match.group(1))
            elif line.startswith('DECLARE_SPEC_FUN'):
                match = re.search('DECLARE_SPEC_FUN\((.*)\)', line)
                specfuns.append(match.group(1))
                
    code = []
    code.append("""// Generated by {} on {}
// Do not edit this file. It will be overwritten when running the script.
""".format(os.path.basename(__file__), datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')))
    code.append("""#include <unordered_map>
#include <string>
#include "mud.hpp"

static std::unordered_map<std::string, CmdFun*> strToCmdFun = {
""")
    for line in commands:
        code.append('    { "' + line + '", ' + line + ' },\n')
    
    code.append("""};
static std::unordered_map<std::string, SpellFun*> strToSpellFun = {
""")
    for line in spells:
        code.append('    { "' + line + '", ' + line + ' },\n')

    code.append("""};    
static std::unordered_map<std::string, SpecFun*> strToSpecFun = {
""")
    for line in specfuns:
        code.append('    { "' + line + '", ' + line + ' },\n')

    code.append("""};

CmdFun *GetSkillFunction(const std::string &name)
{
    const auto &i = strToCmdFun.find(name);

    if(i != strToCmdFun.end())
    {
        return i->second;
    }
    else
    {
        return skill_notfound;
    }
}

SpellFun *GetSpellFunction(const std::string &name)
{
    const auto &i = strToSpellFun.find(name);

    if(i != strToSpellFun.end())
    {
        return i->second;
    }
    else
    {
        return spell_notfound;
    }
}

SpecFun *SpecialLookup(const std::string &name)
{
    const auto &i = strToSpecFun.find(name);

    if(i != strToSpecFun.end())
    {
        return (*i).second;
    }
    else
    {
        return nullptr;
    }
}

std::string LookupSpecial(SpecFun *special)
{
    for(const auto &i : strToSpecFun)
    {
        if(special == i.second)
        {
            return i.first;
        }
    }

    return "";
}
""")

    if len(sys.argv) > 1:
        #print('Saving to file {}'.format(sys.argv[1]))
        with open(sys.argv[1], 'w') as f:
            for line in code:
                f.write(line)
    else:
        print(''.join(code))
