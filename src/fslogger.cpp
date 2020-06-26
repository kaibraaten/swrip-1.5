#include <cstdio>
#include <cstdarg>
#include <cstring>
#include <ctime>
#include <sys/stat.h>
#include "constants.hpp"
#include "log.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "repos/descriptorrepository.hpp"

extern FILE *fpArea;
extern std::string strArea;

Logger *Log = nullptr;

class FileSystemLogger : public Logger
{
public:
    void Bug(const char *str, ...) override;
    void Boot(const char *str, ...) override;
    void LogStringPlus(const std::string &str, short log_type, short level) override;
    void Info(const char *fmt, ...) override;
};

/*
 * Reports a bug.
 */
void FileSystemLogger::Bug(const char *str, ...)
{
    char buf[MAX_STRING_LENGTH];
    FILE *fp = NULL;
    struct stat fst;

    if(fpArea != NULL)
    {
        int iLine = 0;
        int iChar = 0;

        if(fpArea == stdin)
        {
            iLine = 0;
        }
        else
        {
            iChar = ftell(fpArea);
            fseek(fpArea, 0, 0);

            for(iLine = 0; ftell(fpArea) < iChar; iLine++)
            {
                while(getc(fpArea) != '\n')
                    ;
            }

            fseek(fpArea, iChar, 0);
        }

        sprintf(buf, "[*****] FILE: %s LINE: %d", strArea.c_str(), iLine);
        Log->Info("%s", buf);

        if(stat(SHUTDOWN_FILE, &fst) != -1)  /* file exists */
        {
            if((fp = fopen(SHUTDOWN_FILE, "a")) != NULL)
            {
                fprintf(fp, "[*****] %s\n", buf);
                fclose(fp);
            }
        }
    }

    strcpy(buf, "[*****] BUG: ");

    va_list param;
    va_start(param, str);
    vsprintf(buf + strlen(buf), str, param);
    va_end(param);

    Log->Info("%s", buf);

    if((fp = fopen(BUG_FILE, "a")) != NULL)
    {
        fprintf(fp, "%s\n", buf);
        fclose(fp);
    }
}

void FileSystemLogger::Boot(const char *str, ...)
{
    char buf[MAX_STRING_LENGTH];
    FILE *fp = nullptr;
    va_list param;

    strcpy(buf, "[*****] BOOT: ");
    va_start(param, str);
    vsprintf(buf + strlen(buf), str, param);
    va_end(param);
    Log->Info("%s", buf);

    if((fp = fopen(BOOTLOG_FILE, "a")) != NULL)
    {
        fprintf(fp, "%s\n", buf);
        fclose(fp);
    }
}

void FileSystemLogger::LogStringPlus(const std::string &str, short log_type, short level)
{
    char *strtime = ctime(&current_time);
    int offset = 0;
    bool lognone = false;
    char buf[MAX_STRING_LENGTH];

    strtime[strlen(strtime) - 1] = '\0';
    fprintf(stderr, "%s :: %s\n", strtime, str.c_str());

    if(Descriptors == nullptr)
    {
        // Repository hasn't been allocated yet.
        return;
    }

    if(strncmp(str.c_str(), "Log ", 4) == 0)
    {
        offset = 4;
    }
    else
    {
        offset = 0;
    }

    sprintf(buf, "%s&R&w", str.c_str() + offset);

    switch(log_type)
    {
    case LOG_BUILD:
        ToChannel(buf, CHANNEL_BUILD, "Build", level);
        break;

    case LOG_COMM:
        ToChannel(buf, CHANNEL_COMM, "Comm", level);
        break;

    case LOG_ALL:
        break;

    default:
        /* ToChannel( str + offset, CHANNEL_LOG, "Log", level ); */
        lognone = true;
        break;
    }

    if(lognone)
    {
        for(auto d : Descriptors)
        {
            auto och = d->Original ? d->Original : d->Char;
            auto vch = d->Char;

            if(!och || !vch)
            {
                continue;
            }

            if((vch->TopLevel < SysData.LevelOfLogChannel)
               || (vch->TopLevel < level))
            {
                continue;
            }

            if(d->ConnectionState == CON_PLAYING
               && !IsBitSet(och->Deaf, CHANNEL_LOG)
               && vch->TopLevel >= level)
            {
                SetCharacterColor(AT_LOG, vch);
                vch->Echo("Log: %s&R&w\r\n", str.c_str() + offset);
            }
        }
    }
}

void FileSystemLogger::Info(const char *fmt, ...)
{
    char buf[MAX_STRING_LENGTH * 2];
    va_list args;
    va_start(args, fmt);
    vsprintf(buf, fmt, args);
    va_end(args);

    LogStringPlus(buf, LOG_NORMAL, LEVEL_LOG);
}

Logger *NewLogger()
{
    return new FileSystemLogger();
}
