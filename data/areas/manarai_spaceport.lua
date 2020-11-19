-- Coruscant - Manarai Spaceport
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 199, 
         Last = 226, 
      }, 
      Object = 
      {
         First = 199, 
         Last = 226, 
      }, 
      Room = 
      {
         First = 199, 
         Last = 226, 
      }, 
   }, 
   Objects = 
   {
      [200] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 200, 
         Cost = 0, 
         ShortDescr = "the Shipyard Ferry", 
         Layers = 0, 
         Weight = 1, 
         Name = "ferry shuttle", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "The shipyard ferry travels back and forth between coruscant and the shipyard.", 
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
      [201] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 201, 
         Cost = 2, 
         ShortDescr = "a sandwich", 
         Weight = 1, 
         Layers = 0, 
         Name = "sandwich ", 
         Description = "Don't step on that sandwich...", 
         ActionDescription = "", 
         ItemType = "food", 
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
            [0] = 5, 
         }, 
      }, 
      [210] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 210, 
         Cost = 0, 
         ShortDescr = "a box", 
         Layers = 0, 
         Weight = 1, 
         Name = "box", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "A large box is on the floor here.", 
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
      [225] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 225, 
         Cost = 0, 
         ShortDescr = "a turbocar", 
         Layers = 0, 
         Weight = 1, 
         Name = "turbocar subway car transit", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "A turbocar is here, board it quickly before it leaves.", 
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
      [202] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Vnum = 202, 
         Cost = 2, 
         ShortDescr = "some beat up sneakers", 
         Weight = 1, 
         Layers = 0, 
         Name = "some beat up sneakers", 
         Description = "Some beat up sneakers really stink.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ObjectValues = 
         {
            [1] = 3, 
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
      [224] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 224, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Plaza Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 447, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [225] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 225, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Turbocar", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "The turbocar is long and narrow. There are benches along both sides of\
the car but they are almost always filled. Most passengers are forced\
to grab onto one of the many handholds that extend from the ceiling\
and lock into position once the car starts moving.\
", 
      }, 
      [226] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 226, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "&RDO NOT FLY THIS SHIP&w", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "Do not fly this ship it is controlled automaticly by the code. Do not\
fly this ship it is controlled automaticly by the code. Do not fly\
this ship it is controlled automaticly by the code. Do not fly this\
ship it is controlled automaticly by the code.\
", 
      }, 
      [199] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 199, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "&RDO NOT FLY THIS SHIP", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "Do not fly this ship it is controlled automaticly by the code. Do not\
fly this ship it is controlled automaticly by the code. Do not fly\
this ship it is controlled automaticly by the code. Do not fly this\
ship it is controlled automaticly by the code.\
", 
      }, 
      [200] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 200, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Small Shuttle", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "You stand inside a small shuttlecraft that flies between Coruscant's\
Manarai Spaceport and An Orbitting Shipyard. There are several plastic\
covered seats along the walls but passengers are mostly expected to\
stand for the brief journey.\
Type LEAVE to exit after the ship lands.\
", 
      }, 
      [201] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 201, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Serin Pluogus Tourbus Platform", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 204, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This platform is reserved for the publicly funded tour shuttle, the\
Serin Pluogus. The rest of the Manarai spaceport is to the west and\
north of here. Around the rest of the platform you can view the\
southern reaches of Imperial City. To the south tower the Manarai\
Mountains.\
\
When the pluogus lands type BOARD PLUOGUS to enter.\
", 
      }, 
      [202] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 202, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Shuttle Platform", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 204, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This platform is reserved for shuttles flying between Manarai spaceport\
and orbitting space stations. The rest of the Manarai spaceport is to\
the south-east and  north of here.  Around the rest of the platform\
you can view the southern reaches of Imperial  City .To the south tower\
the Manarai Mountains.\
 \
Wait here for the shipyard ferry. When it lands BOARD FERRY.\
 \
", 
      }, 
      [203] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         Vnum = 203, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main Platform", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 204, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the main platform in the Manarai Spaceport. All kinds of ships\
are docked here. There are even a few that can be rented. The rest of\
the spaceport is to the north. Around it is the southern end of\
Imperial City which covers a good portion of the planet. To the south\
s a beautiful view of the Manarai Mountain Range. \
", 
      }, 
      [204] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 204, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Platform Area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 205, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 202, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 203, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 201, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "From the platform area of the spaceport you have an excellent view of\
the Manarai Mountains to the south. This large mountain range marks\
the southern limit of Government city. The air is cool here and\
tastes cleaner than that  of the rest of the planet. It would be\
quite peaceful here watching spaceships take off against the\
backgound of the snow capped mountains. The main platform is to the\
south of here. A walkway leads north into the spaceport.\
", 
      }, 
      [205] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 205, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Walkway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 206, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 204, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The walkway is a long corridor enclosed in transpariplast windows.\
