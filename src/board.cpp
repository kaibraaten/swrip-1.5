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
 ****************************************************************************/

#include <string>
#include <sstream>
#include <cassert>
#include <cctype>
#include <ctime>
#include <cstring>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "clan.hpp"
#include "board.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "systemdata.hpp"
#include "repos/boardrepository.hpp"

/* Defines for voting on notes. -- Narn */
#define VOTE_NONE 0
#define VOTE_OPEN 1
#define VOTE_CLOSED 2

class _IsNoteTo
{
public:
  _IsNoteTo(const Character *recipient)
    : ch(recipient)
  {

  }

  bool operator()(const Note *pnote) const
  {
    if ( !StrCmp( ch->Name, pnote->Sender ) )
      return true;

    if ( IsName( "all", pnote->ToList ) )
      return true;

    if ( IsAvatar(ch) && IsName( "immortal", pnote->ToList ) )
      return true;

    if ( IsName( ch->Name, pnote->ToList ) )
      return true;

    return false;
  }

private:
  const Character *ch;
};

static void RemoveNote( Board *board, Note *pnote );
static bool CanRemove( const Character *ch, const Board *board );
static bool CanRead( const Character *ch, const Board *board );
static bool CanPost( const Character *ch, const Board *board );
static Object *FindQuill( const Character *ch );

//////////////////////////////////////////////////////////////
struct Board::Impl
{
  std::list<Note*> Notes;
};

//////////////////////////////////////////////////////////////
Board::Board()
  : pImpl(new Impl())
{

}

Board::~Board()
{
  delete pImpl;
}

void Board::Add(Note *note)
{
  pImpl->Notes.push_back(note);
}

void Board::Remove(Note *note)
{
  pImpl->Notes.remove(note);
}

const std::list<Note*> &Board::Notes() const
{
  return pImpl->Notes;
}

//////////////////////////////////////////////////////////////

static bool CanRemove( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can remove it. */
  if ( GetTrustLevel( ch ) >= board->MinRemoveLevel )
    return true;

  if ( !board->ExtraRemovers.empty() )
    {
      if ( IsName( ch->Name, board->ExtraRemovers ) )
        return true;
    }

  return false;
}

static bool CanRead( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can read it. */
  if ( GetTrustLevel( ch ) >= board->MinReadLevel )
    return true;

  /* Your trust wasn't high enough, so check if a read_group or extra
     readers have been set up. */
  if ( !board->ReadGroup.empty() )
    {
      if ( ch->PCData->ClanInfo.Clan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->Name, board->ReadGroup ) )
        return true;

      if ( ch->PCData->ClanInfo.Clan
	   && ch->PCData->ClanInfo.Clan->MainClan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name, board->ReadGroup ) )
        return true;

    }

  if ( !board->ExtraReaders.empty() )
    {
      if ( IsName( ch->Name, board->ExtraReaders ) )
        return true;
    }

  return false;
}

static bool CanPost( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can post. */
  if ( GetTrustLevel( ch ) >= board->MinPostLevel )
    return true;

  /* Your trust wasn't high enough, so check if a post_group has been set up. */
  if ( !board->PostGroup.empty() )
    {
      if ( ch->PCData->ClanInfo.Clan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->Name, board->PostGroup ) )
        return true;

      if ( ch->PCData->ClanInfo.Clan
	   && ch->PCData->ClanInfo.Clan->MainClan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name, board->PostGroup ) )
        return true;
    }

  return false;
}

Board *GetBoardFromObject( const Object *obj )
{
  return Boards->Find([obj](const auto &board)
                          {
                            return board->BoardObject == obj->Prototype->Vnum;
                          });
}

void AttachNote( Character *ch )
{
  if ( IsNpc( ch ) )
    return;

  if ( ch->PCData->Note )
    return;

  Note *pnote = new Note();
  pnote->Sender = ch->Name;
  ch->PCData->Note     = pnote;
}

