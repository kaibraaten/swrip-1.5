/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 * ------------------------------------------------------------------------ *
 * Comments: 'notes' attached to players to keep track of outstanding       *
 *           and problem players.  -haus 6/25/1995                          *
 ****************************************************************************/

#include <cctype>
#include <cstdio>
#include <cstring>
#include <ctime>
#include <cassert>
#include "editor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "board.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "descriptor.hpp"
#include "repos/playerrepository.hpp"

static void RemoveComment( Character *ch, Character *victim, std::shared_ptr<Note> pnote );

static void RemoveComment( Character *ch, Character *victim, std::shared_ptr<Note> pnote )
{
    if ( IsNpc( victim ) )
    {
        Log->Bug( "comment remove: NPC" );
        return;
    }

    assert(pnote != NULL);

    /*
     * Remove comment from linked list.
     */
    victim->PCData->Remove(pnote);

    /*
     * Rewrite entire list.
     */
    PlayerCharacters->Save(victim);
}

void do_comment( Character *ch, std::string argument )
{
    std::string arg;
    std::string arg1;
    Character *victim = NULL;
    int noteNumber = 0;
    int anum = 0;

    if ( IsNpc(ch) )
    {
        ch->Echo("Mobs can't use the comment command.\r\n");
        return;
    }

    if ( !ch->Desc )
    {
        Log->Bug( "do_comment: no descriptor" );
        return;
    }

    /* Put in to prevent crashing when someone issues a comment command
       from within the editor. -Narn */
    if ( ch->Desc->ConnectionState == CON_EDITING )
    {
        ch->Echo("You can't use the comment command from within the editor.\r\n");
        return;
    }

    SetCharacterColor( AT_NOTE, ch );
    argument = OneArgument( argument, arg );
    SmashTilde( argument );

    if ( !StrCmp( arg, "about" ) )
    {
        victim = GetCharacterAnywhere(ch, argument);

        if (!victim)
        {
            ch->Echo("They're not logged on!\r\n");
            return;
        }

        if ( IsNpc(victim) )
        {
            ch->Echo("No comments about mobs\r\n");
            return;
        }
    }


    if ( !StrCmp( arg, "list" ) )
    {
        victim = GetCharacterAnywhere(ch, argument);

        if (!victim)
        {
            ch->Echo("They're not logged on!\r\n");   /* maybe fix this? */
            return;
        }

        if ( IsNpc(victim) )
        {
            ch->Echo("No comments about mobs\r\n");
            return;
        }

        if ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
        {
            ch->Echo( "You're not of the right caliber to do this...\r\n" );
            return;
        }

        if ( victim->PCData->Comments().empty() )
        {
            ch->Echo( "There are no relevant comments.\r\n" );
            return;
        }

        for(auto pnote : victim->PCData->Comments())
        {
            noteNumber++;
            ch->Echo( "%2d) %-10s [%s] %s\r\n",
                      noteNumber,
                      pnote->Sender.c_str(),
                      pnote->Date.c_str(),
                      pnote->Subject.c_str() );
        }

        return;
    }

    if ( !StrCmp( arg, "read" ) )
    {
        bool fAll = false;

        argument = OneArgument( argument, arg1 );
        victim = GetCharacterAnywhere(ch, arg1);

        if (!victim)
        {
            ch->Echo("They're not logged on!\r\n");
            return;
        }

        if ( IsNpc(victim) )
        {
            ch->Echo("No comments about mobs\r\n");
            return;
        }

        if ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
        {
            ch->Echo( "You're not of the right caliber to do this...\r\n" );
            return;
        }

        if ( victim->PCData->Comments().empty() )
        {
            ch->Echo( "There are no relevant comments.\r\n" );
            return;
        }

        if ( !StrCmp( argument, "all" ) )
        {
            fAll = true;
            anum = 0;
        }
        else if ( IsNumber( argument ) )
        {
            fAll = false;
            anum = ToLong( argument );
        }
        else
        {
            ch->Echo( "Note read which number?\r\n" );
            return;
        }

        noteNumber = 0;

        for(auto pnote : victim->PCData->Comments())
        {
            noteNumber++;

            if ( noteNumber == anum || fAll )
            {
                ch->Echo( "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n",
                          noteNumber,
                          pnote->Sender.c_str(),
                          pnote->Subject.c_str(),
                          pnote->Date.c_str(),
                          pnote->ToList.c_str());

                ch->Echo( pnote->Text );
                return;
            }
        }

        ch->Echo( "No such comment.\r\n" );
        return;
    }

    if ( !StrCmp( arg, "write" ) )
    {
        AttachNote( ch );
        StartEditing(ch, ch->PCData->Note->Text,
                     [ch](const auto &txt)
                     {
                         ch->PCData->Note->Text = txt;
                     });
        SetEditorDesc( ch, "Player comment" );
        return;
    }

    if ( !StrCmp( arg, "subject" ) )
    {
        AttachNote( ch );
        ch->PCData->Note->Subject = argument;
        ch->Echo( "Ok.\r\n" );
        return;
    }

    if ( !StrCmp( arg, "to" ) )
    {
        AttachNote( ch );
        ch->PCData->Note->ToList = argument;
        ch->Echo( "Ok.\r\n" );
        return;
    }

    if ( !StrCmp( arg, "clear" ) )
    {
        ch->PCData->Note.reset();
        ch->Echo( "Ok.\r\n" );
        return;
    }

    if ( !StrCmp( arg, "show" ) )
    {
        if ( ch->PCData->Note == nullptr )
        {
            ch->Echo( "You have no comment in progress.\r\n" );
            return;
        }

        ch->Echo( "%s: %s\r\nTo: %s\r\n",
                  ch->PCData->Note->Sender.c_str(),
                  ch->PCData->Note->Subject.c_str(),
                  ch->PCData->Note->ToList.c_str());
        ch->Echo( "%s", ch->PCData->Note->Text.c_str() );
        return;
    }

    if ( !StrCmp( arg, "post" ) )
    {
        char *strtime = nullptr;

        if ( !ch->PCData->Note )
        {
            ch->Echo( "You have no comment in progress.\r\n" );
            return;
        }

        argument = OneArgument(argument, arg1);
        victim = GetCharacterAnywhere(ch, arg1);

        if (!victim)
        {
            ch->Echo("They're not logged on!\r\n");   /* maybe fix this? */
            return;
        }

        if ( IsNpc(victim) )
        {
            ch->Echo("No comments about mobs\r\n");
            return;
        }

        if (  GetTrustLevel(victim) > GetTrustLevel( ch ) )
        {
            ch->Echo( "You're not of the right caliber to do this...\r\n");
            return;
        }

        /* Act( AT_ACTION, "$n posts a note.", ch, NULL, NULL, ActTarget::Room ); */

        strtime                           = ctime( &current_time );
        strtime[strlen(strtime)-1]        = '\0';
        ch->PCData->Note->Date = strtime;

        std::shared_ptr<Note> pnote = ch->PCData->Note;
        ch->PCData->Note = NULL;
        victim->PCData->Add(pnote);

        PlayerCharacters->Save(victim);

        ch->Echo( "Ok.\r\n");
        return;
    }

    if ( !StrCmp( arg, "remove" ) )
    {
        bool found = false;
        argument = OneArgument(argument, arg1);
        victim = GetCharacterAnywhere(ch, arg1);

        if (!victim)
        {
            ch->Echo("They're not logged on!\r\n");   /* maybe fix this? */
            return;
        }

        if ( IsNpc(victim) )
        {
            ch->Echo("No comments about mobs\r\n");
            return;
        }

        if ( ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
             || !IsGreater( ch ) )
        {
            ch->Echo( "You're not of the right caliber to do this...\r\n");
            return;
        }

        /*argument = OneArgument(argument, arg); */
        if ( !IsNumber( argument ) )
        {
            ch->Echo( "Comment remove which number?\r\n");
            return;
        }

        anum = ToLong( argument );
        noteNumber = 0;

        for(auto pnote : victim->PCData->Comments())
        {
            noteNumber++;

            if ( IsGreater( ch ) && noteNumber == anum )
            {
                RemoveComment( ch, victim, pnote );
                ch->Echo( "Ok.\r\n" );
                found = true;
                break;
            }
        }

        if(!found)
        {
            ch->Echo( "No such comment.\r\n" );
        }

        return;
    }

    ch->Echo( "Huh? Type 'help comment' for usage.\r\n" );
}

