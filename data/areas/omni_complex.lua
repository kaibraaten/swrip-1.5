-- Omnipresent Complex
-- Last saved Tuesday 30-Jun-2020 16:05:03

AreaEntry
{
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
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
   LowEconomy = 30457103, 
   Flags = 
   {
      [1] = "_01", 
   }, 
   FileFormatVersion = 1, 
   Rooms = 
   {
      [100] = 
      {
         Vnum = 100, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Omnipresent Being's Monitoring Room", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "foobar", 
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
            }, 
         }, 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 104, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 102, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 106, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               DestinationVnum = 125, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               DestinationVnum = 105, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "You are in the center of the Omnipresent Being's domain.  From this;complex\
the all knowing, all powerful beings that control this galaxy;do their\
work. There is a computer terminal in the center of the room used to\
monitor happenings of the rest of the Galaxy. To the north lies the\
Galactic Control center, to the south is the Reality Control area, along\
with the Supreme Being's offices. Up is a one way passage to the Isolation\
Room, where misbehaving mortal beings are sent to cool off. To the east is\
an Omnipresent-to-Mortal conference room.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [101] = 
      {
         Vnum = 101, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "turkey", 
               Code = "mpoload 21016\
drop turkey\
mpecho A turkey steps in, and is suddenly vaporized into a delicious meal.\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "Gerard MacManus", 
               Code = "if name($n) == Den\
mpechoat $n You are taken to the Officer's Lounge.\
mptransfer $n 9493\
endif\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "Newbie Academy", 
               Code = "if name($n) == Den\
mpechoat $n You are transferred to the Academy.\
mptransfer $n 10300\
endif\
", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p arrives from a puff of smoke.", 
               Code = "mpforce $n sit\
", 
            }, 
            [5] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "darrik", 
               Code = "mpat 109 mpecho Den says, 'Hey, send me a beep.'\
mpat 122 mpecho Den says, 'Hey, send me a beep.'\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 125, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [102] = 
      {
         Vnum = 102, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [103] = 
      {
         Vnum = 103, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 101, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 102, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               DestinationVnum = 110, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [104] = 
      {
         Vnum = 104, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [105] = 
      {
         Vnum = 105, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [106] = 
      {
         Vnum = 106, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Omnipresent Being's Office Complex", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 107, 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "door office", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 119, 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               DestinationVnum = 111, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               DestinationVnum = 110, 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [6] = 
            {
               DestinationVnum = 112, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "southeast", 
            }, 
            [7] = 
            {
               DestinationVnum = 108, 
               Key = -1, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "glimmer teleport teleporter silphion", 
               Direction = "somewhere", 
            }, 
         }, 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [107] = 
      {
         Vnum = 107, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "foobar", 
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
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 106, 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "door", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [108] = 
      {
         Vnum = 108, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "The Real Universe", 
         ExtraDescriptions = 
         {
         }, 
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
               DestinationVnum = 110, 
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "The glimmer you saw was a teleporter, a gate.  One that took you to where\
no mortal or immortal has ever laid their eyes before. You are inside\
total blackness, illuminated only by the dancing sprites of electrons\
running  across their roads of platinum and copper.  A gigantic monitor,\
composing one entire wall, flickers with information of the universe you\
just left.  Opposite of it, with an input/output deck raised beside it, a\
simple cot was provided for the watcher. Welcome to the universe.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [109] = 
      {
         Vnum = 109, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 121, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 118, 
               Key = 9599, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [110] = 
      {
         Vnum = 110, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "The Omnipresent Mail Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 106, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [111] = 
      {
         Vnum = 111, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 106, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [112] = 
      {
         Vnum = 112, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 106, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "northwest", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [113] = 
      {
         Vnum = 113, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Main Room of Darrik's Quarters", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 114, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 116, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 115, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               DestinationVnum = 119, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [5] = 
            {
               DestinationVnum = 118, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [114] = 
      {
         Vnum = 114, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Mail Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [115] = 
      {
         Vnum = 115, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "OOC Board room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [116] = 
      {
         Vnum = 116, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Tech Board room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 117, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [117] = 
      {
         Vnum = 117, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Tech Idea Board Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 116, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [118] = 
      {
         Vnum = 118, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Living Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 122, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [3] = 
            {
               DestinationVnum = 120, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [119] = 
      {
         Vnum = 119, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 106, 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [120] = 
      {
         Vnum = 120, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Workshop", 
         ExtraDescriptions = 
         {
         }, 
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
               DestinationVnum = 118, 
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [121] = 
      {
         Vnum = 121, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Transport Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [122] = 
      {
         Vnum = 122, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Darrik's Mortal Relation Room", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "50", 
               Code = "if name($n) == Darrik\
else\
mpechoat $n The blade creaks as it drops a fraction lower.\
mpechoat $n The ewok screaches in fright.\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "1", 
               Code = "mpecho The ewok gurgles as the blade slices through its throat and \
mpecho blood gushes all over the floor. Several droids come out of \
mpecho a panel and clean up the blood, while a large prison droid drags\
mpecho another ewok out and straps him to the table.\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "goober123goober ", 
               Code = "mpat gilito mpoload 22501 \
mpat gilito drop glitterstim \
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
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
               DestinationVnum = 118, 
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [123] = 
      {
         Vnum = 123, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Vequir Shipyards", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 124, 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [124] = 
      {
         Vnum = 124, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Vequir Construction Yards", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 123, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
      [125] = 
      {
         Vnum = 125, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Omnipresent Being's Workshop", 
         ExtraDescriptions = 
         {
         }, 
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
               DestinationVnum = 100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         Sector = "inside", 
         TeleDelay = 0, 
      }, 
      [150] = 
      {
         Vnum = 150, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         TeleDelay = 0, 
      }, 
   }, 
   Name = "Omnipresent Complex", 
   Filename = "omni_complex.lua", 
   HighEconomy = 0, 
   VnumRanges = 
   {
      Room = 
      {
         First = 100, 
         Last = 150, 
      }, 
      Object = 
      {
         First = 100, 
         Last = 106, 
      }, 
      Mob = 
      {
         First = 0, 
         Last = 0, 
      }, 
   }, 
   Objects = 
   {
      [104] = 
      {
         Vnum = 104, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a couch", 
         Cost = 0, 
         Layers = 0, 
         Name = "A long couch", 
         ActionDescription = "", 
         Weight = 1, 
         Description = "A comfortable couch was placed here", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
      }, 
      [106] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "multiplay board", 
         Cost = 0, 
         Layers = 0, 
         Name = "multiplay board", 
         ActionDescription = "", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Multiplay Board", 
         Vnum = 106, 
         ItemType = "trash", 
      }, 
      [100] = 
      {
         Vnum = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the Monitoring Terminal", 
         Cost = 0, 
         Layers = 0, 
         Name = "terminal omnipresent monitor", 
         ActionDescription = "", 
         Weight = 1, 
         Description = "The Monitoring Terminal has been installed here.", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
      }, 
      [101] = 
      {
         Vnum = 101, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the Coding Terminal", 
         Cost = 0, 
         Layers = 0, 
         Name = "terminal omnipresent coding", 
         ActionDescription = "", 
         Weight = 1, 
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
      }, 
      [102] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the Terminal for Galactic Control", 
         Cost = 0, 
         Layers = 0, 
         Name = "terminal quest galactic control blinking", 
         ActionDescription = "", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The Quest Board is here, and is blinking.", 
         Vnum = 102, 
         ItemType = "trash", 
      }, 
      [103] = 
      {
         Vnum = 103, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "durgas wormhole", 
         Cost = 0, 
         Layers = 0, 
         Name = "silphion silphions wormhole teleporter glimmer", 
         ActionDescription = "", 
         Weight = 1, 
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
      }, 
   }, 
   Mobiles = 
   {
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 100, 
         MiscData = 1, 
         Arg1 = 100, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [2] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 107, 
         Arg2 = 3, 
         Command = "D", 
      }, 
      [3] = 
      {
         Arg3 = 102, 
         MiscData = 1, 
         Arg1 = 32201, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [4] = 
      {
         Arg3 = 114, 
         MiscData = 1, 
         Arg1 = 38, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [5] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 119, 
         Arg2 = 0, 
         Command = "D", 
      }, 
      [6] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 109, 
         Arg2 = 3, 
         Command = "D", 
      }, 
      [7] = 
      {
         Arg3 = 118, 
         MiscData = 1, 
         Arg1 = 104, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [8] = 
      {
         Arg3 = 110, 
         MiscData = 1, 
         Arg1 = 38, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [9] = 
      {
         Arg3 = 106, 
         MiscData = 1, 
         Arg1 = 103, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [10] = 
      {
         Arg3 = 106, 
         MiscData = 1, 
         Arg1 = 106, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [11] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 106, 
         Arg2 = 1, 
         Command = "D", 
      }, 
      [12] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 106, 
         Arg2 = 2, 
         Command = "D", 
      }, 
      [13] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 106, 
         Arg2 = 4, 
         Command = "D", 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 32280, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 32210, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg1 = 10497, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 10494, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg1 = 32281, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [20] = 
      {
         Arg3 = 0, 
         MiscData = 0, 
         Arg1 = 10420, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [21] = 
      {
         Arg3 = 0, 
         MiscData = 1, 
         Arg1 = 10420, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [22] = 
      {
         Arg3 = 0, 
         MiscData = 2, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [23] = 
      {
         Arg3 = 0, 
         MiscData = 3, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [24] = 
      {
         Arg3 = 0, 
         MiscData = 4, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [25] = 
      {
         Arg3 = 0, 
         MiscData = 5, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [26] = 
      {
         Arg3 = 0, 
         MiscData = 6, 
         Arg1 = 25, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [27] = 
      {
         Arg3 = 0, 
         MiscData = 7, 
         Arg1 = 32261, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [28] = 
      {
         Arg3 = 0, 
         MiscData = 8, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [29] = 
      {
         Arg3 = 0, 
         MiscData = 9, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [30] = 
      {
         Arg3 = 0, 
         MiscData = 10, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [31] = 
      {
         Arg3 = 0, 
         MiscData = 11, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [32] = 
      {
         Arg3 = 0, 
         MiscData = 12, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [33] = 
      {
         Arg3 = 0, 
         MiscData = 13, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [34] = 
      {
         Arg3 = 0, 
         MiscData = 14, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [35] = 
      {
         Arg3 = 0, 
         MiscData = 15, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [36] = 
      {
         Arg3 = 0, 
         MiscData = 16, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [37] = 
      {
         Arg3 = 0, 
         MiscData = 17, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [38] = 
      {
         Arg3 = 0, 
         MiscData = 18, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [39] = 
      {
         Arg3 = 0, 
         MiscData = 19, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [40] = 
      {
         Arg3 = 0, 
         MiscData = 20, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [41] = 
      {
         Arg3 = 0, 
         MiscData = 21, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [42] = 
      {
         Arg3 = 0, 
         MiscData = 22, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [43] = 
      {
         Arg3 = 0, 
         MiscData = 23, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [44] = 
      {
         Arg3 = 0, 
         MiscData = 24, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [45] = 
      {
         Arg3 = 0, 
         MiscData = 25, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [46] = 
      {
         Arg3 = 0, 
         MiscData = 26, 
         Arg1 = 10429, 
         Arg2 = 1, 
         Command = "P", 
      }, 
      [47] = 
      {
         Arg3 = 115, 
         MiscData = 1, 
         Arg1 = 90, 
         Arg2 = 1, 
         Command = "O", 
      }, 
   }, 
   Author = "Kuran", 
   ResetFrequency = 0, 
}
