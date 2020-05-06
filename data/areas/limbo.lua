-- Limbo
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   Filename = "limbo.lua", 
   Rooms = 
   {
      [1] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "&CCorrans Insane Apartment&g", 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Vnum = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "test", 
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
            }, 
            [2] = 
            {
               Arguments = "test2", 
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
            }, 
            [3] = 
            {
               Arguments = "die", 
               MudProgType = "speech_prog", 
               Code = "mpdamage $n 234234\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 107, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
      }, 
      [2] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Limbo", 
         Description = "You float in a formless void, detached from all sensation of physical\
matter, surrounded by swirling glowing light which fades into the\
relative darkness around you without any trace of edge or shadow.\
", 
         Vnum = 2, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32145, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
         }, 
      }, 
      [3] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storage", 
         Description = "This room is reserved for storage of polymorphed players.\
", 
         Vnum = 3, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
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
      }, 
      [4] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storage", 
         Description = "This room is reserved for future use.\
", 
         Vnum = 4, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [5] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 5, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [6] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Vnum = 6, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
      }, 
      [7] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mobprog Purge Room", 
         Description = "", 
         Vnum = 7, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "purge", 
               MudProgType = "speech_prog", 
               Code = "mppurge\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [8] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Immhood ClanStoreRoom", 
         Description = "", 
         Vnum = 8, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [10] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "An Empty Apartment", 
         Description = "Simple wood logs provide the structure for this room.  A stone fireplace\
dominates one wall, while large windows provide cool breezes in summer.\
Cheery gingham curtains add a bit of life to the room.  A comfy couch and\
chair sit with lamps nearby for reading. A small bed is pushed against one\
wall, a down comforter is rumpled at its foot. A large picture of a\
beautiful boy hangs prominently on a wall near the door. This is a place\
of refuge.\
", 
         Vnum = 10, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "speech_prog", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 100, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
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
      }, 
      [11] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 11, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [12] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 12, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [19] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Incognito Platform", 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Vnum = 19, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
      }, 
      [20] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 20, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [29] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 29, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 30, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [30] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 30, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 40, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 31, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 29, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 31, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 34, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 30, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [32] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 32, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 29, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 35, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
      }, 
      [33] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 33, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 30, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 34, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 36, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 31, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
            [6] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 29, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
            [7] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 37, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
            [8] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 35, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [34] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 34, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 31, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 37, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [35] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 35, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 36, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [36] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Vnum = 36, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 37, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 38, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 35, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [37] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Vnum = 37, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 34, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 36, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 33, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [38] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Southern Sniper Tower Entrance", 
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
         Vnum = 38, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 36, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               DestinationVnum = 39, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [39] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Southern Sniper Tower", 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Vnum = 39, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Keyword = "", 
               DestinationVnum = 36, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               DestinationVnum = 38, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Keyword = "", 
               DestinationVnum = 37, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Keyword = "", 
               DestinationVnum = 35, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [40] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Sniper Tower Entrance", 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Vnum = 40, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 30, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               DestinationVnum = 41, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [41] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Sniper Tower", 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Vnum = 41, 
         Sector = "inside", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Keyword = "", 
               DestinationVnum = 30, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               DestinationVnum = 40, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Keyword = "", 
               DestinationVnum = 31, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Keyword = "", 
               DestinationVnum = 29, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [42] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "First Combatant's Chamber", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Vnum = 42, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [43] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Second Combatant's Chamber", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Vnum = 43, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [44] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lost in Space", 
         Description = "", 
         Vnum = 44, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [45] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Limbo Shipyard", 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Vnum = 45, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
   }, 
   Name = "Limbo", 
   Objects = 
   {
      [2] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "credit credits", 
         ActionDescription = "", 
         ShortDescr = "a credit", 
         ItemType = "money", 
         Vnum = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         Description = "One miserable credit.", 
      }, 
      [3] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "credits credit", 
         ActionDescription = "", 
         ShortDescr = "%d credits", 
         ItemType = "money", 
         Vnum = 3, 
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
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         Description = "Some credits.", 
      }, 
      [4] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "deed", 
         ActionDescription = "", 
         ShortDescr = "A deed", 
         ItemType = "paper", 
         Vnum = 4, 
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
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         Description = "A deed for a shop", 
      }, 
      [5] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Weight = 1, 
         Name = "an amulet", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a metal amulet", 
         ItemType = "armor", 
         Vnum = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 100000, 
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
         Layers = 0, 
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
      }, 
      [6] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         Name = "charm", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "A small charm", 
         ItemType = "armor", 
         Vnum = 6, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 2097152, 
            }, 
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Layers = 0, 
         Flags = 
         {
            [23] = "_23", 
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
      }, 
      [7] = 
      {
         Weight = 1, 
         Name = "Tipper Gore", 
         ActionDescription = "", 
         ShortDescr = "Tipper Gore!", 
         ItemType = "fountain", 
         Vnum = 7, 
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
         Cost = 0, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [9] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "corpse remains pieces parts", 
         ActionDescription = "", 
         ShortDescr = "the broken parts of %s", 
         ItemType = "droid_corpse", 
         Vnum = 9, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         Description = "The shattered remains of %s are here.", 
      }, 
      [10] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "corpse", 
         ActionDescription = "", 
         ShortDescr = "the corpse of %s", 
         ItemType = "corpse", 
         Vnum = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 100, 
         Layers = 0, 
         Description = "The corpse of %s lies here.", 
      }, 
      [11] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "corpse", 
         ActionDescription = "", 
         ShortDescr = "the corpse of %s", 
         ItemType = "corpse_pc", 
         Vnum = 11, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 100, 
         Layers = 0, 
         Description = "The corpse of %s is lying here.", 
      }, 
      [12] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "head", 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         ShortDescr = "the head of %s", 
         ItemType = "food", 
         Vnum = 12, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 5, 
         Layers = 0, 
         Description = "The severed head of %s is lying here.", 
      }, 
      [13] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "heart", 
         ActionDescription = "%s savagely devour$q $p!", 
         ShortDescr = "the heart of %s", 
         ItemType = "food", 
         Vnum = 13, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 2, 
         Layers = 0, 
         Description = "The torn-out heart of %s is lying here.", 
      }, 
      [14] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "arm", 
         ActionDescription = "%s chomp$q on $p.", 
         ShortDescr = "the arm of %s", 
         ItemType = "food", 
         Vnum = 14, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 5, 
         Layers = 0, 
         Description = "The sliced-off arm of %s is lying here.", 
      }, 
      [15] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "leg", 
         ActionDescription = "%s chomp$q on $p.", 
         ShortDescr = "the leg of %s", 
         ItemType = "food", 
         Vnum = 15, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 5, 
         Layers = 0, 
         Description = "The sliced-off leg of %s is lying here.", 
      }, 
      [16] = 
      {
         Weight = 1, 
         Name = "guts", 
         ActionDescription = "", 
         ShortDescr = "the spilled guts of %s", 
         ItemType = "trash", 
         Vnum = 16, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
      }, 
      [17] = 
      {
         Weight = 1, 
         Name = "blood", 
         ActionDescription = "", 
         ShortDescr = "the spilled blood", 
         ItemType = "_blood", 
         Vnum = 17, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         Description = "A pool of spilled blood lies here.", 
      }, 
      [18] = 
      {
         Weight = 1, 
         Name = "bloodstain", 
         ActionDescription = "", 
         ShortDescr = "the bloodstain", 
         ItemType = "_bloodstain", 
         Vnum = 18, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         Description = "Blood stains the ground.", 
      }, 
      [19] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "scraps", 
         ActionDescription = "", 
         ShortDescr = "the scraps of %s", 
         ItemType = "scraps", 
         Vnum = 19, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         Description = "The scraps of %s lie here.", 
      }, 
      [20] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "fruit roll-up", 
         ActionDescription = "%s enjoy$q $p.", 
         ShortDescr = "a fruit roll-up", 
         ItemType = "food", 
         Vnum = 20, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Weight = 1, 
         Layers = 0, 
         Description = "A fruit roll-up lies here", 
      }, 
      [21] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "ball light", 
         ActionDescription = "", 
         ShortDescr = "a bright ball of light", 
         ItemType = "light", 
         Vnum = 21, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         Description = "A bright ball of light shimmers in the air.", 
      }, 
      [22] = 
      {
         Weight = 10, 
         Name = "spring", 
         ActionDescription = "", 
         ShortDescr = "a magical spring", 
         ItemType = "fountain", 
         Vnum = 22, 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Description = "A magical spring flows here.", 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [23] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Name = "the skin of %s", 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "the skin of %s", 
         ItemType = "fabric", 
         Vnum = 23, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 25, 
               Modifier = 2, 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Description = "The skin of %s", 
      }, 
      [24] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "meat fresh slice", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a slice of raw meat from %s", 
         ItemType = "food", 
         Vnum = 24, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Cost = 0, 
         Weight = 2, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Layers = 0, 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [25] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "shopping bag", 
         ActionDescription = "", 
         ShortDescr = "a bag", 
         ItemType = "container", 
         Vnum = 25, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20, 
         Weight = 2, 
         Layers = 0, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
      }, 
      [26] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "fighter module", 
         ActionDescription = "", 
         ShortDescr = "A ship part for %s", 
         ItemType = "fightercomp", 
         Vnum = 26, 
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
         Cost = 0, 
         Weight = 100, 
         Layers = 0, 
         Description = "What looks like a part of a ship lies here.", 
      }, 
      [27] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "midsize midship module", 
         ActionDescription = "", 
         ShortDescr = "A midsize ship part for %s", 
         ItemType = "midcomp", 
         Vnum = 27, 
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
         Cost = 0, 
         Weight = 150, 
         Layers = 0, 
         Description = "What looks like a decent size part for a ship lies here.", 
      }, 
      [28] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "capship capital module", 
         ActionDescription = "", 
         ShortDescr = "A capital-class ship part for %s", 
         ItemType = "capitalcomp", 
         Vnum = 28, 
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
         Cost = 0, 
         Weight = 350, 
         Layers = 0, 
         Description = "What looks like a huge ship part lies here.", 
      }, 
      [30] = 
      {
         Weight = 10, 
         Name = "fire", 
         ActionDescription = "", 
         ShortDescr = "a magical fire", 
         ItemType = "fire", 
         Vnum = 30, 
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
         Cost = 10, 
         Description = "A magical fire burns brightly.", 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [31] = 
      {
         Weight = 100, 
         Name = "trap", 
         ActionDescription = "", 
         ShortDescr = "a trap", 
         ItemType = "trap", 
         Vnum = 31, 
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
         Cost = 10, 
         Layers = 0, 
         Description = "You detect a trap.", 
      }, 
      [32] = 
      {
         Weight = 100, 
         Name = "portal", 
         ActionDescription = "", 
         ShortDescr = "a portal", 
         ItemType = "_portal", 
         Vnum = 32, 
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
         Cost = 10, 
         Description = "A misty portal beckons you to the unknown.", 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [33] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "black poison powder", 
         ActionDescription = "", 
         ShortDescr = "black poisoning powder", 
         ItemType = "trash", 
         Vnum = 33, 
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
         Cost = 48000, 
         Weight = 1, 
         Layers = 0, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
      }, 
      [34] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "scroll scribing blank", 
         ActionDescription = "", 
         ShortDescr = "a blank scroll", 
         ItemType = "scroll", 
         Vnum = 34, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
         Weight = 2, 
         Layers = 0, 
         Description = "A blank scroll lays here gathering dust.", 
      }, 
      [35] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "flask empty", 
         ActionDescription = "", 
         ShortDescr = "an empty flask", 
         ItemType = "potion", 
         Vnum = 35, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15000, 
         Weight = 1, 
         Layers = 0, 
         Description = "An empty flask lays here gathering dust.", 
      }, 
      [36] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "parchment paper note data disk message info", 
         ActionDescription = "", 
         ShortDescr = "a message disk", 
         ItemType = "paper", 
         Vnum = 36, 
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
         Cost = 1500, 
         Weight = 1, 
         Layers = 0, 
         Description = "A message disk has been discarded here.", 
      }, 
      [37] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quill pen datapad recorder message disk", 
         ActionDescription = "", 
         ShortDescr = "a datapad", 
         ItemType = "pen", 
         Vnum = 37, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
         Weight = 2, 
         Layers = 0, 
         Description = "A datapad used for recording message disks is here.", 
      }, 
      [38] = 
      {
         Weight = 1, 
         Name = "mail terminal", 
         ActionDescription = "", 
         ShortDescr = "a mail terminal", 
         ItemType = "furniture", 
         Vnum = 38, 
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
         Cost = 0, 
         Layers = 0, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
      }, 
      [43] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "holy symbol faith", 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a symbol of faith", 
         ItemType = "armor", 
         Vnum = 43, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 2, 
            }, 
         }, 
         Weight = 5, 
         Layers = 0, 
         Description = "A holy symbol lies here, shining.", 
      }, 
      [45] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "grenade", 
         ActionDescription = "", 
         ShortDescr = "a grenade", 
         ItemType = "grenade", 
         Vnum = 45, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
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
         Cost = 1200, 
         Weight = 1, 
         Layers = 0, 
         Description = "A grenade .... run!!!!", 
      }, 
      [46] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "landmine mine", 
         ActionDescription = "", 
         ShortDescr = "a landmine", 
         ItemType = "landmine", 
         Vnum = 46, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
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
         Cost = 1000, 
         Weight = 1, 
         Layers = 0, 
         Description = "Don't step on the landmine.", 
      }, 
      [50] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster Blastech E11 rifle E-11", 
         ActionDescription = "", 
         Cost = 3250, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         ItemType = "weapon", 
         Vnum = 50, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
      }, 
      [51] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster blastech dl-18 blaster pistol", 
         ActionDescription = "", 
         Cost = 3000, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         ItemType = "weapon", 
         Vnum = 51, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Weight = 6, 
         Layers = 0, 
         Description = "A Blastech DL-18 lies here on the floor.", 
      }, 
      [52] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         ActionDescription = "", 
         Cost = 3600, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         ItemType = "weapon", 
         Vnum = 52, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         Weight = 8, 
         Layers = 0, 
         Description = "A heavy blaster pistol was dropped here.", 
      }, 
      [53] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster blastech dlt-19 assault rifle", 
         ActionDescription = "", 
         Cost = 3750, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         ItemType = "weapon", 
         Vnum = 53, 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         Weight = 12, 
         Layers = 0, 
         Description = "An assault rifle was left here.", 
      }, 
      [54] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blastech t-21 repeating blaster", 
         ActionDescription = "", 
         Cost = 3900, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         ItemType = "weapon", 
         Vnum = 54, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Description = "A repeating blaster is collecting dust.", 
      }, 
      [55] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "bryar pistol blaster", 
         ActionDescription = "", 
         ShortDescr = "a Bryar heavy blaster pistol", 
         ItemType = "weapon", 
         Vnum = 55, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
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
         Cost = 3700, 
         Weight = 8, 
         Layers = 0, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
      }, 
      [56] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster Budgetline 3.0/12 holdout", 
         ActionDescription = "", 
         Cost = 900, 
         ShortDescr = "a Budgetline 3.0/12", 
         ItemType = "weapon", 
         Vnum = 56, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -3, 
            }, 
         }, 
         Weight = 4, 
         Layers = 0, 
         Description = "A cheap holdout blaster is here.", 
      }, 
      [57] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "sorosuub q2 holdout blaster", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         ItemType = "weapon", 
         Vnum = 57, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         Cost = 2800, 
         Weight = 4, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [58] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blastech last resort mini-blaster blaster", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         ItemType = "weapon", 
         Vnum = 58, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 2000, 
         Weight = 3, 
         Description = "A very small blaster was dropped here.", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [59] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 4, 
         Name = "long vibro-blade", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a long sharp vibro-blade", 
         ItemType = "weapon", 
         Vnum = 59, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         Cost = 350, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         Description = "A sharp looking blade is here.", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [60] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "Sorosuub One Blaster Rifle", 
         ActionDescription = "", 
         Cost = 3000, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         ItemType = "weapon", 
         Vnum = 60, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Description = "A blaster rifle was dropped here.", 
      }, 
      [99] = 
      {
         Weight = 1, 
         Name = "final object", 
         ActionDescription = "", 
         ShortDescr = "a newly created final object", 
         ItemType = "trash", 
         Vnum = 99, 
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
         Cost = 0, 
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
      }, 
      [90] = 
      {
         Weight = 1, 
         Name = "Suggestions Board", 
         ActionDescription = "", 
         ShortDescr = "the suggestions board", 
         ItemType = "furniture", 
         Vnum = 90, 
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
         Cost = 0, 
         Layers = 0, 
         Description = "The suggestions board is here.", 
      }, 
      [70] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 8, 
         Name = "quest weapon double bladed lightsaber saber", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         ItemType = "weapon", 
         Vnum = 70, 
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         Cost = 0, 
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
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
      }, 
      [71] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Weight = 10, 
         Name = "quest armor mandalorian battle helmet", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         ItemType = "armor", 
         Vnum = 71, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         Cost = 0, 
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
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
      }, 
      [72] = 
      {
         Weight = 1, 
         Name = "quest item", 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpoload 10313\
put ration item\
", 
            }, 
         }, 
         ShortDescr = "Mystery Box 1", 
         ItemType = "container", 
         Vnum = 72, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Description = "A dud is here.", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [73] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Weight = 3, 
         Name = "quest shield generator", 
         ActionDescription = "", 
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
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         ItemType = "armor", 
         Vnum = 73, 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         Cost = 0, 
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
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [74] = 
      {
         Weight = 1, 
         Name = "quest item dinner", 
         ActionDescription = "", 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         ItemType = "trash", 
         Vnum = 74, 
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
         Cost = 0, 
         Description = "A dud is here.", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [75] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
            }, 
         }, 
         Name = "quest token sapphire", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         ItemType = "treasure", 
         Vnum = 75, 
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
         Weight = 2, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [76] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
            }, 
         }, 
         Name = "quest token diamond", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         ItemType = "treasure", 
         Vnum = 76, 
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
         Weight = 1, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [77] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
            }, 
         }, 
         Name = "quest token emerald", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         ItemType = "treasure", 
         Vnum = 77, 
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
         Weight = 1, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [78] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
            }, 
         }, 
         Name = "quest token amythest", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         ItemType = "treasure", 
         Vnum = 78, 
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
         Weight = 1, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [79] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "get_prog", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
            }, 
         }, 
         Name = "quest token ruby", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         ItemType = "treasure", 
         Vnum = 79, 
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
         Weight = 1, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Command = "M", 
         Arg3 = 2, 
         Arg1 = 1, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg3 = 10, 
         Arg1 = 90, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6, 
         Arg1 = 6, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6, 
         Arg1 = 2, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
      }, 
   }, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [1] = 
      {
         ArmorClass = -30, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 200, 
            DamSizeDice = 10, 
            DamNoDice = 4, 
         }, 
         DamRoll = 0, 
         Vnum = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "test", 
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
            }, 
            [2] = 
            {
               Arguments = "test2", 
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
            }, 
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
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 30550, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Race = "Gand", 
         Height = 0, 
         Name = "Puff", 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         ShortDescr = "Puff", 
         Position = "standing", 
         Credits = 10000, 
         NumberOfAttacks = 0, 
         Alignment = 1000, 
         Sex = "female", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Level = 50, 
         HitRoll = 0, 
      }, 
      [2] = 
      {
         ArmorClass = -300, 
         Weight = 0, 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 2, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 2, 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 31550, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p is dying", 
               MudProgType = "act_prog", 
               Code = "mpforce $n drink\
c heal $n\
", 
            }, 
            [2] = 
            {
               Arguments = "p is starved", 
               MudProgType = "act_prog", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
            }, 
            [3] = 
            {
               Arguments = "p bashes against", 
               MudProgType = "act_prog", 
               Code = "cast heal $n\
cast heal $n\
", 
            }, 
            [4] = 
            {
               Arguments = "p shivers and", 
               MudProgType = "act_prog", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
            }, 
            [5] = 
            {
               Arguments = "p wears", 
               MudProgType = "act_prog", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [6] = 
            {
               Arguments = "p wields", 
               MudProgType = "act_prog", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [7] = 
            {
               Arguments = "p is DEAD!!", 
               MudProgType = "act_prog", 
               Code = "mptrans $n 6\
", 
            }, 
            [8] = 
            {
               Arguments = "25", 
               MudProgType = "rand_prog", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
            }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "Richard Simmons", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         ShortDescr = "Richard Simmons", 
         Position = "standing", 
         Credits = 10000, 
         NumberOfAttacks = 0, 
         Alignment = -1000, 
         Sex = "undistinguished", 
         Race = "Human", 
         Level = 50, 
         HitRoll = 0, 
      }, 
      [3] = 
      {
         ArmorClass = -162, 
         Weight = 0, 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Description = "How clever he looks!\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         DamRoll = 21, 
         Vnum = 3, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [13] = "PolySelf", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "25", 
               MudProgType = "rand_prog", 
               Code = "mpinvis 101\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
               Code = "mpinvis 101\
", 
            }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "supermob", 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         ShortDescr = "the supermob", 
         Position = "standing", 
         Credits = 10000, 
         NumberOfAttacks = 0, 
         Alignment = -1000, 
         Sex = "undistinguished", 
         Race = "Human", 
         Level = 105, 
         HitRoll = 21, 
      }, 
      [4] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A Vendor owned by %s\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 4, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
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
            KeeperShortDescr = "a vendor", 
            KeeperVnum = 4, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
         }, 
         Height = 0, 
         Name = "a vendor", 
         Stats = 
         {
            Dexterity = 25, 
            Luck = 10, 
            Wisdom = 25, 
            Force = 0, 
            Constitution = 25, 
            Charisma = 25, 
            Intelligence = 25, 
            Strength = 25, 
         }, 
         Race = "Human", 
         Level = 103, 
         ShortDescr = "a vendor", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
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
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [5] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 5, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
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
         Height = 0, 
         Name = "undead animated corpse", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 1, 
         ShortDescr = "an animated corpse", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [6] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 6, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
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
         Height = 0, 
         Name = "Rosie O'Donnel", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "Rosie O'Donnel...", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = -1000, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [7] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 7, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p is thirsty", 
               MudProgType = "act_prog", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
            }, 
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
         Height = 0, 
         Name = "Al Gore", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "a newly created Al Gore", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [10] = 
      {
         ArmorClass = -100, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 8, 
         }, 
         DamRoll = 16, 
         Vnum = 10, 
         HitChance = 
         {
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
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
         Height = 0, 
         Name = "mauzumi die wolf", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 80, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "_69", 
         Position = "standing", 
         HitRoll = 16, 
      }, 
      [11] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         LongDescr = "A thick mist plays with your senses.\
", 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 11, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "mist", 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         ShortDescr = "mist", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "_85", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [12] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 12, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "bat", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         ShortDescr = "bat", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Barabel", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [13] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 13, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "hawk", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         ShortDescr = "hawk", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "_78", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [14] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 14, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "black cat", 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         ShortDescr = "black cat", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Gran", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [15] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 15, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "dove", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         ShortDescr = "dove", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 1, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "_78", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [16] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 16, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "fish", 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         ShortDescr = "fish", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 1, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "_81", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [20] = 
      {
         ArmorClass = 75, 
         Weight = 0, 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         DamRoll = 2, 
         Vnum = 20, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_stormtrooper", 
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
         Height = 0, 
         Name = "imperial trooper stormtrooper", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 10, 
         ShortDescr = "a stormtrooper", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 2, 
      }, 
      [21] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 21, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
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
         Height = 0, 
         Name = "imperial guard stormtrooper", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [22] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 22, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
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
         Height = 0, 
         Name = "Rebel Alliance guard", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [23] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 23, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_rebel_trooper", 
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
         Height = 0, 
         Name = "Rebel Alliance Trooper soldier", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 1, 
         ShortDescr = "a rebel alliance trooper", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [24] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 24, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "A mercenary", 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Level = 1, 
         ShortDescr = "a mercenary", 
         Credits = 0, 
         NumberOfAttacks = 1, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [25] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "An alert guard stands at attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 25, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
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
         Height = 0, 
         Name = "bouncer guard thug", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Level = 1, 
         ShortDescr = "a guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [26] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 26, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Name = "Imperial Elite Guard", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "an imperial guard", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [27] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 27, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
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
         Height = 0, 
         Name = "The Empire", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [28] = 
      {
         ArmorClass = 75, 
         Weight = 0, 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 28, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_stormtrooper", 
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
         Height = 0, 
         Name = "an imperial specfor trooper", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 10, 
         ShortDescr = "a stormtrooper", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [29] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 29, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Name = "rebel elite guard", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [30] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 30, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
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
         Height = 0, 
         Name = "The Rebel Alliance", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [31] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 31, 
         SpecFuns = 
         {
            [1] = "spec_rebel_trooper", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Name = "a rebel specfor trooper", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a rebel alliance trooper", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [32] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 32, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Name = "a merc elite guard", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a guard", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Level = 1, 
         HitRoll = 0, 
      }, 
      [40] = 
      {
         ArmorClass = -162, 
         Weight = 0, 
         LongDescr = "The ship upgrades technician is here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         DamRoll = 21, 
         Vnum = 40, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [12] = "Deadly", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "autopilot", 
               MudProgType = "speech_prog", 
               Code = "mpat 5991 autopilot\
", 
            }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Name = "Ship Upgrades Technician", 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Race = "Human", 
         Level = 105, 
         ShortDescr = "the ship upgrades technician", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Position = "standing", 
         HitRoll = 21, 
      }, 
      [33] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "An alert guard stands at attention.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 33, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_clan_guard", 
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
         Height = 0, 
         Name = "bouncer guard thug", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "a guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [50] = 
      {
         ArmorClass = -162, 
         Weight = 0, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         DamRoll = 21, 
         Vnum = 50, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "package.", 
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
            }, 
            [2] = 
            {
               Arguments = "corusca", 
               MudProgType = "speech_prog", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
            }, 
            [3] = 
            {
               Arguments = "give", 
               MudProgType = "speech_prog", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
            }, 
            [4] = 
            {
               Arguments = "shop", 
               MudProgType = "speech_prog", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
            }, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 5000, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Dexterity = 13, 
            Luck = 13, 
            Wisdom = 13, 
            Force = 0, 
            Constitution = 13, 
            Charisma = 13, 
            Intelligence = 13, 
            Strength = 13, 
         }, 
         Race = "Human", 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         Height = 0, 
         Name = "Master Yoda", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
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
         ShortDescr = "Jedi Master Yoda", 
         Position = "standing", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 1000, 
         Sex = "male", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Level = 105, 
         HitRoll = 21, 
      }, 
      [98] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A janitor cleans up the ship here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 98, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_janitor", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "mpat 32179 drop all\
", 
            }, 
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
         Height = 0, 
         Name = "janitor", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "a janitor", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
      [34] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 1, 
         }, 
         DamRoll = 0, 
         Vnum = 34, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
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
         Height = 0, 
         Name = "A mercenary", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         ShortDescr = "a mercenary", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         Position = "standing", 
         HitRoll = 0, 
      }, 
   }, 
   LowEconomy = 42195975, 
   ResetMessage = "&rYour soul burns...", 
   Author = "RoD/Durga", 
   ResetFrequency = 0, 
   Flags = 
   {
      [1] = "_01", 
   }, 
}
