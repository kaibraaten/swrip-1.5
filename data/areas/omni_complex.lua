-- Omnipresent Complex
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   Author = "Kuran", 
   Mobiles = 
   {
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 150, 
         First = 100, 
      }, 
      Object = 
      {
         Last = 150, 
         First = 100, 
      }, 
      Room = 
      {
         Last = 150, 
         First = 100, 
      }, 
   }, 
   ResetFrequency = 0, 
   HighEconomy = 0, 
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
   FileFormatVersion = 1, 
   Rooms = 
   {
      [100] = 
      {
         Description = "You are in the center of the Omnipresent Being's domain.  From this;complex\
the all knowing, all powerful beings that control this galaxy;do their\
work. There is a computer terminal in the center of the room used to\
monitor happenings of the rest of the Galaxy. To the north lies the\
Galactic Control center, to the south is the Reality Control area, along\
with the Supreme Being's offices. Up is a one way passage to the Isolation\
Room, where misbehaving mortal beings are sent to cool off. To the east is\
an Omnipresent-to-Mortal conference room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 104, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 102, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 106, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 125, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 105, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 100, 
         Name = "Omnipresent Being's Monitoring Room", 
      }, 
      [101] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 125, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 101, 
         Name = "An Empty Home", 
      }, 
      [102] = 
      {
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 100, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 102, 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
      }, 
      [103] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 100, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 101, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 102, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 110, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 103, 
         Name = "An Empty Home", 
      }, 
      [104] = 
      {
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 100, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 104, 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
      }, 
      [105] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 105, 
         Name = "An Empty Home", 
      }, 
      [106] = 
      {
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 100, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "door office", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 107, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 119, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 111, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 110, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
            }, 
            [6] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 112, 
               Distance = 0, 
               Key = -1, 
               Direction = "southeast", 
            }, 
            [7] = 
            {
               Description = "", 
               Keyword = "glimmer teleport teleporter silphion", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 108, 
               Distance = 0, 
               Key = -1, 
               Direction = "somewhere", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 106, 
         Name = "Omnipresent Being's Office Complex", 
      }, 
      [107] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "if isimmort($n)\
    if position($n) == sitting\
        mpechoat $n You're an immortal, and you're sitting.\
    elif position($n) == resting\
        mpechoat $n You're an immortal, and you're resting.\
    else\
        mpechoat $n You're an immortal, and you're neither sitting nor resting.\
    endif\
else\
    mpechoat $n You're a puny mortal, and I don't care what position you're in.\
endif\
\
if sex($n) == male\
    mpechoat $n You're a guy.\
elif sex($n) == female\
    mpechoat $n You're a chick.\
elif sex($n) == invalid\
    mpechoat $n This is nonsense.\
else\
    mpechoat $n You're genderless.\
endif\
\
if isgood($n)\
    mpechoat $n You're good.\
endif\
\
if not isgood($n)\
  mpechoat $n You ain't good.\
endif\
\
if knowsskill($n) == meditate\
    mpechoat $n You know meditate.\
endif\
\
if not knowsskill($n) == meditate\
    mpechoat $n How can you not know meditate?\
endif\
", 
               Arguments = "foobar", 
               ScriptType = "MProg", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "door", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 106, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 107, 
         Name = "An Empty Home", 
      }, 
      [108] = 
      {
         Description = "The glimmer you saw was a teleporter, a gate.  One that took you to where\
no mortal or immortal has ever laid their eyes before. You are inside\
total blackness, illuminated only by the dancing sprites of electrons\
running  across their roads of platinum and copper.  A gigantic monitor,\
composing one entire wall, flickers with information of the universe you\
just left.  Opposite of it, with an input/output deck raised beside it, a\
simple cot was provided for the watcher. Welcome to the universe.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 110, 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 108, 
         Name = "The Real Universe", 
      }, 
      [109] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 121, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 118, 
               Distance = 0, 
               Key = 9599, 
               Direction = "west", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 109, 
         Name = "An Empty Home", 
      }, 
      [110] = 
      {
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 106, 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 110, 
         Name = "The Omnipresent Mail Room", 
      }, 
      [111] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 106, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 111, 
         Name = "An Empty Home", 
      }, 
      [112] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 106, 
               Distance = 0, 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 112, 
         Name = "An Empty Home", 
      }, 
      [113] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 114, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 116, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 115, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 119, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
            }, 
            [5] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 118, 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 113, 
         Name = "Main Room of Darrik's Quarters", 
      }, 
      [114] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 113, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 114, 
         Name = "Mail Room", 
      }, 
      [115] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 113, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 115, 
         Name = "OOC Board room", 
      }, 
      [116] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 113, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 117, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 116, 
         Name = "Tech Board room", 
      }, 
      [117] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 116, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 117, 
         Name = "Tech Idea Board Room", 
      }, 
      [118] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 122, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 113, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 120, 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 118, 
         Name = "Living Room", 
      }, 
      [119] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 106, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 113, 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 119, 
         Name = "An Empty Home", 
      }, 
      [120] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 118, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 120, 
         Name = "Workshop", 
      }, 
      [121] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 121, 
         Name = "Transport Room", 
      }, 
      [122] = 
      {
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
         TeleVnum = 0, 
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [19] = "ClanStoreroom", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 118, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 122, 
         Name = "Darrik's Mortal Relation Room", 
      }, 
      [123] = 
      {
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               DestinationVnum = 124, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 123, 
         Name = "Vequir Shipyards", 
      }, 
      [124] = 
      {
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 123, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 124, 
         Name = "Vequir Construction Yards", 
      }, 
      [125] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               DestinationVnum = 100, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 125, 
         Name = "Omnipresent Being's Workshop", 
      }, 
      [150] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Vnum = 150, 
         Name = "Floating in a void", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         Arg3 = 100, 
         Arg1 = 100, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg1 = 107, 
         Arg2 = 3, 
         MiscData = 0, 
      }, 
      [3] = 
      {
         Command = "O", 
         Arg3 = 102, 
         Arg1 = 32201, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "O", 
         Arg3 = 114, 
         Arg1 = 38, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg1 = 119, 
         Arg2 = 0, 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg1 = 109, 
         Arg2 = 3, 
         MiscData = 0, 
      }, 
      [7] = 
      {
         Command = "O", 
         Arg3 = 118, 
         Arg1 = 104, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Command = "O", 
         Arg3 = 110, 
         Arg1 = 38, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Command = "O", 
         Arg3 = 106, 
         Arg1 = 103, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "O", 
         Arg3 = 106, 
         Arg1 = 106, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg1 = 106, 
         Arg2 = 1, 
         MiscData = 0, 
      }, 
      [12] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg1 = 106, 
         Arg2 = 2, 
         MiscData = 0, 
      }, 
      [13] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg1 = 106, 
         Arg2 = 4, 
         MiscData = 0, 
      }, 
      [14] = 
      {
         Command = "G", 
         Arg1 = 32280, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Command = "G", 
         Arg1 = 32210, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Command = "G", 
         Arg1 = 10497, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Command = "G", 
         Arg1 = 10494, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Command = "G", 
         Arg1 = 32281, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10420, 
         Arg2 = 1, 
         MiscData = 0, 
      }, 
      [21] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10420, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 2, 
      }, 
      [23] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 3, 
      }, 
      [24] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 4, 
      }, 
      [25] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 5, 
      }, 
      [26] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 25, 
         Arg2 = 1, 
         MiscData = 6, 
      }, 
      [27] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 32261, 
         Arg2 = 1, 
         MiscData = 7, 
      }, 
      [28] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 8, 
      }, 
      [29] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 9, 
      }, 
      [30] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 10, 
      }, 
      [31] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 11, 
      }, 
      [32] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 12, 
      }, 
      [33] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 13, 
      }, 
      [34] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 14, 
      }, 
      [35] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 15, 
      }, 
      [36] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 16, 
      }, 
      [37] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 17, 
      }, 
      [38] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 18, 
      }, 
      [39] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 19, 
      }, 
      [40] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 20, 
      }, 
      [41] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 21, 
      }, 
      [42] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 22, 
      }, 
      [43] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 23, 
      }, 
      [44] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 24, 
      }, 
      [45] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 25, 
      }, 
      [46] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 10429, 
         Arg2 = 1, 
         MiscData = 26, 
      }, 
      [47] = 
      {
         Command = "O", 
         Arg3 = 115, 
         Arg1 = 90, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
   }, 
   LowEconomy = 30457103, 
   Objects = 
   {
      [104] = 
      {
         Description = "A comfortable couch was placed here", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "a couch", 
         Weight = 1, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Vnum = 104, 
         Name = "A long couch", 
      }, 
      [106] = 
      {
         Description = "Multiplay Board", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
         ShortDescr = "multiplay board", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Vnum = 106, 
         Name = "multiplay board", 
      }, 
      [100] = 
      {
         Description = "The Monitoring Terminal has been installed here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "the Monitoring Terminal", 
         Weight = 1, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 100, 
         Name = "terminal omnipresent monitor", 
      }, 
      [101] = 
      {
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "the Coding Terminal", 
         Weight = 1, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 101, 
         Name = "terminal omnipresent coding", 
      }, 
      [102] = 
      {
         Description = "The Quest Board is here, and is blinking.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
         ShortDescr = "the Terminal for Galactic Control", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Vnum = 102, 
         Name = "terminal quest galactic control blinking", 
      }, 
      [103] = 
      {
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "durgas wormhole", 
         Weight = 1, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 103, 
         Name = "silphion silphions wormhole teleporter glimmer", 
      }, 
   }, 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Filename = "omni_complex.lua", 
   Name = "Omnipresent Complex", 
}
