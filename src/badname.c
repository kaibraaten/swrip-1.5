#include "mud.h"
#include "badname.h"

bool IsBadName( const char *name )
{
  FILE *fp = fopen(OLD_BAD_NAME_FILE,"r");

  if( fp == NULL )
    {
      Bug("Bad Name file missing. Creating.");
      fp = fopen(OLD_BAD_NAME_FILE,"w+");
      fprintf(fp,"ShitEater~\n");
      fprintf(fp,"$~");
      fclose(fp);
      return false;
    }

  while (!feof(fp))
    {
      const char *ln = ReadStringToTilde(fp);

      if (IsName(name,ln))
        {
          fclose(fp);
          return true;
        }

      if (IsName("$",ln))
        {
          fclose(fp);
          return false;
        }
    }

  fclose(fp);
  return false;
}

int AddBadName(const char *name)
{
  FILE *fp = NULL;
  const char *ln = NULL;
  fpos_t pos;

  if (IsBadName(name))
    {
      return 0;
    }

  if( !( fp = fopen(OLD_BAD_NAME_FILE,"r+") ) )
    {
      Bug("Error opening Bad Name file.");
      return -1;
    }

  ln = ReadStringToTilde(fp);

  while(!IsName("$",ln) && !feof(fp))
    {
      ln = ReadStringToTilde(fp);
    }

  /* Delete the $~ from the end of the file */
  fgetpos(fp, &pos);

  fsetpos(fp, &pos -2);
  fsetpos(fp, &pos);
  fprintf(fp,"%s~\n",name);
  fprintf(fp,"$~");
  fclose(fp);
  return 1;
}
