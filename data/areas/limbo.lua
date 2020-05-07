-- Limbo
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   ResetFrequency = 0, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 1, 
         Arg2 = 1, 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [2] = 
      {
         Command = "O", 
         Arg1 = 90, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg1 = 6, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg1 = 2, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [5] = 
      {
         Command = "M", 
         Arg1 = 7, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [6] = 
      {
         Command = "O", 
         Arg1 = 7, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 103, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 103, 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Vnum = 1, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "say triggered by (name):\9$n\
say triggered by (name&title): \9$N\
say triggerer is (he,she,it):\9$e\
say triggerer is (him,her,it):\9$m\
say triggerer is (his,hers,its):$s\
say random char (name):\9\9$r\
say random char (name&title or short): \9$R\
say random char  (he,she,it):\9$J\
say random char (him,her,it):\9$K\
say random char (his,hers,its):\9$L\
", 
               Arguments = "test", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say firstname of room:\9 \9$i\
say short_desc/title of room: \9$I\
say he/she/it of room:\9 \9$j\
say him/her/it of room:\9 \9$k\
say his/hers/its of room:\9$l\
say firstname of victim: \9$t\
say short_desc/title of victim:\9$T\
say he/she/it of victim: \9$E\
say him/her/it of victim: \9$M\
say his/hers/its of victim:\9$S\
", 
               Arguments = "test2", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpdamage $n 234234\
", 
               Arguments = "die", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 107, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "&CCorrans Insane Apartment&g", 
      }, 
      [2] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You float in a formless void, detached from all sensation of physical\
matter, surrounded by swirling glowing light which fades into the\
relative darkness around you without any trace of edge or shadow.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
         }, 
         Vnum = 2, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 32145, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Limbo", 
      }, 
      [3] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This room is reserved for storage of polymorphed players.\
", 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
            [9] = "Private", 
            [11] = "_11", 
            [20] = "PlayerHome", 
            [13] = "Arena", 
            [21] = "EmptyHome", 
         }, 
         Vnum = 3, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Storage", 
      }, 
      [4] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "This room is reserved for future use.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 4, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Storage", 
      }, 
      [5] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 5, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
      }, 
      [6] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         Vnum = 6, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
      }, 
      [7] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 7, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mppurge\
", 
               Arguments = "purge", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Mobprog Purge Room", 
      }, 
      [8] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 8, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Immhood ClanStoreRoom", 
      }, 
      [10] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Simple wood logs provide the structure for this room.  A stone fireplace\
