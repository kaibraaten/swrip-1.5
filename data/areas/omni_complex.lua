-- Omnipresent Complex
-- Last saved Wednesday 01-Jul-2020 12:33:30

AreaEntry
{
   Author = "Kuran", 
   HighEconomy = 0, 
   Mobiles = 
   {
   }, 
   ResetFrequency = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 0, 
         Last = 0, 
      }, 
      Object = 
      {
         First = 100, 
         Last = 106, 
      }, 
      Room = 
      {
         First = 100, 
         Last = 150, 
      }, 
   }, 
   Rooms = 
   {
      [100] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 100, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isimmort($n)\
  and position($n) == 8\
    mpechoat $n You're immortal and you're sitting.\
elif isimmort($n)\
  and position($n) != 8\
    mpechoat $n You're immortal, but you're not sitting.\
else\
  mpechoat $n You're NOT immortal, and you may or may not be sitting.\
endif\
", 
               Arguments = "foobar", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 104, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 102, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 106, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 125, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 105, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Omnipresent Being's Monitoring Room", 
         Description = "You are in the center of the Omnipresent Being's domain.  From this;complex\
the all knowing, all powerful beings that control this galaxy;do their\
work. There is a computer terminal in the center of the room used to\
monitor happenings of the rest of the Galaxy. To the north lies the\
Galactic Control center, to the south is the Reality Control area, along\
with the Supreme Being's offices. Up is a one way passage to the Isolation\
Room, where misbehaving mortal beings are sent to cool off. To the east is\
an Omnipresent-to-Mortal conference room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [101] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 101, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 21016\
drop turkey\
mpecho A turkey steps in, and is suddenly vaporized into a delicious meal.\
", 
               Arguments = "turkey", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "if name($n) == Den\
mpechoat $n You are taken to the Officer's Lounge.\
mptransfer $n 9493\
endif\
", 
               Arguments = "Gerard MacManus", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "if name($n) == Den\
mpechoat $n You are transferred to the Academy.\
mptransfer $n 10300\
endif\
", 
               Arguments = "Newbie Academy", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Code = "mpforce $n sit\
", 
               Arguments = "p arrives from a puff of smoke.", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Code = "mpat 109 mpecho Den says, 'Hey, send me a beep.'\
mpat 122 mpecho Den says, 'Hey, send me a beep.'\
", 
               Arguments = "darrik", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 125, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [102] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 102, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [103] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 103, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 101, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 102, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 110, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [104] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 104, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [105] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 105, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [106] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 106, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 107, 
               Description = "", 
               Key = -1, 
               Keyword = "door office", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 119, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 111, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 110, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 112, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [7] = 
            {
               Direction = "somewhere", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 108, 
               Description = "", 
               Key = -1, 
               Keyword = "glimmer teleport teleporter silphion", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Omnipresent Being's Office Complex", 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [107] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 107, 
         MudProgs = 
         {
            [1] = 
            {
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
", 
               Arguments = "foobar", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 106, 
               Description = "", 
               Key = -1, 
               Keyword = "door", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [108] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 108, 
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 110, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Real Universe", 
         Description = "The glimmer you saw was a teleporter, a gate.  One that took you to where\
no mortal or immortal has ever laid their eyes before. You are inside\
total blackness, illuminated only by the dancing sprites of electrons\
running  across their roads of platinum and copper.  A gigantic monitor,\
composing one entire wall, flickers with information of the universe you\
just left.  Opposite of it, with an input/output deck raised beside it, a\
simple cot was provided for the watcher. Welcome to the universe.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [109] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 109, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 121, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 118, 
               Description = "", 
               Key = 9599, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [110] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 110, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 106, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Omnipresent Mail Room", 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [111] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 111, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 106, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [112] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 112, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 106, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [113] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 113, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 114, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 116, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 115, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 119, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 118, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Main Room of Darrik's Quarters", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [114] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 114, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 113, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mail Room", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [115] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 115, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 113, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "OOC Board room", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [116] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 116, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 113, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 117, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Tech Board room", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [117] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 117, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 116, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Tech Idea Board Room", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [118] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 118, 
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 122, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 113, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 120, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Living Room", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [119] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 119, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 106, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 113, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [120] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 120, 
         Flags = 
         {
            [9] = "Private", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
               DestinationVnum = 118, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Workshop", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [121] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 121, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Transport Room", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [122] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 122, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if name($n) == Darrik\
else\
mpechoat $n The blade creaks as it drops a fraction lower.\
mpechoat $n The ewok screaches in fright.\
endif\
", 
               Arguments = "50", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "mpecho The ewok gurgles as the blade slices through its throat and \
mpecho blood gushes all over the floor. Several droids come out of \
mpecho a panel and clean up the blood, while a large prison droid drags\
mpecho another ewok out and straps him to the table.\
", 
               Arguments = "1", 
               MudProgType = "rand_prog", 
            }, 
            [3] = 
            {
               Code = "mpat gilito mpoload 22501 \
mpat gilito drop glitterstim \
", 
               Arguments = "goober123goober ", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [19] = "ClanStoreroom", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
               DestinationVnum = 118, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Darrik's Mortal Relation Room", 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [123] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 123, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Distance = 0, 
               DestinationVnum = 124, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Vequir Shipyards", 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [124] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 124, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 123, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Vequir Construction Yards", 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [125] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 125, 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Omnipresent Being's Workshop", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
      [150] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 150, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
      }, 
   }, 
   Name = "Omnipresent Complex", 
   LowEconomy = 30457103, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 100, 
         Arg2 = 1, 
         Arg3 = 100, 
         Command = "O", 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Arg1 = 107, 
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 32201, 
         Arg2 = 1, 
         Arg3 = 102, 
         Command = "O", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Arg2 = 1, 
         Arg3 = 114, 
         Command = "O", 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg1 = 119, 
         Arg2 = 0, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg1 = 109, 
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 104, 
         Arg2 = 1, 
         Arg3 = 118, 
         Command = "O", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Arg2 = 1, 
         Arg3 = 110, 
         Command = "O", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 103, 
         Arg2 = 1, 
         Arg3 = 106, 
         Command = "O", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 106, 
         Arg2 = 1, 
         Arg3 = 106, 
         Command = "O", 
      }, 
      [11] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [12] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Arg2 = 2, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [13] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Arg2 = 4, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [14] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32280, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32210, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10497, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10494, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32281, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         MiscData = 0, 
         Arg1 = 10420, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 10420, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [22] = 
      {
         MiscData = 2, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [23] = 
      {
         MiscData = 3, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [24] = 
      {
         MiscData = 4, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [25] = 
      {
         MiscData = 5, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [26] = 
      {
         MiscData = 6, 
         Arg1 = 25, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [27] = 
      {
         MiscData = 7, 
         Arg1 = 32261, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [28] = 
      {
         MiscData = 8, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [29] = 
      {
         MiscData = 9, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [30] = 
      {
         MiscData = 10, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [31] = 
      {
         MiscData = 11, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [32] = 
      {
         MiscData = 12, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [33] = 
      {
         MiscData = 13, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [34] = 
      {
         MiscData = 14, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [35] = 
      {
         MiscData = 15, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [36] = 
      {
         MiscData = 16, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [37] = 
      {
         MiscData = 17, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [38] = 
      {
         MiscData = 18, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [39] = 
      {
         MiscData = 19, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [40] = 
      {
         MiscData = 20, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [41] = 
      {
         MiscData = 21, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [42] = 
      {
         MiscData = 22, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [43] = 
      {
         MiscData = 23, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [44] = 
      {
         MiscData = 24, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [45] = 
      {
         MiscData = 25, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [46] = 
      {
         MiscData = 26, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "P", 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Arg2 = 1, 
         Arg3 = 115, 
         Command = "O", 
      }, 
   }, 
   Objects = 
   {
      [104] = 
      {
         ItemType = "furniture", 
         Cost = 0, 
         Vnum = 104, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a couch", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "A comfortable couch was placed here", 
         Weight = 1, 
         Name = "A long couch", 
      }, 
      [106] = 
      {
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 106, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "multiplay board", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "Multiplay Board", 
         Weight = 1, 
         Name = "multiplay board", 
      }, 
      [100] = 
      {
         ItemType = "trash", 
         Cost = 0, 
         Vnum = 100, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the Monitoring Terminal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "The Monitoring Terminal has been installed here.", 
         Weight = 1, 
         Name = "terminal omnipresent monitor", 
      }, 
      [101] = 
      {
         ItemType = "trash", 
         Cost = 0, 
         Vnum = 101, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the Coding Terminal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         Weight = 1, 
         Name = "terminal omnipresent coding", 
      }, 
      [102] = 
      {
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 102, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "the Terminal for Galactic Control", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "The Quest Board is here, and is blinking.", 
         Weight = 1, 
         Name = "terminal quest galactic control blinking", 
      }, 
      [103] = 
      {
         ItemType = "trash", 
         Cost = 0, 
         Vnum = 103, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "durgas wormhole", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         Weight = 1, 
         Name = "silphion silphions wormhole teleporter glimmer", 
      }, 
   }, 
   LevelRanges = 
   {
      Soft = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   Filename = "omni_complex.lua", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   FileFormatVersion = 1, 
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
}
