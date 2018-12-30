#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <cctype>
#include "utility.hpp"
#include "logger.hpp"
#include <filesystem>

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
        if (feof(fp))
        {
            log->Bug("ReadChar: EOF encountered on read.\r\n");

            if (fBootDb)
                exit(EXIT_FAILURE);

            return '\0';
        }

        c = fgetc(fp);
    } while (isspace(c));

    return c;
}

/*
 * Read a float number from a file. Turn the result into a float value.
 */
float ReadFloat(FILE *fp, Logger *log, bool fBootDb)
{
    float number = 0.0;
    bool sign = false, decimal = false;
    char c = '\0';
    double place = 0.0;

    do
    {
        if (feof(fp))
        {
            log->Bug("%s: EOF encountered on read.", __FUNCTION__);

            if (fBootDb)
            {
                exit(EXIT_FAILURE);
            }

            return 0;
        }
        c = fgetc(fp);
    } while (isspace(c));

    if (c == '+')
        c = fgetc(fp);
    else if (c == '-')
    {
        sign = true;
        c = fgetc(fp);
    }

    if (!isdigit((int)c))
    {
        log->Bug("%s: bad format. (%c)", __FUNCTION__, c);

        if (fBootDb)
            exit(EXIT_FAILURE);
        return 0;
    }

    while (true)
    {
        if (c == '.' || isdigit(c))
        {
            if (c == '.')
            {
                decimal = true;
                c = fgetc(fp);
            }

            if (feof(fp))
            {
                log->Bug("%s: EOF encountered on read.", __FUNCTION__);

                if (fBootDb)
                    exit(EXIT_FAILURE);
                return number;
            }

            if (!decimal)
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

    if (sign)
        number = 0 - number;

    if (c == '|')
    {
        number += ReadFloat(fp, log, fBootDb);
    }
    else if (c != ' ')
    {
        if (ungetc(c, fp) == EOF)
        {
            log->Bug("ReadFloat: EOF encountered on ungetc.\r\n");

            if (fBootDb)
                exit(EXIT_FAILURE);
        }
    }

    return number;
}

/*
 * Read a number from a file.
 */
int ReadInt(FILE *fp, Logger *log, bool fBootDb)
{
    int number = 0;
    bool sign = false;
    char c = 0;

    do
    {
        if (feof(fp))
        {
            log->Bug("ReadInt: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            return 0;
        }
        c = fgetc(fp);
    } while (isspace(c));

    if (c == '+')
    {
        c = fgetc(fp);
    }
    else if (c == '-')
    {
        sign = true;
        c = fgetc(fp);
    }

    if (!isdigit((int)c))
    {
        log->Bug("ReadInt: bad format. (%c)", c);

        if (fBootDb)
            exit(EXIT_FAILURE);

        return 0;
    }

    while (isdigit((int)c))
    {
        if (feof(fp))
        {
            log->Bug("ReadInt: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            return number;
        }
        number = number * 10 + c - '0';
        c = fgetc(fp);
    }

    if (sign)
        number = 0 - number;

    if (c == '|')
    {
        number += ReadInt(fp, log, fBootDb);
    }
    else if (c != ' ')
    {
        if (ungetc(c, fp) == EOF)
        {
            log->Bug("ReadInt: EOF encountered on ungetc.\r\n");

            if (fBootDb)
                exit(EXIT_FAILURE);
        }
    }

    return number;
}

/*
 * Read a string from file fp
 */
char *ReadStringToTilde(FILE *fp, Logger *log, bool fBootDb)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char *plast = buf;
    char c = 0;
    int ln = 0;

    /*
     * Skip blanks.
     * Read first char.
     */
    do
    {
        if (feof(fp))
        {
            log->Bug("ReadStringToTilde: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            return CopyString("");
        }
        c = fgetc(fp);
    } while (isspace(c));

    if ((*plast++ = c) == '~')
        return CopyString("");

    for (;; )
    {
        if (ln >= (MAX_STRING_LENGTH - 1))
        {
            log->Bug("ReadStringToTilde: string too long");
            *plast = '\0';
            return CopyString(buf);
        }
        switch ((int)(*plast = fgetc(fp)))
        {
        default:
            plast++; ln++;
            break;

        case EOF:
            log->Bug("ReadStringToTilde: EOF");

            if (fBootDb)
                exit(EXIT_FAILURE);

            *plast = '\0';
            return CopyString(buf);

        case '\n':
            plast++;  ln++;
            *plast++ = '\r';  ln++;
            break;

        case '\r':
            break;

        case '~':
            *plast = '\0';
            return CopyString(buf);
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
        if (feof(fp))
        {
            log->Bug("ReadToEndOfLine: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            return;
        }
        c = fgetc(fp);
    } while (c != '\n' && c != '\r');

    do
    {
        c = fgetc(fp);
    } while (c == '\n' || c == '\r');

    if (ungetc(c, fp) == EOF)
    {
        log->Bug("ReadToEndOfLine: EOF encountered on ungetc.\r\n");

        if (fBootDb)
            exit(EXIT_FAILURE);
    }
}

/*
 * Read to end of line into static buffer                       -Thoric
 */
char *ReadLine(FILE *fp, Logger *log, bool fBootDb)
{
    static char line[MAX_STRING_LENGTH];
    char *pline = line;
    char c = 0;
    int ln = 0;

    line[0] = '\0';

    /*
     * Skip blanks.
     * Read first char.
     */
    do
    {
        if (feof(fp))
        {
            log->Bug("ReadLine: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            strcpy(line, "");
            return line;
        }
        c = fgetc(fp);
    } while (isspace((int)c));

    if (ungetc(c, fp) == EOF)
    {
        log->Bug("ReadLine: EOF encountered on ungetc.\r\n");

        if (fBootDb)
            exit(EXIT_FAILURE);
    }

    do
    {
        if (feof(fp))
        {
            log->Bug("ReadLine: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            *pline = '\0';
            return line;
        }
        c = fgetc(fp);
        *pline++ = c; ln++;
        if (ln >= (MAX_STRING_LENGTH - 1))
        {
            log->Bug("ReadLine: line too long");
            break;
        }
    } while (c != '\n' && c != '\r');

    do
    {
        c = fgetc(fp);
    } while (c == '\n' || c == '\r');

    if (ungetc(c, fp) == EOF)
    {
        log->Bug("%s: EOF encountered on ungetc.\r\n", __FUNCTION__);

        if (fBootDb)
            exit(EXIT_FAILURE);
    }

    *pline = '\0';
    return line;
}

/*
 * Read one word (into static buffer).
 */
char *ReadWord(FILE *fp, Logger *log, bool fBootDb)
{
    static char word[MAX_INPUT_LENGTH];
    char *pword = NULL;
    char cEnd = '\0';

    do
    {
        if (feof(fp))
        {
            log->Bug("ReadWord: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            word[0] = '\0';
            return word;
        }
        cEnd = fgetc(fp);
    } while (isspace(cEnd));

    if (cEnd == '\'' || cEnd == '"')
    {
        pword = word;
    }
    else
    {
        word[0] = cEnd;
        pword = word + 1;
        cEnd = ' ';
    }

    for (; pword < word + MAX_INPUT_LENGTH; pword++)
    {
        if (feof(fp))
        {
            log->Bug("ReadWord: EOF encountered on read.\r\n");
            if (fBootDb)
                exit(EXIT_FAILURE);
            *pword = '\0';
            return word;
        }
        *pword = fgetc(fp);
        if (cEnd == ' ' ? isspace((int)*pword) : *pword == cEnd)
        {
            if (cEnd == ' ')
            {
                if (ungetc(*pword, fp) == EOF)
                {
                    log->Bug("%s: EOF encountered on ungetc.\r\n", __FUNCTION__);

                    if (fBootDb)
                        exit(EXIT_FAILURE);
                }
            }

            *pword = '\0';
            return word;
        }
    }

    log->Bug("ReadWord: word too long");
    exit(EXIT_FAILURE);
    return NULL;
}

/*
 * Append a string to a file.
 */
void AppendToFile(const std::string &file, const std::string &str)
{
    FILE *fp = fopen(file.c_str(), "a");

    if (fp != nullptr)
    {
        fprintf(fp, "%s\n", str.c_str());
        fclose(fp);
    }
}

void ForEachLuaFileInDir(const std::string &pathToDir, const std::function<void(const std::string&, void*)> &doOnFile, void *userData)
{
    try
    {
        for (const auto &entry : std::filesystem::directory_iterator(pathToDir.empty() ? "." : pathToDir))
        {
            if (!entry.is_regular_file())
            {
                continue;
            }

            auto &path = entry.path();

            if (StringSuffix(".lua", path.string()))
            {
                continue;
            }

            doOnFile(path.string(), userData);
        }
    }
    catch (const std::filesystem::filesystem_error &ex)
    {
        perror(ex.what());
        exit(1);
    }
}

std::string ConvertToLuaFilename(const std::string &name)
{
    char buf[MAX_STRING_LENGTH];
    strcpy(buf, ToLower(name).c_str());

    for (size_t n = 0; n < strlen(buf); ++n)
    {
        if (buf[n] == ' ')
        {
            buf[n] = '_';
        }
    }

    strcat(buf, ".lua");
    return buf;
}