Through the windows you can see that the spaceport is surrounded by\
mountains to the south and a seemongly endless city that stretches\
out in all other directions.\
", 
      }, 
      [206] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 206, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Waiting Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 209, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 208, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 205, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 207, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This large room is filled with benches and chairs. Most are arranged\
in rows or around small islands of plants. Some however are arranged\
in small groups  facing each other. Scattered amidst the seats are\
many tables housing abandoned magazines. There is a holovid showing\
an old movie in one corner of the room. \
", 
      }, 
      [207] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 207, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Spaceport Cafe", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 206, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The spaceport cafe is a good sized self-serve cafeteria. There is a\
long counter with many snack type foods and small instant meals. A\
drink dispenser is at one end and at the other a droid teller handles\
the credit transactions. There are a many tables along the walls and\
a several in the center of the room.\
", 
      }, 
      [208] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 208, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lost and Found", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 206, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The lost and found is a small plain room. There is a bin of clothing,\
a table with several small boxes, a couple of large boxes and several\
suitcases lined up against the wall. Some of the stuff has been\
collecting dust for quite some time.\
", 
      }, 
      [209] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 209, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Spaceport Lobby", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 210, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 212, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 206, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 211, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 213, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The Manarai Spaceport lobby is a large open room with a transparisteel\
ceiling. The floor is a polished white with a black fractal pattern.\
There is a ticket booth in one corner of the room. An escalater in\
the opposite corner leads down.\
", 
      }, 
      [210] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 210, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Spaceport Entrance", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 301, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 209, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The entranceway of the Manarai Mountains Spaceport is a large wide\
staicase  leading from the walkway outside down to the spaceport\
lobby. A large set of double doors opens and closes automaticly as\
people approach.\
", 
      }, 
      [211] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 211, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Spaceport Hotel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 209, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The Manarai Spaceport Hotel is attached directly to the lobby of\
spaceport allowing travelers to find quick lodgings after a long\
journey. The rooms here are well kept although a bit pricy. It would\
be a good safe place to rest for a while.\
\
You may safely leave and reenter the game from here.\
 \
", 
      }, 
      [212] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 212, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Spaceport Store", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 209, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The spaceport store seems to carry mostly only useless souveniers.\
There are however a few nice garments for sale and one or two of the\
things on display could come in handy if the prices weren't so high.\
", 
      }, 
      [213] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 213, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Transit Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 214, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 209, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The Manarai Spaceport Transit Station is one of many interconnected\
turbocar stations running through Imperial City. Its probably the\
easiest fasted and cheapest way to get around the enormous city and\
thus is a favoured means  of transportation.\
", 
      }, 
      [214] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 214, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Toll Booth", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 213, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "For one small fee you can ride the turbocar transit system to almost\
anywhere throught Imperial City. The turnstile allows one person\
through at a time as they pay the droid on duty. The cost is 5\
credits.\
", 
      }, 
      [215] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 215, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Manarai Spaceport Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 213, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extremely high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [216] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 216, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Skydome Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 431, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [217] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 217, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Grand Towers Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 433, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [218] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 218, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Grandis Mon Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 436, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 435, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [219] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 219, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Palace Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 438, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 437, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [220] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 220, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Museum Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 439, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [221] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 221, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - College Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 441, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [222] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 222, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Zoo Station ", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 443, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
      [223] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 223, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turbocar Platform - Dometown Station", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 445, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 31260249, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 210, 
         Command = "O", 
         Arg3 = 208, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 200, 
         Command = "M", 
         Arg3 = 214, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Command = "O", 
         Arg3 = 211, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 32201, 
         Command = "O", 
         Arg3 = 209, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 202, 
         Command = "M", 
         Arg3 = 207, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 305, 
         Command = "G", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 304, 
         Command = "G", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32207, 
         Command = "G", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 201, 
         Command = "G", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 203, 
         Command = "M", 
         Arg3 = 210, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 204, 
         Command = "M", 
         Arg3 = 204, 
         Arg2 = 2, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 204, 
         Command = "M", 
         Arg3 = 204, 
         Arg2 = 2, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 206, 
         Command = "M", 
         Arg3 = 203, 
         Arg2 = 2, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 206, 
         Command = "M", 
         Arg3 = 203, 
         Arg2 = 2, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 207, 
         Command = "M", 
         Arg3 = 206, 
         Arg2 = 2, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg1 = 207, 
         Command = "M", 
         Arg3 = 206, 
         Arg2 = 2, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 10315, 
         Command = "O", 
         Arg3 = 206, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 209, 
         Command = "M", 
         Arg3 = 201, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg1 = 208, 
         Command = "M", 
         Arg3 = 202, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 210, 
         Command = "M", 
         Arg3 = 205, 
         Arg2 = 2, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 332, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3, 
         Command = "G", 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg1 = 202, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg1 = 210, 
         Command = "M", 
         Arg3 = 205, 
         Arg2 = 2, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 332, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg1 = 202, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg1 = 201, 
         Command = "M", 
         Arg3 = 212, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32270, 
         Command = "G", 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32261, 
         Command = "G", 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32253, 
         Command = "G", 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10424, 
         Command = "G", 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10311, 
         Command = "G", 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 329, 
         Command = "G", 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Durga", 
   Name = "Coruscant - Manarai Spaceport", 
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
   Filename = "manarai_spaceport.lua", 
   Mobiles = 
   {
      [208] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "an astromech droid", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 208, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 5, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         Name = "astromech droid r2", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Astromech droid wheels around the floor.\
", 
         ArmorClass = 88, 
      }, 
      [209] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "an astromech droid", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 209, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 5, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         Name = "astromech droid r2", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Astromech droid wheels around the floor.\
