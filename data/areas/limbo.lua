-- Limbo
-- Last saved Thursday 02-Jul-2020 10:01:28

AreaEntry
{
   ResetMessage = "&rYour soul burns...", 
   Rooms = 
   {
      [1] = 
      {
         Sector = "city", 
         Name = "&CCorrans Insane Apartment&g", 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 1, 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 100, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 107, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test", 
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
               MudProgType = "speech_prog", 
               Arguments = "test2", 
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
               MudProgType = "speech_prog", 
               Arguments = "die", 
               Code = "mpdamage $n 234234\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [2] = 
      {
         Sector = "inside", 
         Name = "Limbo", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 2, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 32145, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
      }, 
      [3] = 
      {
         Sector = "inside", 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 3, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
      }, 
      [4] = 
      {
         Sector = "inside", 
         Name = "Storage", 
         Description = "This room is reserved for future use.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 4, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
      }, 
      [5] = 
      {
         Sector = "city", 
         Name = "Floating in a void", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 5, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
      }, 
      [6] = 
      {
         Sector = "city", 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 6, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
      }, 
      [7] = 
      {
         Sector = "city", 
         Name = "Mobprog Purge Room", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 7, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "purge", 
               Code = "mppurge\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [8] = 
      {
         Sector = "city", 
         Name = "Immhood ClanStoreRoom", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 8, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
      }, 
      [10] = 
      {
         Sector = "inside", 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 10, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 100, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "100", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [11] = 
      {
         Sector = "city", 
         Name = "Floating in a void", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 11, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
      }, 
      [12] = 
      {
         Sector = "city", 
         Name = "Floating in a void", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 12, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
      }, 
      [19] = 
      {
         Sector = "city", 
         Name = "Incognito Platform", 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 19, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
      }, 
      [20] = 
      {
         Sector = "city", 
         Name = "Floating in a void", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 20, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
      }, 
      [29] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 29, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 32, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [30] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 30, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 40, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [31] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 31, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 34, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [32] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [33] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 33, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 34, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 32, 
               Description = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [34] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 34, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [35] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 35, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 32, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [36] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 36, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 38, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [37] = 
      {
         Sector = "city", 
         Name = "The Arena", 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 37, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 34, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [38] = 
      {
         Sector = "inside", 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 38, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "up", 
               DestinationVnum = 39, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [39] = 
      {
         Sector = "inside", 
         Name = "Southern Sniper Tower", 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 39, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "north", 
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "down", 
               DestinationVnum = 38, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "northeast", 
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "northwest", 
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [40] = 
      {
         Sector = "inside", 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 40, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "up", 
               DestinationVnum = 41, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [41] = 
      {
         Sector = "inside", 
         Name = "Northern Sniper Tower", 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 41, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "south", 
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "down", 
               DestinationVnum = 40, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "southeast", 
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "southwest", 
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
      }, 
      [42] = 
      {
         Sector = "city", 
         Name = "First Combatant's Chamber", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 42, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
      }, 
      [43] = 
      {
         Sector = "city", 
         Name = "Second Combatant's Chamber", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 43, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
      }, 
      [44] = 
      {
         Sector = "city", 
         Name = "Lost in Space", 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 44, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
      }, 
      [45] = 
      {
         Sector = "city", 
         Name = "Limbo Shipyard", 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 45, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 1, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 10, 
         Arg1 = 90, 
         Command = "O", 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 6, 
         Command = "M", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 2, 
         Command = "M", 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         Command = "M", 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         Command = "O", 
      }, 
   }, 
   Name = "Limbo", 
   LowEconomy = 42095975, 
   FileFormatVersion = 1, 
   VnumRanges = 
   {
      Object = 
      {
         Last = 99, 
         First = 1, 
      }, 
      Mob = 
      {
         Last = 99, 
         First = 1, 
      }, 
      Room = 
      {
         Last = 99, 
         First = 1, 
      }, 
   }, 
   Author = "RoD/Durga", 
   Filename = "limbo.lua", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Mobiles = 
   {
      [1] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 10000, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 30550, 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Level = 50, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "Puff", 
         Alignment = 1000, 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Languages = 
         {
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
         }, 
         Race = "Gand", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Sex = "female", 
         ArmorClass = -30, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 200, 
            DamNoDice = 4, 
            DamSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 1, 
         Position = "standing", 
         Name = "Puff", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test2", 
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
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test", 
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
         }, 
         Description = "", 
      }, 
      [2] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 10000, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 31550, 
         }, 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "Richard Simmons", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Alignment = -1000, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = -300, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 2, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 2, 
         Position = "standing", 
         Name = "Richard Simmons", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wears", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wields", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
               Code = "mptrans $n 6\
", 
            }, 
            [5] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
               Code = "mpforce $n drink\
c heal $n\
", 
            }, 
            [7] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is starved", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
            }, 
            [8] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
               Code = "cast heal $n\
cast heal $n\
", 
            }, 
         }, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
      }, 
      [3] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 10000, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 1050, 
         }, 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Level = 105, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the supermob", 
         DamRoll = 21, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Alignment = -1000, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = -162, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 21, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [13] = "PolySelf", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         Vnum = 3, 
         Position = "standing", 
         Name = "supermob", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "mpinvis 101\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "mpinvis 101\
