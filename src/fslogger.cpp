#include <cstdio>
#include <cstdarg>
#include <cstring>
#include <sys/stat.h>
#include "constants.hpp"
#include "logger.hpp"
#include "log.hpp"

extern FILE *fpArea;
extern char strArea[];

Logger *Log = nullptr;

class FileSystemLogger : public Logger
{
public:
  void Bug(const char *str, ...) override;
  void BootLog(const char *str, ...) override;
  void LogStringPlus( const char *str, short log_type, short level ) override;
  void LogPrintf( const char *fmt, ... ) override;
};

/*
 * Reports a bug.
 */
void FileSystemLogger::Bug( const char *str, ... )
{
  char buf[MAX_STRING_LENGTH];
  FILE *fp = NULL;
  struct stat fst;

  if ( fpArea != NULL )
    {
      int iLine = 0;
      int iChar = 0;

      if ( fpArea == stdin )
        {
          iLine = 0;
        }
      else
        {
          iChar = ftell( fpArea );
          fseek( fpArea, 0, 0 );

          for ( iLine = 0; ftell( fpArea ) < iChar; iLine++ )
            {
              while ( getc( fpArea ) != '\n' )
                ;
            }

          fseek( fpArea, iChar, 0 );
        }

      sprintf( buf, "[*****] FILE: %s LINE: %d", strArea, iLine );
      LogPrintf( buf );

      if ( stat( SHUTDOWN_FILE, &fst ) != -1 )  /* file exists */
        {
          if ( ( fp = fopen( SHUTDOWN_FILE, "a" ) ) != NULL )
            {
              fprintf( fp, "[*****] %s\n", buf );
              fclose( fp );
            }
        }
    }

  strcpy( buf, "[*****] BUG: " );

  va_list param;
  va_start(param, str);
  vsprintf( buf + strlen(buf), str, param );
  va_end(param);

  LogPrintf( buf );

  if ( ( fp = fopen( BUG_FILE, "a" ) ) != NULL )
    {
      fprintf( fp, "%s\n", buf );
      fclose( fp );
    }
}

void FileSystemLogger::BootLog(const char *str, ...)
{

}

void FileSystemLogger::LogStringPlus( const char *str, short log_type, short level )
{

}

void FileSystemLogger::LogPrintf( const char *fmt, ... )
{

}

Logger *NewLogger()
{
  return new FileSystemLogger();
}
