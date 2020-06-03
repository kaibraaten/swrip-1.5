#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "help.hpp"
#include "repos/helprepository.hpp"

/*
 * Help editor                                                  -Thoric
 */
void do_hedit( Character *ch, std::string argument )
{
    if ( !ch->Desc )
    {
        return;
    }

    std::shared_ptr<HelpFile> pHelp = GetHelpFile( ch, argument );

    if ( !pHelp ) /* new help */
    {
        int level = GetTrustLevel( ch );
        pHelp = AllocateHelpFile( argument, level );
        HelpFiles->Add( pHelp );
    }

    StartEditing(ch, pHelp->Text,
                 [pHelp](const auto &txt)
                 {
                     pHelp->Text = txt;
                 });
    EditorDescPrintf( ch, "Help file: %s", GetHelpFileKeyword( pHelp ).c_str() );
}
