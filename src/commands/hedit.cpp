#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "help.hpp"
#include "log.hpp"
#include "repos/helprepository.hpp"

/*
 * Help editor                                                  -Thoric
 */
void do_hedit( Character *ch, std::string argument )
{
    std::string *editedText = nullptr;
    
    if ( !ch->Desc )
    {
        return;
    }

    switch( ch->SubState )
    {
    default:
        break;

    case SUB_HELP_EDIT:
        editedText = static_cast<std::string*>(EditorUserData(ch));
        *editedText = CopyEditBuffer( ch );
        StopEditing( ch );
        return;
    }

    std::shared_ptr<HelpFile> pHelp = GetHelpFile( ch, argument );

    if ( !pHelp ) /* new help */
    {
        int level = GetTrustLevel( ch );
        pHelp = AllocateHelpFile( argument, level );
        HelpFiles->Add( pHelp );
    }

    ch->SubState = SUB_HELP_EDIT;
    ch->dest_buf = pHelp.get();
    StartEditing( ch, pHelp->Text, &pHelp->Text, do_hedit );
    EditorDescPrintf( ch, "Help file: %s", GetHelpFileKeyword( pHelp ).c_str() );
}
