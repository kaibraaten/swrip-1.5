#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "pcdata.hpp"

void do_bio( Character *ch, std::string argument )
{
    if ( IsNpc( ch ) )
    {
        ch->Echo( "Mobs can't set bio's!\r\n" );
        return;
    }

    StartEditing(ch, ch->PCData->Bio,
                 [ch](const auto &txt)
                 {
                     ch->PCData->Bio = txt;
                 });
    SetEditorDesc( ch, "Your character biography" );
}
