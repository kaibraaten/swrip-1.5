#include <string.h>
#include <ctype.h>
#include <time.h>
#include "mud.hpp"
#include "character.hpp"

/*
 * Based on last time modified, show when a player was last on  -Thoric
 */
void do_last( Character *ch, std::string arg )
{
    char buf[MAX_STRING_LENGTH];
    struct stat fst;

    if ( arg.empty() )
    {
        ch->Echo("Usage: last <playername>\r\n");
        return;
    }

    std::string name = Capitalize(ToLower(arg));
    sprintf( buf, "%s%c/%s.lua", PLAYER_DIR, tolower(arg[0]), name.c_str() );

    if ( stat( buf, &fst ) != -1 )
    {
        ch->Echo("%s was last on: %s\r", name.c_str(), ctime( &fst.st_mtime ) );
    }
    else
    {
        ch->Echo("%s was not found.\r\n", name.c_str() );
    }
}