static void WriteToFile(std::shared_ptr<Note> pnote, FILE *fp)
{
    fprintf( fp,"#COMMENT\n" );
    fprintf( fp,"sender       %s~\n",pnote->Sender.c_str());
    fprintf( fp,"date         %s~\n",pnote->Date.c_str());
    fprintf( fp,"to           %s~\n",pnote->ToList.c_str());
    fprintf( fp,"subject      %s~\n",pnote->Subject.c_str());
    fprintf( fp,"text\n%s~\n",pnote->Text.c_str());
}

void WriteComments( const Character *ch, FILE *fp )
{
    assert(ch->PCData != NULL);

    for(auto note : ch->PCData->Comments())
    {
        WriteToFile(note, fp);
    }
}

void ReadComment( Character *ch, FILE *fp )
{
    if( IsNpc( ch ) )
        return;

    for ( ; ; )
    {
        char letter = 0;

        do
        {
            letter = getc( fp );

            if ( feof(fp) )
            {
                fclose( fp );
                return;
            }
        }
        while ( isspace(letter) );

        ungetc( letter, fp );

        std::shared_ptr<Note> pnote = std::make_shared<Note>();

        if ( StrCmp( ReadWord( fp, Log, fBootDb ), "sender" ) )
            break;

        pnote->Sender = ReadStringToTilde( fp, Log, fBootDb );

        if ( StrCmp( ReadWord( fp, Log, fBootDb ), "date" ) )
            break;

        pnote->Date = ReadStringToTilde( fp, Log, fBootDb );

        if ( StrCmp( ReadWord( fp, Log, fBootDb ), "to" ) )
            break;

        pnote->ToList = ReadStringToTilde( fp, Log, fBootDb );

        if ( StrCmp( ReadWord( fp, Log, fBootDb ), "subject" ) )
            break;

        pnote->Subject = ReadStringToTilde( fp, Log, fBootDb );

        if ( StrCmp( ReadWord( fp, Log, fBootDb ), "text" ) )
            break;

        pnote->Text = ReadStringToTilde( fp, Log, fBootDb );

        ch->PCData->Add(pnote);
        return;
    }

    Log->Bug( "%s: bad key word. strap in!", __FUNCTION__ );
}

/*
  <758hp 100m 690mv> <#10316> loadup boo
  Log: Haus: loadup boo
  Log: Reading in player data for: Boo
  Done.
  <758hp 100m 690mv> <#10316> poke boo
  You poke him in the ribs.
  <758hp 100m 690mv> <#10316> comment subject boo's a nutcase!
  Ok.
  <758hp 100m 690mv> <#10316> comment to all
  Ok.
  <758hp 100m 690mv> <#10316> comment write
  Begin entering your text now (/? = help /s = save /c = clear /l = list)
  -----------------------------------------------------------------------
  > He transed shimmy to temple square!
  > /s
  Done.
  <758hp 100m 690mv> <#10316> comment post boo
  Ok.
  <758hp 100m 690mv> <#10316> comment list boo
  1) Haus: boo's a nutcase!
  <758hp 100m 690mv> <#10316> comment read boo 1
  [  1] Haus: boo's a nutcase!
  Sun Jun 25 18:26:54 1995
  To: all
  He transed shimmy to temple square!
  <758hp 100m 690mv> <#10316> comment remove boo 1
  Ok.
  <758hp 100m 690mv> <#10316> comment list boo
  There are no relevent comments.
*/
