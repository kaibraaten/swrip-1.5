#include <utility/algorithms.hpp>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "descriptor.hpp"
#include "race.hpp"
#include "repos/descriptorrepository.hpp"

/*
 * New do_who with WHO REQUEST, clan, race and homepage support.  -Thoric
 *
 * Latest version of do_who eliminates redundant code by using linked lists.
 * Shows imms separately, indicates guest and retired immortals.
 * Narn, Oct/96

 * Changed it so that only immortals can access the who clan list for
 * a clan other than your own, as well as who level information.

 * *wanted for murder* flags will no only show up for immortals

 * Darrik Vequir, Feb/00

 * Who will now show forcers for immortals - DV Sep/00

 * Races will no longer show up for mortals - DV Oct/00

 */

class WhoData
{
public:
  std::string Text;
  int Type = 0;
};

void do_who( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  std::string clan_name;
  std::string invis_str;
  std::string char_name;
  std::string extra_title;
  std::string race_text;
  int iRace = 0;
  int iLevelLower = 0;
  int iLevelUpper = MAX_LEVEL;
  int nNumber = 0;
  int nMatch = 0;
  std::array<bool, MAX_RACE> rgfRace;
  bool fRaceRestrict = false;
  bool fImmortalOnly = false;
  bool fShowHomepage = false;
  bool fClanMatch = false;
  bool NullCh = false;
  Clan *pClan = NULL;
  FILE *whoout = NULL;
  Descriptor *desc = nullptr;
  std::list<WhoData> immortals;
  std::list<WhoData> mortals;
  std::list<WhoData> newbies;
  
  /*
   * Set default arguments.
   */
  rgfRace.fill(false);

  if ( ch == nullptr )
    {
      NullCh = true;
      desc = new NullDescriptor();
      ch = new Character(new PCData(), desc);
      ch->TopLevel = 1;
      ch->InRoom = GetRoom( ROOM_VNUM_LIMBO );
    }

  /*
   * Parse arguments.
   */
  for ( ;; )
    {
      std::string arg;
      argument = OneArgument( argument, arg );

      if ( arg.empty() )
        break;

      if ( IsNumber( arg ) )
        {
          if (ch->TopLevel >= LEVEL_IMMORTAL)
            {
              switch ( ++nNumber )
                {
                case 1:
                  iLevelLower = ToLong( arg );
                  break;

                case 2:
                  iLevelUpper = ToLong( arg );
                  break;

                default:
                  ch->Echo("Only two level numbers allowed.\r\n");
                  return;
                }
            }
          else
            {
              ch->Echo("This can only be used by immortals.\r\n");
              return;
            }
        }
      else
        {
          /* activate/deactivate whoCloak Darrik Vequir */
          if ( !StrCmp( arg, "on" ) && ch->PCData )
            {
              if (!ch->PCData->WhoCloak)
                {
                  ch->Echo("Who Cloaking is on.\r\n");
                  ch->PCData->WhoCloak = true;
                  return;
                }
              else
                {
                  ch->Echo("Who Cloaking is already on.\r\n");
                  return;
		}
            }

          if ( !StrCmp( arg, "off" ) && ch->PCData )
            {
              if (ch->PCData->WhoCloak)
                {
                  ch->Echo("Who Cloaking is off.\r\n");
                  ch->PCData->WhoCloak = false;
                  return;
                }
              else
                {
                  ch->Echo("Who Cloaking is already off.\r\n");
                  return;
                }
            }

          if ( arg.size() < 3 )
            {
              ch->Echo("Be a little more specific please.\r\n");
              return;
            }

          /*
           * Look for classes to turn on.
           */

          if ( !StrCmp( arg, "imm" ) || !StrCmp( arg, "gods" ) )
            fImmortalOnly = true;
          else
            {
              if ( !StrCmp( arg, "www" ) )
                fShowHomepage = true;
              else               /* SB who clan (order), guild */
                {
                  if (!StrCmp( arg, "clan" ) && IsClanned( ch ) )
                    arg = ch->PCData->ClanInfo.Clan->Name;

                  if ( (pClan = GetClan (arg)) && (fClanMatch != true))
                    {
                      if ((ch->TopLevel >= LEVEL_IMMORTAL)
			  || (IsClanned( ch )
			      && !StrCmp(ch->PCData->ClanInfo.Clan->Name, pClan->Name)))
                        {
                          fClanMatch = true;
                        }
                      else
                        {
                          ch->Echo("&ROnly immortals can do that to another clan!&w\r\n");
                          return;
                        }
                    }
                  else
                    {
                      for ( iRace = 0; iRace < MAX_RACE; iRace++ )
                        {
                          if ( IsGreater(ch) && (!StrCmp( arg, RaceTable[iRace].Name ) ) )
                            {
                              rgfRace[iRace] = true;
                              break;
                            }
                        }

                      if ( iRace != MAX_RACE )
                        fRaceRestrict = true;

                      if ( iRace == MAX_RACE && fClanMatch == false )
                        {
                          ch->Echo("Only immortals can do that.\r\n");
                          return;
                        }
                    }
                }
            }
        }
    }

  /*
   * Now find matching chars.
   */
  nMatch = 0;

  if ( ch && !NullCh)
    SetCharacterColor( AT_GREEN, ch );
  else
    {
      if ( fShowHomepage )
        whoout = fopen( WEBWHO_FILE, "w" );
      else
        whoout = fopen( WHO_FILE, "w" );
    }

  /* start from last to first to get it in the proper order */
  for ( const Descriptor *d : Reverse(Descriptors->Entities()))
    {
      const Character *wch = nullptr;
      std::string race;
      char force_char = ' ';

      if ( (d->ConnectionState != CON_PLAYING && d->ConnectionState != CON_EDITING)
           || ( !CanSeeCharacter( ch, d->Character ) && IsImmortal( d->Character ) )
           || d->Original)
        {
          continue;
        }
      
      wch = d->Original ? d->Original : d->Character;

      if ( wch->TopLevel < iLevelLower
           ||   wch->TopLevel > iLevelUpper
           || ( fImmortalOnly  && wch->TopLevel < LEVEL_IMMORTAL )
           || ( fRaceRestrict && !rgfRace[wch->Race] )
           || ( fClanMatch && ( pClan != wch->PCData->ClanInfo.Clan ))  /* SB */ )
        {
          continue;
        }
      
      nMatch++;
      /* added optional invisibility on the who list to players who want it.
         Darrik Vequir */

      if ( (wch->PCData->WhoCloak == true) && (ch->TopLevel < LEVEL_GREATER))
        {
          continue;
        }
      
      if ( fShowHomepage
           && !wch->PCData->HomePage.empty() )
        {
          char_name = FormatString( "<A HREF=\"%s\">%s</A>",
                                    wch->PCData->HomePage.c_str(),
                                    wch->Name.c_str() );
        }
      else
        {
          char_name.erase();
        }
      
      if ( IsGreater(ch) )
        {
          race_text = FormatString( "(%s) ", RaceTable[wch->Race].Name);
        }
      else
        {
          race_text.erase();
        }

      race = race_text;

      if (wch->PermStats.Frc > 0 && (ch->TopLevel >= LEVEL_GREATER) && !IsImmortal(wch))
        {
          if(IsJedi( wch ))
            force_char = '*';
          else
            force_char = '+';
        }

      switch ( wch->TopLevel )
	{
        default:
          break;

        case MAX_LEVEL - 0:
          race = "Implementor";
          break;

        case MAX_LEVEL - 1:
          race = "Head Administrator";
          break;

        case MAX_LEVEL - 2:
          race = "Administrator";
          break;

        case MAX_LEVEL - 3:
          race = "Builder";
          break;

        case MAX_LEVEL - 4:
          race = "Builder";
          break;
        }

      if ( !NiftyIsName(wch->Name, wch->PCData->Title) && ch->TopLevel > wch->TopLevel )
        extra_title = FormatString( " [%s]" , wch->Name.c_str() );
      else
        extra_title.erase();

      if ( IsRetiredImmortal( wch ) )
        race = "Retired";
      else if ( !wch->PCData->Rank.empty() )
        race = wch->PCData->Rank;

      if ( IsClanned( wch )
	   && ( (IsClanned( ch )
		 && ch->PCData->ClanInfo.Clan == wch->PCData->ClanInfo.Clan )
		|| IsGreater( ch ) ) )
        {
          Clan *pclan = wch->PCData->ClanInfo.Clan;

          clan_name = " (" ;

          if ( !StrCmp( wch->Name, pclan->Leadership.Leader ) )
            clan_name += "Leader, ";
          if ( !StrCmp( wch->Name, pclan->Leadership.Number1 ) )
            clan_name += "First, ";
          if ( !StrCmp( wch->Name, pclan->Leadership.Number2 ) )
            clan_name += "Second, ";

          clan_name += pclan->Name;
          clan_name += ")";
        }
      else
        {
          clan_name.erase();
        }

      if ( IsBitSet(wch->Flags, PLR_WIZINVIS) )
	invis_str = FormatString( "(%d) ", wch->PCData->WizInvis );
      else
        invis_str.erase();

      sprintf( buf, "%c%s %s%s%s%s %s%s%s%s\r\n",
               force_char,
               race.c_str(),
               invis_str.c_str(),
               IsBitSet(wch->Flags, PLR_AFK) ? "[AFK] " : "",
               char_name.c_str(),
               wch->PCData->Title.c_str(),
               extra_title.c_str(), wch->PCData->WhoCloak ? "<WC>" : "",
               clan_name.c_str(),
               IsBitSet(wch->Flags, PLR_KILLER)
               && (ch->TopLevel >= LEVEL_IMMORTAL) ? "&R [Wanted for Murder]&W" : "&W" );


      /*
       * This is where the old code would display the found player to the ch.
       * What we do instead is put the found data into a linked list
       */

      /* First make the structure. */
      WhoData cur_who;
      cur_who.Text = buf;

      if ( IsImmortal( wch ) )
        cur_who.Type = WT_IMM;
      else if ( GetTrustLevel( wch ) <= 5 )
        cur_who.Type = WT_NEWBIE;
      else
        cur_who.Type = WT_MORTAL;

      /* Then put it into the appropriate list. */
      switch ( cur_who.Type )
        {
        case WT_MORTAL:
          mortals.push_back(cur_who);
          break;
	  
        case WT_IMM:
          immortals.push_back(cur_who);
          break;
	  
        case WT_NEWBIE:
          newbies.push_back(cur_who);
	  break;
        }
    }


  /* Ok, now we have three separate linked lists and what remains is to
   * display the information and clean up.
   */

  /* Deadly list removed for swr ... now only 2 lists */

  if ( !newbies.empty() )
    {
      if ( NullCh )
        fprintf( whoout,"\r\n----------------------------------[ New Citizens ]----------------------------\r\n\r\n" );
      else
        ch->Echo("\r\n&G----------------------------------[ New Citizens ]----------------------------&W\r\n\r\n");
    }

  for(const WhoData &cur_who : newbies)
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who.Text.c_str() );
      else
        ch->Echo(cur_who.Text);
    }


  if ( !mortals.empty() )
    {
      if ( NullCh )
        fprintf( whoout,"\r\n--------------------------------[ Galactic Citizens ]-------------------------\r\n\r\n" );
      else
        ch->Echo("\r\n&G--------------------------------[ Galactic Citizens ]-------------------------&W\r\n\r\n");
    }

  for(const WhoData &cur_who : mortals)
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who.Text.c_str() );
      else
        ch->Echo(cur_who.Text);
    }

  if ( !immortals.empty() )
    {
      if ( NullCh )
        fprintf( whoout, "\r\n-------------------------------[ Omnipresent Beings ]-------------------------\r\n\r\n" );
      else
        ch->Echo("\r\n&G-------------------------------[ Omnipresent Beings ]--------------------------&W\r\n\r\n");
    }

  for(const WhoData &cur_who : immortals)
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who.Text.c_str() );
      else
        ch->Echo(cur_who.Text);
    }

  if ( NullCh )
    {
      fprintf( whoout, "%d player%s.\r\n", nMatch, nMatch == 1 ? "" : "s" );
      fclose( whoout );
      delete ch;
      delete desc;
      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  ch->Echo("%d player%s.\r\n", nMatch, nMatch == 1 ? "" : "s" );
}
