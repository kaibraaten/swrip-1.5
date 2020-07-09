-- Star Destroyer - Dark Hand
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   Rooms = 
   {
      [640] = 
      {
         TeleDelay = 0, 
         Vnum = 640, 
         Name = "The Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 637, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 639, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The drill hall is an enormous hall taking up a large portion of this deck.\
It is devided into several sections. A blaster range is used for target\
practice at the north east corner of the room. The south east section is\
taken up by an obsticle course containing climbing walls. The west section\
contains several types of artificial terrain used for combat simulation.\
The center of the room however is empty and used for the standard drills\
that take up many hours of the day.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [641] = 
      {
         TeleDelay = 0, 
         Vnum = 641, 
         Name = "The Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 638, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 637, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The drill hall is an enormous hall taking up a large portion of this deck.\
It is devided into several sections. A blaster range is used for target\
practice at the north east corner of the room. The south east section is\
taken up by an obsticle course containing climbing walls. The west section\
contains several types of artificial terrain used for combat simulation.\
The center of the room however is empty and used for the standard drills\
that take up many hours of the day.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [642] = 
      {
         TeleDelay = 0, 
         Vnum = 642, 
         Name = "Barracks Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 643, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 646, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 617, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [643] = 
      {
         TeleDelay = 0, 
         Vnum = 643, 
         Name = "The Mess Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 644, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 645, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 642, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "Neat rows of clean organized tables fill the room. Each table is\
rectangular in shape and seats exactly one dozen troopers. The room is\
filled with the talking but it is not over loud. There is a strong sense\
of disciplin even here. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [644] = 
      {
         TeleDelay = 0, 
         Vnum = 644, 
         Name = "The Mess Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 643, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "Neat rows of clean organized tables fill the room. Each table is\
rectangular in shape and seats exactly one dozen troopers. The room is\
filled with the talking but it is not over loud. There is a strong sense\
of disciplin even here.   Say \"food\" for a ration.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
mpecho &YA ration pops out.\
give ration $n\
drop ration\
", 
               MudProgType = "speech_prog", 
               Arguments = "food", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [645] = 
      {
         TeleDelay = 0, 
         Vnum = 645, 
         Name = "Barracks Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 643, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "The barracks kitchen is a huge assembly line. There are many enormous ovens\
and stoves and several long prep tables. A row of large sinks spans the\
length of the longest wall. Troopers take shifts at kitchen duty. Extra\
hours are rarely given for infractions as they happen so very seldom.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [646] = 
      {
         TeleDelay = 0, 
         Vnum = 646, 
         Name = "Barrack Bunkroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 642, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 647, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
      }, 
      [647] = 
      {
         TeleDelay = 0, 
         Vnum = 647, 
         Name = "Barrack Bunkroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 646, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
      }, 
      [648] = 
      {
         TeleDelay = 0, 
         Vnum = 648, 
         Name = "Barracks Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 617, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 649, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 651, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [649] = 
      {
         TeleDelay = 0, 
         Vnum = 649, 
         Name = "Barrack Bunkroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 648, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 650, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
      }, 
      [650] = 
      {
         TeleDelay = 0, 
         Vnum = 650, 
         Name = "Barrack Bunkroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 649, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
      }, 
      [651] = 
      {
         TeleDelay = 0, 
         Vnum = 651, 
         Name = "Barracks Lounge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 652, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 648, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 653, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The barracks lounge contains several off duty amusements for the troops.\
The is a large holovid at one end of the room. Several games tables are\
scattered about as well as an area for just sitting and chatting. There\
are a few skill testing games at one end of the rom as well. these\
generally involve throwing something at a small target or ricocheting\
small objects over a playing surface.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [652] = 
      {
         TeleDelay = 0, 
         Vnum = 652, 
         Name = "Barracks Lounge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 651, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "he barracks lounge contains several off duty amusements for the troops. The\
is a large holovid at one end of the room. Several games tables are\
scattered about as well as an area for just sitting and chatting. There\
are a few skill testing games at one end of the rom as well. these\
generally involve throwing something at a small target or ricocheting\
small objects over a playing surface.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [653] = 
      {
         TeleDelay = 0, 
         Vnum = 653, 
         Name = "Barracks Lounge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 651, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "he barracks lounge contains several off duty amusements for the troops. The\
is a large holovid at one end of the room. Several games tables are\
scattered about as well as an area for just sitting and chatting. There\
are a few skill testing games at one end of the rom as well. these\
generally involve throwing something at a small target or ricocheting\
small objects over a playing surface.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [654] = 
      {
         TeleDelay = 0, 
         Vnum = 654, 
         Name = "Hallway To Turrets", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 656, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 615, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 655, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [655] = 
      {
         TeleDelay = 0, 
         Vnum = 655, 
         Name = "Hallway To Turrets", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 654, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 697, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [656] = 
      {
         TeleDelay = 0, 
         Vnum = 656, 
         Name = "Hallway To Turrets", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 698, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 654, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [657] = 
      {
         TeleDelay = 0, 
         Vnum = 657, 
         Name = "Emergency", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 658, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 620, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "This room is filled with several stretchers and a couple dozen chairs. The\
back of the room is section off by several curtains. A door to the north\
has a sign on it saying \"Medical staff only\"\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [658] = 
      {
         TeleDelay = 0, 
         Vnum = 658, 
         Name = "Operating Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 657, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "A cool to cold room, the operating arena is dominated by a large center\
table.  Around it stand droids and equipment ready to aid the doctors in\
surgery. A set of flood lights hangs suspended over the table, and provide\
brilliant light for the procedures.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [659] = 
      {
         TeleDelay = 0, 
         Vnum = 659, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 660, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 620, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 658, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [660] = 
      {
         TeleDelay = 0, 
         Vnum = 660, 
         Name = "Operating Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "A cool to cold room, the operating arena is dominated by a large center\
table.  Around it stand droids and equipment ready to aid the doctors in\
surgery. A set of flood lights hangs suspended over the table, and provide\
brilliant light for the procedures.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [661] = 
      {
         TeleDelay = 0, 
         Vnum = 661, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 662, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 663, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [662] = 
      {
         TeleDelay = 0, 
         Vnum = 662, 
         Name = "A Recovery Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The recovery rooms are semi-pleasant.  There are several beds per room,\
each separated by thick curtains.  Each bed has some simple medical\
equipment beside it.  The room smells of disinfectant.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [663] = 
      {
         TeleDelay = 0, 
         Vnum = 663, 
         Name = "A Recovery Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The recovery rooms are semi-pleasant.  There are several beds per room,\
each separated by thick curtains.  Each bed has some simple medical\
equipment beside it.  The room smells of disinfectant.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [664] = 
      {
         TeleDelay = 0, 
         Vnum = 664, 
         Name = "Intensive Care", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 665, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 666, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 667, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The intensive care unit is for people who need constant monitoring and\
care.  There are several beds here, surrounded by medical equipment and\
bacta tanks.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [665] = 
      {
         TeleDelay = 0, 
         Vnum = 665, 
         Name = "A Bacta Tank", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose and\
mask is available for you to breath through.   There is nothing to do here\
but rest and heal.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [666] = 
      {
         TeleDelay = 0, 
         Vnum = 666, 
         Name = "A Bacta Tank", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose and\
mask is available for you to breath through.   There is nothing to do here\
but rest and heal.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [667] = 
      {
         TeleDelay = 0, 
         Vnum = 667, 
         Name = "A Bacta Tank", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose and\
mask is available for you to breath through.   There is nothing to do here\
but rest and heal.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [668] = 
      {
         TeleDelay = 0, 
         Vnum = 668, 
         Name = "A Dining Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 618, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The dining area somewhat tasteful. There are several large tables\
throughout the room. Each is covered in a fine table cloth and set in a\
manner generally considered proper amongst most human worlds and\
especially on all imperial controlled worlds. Just say \"food\" to get a\
ration. \
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
mpecho &YA ration pops out.\
give ration $n\
drop ration\
", 
               MudProgType = "speech_prog", 
               Arguments = "food", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [669] = 
      {
         TeleDelay = 0, 
         Vnum = 669, 
         Name = "Officers Lounge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 618, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "This is a comfortable room with several couches. There are several game and\
card tables about the room. The games played at them are mostly strategy\
games designed to force competition between opponents at a high\
intellectual level.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [670] = 
      {
         TeleDelay = 0, 
         Vnum = 670, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 671, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 670, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 618, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 670, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [671] = 
      {
         TeleDelay = 0, 
         Vnum = 671, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 672, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 671, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 670, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 671, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [672] = 
      {
         TeleDelay = 0, 
         Vnum = 672, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 672, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 671, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 672, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [673] = 
      {
         TeleDelay = 0, 
         Vnum = 673, 
         Name = "Navigators Station", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 675, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 621, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southwest", 
            }, 
         }, 
         Description = "The navigator station contains a large computer with several monitors used\
in comparing charts and maps and making complex calculations. Most of this\
is done by the computer and monitored by the navigator. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [674] = 
      {
         TeleDelay = 0, 
         Vnum = 674, 
         Name = "Gunners Seat", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 677, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 621, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southeast", 
            }, 
         }, 
         Description = "The gunners station contains controls for monitoring and manipulating the\
ships main lasers as well as the ships missile launchers torpedos and\
bombs. There are several turrets located around the ship however that are\
controlled from inside the turret and not from here. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [675] = 
      {
         TeleDelay = 0, 
         Vnum = 675, 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 673, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 676, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The pilots job is heavily assisted by computer on larger ships thus the\
controls at this station resemble a large computer panel rather than being\
centered around a flight stick like in starfighters. There are dozens of\
minitors around the station giving smaller versions of the large wall\
mounted ones as well as dozens of others monitering different aspects of\
the ships flight.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [676] = 
      {
         TeleDelay = 0, 
         Vnum = 676, 
         Name = "The Bridge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 675, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Description = "", 
               Keyword = "Chairn", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 677, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This part of the bridge contains a panel for controling several non\
critical ship systems. It is located right beneath the main view window\
thus it is nearly impossible to see whats going on outside the ship from\
here. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [677] = 
      {
         TeleDelay = 0, 
         Vnum = 677, 
         Name = "Co Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 676, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 674, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The co pilot station contains controls for the ships defence systems. The\
most important controls being those for monitering and controlling the\
ships shields. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [678] = 
      {
         TeleDelay = 0, 
         Vnum = 678, 
         Name = "The Royal Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 679, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 619, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This large wide hallway is dimly lit. The floor is polished black like the\
rest of the ship but the walls are quite different containing many\
carvings. The carvings seem to have been painstakingly carved out of the\
wall. The are all strange designs that look very beautiful yet at the same\
time very frightening. Staring at them sends shivers down your spine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [679] = 
      {
         TeleDelay = 0, 
         Vnum = 679, 
         Name = "Audience Chamber", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 680, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 678, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The audience chamber is a large long room. At the north end of the room a\
wide staircase leads up to a large throne that rests high above the rest\
of the room. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [680] = 
      {
         TeleDelay = 0, 
         Vnum = 680, 
         Name = "The Royal Office", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 679, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This small room is a safe quiet place that the current emporer uses to get\
work done that requires some concentration. It is also a good place to\
rest and contemplate. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [9] = "Private", 
            [10] = "Safe", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
         }, 
      }, 
      [681] = 
      {
         TeleDelay = 0, 
         Vnum = 681, 
         Name = "A Mirrored Hallway", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 679, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 683, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Distance = 0, 
               DestinationVnum = 682, 
               Key = -1, 
               Description = "", 
               Keyword = "guard post", 
               Direction = "somewhere", 
            }, 
         }, 
         Description = "The mirrors in this hallway reflect against each other giving an illusion\
of a thousand hallways stacked in a row. The glass is crystal clear and\
gives an excellent reflectyion yet somehow the image seems wrong. Distored\
and twisted yet not quite visible to the naked eye. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [682] = 
      {
         TeleDelay = 0, 
         Vnum = 682, 
         Name = "Guard Post", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This alcove is designed to give a good view of the hallway yet because of\
the mirrors make it difficult to locate. This gives the guard stationed\
here a good advantage in stopping anyone who has entered the area\
unauthorized, even though this is very unlikely to happen. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [683] = 
      {
         TeleDelay = 0, 
         Vnum = 683, 
         Name = "A Closet", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "The closet is very large. There are many shelves stacked along the edges as\
well many hangars for clothes. Maybe if you looked carefully you'd find\
something useful. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [684] = 
      {
         TeleDelay = 0, 
         Vnum = 684, 
         Name = "The Living Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 685, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 686, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 687, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This room is very well decorated compared to the rest of the ship. The\
walls and floor are black but all of the furniture is made of colored\
crystal. There are many pieces of beautiful artwork placed about the room.\
It is quite a contrast to what you have seen outside the royal chambers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [685] = 
      {
         TeleDelay = 0, 
         Vnum = 685, 
         Name = "The Dining Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The dining room is nicely decorated in a style similar to the living room.\
The large wooden table in the center of the room is trimmed with crystal\
designs as are the chairs. A large crystal chendelier hangs over the\
table. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [686] = 
      {
         TeleDelay = 0, 
         Vnum = 686, 
         Name = "The Den", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 688, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This room is a small comfortable room. It is decrated in soft leathers and\
the artwork is simpler than that in the living area. It still however has\
a dark feeling to it. Thus although it looks comfortable you can't help\
feeling somewhat on edge. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [687] = 
      {
         TeleDelay = 0, 
         Vnum = 687, 
         Name = "The Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 688, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The bedroom is a beautiful and frightening place. An enormous bed is the\
centerpiece of the room.  On the walls are terrifying pictures of that\
suggest pain and sex in very abstract yet obvious ways. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
      }, 
      [688] = 
      {
         TeleDelay = 0, 
         Vnum = 688, 
         Name = "The Bathroom", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 687, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 686, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "This huge bathroom is beatiful. Everything in it shines. Everything is\
either a shiny polished black or a crystal clear glass. Light gleams of\
every surface reflecting all about the room. The bathtub is large and has\
many small water jets around its inside wall. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [689] = 
      {
         TeleDelay = 0, 
         Vnum = 689, 
         Name = "Before The War Room", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 690, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 691, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 672, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 692, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This area of the Dark Hand is where officers meet and hold council. Every\
important thing the empire does is discussed in rooms like the one to the\
north of here. This area is strictly off limits to unauthorized persons.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [690] = 
      {
         TeleDelay = 0, 
         Vnum = 690, 
         Name = "The War room", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This room is very simple in design. A large round table takes up most of\
the room. Around it are several chairs. The walls are sound proofed and\
electronic devices jam any attempts to record or electronicly snoop the\
discussions that take place here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [691] = 
      {
         TeleDelay = 0, 
         Vnum = 691, 
         Name = "Computer Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The computer room is a small room with several terminals and a few extra\
chairs. The decore is simple and military yet considerably nicer than the\
rest of the ship. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [692] = 
      {
         TeleDelay = 0, 
         Vnum = 692, 
         Name = "Mail Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The mail room is a small room with several terminals and a few extra\
chairs. The decore is simple and military yet considerably nicer than the\
rest of the ship.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [693] = 
      {
         TeleDelay = 0, 
         Vnum = 693, 
         Name = "Droid Maintenance Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 614, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "As far as droid maintenance rooms go this one is very organized. The stacks\
of parts and equipment found in most technical areas do not exist. Instead\
anything not in use seems to be put away in one of hundreds of wall\
mounted drawers. Only very large machines are left out along with rows of\
droids either recharging or in a state of repair. Even these however are\
lined up in an organized maner giving a strong sense of order to the\
place.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [694] = 
      {
         TeleDelay = 0, 
         Vnum = 694, 
         Name = "A Drop Chute", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 695, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [24] = "NoFloor", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
         }, 
      }, 
      [695] = 
      {
         TeleDelay = 0, 
         Vnum = 695, 
         Name = "Trash Compactor", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 614, 
               Key = 621, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "You can think of about 10 million other places youd rather be right now.\
The coom is filled with garbage and foul smeliing water. The door seems to\
be locked. To top it all off the walls are slowly closing in around you.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You are slowly crushed as the walls close in around you.\
feel harm $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [696] = 
      {
         TeleDelay = 0, 
         Vnum = 696, 
         Name = "Storage Closet", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 614, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This room is very long. It consists of several rows of shelves stacked to\
the ceiling. Each shelf is filled with labelled boxes, crates or loose\
parts. Maybe searching through this room could produce something usefull.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [697] = 
      {
         TeleDelay = 0, 
         Vnum = 697, 
         Name = "Laser Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 655, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "This swivelling laser turret is located in a good position to cover most of\
the ships belly and side. The seat is gyroscopicly suspended and attached\
to the cannon so that they all swivel as a single unit enabling excellent\
target tracking. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [698] = 
      {
         TeleDelay = 0, 
         Vnum = 698, 
         Name = "Laser Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 656, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This swivelling laser turret is located in a good position to cover most of\
the ships belly and side. The seat is gyroscopicly suspended and attached\
to the cannon so that they all swivel as a single unit enabling excellent\
target tracking. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [699] = 
      {
         TeleDelay = 0, 
         Vnum = 699, 
         Name = "The Captains Chair", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 676, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 673, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 621, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 674, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This chair is raised somewhat above the rest of the bridge. This not only\
gives the captain a good view of the rest of the bridge but makes the\
captain look more powerful. It is standard imperial practice that lower\
ranks should always have to look up at their superiors. There are very few\
controls located here as the captains job is mostly to issue orders to the\
rest of the crew.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [600] = 
      {
         TeleDelay = 0, 
         Vnum = 600, 
         Name = "Main Hangar of the Star Destroyer Dark Hand", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 601, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "The main hangar is an enormous room, with areas sectioned off for all types\
of ships.  In the middle of the hangar, the floor is mechanically designed\
to separate and open, allowing large ships to enter and leave. There are\
also smaller launch tunnels that can be used by smaller ships.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [601] = 
      {
         TeleDelay = 0, 
         Vnum = 601, 
         Name = "Balcony Overlooking The Main Hangar", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 602, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 600, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "The main hangar is an enormous room, with areas sectioned off for all types\
of ships.  In the middle of the hangar, the floor is mechanically designed\
to separate and open, allowing large ships to enter and leave. There are\
also smaller launch tunnels that can be used by smaller ships.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [602] = 
      {
         TeleDelay = 0, 
         Vnum = 602, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 601, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 603, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [603] = 
      {
         TeleDelay = 0, 
         Vnum = 603, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 602, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 604, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [604] = 
      {
         TeleDelay = 0, 
         Vnum = 604, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 603, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 609, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 607, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [605] = 
      {
         TeleDelay = 0, 
         Vnum = 605, 
         Name = "Balcony Overlooking a Transport Hangar", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 608, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 606, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "The transport hangar is similar to the main hangar except that the ships\
exit through shield walls along the outermost wall of the hangar. Another\
main difference is that the ships are all of two types: assault transports\
designed to carry and deploy troopers and large vehicle transports used to\
carry ground assault vehicles. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [606] = 
      {
         TeleDelay = 0, 
         Vnum = 606, 
         Name = "Transport Hangar", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 605, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "The transport hangar is similar to the main hangar except that the ships\
exit through shield walls along the outermost wall of the hangar. Another\
main difference is that the ships are all of two types: assault transports\
designed to carry and deploy troopers and large vehicle transports used to\
carry ground assault vehicles.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [607] = 
      {
         TeleDelay = 0, 
         Vnum = 607, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 604, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 608, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [608] = 
      {
         TeleDelay = 0, 
         Vnum = 608, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 607, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 605, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [609] = 
      {
         TeleDelay = 0, 
         Vnum = 609, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 610, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 604, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [610] = 
      {
         TeleDelay = 0, 
         Vnum = 610, 
         Name = "A Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 611, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 609, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [611] = 
      {
         TeleDelay = 0, 
         Vnum = 611, 
         Name = "Balcony Overlooking A TIE Fighter Hangar", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 610, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 612, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "The TIE fighter hangar is arranged differently from the standard hangar.\
The TIE fighters are arranged in rows, suspended from thick metal arms. \
When they are ready to launch, they are lowered through airlocks below\
them and released.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [612] = 
      {
         TeleDelay = 0, 
         Vnum = 612, 
         Name = "TIE Fighter Hangar", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 611, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "The TIE fighter hangar is arranged differently from the standard hangar.\
The TIE fighters are arranged in rows, suspended from thick metal arms. \
When they are ready to launch, they are lowered through airlocks below\
them and released.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [613] = 
      {
         TeleDelay = 0, 
         Vnum = 613, 
         Name = "A Turbolift", 
         Exits = 
         {
         }, 
         Description = "This turbolift is located near the rear of the ship, enabling it to reach\
all levels of the destroyer.  It is voice activated.   There is a small\
'list' of available levels on the wall.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The turbolift quickly moves to the hangar level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 604\
mpat 604 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "hangar 1", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n The turbolift door closes behind you.\
mpechoaround $n The doors open and close briefly letting $n in.\
mpecho An electonic voice says. \"What level please.\"\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
            [3] = 
            {
               Code = "mpecho The turbolift quickly moves to the engineering level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 615\
mpat 615 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "engineering 2", 
            }, 
            [4] = 
            {
               Code = "mpecho The turbolift quickly moves to the service level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 614\
mpat 614 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "service 3 ", 
            }, 
            [5] = 
            {
               Code = "mpecho The turbolift quickly moves to the detention level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 616\
mpat 616 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "detention 4 ", 
            }, 
            [6] = 
            {
               Code = "mpecho The turbolift quickly moves to the barracks level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 617\
mpat 617 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "barracks 5 ", 
            }, 
            [7] = 
            {
               Code = "mpecho The turbolift quickly moves to the medical level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 620\
mpat 620 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "medical 6 ", 
            }, 
            [8] = 
            {
               Code = "mpecho The turbolift quickly moves to the officer level.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 618\
mpat 618 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "officer 7 ", 
            }, 
            [9] = 
            {
               Code = "mpecho The turbolift quickly moves to the royal chambers.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 619\
mpat 619 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "royal 8 ", 
            }, 
            [10] = 
            {
               Code = "mpecho The turbolift quickly moves to the bridge.\
mpechoat $n The doors open and you step out.\
mpechoaround $n The doors open and $n step out before they reclose.\
mptransfer $n 621\
mpat 621 mpechoaround $n $n arrives from a turbolift.\
", 
               MudProgType = "speech_prog", 
               Arguments = "bridge 9 ", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "list levels level note sign list. lists", 
               Description = "Levels:\
\13 \
\0131. Hangar\
\0132. Engineering\
\0133. Service\
\0134. Detention\
\0135. Barracks\
\0136. Medical\
\0137. Officers\
\0138. Royal\
\0139. Bridge\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [614] = 
      {
         TeleDelay = 0, 
         Vnum = 614, 
         Name = "Service Level", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 696, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 693, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 695, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The service level appears similar to all other levels of the ship. The\
floor is the same polished black and the walls are the same blue-grey that\
adorns the rest of the ship. The most recognisable difference is the\
nature of the sounds. The sounds of droids far outweighs the sound of\
humans on this part of the ship. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [615] = 
      {
         TeleDelay = 0, 
         Vnum = 615, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 654, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 622, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 628, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [616] = 
      {
         TeleDelay = 0, 
         Vnum = 616, 
         Name = "Detention Level", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 630, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 632, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 634, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This room contains a control desk for monitoring the detention block. \
There are many automated defense guns positioned about the room, as well\
as several cameras monitoring activities.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [617] = 
      {
         TeleDelay = 0, 
         Vnum = 617, 
         Name = "Barracks Level", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 642, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 648, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The barracks area of imperial installations is an interesting mix of\
youthful energy and strict order. This is a strange combination of sweat\
and polish. The sounds of seargents shouting orders to the north mixes\
with the loud chatter of off duty trops to the west.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [618] = 
      {
         TeleDelay = 0, 
         Vnum = 618, 
         Name = "Officers Foyer", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 670, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 668, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 669, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The officers section of the darkhand contains the same uninspiring\
architecture as the rest of the ship. However the atmosphere is slightly\
lighter by the addition of a few personal touches added by the officers\
such as a small sculpture on a pedistal near the northern corridor.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [619] = 
      {
         TeleDelay = 0, 
         Vnum = 619, 
         Name = "The Royal Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 678, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This large wide hallway is dimly lit. The floor is polished black like the\
rest of the ship but the walls are quite different containing many\
carvings. The carvings seem to have been painstakingly carved out of the\
wall. The are all strange designs that look very beautiful yet at the same\
time very frightening. Staring at them sends shivers down your spine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [620] = 
      {
         TeleDelay = 0, 
         Vnum = 620, 
         Name = "Medical Level", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 657, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The medical level smells of strongly of antiseptic. A sign on the wall\
saying \"emergency\" points to the west.  There are a few chairs along the\
wall to sit and wait in if the emergency room is full.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [621] = 
      {
         TeleDelay = 0, 
         Vnum = 621, 
         Name = "The Bridge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 673, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northeast", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 674, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northwest", 
            }, 
         }, 
         Description = "The bridge of the star destroyer is a large room with several work stations\
around the perimeter and a raised command section in the center. It is\
wider than it is long and a large transparisteel view window covers the\
front wall. Several other large monitors give views from ship mounted\
cameras giving a complete view of whats outside the ship.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [622] = 
      {
         TeleDelay = 0, 
         Vnum = 622, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 623, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 615, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [623] = 
      {
         TeleDelay = 0, 
         Vnum = 623, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 622, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 624, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [624] = 
      {
         TeleDelay = 0, 
         Vnum = 624, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 623, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 625, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [625] = 
      {
         TeleDelay = 0, 
         Vnum = 625, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 624, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 629, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 626, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [626] = 
      {
         TeleDelay = 0, 
         Vnum = 626, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 627, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 625, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [627] = 
      {
         TeleDelay = 0, 
         Vnum = 627, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 628, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 626, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [628] = 
      {
         TeleDelay = 0, 
         Vnum = 628, 
         Name = "Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 615, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 627, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [629] = 
      {
         TeleDelay = 0, 
         Vnum = 629, 
         Name = "Main Reactor Control", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 625, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "The main reactor control is a large computer console containing the\
controls for the ships main reactor as well as for monitoring the\
functions of the rest of engineering. This would be an ideal location to\
cordinate the ships engineering efforts and you will often fiend the chief\
of engineering posted here. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [630] = 
      {
         TeleDelay = 0, 
         Vnum = 630, 
         Name = "Detention Level Corridor", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 631, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 630, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 616, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 630, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The detention levels corridors form a hexagonal shape.  The ceiling is\
relatively low and there is little room for manuevering.  Locked cell\
doors are spaced evenly down the hall in each direction\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [631] = 
      {
         TeleDelay = 0, 
         Vnum = 631, 
         Name = "Detention Level Corridor", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 631, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 630, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 631, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The detention levels corridors form a hexagonal shape.  The ceiling is\
relatively low and there is little room for manuevering.  Locked cell\
doors are spaced evenly down the hall in each direction\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [632] = 
      {
         TeleDelay = 0, 
         Vnum = 632, 
         Name = "Detention Level Corridor", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 632, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 633, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 632, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 616, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridors walls and floors make a hexagonal shape. The ceiling is\
relatively low and there is very little room for manuevering around.\
Locked cell doors are spaced evenly out down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [633] = 
      {
         TeleDelay = 0, 
         Vnum = 633, 
         Name = "Detention Level Corridor", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 633, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 633, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 632, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This corridors walls and floors make a hexagonal shape. The ceiling is\
relatively low and there is very little room for manuevering around.\
Locked cell doors are spaced evenly out down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [634] = 
      {
         TeleDelay = 0, 
         Vnum = 634, 
         Name = "Detention Level Corridor", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 634, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 616, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 634, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 635, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The detention levels corridors form a hexagonal shape.  The ceiling is\
relatively low and there is little room for manuevering.  Locked cell\
doors are spaced evenly down the hall in each direction\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [635] = 
      {
         TeleDelay = 0, 
         Vnum = 635, 
         Name = "Detention Level Corridor", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 635, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 634, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 635, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This corridors walls and floors make a hexagonal shape. The ceiling is\
relatively low and there is very little room for manuevering around.\
Locked cell doors are spaced evenly out down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [636] = 
      {
         TeleDelay = 0, 
         Vnum = 636, 
         Name = "The Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 637, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 638, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 617, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 639, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The drill hall is an enormous hall taking up a large portion of this deck.\
It is devided into several sections. A blaster range is used for target\
practice at the north east corner of the room. The south east section is\
taken up by an obsticle course containing climbing walls. The west section\
contains several types of artificial terrain used for combat simulation.\
The center of the room however is empty and used for the standard drills\
that take up many hours of the day.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [637] = 
      {
         TeleDelay = 0, 
         Vnum = 637, 
         Name = "The Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 641, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 640, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The drill hall is an enormous hall taking up a large portion of this deck.\
It is devided into several sections. A blaster range is used for target\
practice at the north east corner of the room. The south east section is\
taken up by an obsticle course containing climbing walls. The west section\
contains several types of artificial terrain used for combat simulation.\
The center of the room however is empty and used for the standard drills\
that take up many hours of the day.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [638] = 
      {
         TeleDelay = 0, 
         Vnum = 638, 
         Name = "The Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 641, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The drill hall is an enormous hall taking up a large portion of this deck.\
It is devided into several sections. A blaster range is used for target\
practice at the north east corner of the room. The south east section is\
taken up by an obsticle course containing climbing walls. The west section\
contains several types of artificial terrain used for combat simulation.\
The center of the room however is empty and used for the standard drills\
that take up many hours of the day.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [639] = 
      {
         TeleDelay = 0, 
         Vnum = 639, 
         Name = "The Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 640, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The drill hall is an enormous hall taking up a large portion of this deck.\
It is devided into several sections. A blaster range is used for target\
practice at the north east corner of the room. The south east section is\
taken up by an obsticle course containing climbing walls. The west section\
contains several types of artificial terrain used for combat simulation.\
The center of the room however is empty and used for the standard drills\
that take up many hours of the day.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
   }, 
   Author = "Durga", 
   ResetFrequency = 5, 
   Name = "Star Destroyer - Dark Hand", 
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
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 601, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 4, 
         Arg3 = 606, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 32254, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 10488, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [4] = 
      {
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [5] = 
      {
         Arg1 = 32250, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [6] = 
      {
         Arg1 = 609, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [7] = 
      {
         Arg1 = 607, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [8] = 
      {
         Arg1 = 606, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
      }, 
      [9] = 
      {
         Arg1 = 606, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
      }, 
      [10] = 
      {
         Arg1 = 605, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
      }, 
      [11] = 
      {
         Arg1 = 604, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
      }, 
      [12] = 
      {
         Arg1 = 603, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
      }, 
      [13] = 
      {
         Arg1 = 601, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [14] = 
      {
         Arg1 = 600, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 606, 
      }, 
      [15] = 
      {
         Arg1 = 610, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 612, 
      }, 
      [16] = 
      {
         Arg1 = 602, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 10, 
         Arg3 = 601, 
      }, 
      [17] = 
      {
         Arg1 = 32240, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [18] = 
      {
         Arg1 = 32239, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [19] = 
      {
         Arg1 = 32250, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [20] = 
      {
         Arg1 = 32248, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [21] = 
      {
         Arg1 = 32247, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [22] = 
      {
         Arg1 = 32246, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [23] = 
      {
         Arg1 = 32245, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
      }, 
      [24] = 
      {
         Arg1 = 32244, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
      }, 
      [25] = 
      {
         Arg1 = 32243, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
      }, 
      [26] = 
      {
         Arg1 = 32242, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
      }, 
      [27] = 
      {
         Arg1 = 32241, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [28] = 
      {
         Arg1 = 50, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 32254, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg1 = 10488, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [31] = 
      {
         Arg1 = 604, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 5, 
         Arg3 = 612, 
      }, 
      [32] = 
      {
         Arg1 = 633, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [33] = 
      {
         Arg1 = 633, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [34] = 
      {
         Arg1 = 632, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [35] = 
      {
         Arg1 = 632, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [36] = 
      {
         Arg1 = 634, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [37] = 
      {
         Arg1 = 634, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [38] = 
      {
         Arg1 = 635, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [39] = 
      {
         Arg1 = 635, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [40] = 
      {
         Arg1 = 630, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [41] = 
      {
         Arg1 = 630, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [42] = 
      {
         Arg1 = 631, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [43] = 
      {
         Arg1 = 631, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [44] = 
      {
         Arg1 = 611, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 613, 
      }, 
      [45] = 
      {
         Arg1 = 672, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [46] = 
      {
         Arg1 = 672, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [47] = 
      {
         Arg1 = 671, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [48] = 
      {
         Arg1 = 671, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [49] = 
      {
         Arg1 = 670, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [50] = 
      {
         Arg1 = 670, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [51] = 
      {
         Arg1 = 38, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 692, 
      }, 
      [52] = 
      {
         Arg1 = 32201, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 691, 
      }, 
      [53] = 
      {
         Arg1 = 614, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
      }, 
      [54] = 
      {
         Arg1 = 621, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 695, 
      }, 
      [55] = 
      {
         Arg1 = 695, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [56] = 
      {
         Arg1 = 612, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 645, 
      }, 
      [57] = 
      {
         Arg1 = 607, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 693, 
      }, 
      [58] = 
      {
         Arg1 = 608, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 693, 
      }, 
      [59] = 
      {
         Arg1 = 606, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 696, 
      }, 
      [60] = 
      {
         Arg1 = 622, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 696, 
      }, 
      [61] = 
      {
         Arg1 = 680, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
      }, 
      [62] = 
      {
         Arg1 = 683, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
      }, 
      [63] = 
      {
         Arg1 = 613, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 686, 
      }, 
      [64] = 
      {
         Arg1 = 686, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
      }, 
      [65] = 
      {
         Arg1 = 686, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
      }, 
      [66] = 
      {
         Arg1 = 688, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
      }, 
      [67] = 
      {
         Arg1 = 688, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [68] = 
      {
         Arg1 = 687, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [69] = 
      {
         Arg1 = 687, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
      }, 
      [70] = 
      {
         Arg1 = 684, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [71] = 
      {
         Arg1 = 684, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
      }, 
      [72] = 
      {
         Arg1 = 684, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
      }, 
      [73] = 
      {
         Arg1 = 681, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [74] = 
      {
         Arg1 = 681, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
      }, 
      [75] = 
      {
         Arg1 = 681, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
      }, 
      [76] = 
      {
         Arg1 = 609, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 619, 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Arg1 = 624, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [78] = 
      {
         Arg1 = 610, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 679, 
      }, 
      [79] = 
      {
         Arg1 = 679, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [80] = 
      {
         Arg1 = 679, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
      }, 
      [81] = 
      {
         Arg1 = 611, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 682, 
      }, 
      [82] = 
      {
         Arg1 = 612, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 621, 
      }, 
      [83] = 
      {
         Arg1 = 612, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 621, 
      }, 
      [84] = 
      {
         Arg1 = 613, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 699, 
      }, 
      [85] = 
      {
         Arg1 = 615, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 677, 
      }, 
      [86] = 
      {
         Arg1 = 616, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 674, 
      }, 
      [87] = 
      {
         Arg1 = 617, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 673, 
      }, 
      [88] = 
      {
         Arg1 = 614, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 675, 
      }, 
      [89] = 
      {
         Arg1 = 618, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 689, 
      }, 
      [90] = 
      {
         Arg1 = 32200, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [91] = 
      {
         Arg1 = 32206, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [92] = 
      {
         Arg1 = 32205, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [93] = 
      {
         Arg1 = 32204, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [94] = 
      {
         Arg1 = 32203, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [95] = 
      {
         Arg1 = 32202, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [96] = 
      {
         Arg1 = 618, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 689, 
      }, 
      [97] = 
      {
         Arg1 = 32200, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [98] = 
      {
         Arg1 = 32206, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [99] = 
      {
         Arg1 = 32205, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [100] = 
      {
         Arg1 = 32204, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [101] = 
      {
         Arg1 = 32203, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [102] = 
      {
         Arg1 = 32202, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [103] = 
      {
         Arg1 = 689, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
      }, 
      [104] = 
      {
         Arg1 = 619, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 690, 
      }, 
      [105] = 
      {
         Arg1 = 620, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 690, 
      }, 
      [106] = 
      {
         Arg1 = 690, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
      }, 
      [107] = 
      {
         Arg1 = 9001, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 644, 
      }, 
   }, 
   Filename = "darkhand.lua", 
   Objects = 
   {
      [608] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Vnum = 608, 
         Weight = 3, 
         Name = "assault stormtrooper groin plate s608", 
         Cost = 0, 
         Description = "A stormtrooper groin plate was left here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "an assault stormtrooper groin plate", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 56, 
      }, 
      [609] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Vnum = 609, 
         Weight = 6, 
         Name = "stormtrooper leg plates s609", 
         Cost = 0, 
         Description = "Some stormtrooper leg armor was left here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "assault stormtrooper leg plates", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 56, 
      }, 
      [610] = 
      {
         Vnum = 610, 
         Weight = 1, 
         Name = "tie fighter", 
         Cost = 0, 
         Description = "An Imperial Tie Fighter is docked here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "spacecraft", 
         ShortDescr = "a tie fighter", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [611] = 
      {
         Vnum = 611, 
         Weight = 1, 
         Name = "listtttt", 
         Cost = 0, 
         Description = "A list is on the wall here.", 
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
         ShortDescr = "a list", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [612] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 612, 
         Weight = 20, 
         Name = "portable oven", 
         Cost = 1000, 
         Description = "A portable oven is plugged into a wall socket.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "oven", 
         ShortDescr = "a portable oven", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [613] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 613, 
         Weight = 1, 
         Name = "ancient book sith teachings book123sith", 
         Cost = 0, 
         Description = "An ancient book holds many dark secrets.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "book", 
         ShortDescr = "an ancient book", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [620] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 620, 
         Weight = 3, 
         Name = "assault stormtrooper boots", 
         Cost = 0, 
         Description = "Some white boots are here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "assault stormtrooper boots", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [621] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 621, 
         Weight = 1, 
         Name = "trash comapctor key", 
         Cost = 0, 
         Description = "Thank the force the trash compactor key is here.", 
         Flags = 
         {
            [25] = "Hidden", 
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
         ItemType = "key", 
         ShortDescr = "trash comapctor key", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [622] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 622, 
         Weight = 1, 
         Name = "duraplast", 
         Cost = 100, 
         Description = "A piece of duraplast tubing is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "duraplast", 
         ShortDescr = "duraplast tubing", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [623] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 623, 
         Weight = 1, 
         Name = "a sculpture", 
         Cost = 10000, 
         Description = "A small sculture depicts a strange batlike creature devouring a humaniod form.", 
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
         ShortDescr = "a sculpture", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [624] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 624, 
         Weight = 12, 
         Name = "royal guards force pike", 
         Cost = 1500, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         Description = "A royal guards force pike was left here.", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 8, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         ShortDescr = "a royal guards force pike", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [699] = 
      {
         Vnum = 699, 
         Weight = 1, 
         Name = "Dark hand key", 
         Cost = 0, 
         Description = "Dark hand key", 
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
         ShortDescr = "Dark hand key", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [698] = 
      {
         Vnum = 698, 
         Weight = 1, 
         Name = "the Dark hand key", 
         Cost = 0, 
         Description = "Some god dropped a newly created the Dark hand key here.", 
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
         ShortDescr = "a newly created the Dark hand key", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [697] = 
      {
         Vnum = 697, 
         Weight = 1, 
         Name = "the silver urchin key", 
         Cost = 0, 
         Description = "Some god dropped a newly created the silver urchin key here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "government", 
         ShortDescr = "a newly created the silver urchin key", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [696] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 696, 
         Weight = 1, 
         Name = "Battle Plans", 
         Cost = 0, 
         Description = "Imperial battle plans were left here.", 
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
         ShortDescr = "the battle plans", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [666] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Vnum = 666, 
         Weight = 1, 
         Name = "tattoo ", 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         Description = "A Clan Tattoo", 
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
         ItemType = "trash", 
         ShortDescr = "A Clan Tattoo", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "tattoo ", 
               Description = "Your Clan's Tattoo makes you feel strong and proud you joined them.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "tattoo ", 
               Description = "A beautiful piece of artwork makes you feel strong and proud to have your\
\13Clan's Tattoo on your hands. \
\13", 
            }, 
         }, 
         Layers = 0, 
      }, 
      [695] = 
      {
         Vnum = 695, 
         Weight = 1, 
         Name = "The Imperial Star Destroyer Darkhand", 
         Cost = 0, 
         Description = "A lift leading to The Imperial Star Destroyer Darkhand is here.", 
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
         ItemType = "spacecraft", 
         ShortDescr = "The Imperial Star Destroyer Darkhand", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [600] = 
      {
         Vnum = 600, 
         Weight = 1, 
         Name = "an assault transport", 
         Cost = 0, 
         Description = "An assault transport is docked here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "spacecraft", 
         ShortDescr = "an assault transport", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [601] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 601, 
         Weight = 5, 
         Name = "assault stormtrooper helmet as601", 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -10, 
               Location = 36, 
            }, 
            [2] = 
            {
               Modifier = -10, 
               Location = 39, 
            }, 
         }, 
         Description = "A stormtrooper helmet was dropped here.", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) != The Empire\
mpechoat $n What do you think you are a stormtrooper?\
mpechoat $n Go join the empire if you want to wear that!\
mpechoaround $n $n thinks $ss a stormtrooper.\
mpforce $n remove as601 \
endif\
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "an assault stormtrooper helmet", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [602] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 602, 
         Weight = 5, 
         Name = "stormtrooper helmet s602", 
         Cost = 0, 
         Description = "A stormtrooper helmet was dropped here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "a stormtrooper helmet", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [603] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Vnum = 603, 
         Weight = 3, 
         Name = "Assault stormtrooper gloves s603", 
         Cost = 0, 
         Description = "Stormtrooper gloves were dropped here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "assault stormtrooper gloves", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [604] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Vnum = 604, 
         Weight = 3, 
         Name = "Assault stormtrooper arm plates s604", 
         Cost = 0, 
         Description = "Some stormtrooper arm plates were left here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "assault stormtrooper arm plates", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [605] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Vnum = 605, 
         Weight = 3, 
         Name = "Assault stormtrooper shoulder plates s605", 
         Cost = 0, 
         Description = "Stormtrooper shoulder plates were discarded here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "assault stormtrooper shoulder plates", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [606] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 606, 
         Weight = 3, 
         Name = "Assault stormtrooper hand plates s606", 
         Cost = 0, 
         Description = "Stormtrooper hand plates were discarded here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "assault stormtrooper hand plates", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [607] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 607, 
         Weight = 7, 
         Name = "assault stormtrooper chest plate s607", 
         Cost = 0, 
         Description = "A white stormtrooper chest plate was left here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         ShortDescr = "an assault stormtrooper chest plate", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 56, 
      }, 
   }, 
   Mobiles = 
   {
      [608] = 
      {
         Weight = 0, 
         Name = "mouse droid mse", 
         ArmorClass = 100, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 2, 
         }, 
         LongDescr = "An MSE droid wheels around the floor.\
", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaking = 
            {
               [11] = "barabel", 
            }, 
            Speaks = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "The MSE droid is a small black droid less than a foot in hight. It\
wheels around the floor rapidly and comunicates in high pitched\
beeps. This behavior along with the sound of its initials have easily\
led it to being more commonly known as a \"mouse droid\
", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 608, 
         ShortDescr = "a mouse droid", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
      }, 
      [609] = 
      {
         Weight = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 80, 
         HitRoll = 16, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 500, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 609, 
         ShortDescr = "imperial royal guard", 
         Sex = "undistinguished", 
         DamRoll = 16, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [610] = 
      {
         Weight = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 80, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 500, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 610, 
         ShortDescr = "imperial royal guard", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [611] = 
      {
         Weight = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 80, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 500, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 611, 
         ShortDescr = "imperial royal guard", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [612] = 
      {
         Weight = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 80, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 500, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 612, 
         ShortDescr = "imperial royal guard", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [613] = 
      {
         Weight = 0, 
         Name = "captain Harlef", 
         ArmorClass = -112, 
         HitChance = 
         {
            HitPlus = 850, 
            HitSizeDice = 10, 
            HitNoDice = 17, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ovnuminv(10210) >= 1\
say Thank you.\
mpwithdraw 5000\
give 5000 credits $n\
drop 5000 credits\
mpgain $n 6 100000\
else\
say hmm... Thanks, but this isn't adressed to me.\
drop all\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
               Arguments = "package", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "Captain Harlef stands supervising the bridge.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 85, 
         HitRoll = 17, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 600, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 613, 
         ShortDescr = "Captain Harlef", 
         Sex = "male", 
         DamRoll = 17, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
      }, 
      [614] = 
      {
         Weight = 0, 
         Name = "pilot", 
         ArmorClass = -100, 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial pilot sits at his station.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 80, 
         HitRoll = 16, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 614, 
         ShortDescr = "an imperial pilot", 
         Sex = "male", 
         DamRoll = 16, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [615] = 
      {
         Weight = 0, 
         Name = "copilot", 
         ArmorClass = -87, 
         HitChance = 
         {
            HitPlus = 750, 
            HitSizeDice = 10, 
            HitNoDice = 15, 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A copilot sits at his post.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 75, 
         HitRoll = 15, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 615, 
         ShortDescr = "a copilot", 
         Sex = "male", 
         DamRoll = 15, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [616] = 
      {
         Weight = 0, 
         Name = "gunner", 
         ArmorClass = -75, 
         HitChance = 
         {
            HitPlus = 700, 
            HitSizeDice = 10, 
            HitNoDice = 14, 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A gunner checks of the weaponsystems.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 70, 
         HitRoll = 14, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 616, 
         ShortDescr = "a gunner", 
         Sex = "male", 
         DamRoll = 14, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [617] = 
      {
         Weight = 0, 
         Name = "navigator", 
         ArmorClass = -75, 
         HitChance = 
         {
            HitPlus = 700, 
            HitSizeDice = 10, 
            HitNoDice = 14, 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A navigator is calculating a hyperjump.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 70, 
         HitRoll = 14, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 617, 
         ShortDescr = "a navigator", 
         Sex = "male", 
         DamRoll = 14, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [618] = 
      {
         Weight = 0, 
         Name = "the empire", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 400, 
            HitSizeDice = 10, 
            HitNoDice = 8, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial guard stands at attention.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 40, 
         HitRoll = 8, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "The imperial guard stands at an unwaivering alert attention. He is\
dressed in the standard black imperial military uniform common to\
many imperial naval troopers. \
", 
         Credits = 15, 
         Race = "Human", 
         Alignment = -500, 
         Vnum = 618, 
         ShortDescr = "an imperial guard", 
         Sex = "undistinguished", 
         DamRoll = 8, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [619] = 
      {
         Weight = 0, 
         Name = "An imperial Officer", 
         ArmorClass = -75, 
         HitChance = 
         {
            HitPlus = 700, 
            HitSizeDice = 10, 
            HitNoDice = 14, 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial officer sits at the war table.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 70, 
         HitRoll = 14, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 600, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 619, 
         ShortDescr = "An imperial officer", 
         Sex = "male", 
         DamRoll = 14, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [620] = 
      {
         Weight = 0, 
         Name = "General Hanson", 
         ArmorClass = -125, 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         Damage = 
         {
            DamNoDice = 9, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "General Hanson sits at the war table.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 90, 
         HitRoll = 18, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 600, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 620, 
         ShortDescr = "General Hanson", 
         Sex = "male", 
         DamRoll = 18, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [699] = 
      {
         Weight = 0, 
         Name = "spot", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created spot here.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 699, 
         ShortDescr = "a newly created spot", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [600] = 
      {
         Weight = 0, 
         Name = "spot", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created spot here.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 600, 
         ShortDescr = "a newly created spot", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [601] = 
      {
         Weight = 0, 
         Name = "assault stormtrooper", 
         ArmorClass = -50, 
         HitChance = 
         {
            HitPlus = 600, 
            HitSizeDice = 10, 
            HitNoDice = 12, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Damage = 
         {
            DamNoDice = 6, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An assault stormtrooper is preparing for a mission.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 60, 
         HitRoll = 12, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         Credits = 20, 
         Race = "Human", 
         Alignment = -500, 
         Vnum = 601, 
         ShortDescr = "an assault stormtrooper", 
         Sex = "male", 
         DamRoll = 12, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [602] = 
      {
         Weight = 0, 
         Name = "imperial stormtrooper", 
         ArmorClass = 25, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 0, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial stormtrooper patrols the ship.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 33, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         Credits = 0, 
         Race = "Human", 
         Alignment = -500, 
         Vnum = 602, 
         ShortDescr = "a stormtrooper", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [603] = 
      {
         Weight = 0, 
         Name = "imperial stormtrooper", 
         ArmorClass = 25, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 0, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "An imperial stormtrooper patrols the shipyard.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 33, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         Credits = 0, 
         Race = "Human", 
         Alignment = -500, 
         Vnum = 603, 
         ShortDescr = "a stormtrooper", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [604] = 
      {
         Weight = 0, 
         Name = "tie fighter pilot", 
         ArmorClass = 50, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         LongDescr = "A TIE Fighter pilot is preparing for flight.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 23, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 30, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 604, 
         ShortDescr = "a TIE Fighter pilot", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [605] = 
      {
         Weight = 0, 
         Name = "ancient sith spirit teacher sith9870", 
         ArmorClass = -162, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The image before you slowly fades away.\
mpgoto 7\
say ok purge me\
", 
               MudProgType = "act_prog", 
               Arguments = "practices", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A faint image of a dark hooded figure sends shivers down your spine.\
", 
         NumberOfAttacks = 0, 
         SpecFuns = 
         {
            [0] = "spec_dark_jedi", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
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
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [10] = "backstab", 
         }, 
         Position = "standing", 
         AttackFlags = 
         {
            [28] = "_28", 
            [30] = "_30", 
         }, 
         Level = 105, 
         HitRoll = 21, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 605, 
         ShortDescr = "an ancient sith spirit", 
         Sex = "undistinguished", 
         DamRoll = 21, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
      }, 
      [606] = 
      {
         Weight = 0, 
         Name = "binary load lifter", 
         ArmorClass = 50, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A binary load lifter methodicly goes about its work.\
", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaking = 
            {
               [11] = "barabel", 
            }, 
            Speaks = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 20, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 606, 
         ShortDescr = "a binary load lifter", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [18] = "Mountable", 
            [24] = "NoAssist", 
         }, 
      }, 
      [607] = 
      {
         Weight = 0, 
         Name = "power droid", 
         ArmorClass = 75, 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A power droid is here.\
", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaking = 
            {
               [11] = "barabel", 
            }, 
            Speaks = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 10, 
         HitRoll = 2, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 607, 
         ShortDescr = "a power droid", 
         Sex = "undistinguished", 
         DamRoll = 2, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [18] = "Mountable", 
            [24] = "NoAssist", 
         }, 
      }, 
   }, 
   LowEconomy = 30528210, 
   ResetMessage = "", 
   VnumRanges = 
   {
      Object = 
      {
         First = 600, 
         Last = 699, 
      }, 
      Mob = 
      {
         First = 600, 
         Last = 699, 
      }, 
      Room = 
      {
         First = 600, 
         Last = 699, 
      }, 
   }, 
}
