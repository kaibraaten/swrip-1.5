#ifndef _SWRIP_BOARD_H_
#define _SWRIP_BOARD_H_

#include "types.hpp"

struct Note
{
  Note *Next;
  Note *Previous;
  char *Sender;
  char *Date;
  char *ToList;
  char *Subject;
  bool Voting;
  char *YesVotes;
  char *NoVotes;
  char *Abstentions;
  char *Text;
};

struct Board
{
  Board *Next;                    /* Next board in list              */
  Board *Previous;                    /* Previous board in list          */
  Note *FirstNote;              /* First note on board             */
  Note *LastNote;               /* Last note on board              */
  char *Name;             /* Filename to save notes to       */
  char *ReadGroup;            /* Can restrict a board to a       */
  char *PostGroup;            /* council, clan, guild etc        */
  char *ExtraReaders;         /* Can give read rights to players */
  char *ExtraRemovers;        /* Can give remove rights to players */
  vnum_t BoardObject;             /* Vnum of board object            */
  short NumberOfPosts;             /* Number of notes on this board   */
  short MinReadLevel;        /* Minimum level to read a note    */
  short MinPostLevel;        /* Minimum level to post a note    */
  short MinRemoveLevel;      /* Minimum level to remove a note  */
  short MaxPosts;             /* Maximum amount of notes allowed */
  int Type;                  /* Normal board or mail board? */
};

extern Board *FirstBoard;
extern Board *LastBoard;

void LoadBoards( void );
Board *GetBoardFromObject( const Object *obj );
Board *FindBoardHere( const Character *ch );
Board *GetBoard( const char *name );
void FreeNote( Note *pnote );
void SaveBoards( void );
bool SaveBoard( const Board *board, char dummyUserData );
void OperateOnNote( Character *ch, char *arg_passed, bool IS_MAIL );
void AttachNote(Character *ch);
void CountMailMessages(const Character *ch);
const char *GetBoardFilename( const Board *board );

#endif
