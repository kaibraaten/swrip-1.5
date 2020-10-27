-- Star Destroyer - Dark Hand
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   LowEconomy = 30523830, 
   Rooms = 
   {
      [640] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 637, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 639, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Drill Hall", 
         Vnum = 640, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [641] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 638, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 637, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Drill Hall", 
         Vnum = 641, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [642] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 643, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 646, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 617, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Hallway", 
         Vnum = 642, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [643] = 
      {
         Description = "Neat rows of clean organized tables fill the room. Each table is\
rectangular in shape and seats exactly one dozen troopers. The room is\
filled with the talking but it is not over loud. There is a strong sense\
of disciplin even here. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 644, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 645, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 642, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Mess Hall", 
         Vnum = 643, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [644] = 
      {
         Description = "Neat rows of clean organized tables fill the room. Each table is\
rectangular in shape and seats exactly one dozen troopers. The room is\
filled with the talking but it is not over loud. There is a strong sense\
of disciplin even here.   Say \"food\" for a ration.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 643, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "The Mess Hall", 
         Vnum = 644, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [645] = 
      {
         Description = "The barracks kitchen is a huge assembly line. There are many enormous ovens\
and stoves and several long prep tables. A row of large sinks spans the\
length of the longest wall. Troopers take shifts at kitchen duty. Extra\
hours are rarely given for infractions as they happen so very seldom.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 643, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Kitchen", 
         Vnum = 645, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [646] = 
      {
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 642, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 647, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barrack Bunkroom", 
         Vnum = 646, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [647] = 
      {
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 646, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barrack Bunkroom", 
         Vnum = 647, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [648] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 617, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 649, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 651, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Hallway", 
         Vnum = 648, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [649] = 
      {
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 648, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 650, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barrack Bunkroom", 
         Vnum = 649, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [650] = 
      {
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line the\
walls. At the end of each bed is a foot locker. Small closets are on the\
walls inbetween the beds. The room is clean and very orderly. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 649, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barrack Bunkroom", 
         Vnum = 650, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [651] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 652, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 648, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 653, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Lounge", 
         Vnum = 651, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [652] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 651, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Lounge", 
         Vnum = 652, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [653] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 651, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Lounge", 
         Vnum = 653, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [654] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 656, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 615, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 655, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Hallway To Turrets", 
         Vnum = 654, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [655] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 654, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 697, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Hallway To Turrets", 
         Vnum = 655, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [656] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 698, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 654, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Hallway To Turrets", 
         Vnum = 656, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [657] = 
      {
         Description = "This room is filled with several stretchers and a couple dozen chairs. The\
back of the room is section off by several curtains. A door to the north\
has a sign on it saying \"Medical staff only\"\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 658, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 620, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "Emergency", 
         Vnum = 657, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [658] = 
      {
         Description = "A cool to cold room, the operating arena is dominated by a large center\
table.  Around it stand droids and equipment ready to aid the doctors in\
surgery. A set of flood lights hangs suspended over the table, and provide\
brilliant light for the procedures.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 657, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Operating Room", 
         Vnum = 658, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [659] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 660, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 620, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 658, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 659, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [660] = 
      {
         Description = "A cool to cold room, the operating arena is dominated by a large center\
table.  Around it stand droids and equipment ready to aid the doctors in\
surgery. A set of flood lights hangs suspended over the table, and provide\
brilliant light for the procedures.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Operating Room", 
         Vnum = 660, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [661] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 662, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 663, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 661, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [662] = 
      {
         Description = "The recovery rooms are semi-pleasant.  There are several beds per room,\
each separated by thick curtains.  Each bed has some simple medical\
equipment beside it.  The room smells of disinfectant.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Recovery Room", 
         Vnum = 662, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [663] = 
      {
         Description = "The recovery rooms are semi-pleasant.  There are several beds per room,\
each separated by thick curtains.  Each bed has some simple medical\
equipment beside it.  The room smells of disinfectant.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Recovery Room", 
         Vnum = 663, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [664] = 
      {
         Description = "The intensive care unit is for people who need constant monitoring and\
care.  There are several beds here, surrounded by medical equipment and\
bacta tanks.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 665, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 666, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 661, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 667, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Intensive Care", 
         Vnum = 664, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [665] = 
      {
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose and\
mask is available for you to breath through.   There is nothing to do here\
but rest and heal.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "A Bacta Tank", 
         Vnum = 665, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
      }, 
      [666] = 
      {
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose and\
mask is available for you to breath through.   There is nothing to do here\
but rest and heal.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "A Bacta Tank", 
         Vnum = 666, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
      }, 
      [667] = 
      {
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose and\
mask is available for you to breath through.   There is nothing to do here\
but rest and heal.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 664, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "A Bacta Tank", 
         Vnum = 667, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
      }, 
      [668] = 
      {
         Description = "The dining area somewhat tasteful. There are several large tables\
throughout the room. Each is covered in a fine table cloth and set in a\
manner generally considered proper amongst most human worlds and\
especially on all imperial controlled worlds. Just say \"food\" to get a\
ration. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 618, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "A Dining Room", 
         Vnum = 668, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [669] = 
      {
         Description = "This is a comfortable room with several couches. There are several game and\
card tables about the room. The games played at them are mostly strategy\
games designed to force competition between opponents at a high\
intellectual level.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 618, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "Officers Lounge", 
         Vnum = 669, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [670] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 671, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
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
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 618, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
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
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Hallway", 
         Vnum = 670, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [671] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 672, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
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
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 670, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
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
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Hallway", 
         Vnum = 671, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [672] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
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
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 671, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
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
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Hallway", 
         Vnum = 672, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [673] = 
      {
         Description = "The navigator station contains a large computer with several monitors used\
in comparing charts and maps and making complex calculations. Most of this\
is done by the computer and monitored by the navigator. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 675, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 621, 
               Key = -1, 
               Direction = "southwest", 
               Keyword = "", 
            }, 
         }, 
         Name = "Navigators Station", 
         Vnum = 673, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [674] = 
      {
         Description = "The gunners station contains controls for monitoring and manipulating the\
ships main lasers as well as the ships missile launchers torpedos and\
bombs. There are several turrets located around the ship however that are\
controlled from inside the turret and not from here. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 677, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 621, 
               Key = -1, 
               Direction = "southeast", 
               Keyword = "", 
            }, 
         }, 
         Name = "Gunners Seat", 
         Vnum = 674, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [675] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 673, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 676, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Pilots Chair", 
         Vnum = 675, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [676] = 
      {
         Description = "This part of the bridge contains a panel for controling several non\
critical ship systems. It is located right beneath the main view window\
thus it is nearly impossible to see whats going on outside the ship from\
here. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 675, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Direction = "south", 
               Keyword = "Chairn", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 677, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Bridge", 
         Vnum = 676, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [677] = 
      {
         Description = "The co pilot station contains controls for the ships defence systems. The\
most important controls being those for monitering and controlling the\
ships shields. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 676, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 674, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Co Pilots Chair", 
         Vnum = 677, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [678] = 
      {
         Description = "This large wide hallway is dimly lit. The floor is polished black like the\
rest of the ship but the walls are quite different containing many\
carvings. The carvings seem to have been painstakingly carved out of the\
wall. The are all strange designs that look very beautiful yet at the same\
time very frightening. Staring at them sends shivers down your spine.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 679, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 619, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Royal Hall", 
         Vnum = 678, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [679] = 
      {
         Description = "The audience chamber is a large long room. At the north end of the room a\
wide staircase leads up to a large throne that rests high above the rest\
of the room. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 680, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 678, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Audience Chamber", 
         Vnum = 679, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [680] = 
      {
         Description = "This small room is a safe quiet place that the current emporer uses to get\
work done that requires some concentration. It is also a good place to\
rest and contemplate. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 679, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Royal Office", 
         Vnum = 680, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [9] = "Private", 
            [10] = "Safe", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [681] = 
      {
         Description = "The mirrors in this hallway reflect against each other giving an illusion\
of a thousand hallways stacked in a row. The glass is crystal clear and\
gives an excellent reflectyion yet somehow the image seems wrong. Distored\
and twisted yet not quite visible to the naked eye. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 679, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 683, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Distance = 0, 
               DestinationVnum = 682, 
               Key = -1, 
               Direction = "somewhere", 
               Keyword = "guard post", 
            }, 
         }, 
         Name = "A Mirrored Hallway", 
         Vnum = 681, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [682] = 
      {
         Description = "This alcove is designed to give a good view of the hallway yet because of\
the mirrors make it difficult to locate. This gives the guard stationed\
here a good advantage in stopping anyone who has entered the area\
unauthorized, even though this is very unlikely to happen. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Guard Post", 
         Vnum = 682, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [683] = 
      {
         Description = "The closet is very large. There are many shelves stacked along the edges as\
well many hangars for clothes. Maybe if you looked carefully you'd find\
something useful. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Closet", 
         Vnum = 683, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [684] = 
      {
         Description = "This room is very well decorated compared to the rest of the ship. The\
walls and floor are black but all of the furniture is made of colored\
crystal. There are many pieces of beautiful artwork placed about the room.\
It is quite a contrast to what you have seen outside the royal chambers.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 685, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 681, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 686, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 687, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Living Room", 
         Vnum = 684, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [685] = 
      {
         Description = "The dining room is nicely decorated in a style similar to the living room.\
The large wooden table in the center of the room is trimmed with crystal\
designs as are the chairs. A large crystal chendelier hangs over the\
table. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Dining Room", 
         Vnum = 685, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [686] = 
      {
         Description = "This room is a small comfortable room. It is decrated in soft leathers and\
the artwork is simpler than that in the living area. It still however has\
a dark feeling to it. Thus although it looks comfortable you can't help\
feeling somewhat on edge. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 688, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Den", 
         Vnum = 686, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [687] = 
      {
         Description = "The bedroom is a beautiful and frightening place. An enormous bed is the\
centerpiece of the room.  On the walls are terrifying pictures of that\
suggest pain and sex in very abstract yet obvious ways. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 684, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 688, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Bedroom", 
         Vnum = 687, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [688] = 
      {
         Description = "This huge bathroom is beatiful. Everything in it shines. Everything is\
either a shiny polished black or a crystal clear glass. Light gleams of\
every surface reflecting all about the room. The bathtub is large and has\
many small water jets around its inside wall. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 687, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 686, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Bathroom", 
         Vnum = 688, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [689] = 
      {
         Description = "This area of the Dark Hand is where officers meet and hold council. Every\
important thing the empire does is discussed in rooms like the one to the\
north of here. This area is strictly off limits to unauthorized persons.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 690, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 691, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 672, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 692, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Before The War Room", 
         Vnum = 689, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [690] = 
      {
         Description = "This room is very simple in design. A large round table takes up most of\
the room. Around it are several chairs. The walls are sound proofed and\
electronic devices jam any attempts to record or electronicly snoop the\
discussions that take place here.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "The War room", 
         Vnum = 690, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [691] = 
      {
         Description = "The computer room is a small room with several terminals and a few extra\
chairs. The decore is simple and military yet considerably nicer than the\
rest of the ship. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Computer Room", 
         Vnum = 691, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [692] = 
      {
         Description = "The mail room is a small room with several terminals and a few extra\
chairs. The decore is simple and military yet considerably nicer than the\
rest of the ship.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 689, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "Mail Room", 
         Vnum = 692, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [693] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 614, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Droid Maintenance Room", 
         Vnum = 693, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [694] = 
      {
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 695, 
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Drop Chute", 
         Vnum = 694, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [24] = "NoFloor", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [695] = 
      {
         Description = "You can think of about 10 million other places youd rather be right now.\
The coom is filled with garbage and foul smeliing water. The door seems to\
be locked. To top it all off the walls are slowly closing in around you.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 614, 
               Key = 621, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You are slowly crushed as the walls close in around you.\
feel harm $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "Trash Compactor", 
         Vnum = 695, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [696] = 
      {
         Description = "This room is very long. It consists of several rows of shelves stacked to\
the ceiling. Each shelf is filled with labelled boxes, crates or loose\
parts. Maybe searching through this room could produce something usefull.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 614, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Storage Closet", 
         Vnum = 696, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [697] = 
      {
         Description = "This swivelling laser turret is located in a good position to cover most of\
the ships belly and side. The seat is gyroscopicly suspended and attached\
to the cannon so that they all swivel as a single unit enabling excellent\
target tracking. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 655, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "Laser Turret", 
         Vnum = 697, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [698] = 
      {
         Description = "This swivelling laser turret is located in a good position to cover most of\
the ships belly and side. The seat is gyroscopicly suspended and attached\
to the cannon so that they all swivel as a single unit enabling excellent\
target tracking. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 656, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Laser Turret", 
         Vnum = 698, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [699] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 676, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 673, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 621, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 674, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Captains Chair", 
         Vnum = 699, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [600] = 
      {
         Description = "The main hangar is an enormous room, with areas sectioned off for all types\
of ships.  In the middle of the hangar, the floor is mechanically designed\
to separate and open, allowing large ships to enter and leave. There are\
also smaller launch tunnels that can be used by smaller ships.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 601, 
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Name = "Main Hangar of the Star Destroyer Dark Hand", 
         Vnum = 600, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [601] = 
      {
         Description = "The main hangar is an enormous room, with areas sectioned off for all types\
of ships.  In the middle of the hangar, the floor is mechanically designed\
to separate and open, allowing large ships to enter and leave. There are\
also smaller launch tunnels that can be used by smaller ships.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 602, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 600, 
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Name = "Balcony Overlooking The Main Hangar", 
         Vnum = 601, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [602] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 601, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 603, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 602, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [603] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 602, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 604, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 603, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [604] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 603, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 609, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 607, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 604, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [605] = 
      {
         Description = "The transport hangar is similar to the main hangar except that the ships\
exit through shield walls along the outermost wall of the hangar. Another\
main difference is that the ships are all of two types: assault transports\
designed to carry and deploy troopers and large vehicle transports used to\
carry ground assault vehicles. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 608, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 606, 
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Name = "Balcony Overlooking a Transport Hangar", 
         Vnum = 605, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [606] = 
      {
         Description = "The transport hangar is similar to the main hangar except that the ships\
exit through shield walls along the outermost wall of the hangar. Another\
main difference is that the ships are all of two types: assault transports\
designed to carry and deploy troopers and large vehicle transports used to\
carry ground assault vehicles.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 605, 
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Name = "Transport Hangar", 
         Vnum = 606, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [607] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 604, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 608, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 607, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [608] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 607, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 605, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 608, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [609] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 610, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 604, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 609, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [610] = 
      {
         Description = "This corridor looks like just about every other corridor on the spaceship.\
Imperial designs aren't the most original but they do convey a strong\
message. The walls are standard imperial blue-grey and the floor is a\
polished jet black. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 611, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 609, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "A Corridor", 
         Vnum = 610, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [611] = 
      {
         Description = "The TIE fighter hangar is arranged differently from the standard hangar.\
The TIE fighters are arranged in rows, suspended from thick metal arms. \
When they are ready to launch, they are lowered through airlocks below\
them and released.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 610, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 612, 
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Name = "Balcony Overlooking A TIE Fighter Hangar", 
         Vnum = 611, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [612] = 
      {
         Description = "The TIE fighter hangar is arranged differently from the standard hangar.\
The TIE fighters are arranged in rows, suspended from thick metal arms. \
When they are ready to launch, they are lowered through airlocks below\
them and released.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 611, 
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Name = "TIE Fighter Hangar", 
         Vnum = 612, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [613] = 
      {
         Description = "This turbolift is located near the rear of the ship, enabling it to reach\
all levels of the destroyer.  It is voice activated.   There is a small\
'list' of available levels on the wall.\
", 
         ExtraDescriptions = 
         {
            [1] = 
            {
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
               Keyword = "list levels level note sign list. lists", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
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
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n The turbolift door closes behind you.\
mpechoaround $n The doors open and close briefly letting $n in.\
mpecho An electonic voice says. \"What level please.\"\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "A Turbolift", 
         Vnum = 613, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [614] = 
      {
         Description = "The service level appears similar to all other levels of the ship. The\
floor is the same polished black and the walls are the same blue-grey that\
adorns the rest of the ship. The most recognisable difference is the\
nature of the sounds. The sounds of droids far outweighs the sound of\
humans on this part of the ship. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 696, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 693, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 695, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Service Level", 
         Vnum = 614, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [615] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 654, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 622, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 628, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 615, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [616] = 
      {
         Description = "This room contains a control desk for monitoring the detention block. \
There are many automated defense guns positioned about the room, as well\
as several cameras monitoring activities.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 630, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 632, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 634, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level", 
         Vnum = 616, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [617] = 
      {
         Description = "The barracks area of imperial installations is an interesting mix of\
youthful energy and strict order. This is a strange combination of sweat\
and polish. The sounds of seargents shouting orders to the north mixes\
with the loud chatter of off duty trops to the west.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 642, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 648, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Barracks Level", 
         Vnum = 617, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [618] = 
      {
         Description = "The officers section of the darkhand contains the same uninspiring\
architecture as the rest of the ship. However the atmosphere is slightly\
lighter by the addition of a few personal touches added by the officers\
such as a small sculpture on a pedistal near the northern corridor.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 670, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 668, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 669, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Officers Foyer", 
         Vnum = 618, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [619] = 
      {
         Description = "This large wide hallway is dimly lit. The floor is polished black like the\
rest of the ship but the walls are quite different containing many\
carvings. The carvings seem to have been painstakingly carved out of the\
wall. The are all strange designs that look very beautiful yet at the same\
time very frightening. Staring at them sends shivers down your spine.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 678, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Royal Hall", 
         Vnum = 619, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [620] = 
      {
         Description = "The medical level smells of strongly of antiseptic. A sign on the wall\
saying \"emergency\" points to the west.  There are a few chairs along the\
wall to sit and wait in if the emergency room is full.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 659, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 657, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Medical Level", 
         Vnum = 620, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [621] = 
      {
         Description = "The bridge of the star destroyer is a large room with several work stations\
around the perimeter and a raised command section in the center. It is\
wider than it is long and a large transparisteel view window covers the\
front wall. Several other large monitors give views from ship mounted\
cameras giving a complete view of whats outside the ship.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 699, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 613, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 673, 
               Key = -1, 
               Direction = "northeast", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 674, 
               Key = -1, 
               Direction = "northwest", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Bridge", 
         Vnum = 621, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [622] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 623, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 615, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 622, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [623] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 622, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 624, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 623, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [624] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 623, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 625, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 624, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [625] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 624, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 629, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 626, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 625, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [626] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 627, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 625, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 626, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [627] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 628, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 626, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 627, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [628] = 
      {
         Description = "The engineering deck is located around the ships main reactor. Catwalks are\
made of solid grating connect various computer consoles and other pieces\
of machinery.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 615, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 627, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Engineering Deck", 
         Vnum = 628, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [629] = 
      {
         Description = "The main reactor control is a large computer console containing the\
controls for the ships main reactor as well as for monitoring the\
functions of the rest of engineering. This would be an ideal location to\
cordinate the ships engineering efforts and you will often fiend the chief\
of engineering posted here. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 625, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Name = "Main Reactor Control", 
         Vnum = 629, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [630] = 
      {
         Description = "The detention levels corridors form a hexagonal shape.  The ceiling is\
relatively low and there is little room for manuevering.  Locked cell\
doors are spaced evenly down the hall in each direction\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 631, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
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
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 616, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
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
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level Corridor", 
         Vnum = 630, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [631] = 
      {
         Description = "The detention levels corridors form a hexagonal shape.  The ceiling is\
relatively low and there is little room for manuevering.  Locked cell\
doors are spaced evenly down the hall in each direction\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
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
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 630, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
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
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level Corridor", 
         Vnum = 631, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [632] = 
      {
         Description = "This corridors walls and floors make a hexagonal shape. The ceiling is\
relatively low and there is very little room for manuevering around.\
Locked cell doors are spaced evenly out down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
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
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 633, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
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
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 616, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level Corridor", 
         Vnum = 632, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [633] = 
      {
         Description = "This corridors walls and floors make a hexagonal shape. The ceiling is\
relatively low and there is very little room for manuevering around.\
Locked cell doors are spaced evenly out down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
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
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
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
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 632, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level Corridor", 
         Vnum = 633, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [634] = 
      {
         Description = "The detention levels corridors form a hexagonal shape.  The ceiling is\
relatively low and there is little room for manuevering.  Locked cell\
doors are spaced evenly down the hall in each direction\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
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
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 616, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
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
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 635, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level Corridor", 
         Vnum = 634, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [635] = 
      {
         Description = "This corridors walls and floors make a hexagonal shape. The ceiling is\
relatively low and there is very little room for manuevering around.\
Locked cell doors are spaced evenly out down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
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
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 634, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
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
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Name = "Detention Level Corridor", 
         Vnum = 635, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [636] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 637, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 638, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 617, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 639, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Drill Hall", 
         Vnum = 636, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [637] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 641, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 640, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Drill Hall", 
         Vnum = 637, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [638] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 641, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Drill Hall", 
         Vnum = 638, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [639] = 
      {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 640, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               DestinationVnum = 636, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Name = "The Drill Hall", 
         Vnum = 639, 
         Tag = "", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
   }, 
   Filename = "darkhand.lua", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 4, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 601, 
         Arg3 = 606, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32254, 
         Command = "G", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10488, 
         Command = "G", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32250, 
         Arg3 = 13, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 609, 
         Arg3 = 7, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 607, 
         Arg3 = 5, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 606, 
         Arg3 = 15, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 606, 
         Arg3 = 14, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 605, 
         Arg3 = 3, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 604, 
         Arg3 = 10, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 603, 
         Arg3 = 9, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 601, 
         Arg3 = 6, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 600, 
         Arg3 = 606, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 610, 
         Arg3 = 612, 
      }, 
      [16] = 
      {
         Arg2 = 10, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 602, 
         Arg3 = 601, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32240, 
         Arg3 = 7, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32239, 
         Arg3 = 5, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32250, 
         Arg3 = 13, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32248, 
         Arg3 = 7, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32247, 
         Arg3 = 13, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32246, 
         Arg3 = 5, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32245, 
         Arg3 = 14, 
      }, 
      [24] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32244, 
         Arg3 = 3, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32243, 
         Arg3 = 10, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32242, 
         Arg3 = 9, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32241, 
         Arg3 = 6, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 50, 
         Arg3 = 16, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32254, 
         Command = "G", 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10488, 
         Command = "G", 
      }, 
      [31] = 
      {
         Arg2 = 5, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 604, 
         Arg3 = 612, 
      }, 
      [32] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 633, 
         Arg3 = 2, 
      }, 
      [33] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 633, 
         Arg3 = 2, 
      }, 
      [34] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 632, 
         Arg3 = 2, 
      }, 
      [35] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 632, 
         Arg3 = 2, 
      }, 
      [36] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 634, 
         Arg3 = 2, 
      }, 
      [37] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 634, 
         Arg3 = 2, 
      }, 
      [38] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 635, 
         Arg3 = 2, 
      }, 
      [39] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 635, 
         Arg3 = 2, 
      }, 
      [40] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 630, 
         Arg3 = 2, 
      }, 
      [41] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 630, 
         Arg3 = 2, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 631, 
         Arg3 = 2, 
      }, 
      [43] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 631, 
         Arg3 = 2, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 611, 
         Arg3 = 613, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 672, 
         Arg3 = 2, 
      }, 
      [46] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 672, 
         Arg3 = 2, 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 671, 
         Arg3 = 2, 
      }, 
      [48] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 671, 
         Arg3 = 2, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 670, 
         Arg3 = 2, 
      }, 
      [50] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 670, 
         Arg3 = 2, 
      }, 
      [51] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 38, 
         Arg3 = 692, 
      }, 
      [52] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 32201, 
         Arg3 = 691, 
      }, 
      [53] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 614, 
         Arg3 = 1, 
      }, 
      [54] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 621, 
         Arg3 = 695, 
      }, 
      [55] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 695, 
         Arg3 = 2, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 612, 
         Arg3 = 645, 
      }, 
      [57] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 607, 
         Arg3 = 693, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 608, 
         Arg3 = 693, 
      }, 
      [59] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 606, 
         Arg3 = 696, 
      }, 
      [60] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 622, 
         Arg3 = 696, 
      }, 
      [61] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 680, 
         Arg3 = 1, 
      }, 
      [62] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 683, 
         Arg3 = 1, 
      }, 
      [63] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 613, 
         Arg3 = 686, 
      }, 
      [64] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 686, 
         Arg3 = 1, 
      }, 
      [65] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 686, 
         Arg3 = 1, 
      }, 
      [66] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 688, 
         Arg3 = 1, 
      }, 
      [67] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 688, 
         Arg3 = 1, 
      }, 
      [68] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 687, 
         Arg3 = 1, 
      }, 
      [69] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 687, 
         Arg3 = 1, 
      }, 
      [70] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 684, 
         Arg3 = 1, 
      }, 
      [71] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 684, 
         Arg3 = 1, 
      }, 
      [72] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 684, 
         Arg3 = 1, 
      }, 
      [73] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 681, 
         Arg3 = 1, 
      }, 
      [74] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 681, 
         Arg3 = 1, 
      }, 
      [75] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 681, 
         Arg3 = 1, 
      }, 
      [76] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 609, 
         Arg3 = 619, 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 624, 
         Command = "G", 
      }, 
      [78] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 610, 
         Arg3 = 679, 
      }, 
      [79] = 
      {
         Arg2 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 679, 
         Arg3 = 1, 
      }, 
      [80] = 
      {
         Arg2 = 3, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 679, 
         Arg3 = 1, 
      }, 
      [81] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 611, 
         Arg3 = 682, 
      }, 
      [82] = 
      {
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 612, 
         Arg3 = 621, 
      }, 
      [83] = 
      {
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 612, 
         Arg3 = 621, 
      }, 
      [84] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 613, 
         Arg3 = 699, 
      }, 
      [85] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 615, 
         Arg3 = 677, 
      }, 
      [86] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 616, 
         Arg3 = 674, 
      }, 
      [87] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 617, 
         Arg3 = 673, 
      }, 
      [88] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 614, 
         Arg3 = 675, 
      }, 
      [89] = 
      {
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 618, 
         Arg3 = 689, 
      }, 
      [90] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32200, 
         Arg3 = 16, 
      }, 
      [91] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32206, 
         Arg3 = 6, 
      }, 
      [92] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32205, 
         Arg3 = 8, 
      }, 
      [93] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32204, 
         Arg3 = 13, 
      }, 
      [94] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32203, 
         Arg3 = 7, 
      }, 
      [95] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32202, 
         Arg3 = 5, 
      }, 
      [96] = 
      {
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 618, 
         Arg3 = 689, 
      }, 
      [97] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32200, 
         Arg3 = 16, 
      }, 
      [98] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32206, 
         Arg3 = 6, 
      }, 
      [99] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32205, 
         Arg3 = 8, 
      }, 
      [100] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32204, 
         Arg3 = 13, 
      }, 
      [101] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32203, 
         Arg3 = 7, 
      }, 
      [102] = 
      {
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32202, 
         Arg3 = 5, 
      }, 
      [103] = 
      {
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 689, 
         Arg3 = 1, 
      }, 
      [104] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 619, 
         Arg3 = 690, 
      }, 
      [105] = 
      {
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 620, 
         Arg3 = 690, 
      }, 
      [106] = 
      {
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 690, 
         Arg3 = 1, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 9001, 
         Arg3 = 644, 
      }, 
   }, 
   Objects = 
   {
      [608] = 
      {
         Description = "A stormtrooper groin plate was left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 3, 
         Name = "assault stormtrooper groin plate s608", 
         Vnum = 608, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "an assault stormtrooper groin plate", 
         ActionDescription = "", 
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
         Layers = 56, 
      }, 
      [609] = 
      {
         Description = "Some stormtrooper leg armor was left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 6, 
         Name = "stormtrooper leg plates s609", 
         Vnum = 609, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "assault stormtrooper leg plates", 
         ActionDescription = "", 
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
         Layers = 56, 
      }, 
      [610] = 
      {
         Description = "An Imperial Tie Fighter is docked here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "tie fighter", 
         Vnum = 610, 
         Cost = 0, 
         ShortDescr = "a tie fighter", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [611] = 
      {
         Description = "A list is on the wall here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "listtttt", 
         Vnum = 611, 
         Cost = 0, 
         ShortDescr = "a list", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [612] = 
      {
         Description = "A portable oven is plugged into a wall socket.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1000, 
         Name = "portable oven", 
         Vnum = 612, 
         Weight = 20, 
         ShortDescr = "a portable oven", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [613] = 
      {
         Description = "An ancient book holds many dark secrets.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "ancient book sith teachings book123sith", 
         Vnum = 613, 
         Weight = 1, 
         ShortDescr = "an ancient book", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [620] = 
      {
         Description = "Some white boots are here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 3, 
         Name = "assault stormtrooper boots", 
         Vnum = 620, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "assault stormtrooper boots", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [621] = 
      {
         Description = "Thank the force the trash compactor key is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Name = "trash comapctor key", 
         Vnum = 621, 
         Flags = 
         {
            [25] = "Hidden", 
         }, 
         ShortDescr = "trash comapctor key", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [622] = 
      {
         Description = "A piece of duraplast tubing is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         Name = "duraplast", 
         Vnum = 622, 
         Weight = 1, 
         ShortDescr = "duraplast tubing", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [623] = 
      {
         Description = "A small sculture depicts a strange batlike creature devouring a humaniod form.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
         Name = "a sculpture", 
         Vnum = 623, 
         Weight = 1, 
         ShortDescr = "a sculpture", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [624] = 
      {
         Description = "A royal guards force pike was left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
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
         Cost = 1500, 
         Name = "royal guards force pike", 
         Vnum = 624, 
         Weight = 12, 
         ShortDescr = "a royal guards force pike", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [699] = 
      {
         Description = "Dark hand key", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Dark hand key", 
         Vnum = 699, 
         Cost = 0, 
         ShortDescr = "Dark hand key", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [698] = 
      {
         Description = "Some god dropped a newly created the Dark hand key here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "the Dark hand key", 
         Vnum = 698, 
         Cost = 0, 
         ShortDescr = "a newly created the Dark hand key", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [697] = 
      {
         Description = "Some god dropped a newly created the silver urchin key here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "the silver urchin key", 
         Vnum = 697, 
         Cost = 0, 
         ShortDescr = "a newly created the silver urchin key", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [696] = 
      {
         Description = "Imperial battle plans were left here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "Battle Plans", 
         Vnum = 696, 
         Weight = 1, 
         ShortDescr = "the battle plans", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [666] = 
      {
         Description = "A Clan Tattoo", 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A beautiful piece of artwork makes you feel strong and proud to have your\
\13Clan's Tattoo on your hands. \
\13", 
               Keyword = "tattoo ", 
            }, 
            [2] = 
            {
               Description = "Your Clan's Tattoo makes you feel strong and proud you joined them.\
\13", 
               Keyword = "tattoo ", 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
         Name = "tattoo ", 
         Vnum = 666, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "A Clan Tattoo", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [695] = 
      {
         Description = "A lift leading to The Imperial Star Destroyer Darkhand is here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Name = "The Imperial Star Destroyer Darkhand", 
         Vnum = 695, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "The Imperial Star Destroyer Darkhand", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [600] = 
      {
         Description = "An assault transport is docked here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "an assault transport", 
         Vnum = 600, 
         Cost = 0, 
         ShortDescr = "an assault transport", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [601] = 
      {
         Description = "A stormtrooper helmet was dropped here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Weight = 5, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -10, 
               Location = 39, 
            }, 
            [2] = 
            {
               Modifier = -10, 
               Location = 36, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "assault stormtrooper helmet as601", 
         Vnum = 601, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "an assault stormtrooper helmet", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [602] = 
      {
         Description = "A stormtrooper helmet was dropped here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 5, 
         Name = "stormtrooper helmet s602", 
         Vnum = 602, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "a stormtrooper helmet", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [603] = 
      {
         Description = "Stormtrooper gloves were dropped here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 3, 
         Name = "Assault stormtrooper gloves s603", 
         Vnum = 603, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "assault stormtrooper gloves", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [604] = 
      {
         Description = "Some stormtrooper arm plates were left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 3, 
         Name = "Assault stormtrooper arm plates s604", 
         Vnum = 604, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "assault stormtrooper arm plates", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [605] = 
      {
         Description = "Stormtrooper shoulder plates were discarded here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 3, 
         Name = "Assault stormtrooper shoulder plates s605", 
         Vnum = 605, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "assault stormtrooper shoulder plates", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [606] = 
      {
         Description = "Stormtrooper hand plates were discarded here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 3, 
         Name = "Assault stormtrooper hand plates s606", 
         Vnum = 606, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "assault stormtrooper hand plates", 
         ActionDescription = "", 
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
         Layers = 0, 
      }, 
      [607] = 
      {
         Description = "A white stormtrooper chest plate was left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 7, 
         Name = "assault stormtrooper chest plate s607", 
         Vnum = 607, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "an assault stormtrooper chest plate", 
         ActionDescription = "", 
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
         Layers = 56, 
      }, 
   }, 
   Author = "Durga", 
   FileFormatVersion = 1, 
   VnumRanges = 
   {
      Object = 
      {
         Last = 699, 
         First = 600, 
      }, 
      Room = 
      {
         Last = 699, 
         First = 600, 
      }, 
      Mob = 
      {
         Last = 699, 
         First = 600, 
      }, 
   }, 
   ResetMessage = "", 
   ResetFrequency = 5, 
   Name = "Star Destroyer - Dark Hand", 
   HighEconomy = 0, 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   Mobiles = 
   {
      [608] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a mouse droid", 
         Vnum = 608, 
         Level = 1, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An MSE droid wheels around the floor.\
", 
         Description = "The MSE droid is a small black droid less than a foot in hight. It\
wheels around the floor rapidly and comunicates in high pitched\
beeps. This behavior along with the sound of its initials have easily\
led it to being more commonly known as a \"mouse droid\
", 
         DefaultPosition = "standing", 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "mouse droid mse", 
         ArmorClass = 100, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 2, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [609] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 16, 
         ShortDescr = "imperial royal guard", 
         Vnum = 609, 
         Level = 80, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 16, 
         NumberOfAttacks = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         Credits = 500, 
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
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [610] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "imperial royal guard", 
         Vnum = 610, 
         Level = 80, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         Credits = 500, 
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
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [611] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "imperial royal guard", 
         Vnum = 611, 
         Level = 80, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         Credits = 500, 
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
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [612] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "imperial royal guard", 
         Vnum = 612, 
         Level = 80, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial royal guard stands at his post.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "the empire", 
         ArmorClass = -100, 
         Credits = 500, 
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
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [613] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 17, 
         ShortDescr = "Captain Harlef", 
         Vnum = 613, 
         Level = 85, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "Captain Harlef stands supervising the bridge.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 17, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "captain Harlef", 
         ArmorClass = -112, 
         Credits = 600, 
         HitChance = 
         {
            HitNoDice = 17, 
            HitSizeDice = 10, 
            HitPlus = 850, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [614] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 16, 
         ShortDescr = "an imperial pilot", 
         Vnum = 614, 
         Level = 80, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial pilot sits at his station.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 16, 
         NumberOfAttacks = 0, 
         Name = "pilot", 
         ArmorClass = -100, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [615] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 15, 
         ShortDescr = "a copilot", 
         Vnum = 615, 
         Level = 75, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A copilot sits at his post.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 15, 
         NumberOfAttacks = 0, 
         Name = "copilot", 
         ArmorClass = -87, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 10, 
            HitPlus = 750, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [616] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 14, 
         ShortDescr = "a gunner", 
         Vnum = 616, 
         Level = 70, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A gunner checks of the weaponsystems.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 14, 
         NumberOfAttacks = 0, 
         Name = "gunner", 
         ArmorClass = -75, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 14, 
            HitSizeDice = 10, 
            HitPlus = 700, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [617] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 14, 
         ShortDescr = "a navigator", 
         Vnum = 617, 
         Level = 70, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A navigator is calculating a hyperjump.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 14, 
         NumberOfAttacks = 0, 
         Name = "navigator", 
         ArmorClass = -75, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 14, 
            HitSizeDice = 10, 
            HitPlus = 700, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [618] = 
      {
         Alignment = -500, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 8, 
         ShortDescr = "an imperial guard", 
         Vnum = 618, 
         Level = 40, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Description = "The imperial guard stands at an unwaivering alert attention. He is\
dressed in the standard black imperial military uniform common to\
many imperial naval troopers. \
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 8, 
         NumberOfAttacks = 0, 
         Name = "the empire", 
         ArmorClass = 0, 
         Credits = 15, 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [619] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 14, 
         ShortDescr = "An imperial officer", 
         Vnum = 619, 
         Level = 70, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial officer sits at the war table.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 14, 
         NumberOfAttacks = 0, 
         Name = "An imperial Officer", 
         ArmorClass = -75, 
         Credits = 600, 
         HitChance = 
         {
            HitNoDice = 14, 
            HitSizeDice = 10, 
            HitPlus = 700, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [620] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 18, 
         ShortDescr = "General Hanson", 
         Vnum = 620, 
         Level = 90, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "General Hanson sits at the war table.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 18, 
         NumberOfAttacks = 0, 
         Name = "General Hanson", 
         ArmorClass = -125, 
         Credits = 600, 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Damage = 
         {
            DamNoDice = 9, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [699] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a newly created spot", 
         Vnum = 699, 
         Level = 1, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "Some god abandoned a newly created spot here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "spot", 
         ArmorClass = 0, 
         Credits = 0, 
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
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [600] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a newly created spot", 
         Vnum = 600, 
         Level = 1, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "Some god abandoned a newly created spot here.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "spot", 
         ArmorClass = 0, 
         Credits = 0, 
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
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [601] = 
      {
         Alignment = -500, 
         Weight = 0, 
         Sex = "male", 
         DamRoll = 12, 
         ShortDescr = "an assault stormtrooper", 
         Vnum = 601, 
         Level = 60, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An assault stormtrooper is preparing for a mission.\
", 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 12, 
         NumberOfAttacks = 0, 
         Name = "assault stormtrooper", 
         ArmorClass = -50, 
         Credits = 20, 
         HitChance = 
         {
            HitNoDice = 12, 
            HitSizeDice = 10, 
            HitPlus = 600, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 6, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [602] = 
      {
         Alignment = -500, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a stormtrooper", 
         Vnum = 602, 
         Level = 33, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial stormtrooper patrols the ship.\
", 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "imperial stormtrooper", 
         ArmorClass = 25, 
         Credits = 0, 
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
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 0, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [603] = 
      {
         Alignment = -500, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a stormtrooper", 
         Vnum = 603, 
         Level = 33, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "An imperial stormtrooper patrols the shipyard.\
", 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "imperial stormtrooper", 
         ArmorClass = 25, 
         Credits = 0, 
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
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 0, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [604] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a TIE Fighter pilot", 
         Vnum = 604, 
         Level = 23, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A TIE Fighter pilot is preparing for flight.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         Height = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "tie fighter pilot", 
         ArmorClass = 50, 
         Credits = 30, 
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
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [605] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 21, 
         ShortDescr = "an ancient sith spirit", 
         Vnum = 605, 
         Level = 105, 
         SpecFuns = 
         {
            [0] = "spec_dark_jedi", 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         NumberOfAttacks = 0, 
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
         LongDescr = "A faint image of a dark hooded figure sends shivers down your spine.\
", 
         Description = "", 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         HitRoll = 21, 
         AttackFlags = 
         {
            [28] = "_28", 
            [30] = "_30", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [10] = "backstab", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Name = "ancient sith spirit teacher sith9870", 
         ArmorClass = -162, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [606] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 0, 
         ShortDescr = "a binary load lifter", 
         Vnum = 606, 
         Level = 20, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A binary load lifter methodicly goes about its work.\
", 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         DefaultPosition = "standing", 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Name = "binary load lifter", 
         ArmorClass = 50, 
         Credits = 0, 
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
            [26] = "Droid", 
            [18] = "Mountable", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
      [607] = 
      {
         Alignment = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DamRoll = 2, 
         ShortDescr = "a power droid", 
         Vnum = 607, 
         Level = 10, 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A power droid is here.\
", 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         DefaultPosition = "standing", 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 2, 
         NumberOfAttacks = 0, 
         Name = "power droid", 
         ArmorClass = 75, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [18] = "Mountable", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
      }, 
   }, 
}
