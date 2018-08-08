#include "character.hpp"
#include "mud.hpp"

/*
 * 'Split' originally by Gnort, God of Chaos.
 */
void do_split( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *gch = NULL;
  int members = 0;
  int amount = 0;
  int share = 0;
  int extra = 0;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Split how much?\r\n");
      return;
    }

  amount = atoi( arg );

  if ( amount < 0 )
    {
      ch->Echo("Your group wouldn't like that.\r\n");
      return;
    }

  if ( amount == 0 )
    {
      ch->Echo("You hand out zero credits, but no one notices.\r\n");
      return;
    }

  if ( ch->Gold < amount )
    {
      ch->Echo("You don't have that many credits.\r\n");
      return;
    }

  for ( gch = ch->InRoom->FirstPerson; gch; gch = gch->NextInRoom )
    {
      if ( IsInSameGroup( gch, ch ) )
	{
	  members++;
	}
    }


  if (( IsBitSet(ch->Flags, PLR_AUTOGOLD)) && (members < 2))
    {
      return;
    }

  if ( members < 2 )
    {
      ch->Echo("Just keep it all.\r\n");
      return;
    }

  share = amount / members;
  extra = amount % members;

  if ( share == 0 )
    {
      ch->Echo("Don't even bother, cheapskate.\r\n");
      return;
    }

  ch->Gold -= amount;
  ch->Gold += share + extra;

  SetCharacterColor( AT_GOLD, ch );
  ch->Echo("You split %d credits. Your share is %d credits.\r\n",
           amount, share + extra );

  sprintf( buf, "$n splits %d credits. Your share is %d credits.",
           amount, share );

  for ( gch = ch->InRoom->FirstPerson; gch; gch = gch->NextInRoom )
    {
      if ( gch != ch && IsInSameGroup( gch, ch ) )
        {
          Act( AT_GOLD, buf, ch, NULL, gch, TO_VICT );
          gch->Gold += share;
        }
    }
}

