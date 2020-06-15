#include "utility.hpp"
#include <ctime>
#include <cstring>
#include <cstdlib>
#include <cctype>
#ifndef _WIN32
#include <clocale>
#include <monetary.h>
#endif
#include "random.hpp"

std::string Scramble(const std::string &strToScamble, int modifier)
{
    char arg[MAX_INPUT_LENGTH];
    int position;
    int conversion = 0;
    const char *argument = strToScamble.c_str();

    modifier %= GetRandomNumberFromRange(80, 300); /* Bitvectors get way too large #s */

    for(position = 0; position < MAX_INPUT_LENGTH; position++)
    {
        if(argument[position] == '\0')
        {
            arg[position] = '\0';
            return arg;
        }
        else if(argument[position] >= 'A' && argument[position] <= 'Z')
        {
            conversion = -conversion + position
                - modifier + argument[position] - 'A';
            conversion = GetRandomNumberFromRange(conversion - 5, conversion + 5);
            while(conversion > 25)
                conversion -= 26;
            while(conversion < 0)
                conversion += 26;
            arg[position] = (char)(conversion + 'A');
        }
        else if(argument[position] >= 'a' && argument[position] <= 'z')
        {
            conversion = -conversion + position
                - modifier + argument[position] - 'a';
            conversion = GetRandomNumberFromRange(conversion - 5, conversion + 5);
            while(conversion > 25)
                conversion -= 26;
            while(conversion < 0)
                conversion += 26;
            arg[position] = (char)(conversion + 'a');
        }
        else if(argument[position] >= '0' && argument[position] <= '9')
        {
            conversion = -conversion + position
                - modifier + argument[position] - '0';
            conversion = GetRandomNumberFromRange(conversion - 2, conversion + 2);
            while(conversion > 9)
                conversion -= 10;
            while(conversion < 0)
                conversion += 10;
            arg[position] = (char)(conversion + '0');
        }
        else
            arg[position] = argument[position];
    }

    arg[position - 1] = '\0';
    return arg;
}

std::string FlagString(int bitvector, const char *const flagarray[])
{
    char buf[MAX_STRING_LENGTH] = { '\0' };

    for(size_t x = 0; x < 32; x++)
    {
        if(IsBitSet(bitvector, 1 << x))
        {
            strcat(buf, flagarray[x]);
            strcat(buf, " ");
        }
    }

    size_t x = strlen(buf);

    if(x > 0)
    {
        buf[--x] = '\0';
    }

    return buf;
}

/*
 * Simple linear interpolation.
 */
int Interpolate(int level, int value_00, int value_32)
{
    return value_00 + level * (value_32 - value_00) / 32;
}

/*
 * StripColorCodes - removes the color codes from a string.
 *
 * Notice: currently setup for the default smaug/swr color code system,
 * if you do not use these, then you will have to do some editing.
 *
 * This function should properly remove the color codes from a string
 * Not sure if its any use to anyone, but i thought i'd give it out.
 *
 * I'm not asking for my name to be displayed, but i would like to have my name at
 * least still attached to this function. Altho, it certainly would be nice.
 *
 * Feel free to contact me if you have any problems.
 *
 * - Gavin - ur_gavin@hotmail.com
 * - Unknown Regions - http://ur.lynker.com
 */
char *StripColorCodes(char *text)
{
    int i = 0, j = 0;

    if(!text || text[0] == '\0')
    {
        return NULL;
    }
    else
    {
        char *buf;
        static char done[MAX_INPUT_LENGTH * 2];

        done[0] = '\0';

        if((buf = (char *)malloc(strlen(text) * sizeof(text))) == NULL)
            return text;

        /* Loop through until you've hit your terminating 0 */
        while(text[i] != '\0')
        {
            while(text[i] == '&' || text[i] == '^')
            {
                i += 2;
            }

            if(text[i] != '\0')
            {
                if(isspace(text[i]))
                {
                    buf[j] = ' ';
                    i++;
                    j++;
                }
                else
                {
                    buf[j] = text[i];
                    i++;
                    j++;
                }
            }
            else
            {
                buf[j] = '\0';
            }
        }

        buf[j] = '\0';

        sprintf(done, "%s", buf);
        buf = (char *)realloc(buf, j * sizeof(char));
        free(buf);

        return done;
    }
}

std::string PunctuateNumber(long number)
{
#ifdef _WIN32
    return std::to_string(number);
#else
    char buffer[1024];

    setlocale(LC_MONETARY, "en_US");
    strfmon(buffer, 1024, "%!#0.0n", (double)number);

    return TrimString(buffer, ' ');
#endif
}

long ToLong(const std::string &str)
{
    int result = strtol(str.c_str(), nullptr, 10);
    return result;
}

char CharToLowercase(char c)
{
    return static_cast<char>(tolower(static_cast<int>(c)));
}

char CharToUppercase(char c)
{
    return static_cast<char>(toupper(static_cast<int>(c)));
}

bool IsBitSet(unsigned long flags, size_t bit)
{
    return flags & bit;
}
