-- Omnipresent Complex
-- Last saved Wednesday 25-Nov-2020 23:08:10

AreaEntry
{
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
   Name = "Omnipresent Complex", 
   Objects = 
   {
      [104] = 
      {
         ItemType = "furniture", 
         Name = "A long couch", 
         ShortDescr = "a couch", 
         Description = "A comfortable couch was placed here", 
         Vnum = 104, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Tag = "", 
         ActionDescription = "", 
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
      [105] = 
      {
         ItemType = "armor", 
         Name = "belt", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               ScriptType = "Imp", 
               Code = "from test import *\
def on_wear(obj, actor):\
    test_wear(obj, actor)\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               ScriptType = "Imp", 
               Code = "def on_remove(obj, actor):\
    echo(actor, \"You are relieved as you remove \" + str(obj))\
", 
               Arguments = "100", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
               Code = "def on_rand(obj):\
    if not inroom(obj):\
        echoaround(obj, str(obj) + \" feels a bit tight.\")\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "a belt", 
         ExtraDescriptions = 
         {
         }, 
         Description = "A belt is here.", 
         Vnum = 105, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         Tag = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
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
         ItemType = "trash", 
         Name = "multiplay board", 
         ShortDescr = "multiplay board", 
         ExtraDescriptions = 
         {
         }, 
         Description = "Multiplay Board", 
         Vnum = 106, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
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
         ItemType = "trash", 
         Name = "terminal omnipresent monitor", 
         ShortDescr = "the Monitoring Terminal", 
         Description = "The Monitoring Terminal has been installed here.", 
         Vnum = 100, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Tag = "monitoring_terminal", 
         ActionDescription = "", 
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
         ItemType = "trash", 
         Name = "terminal omnipresent coding", 
         ShortDescr = "the Coding Terminal", 
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         Vnum = 101, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Tag = "", 
         ActionDescription = "", 
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
         ItemType = "trash", 
         Name = "terminal quest galactic control blinking", 
         ShortDescr = "the Terminal for Galactic Control", 
         ExtraDescriptions = 
         {
         }, 
         Description = "The Quest Board is here, and is blinking.", 
         Vnum = 102, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
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
         ItemType = "trash", 
         Name = "silphion silphions wormhole teleporter glimmer", 
         ShortDescr = "durgas wormhole", 
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         Vnum = 103, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Tag = "", 
         ActionDescription = "", 
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
   ResetFrequency = 0, 
   Mobiles = 
   {
   }, 
   Author = "Kuran", 
   Filename = "omni_complex.lua", 
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
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg3 = 100, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 100, 
      }, 
      [2] = 
      {
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 107, 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg3 = 102, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 32201, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg3 = 114, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 38, 
      }, 
      [5] = 
      {
         Arg2 = 0, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 119, 
      }, 
      [6] = 
      {
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 109, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg3 = 118, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 104, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg3 = 110, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 38, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Arg3 = 106, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 103, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Arg3 = 106, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 106, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 106, 
      }, 
      [12] = 
      {
         Arg2 = 2, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 106, 
      }, 
      [13] = 
      {
         Arg2 = 4, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 106, 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 150, 
         First = 100, 
      }, 
      Object = 
      {
         Last = 150, 
         First = 100, 
      }, 
      Mob = 
      {
         Last = 150, 
         First = 100, 
      }, 
   }, 
   HighEconomy = 0, 
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
         Vnum = 100, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 104, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 102, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 106, 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 125, 
               Key = -1, 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 105, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Omnipresent Being's Monitoring Room", 
      }, 
      [101] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 101, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 125, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [102] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
         Vnum = 102, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
      }, 
      [103] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 103, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 101, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 102, 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 110, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [104] = 
      {
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
         Vnum = 104, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
      }, 
      [105] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 105, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [106] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
         Vnum = 106, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "door office", 
               Distance = 0, 
               DestinationVnum = 107, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 119, 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 111, 
               Key = -1, 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 110, 
               Key = -1, 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 112, 
               Key = -1, 
               Description = "", 
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
               Keyword = "glimmer teleport teleporter silphion", 
               Distance = 0, 
               DestinationVnum = 108, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Omnipresent Being's Office Complex", 
      }, 
      [107] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
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
               Arguments = "foobar", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 107, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "kai_home", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 106, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [108] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
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
         Vnum = 108, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 110, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "The Real Universe", 
      }, 
      [109] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 109, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 121, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 118, 
               Key = 9599, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [110] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
         Vnum = 110, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 106, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "The Omnipresent Mail Room", 
      }, 
      [111] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 111, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 106, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [112] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 112, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 106, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
      }, 
      [113] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 113, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 114, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 116, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 115, 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 119, 
               Key = -1, 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 118, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Main Room of Darrik's Quarters", 
      }, 
      [114] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 114, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 113, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Mail Room", 
      }, 
      [115] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 115, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 113, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "OOC Board room", 
      }, 
      [116] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 116, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 113, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 117, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Tech Board room", 
      }, 
      [117] = 
      {
         Flags = 
         {
            [9] = "Private", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 117, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 116, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Tech Idea Board Room", 
      }, 
      [118] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 118, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 122, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 113, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 120, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Living Room", 
      }, 
      [119] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 119, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 106, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 113, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "An Empty Home", 
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
         Tunnel = 0, 
         Description = "", 
         Vnum = 120, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 118, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Workshop", 
      }, 
      [121] = 
      {
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 121, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "Transport Room", 
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
         Tunnel = 0, 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
         Vnum = 122, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 118, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Darrik's Mortal Relation Room", 
      }, 
      [123] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
         Vnum = 123, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 124, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Vequir Shipyards", 
      }, 
      [124] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
         Vnum = 124, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 123, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Name = "Vequir Construction Yards", 
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
         Tunnel = 0, 
         Description = "", 
         Vnum = 125, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Name = "Omnipresent Being's Workshop", 
      }, 
      [150] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 150, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "Floating in a void", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 30457103, 
}
