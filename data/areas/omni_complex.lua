-- Omnipresent Complex
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   Name = "Omnipresent Complex", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Mobiles = 
   {
   }, 
   Rooms = 
   {
      [100] = 
      {
         Vnum = 100, 
         Name = "Omnipresent Being's Monitoring Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 104, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 102, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 106, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 125, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 105, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [101] = 
      {
         Vnum = 101, 
         Name = "&R&BDen's Den.&R&W", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpoload 21016\
drop turkey\
mpecho A turkey steps in, and is suddenly vaporized into a delicious meal.\
", 
               Arguments = "turkey", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "if name($n) == Den\
mpechoat $n You are taken to the Officer's Lounge.\
mptransfer $n 9493\
endif\
", 
               Arguments = "Gerard MacManus", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "if name($n) == Den\
mpechoat $n You are transferred to the Academy.\
mptransfer $n 10300\
endif\
", 
               Arguments = "Newbie Academy", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Code = "mpforce $n sit\
", 
               Arguments = "p arrives from a puff of smoke.", 
            }, 
            [5] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpat 109 mpecho Den says, 'Hey, send me a beep.'\
mpat 122 mpecho Den says, 'Hey, send me a beep.'\
", 
               Arguments = "darrik", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "&b\"Welcome to where time stands still..No one leaves and no one will.\"\
&W\
A rather dark room is before you, and looks like it hasn't been tended to\
ages. It appears that this room has no sense of time, where a calendar\
of 2015 is on the wall, and elsewhere clocks feature differing times.\
\
Your movements seem slower here, almost becoming blurred. A desk of some\
unknown metal substance is here, yet it appears it's not made of\
metal. A futuristic sound system is on the desk as well, with speakers\
almost as large as the room.\
\
One side of this four cornered room is near-almost completely bare except a\
stand that has a custom made four-string Sadowsky bass.\
\
The expensive lighting hits the bass guitar from all directions, giving a\
sense of life to the room. As the lights hit the object, a holy sound emits\
from an unknown location and your mind becomes unstable.\
\
You become entranced in the bass guitar, and then..\
&xEverything fades to black.&w\
&W&w\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 125, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 7, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 19, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [4] = "CanLand", 
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [8] = "Bank", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [5] = "CanFly", 
            [9] = "Private", 
            [26] = "Factory", 
            [30] = "Prototype", 
            [31] = "Auction", 
         }, 
      }, 
      [102] = 
      {
         Vnum = 102, 
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 100, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [103] = 
      {
         Vnum = 103, 
         Name = "Empty Office", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 101, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 102, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 110, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
            [4] = "CanLand", 
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [5] = "CanFly", 
            [26] = "Factory", 
            [31] = "Auction", 
         }, 
      }, 
      [104] = 
      {
         Vnum = 104, 
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 100, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
      }, 
      [105] = 
      {
         Vnum = 105, 
         Name = "The Isolation Chamber", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The Isolation Chamber is a dreary place.  There is a soft, diffuse light\
and soft grey walls.  It would be almost relaxing if it weren't so mind-\
numbingly boring.  If you have to stay in here much longer, you are sure\
to lose your sanity.\
", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [13] = "Arena", 
            [10] = "Safe", 
            [7] = "NoMagic", 
         }, 
      }, 
      [106] = 
      {
         Vnum = 106, 
         Name = "Omnipresent Being's Office Complex", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Keyword = "door office", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 107, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 119, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 111, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 110, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 112, 
            }, 
            [7] = 
            {
               Keyword = "glimmer teleport teleporter silphion", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 108, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [107] = 
      {
         Vnum = 107, 
         Name = "Empty Office", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a very cozy home, with a nice snug window looking out onto\
Fornax. Above the wall is a nice prized trophy, the stuffed head of\
Czethros.  Below that is a fireplace, which has a fire lit. There are\
several items here, including a chest full of personal belonging and a\
very large bed, that is inviting.  If you had not known this was real you\
would believe it a hologram generated room, perhaps it is.    \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 106, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [25] = "Refinery", 
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [108] = 
      {
         Vnum = 108, 
         Name = "The Real Universe", 
         TeleDelay = 0, 
         Tunnel = 0, 
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 110, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
      }, 
      [109] = 
      {
         Vnum = 109, 
         Name = "Empty Office", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The stream of the night\
     rides over the sky\
  The gleam of the moon\
     hits my bloodshot eyes\
  I blink only once\
     and there He stands\
  His eyes shoot out fire,\
     my soul's in His hands.\
  He smiles His evil smile,\
     His eyes brightly glow,\
  He throws me on the ground,\
     His full intent I know.\
  I hear the old beast howl,\
     my whole body turns to cold.\
  He stabs me with the ancient steel\
      And plays that game so old. \
  Death whispers in my ear,\
     I see the gates of Hell.\
  I remember well that forsaken year\
     when I left my soul to sell.\
  I closed my eyes\
     and saw His throne.\
  It was then I knew\
     that I was gone.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 121, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 9599, 
               Direction = "west", 
               DestinationVnum = 118, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [31] = "Auction", 
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [110] = 
      {
         Vnum = 110, 
         Name = "The Omnipresent Mail Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 106, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [111] = 
      {
         Vnum = 111, 
         Name = "Empty Office", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stop short, just inside the room, and look around in astonishment.\
The walls and domed ceiling are covered with flat paintings and\
planics, a few of them vaguely human-looking but most of distinct\
alien origin. Various sculptures are scattered around, some\
freestanding, others on pedestals. In the center of the room is a\
double circle of repeater displays, the outer ring  slightly higher\
than the inner ring. Both sets of displays, at from what little you\
can see, also seems to be devoted to pictures of artwork. And in the\
center of the double circle is a duplicate of an Admirals chair that\
would normaly be found on the ships bridge\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 106, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [112] = 
      {
         Vnum = 112, 
         Name = "Empty Office", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 106, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
      }, 
      [113] = 
      {
         Vnum = 113, 
         Name = "Main Room of Darrik's Quarters", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 114, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 116, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 115, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 119, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 118, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
      }, 
      [114] = 
      {
         Vnum = 114, 
         Name = "Mail Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 113, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
      }, 
      [115] = 
      {
         Vnum = 115, 
         Name = "OOC Board room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 113, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
      }, 
      [116] = 
      {
         Vnum = 116, 
         Name = "Tech Board room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 113, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 117, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
      }, 
      [117] = 
      {
         Vnum = 117, 
         Name = "Tech Idea Board Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 116, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
         }, 
      }, 
      [118] = 
      {
         Vnum = 118, 
         Name = "Living Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 122, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 113, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 120, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
      }, 
      [119] = 
      {
         Vnum = 119, 
         Name = "Empty Office", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 106, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 113, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [120] = 
      {
         Vnum = 120, 
         Name = "Workshop", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 118, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
      }, 
      [121] = 
      {
         Vnum = 121, 
         Name = "Transport Room", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [122] = 
      {
         Vnum = 122, 
         Name = "Darrik's Mortal Relation Room", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "if name($n) == Darrik\
else\
mpechoat $n The blade creaks as it drops a fraction lower.\
mpechoat $n The ewok screaches in fright.\
endif\
", 
               Arguments = "50", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The ewok gurgles as the blade slices through its throat and \
mpecho blood gushes all over the floor. Several droids come out of \
mpecho a panel and clean up the blood, while a large prison droid drags\
mpecho another ewok out and straps him to the table.\
", 
               Arguments = "1", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpat gilito mpoload 22501 \
mpat gilito drop glitterstim \
", 
               Arguments = "goober123goober ", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 118, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [19] = "ClanStoreroom", 
            [3] = "Indoors", 
         }, 
      }, 
      [123] = 
      {
         Vnum = 123, 
         Name = "Vequir Shipyards", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 124, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [124] = 
      {
         Vnum = 124, 
         Name = "Vequir Construction Yards", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 123, 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [125] = 
      {
         Vnum = 125, 
         Name = "Omnipresent Being's Workshop", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 100, 
            }, 
         }, 
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
      }, 
      [150] = 
      {
         Vnum = 150, 
         Name = "Floating in a void", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Sector = "city", 
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
   }, 
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
   LowEconomy = 30467103, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 100, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 100, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg3 = 0, 
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 107, 
         MiscData = 0, 
      }, 
      [3] = 
      {
         Arg3 = 102, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 32201, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg3 = 114, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 38, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Arg3 = 0, 
         Arg2 = 0, 
         Command = "D", 
         Arg1 = 119, 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Arg3 = 0, 
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 109, 
         MiscData = 0, 
      }, 
      [7] = 
      {
         Arg3 = 118, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 104, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg3 = 110, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 38, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg3 = 106, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 103, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg3 = 106, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 106, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "D", 
         Arg1 = 106, 
         MiscData = 0, 
      }, 
      [12] = 
      {
         Arg3 = 0, 
         Arg2 = 2, 
         Command = "D", 
         Arg1 = 106, 
         MiscData = 0, 
      }, 
      [13] = 
      {
         Arg3 = 0, 
         Arg2 = 4, 
         Command = "D", 
         Arg1 = 106, 
         MiscData = 0, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 32280, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 32210, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10497, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10494, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 32281, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         Arg3 = 101, 
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 1, 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Arg3 = 101, 
         Arg2 = 5, 
         Command = "M", 
         Arg1 = 32006, 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10420, 
         MiscData = 0, 
      }, 
      [23] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10420, 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 2, 
      }, 
      [25] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 3, 
      }, 
      [26] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 4, 
      }, 
      [27] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 5, 
      }, 
      [28] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 25, 
         MiscData = 6, 
      }, 
      [29] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 32261, 
         MiscData = 7, 
      }, 
      [30] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 8, 
      }, 
      [31] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 9, 
      }, 
      [32] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 10, 
      }, 
      [33] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 11, 
      }, 
      [34] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 12, 
      }, 
      [35] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 13, 
      }, 
      [36] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 14, 
      }, 
      [37] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 15, 
      }, 
      [38] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 16, 
      }, 
      [39] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 17, 
      }, 
      [40] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 18, 
      }, 
      [41] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 19, 
      }, 
      [42] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 20, 
      }, 
      [43] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 21, 
      }, 
      [44] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 22, 
      }, 
      [45] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 23, 
      }, 
      [46] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 24, 
      }, 
      [47] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 25, 
      }, 
      [48] = 
      {
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "P", 
         Arg1 = 10429, 
         MiscData = 26, 
      }, 
      [49] = 
      {
         Arg3 = 101, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 10315, 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Arg3 = 115, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 90, 
         MiscData = 1, 
      }, 
   }, 
   Objects = 
   {
      [104] = 
      {
         Cost = 0, 
         Vnum = 104, 
         Layers = 0, 
         Name = "A long couch", 
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
         Description = "A comfortable couch was placed here", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         ActionDescription = "", 
      }, 
      [106] = 
      {
         Cost = 0, 
         Vnum = 106, 
         Layers = 0, 
         Name = "multiplay board", 
         ShortDescr = "multiplay board", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Description = "Multiplay Board", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
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
      }, 
      [100] = 
      {
         Cost = 0, 
         Vnum = 100, 
         Layers = 0, 
         Name = "terminal omnipresent monitor", 
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
         Description = "The Monitoring Terminal has been installed here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         ActionDescription = "", 
      }, 
      [101] = 
      {
         Cost = 0, 
         Vnum = 101, 
         Layers = 0, 
         Name = "terminal omnipresent coding", 
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
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         ActionDescription = "", 
      }, 
      [102] = 
      {
         Cost = 0, 
         Vnum = 102, 
         Layers = 0, 
         Name = "terminal quest galactic control blinking", 
         ShortDescr = "the Terminal for Galactic Control", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Description = "The Quest Board is here, and is blinking.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
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
      }, 
      [103] = 
      {
         Cost = 0, 
         Vnum = 103, 
         Layers = 0, 
         Name = "silphion silphions wormhole teleporter glimmer", 
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
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         ActionDescription = "", 
      }, 
   }, 
   Filename = "omni_complex.lua", 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   Author = "Kuran", 
   HighEconomy = 0, 
}
