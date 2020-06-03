#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"

void do_description( Character *ch, std::string argument )
{
    if ( IsNpc( ch ) )
    {
        ch->Echo( "Monsters are too dumb to do that!\r\n" );
        return;
    }

    StartEditing(ch, ch->Description,
                 [ch](const auto &txt)
                 {
                     ch->Description = txt;
                 });
    SetEditorDesc( ch, "Your character description" );
}
