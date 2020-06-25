#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#include <iostream>
#include <filesystem>
#include <fstream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <cctype>
#include "utility.hpp"
#include "logger.hpp"

namespace fs = std::filesystem;

/*
 * Added lots of EOF checks, as most of the file crashes are based on them.
 * If an area file encounters EOF, the fread_* functions will shutdown the
 * MUD, as all area files should be read in in full or bad things will
 * happen during the game.  Any files loaded in without fBootDb which
 * encounter EOF will return what they have read so far.   These files
 * should include player files, and in-progress areas that are not loaded
 * upon bootup.
 * -- Altrag
 */

 /*
  * Read a letter from a file.
  */
char ReadChar(FILE *fp, Logger *log, bool fBootDb)
{
    char c = '\0';

    do
    {
        if(feof(fp))
        {
            log->Bug("ReadChar: EOF encountered on read.\r\n");

            if(fBootDb)
                exit(EXIT_FAILURE);

            return '\0';
        }

        c = fgetc(fp);
    } while(isspace(c));

    return c;
}

/*
 * Read a float number from a file. Turn the result into a float value.
 */
float ReadFloat(FILE *fp, Logger *log, bool fBootDb)
{
    char c = '\0';

    do
    {
        if(feof(fp))
        {
            log->Bug("%s: EOF encountered on read.", __FUNCTION__);

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return 0;
        }

        c = fgetc(fp);
    } while(isspace(c));

    bool sign = false;

    if(c == '+')
    {
        c = fgetc(fp);
    }
    else if(c == '-')
    {
        sign = true;
        c = fgetc(fp);
    }

    if(!isdigit((int)c))
    {
        log->Bug("%s: bad format. (%c)", __FUNCTION__, c);

        if(fBootDb)
            exit(EXIT_FAILURE);
        return 0;
    }

    float number = 0.0;
    bool decimal = false;
    double place = 0.0;

    while(true)
    {
        if(c == '.' || isdigit(c))
        {
            if(c == '.')
            {
                decimal = true;
                c = fgetc(fp);
            }

            if(feof(fp))
            {
                log->Bug("%s: EOF encountered on read.", __FUNCTION__);

                if(fBootDb)
                {
                    exit(EXIT_FAILURE);
                }

                return number;
            }

            if(!decimal)
            {
                number = number * 10 + c - '0';
            }
            else
            {
                place++;
                number += pow(10, (-1 * place)) * (c - '0');
            }

            c = fgetc(fp);
        }
        else
        {
            break;
        }
    }

    if(sign)
    {
        number = 0 - number;
    }

    if(c == '|')
    {
        number += ReadFloat(fp, log, fBootDb);
    }
    else if(c != ' ')
    {
        if(ungetc(c, fp) == EOF)
        {
            log->Bug("ReadFloat: EOF encountered on ungetc.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }
        }
    }

    return number;
}

/*
 * Read a number from a file.
 */
int ReadInt(FILE *fp, Logger *log, bool fBootDb)
{
    char c = 0;

    do
    {
        if(feof(fp))
        {
            log->Bug("ReadInt: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return 0;
        }
        c = fgetc(fp);
    } while(isspace(c));

    bool sign = false;

    if(c == '+')
    {
        c = fgetc(fp);
    }
    else if(c == '-')
    {
        sign = true;
        c = fgetc(fp);
    }

    if(!isdigit((int)c))
    {
        log->Bug("ReadInt: bad format. (%c)", c);

        if(fBootDb)
        {
            exit(EXIT_FAILURE);
        }

        return 0;
    }

    int number = 0;

    while(isdigit((int)c))
    {
        if(feof(fp))
        {
            log->Bug("ReadInt: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return number;
        }

        number = number * 10 + c - '0';
        c = fgetc(fp);
    }

    if(sign)
    {
        number *= -1;
    }

    if(c == '|')
    {
        number += ReadInt(fp, log, fBootDb);
    }
    else if(c != ' ')
    {
        if(ungetc(c, fp) == EOF)
        {
            log->Bug("ReadInt: EOF encountered on ungetc.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }
        }
    }

    return number;
}

/*
 * Read a string from file fp
 */
std::string ReadStringToTilde(FILE *fp, Logger *log, bool fBootDb)
{
    char c = 0;

    /*
     * Skip blanks.
     * Read first char.
     */
    do
    {
        if(feof(fp))
        {
            log->Bug("ReadStringToTilde: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return "";
        }
        c = fgetc(fp);
    } while(isspace(c));

    char buf[MAX_STRING_LENGTH] = { '\0' };
    char *plast = buf;

    if((*plast++ = c) == '~')
    {
        return "";
    }

    int ln = 0;

    for(;; )
    {
        if(ln >= (MAX_STRING_LENGTH - 1))
        {
            log->Bug("ReadStringToTilde: string too long");
            *plast = '\0';
            return buf;
        }

        switch((int)(*plast = fgetc(fp)))
        {
        case EOF:
            log->Bug("ReadStringToTilde: EOF");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            *plast = '\0';
            return buf;

        case '\n':
            plast++;
            ln++;
            *plast++ = '\r';
            ln++;
            break;

        case '\r':
            break;

        case '~':
            *plast = '\0';
            return buf;

        default:
            plast++;
            ln++;
            break;
        }
    }
}

/*
 * Read to end of line (for comments).
 */
void ReadToEndOfLine(FILE *fp, Logger *log, bool fBootDb)
{
    char c = 0;

    do
    {
        if(feof(fp))
        {
            log->Bug("ReadToEndOfLine: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return;
        }
        c = fgetc(fp);
    } while(c != '\n' && c != '\r');

    do
    {
        c = fgetc(fp);
    } while(c == '\n' || c == '\r');

    if(ungetc(c, fp) == EOF)
    {
        log->Bug("ReadToEndOfLine: EOF encountered on ungetc.\r\n");

        if(fBootDb)
        {
            exit(EXIT_FAILURE);
        }
    }
}

/*
 * Read to end of line into static buffer                       -Thoric
 */
std::string ReadLine(FILE *fp, Logger *log, bool fBootDb)
{
    
    char c = 0;

    /*
     * Skip blanks.
     * Read first char.
     */
    do
    {
        if(feof(fp))
        {
            log->Bug("ReadLine: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return "";
        }
        c = fgetc(fp);
    } while(isspace((int)c));

    if(ungetc(c, fp) == EOF)
    {
        log->Bug("ReadLine: EOF encountered on ungetc.\r\n");

        if(fBootDb)
        {
            exit(EXIT_FAILURE);
        }
    }

    char line[MAX_STRING_LENGTH] = { '\0' };
    char *pline = line;
    int ln = 0;

    do
    {
        if(feof(fp))
        {
            log->Bug("ReadLine: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            *pline = '\0';
            return line;
        }

        c = fgetc(fp);
        *pline++ = c;
        ln++;

        if(ln >= (MAX_STRING_LENGTH - 1))
        {
            log->Bug("ReadLine: line too long");
            break;
        }
    } while(c != '\n' && c != '\r');

    do
    {
        c = fgetc(fp);
    } while(c == '\n' || c == '\r');

    if(ungetc(c, fp) == EOF)
    {
        log->Bug("%s: EOF encountered on ungetc.\r\n", __FUNCTION__);

        if(fBootDb)
        {
            exit(EXIT_FAILURE);
        }
    }

    *pline = '\0';
    return line;
}

/*
 * Read one word (into static buffer).
 */
std::string ReadWord(FILE *fp, Logger *log, bool fBootDb)
{
    char cEnd = '\0';

    do
    {
        if(feof(fp))
        {
            log->Bug("ReadWord: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return "";
        }
        cEnd = fgetc(fp);
    } while(isspace(cEnd));

    char word[MAX_INPUT_LENGTH] = { '\0' };
    char *pword = nullptr;

    if(cEnd == '\'' || cEnd == '"')
    {
        pword = word;
    }
    else
    {
        word[0] = cEnd;
        pword = word + 1;
        cEnd = ' ';
    }

    for(; pword < word + MAX_INPUT_LENGTH; pword++)
    {
        if(feof(fp))
        {
            log->Bug("ReadWord: EOF encountered on read.\r\n");

            if(fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            *pword = '\0';
            return word;
        }

        *pword = fgetc(fp);

        if(cEnd == ' ' ? isspace((int)*pword) : *pword == cEnd)
        {
            if(cEnd == ' ')
            {
                if(ungetc(*pword, fp) == EOF)
                {
                    log->Bug("%s: EOF encountered on ungetc.\r\n", __FUNCTION__);

                    if(fBootDb)
                    {
                        exit(EXIT_FAILURE);
                    }
                }
            }

            *pword = '\0';
            return word;
        }
    }

    log->Bug("ReadWord: word too long");
    exit(EXIT_FAILURE);
    return "";
}

/*
 * Append a string to a file.
 */
void AppendToFile(const std::string &filename, const std::string &str)
{
    std::ofstream file(filename, std::ofstream::app);

    if(file.is_open())
    {
        file << str << "\n";
    }
}

void ForEachLuaFileInDir(const std::string &pathToDir, std::function<void(const std::string &path)> doOnFile)
{
    try
    {
        for(const auto &entry : fs::directory_iterator(pathToDir.empty() ? "." : pathToDir))
        {
            if(!entry.is_regular_file())
            {
                continue;
            }

            auto &path = entry.path();

            if(StringSuffix(".lua", path.string()))
            {
                continue;
            }

            doOnFile(path.string());
        }
    }
    catch(const fs::filesystem_error &ex)
    {
        perror(ex.what());
        exit(1);
    }
}

std::string ConvertToLuaFilename(const std::string &name)
{
    std::string buf = ToLower(name);

    for(size_t n = 0; n < buf.size(); ++n)
    {
        if(buf[n] == ' ')
        {
            buf[n] = '_';
        }
    }

    if(!StringEndsWith(buf, ".lua"))
    {
        buf += ".lua";
    }

    return buf;
}
