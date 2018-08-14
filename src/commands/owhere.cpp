#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"

static void trunc1(char *s, size_t len);

void do_owhere( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH], field[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Object *obj = nullptr, *outer_obj = nullptr;
  bool found = false;
  int icnt = 0;
  vnum_t vnum = INVALID_VNUM;
  static const char * const heading =
    "    Vnum  Short Desc        Vnum  Room/Char          Vnum  Container\r\n";

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Owhere what?\r\n" );
      return;
    }

  if ( IsNumber(arg) )
    vnum=atoi(arg);

  for ( obj = FirstObject; obj; obj = obj->Next )
    {
      if ( vnum )
        {
          if ( vnum!=obj->Prototype->Vnum)
            continue;
        }
      else if ( !NiftyIsName( arg, obj->Name ) )
	{
	  continue;
	}

      if ( !found )
        ch->Echo(heading);

      found = true;
      outer_obj = obj;

      while ( outer_obj->InObject )
        outer_obj = outer_obj->InObject;

      sprintf(field, "%-18s", GetObjectShortDescription(obj));
      trunc1(field, 18);
      sprintf(buf, "%3d &R&w%5ld &R&w%-18s &R&w", ++icnt, obj->Prototype->Vnum, field);

      if ( outer_obj->CarriedBy )
        {
          sprintf(field, "%-18s", PERS(outer_obj->CarriedBy, ch));
          trunc1(field, 18);
          sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                  (IsNpc(outer_obj->CarriedBy) ?
                   outer_obj->CarriedBy->Prototype->Vnum : INVALID_VNUM), field);

          if ( outer_obj!=obj )
            {
              sprintf(field, "%-18s", obj->InObject->Name);
              trunc1(field, 18);
              sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                      obj->InObject->Prototype->Vnum, field);
            }

          sprintf(buf+strlen(buf), "&R&w\r\n");
          ch->Echo(buf);
        }
      else if ( outer_obj->InRoom )
        {
          sprintf(field, "%-18s", outer_obj->InRoom->Name);
          trunc1(field, 18);
          sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                  outer_obj->InRoom->Vnum, field);

          if ( outer_obj!=obj )
            {
              sprintf(field, "%-18s", obj->InObject->Name);
              trunc1(field, 18);
              sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                      obj->InObject->Prototype->Vnum, field);
            }

          sprintf(buf+strlen(buf), "&R&w\r\n");
          ch->Echo(buf);
        }
    }

  if ( !found )
    ch->Echo("None found.\r\n");
}

static void trunc1(char *s, size_t len)
{
  if ( strlen(s) > len )
    s[len] = '\0';
}