dominates one wall, while large windows provide cool breezes in summer.\
Cheery gingham curtains add a bit of life to the room.  A comfy couch and\
chair sit with lamps nearby for reading. A small bed is pushed against one\
wall, a down comforter is rumpled at its foot. A large picture of a\
beautiful boy hangs prominently on a wall near the door. This is a place\
of refuge.\
", 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [21] = "EmptyHome", 
            [25] = "Refinery", 
            [23] = "Hotel", 
         }, 
         Vnum = 10, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               Arguments = "100", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 100, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "An Empty Apartment", 
      }, 
      [11] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 11, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
      }, 
      [12] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 12, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
      }, 
      [19] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         Vnum = 19, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Incognito Platform", 
      }, 
      [20] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 20, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
      }, 
      [29] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 29, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 30, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 32, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [30] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 30, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 40, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [31] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 31, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 34, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 30, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [32] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Vnum = 32, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 35, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [33] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 33, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 30, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 34, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 36, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 32, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 31, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 29, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [7] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 37, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [8] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               DestinationVnum = 35, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [34] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 34, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 37, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [35] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 35, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 32, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 36, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [36] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 36, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 37, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 38, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 35, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [37] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 37, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 34, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 36, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 33, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Arena", 
      }, 
      [38] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "This large room is the main entrance to the Southern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising the southern portion of the arena. The\
lighting is quite dim, and the bellowing echoes of the crowd would be\
quite distracting to the untrained combatant. The walls are of thick\
duratanium, and many charred blaster/explosive marks are strewn about the\
entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 38, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 36, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 39, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
            }, 
         }, 
         Name = "Southern Sniper Tower Entrance", 
      }, 
      [39] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 39, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 36, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 38, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 37, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 35, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
            }, 
         }, 
         Name = "Southern Sniper Tower", 
      }, 
      [40] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 40, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 30, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 41, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
            }, 
         }, 
         Name = "Northern Sniper Tower Entrance", 
      }, 
      [41] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 41, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 30, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 40, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 31, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               DestinationVnum = 29, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
            }, 
         }, 
         Name = "Northern Sniper Tower", 
      }, 
      [42] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 42, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "First Combatant's Chamber", 
      }, 
      [43] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 43, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Second Combatant's Chamber", 
      }, 
      [44] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 44, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Lost in Space", 
      }, 
      [45] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 45, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Name = "Limbo Shipyard", 
      }, 
   }, 
   Filename = "limbo.lua", 
   Name = "Limbo", 
   VnumRanges = 
   {
      Room = 
      {
         Last = 45, 
         First = 1, 
      }, 
      Mob = 
      {
         Last = 98, 
         First = 1, 
      }, 
      Object = 
      {
         Last = 99, 
         First = 2, 
      }, 
   }, 
   Objects = 
   {
      [2] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ItemType = "money", 
         Description = "One miserable credit.", 
         Vnum = 2, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "credit credits", 
         ShortDescr = "a credit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [3] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "money", 
         Description = "Some credits.", 
         Vnum = 3, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "credits credit", 
         ShortDescr = "%d credits", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [4] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "paper", 
         Description = "A deed for a shop", 
         Vnum = 4, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "deed", 
         ShortDescr = "A deed", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [5] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Location = 48, 
               Modifier = 4, 
            }, 
            [2] = 
            {
               Location = 2, 
               Modifier = 3, 
            }, 
            [3] = 
            {
               Location = 48, 
               Modifier = 11, 
            }, 
         }, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Flags = 
         {
            [8] = "Bless", 
            [17] = "_17", 
            [2] = "_02", 
            [21] = "ClanObject", 
            [5] = "Invis", 
            [6] = "Magic", 
            [15] = "_15", 
         }, 
         Vnum = 5, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 100000, 
         ShortDescr = "a metal amulet", 
         Name = "an amulet", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
      }, 
      [6] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 2097152, 
            }, 
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Flags = 
         {
            [23] = "_23", 
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         Vnum = 6, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "A small charm", 
         Name = "charm", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
      }, 
      [7] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "fountain", 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 7, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "Tipper Gore", 
         ShortDescr = "Tipper Gore!", 
      }, 
      [9] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "droid_corpse", 
         Description = "The shattered remains of %s are here.", 
         Vnum = 9, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "corpse remains pieces parts", 
         ShortDescr = "the broken parts of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [10] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "corpse", 
         Description = "The corpse of %s lies here.", 
         Vnum = 10, 
         Layers = 0, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "corpse", 
         ShortDescr = "the corpse of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [11] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "corpse_pc", 
         Description = "The corpse of %s is lying here.", 
         Vnum = 11, 
         Layers = 0, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "corpse", 
         ShortDescr = "the corpse of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [12] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ItemType = "food", 
         Description = "The severed head of %s is lying here.", 
         Vnum = 12, 
         Layers = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Cost = 0, 
         Name = "head", 
         ShortDescr = "the head of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [13] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         ItemType = "food", 
         Description = "The torn-out heart of %s is lying here.", 
         Vnum = 13, 
         Layers = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s savagely devour$q $p!", 
         Cost = 0, 
         Name = "heart", 
         ShortDescr = "the heart of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [14] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ItemType = "food", 
         Description = "The sliced-off arm of %s is lying here.", 
         Vnum = 14, 
         Layers = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s chomp$q on $p.", 
         Cost = 0, 
         Name = "arm", 
         ShortDescr = "the arm of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [15] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ItemType = "food", 
         Description = "The sliced-off leg of %s is lying here.", 
         Vnum = 15, 
         Layers = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s chomp$q on $p.", 
         Cost = 0, 
         Name = "leg", 
         ShortDescr = "the leg of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [16] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "trash", 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         Vnum = 16, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the spilled guts of %s", 
         Name = "guts", 
      }, 
      [17] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "_blood", 
         Description = "A pool of spilled blood lies here.", 
         Vnum = 17, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the spilled blood", 
         Name = "blood", 
      }, 
      [18] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "_bloodstain", 
         Description = "Blood stains the ground.", 
         Vnum = 18, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the bloodstain", 
         Name = "bloodstain", 
      }, 
      [19] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "scraps", 
         Description = "The scraps of %s lie here.", 
         Vnum = 19, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "scraps", 
         ShortDescr = "the scraps of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [20] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "food", 
         Description = "A fruit roll-up lies here", 
         Vnum = 20, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s enjoy$q $p.", 
         Cost = 10, 
         Name = "fruit roll-up", 
         ShortDescr = "a fruit roll-up", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [21] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "light", 
         Description = "A bright ball of light shimmers in the air.", 
         Vnum = 21, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "ball light", 
         ShortDescr = "a bright ball of light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [22] = 
      {
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ItemType = "fountain", 
         Description = "A magical spring flows here.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 22, 
         Layers = 0, 
         Weight = 10, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Name = "spring", 
         ShortDescr = "a magical spring", 
      }, 
      [23] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "fabric", 
         Description = "The skin of %s", 
         Affects = 
         {
            [1] = 
            {
               Location = 25, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 23, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "the skin of %s", 
         ShortDescr = "the skin of %s", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
      }, 
      [24] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ItemType = "food", 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Vnum = 24, 
         Layers = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a slice of raw meat from %s", 
         Name = "meat fresh slice", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [25] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         ItemType = "container", 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         Vnum = 25, 
         Layers = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 20, 
         Name = "shopping bag", 
         ShortDescr = "a bag", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [26] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "fightercomp", 
         Description = "What looks like a part of a ship lies here.", 
         Vnum = 26, 
         Layers = 0, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "fighter module", 
         ShortDescr = "A ship part for %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [27] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "midcomp", 
         Description = "What looks like a decent size part for a ship lies here.", 
         Vnum = 27, 
         Layers = 0, 
         Weight = 150, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "midsize midship module", 
         ShortDescr = "A midsize ship part for %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [28] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "capitalcomp", 
         Description = "What looks like a huge ship part lies here.", 
         Vnum = 28, 
         Layers = 0, 
         Weight = 350, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "capship capital module", 
         ShortDescr = "A capital-class ship part for %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [30] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "fire", 
         Description = "A magical fire burns brightly.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 30, 
         Layers = 0, 
         Weight = 10, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Name = "fire", 
         ShortDescr = "a magical fire", 
      }, 
      [31] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trap", 
         Description = "You detect a trap.", 
         Vnum = 31, 
         Layers = 0, 
         Weight = 100, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ShortDescr = "a trap", 
         Name = "trap", 
      }, 
      [32] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "_portal", 
         Description = "A misty portal beckons you to the unknown.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 32, 
         Layers = 0, 
         Weight = 100, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Name = "portal", 
         ShortDescr = "a portal", 
      }, 
      [33] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         Vnum = 33, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 48000, 
         Name = "black poison powder", 
         ShortDescr = "black poisoning powder", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [34] = 
      {
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "scroll", 
         Description = "A blank scroll lays here gathering dust.", 
         Vnum = 34, 
         Layers = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 10000, 
         Name = "scroll scribing blank", 
         ShortDescr = "a blank scroll", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [35] = 
      {
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ItemType = "potion", 
         Description = "An empty flask lays here gathering dust.", 
         Vnum = 35, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 15000, 
         Name = "flask empty", 
         ShortDescr = "an empty flask", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [36] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "paper", 
         Description = "A message disk has been discarded here.", 
         Vnum = 36, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 1500, 
         Name = "parchment paper note data disk message info", 
         ShortDescr = "a message disk", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [37] = 
      {
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ItemType = "pen", 
         Description = "A datapad used for recording message disks is here.", 
         Vnum = 37, 
         Layers = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 2000, 
         Name = "quill pen datapad recorder message disk", 
         ShortDescr = "a datapad", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [38] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "furniture", 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         Vnum = 38, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a mail terminal", 
         Name = "mail terminal", 
      }, 
      [43] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "armor", 
         Description = "A holy symbol lies here, shining.", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 43, 
         Layers = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Name = "holy symbol faith", 
         ShortDescr = "a symbol of faith", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [45] = 
      {
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ItemType = "grenade", 
         Description = "A grenade .... run!!!!", 
         Vnum = 45, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Teklos low yield grenade.  Perfect for blowing your neighbor into tiny\
\13bits with. \
\13", 
               Keyword = "grenade", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 1200, 
         Name = "grenade", 
         ShortDescr = "a grenade", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [46] = 
      {
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ItemType = "landmine", 
         Description = "Don't step on the landmine.", 
         Vnum = 46, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Blastech plasma mine.  Developed after the Imperial defeat at Yavin, this\
\13mine was used to saturate possible rebel bases.\
\13", 
               Keyword = "landmine mine", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 1000, 
         Name = "landmine mine", 
         ShortDescr = "a landmine", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [50] = 
      {
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 50, 
         Layers = 0, 
         Weight = 10, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The most common weapon in use by either the Rebel Alliance, New Order, or\
\13planetary militias. This highpowered weapon was so mass produced when\
\13first seeing service with the New Order's stormtrooper corps, that between\
\13stolen shipments and weapons scavenged from battlefields, the Alliance had\
\13almost as many of these rifles as the Empire. Later, the weapon was\
\13'cloned' by SoroSuub as the Stormtrooper One, or SoroSuub One rifle.\
\13", 
               Keyword = "blaster Blastech E11 rifle E-11", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 3250, 
         Name = "blaster Blastech E11 rifle E-11", 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [51] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A Blastech DL-18 lies here on the floor.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 51, 
         Layers = 0, 
         Weight = 6, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The DL-18 is a sleek, hand-held blaster built by Blas-Tech, often referred\
\13to as the \"Mos Eisley special\". \
\13", 
               Keyword = "blaster blastech dl-18 blaster pistol", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 3000, 
         Name = "blaster blastech dl-18 blaster pistol", 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [52] = 
      {
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A heavy blaster pistol was dropped here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 52, 
         Layers = 0, 
         Weight = 8, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The DL-44 is a high powered hand blaster, often banned from civilian use in\
\13certain planetary systems.  Han Solo himself uses a modified version of\
\13the DL-44.\
\13", 
               Keyword = "blaster blastech dl-44 heavy blaster pistol", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 3600, 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [53] = 
      {
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "An assault rifle was left here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 53, 
         Layers = 0, 
         Weight = 12, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The DLT-19 is a long, sleek blaster rifle was manufactured by BlasTech.\
\13Although it mainly sees use only in the stormtrooper corps, it saw heavy\
\13combat on the side of the Alliance during the Battle of Hoth.\
\13", 
               Keyword = "blaster blastech dlt-19 assault rifle", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 3750, 
         Name = "blaster blastech dlt-19 assault rifle", 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [54] = 
      {
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A repeating blaster is collecting dust.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
         }, 
         Vnum = 54, 
         Layers = 0, 
         Weight = 10, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [2] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [3] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [4] = 
            {
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [5] = 
            {
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [6] = 
            {
               Description = "A long, thick barreled blaster.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [7] = 
            {
               Description = "", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [8] = 
            {
               Description = "A long barreled blaster\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 3900, 
         Name = "blastech t-21 repeating blaster", 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [55] = 
      {
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         Vnum = 55, 
         Layers = 0, 
         Weight = 8, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The Bryar heavy blaster pistol. Although considered antique in comparisson\
\13with the new and more powerful BlasTech models, this old blaster still\
\13packs a punch.\
\13", 
               Keyword = "bryar pistol blaster", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 3700, 
         Name = "bryar pistol blaster", 
         ShortDescr = "a Bryar heavy blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [56] = 
      {
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A cheap holdout blaster is here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -3, 
            }, 
         }, 
         Vnum = 56, 
         Layers = 0, 
         Weight = 4, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A small, easily concealable blaster, the budgetline is used by undercover\
\13agents galaxy wide. It's lack of accuracy is made up for by it's stealth.\
\13", 
               Keyword = "blaster Budgetline 3.0/12 holdout", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 900, 
         Name = "blaster Budgetline 3.0/12 holdout", 
         ShortDescr = "a Budgetline 3.0/12", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [57] = 
      {
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 57, 
         Layers = 0, 
         Weight = 4, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 2800, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Name = "sorosuub q2 holdout blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [58] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A very small blaster was dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 58, 
         Layers = 0, 
         Weight = 3, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 2000, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Name = "blastech last resort mini-blaster blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [59] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         ItemType = "weapon", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         Description = "A sharp looking blade is here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 59, 
         Layers = 0, 
         Weight = 4, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 350, 
         ShortDescr = "a long sharp vibro-blade", 
         Name = "long vibro-blade", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [60] = 
      {
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Description = "A blaster rifle was dropped here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 60, 
         Layers = 0, 
         Weight = 10, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 3000, 
         Name = "Sorosuub One Blaster Rifle", 
         ShortDescr = "a Sorosuub One blaster rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [99] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Description = "Some god dropped a newly created final object here.", 
         Vnum = 99, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a newly created final object", 
         Name = "final object", 
      }, 
      [90] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "furniture", 
         Description = "The suggestions board is here.", 
         Vnum = 90, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the suggestions board", 
         Name = "Suggestions Board", 
      }, 
      [70] = 
      {
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         ItemType = "weapon", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               Arguments = "100", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 5, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 5, 
            }, 
         }, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Vnum = 70, 
         Layers = 0, 
         Weight = 8, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Name = "quest weapon double bladed lightsaber saber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [71] = 
      {
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ItemType = "armor", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               Arguments = "100", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 16777216, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 8, 
            }, 
         }, 
         Description = "An evil looking battle helmet.", 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         Vnum = 71, 
         Layers = 0, 
         Weight = 10, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Name = "quest armor mandalorian battle helmet", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
      }, 
      [72] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "container", 
         Description = "A dud is here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 72, 
         Layers = 0, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Code = "mpoload 10313\
put ration item\
", 
               Arguments = "100", 
            }, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "quest item", 
         ShortDescr = "Mystery Box 1", 
      }, 
      [73] = 
      {
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         ItemType = "armor", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               Arguments = "100", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 67108864, 
            }, 
            [2] = 
            {
               Location = 28, 
               Modifier = 8192, 
            }, 
         }, 
         Description = "A small energy device lies on the floor.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 73, 
         Layers = 0, 
         Weight = 3, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A glowing energy shield that seems to pulse with power.  It looks strong\
\13enough to repel some blaster fire.\
\13", 
               Keyword = "quest shield", 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Name = "quest shield generator", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
      }, 
      [74] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Description = "A dud is here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 74, 
         Layers = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "quest item dinner", 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
      }, 
      [75] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 75, 
         Layers = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Name = "quest token sapphire", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [76] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 76, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Name = "quest token diamond", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [77] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 77, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Name = "quest token emerald", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [78] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 78, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Name = "quest token amythest", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [79] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 79, 
         Layers = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Name = "quest token ruby", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
   }, 
   Mobiles = 
   {
      [1] = 
      {
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [21] = "defel", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [21] = "defel", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Level = 50, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "say triggered by (name):\9$n\
say triggered by (name&title): \9$N\
say triggerer is (he,she,it):\9$e\
say triggerer is (him,her,it):\9$m\
say triggerer is (his,hers,its):$s\
say random char (name):\9\9$r\
say random char (name&title or short): \9$R\
say random char  (he,she,it):\9$J\
say random char (him,her,it):\9$L\
say random char (his,hers,its):\9$K\
", 
               Arguments = "test", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say firstname of obj:\9 \9$i\
say short_desc/title of obj: \9$I\
say he/she/it of obj:\9 \9$j\
say him/her/it of obj:\9 \9$k\
say his/hers/its of obj:\9$l\
say firstname of victim: \9$t\
say short_desc/title of victim:\9$T\
say he/she/it of victim: \9$E\
say him/her/it of victim: \9$M\
say his/hers/its of victim:\9$S\
", 
               Arguments = "test2", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 30550, 
         }, 
         Credits = 10000, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "Puff", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Alignment = 1000, 
         Vnum = 1, 
         Race = "Gand", 
         ArmorClass = -30, 
         Damage = 
         {
            DamPlus = 200, 
            DamSizeDice = 10, 
            DamNoDice = 4, 
         }, 
         DefaultPosition = "standing", 
         Sex = "female", 
         Position = "standing", 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Name = "Puff", 
      }, 
      [2] = 
      {
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Level = 50, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "mpforce $n drink\
c heal $n\
", 
               Arguments = "p is dying", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
               Arguments = "p is starved", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Code = "cast heal $n\
cast heal $n\
", 
               Arguments = "p bashes against", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               Arguments = "p shivers and", 
            }, 
            [5] = 
            {
               MudProgType = "act_prog", 
               Code = "c heal $n\
c heal $n\
", 
               Arguments = "p wears", 
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Code = "c heal $n\
c heal $n\
", 
               Arguments = "p wields", 
            }, 
            [7] = 
            {
               MudProgType = "act_prog", 
               Code = "mptrans $n 6\
", 
               Arguments = "p is DEAD!!", 
            }, 
            [8] = 
            {
               MudProgType = "rand_prog", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               Arguments = "25", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 31550, 
         }, 
         Credits = 10000, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "Richard Simmons", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = -1000, 
         Vnum = 2, 
         Race = "Human", 
         ArmorClass = -300, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 2, 
            DamNoDice = 1, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Name = "Richard Simmons", 
      }, 
      [3] = 
      {
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Description = "How clever he looks!\
", 
         Flags = 
         {
            [0] = "Npc", 
            [13] = "PolySelf", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         Level = 105, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpinvis 101\
", 
               Arguments = "25", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               Code = "mpinvis 101\
", 
               Arguments = "100", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 1050, 
         }, 
         Credits = 10000, 
         NumberOfAttacks = 0, 
         HitRoll = 21, 
         Height = 0, 
         ShortDescr = "the supermob", 
         DamRoll = 21, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = -1000, 
         Vnum = 3, 
         Race = "Human", 
         ArmorClass = -162, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Name = "supermob", 
      }, 
      [4] = 
      {
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Level = 103, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [26] = "falleen", 
               [27] = "binary", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [26] = "falleen", 
               [27] = "binary", 
            }, 
         }, 
         Shop = 
         {
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "a vendor", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Immune = 
         {
            [1] = "cold", 
            [2] = "electricity", 
            [3] = "energy", 
            [4] = "blunt", 
            [5] = "pierce", 
            [6] = "slash", 
            [7] = "acid", 
            [8] = "poison", 
            [9] = "drain", 
            [10] = "sleep", 
            [11] = "charm", 
            [12] = "hold", 
            [13] = "nonmagic", 
            [14] = "plus1", 
            [15] = "plus2", 
            [16] = "plus3", 
            [17] = "plus4", 
            [18] = "plus5", 
            [19] = "plus6", 
            [20] = "magic", 
            [21] = "paralysis", 
            [22] = "steal", 
            [0] = "fire", 
         }, 
         ShortDescr = "a vendor", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 25, 
            Luck = 10, 
            Strength = 25, 
            Constitution = 25, 
            Dexterity = 25, 
            Charisma = 25, 
            Force = 0, 
            Intelligence = 25, 
         }, 
         Alignment = 0, 
         Vnum = 4, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A Vendor owned by %s\
", 
         Name = "a vendor", 
      }, 
      [5] = 
      {
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "an animated corpse", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 5, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Name = "undead animated corpse", 
      }, 
      [6] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = -1000, 
         Vnum = 6, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Name = "Rosie O'Donnel", 
      }, 
      [7] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
               Arguments = "p is thirsty", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a newly created Al Gore", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 7, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Name = "Al Gore", 
      }, 
      [10] = 
      {
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         Level = 80, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 16, 
            HitPlus = 800, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 16, 
         Height = 0, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         DamRoll = 16, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Alignment = 0, 
         Vnum = 10, 
         Race = "_69", 
         ArmorClass = -100, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 8, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         Name = "mauzumi die wolf", 
      }, 
      [11] = 
      {
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [3] = "rodese", 
               [20] = "verpine", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [27] = "binary", 
               [14] = "gamorrese", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [3] = "rodese", 
               [20] = "verpine", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [27] = "binary", 
               [14] = "gamorrese", 
               [15] = "togorian", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "mist", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         Alignment = 0, 
         Vnum = 11, 
         Race = "_85", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A thick mist plays with your senses.\
", 
         Name = "mist", 
      }, 
      [12] = 
      {
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
               [3] = "rodese", 
               [30] = "durese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [29] = "gand", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [26] = "falleen", 
               [28] = "yevethan", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
               [3] = "rodese", 
               [30] = "durese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [29] = "gand", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [26] = "falleen", 
               [28] = "yevethan", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [25] = "sullustese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "bat", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Alignment = 0, 
         Vnum = 12, 
         Race = "Barabel", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Name = "bat", 
      }, 
      [13] = 
      {
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "hawk", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Alignment = 0, 
         Vnum = 13, 
         Race = "_78", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Name = "hawk", 
      }, 
      [14] = 
      {
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [22] = "dosh", 
               [21] = "defel", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [16] = "kubazian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [16] = "kubazian", 
               [18] = "_clan", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [22] = "dosh", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [21] = "defel", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "black cat", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Alignment = 0, 
         Vnum = 14, 
         Race = "Gran", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Name = "black cat", 
      }, 
      [15] = 
      {
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 1, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "dove", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Alignment = 0, 
         Vnum = 15, 
         Race = "_78", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Name = "dove", 
      }, 
      [16] = 
      {
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [20] = "verpine", 
               [17] = "jawaese", 
               [27] = "binary", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 1, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "fish", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 16, 
         Race = "_81", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Name = "fish", 
      }, 
      [20] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         Level = 10, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 2, 
            HitPlus = 100, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 2, 
         Height = 0, 
         ShortDescr = "a stormtrooper", 
         DamRoll = 2, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 20, 
         Race = "Human", 
         ArmorClass = 75, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_stormtrooper", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Name = "imperial trooper stormtrooper", 
      }, 
      [21] = 
      {
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 21, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An imperial guard stands at attention.\
", 
         Name = "imperial guard stormtrooper", 
      }, 
      [22] = 
      {
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 22, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Name = "Rebel Alliance guard", 
      }, 
      [23] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 23, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_rebel_trooper", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Name = "Rebel Alliance Trooper soldier", 
      }, 
      [24] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 1, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a mercenary", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Alignment = 0, 
         Vnum = 24, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Name = "A mercenary", 
      }, 
      [25] = 
      {
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 0, 
         Vnum = 25, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An alert guard stands at attention.\
", 
         Name = "bouncer guard thug", 
      }, 
      [26] = 
      {
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
         Vnum = 26, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Name = "Imperial Elite Guard", 
      }, 
      [27] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 27, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An imperial guard stands at attention.\