", 
         ArmorClass = 88, 
      }, 
      [210] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 20, 
            HitSizeDice = 10, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a begger", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 210, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "say Spare some change?\
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "look $n\
say Spare some change?\
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "bribe_prog", 
               Code = "say thank you.\
bow $n\
", 
               Arguments = "1", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 2, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Name = "begger", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A small child begs for money.\
", 
         ArmorClass = 95, 
      }, 
      [225] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a newly created mobmarker", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 225, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "mobmarker", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created mobmarker here.\
", 
         ArmorClass = 0, 
      }, 
      [200] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a ticket droid", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "This is a plain looking droid whos only purpose day in and day out is to\
collect credits and tokens for entrance into the transit system. It\
doesn't apear that it would be useful in any other capacity.\
", 
         Alignment = 0, 
         Sex = "undistinguished", 
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
         HitRoll = 0, 
         Vnum = 200, 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpechoat $n The droid scans your credits and allows you to pass.\
mpechoaround $n $n passes through the turnstile.\
mptransfer $n 215\
", 
               Arguments = "5", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 1, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "toll droid ticket token", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A droid is here collecting turbocar tokens.\
", 
         ArmorClass = 0, 
      }, 
      [201] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a shopkeeper droid", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "This droid is a very rudimentry humanoid shape. Its voice synthesyser is\
worn out and makes a slight hissing sound when it speaks.\
", 
         Alignment = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a shopkeeper droid", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 201, 
         Height = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [0] = "Coruscant", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Name = "storekeeper hopkeeper droid", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A droid is here scanning your purchaces.\
", 
         ArmorClass = -25, 
      }, 
      [202] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a retail droid", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "The retail droid is similar in apearance to a standard proticol droid.\
It is fittened however with a crdit exchange terminal in its hip and\
is programmed to be an expert salesperson.\
", 
         Alignment = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a retail droid", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
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
         HitRoll = 0, 
         Vnum = 202, 
         Height = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [0] = "Coruscant", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         Level = 10, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Name = "retail droid", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A retail droid is here to assist you with your purchaces.\
", 
         ArmorClass = 0, 
      }, 
      [203] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "a spaceport security guard", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 10, 
         Vnum = 203, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 10, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "spaceport security guard", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A spaceport security guard looks around the entrance.\
", 
         ArmorClass = -25, 
      }, 
      [204] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "a spaceport security guard", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 204, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "spaceport security guard", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A spaceport security guard watches the docking bays.\
", 
         ArmorClass = -25, 
      }, 
      [205] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a newly created technician", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 205, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "technician", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created technician here.\
", 
         ArmorClass = 0, 
      }, 
      [206] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a technician", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "This is a young human tecnician. He is dressed in a grey worksuit that\
is smuged with greasea. Several tools hang from a belt around his\
waist.\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 206, 
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
         Sex = "male", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 9, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
            [24] = "NoAssist", 
         }, 
         Name = "technician", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A technician is readying ships for launch.\
", 
         ArmorClass = 80, 
      }, 
      [207] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a human", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "This young human man is in his early twenties. He is dressed in the latest\
fashions and is clean cut. He is probably a student at the university.\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 207, 
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
         Sex = "male", 
         Credits = 10, 
         DamRoll = 0, 
         Level = 10, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Name = "human", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A human is sitting here waiting for his shuttle to arrive.\
", 
         ArmorClass = 75, 
      }, 
   }, 
}