", 
            }, 
         }, 
         Description = "How clever he looks!\
", 
      }, 
      [4] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 103, 
         ShortDescr = "a vendor", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a vendor", 
         }, 
         Languages = 
         {
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
         }, 
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
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "A Vendor owned by %s\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Vnum = 4, 
         Position = "standing", 
         Name = "a vendor", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [5] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "an animated corpse", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 5, 
         Position = "standing", 
         Name = "undead animated corpse", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [6] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = -1000, 
         Level = 1, 
         ShortDescr = "Rosie O'Donnel...", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Vnum = 6, 
         Position = "standing", 
         Name = "Rosie O'Donnel", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [7] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a newly created Al Gore", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Description = "", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 7, 
         Position = "standing", 
         Name = "Al Gore", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is thirsty", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [10] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 16, 
            HitPlus = 800, 
         }, 
         Alignment = 0, 
         Level = 80, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         DamRoll = 16, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "_69", 
         Languages = 
         {
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
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = -100, 
         Weight = 0, 
         NumberOfAttacks = 2, 
         DefaultPosition = "standing", 
         HitRoll = 16, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
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
         Vnum = 10, 
         Position = "standing", 
         Name = "mauzumi die wolf", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 8, 
            DamSizeDice = 4, 
         }, 
      }, 
      [11] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A thick mist plays with your senses.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         ShortDescr = "mist", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "_85", 
         Languages = 
         {
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
         }, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 2, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 11, 
         Position = "standing", 
         Name = "mist", 
         Alignment = 0, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
      }, 
      [12] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         ShortDescr = "bat", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Barabel", 
         Languages = 
         {
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
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 2, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 12, 
         Position = "standing", 
         Name = "bat", 
         Alignment = 0, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
      }, 
      [13] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         ShortDescr = "hawk", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "_78", 
         Languages = 
         {
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
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 2, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 13, 
         Position = "standing", 
         Name = "hawk", 
         Alignment = 0, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
      }, 
      [14] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "black cat", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Gran", 
         Languages = 
         {
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
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 2, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 14, 
         Position = "standing", 
         Name = "black cat", 
         Alignment = 0, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
      }, 
      [15] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         ShortDescr = "dove", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "_78", 
         Languages = 
         {
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
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 1, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 15, 
         Position = "standing", 
         Name = "dove", 
         Alignment = 0, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
      }, 
      [16] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         ShortDescr = "fish", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "_81", 
         Languages = 
         {
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
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 1, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 16, 
         Position = "standing", 
         Name = "fish", 
         Alignment = 0, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
      }, 
      [20] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 2, 
            HitPlus = 100, 
         }, 
         Alignment = 0, 
         Level = 10, 
         ShortDescr = "a stormtrooper", 
         DamRoll = 2, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 75, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         Vnum = 20, 
         Position = "standing", 
         Name = "imperial trooper stormtrooper", 
         Description = "", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 21, 
         Position = "standing", 
         Name = "imperial guard stormtrooper", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [22] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 22, 
         Position = "standing", 
         Name = "Rebel Alliance guard", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [23] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Vnum = 23, 
         Position = "standing", 
         Name = "Rebel Alliance Trooper soldier", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [24] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a mercenary", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 1, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Vnum = 24, 
         Position = "standing", 
         Name = "A mercenary", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [25] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An alert guard stands at attention.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 25, 
         Position = "standing", 
         Name = "bouncer guard thug", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [26] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 3, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 26, 
         Position = "standing", 
         Name = "Imperial Elite Guard", 
         Alignment = 0, 
         Description = "", 
      }, 
      [27] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 27, 
         Position = "standing", 
         Name = "The Empire", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [28] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 2, 
            HitPlus = 100, 
         }, 
         Alignment = 0, 
         Level = 10, 
         ShortDescr = "a stormtrooper", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 75, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Vnum = 28, 
         Position = "standing", 
         Name = "an imperial specfor trooper", 
         Description = "", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
      }, 
      [29] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 3, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 29, 
         Position = "standing", 
         Name = "rebel elite guard", 
         Alignment = 0, 
         Description = "", 
      }, 
      [30] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 30, 
         Position = "standing", 
         Name = "The Rebel Alliance", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [31] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 3, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Vnum = 31, 
         Position = "standing", 
         Name = "a rebel specfor trooper", 
         Alignment = 0, 
         Description = "", 
      }, 
      [32] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Level = 1, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 3, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 32, 
         Position = "standing", 
         Name = "a merc elite guard", 
         Alignment = 0, 
         Description = "", 
      }, 
      [40] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 1050, 
         }, 
         Alignment = 0, 
         Level = 105, 
         ShortDescr = "the ship upgrades technician", 
         DamRoll = 21, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Description = "", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Sex = "undistinguished", 
         ArmorClass = -162, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 21, 
         LongDescr = "The ship upgrades technician is here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [12] = "Deadly", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         Vnum = 40, 
         Position = "standing", 
         Name = "Ship Upgrades Technician", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
               Code = "mpat 5991 autopilot\
", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [33] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An alert guard stands at attention.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 33, 
         Position = "standing", 
         Name = "bouncer guard thug", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
      [50] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 5000, 
         }, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Level = 105, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "Jedi Master Yoda", 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         DamRoll = 21, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Alignment = 1000, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [11] = "_11", 
            [13] = "_13", 
            [19] = "disarm", 
            [8] = "_08", 
         }, 
         Sex = "male", 
         ArmorClass = -162, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 21, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
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
         Vnum = 50, 
         Position = "standing", 
         Name = "Master Yoda", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "shop", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "package.", 
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
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "give", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
            }, 
         }, 
         Description = "", 
      }, 
      [98] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a janitor", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         Description = "", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "A janitor cleans up the ship here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 98, 
         Position = "standing", 
         Name = "janitor", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpat 32179 drop all\
", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [34] = 
      {
         Stats = 
         {
            Constitution = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Wisdom = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Alignment = 0, 
         Level = 1, 
         ShortDescr = "a mercenary", 
         DamRoll = 0, 
         Height = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         Vnum = 34, 
         Position = "standing", 
         Name = "A mercenary", 
         Description = "", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
      }, 
   }, 
   Objects = 
   {
      [2] = 
      {
         Name = "credit credits", 
         Layers = 0, 
         Description = "One miserable credit.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a credit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 2, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         ItemType = "money", 
      }, 
      [3] = 
      {
         Name = "credits credit", 
         Layers = 0, 
         Description = "Some credits.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "%d credits", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 3, 
         Weight = 1, 
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
         ItemType = "money", 
      }, 
      [4] = 
      {
         Name = "deed", 
         Layers = 0, 
         Description = "A deed for a shop", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "A deed", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 4, 
         Weight = 1, 
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
         ItemType = "paper", 
      }, 
      [5] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 4, 
               Location = 48, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 2, 
            }, 
            [3] = 
            {
               Modifier = 11, 
               Location = 48, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "an amulet", 
         Layers = 0, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Cost = 100000, 
         Weight = 1, 
         ShortDescr = "a metal amulet", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
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
         ActionDescription = "", 
         ItemType = "armor", 
      }, 
      [6] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "charm", 
         Layers = 0, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Cost = 0, 
         Weight = 1, 
         ShortDescr = "A small charm", 
         Flags = 
         {
            [23] = "_23", 
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         Vnum = 6, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         ItemType = "armor", 
      }, 
      [7] = 
      {
         Name = "Tipper Gore", 
         Layers = 0, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "Tipper Gore!", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 7, 
         Weight = 1, 
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
         ItemType = "fountain", 
      }, 
      [9] = 
      {
         Name = "corpse remains pieces parts", 
         Layers = 0, 
         Description = "The shattered remains of %s are here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the broken parts of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 9, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "droid_corpse", 
      }, 
      [10] = 
      {
         Name = "corpse", 
         Layers = 0, 
         Description = "The corpse of %s lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the corpse of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10, 
         Weight = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "corpse", 
      }, 
      [11] = 
      {
         Name = "corpse", 
         Layers = 0, 
         Description = "The corpse of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the corpse of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 11, 
         Weight = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "corpse_pc", 
      }, 
      [12] = 
      {
         Name = "head", 
         Layers = 0, 
         Description = "The severed head of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the head of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 12, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         ItemType = "food", 
      }, 
      [13] = 
      {
         Name = "heart", 
         Layers = 0, 
         Description = "The torn-out heart of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the heart of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 13, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         ActionDescription = "%s savagely devour$q $p!", 
         ItemType = "food", 
      }, 
      [14] = 
      {
         Name = "arm", 
         Layers = 0, 
         Description = "The sliced-off arm of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the arm of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 14, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ActionDescription = "%s chomp$q on $p.", 
         ItemType = "food", 
      }, 
      [15] = 
      {
         Name = "leg", 
         Layers = 0, 
         Description = "The sliced-off leg of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the leg of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 15, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ActionDescription = "%s chomp$q on $p.", 
         ItemType = "food", 
      }, 
      [16] = 
      {
         Name = "guts", 
         Layers = 0, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the spilled guts of %s", 
         Cost = 0, 
         Vnum = 16, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [17] = 
      {
         Name = "blood", 
         Layers = 0, 
         Description = "A pool of spilled blood lies here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the spilled blood", 
         Cost = 0, 
         Vnum = 17, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ItemType = "_blood", 
      }, 
      [18] = 
      {
         Name = "bloodstain", 
         Layers = 0, 
         Description = "Blood stains the ground.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the bloodstain", 
         Cost = 0, 
         Vnum = 18, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ItemType = "_bloodstain", 
      }, 
      [19] = 
      {
         Name = "scraps", 
         Layers = 0, 
         Description = "The scraps of %s lie here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the scraps of %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 19, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ItemType = "scraps", 
      }, 
      [20] = 
      {
         Name = "fruit roll-up", 
         Layers = 0, 
         Description = "A fruit roll-up lies here", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ShortDescr = "a fruit roll-up", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 20, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "%s enjoy$q $p.", 
         ItemType = "food", 
      }, 
      [21] = 
      {
         Name = "ball light", 
         Layers = 0, 
         Description = "A bright ball of light shimmers in the air.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a bright ball of light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "light", 
      }, 
      [22] = 
      {
         Name = "spring", 
         Layers = 0, 
         Description = "A magical spring flows here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ShortDescr = "a magical spring", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 22, 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ActionDescription = "", 
         ItemType = "fountain", 
      }, 
      [23] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         Name = "the skin of %s", 
         Layers = 0, 
         Description = "The skin of %s", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "the skin of %s", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 23, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ItemType = "fabric", 
      }, 
      [24] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "meat fresh slice", 
         Layers = 0, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Cost = 0, 
         Weight = 2, 
         ShortDescr = "a slice of raw meat from %s", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Vnum = 24, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ActionDescription = "", 
         ItemType = "food", 
      }, 
      [25] = 
      {
         Name = "shopping bag", 
         Layers = 0, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20, 
         ShortDescr = "a bag", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 25, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         ActionDescription = "", 
         ItemType = "container", 
      }, 
      [26] = 
      {
         Name = "fighter module", 
         Layers = 0, 
         Description = "What looks like a part of a ship lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "A ship part for %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 26, 
         Weight = 100, 
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
         ItemType = "fightercomp", 
      }, 
      [27] = 
      {
         Name = "midsize midship module", 
         Layers = 0, 
         Description = "What looks like a decent size part for a ship lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "A midsize ship part for %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 27, 
         Weight = 150, 
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
         ItemType = "midcomp", 
      }, 
      [28] = 
      {
         Name = "capship capital module", 
         Layers = 0, 
         Description = "What looks like a huge ship part lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "A capital-class ship part for %s", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 28, 
         Weight = 350, 
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
         ItemType = "capitalcomp", 
      }, 
      [30] = 
      {
         Name = "fire", 
         Layers = 0, 
         Description = "A magical fire burns brightly.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ShortDescr = "a magical fire", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 30, 
         Weight = 10, 
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
         ItemType = "fire", 
      }, 
      [31] = 
      {
         Name = "trap", 
         Layers = 0, 
         Description = "You detect a trap.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a trap", 
         Cost = 10, 
         Vnum = 31, 
         Weight = 100, 
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
         ItemType = "trap", 
      }, 
      [32] = 
      {
         Name = "portal", 
         Layers = 0, 
         Description = "A misty portal beckons you to the unknown.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ShortDescr = "a portal", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 32, 
         Weight = 100, 
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
         ItemType = "_portal", 
      }, 
      [33] = 
      {
         Name = "black poison powder", 
         Layers = 0, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 48000, 
         ShortDescr = "black poisoning powder", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 33, 
         Weight = 1, 
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
         ItemType = "trash", 
      }, 
      [34] = 
      {
         Name = "scroll scribing blank", 
         Layers = 0, 
         Description = "A blank scroll lays here gathering dust.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
         ShortDescr = "a blank scroll", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 34, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "scroll", 
      }, 
      [35] = 
      {
         Name = "flask empty", 
         Layers = 0, 
         Description = "An empty flask lays here gathering dust.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15000, 
         ShortDescr = "an empty flask", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 35, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         ItemType = "potion", 
      }, 
      [36] = 
      {
         Name = "parchment paper note data disk message info", 
         Layers = 0, 
         Description = "A message disk has been discarded here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1500, 
         ShortDescr = "a message disk", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 36, 
         Weight = 1, 
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
         ItemType = "paper", 
      }, 
      [37] = 
      {
         Name = "quill pen datapad recorder message disk", 
         Layers = 0, 
         Description = "A datapad used for recording message disks is here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
         ShortDescr = "a datapad", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 37, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ActionDescription = "", 
         ItemType = "pen", 
      }, 
      [38] = 
      {
         Name = "mail terminal", 
         Layers = 0, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a mail terminal", 
         Cost = 0, 
         Vnum = 38, 
         Weight = 1, 
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
         ItemType = "furniture", 
      }, 
      [43] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         Name = "holy symbol faith", 
         Layers = 0, 
         Description = "A holy symbol lies here, shining.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a symbol of faith", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 43, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ItemType = "armor", 
      }, 
      [45] = 
      {
         Name = "grenade", 
         Layers = 0, 
         Description = "A grenade .... run!!!!", 
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
         ShortDescr = "a grenade", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 45, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ActionDescription = "", 
         ItemType = "grenade", 
      }, 
      [46] = 
      {
         Name = "landmine mine", 
         Layers = 0, 
         Description = "Don't step on the landmine.", 
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
         ShortDescr = "a landmine", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 46, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ActionDescription = "", 
         ItemType = "landmine", 
      }, 
      [50] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Name = "blaster Blastech E11 rifle E-11", 
         Layers = 0, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
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
         Cost = 3250, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 50, 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [51] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Name = "blaster blastech dl-18 blaster pistol", 
         Layers = 0, 
         Description = "A Blastech DL-18 lies here on the floor.", 
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
         Cost = 3000, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 51, 
         Weight = 6, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [52] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         Layers = 0, 
         Description = "A heavy blaster pistol was dropped here.", 
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
         Cost = 3600, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 52, 
         Weight = 8, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [53] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Name = "blaster blastech dlt-19 assault rifle", 
         Layers = 0, 
         Description = "An assault rifle was left here.", 
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
         Cost = 3750, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 53, 
         Weight = 12, 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [54] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Name = "blastech t-21 repeating blaster", 
         Layers = 0, 
         Description = "A repeating blaster is collecting dust.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [2] = 
            {
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [3] = 
            {
               Description = "A long, thick barreled blaster.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [5] = 
            {
               Description = "A long barreled blaster\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [6] = 
            {
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [7] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [8] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
         }, 
         Cost = 3900, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 54, 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [55] = 
      {
         Name = "bryar pistol blaster", 
         Layers = 0, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
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
         ShortDescr = "a Bryar heavy blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 55, 
         Weight = 8, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [56] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         Name = "blaster Budgetline 3.0/12 holdout", 
         Layers = 0, 
         Description = "A cheap holdout blaster is here.", 
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
         Cost = 900, 
         ShortDescr = "a Budgetline 3.0/12", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 56, 
         Weight = 4, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [57] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "sorosuub q2 holdout blaster", 
         Layers = 0, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Cost = 2800, 
         Weight = 4, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 57, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [58] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "blastech last resort mini-blaster blaster", 
         Layers = 0, 
         Description = "A very small blaster was dropped here.", 
         Cost = 2000, 
         Weight = 3, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 58, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [59] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "long vibro-blade", 
         Layers = 0, 
         Description = "A sharp looking blade is here.", 
         Cost = 350, 
         Weight = 4, 
         ShortDescr = "a long sharp vibro-blade", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 59, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [60] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Name = "Sorosuub One Blaster Rifle", 
         Layers = 0, 
         Description = "A blaster rifle was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 3000, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 60, 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [99] = 
      {
         Name = "final object", 
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created final object", 
         Cost = 0, 
         Vnum = 99, 
         Weight = 1, 
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
         ItemType = "trash", 
      }, 
      [90] = 
      {
         Name = "Suggestions Board", 
         Layers = 0, 
         Description = "The suggestions board is here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the suggestions board", 
         Cost = 0, 
         Vnum = 90, 
         Weight = 1, 
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
         ItemType = "furniture", 
      }, 
      [70] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 5, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 5, 
               Location = 19, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest weapon double bladed lightsaber saber", 
         Layers = 0, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         Cost = 0, 
         Weight = 8, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Vnum = 70, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [71] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 8, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 16777216, 
               Location = 26, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
         Name = "quest armor mandalorian battle helmet", 
         Layers = 0, 
         Description = "An evil looking battle helmet.", 
         Cost = 0, 
         Weight = 10, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         Vnum = 71, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ActionDescription = "", 
         ItemType = "armor", 
      }, 
      [72] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpoload 10313\
put ration item\
", 
            }, 
         }, 
         Name = "quest item", 
         Layers = 0, 
         Description = "A dud is here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "Mystery Box 1", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 72, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         ItemType = "container", 
      }, 
      [73] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 8192, 
               Location = 28, 
            }, 
            [2] = 
            {
               Modifier = 67108864, 
               Location = 26, 
            }, 
         }, 
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
         Name = "quest shield generator", 
         Layers = 0, 
         Description = "A small energy device lies on the floor.", 
         Cost = 0, 
         Weight = 3, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 73, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         ActionDescription = "", 
         ItemType = "armor", 
      }, 
      [74] = 
      {
         Name = "quest item dinner", 
         Layers = 0, 
         Description = "A dud is here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 74, 
         Weight = 1, 
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
         ItemType = "trash", 
      }, 
      [75] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token sapphire", 
         Layers = 0, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Cost = 0, 
         Weight = 2, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 75, 
         WearFlags = 
         {
            [0] = "Take", 
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
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [76] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token diamond", 
         Layers = 0, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Cost = 0, 
         Weight = 1, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 76, 
         WearFlags = 
         {
            [0] = "Take", 
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
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [77] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token emerald", 
         Layers = 0, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Cost = 0, 
         Weight = 1, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 77, 
         WearFlags = 
         {
            [0] = "Take", 
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
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [78] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token amythest", 
         Layers = 0, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Cost = 0, 
         Weight = 1, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 78, 
         WearFlags = 
         {
            [0] = "Take", 
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
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [79] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token ruby", 
         Layers = 0, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Cost = 0, 
         Weight = 1, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 79, 
         WearFlags = 
         {
            [0] = "Take", 
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
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   ResetFrequency = 0, 
   HighEconomy = 0, 
}
