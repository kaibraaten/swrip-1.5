-- Omnipresent Complex
-- Last saved Thursday 28-May-2020 11:07:17

AreaEntry
{
   Name = "Omnipresent Complex", 
   Author = "Kuran", 
   Rooms = 
   {
      [100] = 
      {
         Name = "Omnipresent Being's Monitoring Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 100, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 104, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 102, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 125, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 105, 
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
         Tunnel = 0, 
      }, 
      [101] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Vnum = 101, 
         Flags = 
         {
            [25] = "Refinery", 
            [10] = "Safe", 
            [31] = "Auction", 
            [21] = "EmptyHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 125, 
            }, 
         }, 
         Description = "Just another empty office.\
", 
         Tunnel = 0, 
      }, 
      [102] = 
      {
         Name = "The Omnipresent Being's Mortal Engagement Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 102, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 100, 
            }, 
         }, 
         Description = "You are in the conference room where the Omnipresent Beings engage\
the mortal beings in questioning, and occasionally punishment.  The\
room is bare and there are no apparent exits except the one to the\
west.\
", 
         Tunnel = 0, 
      }, 
      [103] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 103, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 101, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 102, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 110, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [104] = 
      {
         Name = "Omnipresent Builders' Galactic Discourse Center", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 104, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 100, 
            }, 
         }, 
         Description = "From this chamber, all major construction projects which take place in the\
galaxy are carefully planned and executed.  A terminal for the discourse\
of this topic has been carefully mounted in the far wall, and is blinking\
for some reason.  The only exit apparent to you is south.\
", 
         Tunnel = 0, 
      }, 
      [105] = 
      {
         Name = "The Isolation Chamber", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 105, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Description = "The Isolation Chamber is a dreary place.  There is a soft, diffuse light\
and soft grey walls.  It would be almost relaxing if it weren't so mind-\
numbingly boring.  If you have to stay in here much longer, you are sure\
to lose your sanity.\
", 
         Tunnel = 0, 
      }, 
      [106] = 
      {
         Name = "Omnipresent Being's Office Complex", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 106, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Keyword = "door office", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 107, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 119, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 111, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 110, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Direction = "southeast", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 112, 
            }, 
            [7] = 
            {
               Keyword = "glimmer teleport teleporter silphion", 
               Direction = "somewhere", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 108, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
            }, 
         }, 
         Description = "The air here is thick with the sounds of creation.  The Supreme Beings\
do much of their Galactic building in rooms adjoining this one.  In all,\
there are four seperate offices accessable from here, along with the\
Reality Control center, which is directly above this room.  North leads\
back to the hub of the complex.\
", 
         Tunnel = 0, 
      }, 
      [107] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 107, 
         Flags = 
         {
            [25] = "Refinery", 
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Description = "This is a very cozy home, with a nice snug window looking out onto\
Fornax. Above the wall is a nice prized trophy, the stuffed head of\
Czethros.  Below that is a fireplace, which has a fire lit. There are\
several items here, including a chest full of personal belonging and a\
very large bed, that is inviting.  If you had not known this was real you\
would believe it a hologram generated room, perhaps it is.    \
", 
         Tunnel = 0, 
      }, 
      [108] = 
      {
         Name = "The Real Universe", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 108, 
         Flags = 
         {
            [23] = "Hotel", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 110, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
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
         Tunnel = 0, 
      }, 
      [109] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 109, 
         Flags = 
         {
            [31] = "Auction", 
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 121, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = 9599, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 118, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Description = "Just another empty office.\
", 
         Tunnel = 0, 
      }, 
      [110] = 
      {
         Name = "The Omnipresent Mail Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 110, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
            }, 
         }, 
         Description = "Well this room was feeling a little unused so it quit its old job and\
decided to become a mail room instead.\
", 
         Tunnel = 0, 
      }, 
      [111] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 111, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
            }, 
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
         Tunnel = 0, 
      }, 
      [112] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 112, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "northwest", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [113] = 
      {
         Name = "Main Room of Darrik's Quarters", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 113, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 114, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 116, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 115, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 119, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 118, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [114] = 
      {
         Name = "Mail Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 114, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 113, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [115] = 
      {
         Name = "OOC Board room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 115, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 113, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [116] = 
      {
         Name = "Tech Board room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 116, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 113, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 117, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [117] = 
      {
         Name = "Tech Idea Board Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 117, 
         Flags = 
         {
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 116, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [118] = 
      {
         Name = "Living Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 118, 
         Flags = 
         {
            [30] = "Prototype", 
            [9] = "Private", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 122, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 113, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 120, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [119] = 
      {
         Name = "Empty Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 119, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 113, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [120] = 
      {
         Name = "Workshop", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 120, 
         Flags = 
         {
            [9] = "Private", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 118, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [121] = 
      {
         Name = "Transport Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 121, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [122] = 
      {
         Name = "Darrik's Mortal Relation Room", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 122, 
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [19] = "ClanStoreroom", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 118, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
            }, 
         }, 
         Description = "The dark, damp room is filled with various torture devices.  Several \
manacles are attached to the walls, a rack lies against a blank wall, and\
an iron maiden stands near the door. An ewok  lies strapped to a table,\
while a blade whooshes back and forth, getting closer and closer to its\
chest. \
", 
         Tunnel = 0, 
      }, 
      [123] = 
      {
         Name = "Vequir Shipyards", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 123, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 124, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
            }, 
         }, 
         Description = "Vequir Construction Yards, one of the new yards created after the death of\
the Emperor, works mainly for the civilian classes. Large midsize\
freighters and fast starfighters are moved out in large numbers to various\
sites around the galaxy.  On occasion, a ship can be bought before it\
leaves this site. \
", 
         Tunnel = 0, 
      }, 
      [124] = 
      {
         Name = "Vequir Construction Yards", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 124, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 123, 
            }, 
         }, 
         Description = "The construction yards stretch for miles in deep space.  Durasteel\
structures support half-built frames and  innards of the hundreds of\
ships. Construction droids and maintenance workers cover each ship like a\
swarm of insects.\
", 
         Tunnel = 0, 
      }, 
      [125] = 
      {
         Name = "Omnipresent Being's Workshop", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 100, 
            }, 
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
      [150] = 
      {
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 150, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
      }, 
   }, 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 100, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 100, 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Arg1 = 107, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 0, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 32201, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 102, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 114, 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg1 = 119, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 0, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg1 = 109, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 0, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 104, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 118, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 110, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 103, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 106, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 106, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 106, 
      }, 
      [11] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [12] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 0, 
      }, 
      [13] = 
      {
         MiscData = 0, 
         Arg1 = 106, 
         Command = "D", 
         Arg2 = 4, 
         Arg3 = 0, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32280, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32210, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10497, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10494, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10314, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32281, 
      }, 
      [20] = 
      {
         MiscData = 0, 
         Arg1 = 10420, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 10420, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [22] = 
      {
         MiscData = 2, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [23] = 
      {
         MiscData = 3, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [24] = 
      {
         MiscData = 4, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [25] = 
      {
         MiscData = 5, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [26] = 
      {
         MiscData = 6, 
         Arg1 = 25, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [27] = 
      {
         MiscData = 7, 
         Arg1 = 32261, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [28] = 
      {
         MiscData = 8, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [29] = 
      {
         MiscData = 9, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [30] = 
      {
         MiscData = 10, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [31] = 
      {
         MiscData = 11, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [32] = 
      {
         MiscData = 12, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [33] = 
      {
         MiscData = 13, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [34] = 
      {
         MiscData = 14, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [35] = 
      {
         MiscData = 15, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [36] = 
      {
         MiscData = 16, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [37] = 
      {
         MiscData = 17, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [38] = 
      {
         MiscData = 18, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [39] = 
      {
         MiscData = 19, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [40] = 
      {
         MiscData = 20, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [41] = 
      {
         MiscData = 21, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [42] = 
      {
         MiscData = 22, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [43] = 
      {
         MiscData = 23, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [44] = 
      {
         MiscData = 24, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [45] = 
      {
         MiscData = 25, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [46] = 
      {
         MiscData = 26, 
         Arg1 = 10429, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 115, 
      }, 
   }, 
   ResetMessage = "&gCan't sleep, the newbies will eat me.&w", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   HighEconomy = 0, 
   Objects = 
   {
      [104] = 
      {
         Name = "A long couch", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Description = "A comfortable couch was placed here", 
         ItemType = "furniture", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a couch", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 104, 
      }, 
      [106] = 
      {
         Name = "multiplay board", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Description = "Multiplay Board", 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
         ShortDescr = "multiplay board", 
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
         Cost = 0, 
         Vnum = 106, 
      }, 
      [100] = 
      {
         Name = "terminal omnipresent monitor", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Description = "The Monitoring Terminal has been installed here.", 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "the Monitoring Terminal", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 100, 
      }, 
      [101] = 
      {
         Name = "terminal omnipresent coding", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Description = "The Terminal of the Omnipresent Coders is here, leaking source code.", 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "the Coding Terminal", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 101, 
      }, 
      [102] = 
      {
         Name = "terminal quest galactic control blinking", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Description = "The Quest Board is here, and is blinking.", 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
         ShortDescr = "the Terminal for Galactic Control", 
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
         Cost = 0, 
         Vnum = 102, 
      }, 
      [103] = 
      {
         Name = "silphion silphions wormhole teleporter glimmer", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Description = "&zThe teleporter's glimmer offers faint glimpses into the real world.", 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "durgas wormhole", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 103, 
      }, 
   }, 
   Mobiles = 
   {
   }, 
   FileFormatVersion = 1, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 101, 
         High = 103, 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         First = 100, 
         Last = 150, 
      }, 
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
   }, 
   LowEconomy = 30457103, 
   Filename = "omni_complex.lua", 
}
