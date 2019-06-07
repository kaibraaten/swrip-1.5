#!/usr/bin/env python

import sys
import re

if __name__ == '__main__':
    commands = []
    spells = []
    with open('src/mud.hpp') as f:
        for line in f:
            if line.startswith('DECLARE_CMD_FUN'):
                match = re.search('DECLARE_CMD_FUN\((.*)\)', line)
                commands.append(match.group(1))
            elif line.startswith('DECLARE_SPELL_FUN'):
                match = re.search('DECLARE_SPELL_FUN\((.*)\)', line)
                spells.append(match.group(1))
                
    code = []
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

CmdFun *GetSkillFunction(const std::string &name)
{
    const auto &i = strToCmdFun.find(name);

    if(i != strToCmdFun.end())
    {
        return i->second;
    }
    else
    {
        return nullptr;
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
        return nullptr;
    }
}
    """)

    print(''.join(code))
