-- Omnipresent Complex
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   LowEconomy = 30457103, 
   Author = "Kuran", 
   Name = "Omnipresent Complex", 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         Arg1 = 100, 
         Arg2 = 1, 
         Arg3 = 100, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Command = "D", 
         Arg1 = 107, 
         Arg2 = 3, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [3] = 
      {
         Command = "O", 
         Arg1 = 32201, 
         Arg2 = 1, 
         Arg3 = 102, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "O", 
         Arg1 = 38, 
         Arg2 = 1, 
         Arg3 = 114, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "D", 
         Arg1 = 119, 
         Arg2 = 0, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Command = "D", 
         Arg1 = 109, 
         Arg2 = 3, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [7] = 
      {
         Command = "O", 
         Arg1 = 104, 
         Arg2 = 1, 
         Arg3 = 118, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Command = "O", 
         Arg1 = 38, 
         Arg2 = 1, 
         Arg3 = 110, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Command = "O", 
         Arg1 = 103, 
         Arg2 = 1, 
         Arg3 = 106, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "O", 
         Arg1 = 106, 
         Arg2 = 1, 
         Arg3 = 106, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Command = "D", 
         Arg1 = 106, 
         Arg2 = 1, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [12] = 
      {
         Command = "D", 
         Arg1 = 106, 
         Arg2 = 2, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [13] = 
      {
         Command = "D", 
         Arg1 = 106, 
         Arg2 = 4, 
         Arg3 = 0, 
         MiscData = 0, 
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
   HighEconomy = 0, 
   Objects = 
   {
      [104] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A comfortable couch was placed here", 
         Name = "A long couch", 
         Vnum = 104, 
         Weight = 1, 
         ItemType = "furniture", 
         ShortDescr = "a couch", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [105] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A belt is here.", 
         Name = "belt", 
         Vnum = 105, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "Imp", 
               Code = "from test import *\
def on_wear(obj, actor):\
    test_wear(obj, actor)\
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               ScriptType = "Imp", 
               Code = "def on_remove(obj, actor):\
    echo(actor, \"You are relieved as you remove \" + str(obj))\
", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "Imp", 
               Code = "def on_rand(obj):\
    if not inroom(obj):\
        echoaround(obj, str(obj) + \" feels a bit tight.\")\
", 
            }, 
         }, 
         ItemType = "armor", 
         Cost = 0, 
         ShortDescr = "a belt", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [106] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "Multiplay Board", 
         Name = "multiplay board", 
         Vnum = 106, 
         Weight = 1, 
         ItemType = "trash", 
         Cost = 0, 
         ShortDescr = "multiplay board", 
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
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [100] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The Monitoring Terminal has been installed here.", 
         Name = "terminal omnipresent monitor", 
         Vnum = 100, 
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "the Monitoring Terminal", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "monitoring_terminal", 
      }, 
      [101] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         Name = "terminal omnipresent coding", 
         Vnum = 101, 
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "the Coding Terminal", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [102] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The Quest Board is here, and is blinking.", 
         Name = "terminal quest galactic control blinking", 
         Vnum = 102, 
         Weight = 1, 
         ItemType = "trash", 
         Cost = 0, 
         ShortDescr = "the Terminal for Galactic Control", 
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
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [103] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         Name = "silphion silphions wormhole teleporter glimmer", 
         Vnum = 103, 
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "durgas wormhole", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
   }, 
   Mobiles = 
   {
   }, 
   Rooms = 
   {
      [100] = 
      {
         Tag = "", 
         Name = "Omnipresent Being's Monitoring Room", 
         Vnum = 100, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 102, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 106, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 125, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 105, 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
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
      }, 
      [101] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 101, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [102] = 
      {
         Tag = "", 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         Vnum = 102, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
      }, 
      [103] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 103, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 101, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 102, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 110, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [104] = 
      {
         Tag = "", 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         Vnum = 104, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
      }, 
      [105] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 105, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [106] = 
      {
         Tag = "", 
         Name = "Omnipresent Being's Office Complex", 
         Vnum = 106, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 107, 
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Keyword = "door office", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 119, 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 111, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 110, 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 112, 
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [7] = 
            {
               DestinationVnum = 108, 
               Key = -1, 
               Direction = "somewhere", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Keyword = "glimmer teleport teleporter silphion", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
      }, 
      [107] = 
      {
         Tag = "kai_home", 
         Name = "An Empty Home", 
         Vnum = 107, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "foobar", 
               ScriptType = "MProg", 
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
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Keyword = "door", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [108] = 
      {
         Tag = "", 
         Name = "The Real Universe", 
         Vnum = 108, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "down", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 109, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 118, 
               Key = 9599, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [110] = 
      {
         Tag = "", 
         Name = "The Omnipresent Mail Room", 
         Vnum = 110, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
      }, 
      [111] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 111, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [112] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 112, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "northwest", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [113] = 
      {
         Tag = "", 
         Name = "Main Room of Darrik's Quarters", 
         Vnum = 113, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 116, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 115, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 119, 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 118, 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [114] = 
      {
         Tag = "", 
         Name = "Mail Room", 
         Vnum = 114, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [115] = 
      {
         Tag = "", 
         Name = "OOC Board room", 
         Vnum = 115, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [116] = 
      {
         Tag = "", 
         Name = "Tech Board room", 
         Vnum = 116, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 117, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [117] = 
      {
         Tag = "", 
         Name = "Tech Idea Board Room", 
         Vnum = 117, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [118] = 
      {
         Tag = "", 
         Name = "Living Room", 
         Vnum = 118, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 120, 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [119] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 119, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 113, 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [120] = 
      {
         Tag = "", 
         Name = "Workshop", 
         Vnum = 120, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "up", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [121] = 
      {
         Tag = "", 
         Name = "Transport Room", 
         Vnum = 121, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [122] = 
      {
         Tag = "", 
         Name = "Darrik's Mortal Relation Room", 
         Vnum = 122, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "east", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
      }, 
      [123] = 
      {
         Tag = "", 
         Name = "Vequir Shipyards", 
         Vnum = 123, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
      }, 
      [124] = 
      {
         Tag = "", 
         Name = "Vequir Construction Yards", 
         Vnum = 124, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
      }, 
      [125] = 
      {
         Tag = "", 
         Name = "Omnipresent Being's Workshop", 
         Vnum = 125, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
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
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [150] = 
      {
         Tag = "", 
         Name = "Floating in a void", 
         Vnum = 150, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
   }, 
   Filename = "omni_complex.lua", 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
}
