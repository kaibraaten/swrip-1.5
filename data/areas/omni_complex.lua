-- Omnipresent Complex
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 100, 
         Last = 150, 
      }, 
      Object = 
      {
         First = 100, 
         Last = 150, 
      }, 
      Room = 
      {
         First = 100, 
         Last = 150, 
      }, 
   }, 
   Objects = 
   {
      [104] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 104, 
         Cost = 0, 
         ShortDescr = "a couch", 
         Layers = 0, 
         Weight = 1, 
         Name = "A long couch", 
         ActionDescription = "", 
         ItemType = "furniture", 
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
      }, 
      [105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 105, 
         Cost = 0, 
         ShortDescr = "a belt", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "from test import *\
def on_wear(obj, actor):\
    test_wear(obj, actor)\
", 
               Arguments = "100", 
               ScriptType = "Imp", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "def on_remove(obj, actor):\
    echo(actor, \"You are relieved as you remove \" + str(obj))\
", 
               Arguments = "100", 
               ScriptType = "Imp", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Code = "def on_rand(obj):\
    if not inroom(obj):\
        echoaround(obj, str(obj) + \" feels a bit tight.\")\
", 
               Arguments = "100", 
               ScriptType = "Imp", 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Name = "belt", 
         Description = "A belt is here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
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
      }, 
      [106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 106, 
         Cost = 0, 
         ShortDescr = "multiplay board", 
         Layers = 0, 
         Weight = 1, 
         Description = "Multiplay Board", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "multiplay board", 
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
         ExtraDescriptions = 
         {
         }, 
         Vnum = 100, 
         Cost = 0, 
         ShortDescr = "the Monitoring Terminal", 
         Layers = 0, 
         Weight = 1, 
         Name = "terminal omnipresent monitor", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
      [101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 101, 
         Cost = 0, 
         ShortDescr = "the Coding Terminal", 
         Layers = 0, 
         Weight = 1, 
         Name = "terminal omnipresent coding", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
      [102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 102, 
         Cost = 0, 
         ShortDescr = "the Terminal for Galactic Control", 
         Layers = 0, 
         Weight = 1, 
         Description = "The Quest Board is here, and is blinking.", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "terminal quest galactic control blinking", 
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
         ExtraDescriptions = 
         {
         }, 
         Vnum = 103, 
         Cost = 0, 
         ShortDescr = "durgas wormhole", 
         Layers = 0, 
         Weight = 1, 
         Name = "silphion silphions wormhole teleporter glimmer", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 100, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Omnipresent Being's Monitoring Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 104, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 102, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 125, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 105, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 101, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 125, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 102, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 100, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
      }, 
      [103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 103, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 100, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 101, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 102, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 110, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [104] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Vnum = 104, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 100, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
      }, 
      [105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 105, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 106, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Omnipresent Being's Office Complex", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 100, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 107, 
               Distance = 0, 
               Keyword = "door office", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 119, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 111, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 110, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 112, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [7] = 
            {
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 108, 
               Distance = 0, 
               Keyword = "glimmer teleport teleporter silphion", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
      }, 
      [107] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 107, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
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
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
               Keyword = "door", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [108] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Vnum = 108, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Real Universe", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 110, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 109, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 121, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = 9599, 
               DestinationVnum = 118, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 110, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Omnipresent Mail Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
      }, 
      [111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 111, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [112] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 112, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [113] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Vnum = 113, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main Room of Darrik's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 114, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 116, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 115, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 119, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 118, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [114] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Vnum = 114, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mail Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 113, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [115] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Vnum = 115, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "OOC Board room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 113, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [116] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Vnum = 116, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Tech Board room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 113, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 117, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [117] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         Vnum = 117, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Tech Idea Board Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 116, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [118] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         Vnum = 118, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Living Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 122, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 113, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 120, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [119] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 119, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 113, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [120] = 
      {
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
         Vnum = 120, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 118, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [121] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 121, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Transport Room", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [122] = 
      {
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
         Vnum = 122, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Darrik's Mortal Relation Room", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 118, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
      }, 
      [123] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 123, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Vequir Shipyards", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 124, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
      }, 
      [124] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 124, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Vequir Construction Yards", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 123, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
      }, 
      [125] = 
      {
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
         Vnum = 125, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Omnipresent Being's Workshop", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 100, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [150] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 150, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 30457103, 
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
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32280, 
         Command = "G", 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32210, 
         Command = "G", 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10497, 
         Command = "G", 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10494, 
         Command = "G", 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32281, 
         Command = "G", 
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
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
   Author = "Kuran", 
   Name = "Omnipresent Complex", 
   ResetFrequency = 0, 
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
   Mobiles = 
   {
   }, 
}