void FreeNote( Note *pnote )
{
  delete pnote;
}

static void RemoveNote( Board *board, Note *pnote )
{
  assert(board != nullptr);
  assert(pnote != nullptr);

  /*
   * Remove note from linked list.
   */
  board->Remove(pnote);

  FreeNote( pnote );
  Boards->Save(board);
}


static Object *FindQuill( const Character *ch )
{
  auto result = Filter(ch->Objects(),
                       [ch](auto obj)
                       {
                         return obj->ItemType == ITEM_PEN
                           && CanSeeObject(ch, obj);
                       });

  if(!result.empty())
    {
      return result.front();
    }
  else
    {
      return nullptr;
    }
}

void OperateOnNote( Character *ch, std::string arg_passed, bool IS_MAIL )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  std::string arg;
  Board *board = NULL;
  int anum = 0;
  int first_list = 0;
  Object *quill = NULL, *paper = NULL, *tmpobj = NULL;
  ExtraDescription *ed = NULL;

  if ( IsNpc(ch) )
    return;

  if ( !ch->Desc )
    {
      Log->Bug( "%s: no descriptor", __FUNCTION__ );
      return;
    }

  switch( ch->SubState )
    {
    default:
      break;

    case SUB_WRITING_NOTE:
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          Log->Bug("%s: player not holding paper", __FUNCTION__);
          StopEditing( ch );
          return;
        }

      ed = (ExtraDescription*)ch->dest_buf;
      ed->Description = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );
  arg_passed = OneArgument( arg_passed, arg );
  SmashTilde( arg_passed );

  if ( !StrCmp( arg, "list" ) )
    {
      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no board here to look at.\r\n" );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You cannot make any sense of the cryptic scrawl on this board...\r\n" );
          return;
        }

      first_list = strtol(arg_passed.c_str(), nullptr, 10);

      if (first_list)
        {
          if (IS_MAIL)
            {
              ch->Echo( "You cannot use a list number (at this time) with mail.\r\n" );
              return;
            }

          if (first_list < 1)
            {
              ch->Echo( "You can't read a message before 1!\r\n" );
              return;
            }
        }

      if (!IS_MAIL)
        {
          int count = 0;
          SetCharacterColor( AT_NOTE, ch );
          _IsNoteTo _isNoteTo(ch);

          for(const Note *note : board->Notes())
            {
              count++;

              if ( (first_list && count >= first_list) || !first_list )
                ch->Echo( "%2d%c %-12s%c %-12s %s\r\n",
                          count,
                          _isNoteTo( note ) ? ')' : '}',
                          note->Sender.c_str(),
                          (note->Voting != VOTE_NONE) ? (note->Voting == VOTE_OPEN ? 'V' : 'C') : ':',
                          note->ToList.c_str(),
                          note->Subject.c_str() );
            }

          Act( AT_ACTION, "$n glances over the messages.", ch, NULL, NULL, TO_ROOM );

	  if( count == 0 )
            {
              ch->Echo( "There are no messages on this board.\r\n" );
            }
	  
          return;
        }
      else
        {
          int count = 0;

          if (IS_MAIL) /* SB Mail check for Brit */
            {
              bool mfound = Find(board->Notes(), _IsNoteTo(ch));

              if ( !mfound && GetTrustLevel(ch) < SysData.ReadAllMail )
                {
                  ch->Echo( "You have no mail.\r\n");
                  return;
                }
            }

          _IsNoteTo _isNoteTo(ch);

          for(const Note *note : board->Notes())
            {
              if (_isNoteTo( note ) || GetTrustLevel(ch) > SysData.ReadAllMail)
                {
                  ch->Echo( "%2d%c %s: %s\r\n",
                            ++count,
                            _isNoteTo( note ) ? '-' : '}',
                            note->Sender.c_str(),
                            note->Subject.c_str() );
                }
            }

          return;
        }
    }
  else if ( !StrCmp( arg, "read" ) )
    {
      bool fAll = false;

      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no board here to look at.\r\n" );
          return;
        }
      
      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You cannot make any sense of the cryptic scrawl on this board...\r\n" );
          return;
        }

      if ( !StrCmp( arg_passed, "all" ) )
        {
          fAll = true;
          anum = 0;
        }
      else if ( IsNumber( arg_passed ) )
        {
          fAll = false;
          anum = ToLong( arg_passed );
        }
      else
        {
          ch->Echo( "Note read which number?\r\n" );
          return;
        }

      SetCharacterColor( AT_NOTE, ch );

      if (!IS_MAIL)
        {
          int counter = 0;
          bool wasfound = false;

          for(const Note *note : board->Notes())
            {
              counter++;

              if ( counter == anum || fAll )
                {
                  wasfound = true;
                  ch->Echo( "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                            counter,
                            note->Sender.c_str(),
                            note->Subject.c_str(),
                            note->Date.c_str(),
                            note->ToList.c_str(),
                            note->Text.c_str() );

                  if ( !note->YesVotes.empty()
		       || !note->NoVotes.empty()
                       || !note->Abstentions.empty() )
                    {
                      ch->Echo("------------------------------------------------------------\r\n");
                      ch->Echo( "Votes:\r\nYes:     %s\r\nNo:      %s\r\nAbstain: %s\r\n",
                                note->YesVotes.c_str(), note->NoVotes.c_str(),
                                note->Abstentions.c_str() );
                    }

                  Act( AT_ACTION, "$n reads a message.", ch, NULL, NULL, TO_ROOM );
                }
            }

          if ( !wasfound )
            {
              ch->Echo( "No such message: %d\r\n", anum);
            }

          return;
        }
      else
        {
          int counter = 0;
          bool wasfound = false;
          _IsNoteTo _isNoteTo(ch);

          for(const Note *note : board->Notes())
            {
              if (_isNoteTo(note) || GetTrustLevel(ch) > SysData.ReadAllMail)
                {
                  counter++;

                  if ( counter == anum || fAll )
                    {
                      wasfound = true;

                      if ( ch->Gold < 10
                           &&   GetTrustLevel(ch) < SysData.ReadMailFree )
                        {
                          ch->Echo("It costs 10 credits to read a message.\r\n");
                          return;
                        }

                      if (GetTrustLevel(ch) < SysData.ReadMailFree)
                        {
                          ch->Gold -= 10;
                        }

                      ch->Echo( "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                                counter,
                                note->Sender.c_str(),
                                note->Subject.c_str(),
                                note->Date.c_str(),
                                note->ToList.c_str(),
                                note->Text.c_str() );
                    }
                }
            }

          if (!wasfound)
            {
              ch->Echo( "No such message: %d\r\n", anum);
            }

          return;
        }
    }
  else if ( !StrCmp( arg, "vote" ) )
    {
      std::string arg2;
      int counter = 0;
      bool found = false;
      Note *note = nullptr;
      arg_passed = OneArgument( arg_passed, arg2 );
      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no bulletin board here.\r\n" );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You cannot vote on this board.\r\n" );
          return;
        }

      if ( IsNumber( arg2 ) )
        {
          anum = ToLong( arg2 );
        }
      else
        {
          ch->Echo( "Note vote which number?\r\n" );
          return;
        }

      counter = 1;

      for(std::list<Note*>::const_iterator i = board->Notes().begin();
          i != board->Notes().end(); ++i)
        {
          note = *i;
          ++counter;

          if(counter == anum)
            {
              found = true;
              break;
            }
        }

      if ( !found )
        {
          ch->Echo( "No such note.\r\n" );
          return;
        }

      /* Options: open close yes no abstain */
      /* If you're the author of the note and can read the board you can open
         and close voting, if you can read it and voting is open you can vote.
      */
      if ( !StrCmp( arg_passed, "open" ) )
        {
          if ( StrCmp( ch->Name, note->Sender ) )
            {
              ch->Echo( "You are not the author of this message.\r\n" );
              return;
            }
          
          note->Voting = VOTE_OPEN;
          Act( AT_ACTION, "$n opens voting on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Voting opened.\r\n" );
          Boards->Save(board);
          return;
        }

      if ( !StrCmp( arg_passed, "close" ) )
        {
          if ( StrCmp( ch->Name, note->Sender ) )
            {
              ch->Echo( "You are not the author of this message.\r\n" );
              return;
            }
          
          note->Voting = VOTE_CLOSED;
          Act( AT_ACTION, "$n closes voting on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Voting closed.\r\n" );
          Boards->Save(board);
          return;
        }

      /* Make sure the note is open for voting before going on. */
      if ( note->Voting != VOTE_OPEN )
        {
          ch->Echo( "Voting is not open on this note.\r\n" );
          return;
        }

      /* Can only vote once on a note. */
      sprintf( buf, "%s %s %s",
               note->YesVotes.c_str(), note->NoVotes.c_str(), note->Abstentions.c_str() );

      if ( IsName( ch->Name, buf ) )
        {
          ch->Echo( "You have already voted on this note.\r\n" );
          return;
        }

      if ( !StrCmp( arg_passed, "yes" ) )
        {
          note->YesVotes += " " + ch->Name;
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Ok.\r\n" );
          Boards->Save(board);
          return;
        }

      if ( !StrCmp( arg_passed, "no" ) )
        {
          note->NoVotes += " " + ch->Name;
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Ok.\r\n" );
          Boards->Save(board);
          return;
        }

      if ( !StrCmp( arg_passed, "abstain" ) )
        {
          note->Abstentions += " " + ch->Name;
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Ok.\r\n" );
          Boards->Save(board);
          return;
        }

      OperateOnNote( ch, "", false );
    }
  else if ( !StrCmp( arg, "write" ) )
    {
      if ( ch->SubState == SUB_RESTRICTED )
        {
          ch->Echo( "You cannot write a note from within another command.\r\n" );
          return;
        }

      if (GetTrustLevel (ch) < SysData.WriteMailFree)
        {
          quill = FindQuill( ch );

          if (!quill)
            {
              ch->Echo("You need a datapad to record a message.\r\n");
              return;
            }

          if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              ch->Echo("Your quill is dry.\r\n");
              return;
            }
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           || paper->ItemType != ITEM_PAPER )
        {
          if (GetTrustLevel(ch) < SysData.WriteMailFree )
            {
              ch->Echo("You need to be holding a message disk to write a note.\r\n");
              return;
            }

          paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );

          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            {
              UnequipCharacter(ch, tmpobj);
            }

          paper = ObjectToCharacter(paper, ch);
          EquipCharacter(ch, paper, WEAR_HOLD);
          Act(AT_MAGIC, "$n grabs a message tisk to record a note.",
              ch, NULL, NULL, TO_ROOM);
          Act(AT_MAGIC, "You get a message disk to record your note.",
              ch, NULL, NULL, TO_CHAR);
        }

      if (paper->Value[OVAL_PAPER_0] < 2 )
        {
          paper->Value[OVAL_PAPER_0] = 1;
          ed = SetOExtra(paper, "_text_");
          ch->SubState = SUB_WRITING_NOTE;
          ch->dest_buf = ed;

          if ( GetTrustLevel(ch) < SysData.WriteMailFree )
	    {
	      --quill->Value[OVAL_PEN_INK_AMOUNT];
	    }

          StartEditing( ch, ed->Description );
	  SetEditorDescription( ch, "Note" );
          return;
        }
      else
        {
          ch->Echo("You cannot modify this message.\r\n");
          return;
        }
    }
  else if ( !StrCmp( arg, "subject" ) )
    {
      if(GetTrustLevel(ch) < SysData.WriteMailFree)
        {
          quill = FindQuill( ch );

          if ( !quill )
            {
              ch->Echo("You need a datapad to record a disk.\r\n");
              return;
            }

	  if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              ch->Echo("Your quill is dry.\r\n");
              return;
            }
        }
      
      if ( arg_passed.empty() )
        {
          ch->Echo("What do you wish the subject to be?\r\n");
          return;
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < SysData.WriteMailFree )
            {
              ch->Echo("You need to be holding a message disk to record a note.\r\n");
              return;
            }

          paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );

          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            UnequipCharacter(ch, tmpobj);

          paper = ObjectToCharacter(paper, ch);
          EquipCharacter(ch, paper, WEAR_HOLD);
          Act(AT_MAGIC, "$n grabs a message disk.",
              ch, NULL, NULL, TO_ROOM);
          Act(AT_MAGIC, "You get a message disk to record your note.",
              ch, NULL, NULL, TO_CHAR);
        }
      if (paper->Value[OVAL_PAPER_0] > 1 )
        {
          ch->Echo("You cannot modify this message.\r\n");
          return;
        }
      else
        {
          paper->Value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          ed->Description = arg_passed;
          ch->Echo("Ok.\r\n");
          return;
        }
    }
  else if ( !StrCmp( arg, "to" ) )
    {
      struct stat fst;
      char fname[1024];

      if(GetTrustLevel(ch) < SysData.WriteMailFree )
        {
          quill = FindQuill( ch );

          if ( !quill )
            {
              ch->Echo("You need a datapad to record a message.\r\n");
              return;
            }
          
          if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              ch->Echo("Your quill is dry.\r\n");
              return;
            }
        }

      if ( arg_passed.empty() )
        {
          ch->Echo("Please specify an addressee.\r\n");
          return;
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < SysData.WriteMailFree )
            {
              ch->Echo("You need to be holding a message disk to record a note.\r\n");
              return;
            }

	  paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );

          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            UnequipCharacter(ch, tmpobj);

	  paper = ObjectToCharacter(paper, ch);
          EquipCharacter(ch, paper, WEAR_HOLD);
          Act(AT_MAGIC, "$n gets a message disk to record a note.",
              ch, NULL, NULL, TO_ROOM);
          Act(AT_MAGIC, "You grab a message disk to record your note.",
              ch, NULL, NULL, TO_CHAR);
        }

      if (paper->Value[OVAL_PAPER_2] > 1)
        {
          ch->Echo("You cannot modify this message.\r\n");
          return;
        }

      arg_passed[0] = CharToUppercase(arg_passed[0]);

      sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(arg_passed[0]),
               Capitalize( arg_passed ).c_str() );

      if ( !IS_MAIL || stat( fname, &fst ) != -1 || !StrCmp(arg_passed, "all") )
        {
          paper->Value[OVAL_PAPER_2] = 1;
          ed = SetOExtra(paper, "_to_");
          ed->Description = arg_passed;
          ch->Echo("Ok.\r\n");
          return;
        }
      else
        {
          ch->Echo("No player exists by that name.\r\n");
          return;
        }
    }
  else if ( !StrCmp( arg, "show" ) )
    {
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          ch->Echo("You are not holding a message disk.\r\n");
          return;
        }

      const auto extraDescriptions(paper->ExtraDescriptions());

      std::string subject = GetExtraDescription( "_subject_", extraDescriptions );
      
      if ( subject.empty() )
        subject = "(no subject)";

      std::string to_list = GetExtraDescription( "_to_", extraDescriptions );
      
      if ( to_list.empty() )
        to_list = "(nobody)";

      ch->Echo( "%s: %s\r\nTo: %s\r\n",
                ch->Name.c_str(),
                subject.c_str(),
                to_list.c_str() );

      std::string text = GetExtraDescription( "_text_", extraDescriptions );
      
      if ( text.empty() )
        text = "The disk is blank.\r\n";

      ch->Echo("%s", text);
      return;
    }
  else if ( !StrCmp( arg, "post" ) )
    {
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          ch->Echo("You are not holding a message disk.\r\n");
          return;
        }

      if ( paper->Value[OVAL_PAPER_0] == 0 )
        {
          ch->Echo("There is nothing written on this disk.\r\n");
          return;
        }

      if ( paper->Value[OVAL_PAPER_1] == 0 )
        {
          ch->Echo("This message has no subject... using 'none'.\r\n");
          paper->Value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          ed->Description = "none";
        }

      if (paper->Value[OVAL_PAPER_2] == 0)
        {
          if ( IS_MAIL )
            {
              ch->Echo("This message is addressed to no one!\r\n");
              return;
            }
          else
            {
              ch->Echo("This message is addressed to no one... sending to 'all'!\r\n");
              paper->Value[OVAL_PAPER_2] = 1;
              ed = SetOExtra(paper, "_to_");
              ed->Description = "All";
            }
        }

      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no terminal here to upload your message to.\r\n" );
          return;
        }

      if ( !CanPost( ch, board ) )
        {
          ch->Echo( "You cannot use this terminal. It is encrypted...\r\n" );
          return;
        }

      if ( board->Notes().size() >= (size_t)board->MaxPosts )
        {
          ch->Echo( "This terminal is full. There is no room for your message.\r\n" );
          return;
        }

      Act( AT_ACTION, "$n uploads a message.", ch, NULL, NULL, TO_ROOM );

      const auto extraDescriptions(paper->ExtraDescriptions());
      
      char *strtime                     = ctime( &current_time );
      strtime[strlen(strtime)-1]        = '\0';
      Note *note = new Note();
      note->Date = strtime;

      note->Text = GetExtraDescription( "_text_", extraDescriptions );
      note->ToList = GetExtraDescription( "_to_", extraDescriptions );
      note->Subject = GetExtraDescription( "_subject_", extraDescriptions );
      note->Sender = ch->Name;

      board->Add(note);
      Boards->Save(board);
      ch->Echo( "You upload your message to the terminal.\r\n" );
      ExtractObject( paper );
      return;
    }
  else if ( !StrCmp( arg, "remove" )
            || !StrCmp( arg, "take" )
            || !StrCmp( arg, "copy" ) )
    {
      enum
      {
        NOTE_REMOVE,
        NOTE_TAKE,
        NOTE_COPY
      };

      int take = 0;
      int counter = 0;
      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no terminal here to download a note from!\r\n" );
          return;
        }

      if ( !StrCmp( arg, "take" ) )
        {
          take = NOTE_TAKE;
        }
      else if ( !StrCmp( arg, "copy" ) )
        {
          if ( !IsImmortal(ch) )
            {
              ch->Echo( "Huh?  Type 'help note' for usage.\r\n" );
              return;
            }

          take = NOTE_COPY;
        }
      else
        {
          take = NOTE_REMOVE;
        }

      if ( !IsNumber( arg_passed ) )
        {
          ch->Echo( "Note remove which number?\r\n" );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You can't make any sense of what's posted here, let alone remove anything!\r\n" );
          return;
        }

      anum = strtol( arg_passed.c_str(), nullptr, 10);
      _IsNoteTo _isNoteTo(ch);

      for(Note *note : board->Notes())
        {
          if (IS_MAIL && ((_isNoteTo(note))
                          || GetTrustLevel(ch) >= SysData.TakeOthersMail))
            {
              counter++;
            }
          else if (!IS_MAIL)
            {
              counter++;
            }

          if ( ( _isNoteTo(note)
                 || CanRemove(ch, board))
               &&   ( counter == anum ) )
            {
              if ( IsName("all", note->ToList)
                   && GetTrustLevel( ch ) < SysData.TakeOthersMail
                   && take != NOTE_COPY )
                {
                  ch->Echo("Notes addressed to 'all' can not be taken.\r\n");
                  return;
                }

              if ( take != NOTE_REMOVE )
                {
                  if ( ch->Gold < 50 && GetTrustLevel(ch) < SysData.ReadMailFree )
                    {
                      if ( take == NOTE_TAKE )
                        ch->Echo("It costs 50 credits to take your mail.\r\n");
                      else
                        ch->Echo("It costs 50 credits to copy your mail.\r\n");

                      return;
                    }

                  if ( GetTrustLevel(ch) < SysData.ReadMailFree )
                    ch->Gold -= 50;

                  paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
                  ed = SetOExtra( paper, "_sender_" );
                  ed->Description = note->Sender;
                  ed = SetOExtra( paper, "_text_" );
                  ed->Description = note->Text;
                  ed = SetOExtra( paper, "_to_" );
                  ed->Description = note->ToList;
                  ed = SetOExtra( paper, "_subject_" );
                  ed->Description = note->Subject;
                  ed = SetOExtra( paper, "_date_" );
                  ed->Description = note->Date;
                  ed = SetOExtra( paper, "note" );
                  std::ostringstream notebuf;
                  
                  notebuf << "From: " << note->Sender
                          << "\r\nTo: " << note->ToList
                          << "\r\nSubject: " << note->Subject
                          << "\r\n\r\n"
                          << note->Text
                          << "\r\n";
                  ed->Description = notebuf.str();
                  paper->Value[OVAL_PAPER_0] = 2;
                  paper->Value[OVAL_PAPER_1] = 2;
                  paper->Value[OVAL_PAPER_2] = 2;
                  paper->ShortDescr = FormatString("a note from %s to %s",
                                                   note->Sender.c_str(), note->ToList.c_str());
                  paper->Description = FormatString("A note from %s to %s lies on the ground.",
                                                    note->Sender.c_str(), note->ToList.c_str() );
                  paper->Name = FormatString("note parchment paper %s", note->ToList.c_str());
                }

              if ( take != NOTE_COPY )
                {
                  RemoveNote( board, note );
                }

              ch->Echo( "Ok.\r\n" );

              if(take == NOTE_REMOVE)
                {
                  Act( AT_ACTION, "$n removes a message.", ch, NULL, NULL, TO_ROOM );
                }
              else if ( take == NOTE_TAKE )
                {
                  Act( AT_ACTION, "$n downloads a message.", ch, NULL, NULL, TO_ROOM );
                  ObjectToCharacter(paper, ch);
                }
              else if ( take == NOTE_COPY )
                {
                  Act( AT_ACTION, "$n copies a message.", ch, NULL, NULL, TO_ROOM );
                  ObjectToCharacter(paper, ch);
                }
              else
                {
                  Log->Bug("OperateOnNote(): Invalid value for take: %d", take);
                  abort();
                }
            }
        }

      ch->Echo( "No such message.\r\n" );
      return;
    }

  ch->Echo( "Huh? Type 'help note' for usage.\r\n" );
}

void CountMailMessages(const Character *ch)
{
  size_t cnt = 0;

  for(const Board *board : Boards->Entities())
    {
      if ( board->Type == BOARD_MAIL && CanRead(ch, board) )
	{
          cnt += Count(board->Notes(), _IsNoteTo(ch));
	}
    }

  if ( cnt != 0)
    {
      ch->Echo("You have %d mail messages waiting.\r\n", cnt);
    }
}

Board *FindBoardHere( const Character *ch )
{
  for(const Object *obj : ch->InRoom->Objects())
    {
      Board *board = GetBoardFromObject(obj);
      
      if ( board != nullptr )
	{
	  return board;
	}
    }

  return nullptr;
}

Board *GetBoard( const std::string &name )
{
  return Boards->Find([name](const auto &board){ return StrCmp(board->Name, name) == 0; });
}

Board *AllocateBoard(const std::string &name)
{
  Board *board = new Board();
  board->Name = ToLower(name);

  return board;
}

void FreeBoard(Board *board)
{
  delete board;
}
