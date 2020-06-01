-- Omnipresent Complex
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Author = "Kuran", 
   HighEconomy = 0, 
   ResetFrequency = 0, 
   Filename = "omni_complex.lua", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Rooms = 
   {
      [100] = 
      {
         Flags = 
         {
            [17] = "LogSpeech", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 100, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 104, 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 102, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 106, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 125, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               DestinationVnum = 105, 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
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
      }, 
      [101] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 101, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 125, 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [102] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 102, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 100, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
      }, 
      [103] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 103, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 100, 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 101, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 102, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 110, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [104] = 
      {
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 104, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 100, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
      }, 
      [105] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 105, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [106] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 106, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 100, 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 107, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "door office", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 119, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 111, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               DestinationVnum = 110, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               DestinationVnum = 112, 
               Direction = "southeast", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [7] = 
            {
               Description = "", 
               DestinationVnum = 108, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               Key = -1, 
               Distance = 0, 
               Keyword = "glimmer teleport teleporter silphion", 
            }, 
         }, 
         Name = "Omnipresent Being's Office Complex", 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
      }, 
      [107] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 107, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 106, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "door", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [108] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 108, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 110, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Real Universe", 
         Description = "The glimmer you saw was a teleporter, a gate.  One that took you to where\
no mortal or immortal has ever laid their eyes before. You are inside\
total blackness, illuminated only by the dancing sprites of electrons\
running  across their roads of platinum and copper.  A gigantic monitor,\
composing one entire wall, flickers with information of the universe you\
just left.  Opposite of it, with an input/output deck raised beside it, a\
simple cot was provided for the watcher. Welcome to the universe.\
", 
      }, 
      [109] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 109, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 121, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 118, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Key = 9599, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [110] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 110, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 106, 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Omnipresent Mail Room", 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
      }, 
      [111] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 111, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 106, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [112] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 112, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 106, 
               Direction = "northwest", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [113] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 113, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 114, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 116, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 115, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 119, 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               DestinationVnum = 118, 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Main Room of Darrik's Quarters", 
         Description = "", 
      }, 
      [114] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 114, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 113, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Mail Room", 
         Description = "", 
      }, 
      [115] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 115, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 113, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "OOC Board room", 
         Description = "", 
      }, 
      [116] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 116, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 113, 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 117, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Tech Board room", 
         Description = "", 
      }, 
      [117] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 117, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 116, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Tech Idea Board Room", 
         Description = "", 
      }, 
      [118] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 118, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 122, 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 113, 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 120, 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Living Room", 
         Description = "", 
      }, 
      [119] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 119, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 106, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 113, 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [120] = 
      {
         Flags = 
         {
            [9] = "Private", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 120, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 118, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Workshop", 
         Description = "", 
      }, 
      [121] = 
      {
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 121, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Name = "Transport Room", 
         Description = "", 
      }, 
      [122] = 
      {
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [19] = "ClanStoreroom", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 122, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 118, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Darrik's Mortal Relation Room", 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
      }, 
      [123] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 123, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 124, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Vequir Shipyards", 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
      }, 
      [124] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 124, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 123, 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Vequir Construction Yards", 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
      }, 
      [125] = 
      {
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
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 125, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 100, 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Omnipresent Being's Workshop", 
         Description = "", 
      }, 
      [150] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 150, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
         Description = "", 
      }, 
   }, 
   Objects = 
   {
      [104] = 
      {
         ActionDescription = "", 
         ItemType = "furniture", 
         Vnum = 104, 
         ShortDescr = "a couch", 
         Description = "A comfortable couch was placed here", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "A long couch", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [106] = 
      {
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ItemType = "trash", 
         Vnum = 106, 
         ShortDescr = "multiplay board", 
         Description = "Multiplay Board", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "multiplay board", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [100] = 
      {
         ActionDescription = "", 
         ItemType = "trash", 
         Vnum = 100, 
         ShortDescr = "the Monitoring Terminal", 
         Description = "The Monitoring Terminal has been installed here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "terminal omnipresent monitor", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [101] = 
      {
         ActionDescription = "", 
         ItemType = "trash", 
         Vnum = 101, 
         ShortDescr = "the Coding Terminal", 
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "terminal omnipresent coding", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [102] = 
      {
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ItemType = "trash", 
         Vnum = 102, 
         ShortDescr = "the Terminal for Galactic Control", 
         Description = "The Quest Board is here, and is blinking.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "terminal quest galactic control blinking", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [103] = 
      {
         ActionDescription = "", 
         ItemType = "trash", 
         Vnum = 103, 
         ShortDescr = "durgas wormhole", 
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "silphion silphions wormhole teleporter glimmer", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
   }, 
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
   FileFormatVersion = 1, 
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 100, 
         Command = "O", 
         Arg3 = 100, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Arg1 = 107, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 3, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 32201, 
         Command = "O", 
         Arg3 = 102, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Command = "O", 
         Arg3 = 114, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg1 = 119, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 0, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg1 = 109, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 3, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 104, 
         Command = "O", 
         Arg3 = 118, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Command = "O", 
         Arg3 = 110, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 103, 
         Command = "O", 
         Arg3 = 106, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 106, 
         Command = "O", 
         Arg3 = 106, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 2, 
      }, 
      [13] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 4, 
      }, 
      [14] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32280, 
      }, 
      [15] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32210, 
      }, 
      [16] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10497, 
      }, 
      [17] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10494, 
      }, 
      [18] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [19] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32281, 
      }, 
      [20] = 
      {
         MiscData = 0, 
         Arg1 = 10420, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 10420, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         MiscData = 2, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         MiscData = 3, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         MiscData = 4, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         MiscData = 5, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         MiscData = 6, 
         Arg1 = 25, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         MiscData = 7, 
         Arg1 = 32261, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         MiscData = 8, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         MiscData = 9, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [30] = 
      {
         MiscData = 10, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [31] = 
      {
         MiscData = 11, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [32] = 
      {
         MiscData = 12, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         MiscData = 13, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         MiscData = 14, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         MiscData = 15, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         MiscData = 16, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         MiscData = 17, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         MiscData = 18, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         MiscData = 19, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         MiscData = 20, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         MiscData = 21, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         MiscData = 22, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         MiscData = 23, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         MiscData = 24, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         MiscData = 25, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         MiscData = 26, 
         Arg1 = 10429, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Command = "O", 
         Arg3 = 115, 
         Arg2 = 1, 
      }, 
   }, 
   LowEconomy = 30457103, 
   Name = "Omnipresent Complex", 
   Mobiles = 
   {
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
}