", 
         Name = "The Empire", 
      }, 
      [28] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Level = 10, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 2, 
            HitPlus = 100, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a stormtrooper", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 28, 
         Race = "Human", 
         ArmorClass = 75, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_stormtrooper", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Name = "an imperial specfor trooper", 
      }, 
      [29] = 
      {
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
         Vnum = 29, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Name = "rebel elite guard", 
      }, 
      [30] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 30, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Name = "The Rebel Alliance", 
      }, 
      [31] = 
      {
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
         Vnum = 31, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_rebel_trooper", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Name = "a rebel specfor trooper", 
      }, 
      [32] = 
      {
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
         Vnum = 32, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Name = "a merc elite guard", 
      }, 
      [40] = 
      {
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [12] = "Deadly", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Level = 105, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpat 5991 autopilot\
", 
               Arguments = "autopilot", 
            }, 
         }, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 1050, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 21, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         ShortDescr = "the ship upgrades technician", 
         DamRoll = 21, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 40, 
         Race = "Human", 
         ArmorClass = -162, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "The ship upgrades technician is here.\
", 
         Name = "Ship Upgrades Technician", 
      }, 
      [33] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Level = 1, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 33, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An alert guard stands at attention.\
", 
         Name = "bouncer guard thug", 
      }, 
      [50] = 
      {
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Level = 105, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "if ovnuminv(10208) >= 1\
say Thank you.\
mpwithdraw 2500\
give 2500 credits $n\
mpgain $n 5 100000\
else\
say hmm... Thanks, but this isn't adressed to me.\
drop all\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               Arguments = "package.", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               Arguments = "corusca", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               Arguments = "give", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               Arguments = "shop", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [11] = "_11", 
            [13] = "_13", 
            [19] = "_19", 
            [8] = "_08", 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 5000, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 21, 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         ShortDescr = "Jedi Master Yoda", 
         DamRoll = 21, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Luck = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Alignment = 1000, 
         Vnum = 50, 
         Race = "Human", 
         ArmorClass = -162, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         DefaultPosition = "standing", 
         Sex = "male", 
         Position = "standing", 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Name = "Master Yoda", 
      }, 
      [98] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpat 32179 drop all\
", 
               Arguments = "100", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a janitor", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 98, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_janitor", 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "A janitor cleans up the ship here.\
", 
         Name = "janitor", 
      }, 
      [34] = 
      {
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Height = 0, 
         ShortDescr = "a mercenary", 
         DamRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Luck = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Alignment = 0, 
         Vnum = 34, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Position = "standing", 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Name = "A mercenary", 
      }, 
   }, 
   Author = "RoD/Durga", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   ResetMessage = "&rYour soul burns...", 
   FileFormatVersion = 1, 
   LowEconomy = 42195975, 
}
