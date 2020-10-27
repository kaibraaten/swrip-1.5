-- Mon Calamri
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   Filename = "mon_cal.lua", 
   HighEconomy = 0, 
   Author = "Ackbar", 
   Name = "Mon Calamri", 
   Rooms = 
   {
      [21000] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&Y In Honor of the Great Admiral Ackbar.\
\13Who died giving his life for Freedom of all Underwater Creatures.\
\13We can only look tot he heavens for bravery like his.\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Name = "Coral City Center", 
         Vnum = 21000, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue lies to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21001, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "To the east lies Barster Road.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21036, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Anna Avenue lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21042, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "To the west lies Barster Road.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21039, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&P You are standing within the expanse of the famous Mon Calamrian City of\
Coral City .  A metallic statue of Admiral Ackbar occupies the square's\
center, surrounded by gardens of shrubbery which enhance the air of\
serenity and peace here in the center of the city.  The main roads lead\
away in the cardinal directions, while to the east and west are smooth\
carved rock roads. The roof tops of a buildings can be seen rising to the\
south east.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [15] = "NoDropAll", 
         }, 
      }, 
      [21001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Anna Avenue", 
         Vnum = 21001, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue lies in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21002, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road to the south leads to the main  Square.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21000, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. Directly south you\
can see the circular center of Coral City.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
      }, 
      [21002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21002, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The worn metallic roads of Anna Avenue lie in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21003, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A peculiar section of Anna Avenue lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21001, 
               Key = -1, 
            }, 
         }, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Anna Avenue", 
      }, 
      [21003] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21003, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue and Security Road cross just north of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21004, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A rather bland portion of Anna Avenue lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21002, 
               Key = -1, 
            }, 
         }, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. to the north you can see an intersection. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Anna Avenue", 
      }, 
      [21004] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The North Docking bay of Akatamer\
\13East  - Security Road\
\13        - To Luke Street\
\13South - Anna Avenue\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13        - To Akatamer Square\
\13West  - Security Road\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21004, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The northern Docking bay can be seen in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21100, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Security Road extends to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21005, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Going south will bring you near the heart of the city.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21003, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "Security Road extends to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21035, 
               Key = -1, 
            }, 
         }, 
         Description = "&RYou stand at the intersection of &PAnna Avenue&R and Security Road.  This\
main road is home to the Mon Calamari Police. It is highly recommended\
that you do not walk down this street with rifle a blaze. Soft greenery\
have been added to the street sides to help make it look more attractive.\
To the north you can see the north docking bay where the transport ships\
continualy stop. Security Road lies to the east and west, while &P Anna\
Avenue &R can be seen to the north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Anna Avenue and Security Road", 
      }, 
      [21005] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21005, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21132, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21006, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The intersection of Anna Avenue and Security Road is to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21004, 
               Key = -1, 
            }, 
         }, 
         Description = "&R This portion of Security Road seems extremly well taken care of.  A\
whistling northern wind can be heard passing the large Security building\
to the north.  The extremly large building was made out of grinded lava\
rock from the planet ocean floor. This extremly hard surface is known for\
it's ability to keep criminals inside. Security Road stretches  to the\
east and west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Main Security Office", 
      }, 
      [21006] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The statue is of the Late members of S.P.I.N. belived to be past\
\13away.\
\13", 
               Keyword = "statue", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21006, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road is to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21007, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road extends westward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21005, 
               Key = -1, 
            }, 
         }, 
         Description = "&RYou are on a straight section of Security Road.  A statue depicting a\
party of adventurers fighting off a Imperial Stortrooper sits in the\
center of the road.  Blinking back a tear, you remember hearing this tale\
in a local Factory , and realize that the statue is a memorial.  Security\
Road extends to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Security Road", 
      }, 
      [21007] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21007, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road meets Luke Street to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21008, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21006, 
               Key = -1, 
            }, 
         }, 
         Description = "&R You are walking down Security Road.  The long road, which lines the\
northern wall of Coral City, meets up with Oceanview Street to the east to\
form one of the four corners of Coral City. Beyond these four corners is a\
small walkway guarded by a Mon built breakwater that turns back the\
largest ocean on a habital planet. The street continues westward.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Security Road", 
      }, 
      [21008] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "West  - Security Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13South - Luke Street\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21008, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "Luke Street lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21009, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road lies to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21007, 
               Key = -1, 
            }, 
         }, 
         Description = "&B Oceanview Street and Security Road come together here to form one of the\
four corners of Coral City. Oceanview Street lies to the south, while\
Security Road stretches westward.To the south you can see Mon Calamrian\
New Rebublic troops practicing military drills incase and invasion ever\
occurs again. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Meeting of Oceanview Street and Security Road ", 
      }, 
      [21009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21009, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street meets up with Security Road to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21008, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Luke Street continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21010, 
               Key = -1, 
            }, 
         }, 
         Description = "&B This section of Oceanview Street is reserved for the Mon Calamrian\
defense team.  E- Web Blaster's and Com - blasters are stacked high into\
the air, almost within reach of the  New Rebublic guards on the outpost.\
to the west. Oceanview Street stretches to the north and south.  You also\
\
see in the enterance a body scanner that will make sure you have no\
weapons on you.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Oceanview Street", 
      }, 
      [21010] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21010, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21009, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road ranges to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21011, 
               Key = -1, 
            }, 
         }, 
         Description = "&B This portion of Oceanview Street is rather poor and unkempt.  Rags\
\
litter the street, and several of the city's unfortunate have set up\
residence here.;A holohome has been set up on the eastern side of the\
road, a beggar's home no doubt.  They prefer this road thanks to the\
constant tourists that travelk it. Oceanview Street continues to the north\
and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Oceanview Street", 
      }, 
      [21011] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21011, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street extends northward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21010, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Barster Road and Luke Street cross to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21012, 
               Key = -1, 
            }, 
         }, 
         Description = "&BYou are walking down the northern half of Oceanview Street at a brisk\
pace. To the east is the towering  security wall of Coral City ,blocking\
your view of the awsome ocean.   Oceanview Street ranges to the north and\
south.  The road is extremly polished and looks as if not to many Mon\
Calamrian's travel down it.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Oceanview Street", 
      }, 
      [21012] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Luke Street\
\13        - To Security Road\
\13East  - The East Docking bay of Akatmer\
\13South - Luke Street\
\13        - To Trading Post Street\
\13        - To Law Avenue\
\13West  - Barster Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21012, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street is to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21011, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "To the east is the eastern Docking bay.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21113, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "You can see Luke Street stretch far to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21013, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "Barster Road lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21038, 
               Key = -1, 
            }, 
         }, 
         Description = "&B You stand at the intersection of Barster Road and Oceanview Street.  To\
the east you can see the massive east Docking bay of Coral City. This is\
one of the main smuggling bay's of the city.While Oceanview Street lies to\
the north and south, and Barster Road runs west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Barster Road and Oceanview Street", 
      }, 
      [21013] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21013, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road and Luke Street cross just north of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21012, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Trading Post  and Luke Street intersection is south of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21014, 
               Key = -1, 
            }, 
         }, 
         Description = "&B You take a brief pause on your way down Oceanview Street, and you can\
hear the chirping of some strange bird like creature  coming from the\
other side of the extending breakwall.  Upon catching your breath from the\
salty air, you gather  your belongings and continue on your way.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Oceanview Street", 
      }, 
      [21014] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Luke Street\
\13        - To Barster Road\
\13        - To Security Road\
\13South - Luke Street\
\13        - To Law Avenue\
\13West  - Trading Post Street\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21014, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street lies in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21013, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Luke Street stretches southward as far as the eye can see.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21015, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The Trading posts of Akatamer await your arrival and Credits.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21050, 
               Key = -1, 
            }, 
         }, 
         Description = "&B You stand at the intersection of Trading Post Street and Luke Street.\
You look out and can see the waves crash upon the breakwall To the west\
are the glorious pavilions and shops of Coral City, while Oceanview Street\
continues to the north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Trading post Street and Oceanview Street ", 
      }, 
      [21015] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21015, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Trading post Street and Luke Street meet to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21014, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Gazing southward, you see the southeastern corner of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21016, 
               Key = -1, 
            }, 
         }, 
         Description = "&B This portion of Oceanview street allows you see rest and watch one of\
the two suns set. Two crome like  benches sit on opposite sides of the\
polished rock road, enticing you to rest.  You can see Law Avenue meeting\
up with Oceanview Street to the south, while to the north is the Trading\
Post Street  and Oceanview Street intersection.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Oceanview Street.", 
      }, 
      [21016] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Luke Street\
\13        - To trading Post Street\
\13        - To Barster Road\
\13        - To Security Road\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21016, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street lies to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21015, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6905, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue lies to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21017, 
               Key = -1, 
            }, 
         }, 
         Description = "&WOceanview  Street and Law Avenue come together here to form one of the\
four corners of Coral City. This attractive street recived it's name\
\
becasue the creators of the city's layout placed it on a hill allowing you\
to look at the ocean.Oceanview Street lies to the north, while Law Avenue\
stretches westward.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Meeting of Oceanview Street and Law Avenue ", 
      }, 
      [21017] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Companions and Mounts\
\13East  - Law Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21017, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Law Avenue joins Luke Street to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21016, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Law Avenue stretches westward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21018, 
               Key = -1, 
            }, 
         }, 
         Description = "&WYou are walking down the newly paved Law Avenue, the road which lines the\
southern wall of Coral City recives constant traffic and is ofen the\
center of attraction.  The dust  here seems wet and muddy. you must be\
getting closer to the ocean  To the east is one of the four corners  of\
Coral City, while Law Avenue continues westward. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Law Avenue", 
      }, 
      [21018] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The plaque reads: 'May you rest in peace, Ghett of S.P.I.N..'\
\13", 
               Keyword = "plaque", 
            }, 
            [2] = 
            {
               Description = "In honor of the late GHETT, founder of the special forces team S.P.I.N.\
\13True friend, and hero to all of us. \
\13", 
               Keyword = "statue ", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21018, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21138, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The road extends eastward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21017, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue stretches westward as far as the eye can see.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21019, 
               Key = -1, 
            }, 
         }, 
         Description = "&W A tall statue attracts your attention on this portion of Law Avenue. \
The platiki metallic  sculpture is of a Calamrian in his late years\
wielding a E-web Blaster against an unseen attacker, although from the\
man's posture it is obvious that his opponent was enormous.  A small\
golden plaque sits near the statue, explaining its importance.  The newly\
paved road stretches both east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Law Avenue", 
      }, 
      [21019] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Jawa Traders\
\13East  - Law Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21019, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21051, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21018, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Anna Avenue and Law Avenue cross to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21020, 
               Key = -1, 
            }, 
         }, 
         Description = "&W Walking on Law Avenue you pass a building that explains the roads name,\
City Hall. It is here you goto pay tickets and fines, along with chat with\
\
the mayor. The building which stands over 300 ft high is made of fine\
polished granite imported from a nearby moon. It's extravegent\
\
look;matches the city's over rehaul plan. The walkway leading up to the\
building has polished stones buried into the ground to create a peaceful\
walkway.  Plants from nearby planets are now growing along side the\
walkway to make it more inviting. Unfortunately the interior is not yet\
finished so you can not take a tour.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Law Avenue", 
      }, 
      [21020] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anna Avenue\
\13        - To Trading Post Street\
\13        - To Barster Road\
\13        - To Security Road\
\13        - To Akatamer Square\
\13East  - Law Avenue\
\13        - To Luke Street\
\13South - The Southern Docking bay of Akatamer\
\13West  - Law Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21020, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "To the north is Anna Avenue.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21044, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "You see the legendary Law Avenue.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21019, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "To the south is Akatamer's southern Docking bay.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21074, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "Law Avenue extends to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21021, 
               Key = -1, 
            }, 
         }, 
         Description = "&W You stand at the intersection of Anna Avenue and Law Avenue.  Gazing to\
the south, you see the massive south Docking bay of Coral City. It is\
there most new traders enter the city. It also there that new bounty\
hunters enter. The newly covered roads of Anna Avenue and Law Avenue lie\
in the four cardinal directions.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Anna Avenue and Law Avenue", 
      }, 
      [21021] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Akatamer square\
\13\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21021, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21073, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue and Anna Road cross to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21020, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue ranges to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21022, 
               Key = -1, 
            }, 
         }, 
         Description = "&W You are traveling down one of the newly covered section of Law Avenue at\
a brisk pace. To the north is the Mon Calamrian Factory , a building known\
throughout the the world for its rare metal melting.  You feel almost like\
paying the building a visit.  Law Avenue extends to the east and west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Law Avenue", 
      }, 
      [21022] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anikeim's fashion  Clothing\
\13West  - Law Avenue\
\13        - To Monock Road\
\13East  - Law Avenue\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21022, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A fashion shop is situated to the north.\
", 
               Keyword = "door", 
               DestinationVnum = 21066, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue extends to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21021, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue stretches westward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21023, 
               Key = -1, 
            }, 
         }, 
         Description = "&W You are walking down a rather commercial part of Law Avenue. Merchants\
and droids hassle you to spend your credits as you attempt to continue on\
your way. Glancing to the north, you see  the only shop worth visiting,\
owned by the respectable Lokist the Tailor.  Law Avenue stretches to the\
east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Law Avenue", 
      }, 
      [21023] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - An Abandoned defense building\
\13        - To the Guild of Pilots\
\13\
\13West  - Law Avenue\
\13        - To Monock Road\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21023, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               DestinationVnum = 21186, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21022, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue clashes with Monock Road to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21024, 
               Key = -1, 
            }, 
         }, 
         Description = "&W This stretch of Law Avenue is well trimed and well kept, like most of\
the streets now in Coral City.  Looking northward, you see a small defense\
building that looks like it saw some where and tear twenty years  ago.\
Most of the remains are unenterable.  The lengthy polished rock road\
extends to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Law Avenue", 
      }, 
      [21024] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Monock Road\
\13        - To Trading Post  Street\
\13        - To Barster Road\
\13        - To Security Road\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21024, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road lies to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21025, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21023, 
               Key = -1, 
            }, 
         }, 
         Description = "&W Monock Road and Law Avenue come together here to form one of the four\
corners of Coral City.  A metal staircase leads up onto the main city's\
Security Post, from where even the strongest Imperial Stormtrooper  can be\
repelled. Monock Road lies to the north, while Law Avenue stretches\
eastward.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Meeting of Monock Road and Law Avenue", 
      }, 
      [21025] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Monock Road\
\13        - To Security Road\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13East  - Thieves Alley\
\13        - To the Guild of Thieves\
\13South - Monock Road\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21025, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Thieves Alley is east of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21026, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The Thieves Alley is east of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21063, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "One of the four corners of Akatamer is located to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21024, 
               Key = -1, 
            }, 
         }, 
         Description = "&p You pick up your pace as you travel down this portion of Monock Road.\
\
Gazing eastward, you see what is easily the darkest alley in the city,\
though a glimmer of light can be seen flickering in the shadows of the\
slim street.  To the north is an intersection, while Monock Road continues\
to the south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Monock Road", 
      }, 
      [21026] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Monock Road\
\13        - To Security Road\
\13        - To Barster Road\
\13East  - Trading Post  Street\
\13South - Monock Road\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21026, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road lies in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21027, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "You gaze at the pavillions and shops of Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21045, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "To the south is Monock Road.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21025, 
               Key = -1, 
            }, 
         }, 
         Description = "&Y You stand at the intersection of Trading Post  Street and Monock Road. \
A wall towers over you to the west, keeping intruders (mostly Quarren) out\
of Coral City unannounced.  To the east are the newly built shops of Coral\
City, while Monock Road continues to the north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Trading Post  Street and Monock Road", 
      }, 
      [21027] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21027, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road and Monock Road cross to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21028, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Trading Post  Street and Monock Road cross just south of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21026, 
               Key = -1, 
            }, 
         }, 
         Description = "&p You are walking down a poorer section of Monock Road.  The carved rock\
roads  seem unkept and poorly made, definitely unusual in this city which\
represents hope and order.  The street ranges to the north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Monock Road", 
      }, 
      [21028] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "West  - The Western Docking bay of Akatamer\
\13South - Monock Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13East  - Barster Road\
\13        - To Akatamer Square\
\13North - Monock Road\
\13        - To Security Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21028, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The metallic streets of Monock Road lie to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21029, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Walking in this direction will lead you into the very heart of the city.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21041, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21027, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "To the west is the west Docking bay of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21088, 
               Key = -1, 
            }, 
         }, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in the four cardinal directions.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Barster Road and Monock Road", 
      }, 
      [21029] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21029, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road stretches northward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21030, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The intersection of Barster Road and Monock Road is south of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21028, 
               Key = -1, 
            }, 
         }, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in two directions north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Monock Road", 
      }, 
      [21030] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21030, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road extends northward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21031, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21067, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Monock Road stretches southward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21029, 
               Key = -1, 
            }, 
         }, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not palnning to tackle for awile. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Monock Road", 
      }, 
      [21031] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21031, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road meets with Security Road to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21032, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21030, 
               Key = -1, 
            }, 
         }, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not planning to tackle for awile.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Monock Road", 
      }, 
      [21032] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East - Security Road\
\13        - to Anna Avenue\
\13        - to Luke Street\
\13South - Monock Road\
\13        - to Barster Road\
\13        - to Trading Post  Street\
\13        - to Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21032, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21033, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21031, 
               Key = -1, 
            }, 
         }, 
         Description = "&R Monock Road and Security Road come together here to form one of the four\
corners of Coral City.  From here you can smell the ocean sea salt form\
the nearby breakwall to the west. It reminds you of the fun you have\
swimming in the huge ocean that surrounds this city. Monock Road lies to\
the south, while Security Road stretches \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Meeting of Monock Road and Security Road", 
      }, 
      [21033] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21033, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road stretches eastward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21034, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road and Monock Road meet to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21032, 
               Key = -1, 
            }, 
         }, 
         Description = "&RYou stand on  Security Road staring at the two suns or the stars above\
your head, depending on time.  This newly paved street is made of polished\
rock that glimers when the first sun comes up. In the distence you can see\
Mon Calamrian children playing in the nearby park. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Security Road", 
      }, 
      [21034] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21034, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21035, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21131, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Security Road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21033, 
               Key = -1, 
            }, 
         }, 
         Description = "&RYou travel down a newly lanscaped area of Security Road.  In the new park\
created to the south you can hear strange animal noises that remind you of\
the days back when you used to go to the galactic zoo.  The mysterious\
melody relaxes you as you start to whistle with the birds in a city of\
peace and goodness.  Security Road stretches east and west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Security Road", 
      }, 
      [21035] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21035, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The intersection of Anna Avenue and Security Road is east of here.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21004, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road stretches westward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21034, 
               Key = -1, 
            }, 
         }, 
         Description = "&R You are walking cautiously through this part of Security Road.  Lately\
you have heard rumors of thieves prowling these parts, mocking the very\
name of the road.  But that is mostly not likely. The newly paved street\
\
ranges to the east and west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Security Road", 
      }, 
      [21036] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - The Archives\
\13        - To the Legendary Stories of the Archives\
\13        - To the Predictions of the Archives\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21036, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road stretches onward in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21037, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road to the west leads to Akatamer Square.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21000, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east and west is the  Barster Road  \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Barster Road", 
      }, 
      [21037] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - Akatamer Tower of jedi's \
\13        - To the Guild of Jedimasters\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21037, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21038, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The enterence to Akatamer's Tower of Jedi's are to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21126, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21036, 
               Key = -1, 
            }, 
         }, 
         Description = "&c While walking Barster Road, you gaze up at the Akatamer medical\
facility, whose entrance lies to the south. New plantlife grows along side\
the road,&G adding a buitiful haze of green. &c The lengthy rock carved\
out road stretches to the east and west.&x\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Barster Road", 
      }, 
      [21038] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - Akatamer Academy\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21038, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The intersection of Barster Road and Luke Street lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21012, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               DestinationVnum = 21133, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road stretches to the west as far as the eye can see.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21037, 
               Key = -1, 
            }, 
         }, 
         Description = "&c Young and giddy Mon Calmarians pass you as you travel this portion of\
Barster Road.  Gazing southward, you see the illustrious Coral City\
Academy, which has the responsibility of educateting new Mon Calamarian's.\
 The newly carved rock road of Barster  continue to the east and west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Barster Road", 
      }, 
      [21039] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - Western Hall\
\13West  - Barster Road\
\13        - To Monock Road\
\13\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21039, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road to the east leads to Akatamer Square.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21000, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Barster Road stretches onward as far as the eye can see.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21040, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east is Coral City Square, while Barster Road\
leads on to the west.   \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Barster Road", 
      }, 
      [21040] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - The hotel \
\13West  - Barster Road\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21040, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road stretches further eastward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21039, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The town hotel  awaits.\
", 
               Keyword = "door", 
               DestinationVnum = 21069, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road stretches further westward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21041, 
               Key = -1, 
            }, 
         }, 
         Description = "&cHere the city's only and extremly large  Hotel stands to the south It was\
constructed fromt he remains of crashed space vessel. It is considered\
sheek to stay in this coverted junk heap (Who figures?)You make note to\
remember  this location for later.  Gazing to the east and west, you can\
see nothing but Barster Road. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Barster Road", 
      }, 
      [21041] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - The Grim Smile\
\13West  - Barster Road\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21041, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21040, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The tavern lies to the south.\
", 
               Keyword = "door", 
               DestinationVnum = 21068, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road and Monock Road cross to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21028, 
               Key = -1, 
            }, 
         }, 
         Description = "&c Cheery laughter can be heard in this section of Barster Road.  Listening\
closely, you are not surprised to find the laughter coming from the\
Cantinia to the south.  People from differnt planets passing by also seem\
interested in those who can find joy in these dark times. This tavern is\
best place to find new friends, bith good and evil. Barster Road ranges to\
the east and west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Barster Road", 
      }, 
      [21042] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21042, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road to the north leads to Akatamer Square.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21000, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A bustling intersection lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21043, 
               Key = -1, 
            }, 
         }, 
         Description = "&PYou are travelling upon the southern portion of Anna Avenue.  The newly\
constructed buildings of the Coral City Trading Post street rise high into\
the air to the east and west.  The metallic road stretches to the north\
and south, where you can see a bustling intersection of Mon Calamrian\
shopers.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Anna Avenue", 
      }, 
      [21043] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anna Avenue\
\13        - To Security Road\
\13        - To Barster Road\
\13        - To Akatamer Square\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - Anna Avenue\
\13        - To Law Avenue\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21043, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue lies to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21042, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21048, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Anna Avenue stretches to the south as far as the eye can see.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21044, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21047, 
               Key = -1, 
            }, 
         }, 
         Description = "&YYou stand at the intersection of Anna Avenue and Trading Post  Street. \
The intersection bustles with activity as citizens go about their\
business. To the east and west runs Trading Post  Street, lined with the\
exotic and local shops of Coral City, while Anna Avenue lies to the north\
and south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Intersection of Anna Avenue and Trading Post  Street", 
      }, 
      [21044] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anna Avenue\
\13        - To Trading Post  Street\
\13        - To Barster Road\
\13        - To Security Road\
\13        - To Akatamer Square\
\13West  - Thieves Alley\
\13        - To the Guild of Thieves\
\13South - Anna Avenue\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21044, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Intersection of Anna Avenue and Trading Post  Street\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21043, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The intersection of Anna Avenue and Law Avenue lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21020, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "You can't make out any details about the dark alley.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21065, 
               Key = -1, 
            }, 
         }, 
         Description = "&PWhile traversing the busy, smooth carved road of Coral City, you notice a\
\
particularly dark alley to the west which citizens commonly avoid. As  you\
 imagine running into a cloaked thief lurking in the shadows. Anna Avenue\
extends to the north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Anna Avenue", 
      }, 
      [21045] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Scribe's Tent\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - The Shining Emerald\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13Anikiem's Rocks - CLOSED - due to hi shipping costs.\
\13 \
\13I have moved closer to the mines to increase my profits.\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21045, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21046, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A jewelry shop has been set up in the tent to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21052, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Trading Post  Street meets up with Monock Road to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21026, 
               Key = -1, 
            }, 
         }, 
         Description = "To the north is where a rock seller used to hold shop, on the door is a\
small sign. it does keep your wife happy. Trading Post  Street extends to\
the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Trading Post  Street", 
      }, 
      [21046] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Spide Dealer\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - The Akatamer Courier\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21046, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The Spice Trader's is to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21054, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21047, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "The Akatamer mail service is situated in a building to the south.\
\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21053, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "More shops attract your attention to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21045, 
               Key = -1, 
            }, 
         }, 
         Description = "&YCitizens of Coral City waddle  around you, anxious to finish their\
shopping. Gazing northward, you can see a female Rodian drying a multitude\
of spices, while to the south you see Coral City's courier service. \
Trading Post  Street ranges to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Trading Post  Street", 
      }, 
      [21047] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Hermit's Tent\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - Map Builders\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
            [2] = 
            {
               Description = "Sorry due to costs of shipping I have moved my shop below closer to the\
\13mine.\
\13", 
               Keyword = "note", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21047, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "You see the intersection of Anna Avenue and Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21043, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A mapmaker store lies to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21056, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "More shops attract your attention to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21046, 
               Key = -1, 
            }, 
         }, 
         Description = "&YThe newly carved polished stone rock road is buzzing with activity. \
Eager shouts from numerous new buildings encourage potential customers to\
come inspect a shopkeeper's;wares.  To the north is Anikem's new shop,\
while a Map Builder  just moved in to the south.  Trading Post  Street\
stretches to the east and west. \
There is a small note tacked up on the north door.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Trading Post  Street", 
      }, 
      [21048] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Bantha Barbecue\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Unlit Saber\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21048, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The barbecue stand lies in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21057, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention in this direction.\
\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21049, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "You can see a stocky Mon Calamrian repairing equipment.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21058, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "The intersection of Anna Avenue and Trading Post  Street lies to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21043, 
               Key = -1, 
            }, 
         }, 
         Description = "&YThe newly carved rock road is buzzing with activity.  Eager shouts from\
the newly built buildings encourage potential customers to come inspect a\
shopkeeper's wares.  To the north you can smaell the sweet aroma that is\
the Bantha barbecue Shop , while the building to the south is dedicated to\
repairing broken items.  Trading Post  Street stretches to the east and\
west.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Trading Post  Street", 
      }, 
      [21049] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Akatamer Bakery\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Bobba Wares\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21049, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "You can see a bakery to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21060, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21050, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "The Bobba waresis to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21059, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "More shops attract your attention in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21048, 
               Key = -1, 
            }, 
         }, 
         Description = "&YCitizens of Coral City scamper about you, eager to finish their shopping.\
The aroma of fresh bread assails your nose, coming from a bakery from the\
north, and you can see Armory clanging from the wind on the shop to the\
south.ity's armoury to the south.  Trading Post  Street ranges to the east\
and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Trading Post  Street", 
      }, 
      [21050] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Blue Milk Dairy Products\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Vibro-Fizz\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21050, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The dairy to the north deals in all blue milk dairy products.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21061, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Trading Post  Street joins up with Luke Street to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21014, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Weapons can be bought or sold in the store to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21062, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "More shops attract you in this direction.\
\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21049, 
               Key = -1, 
            }, 
         }, 
         Description = "&YYou smile at the familiar sight of Trading Post  Street and its glorious\
newly built buildings. The buzz of vibro-blades can be heard from the\
south, while the blue milk dairy is situated to the north.  Trading Post \
Street extends east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Trading Post  Street", 
      }, 
      [21051] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Interior of City Hall", 
         Vnum = 21051, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21019, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21052] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 100,000 credits 16 CHA\
\13Sorry ultima-pearls not included.\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "The Shining Emerald", 
         Vnum = 21052, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21045, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O A locked display box dominates this particular shop.  Under the glass of\
the box are two of the only three known ulti-ma pearls in existence., each\
lying gently upon a miniscule cushion. Various other items are displayed\
in differnt boxes. Hanging from the walls are various paintings, while\
sculptures take up the rest of the floor space. A north door leads back\
out onto Trading Post Street.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [21053] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Mail Service is Governemnt Own sorry!\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "Coral City Courier Office", 
         Vnum = 21053, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "An opening in the building leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21046, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O An immense computer set against the southern wall of the Building has\
been organized into small consoles, each containing letters to and from\
the citizens of Coral City through Star mail.  Errand boys are constantly\
coming in and collecting disks for delivery.  In the center of the room is\
a large glatic_net mail terminal where people from around the world can\
send mail. A door to the north leads back out onto Trading Post  Street .\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [18] = "NoDrop", 
            [3] = "Indoors", 
         }, 
      }, 
      [21054] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 50,000 Must be a smuggler of 40\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "The Spice dealer", 
         Vnum = 21054, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21046, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OThis newly contructed building is filled with the scent of dried spices.\
Wooden shelves are lined with spices, each of varying colors. A counter\
sits in the center of the room. Walking nearer, you notice a small plaque\
on the counter which reads 'Success lies in Spices'. Dispite numerous\
attempts to outlaw spices , they are still legal in this city. A door\
south leads back out onto Trading Post  Street.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21055] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Not for Sale\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         Name = "Anakiem's Rocks", 
         Vnum = 21055, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6882, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O A musty odor fills your nostrils as you inhale.  Shelves hug the walls\
of this newly created building, each shelf filled with  items from the\
mines or ocean floor.  As you begin to inspect several of the shelves, you\
notice they are all covered in dust and dirt.  A square wooden counter\
sits in the center of the room, and to to the south a door leads back out\
onto Trading Post  Street. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21056] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 50,000 credits Wis 16\
\13Also Mon Calamarian\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         Name = "Maps", 
         Vnum = 21056, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21047, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OYou find yourself in a rather small and empty shop.  Parchments tied into\
neat packs lie about in an unorganized manner in the back corner.  A\
counter in the center of the room houses numerous state of the art\
Holo-Maps, as well as a couple more computer writing tools. This thin\
printer is havinga hard time converting to new technology, and is even\
contemplating retiring. A door to the  north leads back out onto Trading\
Post  Street. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21057] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "The Bantha Barbecue Shop", 
         Vnum = 21057, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "An opening in the tent allows you to return to Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21048, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OThe smell of fresh meat grilled to a perfection as only chef Wannie knows\
how is present in the air of this shop.  Kept cool in frosted vaults, the\
city chef sells his meats here, imported from planets far distant or\
harvested form the ocean. There are a few tables scattered around for you\
to sit at, and share stories with your friends.Through the door to the\
south is Trading Post  Street.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21058] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 38.000 credist \
\13Must be Engineer of 50\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         Name = "The Unlit saber", 
         Vnum = 21058, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21048, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O You stand within the modernized building of the city's Repair tech. On\
the floor behind the counter you can see various pieces of Equimpment; a\
poor fellow distroyed. ; Most of Torvals's business is from the military,\
although he does do some private sector every once in awile.  A door north\
leads back out onto Trading Post  Street. \
\
To repair obj or weapon type:  repair (obj)\
\
Sorry there is a small fee for the job.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21059] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 80,000 plus a Dinner with Bobba Fett\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "Bobba's wares", 
         Vnum = 21059, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21049, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O This Mon Calamarian is a dedicated creator of armor and shields.  Having\
lost her son to shabby equipment, she took up the job of putting\
protective suits of armor together. She is also  extremly infatuated with\
the legendary Bobba Fett, and collects any holographics  or drawings of\
this great Bounty Hunter. The enterance leads back out north onto Trading\
Post  Street.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21060] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 28,000 And a Love for Bread\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "The Akatamer Bakery", 
         Vnum = 21060, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21049, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OUpon entering the Akatamer Bakery, you find yourself surrounded by\
citizens of the marvelous city, each waiting in line for their daily\
bread. This Mon Calamrian is famous for his fine baked bread made from\
refined seaweed. This green food is terrific with every meal. The door to\
the south leads back out onto Trading Post  Street. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21061] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 28,000 credits a you must marry off His daughter.\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "The Blue Sea-Cow", 
         Vnum = 21061, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21050, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OThis small shop smells strongly of blue cheese, as dozens of types of\
cheeses have been laid out and labeled properly on several long shelves. \
You notice many bottles of blue milk, considered to be more important than\
even water, carefully stacked in the northeast corner.  This Mon girl is\
staioned here by here father to sell this rare drink froma seacow. Through\
the door Trading Post  Street lies to the south.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21062] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 89,000 credits and Engineering\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "Vibro-Fizz", 
         Vnum = 21062, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21050, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&ORacks line the walls of this store, each filled to the brim with weapons.\
You grin evilly at the items of destruction, and try out a couple on the\
practice dummies hung from the ceiling.  A counter in the center of the\
room is where the keeper of this shop does business.  He is an extremly\
large calamarian who knows his stuff. The door to the north leads back out\
onto Trading Post  Street.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21063] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21063, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21064, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Monock Road lies to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21025, 
               Key = -1, 
            }, 
         }, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Thieves Alley", 
      }, 
      [21064] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21064, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21065, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21063, 
               Key = -1, 
            }, 
         }, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Thieves Alley", 
      }, 
      [21065] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21065, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Anna Avenue lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21044, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21064, 
               Key = -1, 
            }, 
         }, 
         Description = "You are walking through a particularly dark and unkempt alley of Akatamer.\
Whomp rats scurry across the metallicground, squeaking at you.  Empty crates and\
tattered rags are lying about.  The alley opens up to Anna Avenue to the\
\
east, while to the west the darkness deepens.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Thieves Alley", 
      }, 
      [21066] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Annir's Clothing", 
         Vnum = 21066, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "The door leads back out onto Law Avenue\
", 
               Keyword = "door", 
               DestinationVnum = 21022, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [3] = "Secret", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "hatch", 
               DestinationVnum = 21180, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O The shop you have entered smells heavily of dried bantha leather. \
Gazing about, you see all manners of clothing, from leather to silk.  A\
coral counter lines the northern wall of the shop, and several stalls line\
the eastern wall, where you can try on your clothes (after you pay for\
them.).  A door to the south leads back out onto Law Avenue. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21067] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Companions and Mounts", 
         Vnum = 21067, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21030, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&O You walk into a large shop which smells of Banthas.  Behind the long\
wooden counter are dozens of cages containing varying types of animals. \
You can hear the sounds of creatures coming from a store room in the back\
of the shop.  A path to the west leads back out onto the busy Monnock St.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [21068] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "The Tavern", 
         Vnum = 21068, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A door leads out onto Barster Road.\
", 
               Keyword = "door", 
               DestinationVnum = 21041, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The hotel  lies to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21069, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OYou enter the city's lavish cantinia, in fact the only bar inside the\
city;itself, appropriately connected to the city's hotel  to the east\
through a hallway. That way visitors can just get drunk then head over to\
bed. Smoke and the smell of alcohol mix with laughter, quickly gives you a\
dull headache. To the east is the town hotel , while the fresh air of the\
\
outdoors stands at bay to the north.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21069] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Name = "The Akatamer hotel ", 
         Vnum = 21069, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road lies to the north.\
", 
               Keyword = "door", 
               DestinationVnum = 21040, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The tavern lies to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21068, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&OHere a weary traveller can seek a good rest in comfort without fear of\
theft or, worse yet, murder.  A long counter stretches across much of the\
room, and for a few credits the hotel keeper will gladly rent you one of\
his rooms.  Drunken laughter emerges from a hall to the west.  To the\
south beyond a door barred by the hotel keeper are the rooms.\
 \
You may safely quit here.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [21071] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "&C Inside Bacta Tank", 
         Vnum = 21071, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21127, 
               Key = -1, 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         Description = "This room is for the severly wounded. Please donot take advantage of this\
great Facility or the Mon Calamarian Officals will have to remove the\
bacta tank. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your\
body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [21072] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Restarea", 
         Vnum = 21072, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21100, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z This lavish room comes complete with plush bantha leather seat benches.\
A brand new drinking fountain that diperses fresh salt water for drinking.\
And a new cooking droid here to serve some of the great Mon Calamari food.\
The floor is a soft grey colored marble like rock sanded to a smooth\
surface. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [21073] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Factory Enterence", 
         Vnum = 21073, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21151, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21021, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c &C You stand before huge doors of the Krantz mining ore factory complex.\
 the doors are kept closed, yet the bared windows are cracked open to give\
all the heat and noise inside a means of escaping.  The doors are made of\
some sort of black metal, most likely found on the ocean floor  seemingly\
impenatrable, and has the Krontz symbol K carved into them  You are not\
sure if the doors are meant to keep intruders out, or workers in...\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [21074] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside the Southern Docking bay", 
         Vnum = 21074, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Two roads cross to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21020, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Docking bay leads outside of Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21075, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21073, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z You stand inside the southern Docking bay of Coral City. Ships of all\
sizes line the many enterences.There is only four docking bays on Mon\
Calamari that is known to the public and all four exsist on the outskirts\
of the city. They were originally created as Imperial Slave ports but were\
later converted to Docking bays.To the north is the intersection of Anna\
Avenue and Law Avenue.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21075] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Searching thoroughly, you discover a manhole hidden beneath one of the\
\13many harbor edges.\
\13", 
               Keyword = "foliage", 
            }, 
         }, 
         Name = "Outside the Southern Docking bay", 
         Vnum = 21075, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21074, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21073, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "A path begins to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21123, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "A path begins to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21076, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the eastand west. While to the north you\
can hear the sounds of ships landing and taking off.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21076] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21076, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "To the east the southern Docking bay of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21075, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21077, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
\
the city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road west of the Southern Docking Bay", 
      }, 
      [21077] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21077, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21076, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21078, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You are on carved out rock road rounding the southern wall of Akatamer.\
The familiar sound of running water emanates from the Mon Calamarian ocean\
to the south. The large breakwater was created to keep the nasty wind\
storms that come up from spalshing 50 ft. waves upon the city.  The road\
stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21078] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21078, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21077, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The trail continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21079, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21079] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21079, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21078, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21080, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can hear the\
ocean getting nearer to the west.  \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21080] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21080, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21079, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21081, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can see the ocean\
front just off a dock to the west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21081] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21081, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A path begins to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21082, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "A road begins to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21080, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6908, 
               Key = -1, 
            }, 
         }, 
         Description = "&c  You have come to the western most spot of the city. before you is a\
large dock leading out to the ocean..  Its supports are cracked,and the\
entire structure seems liable to fall into the ocean at any moment. To the\
north and east are two plain man made roads. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Before the Dock", 
      }, 
      [21082] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21082, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21083, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The trail continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21081, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21083] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21083, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The trail continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21084, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21082, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.You look into the sky\
and see a common Mon Calamarian bird above.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21084] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21084, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21085, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21083, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21085] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21085, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21086, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21084, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21086] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21086, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The western entrance to Akatamer lies to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21087, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Water Shuttle continues rounding the city wall of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21085, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road south of the Western Docking Bay", 
      }, 
      [21087] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Outside the Western Docking bay", 
         Vnum = 21087, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A path begins to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21089, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21088, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21070, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "A road begins to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21086, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the east you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21088] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside the Western Docking bay", 
         Vnum = 21088, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Two roads cross to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21028, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues deep into the metallic waste land s of Haon Dor.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21087, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21070, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z You stand in the western dockingbay, do to the massive damage this place\
took by the empire , only small shuttles can enter this docking bay. This\
platform was designed as a slave port for Mon Calamrian workers by the\
Empire years ago, but were later easily converted in to Docking Bay's for\
the Rebellion's greatest ship builder. You can hear the soft wind of the\
ocean to the west.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21089] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21089, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21090, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The western Docking bay is to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21087, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the south you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road north of the Western Docking Bay", 
      }, 
      [21090] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The sign reads:\
\13 Hail Mon Calamrian!  You stand before the Ocean, a\
\13...which is populated by one of the smaller races of \
\13the world.  Do Not enter this zone any further...\
\13We see no use for New Rebublic law now..\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21090, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21091, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21089, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21091] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21091, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21092, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21090, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21092] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21092, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21093, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The trail continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21091, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21093] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21093, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A gentle sea breeze is coming in from the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21094, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21092, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21094] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21094, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21095, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21093, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and south. \
\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21095] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21095, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21096, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21094, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21096] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "water and ocean plantlife lye on the top of the holodisk:\
\13You place the disk into your reader ,,,,it says :\
\13Akatamer's Time Will Come, Hail the New Empire.\
\13", 
               Keyword = "holodisk", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21096, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The trail continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21097, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21095, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21097] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21097, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21098, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21096, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
breeze from the ocean beyond.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21098] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21098, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Akatamer's northern Docking bay is to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21099, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21097, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
drop of water from the ocean beyond.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On the Road West of the Northern Docking Bay", 
      }, 
      [21099] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Outside the Northern Docking bay", 
         Vnum = 21099, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path begins to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21101, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Docking bay leads into Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21100, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21071, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The road begins to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21098, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the south you can\
hear alot of hustle and bustle of ships taking off.\
\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "field", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside the Northern Docking bay", 
         Vnum = 21100, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The Docking bay leads out of Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21099, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21071, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21072, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Two roads meet to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21004, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z You stand in the main docking bay of the planet Mon Calamari. This state\
of the art Dockingbay recently recived a facelift to allow for a better\
image of the planet. The floor is now a polished metal, that reflexs the\
extensive lighting system they installed. From the ceiling you can see new\
sprinklers to allow mon citizens to remain damp. This new facility was also\
outfitted with a restarea to the east for individuals waiting for the\
transport. To the North is outside the city. While to the South is the\
intersection of Anna Avenue and Security Road. We hope you enjoy your stay\
here at Coral City (formally Akatamer)!\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
      }, 
      [21101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21101, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The trail continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21102, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Akatamer's northern Docking bay is to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21099, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the west you can\
hear alot of hustle and bustle of ships taking off.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On the Road East of the Northern Docking Bay", 
      }, 
      [21102] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The sign reads:\
\13 Welcome to Akatamer - Upper World - City of Hope.\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21102, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21103, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21101, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21103, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21105, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The trail continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21102, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21105, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21106, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21103, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You see a Mon Clamrian\
bird soaring in the sky.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21106, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21107, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path stretches westward.\
\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21105, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the South and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21107] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21107, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path curves around the northeastern corner.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21106, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21108, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the eastern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from splashing 50 ft. waves upon\
the city.  The road stretches to the South and North. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21108] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21108, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The trail stretches northward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21107, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21109, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21109] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21109, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road heads northward.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21108, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road extends to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21110, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21110, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21109, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21111, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21111, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21110, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Akatamer's eastern Docking bay is to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21112, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the south you can\
\
hear starships taking off.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On the Road North of The Eastern Docking Bay", 
      }, 
      [21112] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Outside the Eastern Docking bay", 
         Vnum = 21112, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A path begins to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21111, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A road begins to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21114, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The Docking bay leads into Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21113, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21072, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the east you can hear\
starships taking off.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21113] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside the Eastern Docking bay", 
         Vnum = 21113, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The Docking bay leads out of Akatamer.\
", 
               Keyword = "Docking bay", 
               DestinationVnum = 21112, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21072, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Two roads cross to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21012, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z You stand inside the eastern Docking bay of Coral City.  This docking\
\
bay gets very little use, very little survalanice..and consequently is\
known for it's secretive cargo. To the west is the intersection of Barster\
Road and Luke Street. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21114] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21114, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The eastern Docking bay is to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21112, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21115, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the north you can\
hear starships taking off.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On the Road South of The Eastern Docking Bay", 
      }, 
      [21115] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21115, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The trail continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21114, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21116, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21116] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21116, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21115, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21117, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21117] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21117, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21116, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21118, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21118] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21118, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21117, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21119, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. You can feel a soft mist\
coming from the ocean.\
\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21119] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21119, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21118, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21120, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the eastern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the north. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and North. You\
can feel a soft mist coming from the ocean.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21120] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21120, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21119, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21121, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21121] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21121, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21120, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21122, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21122] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21122, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21121, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21123, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You walk briskly on carved out rock road rounding the southern wall of\
Akatamer.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the south. The large breakwater was created to keep\
the nasty wind storms that come up from spalshing 50 ft. waves upon the\
city.  The road stretches to the east and west. \
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21123] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 21123, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21122, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21075, 
               Key = -1, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can feel brief\
splashes of water as the ocean spills over the breakwall.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21124] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "An Empty Home", 
         Vnum = 21124, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21123, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "To the west is the southern Docking bay of Akatamer.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21075, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [21126] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "&p Mon Calamri Medical Facility", 
         Vnum = 21126, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road is to the north.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21037, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Tower of Mon Calamri lies to the south.\
", 
               Keyword = "door", 
               DestinationVnum = 21127, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c Before you is a large plain rock building used for healing the sick. The\
rock surface was once a coral underwater creature but is now a memorial to\
what once was. Here you can enter and recive top of the line treatment,\
from some of the greatest medical minds in the galexy. &R The pathway was\
properly framed with imported red plantlife. &c This is another one of\
those steps the new city officols are doing to clean up this city.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [21127] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&R due to money shortages we no longer can allow free\
\13treatment.\
\13 \
\13To enter the north you must first give the 100 credits to the Sec.\
\13 \
\13Sorry we no longer take Glactic Insurance.\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         Name = "&pWithin the Mon Calamri Medical Facility", 
         Vnum = 21127, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21126, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21129, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "An immense library is at the end of the corridor to the west.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21128, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&C You walk beneath the impossibly high arches which support the Mon\
Calamari Medical facility.  Walls crafted of smooth coral rock are covered\
with extravegant Calamrian art which create a dazzling array of shimmering\
colors.  A inpatient desk lies in the center of the room, so one can check\
in. To the west is the waiting room. To the east is the medical supply\
store While the south leads to the main Bacta tanks. There is a sign at\
\
the enterance to the south. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [21128] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Waiting Room", 
         Vnum = 21128, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The corridor leads back to the main hall.\
", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21127, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c This room while not highly decorated is a perfect place for adventurers\
who are grouping with a injured partener. The floor is a well polished and\
clean coral rock. While the walls are decorated with hand drawn pictures\
from Mon Calamarian children. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [21129] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Medical Supply Store", 
         Vnum = 21129, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21127, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&C This small area of the building was sectioned off to allow travelers to\
Mon Calamari the option to purchase medical equipment. The walls are a\
polished coral rock which give off a pinkish reflection. The floor has a\
\
medical track on it to allow easy transport of victims to and from areas\
of the Medical facility. To the West is the Main hallway\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [21130] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "There apears to be a small residue of dirt trailing from the entrance to\
\13the north east corner\
\13", 
               Keyword = "dirt ", 
            }, 
         }, 
         Name = "New Rebublic Mon Headquaters", 
         Vnum = 21130, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21009, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z This high tech space appears to have no exits except for the main door.\
The walls are a smooth pink coral surface decorated with pictures and\
space charts. There appears to be dirt on the checkered pattern floor and\
a small lighting unit is suspeneded from the ceiling.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
      }, 
      [21131] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Please fell free to stop by at anytime, just DON\"T leave your children\
\13here, unattended.\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         Name = "Coral City Park", 
         Vnum = 21131, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21034, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21135, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21134, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21137, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&G A attractive black metal gate frames the enterence to Coral City's\
newest relaxation area. The Security Park, is home to a few rare \
creatures flown in and captured by customs. Due to the lack of space for\
storage , city officals created this new park for them to roam around in.\
It also allows for Mon Calamarian youth to have a safe and fun place to\
play in. There is a large sign above the metal frame that welcome's all to\
the park.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [21132] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Lobby", 
         Vnum = 21132, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21139, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21005, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21145, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z You enter the main office of the Mon Calamari Security. This room is\
slightly, less extravegant then the rest, and has more of a rough ocean\
bottom feel. The walls  are decorated with pictures of wanted men, and the\
floors are polished rock that imitates a marble look. This rock was\
inported from the depths of the ocean floor. In front of you is a large\
counter to which you see alot of people working behind. At the counter is\
a sign that says step up for assistance.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
      }, 
      [21133] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Coral City Academy", 
         Vnum = 21133, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21038, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21134] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Coral City Park", 
         Vnum = 21134, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21135, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21131, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21136, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for it's\
durablity and groth rate. Both of which will be need to maintain the\
trampling and activity it will see. This grass like surface is new to Mon\
Calamarians and they find it extremely interesting, while the Quarren's\
find it just frivlous. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21135] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Coral City Park", 
         Vnum = 21135, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21131, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21134, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21136, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21137, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  You can see a large white leafed tree\
sitting in the middle of the park.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21136] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Coral City Park", 
         Vnum = 21136, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21135, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21134, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21137, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  There is a large brown fence keeping the\
animals and people in surrounding  the edge of the park\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21137] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Coral City Park", 
         Vnum = 21137, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21135, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21131, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21136, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&GThis area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  There is a large fence that surrounds\
the area to keep animals and people in.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21138] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "First Bank of Mon (Main Branch)", 
         Vnum = 21138, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21018, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z This marble like surfaced bank allows for easy transactions between you\
and your currencey. There is a large table in the center of the room to\
sign your life away along with, a counter towards the back where a very\
attractive clerk stands and counts the daily inflow of credits. On the top\
of the ceiling you can see a rather expensive security system tracking\
your everymove. The First bank of Mon's motto isn't \"your money is safe\
with us for no reason.\" To make a bank transaction please type bank.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
            [30] = "Prototype", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [21139] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Corridor", 
         Vnum = 21139, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "Door", 
               DestinationVnum = 21140, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 21428, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21150, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21132, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The damp hallway is a dark grey with light grey flashes\
as you pass the cells. Very little activity occurs here as most criminals\
can't escape with over 20' of rock between them and the corridor. You  are\
safe and sure not to hear any of them. There is a large bashproof door to\
the east with an electronic doorslides for safty.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [21140] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Corridor", 
         Vnum = 21140, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21141, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21139, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21149, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21141] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Corridor", 
         Vnum = 21141, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21148, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21140, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21142, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21142] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Corridor", 
         Vnum = 21142, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21141, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21147, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21143, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21143] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Corridor", 
         Vnum = 21143, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21146, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21142, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21144, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21144] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Corridor", 
         Vnum = 21144, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21143, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               DestinationVnum = 21145, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21145] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Chief Security Officer's Office", 
         Vnum = 21145, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               DestinationVnum = 21144, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [23] = "BashProof", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21132, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The chief of security's office is now vacant. As the last chief was ordered\
to leave by the Crime Syndacate Mon Calamari is currently looking for a\
BRAVE security officer to replace him. If interested please contact\
Ackbar. Sorry you must be Mon Calamari to fulfill duties\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21146] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&R George Lucas\
\13&x\
\13", 
               Keyword = "patch", 
            }, 
         }, 
         Name = "Cell Block 1138", 
         Vnum = 21146, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21143, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 21140, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21147] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cell Block 1139", 
         Vnum = 21147, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21142, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21148] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cell Block 1140", 
         Vnum = 21148, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21141, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21149] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cell Block 1141", 
         Vnum = 21149, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21140, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
      }, 
      [21150] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "There is a state of the art computer panel with a televison screen for each\
\13cell\
\13block.\
\13In the center of the computer panel is a large lever.\
\13", 
               Keyword = "computer", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "lever", 
            }, 
         }, 
         Name = "Security Station", 
         Vnum = 21150, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21139, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z This small cubicle is where a very alert and strong guard stays at\
attention. For it is here that the main door opens from and allows access\
to the jail cells. There is a small computer panel on the wall surrounded\
by laser proof glass panels. There is also a large swival chair with a\
recline feature.  The walls and floors are smooth surface unlike the\
surrounding area. It is most likely that this station was recently\
installed.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21151] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Desk", 
         Vnum = 21151, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21152, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21073, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21155, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c There is a big round desk in the middle of the room here, with all sorts\
of security equipment secured around it.  It looks like some sort of\
high-tech, punch in area for workers to check in. There is a room to the\
east, where most of the Quarren and Mon Calamarian workers seem to be\
going. There is a excellent grained wooden door to the west with an\
extravegant golden sign on it.  This room is tastefully done in a coral\
pink and dark purple decor which makes it feel somewhat exciting. You can\
smell in the distence the heavy smoke of iron ore mealting. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21152] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Worker's Lobby", 
         Vnum = 21152, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21160, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21151, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c This is a nice, sunlit area, strewn about with cushions and benches and\
other pieces of Calamrian comforts.  Along one wall is a array of service\
machines that sell food and drinks.  There is a mini kitchen near the\
windows, for the employee's lunches.  The walls are covered with pitures\
of home and of some of the workers children. On the table you even see a\
Mon Calamarian Fish Scout cookiee order form.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21153] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 21153, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21152, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21155] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Customer Check-In", 
         Vnum = 21155, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Halway", 
               Keyword = "", 
               DestinationVnum = 21156, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21151, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This part of the factory is set up for customer relations with clients.\
There is a protocol droid sitting here to set up meetings, answer\
telecommunica ions and take orders for materials to be sent all over the\
galaxy. The carpet here \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21156] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 21156, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-End of Hall", 
               Keyword = "", 
               DestinationVnum = 21158, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "East-Equipment Sales", 
               Keyword = "", 
               DestinationVnum = 21157, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "South-Customer Checkin", 
               Keyword = "", 
               DestinationVnum = 21155, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are walking along a plush hallway.  Large windows line the western wall\
and a door is set to the east.  The markings on the door indicate a\
salesroom \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21157] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Equipment Sales", 
         Vnum = 21157, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-Hallway", 
               Keyword = "", 
               DestinationVnum = 21156, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You barely step into the room and are stopped by a large counter.  A short \
squat Protocol Droid stands here taking orders and feeding the information \
into its counterpart, a large assembly droid.  Bins of parts and pieces line the\
walls behind the counter waiting for thier turn to be used in som useful pieces\
of equipment for you.", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21158] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "End of Hall", 
         Vnum = 21158, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Workshop", 
               Keyword = "", 
               DestinationVnum = 21159, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "South-Hallway", 
               Keyword = "", 
               DestinationVnum = 21156, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "Up-Ship Repair", 
               Keyword = "", 
               DestinationVnum = 21170, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here a magnetic lift sits waiting to take customers up to the ship repair\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21159] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Workshop", 
         Vnum = 21159, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-End of Hall", 
               Keyword = "", 
               DestinationVnum = 21158, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the largest and most elaborate workshop you have everseen. A\
magnetic balanced laser guided lathe sits along the north wall and further\
in is several plasma cutters and a bench of specialty tools of all shapes\
and sizes.  Along the south wall lies a circuit building station complete\
with touch screen  \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
      }, 
      [21160] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Check-Point", 
         Vnum = 21160, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North- Observation Room", 
               Keyword = "", 
               DestinationVnum = 21161, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21152, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "Down-Workers Entrance", 
               Keyword = "", 
               DestinationVnum = 21162, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Several Infra Scanners sweep over you for an ID check.  You can rest\
assured that if you are wanted on Mon Calamar you won't make it past this\
point.  Sever l Large swiveling blasters guard the room so that no one\
will enter the factory t at isn't meant to be here.  The workers take\
stairs to the plant floor below and managers continue north to the observe\
the proceedings.  To the south is the \
To the north is the observation booth, while down is the worker's\
entrance.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21161] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Observation Room", 
         Vnum = 21161, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "South-Security Checkpoint", 
               Keyword = "", 
               DestinationVnum = 21160, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "Up-Ship Yard", 
               Keyword = "", 
               DestinationVnum = 21172, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "Down-Mainframe Computer", 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Several large windows overlook the factory below and hundreds of dials and\
readouts display conditions on the floor below. A few comfortable chairs\
sit  here placed for easy observation of everything.  This is obviously\
where plant managers come to check on the comings and goings of everything\
on the plant flo r. A lev tube in this room can take you up to the\
shipping platform or down to the \
To the south is the check-point, Up is the platform, while down is the\
computer\
mainframe.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21162] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Workers Entrance", 
         Vnum = 21162, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-Lift Station", 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "Up-Security Checkpoint", 
               Keyword = "", 
               DestinationVnum = 21160, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Rows upon Rows of Equipment lockers stand here holding workers personal\
items and tools for work.  This is presumably where those who work at the\
factory  suit up for the day.  There are two exits from here up to the\
security checkpoi t  In the Direction up you can goto the lift station\
while west is the security post. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21163] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Lift Station", 
         Vnum = 21163, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Cooling Section", 
               Keyword = "", 
               DestinationVnum = 21164, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "East-Workers Entrance", 
               Keyword = "", 
               DestinationVnum = 21162, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "Up-Warehouse", 
               Keyword = "", 
               DestinationVnum = 21171, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Description = "Northeast-Mainframe Computer", 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The cooled parts arrive here on a conveyor from the north where they are\
loaded into large boxes and the boxes are loaded on to a repulsor lift and\
taken up to  the uppermost floor for storage and transfer onto shipping\
barges.  From here y u can go east to the workers entrance, you can go\
north further up the line, or up to the warehouse..or ne to the mainframe.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21164] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cooling Station", 
         Vnum = 21164, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Molding and Forming", 
               Keyword = "", 
               DestinationVnum = 21166, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "East-Mainframe Computer", 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "South-Lift Station", 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here the converyor makes a series of sharp turns to S its way from the\
north as dozens of droids turn cooling air hoses on the parts to cool them\
before they  make it to the lift station to the south.  Looking east you\
can see the system that controls the entire facility and from the north\
loud clanging and hissing \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21165] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Mainframe Computer", 
         Vnum = 21165, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Smelting", 
               Keyword = "", 
               DestinationVnum = 21167, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "West-Cooling Section", 
               Keyword = "", 
               DestinationVnum = 21164, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "Up-Observation Room", 
               Keyword = "", 
               DestinationVnum = 21161, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Description = "Northeast-Sorting and Seperating", 
               Keyword = "", 
               DestinationVnum = 21168, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [5] = 
            {
               Direction = "northwest", 
               Description = "Northwest-Molding and Forming", 
               Keyword = "", 
               DestinationVnum = 21166, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [6] = 
            {
               Direction = "southwest", 
               Description = "Southwest-Lift Station", 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here before you is a huge cylinderical object that stretchs from floor to\
ceili g lights run the entire circumfrence of the object and wires string\
about running  away from the massive computer in all directions.  Several\
operator stations ci cle the factory's heart and soul as to monitor and\
solve any problems that occur at a moments notice.  It is possible to\
reach almost any station along the line fr m\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21166] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Molding and Forming", 
         Vnum = 21166, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21167, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "South- Cooling Section", 
               Keyword = "", 
               DestinationVnum = 21164, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "Southeast-Mainframe Computer", 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here is where the super heated pipes carring the melted down ore end.  They pore\
their precious cargo into shape shifting molds that set the steel into whatever\
shape the clients of this factory require.  They are then lifted on to the conveyor\
by special droids designed to withstand the heat.  After that they are sent south \
to the cooling section.  You could go east to find out where the pipes are filled.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21167] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Smelting", 
         Vnum = 21167, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Sorting and Seperating", 
               Keyword = "", 
               DestinationVnum = 21168, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "South-Mainframe Computer", 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "West- Molding and Forming", 
               Keyword = "", 
               DestinationVnum = 21166, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "After the ore is seperated further east, it comes here to be dropped in a\
huge vat that melts it down.  Huge specially heated pipes connect to the\
vat here an \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21168] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Sorting and Seperating", 
         Vnum = 21168, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Recieving", 
               Keyword = "", 
               DestinationVnum = 21169, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "West-Smelting", 
               Keyword = "", 
               DestinationVnum = 21167, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Description = "Southwest-Mainframe Computer", 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "After the raw ore and other materials are recieved to the north it comes\
here. The materials that are used for maintence and electronic\
construction are seper ted from the ore here. As well unexecatable pieces\
of ore are returned to the molin \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21169] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Recieving", 
         Vnum = 21169, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "South-Sorting and Seperating", 
               Keyword = "", 
               DestinationVnum = 21168, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here is where the moling miner machines return to drop off the ore after stripping\
it from the floor of the ocean below.  Other things are also recieved here as well,\
Parts for maintence of crucial machines and critical components that can not be\
created on site.  The sorting area to the south is responsible for deciphering where \
materials need to go,  here though the main concern is unloading the constant \
stream of machines as quickly as possible.", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21170] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Ship Repair", 
         Vnum = 21170, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Warehouse", 
               Keyword = "", 
               DestinationVnum = 21171, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "Down-End of Hall", 
               Keyword = "", 
               DestinationVnum = 21158, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A huge hangar surrounds you and large cranes susspended from the ceiling\
work  continuosly peeling old armor off of ships and pulling worn engine\
casings.  Maintence droids of all shapes and sizes swarm over the ships\
here beeping and whiring at an almost frantic pace.  You get the feeling\
that although this is an iron ore factory they recieve a substancial\
income from the repair of ships\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21171] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Warehouse", 
         Vnum = 21171, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Ship Yard", 
               Keyword = "", 
               DestinationVnum = 21172, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "West-Ship Repair", 
               Keyword = "", 
               DestinationVnum = 21170, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "Down- Lift Station", 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "As the repulsor lifts the huge packages of parts bound for other worlds.\
Binary load lifters sweep them up and move them into neat stacks to await \
transport.  Many of the boxes marked armor are sent west to the ship\
repair area and still many other boxes are being sent through huge doors\
to the east \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [21172] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Vnum = 21172, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-Warehouse", 
               Keyword = "", 
               DestinationVnum = 21171, 
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "Down-Observation Room", 
               Keyword = "", 
               DestinationVnum = 21161, 
               Distance = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
            }, 
         }, 
         Description = "Here a platform that holds at least five cargo ships at any given time is a\
bee hive of activity.  Binary load lifters beep at you to get out of the\
way as the   charge back and forth between waiting barges and the\
warehouse to the west. A  small lev tube sits out of the way at one corner\
of the platform. It seems to  \
West is the warehouse and Down is the observation booth.\
", 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tag = "", 
         Name = "Shipping Platform", 
      }, 
      [21180] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Secret Room", 
         Vnum = 21180, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "hatch", 
               DestinationVnum = 21181, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21066, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z As you look up you can see a few light rays slipping down from the\
cracks in the hard wood floor above. There is a small light positioned in\
the corner of the room. The floor is carved out stone and rather ruffand\
dark. The walls lead around to a small steal circular hatch. If you become\
quiet you can hear small business transactions occuring above.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21181] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel", 
         Vnum = 21181, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "hatch", 
               DestinationVnum = 21180, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21182, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see the hatch, while below you\
look down and see nothing but complete darkness.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21182] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel", 
         Vnum = 21182, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21181, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21183, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see only darkness, while below\
you look down and see a glimmer of light coming from the darkness.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [0] = "Dark", 
            [30] = "Prototype", 
         }, 
      }, 
      [21183] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Security Clearance Room", 
         Vnum = 21183, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21184, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21182, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&c  Looking around you know this place is one of danger and definitely\
doesn't belong here in Coral City. The Walls are carved out magma with\
extremly state of the art security cameras scanning your every bio-stat.\
Attached to the sides of the doors are small laser pods used to make sure\
someone doesn't pass who is not allowed.  \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
      }, 
      [21184] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Imperial Spy Base", 
         Vnum = 21184, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21185, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "door", 
               DestinationVnum = 21183, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "&z You stand in a rather large room full of computer and survailence\
equipment. There are strange markings on the displays .You are familiar\
with the markings, Imperial code language . Apparently the rumors about\
the Quarren are true. \
&x\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21185] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 21185, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21184, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21186] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "&G Universe Construction Co.", 
         Vnum = 21186, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21187, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               DestinationVnum = 21023, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Welcome to the Universe Construction Co. , We are always looking for new\
builders. In this room is the Construction Board. On it will be\
assignments and a way to check in. This is not a place to ask for a zone\
you have to email me or contact me on the game! Failure to follow this\
simple rule will result in you getting smacked with my back fin!!!!\
To the east you see a large Library!\
Contact Ackbar for more info!\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
      }, 
      [21187] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Construction Blueprints", 
         Vnum = 21187, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21186, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here you will find some background info available for your reading.\
Understand this is not all you can use but a basic idea to start with. Got\
any more info on projects were doing ..Well email me them at\
MonCal@netscape.net \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [21445] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 21445, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [21499] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 21499, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [21436] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 21436, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
   }, 
   Objects = 
   {
      [21000] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Textures of both deep red and pale purple swirl together inside the vial.\
\13", 
               Keyword = "violet", 
            }, 
         }, 
         Name = "potion violet glowing", 
         Vnum = 21000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "potion", 
         Weight = 2, 
         Description = "A glowing violet potion has been carelessly left here.", 
         Cost = 61000, 
         ObjectValues = 
         {
            [1] = 28, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ShortDescr = "a glowing violet potion", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
      }, 
      [21001] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "potion purple glowing", 
         Vnum = 21001, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "potion", 
         Weight = 2, 
         Description = "A glowing purple potion has been carelessly left here.", 
         Cost = 6500, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ShortDescr = "a glowing purple potion", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21002] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "puce potion glowing", 
         Vnum = 21002, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "potion", 
         Weight = 2, 
         Description = "A glowing puce potion has been carelessly left here.", 
         Cost = 2400, 
         ObjectValues = 
         {
            [1] = 61, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a glowing puce potion", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21003] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "potion maroon glowing", 
         Vnum = 21003, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "potion", 
         Weight = 2, 
         Description = "A glowing maroon potion has been carelessly left here.", 
         Cost = 750, 
         ObjectValues = 
         {
            [1] = 16, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a glowing maroon potion", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21004] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "potion blue glowing", 
         Vnum = 21004, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
         Weight = 2, 
         Description = "A glowing blue potion has been carelessly left here.", 
         Cost = 15000, 
         ObjectValues = 
         {
            [1] = 49, 
            [2] = 49, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 22, 
         }, 
         ShortDescr = "glowing blue potion", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21133] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "smoked womp rat", 
         Vnum = 21133, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "A freshly smoked womp rat lies here giving off a hickory scent.", 
         Cost = 200, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s savour$q a piece of $p.", 
         ShortDescr = "smoked womp rat", 
      }, 
      [21134] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "roast kinewe", 
         Vnum = 21134, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "A plump roast kinewe bird has been carelessly left on the ground here.", 
         Cost = 200, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s delicately nibble$q on a piece of $p.", 
         ShortDescr = "Roast kinewe", 
      }, 
      [21135] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "chanterelle mushrooms", 
         Vnum = 21135, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "Some freshly picked chanterelle mushrooms have been left behind here.", 
         Cost = 200, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s savor$q $p.", 
         ShortDescr = "some freshly picked chanterelle mushrooms", 
      }, 
      [21136] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "bag black walnuts", 
         Vnum = 21136, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "Nuts shells lie discarded around a small bag left here.", 
         Cost = 200, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s quickly down$q $p.", 
         ShortDescr = "a bag of fresh black nuts", 
      }, 
      [21137] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "leg dewback", 
         Vnum = 21137, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Weight = 2, 
         Description = "A freshly cooked leg of dewback has been dropped here.", 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a leg of dewback", 
         ActionDescription = "%s savagely gnaw$q on $p.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21010] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "mug ale", 
         Vnum = 21010, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Description = "A large mug of ale sits here.", 
         Cost = 75, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 12, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a mug of ale", 
      }, 
      [21139] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Grana seeds", 
         Vnum = 21139, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "A handfull of salty Grana seeds has been left hhere.", 
         Cost = 200, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s quickly consume$q $p.", 
         ShortDescr = "a handful of Grana seeds", 
      }, 
      [21140] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "key master silver", 
         Vnum = 21140, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "key", 
         Description = "&z A set of silver master keys was left here.", 
         Cost = 0, 
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
         ShortDescr = "&z A set of silver master keys &x", 
      }, 
      [21141] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "flag", 
         Vnum = 21141, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "treasure", 
         Description = "&c A Flag of War", 
         Cost = 0, 
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
         ShortDescr = "A flag", 
      }, 
      [21014] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "salami", 
         Vnum = 21014, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Weight = 1, 
         Description = "A slice of salami sits in the man made.", 
         Cost = 4, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a slice of salami", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21015] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "beef", 
         Vnum = 21015, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Weight = 5, 
         Description = "A large chunk of raw beef lies here.", 
         Cost = 9, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a big chunk of beef", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21016] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "turkey", 
         Vnum = 21016, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Weight = 2, 
         Description = "A  cooked Mon bird, which looks quite edible, lies on the tray.", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a cooked turkey", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21017] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "bottle blue milk", 
         Vnum = 21017, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Weight = 3, 
         Description = "A bottle of imported blue milk sits upright on the ground.", 
         Cost = 4, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 10, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a bottle of blue milk", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21018] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "wheel cheese", 
         Vnum = 21018, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "food", 
         Weight = 3, 
         Description = "A round wheel of cheese looks very good.", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a wheel of cheese", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21019] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "lemonade cup", 
         Vnum = 21019, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Weight = 1, 
         Description = "A cup of spiked lemonade makes your thirst quench easily.", 
         Cost = 1, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a cup of lemonade", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21020] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "cake", 
         Vnum = 21020, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "food", 
         Weight = 1, 
         Description = "A large chocolate cake awaits someone to eat it.", 
         Cost = 15, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a chocolate cake", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21021] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "loaf bread", 
         Vnum = 21021, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Weight = 2, 
         Description = "A scrumptious loaf of bread lies here, making your taste buds swirl.", 
         Cost = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a loaf of bread", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21022] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "cherry pie", 
         Vnum = 21022, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "food", 
         Description = "A cherry pie makes your mouth water.", 
         Cost = 100, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a cherry pie", 
      }, 
      [21023] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "pen", 
         Vnum = 21023, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "pen", 
         Description = "A writing computer pen lies on the ground, unowned.", 
         Cost = 30, 
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
         ShortDescr = "a writing computer pen", 
      }, 
      [21420] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You find you are suddenly able to read the ancient words transcribed upon the\
\13piece of parchment.  The more you read, the more visible the words become...\
\13\
\13                   Strategy & Tactic of the mon calamrian Bounty Hunters\
\13\
\13This parchment is intended for those engaged in pkilling, the deadly path,\
\13but many of the tactics outlined here may be useful in other circumstances,\
\13also.  The following details the contents of this parchment:\
\13\
\13\
\0131.  Legend                          4.  Spells/Skills and Immunties/Death Traps\
\0132.  Important Suggestions           5.  Disarm and Backstab\
\0133.  Preperation and Area Knowledge  6.  Config +FLEE and Miscellaneous Tidbits\
\13\
\13\
\13To view a topics, simply type the number of the item you wish to read.\
\13\
\13", 
               Keyword = "parchment", 
            }, 
            [2] = 
            {
               Description = "The Legend of the Parchment\
\13\
\13During the excavation for New Akatamer, a chest of weapons and artifacts\
\13was uncovered, was concluded to have originated with an ancient mon Calamrian's\
\13\
\13All the weapons of this group had shiny metal surfaces and had been covered\
\13by black tar.  The conclusion was that the clan had attempted to avoid\
\13detection in sunlight by preventing the blades of their weapons from\
\13reflecting the sun's rays.\
\13The created most of thier armor from raiding the quarren's mine shafts\
\13long\
\13before the two races became friends.\
\13\
\13Hidden among the weapons and artifacts was a set of tattered parchments,\
\13which upon translation, appeared to be Training material written by\
\13ancient Quarren.  Although some of the information is now obsolete,\
\13some of the info still be of use.\
\13", 
               Keyword = "1", 
            }, 
            [3] = 
            {
               Description = "1.) Try to join a clan , it is always better to be with #'s\
\13\
\13\
\0132.)  Some kind of macro facility is recommended.  Depending on your typing\
\13speed, this may be more important to some players than others.  In general,\
\13if one player uses macros and another does not, the player using macros\
\13has a distinct (speed) advantage.\
\13\
\0133.)  This game is a social place.  Players who share info with other\
\13players tend to do much better than solitary players.  The information here\
\13is intended to be sparse.  To fully understand the items discussed here, it\
\13is wise to talk the things mentioned here over with other players.\
\13\
\13", 
               Keyword = "2", 
            }, 
            [4] = 
            {
               Description = "Preparation is the foundation to success.  A weaker player who is prepared\
\13shielded and having your weapons wielded at all times when you are not in\
\13a safe place.  It also means having the force you need and being able to\
\13quickly regenerate a shield or spell if it wears out.  You must carry\
\13scanners, spices and other objects that will give you force and heals and\
\13you must be prepared to get them and use them instantly.  This means you\
\13have to carry some in your inventory and some in containers.  You need to\
\13have macros set up to get them and use them.  If you do not use macros,\
\13you need to know which items are stored in which containers so you can get\
\13them instantly.  When attacked by surprise, you cannot afford to start\
\13fumbling around hunting for supplies -- you will likely die.   (Type look\
\0133A for Area Knowledge)  \
\13", 
               Keyword = "3", 
            }, 
            [5] = 
            {
               Description = "Area Knowledge\
\13\
\13Area Knowledge is important to survival whether engaging in pkilling or mob\
\13killing.  You should try to learn as much about an area before attempting\
\13to operate in it.  Know nearby safe zones and where you can or cannot\
\13recall from.  This knowledge may save you in the future.\
\13\
\13", 
               Keyword = "3a", 
            }, 
            [6] = 
            {
               Description = "Sorry this info could not be obtained.\
\13", 
               Keyword = "4", 
            }, 
            [7] = 
            {
               Description = "Dealing with Immunities\
\13\
\13Some players and mobs are immune to different types of weapons and spells.\
\13It's a good idea to carry a few different kinds of weapons and be prepared\
\13to use a few different kinds of offensive spells.  It is important during a\
\13fight to try and see if your weapons and spells are doing any damage.  If\
\13your weapon is constantly \"missing\" (not dodged or parried, but missing),\
\13be ready to switch to another weapon.  If your fireball constantly misses,\
\13try a different kind of spell.  There are many, including lightning bolt,\
\13burning hands, color spray, energy drain and many others to choose from.\
\13\
\13\
\13Avoiding Death Traps and Other Nasty Surprises\
\13\
\13When you are in an unfamiliar place, it is a good idea to look ahead before\
\13entering a new room.  Use scry or scan to do this.  If you see a room that\
\13has no exits, you need to be cautions because it might be a death trap.  If\
\13you cannot scry or scan, type \"look direction\" and read the description of\
\13what lies in that direction.  Most of these rooms are not death traps, they\
\13just have exits that are not obvious or require you to recall to exit.  One\
\13good technique is to bring a friend or a character with little equipment\
\13and send them in to test for a death trap.  Having friends in the mud pays\
\13\
\13dividends in many ways.\
\13", 
               Keyword = "4a", 
            }, 
            [8] = 
            {
               Description = "Disarm\
\13\
\13If you can disarm an opponent and take their weapon, you can get a great\
\13advantage.  This tactic is a little over-rated because your opponent may\
\13have a good grip on their weapon or may have extra weapons.  The effort\
\13you put into disarming them takes away from other tactics you should be\
\13using instead.  Disarming mobs can sometimes be a bad move because some\
\13mobs hit much harder when disarmed.  If you must try this skill, perhaps\
\13you should try it only once or twice in a fight and then move on.\
\13\
\13\
\13Backstab\
\13\
\13If you can backstab an opponent to start a fight, you should certainly try\
\13it.  In order to be backstabbed, however, an opponent must be at full hit\
\13\
\13points.  If they never eat or drink (a good tactic against backstabbing),\
\13they will always be a few hp below maximum.  You can always start a fight\
\13by healing your opponent in the hopes of bringing them to full hit points,\
\13then backstab them.  Naughty but Nice!\
\13\
\13", 
               Keyword = "5", 
            }, 
            [9] = 
            {
               Description = "Config +FLEE\
\13\
\13Many players like this until they flee into a death trap.  In general, it's\
\13a bad idea.  You are usually better off to recall than to flee.  If you have\
\13problems recalling.\
\13\
\13", 
               Keyword = "6", 
            }, 
         }, 
         Name = "hologram", 
         Vnum = 21420, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "book", 
         Weight = 1, 
         Description = "A hologram parchment sits here.", 
         Cost = 45000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A hologram", 
         ActionDescription = "", 
         Flags = 
         {
            [1] = "Hum", 
         }, 
      }, 
      [21421] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "bus stop sign", 
         Vnum = 21421, 
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
         Description = "A pluogus bus stop sign.", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ShortDescr = "a sign", 
      }, 
      [21422] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "small crystal", 
         Vnum = 21422, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "crystal", 
         Weight = 1, 
         Description = "A small crystal catches your eye.", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a small crystal", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21423] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "relacite crystal", 
         Vnum = 21423, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "crystal", 
         Weight = 1, 
         Description = "A crystal was dropped here.", 
         Cost = 3000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a relacite crystal", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21424] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Kathracite crystal", 
         Vnum = 21424, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "crystal", 
         Weight = 1, 
         Description = "Something shiney catches your eye.", 
         Cost = 2000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a kathracite crystal", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21425] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "mephite crystal", 
         Vnum = 21425, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "crystal", 
         Weight = 1, 
         Description = "Something shiney catches your eye.", 
         Cost = 5000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a mephite crystal", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21042] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "book", 
            }, 
         }, 
         Name = "board general", 
         Vnum = 21042, 
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
         Description = "The Akatamer board hangs here.", 
         Cost = 0, 
         Weight = 1001, 
         ActionDescription = "", 
         ShortDescr = "the general board", 
      }, 
      [21427] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You find you are suddenly able to read the ancient words transcribed upon the\
\13piece of parchment.  The more you read, the more visible the words become...\
\13\
\13                   Strategy & Tactic of the mon calamrian Bounty Hunters\
\13\
\13This parchment is intended for those engaged in pkilling, the deadly path,\
\13but many of the tactics outlined here may be useful in other circumstances,\
\13also.  The following details the contents of this parchment:\
\13\
\13\
\0131.  Legend                          4.  Spells/Skills and Immunties/Death Traps\
\0132.  Important Suggestions           5.  Disarm and Backstab\
\0133.  Preperation and Area Knowledge  6.  Config +FLEE and Miscellaneous Tidbits\
\13\
\13\
\13To view a topics, simply type the number of the item you wish to read.\
\13\
\13", 
               Keyword = "parchment", 
            }, 
            [2] = 
            {
               Description = "The Legend of the Parchment\
\13\
\13During the excavation for New Akatamer, a chest of weapons and artifacts\
\13was uncovered, was concluded to have originated with an ancient mon Calamrian's\
\13\
\13All the weapons of this group had shiny metal surfaces and had been covered\
\13by black tar.  The conclusion was that the clan had attempted to avoid\
\13detection in sunlight by preventing the blades of their weapons from\
\13reflecting the sun's rays.\
\13The created most of thier armor from raiding the quarren's mine shafts\
\13long\
\13before the two races became friends.\
\13\
\13Hidden among the weapons and artifacts was a set of tattered parchments,\
\13which upon translation, appeared to be Training material written by\
\13ancient Quarren.  Although some of the information is now obsolete,\
\13some of the info still be of use.\
\13", 
               Keyword = "1", 
            }, 
            [3] = 
            {
               Description = "1.) Try to join a clan , it is always better to be with #'s\
\13\
\13\
\0132.)  Some kind of macro facility is recommended.  Depending on your typing\
\13speed, this may be more important to some players than others.  In general,\
\13if one player uses macros and another does not, the player using macros\
\13has a distinct (speed) advantage.\
\13\
\0133.)  This game is a social place.  Players who share info with other\
\13players tend to do much better than solitary players.  The information here\
\13is intended to be sparse.  To fully understand the items discussed here, it\
\13is wise to talk the things mentioned here over with other players.\
\13\
\13", 
               Keyword = "2", 
            }, 
            [4] = 
            {
               Description = "Preparation is the foundation to success.  A weaker player who is prepared\
\13shielded and having your weapons wielded at all times when you are not in\
\13a safe place.  It also means having the force you need and being able to\
\13quickly regenerate a shield or spell if it wears out.  You must carry\
\13scanners, spices and other objects that will give you force and heals and\
\13you must be prepared to get them and use them instantly.  This means you\
\13have to carry some in your inventory and some in containers.  You need to\
\13have macros set up to get them and use them.  If you do not use macros,\
\13\
\13you need to know which items are stored in which containers so you can get\
\13them instantly.  When attacked by surprise, you cannot afford to start\
\13fumbling around hunting for supplies -- you will likely die.   (Type look\
\0133A for Area Knowledge)  \
\13", 
               Keyword = "3", 
            }, 
            [5] = 
            {
               Description = "Area Knowledge\
\13\
\13Area Knowledge is important to survival whether engaging in pkilling or mob\
\13killing.  You should try to learn as much about an area before attempting\
\13to operate in it.  Know nearby safe zones and where you can or cannot\
\13recall from.  This knowledge may save you in the future.\
\13\
\13", 
               Keyword = "3a", 
            }, 
            [6] = 
            {
               Description = "Sorry this info could not be obtained.\
\13", 
               Keyword = "4", 
            }, 
            [7] = 
            {
               Description = "Dealing with Immunities\
\13\
\13Some players and mobs are immune to different types of weapons and spells.\
\13It's a good idea to carry a few different kinds of weapons and be prepared\
\13to use a few different kinds of offensive spells.  It is important during a\
\13fight to try and see if your weapons and spells are doing any damage.  If\
\13your weapon is constantly \"missing\" (not dodged or parried, but missing),\
\13be ready to switch to another weapon.  If your fireball constantly misses,\
\13try a different kind of spell.  There are many, including lightning bolt,\
\13burning hands, color spray, energy drain and many others to choose from.\
\13\
\13\
\13Avoiding Death Traps and Other Nasty Surprises\
\13\
\13\
\13When you are in an unfamiliar place, it is a good idea to look ahead before\
\13entering a new room.  Use scry or scan to do this.  If you see a room that\
\13has no exits, you need to be cautions because it might be a death trap.  If\
\13you cannot scry or scan, type \"look direction\" and read the description of\
\13what lies in that direction.  Most of these rooms are not death traps, they\
\13just have exits that are not obvious or require you to recall to exit.  One\
\13good technique is to bring a friend or a character with little equipment\
\13and send them in to test for a death trap.  Having friends in the mud pays\
\13dividends in many ways.\
\13", 
               Keyword = "4a", 
            }, 
            [8] = 
            {
               Description = "Disarm\
\13\
\13If you can disarm an opponent and take their weapon, you can get a great\
\13advantage.  This tactic is a little over-rated because your opponent may\
\13have a good grip on their weapon or may have extra weapons.  The effort\
\13you put into disarming them takes away from other tactics you should be\
\13using instead.  Disarming mobs can sometimes be a bad move because some\
\13mobs hit much harder when disarmed.  If you must try this skill, perhaps\
\13you should try it only once or twice in a fight and then move on.\
\13Backstab\
\13\
\13If you can backstab an opponent to start a fight, you should certainly try\
\13it.  In order to be backstabbed, however, an opponent must be at full hit\
\13points.  If they never eat or drink (a good tactic against backstabbing),\
\13they will always be a few hp below maximum.  You can always start a fight\
\13by healing your opponent in the hopes of bringing them to full hit points,\
\13then backstab them.  Naughty but Nice!\
\13\
\13", 
               Keyword = "5", 
            }, 
            [9] = 
            {
               Description = "Config +FLEE\
\13\
\13Many players like this until they flee into a death trap.  In general, it's\
\13a bad idea.  You are usually better off to recall than to flee.  If you have\
\13problems recalling.\
\13\
\13", 
               Keyword = "6", 
            }, 
            [10] = 
            {
               Description = "", 
               Keyword = "computer terminal", 
            }, 
         }, 
         Name = "lever omputer terminal", 
         Vnum = 21427, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "lever", 
         Weight = 1, 
         Description = "&b A computer terminal rests aginst the wall here.", 
         Cost = 45000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A computer terminal lever", 
         ActionDescription = "", 
         Flags = 
         {
            [1] = "Hum", 
         }, 
      }, 
      [21428] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "key ", 
         Vnum = 21428, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "key", 
         Description = "Key", 
         Cost = 0, 
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
         ShortDescr = "Key", 
      }, 
      [21045] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "crystal staff", 
         Vnum = 21045, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "_wand", 
         Weight = 1, 
         Description = "A sparkling crystal staff has been left lying here.", 
         Cost = 1000, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 3, 
            [3] = 81, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a sparkling crystal staff", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21046] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "bag rune-covered", 
         Vnum = 21046, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "container", 
         Weight = 1, 
         Description = "A strange bag, covered in dust, has been left here.", 
         Cost = 1000, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 75, 
         }, 
         ShortDescr = "a rune-covered bag", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21048] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "mail board stack", 
         Vnum = 21048, 
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
         Description = "A stack of holomail is piled high here.", 
         Cost = 0, 
         Weight = 1001, 
         ActionDescription = "", 
         ShortDescr = "a stack of holomail", 
      }, 
      [21049] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "ball light", 
         Vnum = 21049, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "light", 
         Weight = 1, 
         Description = "A bright ball of light shimmers in the air.", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = -1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a bright ball of light", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21435] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "augurer guild board", 
         Vnum = 21435, 
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
         Description = "Data Info Center - (Terminal)", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ShortDescr = "the board of the augurer guild", 
      }, 
      [21055] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "thief ring", 
         Affects = 
         {
            [1] = 
            {
               Location = 31, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 21055, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "A ring which will bring good luck lies here.", 
         Cost = 500, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a thief's ring", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [5] = "Invis", 
         }, 
      }, 
      [21056] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Rumors say that these rings protect from magical enchantments...\
\13", 
               Keyword = "ring", 
            }, 
         }, 
         Name = "ring", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -3, 
            }, 
            [2] = 
            {
               Location = 27, 
               Modifier = 3072, 
            }, 
         }, 
         Vnum = 21056, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "An iron ring has fallen here.", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a ring of the city guard", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [19] = "LargeSize", 
         }, 
      }, 
      [21057] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "a neck guard", 
         Vnum = 21057, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ItemType = "armor", 
         Weight = 3, 
         Description = "A large neck guard was dropped here.", 
         Cost = 30, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a neck guard", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21058] = 
      {
         Layers = 128, 
         ExtraDescriptions = 
         {
         }, 
         Name = "crested plate", 
         Vnum = 21058, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Weight = 8, 
         Description = "A New Rebublic breastplate has fallen here.", 
         Cost = 150, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         ShortDescr = "a New rebublic crested breastplate", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21059] = 
      {
         Layers = 4, 
         ExtraDescriptions = 
         {
         }, 
         Name = "a helm", 
         Vnum = 21059, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ItemType = "armor", 
         Weight = 8, 
         Description = "A helm is here.", 
         Cost = 50, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a helm", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21060] = 
      {
         Layers = 16, 
         ExtraDescriptions = 
         {
         }, 
         Name = "guard leggings", 
         Vnum = 21060, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ItemType = "armor", 
         Weight = 4, 
         Description = "A set of guard leggings has fallen here.", 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "guard leggings", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21061] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "boots black", 
         Vnum = 21061, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ItemType = "armor", 
         Weight = 2, 
         Description = "A set of boots has fallen here.", 
         Cost = 40, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "black boots", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21062] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "guard sleeves", 
         Vnum = 21062, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ItemType = "armor", 
         Weight = 3, 
         Description = "A set of guard sleeves has fallen here.", 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "guard sleeves", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21063] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "guard gauntlets", 
         Vnum = 21063, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ItemType = "armor", 
         Weight = 4, 
         Description = "Some guard gauntlets have fallen here.", 
         Cost = 40, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "guard gauntlets", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21064] = 
      {
         Layers = 128, 
         ExtraDescriptions = 
         {
         }, 
         Name = "bracer", 
         Vnum = 21064, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ItemType = "armor", 
         Weight = 2, 
         Description = "A bracer was dropped here.", 
         Cost = 75, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a bracer", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21065] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "calamarian energy shield", 
         Vnum = 21065, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ItemType = "armor", 
         Weight = 6, 
         Description = "A calamarian energy shield was dropped here.", 
         Cost = 600, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         ShortDescr = "a calamarian energy shield", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21066] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "rubber visor", 
         Vnum = 21066, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "A rubber visor was misplaced here.", 
         Cost = 50, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a rubber visor", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21067] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "torch", 
         Vnum = 21067, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "light", 
         Description = "A plain electric torch has been left lying here.", 
         Cost = 10, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 24, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a torch", 
      }, 
      [21068] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "com-blaster", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 3, 
            }, 
         }, 
         Vnum = 21068, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Weight = 3, 
         Description = "A com-blaster has fallen here.", 
         Cost = 300, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a com-blaster", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21069] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "hand blaster", 
         Vnum = 21069, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Weight = 6, 
         Description = "A hand blaster has fallen here.", 
         Cost = 300, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "hand blaster", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21070] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         Vnum = 21070, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "Key to Docking Bay", 
         Cost = 1000, 
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
         ShortDescr = "Key to Docking Bay", 
      }, 
      [21071] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         Vnum = 21071, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "The key to Akatamer's northern Docking bay lies here.", 
         Cost = 1000, 
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
         ShortDescr = "the key to the northern Docking bay of Akatamer", 
      }, 
      [21072] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         Vnum = 21072, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "The key to Akatamer's eastern Docking bay lies here.", 
         Cost = 1000, 
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
         ShortDescr = "the key to the eastern Docking bay of Akatamer", 
      }, 
      [21073] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         Vnum = 21073, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "The Key to the southern Docking Bay", 
         Cost = 0, 
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
         ShortDescr = "Key to Southern Docking Bay.", 
      }, 
      [21076] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather shirt", 
         Vnum = 21076, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Description = "Someone has left a bantha leather shirt lying here.", 
         Cost = 200, 
         Weight = 4, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a leather shirt", 
      }, 
      [21077] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "pants leather", 
         Vnum = 21077, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ItemType = "armor", 
         Description = "Some bantha leather pants are lying here.", 
         Cost = 150, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         ShortDescr = "some leather pants", 
      }, 
      [21078] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather sleeves", 
         Vnum = 21078, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ItemType = "armor", 
         Description = "Some bantha leather sleeves have been abandoned here.", 
         Cost = 75, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         ShortDescr = "some leather sleeves", 
      }, 
      [21079] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather boots", 
         Vnum = 21079, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ItemType = "armor", 
         Description = "A pair of bantha leather boots are lying here.", 
         Cost = 125, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         ShortDescr = "some leather boots", 
      }, 
      [21080] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather gloves pair", 
         Vnum = 21080, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ItemType = "armor", 
         Description = "Two bantha leather gloves are lying on the ground.", 
         Cost = 100, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a pair of leather gloves", 
      }, 
      [21081] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "steel knife", 
         Vnum = 21081, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Weight = 1, 
         Description = "A gleaming knife shines brightly here.", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a steel knife", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21082] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mon-blaster", 
         Vnum = 21082, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Weight = 4, 
         Description = "An Mon Blaster has been carelessly left here.", 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         ShortDescr = "Mon blaster", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21083] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         Vnum = 21083, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "key", 
         Description = "This item doesn't need a long :P", 
         Cost = 0, 
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
         ShortDescr = "hotel  key", 
      }, 
      [21094] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "ring golden band", 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 3072, 
            }, 
         }, 
         Vnum = 21094, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "A strange golden band has been left lying here.", 
         Cost = 10000, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a strange golden band", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
      }, 
      [21426] = 
      {
         ShortDescr = "&O A Mon Gill", 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&O The mon gill while very effective has a very short life span.\
\13", 
               Keyword = "gill mask", 
            }, 
         }, 
         Name = "gill mask", 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = -2147483648, 
            }, 
         }, 
         Vnum = 21426, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "&O A Mon Gill was left here on the ground.", 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho &R^R Warning, Gill Mask Failure &x ^x\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "1", 
            }, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [21138] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "wild mustard greens", 
         Vnum = 21138, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "Some freshly gathered wild seaweed have been forgotten here.", 
         Cost = 200, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "%s quickly eat$q $p.", 
         ShortDescr = "some wild seaweed greens", 
      }, 
      [21008] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "beer bottle", 
         Vnum = 21008, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Description = "A small bottle, tipped on its side, drips on the ground.", 
         Cost = 100, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a bottle of beer", 
      }, 
      [21111] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
         }, 
         Name = "manor painting", 
         Vnum = 21111, 
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
         ShortDescr = "an oil painting", 
         Description = "A painting of a glorious security post hangs on the wall, catching your eye.", 
         Cost = 0, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n A magical force suddenly takes hold of you, pulling you in!\
mpechoat $n When you right yourself, you look around to collect your bearings,\
mpechoat $n and find yourself standing before the manor...\
mptrans $n 2400\
mpecho $n fades before your eyes while examining the painting of the manor.\
", 
               MudProgType = "exa_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [8] = "Bless", 
         }, 
      }, 
      [21112] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Gazing at the painting, you find yourself entranced by the image of a\
\13woman kneeling at the foot of a grave, mourning the loss of her child.\
\13As tears stream down her face, she finds the arms of an angel wrapped\
\13around her, seeming to comfort her in her hour of despair.  Suddenly,\
\13everything about you shifts and you find yourself becoming part of\
\13the painting, screaming as the angel of darkness drags you, too, \
\13unto the unholy grounds of the dead.\
\13", 
               Keyword = "solemn painting unholy", 
            }, 
         }, 
         Name = "solemn painting unholy", 
         Vnum = 21112, 
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
         Description = "A dark, solemn painting hangs here in the shadows, collecting dust.", 
         Cost = 0, 
         Weight = 50, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n Your feel your body as it dissolves into elements of color,\
mpechoat $n sphotel ing slowly into the oils of the dark painting...\
mpechoaround $n Stepping forward to examine the painting, $n's body begins to\
mpechoaround $n liquesce, dissolving into a kaleidoscope of colors, sphotel ing\
mpechoaround $n funnel-like into the oiled textures of the solemn image.\
mptransfer $n 2171\
", 
               MudProgType = "exa_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a dark, solemn painting", 
      }, 
      [21113] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
            [2] = 
            {
               Description = "&cHead down the ladder, watch out because the water is cold.\
\13Then you swimm 5 legs toward the northern polor.\
\13Then dive down one depth.\
\13Swimm 4 legs toward the sun set.\
\13Then one more leg to the northern polor cap.\
\13Then swim 3 more legs to the sunset.\
\13Then dive down one more depth.\
\13Then swim 3 legs to the sunset.\
\13Then swim 1 leg to the southern/sunset\
\13Then swim 1 leg to the sunset.\
\13Two legs southern polar/sunrise\
\13One leg to the sunrise.\
\13", 
               Keyword = "map", 
            }, 
         }, 
         Name = "map", 
         Vnum = 21113, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "furniture", 
         Weight = 1, 
         Description = "A ratted up map was left here.", 
         Cost = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A ratted up map", 
         ActionDescription = "", 
         Flags = 
         {
            [8] = "Bless", 
         }, 
      }, 
      [21114] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
            [2] = 
            {
               Description = "&c This large bronze statue is of a great Mon Calamarian individual, who\
\13helped end the first Imperial force and the second Death Star. There is  a\
\13small frame on the sign with a gold inprint on it.\
\13", 
               Keyword = "statue", 
            }, 
         }, 
         Name = "statue", 
         Vnum = 21114, 
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
         ShortDescr = "&c A large bronze statue ", 
         Description = "&c A large bronze statue stands tall here.", 
         Cost = 0, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You feel all your prayers are being answered from above.\
", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "bow pray", 
            }, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [8] = "Bless", 
         }, 
      }, 
      [21115] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         Name = "bed prison", 
         Vnum = 21115, 
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
         Description = "&z A metal prison bed lies aginst the wall. &x", 
         Cost = 0, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You plop flat in the large metal bed relaxing..\
mpecho thinking this is not to bad when...\
mpecho  BOING!\
mpecho  A spring pokes you in the back.\
mpforce $n stand\
", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "100 p sits down.", 
            }, 
         }, 
         ActionDescription = "", 
         ShortDescr = "&z A metal prison bed ", 
      }, 
      [21116] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         Name = "suction john toilet waste", 
         Vnum = 21116, 
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
         Description = "&c A TI-0 suction waste machine is placed in the corner.", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         ShortDescr = "&c A TI-0 suction waste machine", 
      }, 
      [21117] = 
      {
         Layers = 8, 
         ExtraDescriptions = 
         {
         }, 
         Name = "vest gamorean double strap", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -10, 
            }, 
         }, 
         Vnum = 21117, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "&G A gamorrean double strap vest was left here. &x", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&G A gamorrean double strap vest &x", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
      }, 
      [21118] = 
      {
         Layers = 4, 
         ExtraDescriptions = 
         {
         }, 
         Name = "boots lizard feet cover", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -20, 
            }, 
            [2] = 
            {
               Location = 47, 
               Modifier = 100, 
            }, 
         }, 
         Vnum = 21118, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Description = "&b Lizard skin feet covers were left here &x.", 
         Cost = 125, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&b Lizard skin feet covers.", 
         ActionDescription = "", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
      }, 
      [21009] = 
      {
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "whiskey bottle", 
         Vnum = 21009, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Description = "A bottle of whiskey spills drops on the ground.", 
         Cost = 50, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a bottle of whiskey", 
      }, 
   }, 
   Mobiles = 
   {
      [21000] = 
      {
         Race = "Human", 
         LongDescr = "A elderly saint wearing only a dark robe wanders here.\
", 
         Name = "healer jedi saint", 
         Alignment = 1000, 
         Vnum = 21000, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 25, 
            HitPlus = 300, 
            HitSizeDice = 500, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
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
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [8] = "_08", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "elderly saint", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21001] = 
      {
         Race = "Quarren", 
         LongDescr = "Anakiem the shopkeeper stands here.\
", 
         Name = "Anakiem shopkeeper", 
         Alignment = 0, 
         Vnum = 21001, 
         Position = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Anikem the shopkeeper", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "smile\
nod\
' ahh the rare corusca crystal is what you seek \
' the only one i know of was given to a young jedi by Master Luke.\
' Seek him out if you seek that crystal.\
smile $n\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "corusca", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = -300, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 4, 
         ShortDescr = "Anikem the shopkeeper", 
         Credits = 0, 
         NumberOfAttacks = 6, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 34, 
         Damage = 
         {
            DamSizeDice = 100, 
            DamPlus = 100, 
            DamNoDice = 20, 
         }, 
         Description = "", 
      }, 
      [21002] = 
      {
         Race = "Twi'lek", 
         LongDescr = "Torval the repir tech works on armor.\
", 
         Name = "Torval repair", 
         Alignment = 0, 
         Vnum = 21002, 
         Position = "standing", 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear loud bangs as Torval hammers out dents in the\
mpecho weapons\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "10 ", 
            }, 
            [2] = 
            {
               Code = "Say hello, if you don't have a weapon for me to repair please leave I'm\
mpecho busy!\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [2] = "twileki", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = -300, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the repair tech", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 1000, 
            DamNoDice = 1, 
         }, 
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            ProfitFix = 120, 
            KeeperShortDescr = "the repair tech", 
         }, 
      }, 
      [21003] = 
      {
         Race = "Wookiee", 
         LongDescr = "The Rodian spice dealer stands behind the counter.\
", 
         Name = "Shana spice dealer", 
         Alignment = 0, 
         Vnum = 21003, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the spice dealer", 
            ProfitSell = 90, 
            ProfitBuy = 115, 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the spice dealer", 
         Credits = 0, 
         NumberOfAttacks = 6, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 100, 
            DamNoDice = 4, 
         }, 
         Description = "", 
      }, 
      [21004] = 
      {
         Race = "Wookiee", 
         LongDescr = "The Shuttleee sits here.\
", 
         Name = "Shuttleee", 
         Alignment = 0, 
         Vnum = 21004, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the Shuttleee", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Shuttleee", 
         Credits = 0, 
         NumberOfAttacks = 6, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 100, 
            DamNoDice = 4, 
         }, 
         Description = "", 
      }, 
      [21006] = 
      {
         Race = "Human", 
         LongDescr = "The skill teacher awaits a student.\
", 
         Name = "guildmaster", 
         Alignment = -1000, 
         Vnum = 21006, 
         Position = "standing", 
         Resistant = 
         {
            [1] = "cold", 
            [4] = "blunt", 
            [20] = "magic", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
         Susceptible = 
         {
            [0] = "fire", 
            [5] = "pierce", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [12] = "_12", 
            [20] = "_20", 
            [6] = "_06", 
            [11] = "_11", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "skill teacher", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 20, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21007] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Mon Calamrian doll", 
         Alignment = 1000, 
         Vnum = 21007, 
         Position = "standing", 
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
            [0] = "fire", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 100, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A Calamrian doll hangs limply here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "the Calamrian doll", 
      }, 
      [21009] = 
      {
         Race = "Human", 
         LongDescr = "A Builder offers you his selection of Mon made ships.\
", 
         Name = "Ship builder", 
         Alignment = 0, 
         Vnum = 21009, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the Builder", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Builder", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21010] = 
      {
         Race = "Human", 
         LongDescr = "The cute Calamrian waitress awaits your order.\
", 
         Name = "waitress", 
         Alignment = 0, 
         Vnum = 21010, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the waitress", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the waitress", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21011] = 
      {
         Race = "Human", 
         LongDescr = "A thin Calamrian printer sits behind a stack of papers.\
", 
         Name = "printer", 
         Alignment = 0, 
         Vnum = 21011, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
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
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the printer", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the printer", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21012] = 
      {
         Race = "Human", 
         LongDescr = "The Guild's Shuttleer meditates here.\
\
", 
         Name = "Shuttleer father", 
         Alignment = 1000, 
         Vnum = 21012, 
         Position = "standing", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Guild Father", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 800, 
            DamNoDice = 100, 
         }, 
         Description = "", 
      }, 
      [21013] = 
      {
         Race = "Human", 
         LongDescr = "Monei the bartender stands behind his counter.\
", 
         Name = "Monei bartender", 
         Alignment = 0, 
         Vnum = 21013, 
         Position = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the bartender Monei", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Pull up a chair and have a drink, we only live once ya know.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "mpemote You hear the bartender say, \"I wish those dman vendors would shut\
up!\"\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "10 ", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the bartender Monei", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 100, 
            DamPlus = 800, 
            DamNoDice = 5, 
         }, 
         Description = "", 
      }, 
      [21014] = 
      {
         Race = "Human", 
         LongDescr = "&C Joyta, Mon Calamarian Jewler displays here jems in the case.\
", 
         Name = "jeweler", 
         Alignment = 0, 
         Vnum = 21014, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Joyta, Mon Calamarian Jewler", 
            ProfitSell = 90, 
            ProfitBuy = 95, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Yell Come in , I've got the best Jewlery in the Galexy!\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "5 ", 
            }, 
            [2] = 
            {
               Code = "Say Hello $n in the mood for buying some Jewlery?\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "hi hello ", 
            }, 
            [3] = 
            {
               Code = "Say Good come take a look at my display!\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "yes", 
            }, 
            [4] = 
            {
               Code = "say Sorry those are not for sale, protected by the governement.\
say Shhhh , I hear there are more in the ocean, get me one and I'll pay you\
a high\
price.\
say but you didn't here that from me.\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "ultima pearl ultima_pearl", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "Joyta, Mon Calamarian Jewler", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21015] = 
      {
         Race = "Human", 
         Description = "", 
         LongDescr = "Rax the armourer is here fitting a Mon Calamrian  helm.\
", 
         Name = "rax armourer", 
         Alignment = 0, 
         Vnum = 21015, 
         Position = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the Rax armourer", 
            ProfitSell = 90, 
            ProfitBuy = 130, 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Welcome $n Heard you were in town.\
say If you want any equipment just tell me.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Rax armourer", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 1000, 
            DamNoDice = 1, 
         }, 
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            ProfitFix = 100, 
            KeeperShortDescr = "the Rax armourer", 
         }, 
      }, 
      [21016] = 
      {
         Race = "Human", 
         LongDescr = "The weaponsmith Bonta, labors over a lengthy blade.\
", 
         Name = "bonta weaponsmith", 
         Alignment = 0, 
         Vnum = 21016, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the Bonta weaponsmith", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Welcome to my shop care to buy a weapon?\
mpecho Bonta grins at you evily.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Bonta weaponsmith", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21017] = 
      {
         Race = "Human", 
         LongDescr = "The postmaster sorts the day's mail.\
", 
         Name = "postmaster", 
         Alignment = 0, 
         Vnum = 21017, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the postmaster", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21018] = 
      {
         Race = "Human", 
         LongDescr = "A chef Wannie greets you.\
", 
         Name = "chef", 
         Alignment = 0, 
         Vnum = 21018, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the chef Wannie", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Hello just step right up and get my galexy famous barbecue.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "Yell Barbecue, fresh and hot, falls of the bones. \
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "5 ", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the chef Wannie", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 800, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21019] = 
      {
         Race = "Human", 
         LongDescr = "The Mon Calamarian baker is here, covered with seaweed flour.\
", 
         Name = "baker", 
         Alignment = 0, 
         Vnum = 21019, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the baker", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Welcome to my shop when you want to buy just yell!\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "Yell Fresh Hot Seaweed Bread, Get it while it's Hot!\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "5", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the baker", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 500, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21020] = 
      {
         Race = "Human", 
         LongDescr = "A young Mon Calamarian girl smiles as you enter.\
", 
         Name = "Mon Calamrian girl", 
         Alignment = 0, 
         Vnum = 21020, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the Mon Calamrian girl", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hello, can I intrest you in anything?\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "Say Noy noe $n I'm working...maybe later!\
stare $n\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "sex you fuck", 
            }, 
            [3] = 
            {
               Code = "Yell Fresh blue seacow milk, get it while it's here.\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "5", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 1000, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = -150, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 100, 
         DamRoll = 20, 
         ShortDescr = "the Mon Calamrian girl", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 20, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Description = "", 
      }, 
      [21021] = 
      {
         Race = "Human", 
         LongDescr = "&z Lokist the tailor is here showing off the latest fashion.\
", 
         Name = "Lokist tailor", 
         Alignment = 0, 
         Vnum = 21021, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "&z Lokist the tailor", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "&z Lokist the tailor", 
         Credits = 0, 
         NumberOfAttacks = 6, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 100, 
            DamNoDice = 4, 
         }, 
         Description = "", 
      }, 
      [21022] = 
      {
         Race = "Human", 
         LongDescr = "The bantha keeper tends to his animals.\
", 
         Name = "bantha keeper", 
         Alignment = 0, 
         Vnum = 21022, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the bantha keeper", 
         Credits = 0, 
         NumberOfAttacks = 6, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 100, 
            DamNoDice = 4, 
         }, 
         Description = "", 
      }, 
      [21023] = 
      {
         Race = "Human", 
         LongDescr = "A master thief is here to demonstrate the ways of thievery.\
", 
         Name = "thief master", 
         Alignment = 0, 
         Vnum = 21023, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [19] = "disarm", 
         }, 
         AttackFlags = 
         {
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Master Thief", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21025] = 
      {
         Race = "Human", 
         LongDescr = "The hotel keeper stands here, looking rather gruff.\
", 
         Name = "hotel keeper", 
         Alignment = 0, 
         Vnum = 21025, 
         Position = "standing", 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if inroom($i) == 21069\
  say Go on back and pick a room.\
  , points over his shoulder.\
  mptransfer $n 21146\
  mpat $n mea $n The hotel keeper points you down the hall.\
  mpat $n say When you wan'na leave, just tell me. And don't mess up the sheets\
  mppurge coins\
endif\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "200", 
            }, 
            [2] = 
            {
               Code = "if inroom($i) == 21146\
if inroom($n) == 21146\
  mptransfer $n 21069\
  mpat $n mea $n The hotel keeper leads you out.\
endif\
endif\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "leave exit", 
            }, 
            [3] = 
            {
               Code = "Say Welcome $n your room awits you.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "", 
            }, 
            [4] = 
            {
               Code = "say Welcome $n your room awaits.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the hotel keeper", 
         Credits = 0, 
         NumberOfAttacks = 4, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 15, 
            DamPlus = 1000, 
            DamNoDice = 100, 
         }, 
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            ProfitFix = 100, 
            KeeperShortDescr = "the hotel keeper", 
         }, 
      }, 
      [21028] = 
      {
         Race = "Human", 
         LongDescr = "A pensive sage mulls over new Jedi's .\
", 
         Name = "sage man", 
         Alignment = 0, 
         Vnum = 21028, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the sage", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 800, 
            DamNoDice = 100, 
         }, 
         Description = "", 
      }, 
      [21029] = 
      {
         Race = "Human", 
         LongDescr = "A large man stands here, selling equipment for adventurers.\
", 
         Name = "storekeeper", 
         Alignment = 0, 
         Vnum = 21029, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "the storekeeper", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [14] = "gamorrese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the storekeeper", 
         Credits = 0, 
         NumberOfAttacks = 4, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 1000, 
            DamNoDice = 100, 
         }, 
         Description = "", 
      }, 
      [21031] = 
      {
         Race = "Human", 
         LongDescr = "The ranger Shuttleer demonstrates combat maneuvers.\
", 
         Name = "man ranger", 
         Alignment = 0, 
         Vnum = 21031, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the ranger Shuttleer", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 800, 
            DamNoDice = 100, 
         }, 
         Description = "", 
      }, 
      [21416] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "newbie mob", 
         Alignment = 0, 
         Vnum = 21416, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created newbie mob", 
      }, 
      [21034] = 
      {
         Race = "Human", 
         LongDescr = "A robed woman is here, Shuttleing initiate officers.\
", 
         Name = "woman Shuttleer", 
         Alignment = 0, 
         Vnum = 21034, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the officers Shuttleer", 
         Credits = 0, 
         NumberOfAttacks = 4, 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 1000, 
            DamNoDice = 100, 
         }, 
         Description = "", 
      }, 
      [21035] = 
      {
         Race = "Human", 
         LongDescr = "A giant man stands here, waiting to Shuttle young warriors.\
", 
         Name = "man Shuttleer", 
         Alignment = 0, 
         Vnum = 21035, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Warrior Shuttleer", 
         Credits = 0, 
         NumberOfAttacks = 5, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 100, 
            DamPlus = 800, 
            DamNoDice = 5, 
         }, 
         Description = "", 
      }, 
      [21420] = 
      {
         Race = "Human", 
         LongDescr = "A dark figure lurks here, hiding in the shadows.\
", 
         Name = "dark figure bounty hunter", 
         Alignment = 0, 
         Vnum = 21420, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n A man hidden in the shadows beckons you over to him.\
  tell $n I have some information which may be of some value...\
  tell $n And for a price I will perhaps share it with you.\
endif\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "25", 
            }, 
            [2] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
    mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "p how much", 
            }, 
            [3] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
   mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "p what price", 
            }, 
            [4] = 
            {
               Code = "mpecho $n $I quickly tucks the coins inside his pocket, stepping toward\
$n.\
say $n 'I took this from a Mon Calamrian... a weak, sniveling Calamrian I\
was to kill\
mpecho He continues, 'He traded me this artifact in exchange for his\
life.'\
mpecho The figure says, 'Lucky was he the Bounty on his head was\
low...'\
mpecho The figure says, 'you seem to be trustworthy ...Forget about the\
Mon's..\
mpecho The figure says, 'Join the underground world and the\
Empire.....'\
mpecho He produces a strange, tied hologram from his\
pocket.\
mpoload 21420\
give hologram $n\
mpjunk all.credits\
mpjunk all.hologram\
say good...doing business with you, $n\
hide\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "45000", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 200, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Height = 0, 
         Level = 10, 
         DamRoll = 0, 
         ShortDescr = "the bounty hunter", 
         Credits = 0, 
         NumberOfAttacks = 1, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "A dark Mon Calamrian stands before you, seemingly wearing the shadows around him\
like a cloak.  His gaze bores into your soul, and he appears to beckon\
you over to speak with him.  The glint of a blaster by his side alerts you\
that this man is probably bounty hunter.\
", 
      }, 
      [21037] = 
      {
         Race = "Human", 
         LongDescr = "A Mon Calamrian guard patrols the streets of the city.\
", 
         Name = "guard man", 
         Alignment = 1000, 
         Vnum = 21037, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
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
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 20, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21041] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "guard", 
         Alignment = 1000, 
         Vnum = 21041, 
         Position = "sleeping", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 20, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 90, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 5, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 100, 
         LongDescr = "A tired guard is here.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 3, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "the guard", 
      }, 
      [21043] = 
      {
         Race = "Human", 
         LongDescr = "A E-Web guard stares out over the area.\
", 
         Name = "E-web guard", 
         Alignment = 0, 
         Vnum = 21043, 
         Position = "standing", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 0, 
         ShortDescr = "the guard", 
         Credits = 500, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21044] = 
      {
         Race = "Human", 
         LongDescr = "A executioner stands silently before you.\
", 
         Name = "executioner", 
         Alignment = 0, 
         Vnum = 21044, 
         Position = "standing", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [2] = "DetectEvil", 
            [3] = "DetectInvis", 
            [13] = "Protect", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [7] = "Sanctuary", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         ShortDescr = "the Executioner", 
         Credits = 0, 
         NumberOfAttacks = 4, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 800, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21045] = 
      {
         Race = "Yevetha", 
         DefaultPosition = "standing", 
         Name = "dog stray", 
         Alignment = 0, 
         Vnum = 21045, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 35, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [18] = "_clan", 
               [19] = "adarese", 
               [21] = "defel", 
               [22] = "dosh", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [29] = "gand", 
               [30] = "durese", 
            }, 
         }, 
         ArmorClass = 100, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 5, 
         DamRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Credits = 0, 
         LongDescr = "A stray Mosny dog noses along the street.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a stray", 
      }, 
      [21431] = 
      {
         Race = "Human", 
         LongDescr = "A proud man stands here, deliberating over his theories.\
", 
         Name = "kinalsta man", 
         Alignment = 0, 
         Vnum = 21431, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30000, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 51, 
         DamRoll = 0, 
         ShortDescr = "Kinalsta", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 1000, 
            DamNoDice = 100, 
         }, 
         Description = "", 
      }, 
      [21433] = 
      {
         Race = "Human", 
         LongDescr = "A sleeping Security Guard rests here.\
", 
         Name = "guard sleeping", 
         Alignment = 40, 
         Vnum = 21433, 
         Position = "incapacitated", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear the sweat sounds of a guard snoring.\
say &c ZZZZZZZZZZzzzzzzzzzz    ZZZZZZZZZZZZZzzzzzzzzzz\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 49, 
         DamRoll = 0, 
         ShortDescr = "A sleeping Security Guard", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
      }, 
      [21434] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "woman sec secretary female", 
         Alignment = -750, 
         Vnum = 21434, 
         Position = "standing", 
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
            [0] = "fire", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 100, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Please state your emergency, I'm busy here.\
mpecho You see the secretary return to watching\
\
mpecho her favorite soap.\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "hi hello", 
            }, 
            [2] = 
            {
               Code = "Say Ya ya ya take a number $n.\
Say please fill out these forms and give me 200 credits for the\
say apointment.\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "hurt sick injured bleeding emergency ", 
            }, 
            [3] = 
            {
               Code = "Say Sorry we have paying customers here. Move along!\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "insurance poor money broke", 
            }, 
            [4] = 
            {
               Code = "Say Well, well you do have money! Have a good time.\
mptransfer $n 21071\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "200", 
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
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 1, 
         LongDescr = "A Mon Calamrian Secretary sits here doing important things.\
\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "A female Secretary ", 
      }, 
      [21435] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "mon nurse", 
         Alignment = 0, 
         Vnum = 21435, 
         Position = "standing", 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 510, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = -27, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "&P A Mon Calamarian Nurse", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 51, 
         DamRoll = 10, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "&P A Mon Calamarian Nurse sorts through medical supplies.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 10, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 5, 
         }, 
         ShortDescr = "&P A Mon Calamarian Nurse", 
      }, 
      [21052] = 
      {
         Race = "Human", 
         LongDescr = "A strange figure lurks furtively.\
", 
         Name = "thief figure", 
         Alignment = 0, 
         Vnum = 21052, 
         Position = "standing", 
         Resistant = 
         {
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [15] = "Sneak", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_thief", 
         }, 
         HitChance = 
         {
            HitNoDice = 3, 
            HitPlus = 50, 
            HitSizeDice = 40, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho From behind the shadows you can feel somone lighten your pockets.\
mpforce $n give 25 credits thief\
mpecho You turn around and see noone.\
", 
               MudProgType = "greet_prog", 
               ScriptType = "MProg", 
               Arguments = "29", 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 8, 
         DamRoll = 0, 
         ShortDescr = "the thief", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamPlus = 5, 
            DamNoDice = 3, 
         }, 
         Description = "", 
      }, 
      [21437] = 
      {
         Race = "Human", 
         LongDescr = "&R A sleeping Mount shop keeper lies here.\
", 
         Name = "sleeping shop ", 
         Alignment = 40, 
         Vnum = 21437, 
         Position = "incapacitated", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
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
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear the soft sounds of ZZZZZZZZZzzzzzzzz coming from the shop\
mpecho keeper!\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "35", 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 49, 
         DamRoll = 0, 
         ShortDescr = "&R A sleeping Mount shop keeper ", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Description = "This shop keeper is of a very young age, most likely hi father left him\
here to rent out the\
beasts.\
", 
      }, 
      [21438] = 
      {
         Race = "Human", 
         LongDescr = "&c An Elite Security Officer , Hyko stands here.\
", 
         Name = "elite officer hyko", 
         Alignment = 1000, 
         Vnum = 21438, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say &z Hey if your not supposed to be here, leave before\
Say &z I place you in one of those.\
mpecho The guard points toward the jail cell.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "Say &z Sorry pal but your mouth just bought you a night in jail!\
mptransfer $n 21147\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "fuck ass suck dick ", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 8, 
            HitPlus = 400, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Height = 0, 
         Level = 40, 
         DamRoll = 6, 
         ShortDescr = "&c An Elite Security Officer , Hyko ", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 6, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 4, 
         }, 
         Description = "", 
      }, 
      [21055] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "beggar man beggarprog", 
         Alignment = 300, 
         Vnum = 21055, 
         Position = "standing", 
         Description = "The old man is clad in the rags of what was once a military outfit.\
He eyes you warily and holds out a tin cup in supplication...\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 20, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
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
         ArmorClass = 100, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if name($n) == dog stray\
  emote pets the dog.\
  mpforce stray lick beggar\
  say That's a good boy, here's a small treat.\
  mpecho The beggar tosses a scrap of meat across the road.\
  mpecho The stray quickly chases after it, eager to fill his belly.\
else\
  say Could you spare a few coins please?\
  beg $n\
endif\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = ", rummages in one of many pouches, searching for gold no doubt.\
", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "5", 
            }, 
            [3] = 
            {
               Code = "say OHHH MY!!!\
mpecho The beggar suddenly clutches his chest and doubles over.\
mpecho In the blink of an eye, he is dead. \
mpecho The surprise and shock must have been too much for him.\
mpat 21194 mpforce cleric mpat beggarprog mppurge beggarprog\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "1000", 
            }, 
            [4] = 
            {
               Code = "say I cannot express my gratitude in words $n!\
kis $n\
say If only others were so generous.\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [5] = 
            {
               Code = "say Thank you for such a worthy donation.\
thank $n\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "10", 
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
         Height = 0, 
         Level = 3, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A decrepit old beggar sits on the cobbles of the road, pleading.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 3, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "the beggar", 
      }, 
      [21056] = 
      {
         Race = "_78", 
         LongDescr = "A proud Calmese bird perches regally here, defiant to all.\
", 
         Name = "Calmese", 
         Alignment = 0, 
         Vnum = 21056, 
         Position = "standing", 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
            HitNoDice = 3, 
            HitPlus = 100, 
            HitSizeDice = 75, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [9] = "antarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
         }, 
         ArmorClass = -20, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 0, 
         ShortDescr = "the regal calmese", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 10, 
            DamNoDice = 3, 
         }, 
         Description = "The Calmese returns your stare with unfeeling eyes.  Its beak and talons\
appear as though they could rend even the toughest of flesh.\
", 
      }, 
      [21057] = 
      {
         Race = "_86", 
         DefaultPosition = "standing", 
         Name = "bantha", 
         Alignment = 0, 
         Vnum = 21057, 
         Position = "standing", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         Description = "This white bantha sports a brilliant white coat and  lies at your approach.\
She appears ready to serve anyone.\
", 
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
            HitNoDice = 2, 
            HitPlus = 100, 
            HitSizeDice = 100, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [18] = "_clan", 
               [15] = "togorian", 
            }, 
            Speaks = 
            {
               [18] = "_clan", 
               [9] = "antarian", 
            }, 
         }, 
         ArmorClass = 80, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Height = 0, 
         Level = 20, 
         DamRoll = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Credits = 0, 
         LongDescr = "A smelly white bantha slowly trods in a circle.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 10, 
            DamNoDice = 3, 
         }, 
         ShortDescr = "the smelly bantha", 
      }, 
      [21058] = 
      {
         Race = "Dewback", 
         DefaultPosition = "standing", 
         Name = "dewback", 
         Alignment = 0, 
         Vnum = 21058, 
         Position = "standing", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         Description = "The green dewback snorts as you examine him.  His green scales shine\
brightly regardless of light and the dewback seems as though it could\
move tirelessly for days. dewbacks are scarse here...mostly for pets.\
", 
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
            HitNoDice = 3, 
            HitPlus = 250, 
            HitSizeDice = 100, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [18] = "_clan", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [11] = "barabel", 
            }, 
         }, 
         ArmorClass = 80, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Height = 0, 
         Level = 25, 
         DamRoll = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Credits = 0, 
         LongDescr = "A mighty green dewback beats angrily at the ground here.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 30, 
            DamNoDice = 3, 
         }, 
         ShortDescr = "the dewback", 
      }, 
      [21059] = 
      {
         Race = "_74", 
         DefaultPosition = "standing", 
         Name = "teke lizard", 
         Alignment = 0, 
         Vnum = 21059, 
         Position = "standing", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Description = "The teke lizard appears frightened out of its mind...\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 50, 
            HitSizeDice = 75, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [9] = "antarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
         }, 
         ArmorClass = 20, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 5, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A teke lizard scampers away from your booted feet.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 20, 
            DamNoDice = 3, 
         }, 
         ShortDescr = "teke lizard", 
      }, 
      [21060] = 
      {
         Race = "_73", 
         DefaultPosition = "standing", 
         Name = "dog", 
         Alignment = 0, 
         Vnum = 21060, 
         Position = "standing", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Description = "The Mon Calmarian mutt constantly sniffs the ground, searching for its prey.\
", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitPlus = 85, 
            HitSizeDice = 75, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [9] = "antarian", 
               [11] = "barabel", 
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [9] = "antarian", 
               [18] = "_clan", 
               [11] = "barabel", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
            }, 
         }, 
         ArmorClass = 30, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 10, 
         DamRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Credits = 0, 
         LongDescr = "A mon calamrian mutt paces in circles here, sniffing the ground.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 10, 
            DamNoDice = 5, 
         }, 
         ShortDescr = "the Mon Calmarian mutt", 
      }, 
      [21061] = 
      {
         Race = "Human", 
         LongDescr = "A heavy guard walks the wall of the city.\
", 
         Name = "guard man", 
         Alignment = 1000, 
         Vnum = 21061, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
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
         ArmorClass = 5, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21062] = 
      {
         Race = "Human", 
         LongDescr = "A Docking bay guard tends the western Docking bay.\
", 
         Name = "guard", 
         Alignment = 1000, 
         Vnum = 21062, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un w\
op w\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close w\
\
lock w\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 150, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the Docking bay guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21063] = 
      {
         Race = "Human", 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Name = "man guard", 
         Alignment = 1000, 
         Vnum = 21063, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un e\
op e\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close e\
lock e\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21064] = 
      {
         Race = "Human", 
         LongDescr = "A Docking bay guard tends the north Docking bay.\
", 
         Name = "guard man", 
         Alignment = 1000, 
         Vnum = 21064, 
         Position = "standing", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un n\
op n\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close n\
lock n\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
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
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21065] = 
      {
         Race = "Human", 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Name = "guard", 
         Alignment = 1000, 
         Vnum = 21065, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close s\
lock s\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "unlock s\
op s\
\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 15, 
            DamNoDice = 3, 
         }, 
         Description = "", 
      }, 
      [21066] = 
      {
         Race = "Human", 
         LongDescr = "A guard of watches you as you move by.\
", 
         Name = "guard", 
         Alignment = 1000, 
         Vnum = 21066, 
         Position = "standing", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un e\
op e\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close e\
lock e\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
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
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21067] = 
      {
         Race = "Human", 
         LongDescr = "A guard of the city stands here.\
", 
         Name = "man guard", 
         Alignment = 1000, 
         Vnum = 21067, 
         Position = "standing", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un w\
op w\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close w\
lock w\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21068] = 
      {
         Race = "Human", 
         LongDescr = "A guard of the city stands at the ready.\
", 
         Name = "guard", 
         Alignment = 1000, 
         Vnum = 21068, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un s\
op s\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close s\
lock s\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 150, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21069] = 
      {
         Race = "Human", 
         LongDescr = "An guard keeps vigilant watch here.\
", 
         Name = "guard", 
         Alignment = 1000, 
         Vnum = 21069, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "un n\
op n\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close n\
lock n\
close manhole\
", 
               MudProgType = "time_prog", 
               ScriptType = "MProg", 
               Arguments = "20", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the guard", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21070] = 
      {
         Race = "_86", 
         DefaultPosition = "standing", 
         Name = "ratler", 
         Alignment = 0, 
         Vnum = 21070, 
         Position = "standing", 
         Description = "This fat, lumbering creature is tame and unkept. You find yourself\
wondering what it carries.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 40, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [18] = "_clan", 
               [15] = "togorian", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [6] = "shistavanen", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [0] = "basic", 
               [18] = "_clan", 
            }, 
         }, 
         ArmorClass = 150, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 6, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A pack ratler lumbers about, carrying its master's belongings.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 8, 
            DamNoDice = 3, 
         }, 
         ShortDescr = "the pack ratler", 
      }, 
      [21071] = 
      {
         Race = "Human", 
         LongDescr = "A E-Web guard peers over the area.\
", 
         Name = "E-Web Guard", 
         Alignment = 1000, 
         Vnum = 21071, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 2, 
         ShortDescr = "the E-web", 
         Credits = 0, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21073] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21073, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21074] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21074, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21075] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21075, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21076] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21076, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21077] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21077, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21078] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21078, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21079] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21079, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21080] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Key", 
         Alignment = 0, 
         Vnum = 21080, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created key", 
      }, 
      [21081] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "man elderly george lucas", 
         Alignment = 0, 
         Vnum = 21081, 
         Position = "standing", 
         Description = "This bearded human was jailed after he lost control and shot several Mon\
Calamari individuals. His clothes are ragged and it is rumored that at one\
time he was well known for his excellent Sci-Fiction writing. There is a\
small patch with writing on it. \
", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitPlus = 150, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 62, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hey tell me your here to buy my new script... Intersteller Wars?\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
         Height = 0, 
         Level = 15, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "&p An elderly entertainment man rests on the bed contimplating filming a movie.\
&x\
\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         ShortDescr = "&p An elderly entertainment man ", 
      }, 
      [21082] = 
      {
         Race = "Gamorrean", 
         DefaultPosition = "standing", 
         Name = "gamorrean male Toisk", 
         Alignment = 0, 
         Vnum = 21082, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 100, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         ArmorClass = 10, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 10, 
         DamRoll = 0, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         Credits = 0, 
         LongDescr = "&G Toisk, A rather dumb Gamorrean male sits here counting the cracks in the\
floor.\
", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "&G Toisk, A rather dumb Gamorrean male", 
      }, 
      [21083] = 
      {
         Race = "Human", 
         LongDescr = "&z A Tk-13y voice active security scanner frames the enterace. &z\
", 
         Name = "scanner enterance", 
         Alignment = 1000, 
         Vnum = 21083, 
         Position = "standing", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 0, 
         ShortDescr = "&z A Tk-13y Security scanner", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21084] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Greeting Protocol Droid", 
         Alignment = 0, 
         Vnum = 21084, 
         Position = "standing", 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 100, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [18] = "Mountable", 
            [0] = "Npc", 
            [30] = "Prototype", 
            [26] = "Droid", 
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
         ArmorClass = 75, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 10, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A power droid is here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "&z Greeting Protocol Droid stands here.", 
      }, 
      [21100] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Protocol Droid Secretary", 
         Alignment = 0, 
         Vnum = 21100, 
         Position = "standing", 
         Description = "As busy as this guy is he still takes the time to help each and\
every customer that walks into the room.  His silver coated frame\
gleems brightly and you can see that he will remain in service \
for some time barring any accidents.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 2, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Protocol Droid Secretary Greets you\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 3, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "Protocol Droid", 
      }, 
      [21101] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "Janitor", 
         Alignment = 0, 
         Vnum = 21101, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A janitor droid scoots about picking up your trash\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "A janitor Droid", 
      }, 
      [21445] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "drunk quarren", 
         Alignment = 0, 
         Vnum = 21445, 
         Position = "standing", 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 110, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = 72, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say hello, You new here $n? or have I talked to you I don't know, \
say hey bartender get me another drink.\
mpecho You see the bartender poor the quarren another drink.\
say you ever been down to the quarren city $n It's awsome.\
mpecho You see the drunk reach in his pockets and \
mpecho you see he has no credits.\
Say hey $n give me 200 credits and I'll give you a map to the Quarren city\
.\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "hi hello", 
            }, 
            [2] = 
            {
               Code = "Say well thanks $n\
mpoload 21113\
give map $n\
", 
               MudProgType = "bribe_prog", 
               ScriptType = "MProg", 
               Arguments = "200 ", 
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
         Height = 0, 
         Level = 11, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A quarren drunk stumbles here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         ShortDescr = "A quarren drunk ", 
      }, 
      [21448] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "clerk mon bank", 
         Alignment = 0, 
         Vnum = 21448, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = -25, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say  &c Hello, welcome to the first bank of Mon ,\
Say &c Here your money is safe with us.\
smile $n\
mpecho &R You are reasured of that fact as you feal a red\
mpecho &R laser beam scan you for your bio-info.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
         Height = 0, 
         Level = 50, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "&G A \"First Bank of Mon\" bank clerk counts credits to be sorted.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 5, 
         }, 
         ShortDescr = "&G A \"First Bank of Mon\" bank clerk", 
      }, 
      [21447] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "child mon", 
         Alignment = 0, 
         Vnum = 21447, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A Mon child digs in the ground.\
", 
         NumberOfAttacks = 1, 
         Weight = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 3, 
            DamNoDice = 1, 
         }, 
         ShortDescr = "A Mon child", 
      }, 
      [21446] = 
      {
         Race = "Quarren", 
         DefaultPosition = "standing", 
         Name = "quarren child", 
         Alignment = 0, 
         Vnum = 21446, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30, 
            HitSizeDice = 1, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "A Quarren child plays here.\
", 
         NumberOfAttacks = 1, 
         Weight = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 3, 
            DamNoDice = 1, 
         }, 
         ShortDescr = "A Quarren child plays here.", 
      }, 
      [21499] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "final mob", 
         Alignment = 0, 
         Vnum = 21499, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created final mob", 
      }, 
      [21444] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "food dispensor", 
         Alignment = 0, 
         Vnum = 21444, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         ArmorClass = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "&R A XT-4y Food Dispensor ", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "&R A XT-4y Food Dispensor sits here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "&R A XT-4y Food Dispensor ", 
      }, 
      [21436] = 
      {
         Race = "Human", 
         LongDescr = "&C A TK-71 cooking droid stands behind the grill waiting.\
", 
         Name = "Cooking Droid", 
         Alignment = 1000, 
         Vnum = 21436, 
         Position = "standing", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "A TK-71 cooking droid", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitPlus = 300, 
            HitSizeDice = 15, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = 0, 
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
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         Level = 15, 
         DamRoll = 0, 
         ShortDescr = "A TK-71 cooking droid", 
         Credits = 0, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 10, 
            DamNoDice = 1, 
         }, 
         Description = "", 
      }, 
      [21415] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "newbie mob", 
         Alignment = 0, 
         Vnum = 21415, 
         Position = "standing", 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ArmorClass = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Level = 1, 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Credits = 0, 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created newbie mob", 
      }, 
      [21400] = 
      {
         Race = "Human", 
         DefaultPosition = "standing", 
         Name = "takiki mon police clerk", 
         Alignment = 0, 
         Vnum = 21400, 
         Position = "standing", 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police", 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 110, 
            HitSizeDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         ArmorClass = 72, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Hello how can I help you....well come on..\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "hi", 
            }, 
            [2] = 
            {
               Code = "Say Sorry $n come back with someone who cares.\
", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "crime killed prison free", 
            }, 
            [3] = 
            {
               Code = "mpecho As you enter the clerk looks up\
mpecho stares you down..\
laugh\
mpecho Then returns to work.\
", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
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
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Strength = 10, 
         }, 
         Height = 0, 
         Level = 11, 
         DamRoll = 0, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Credits = 0, 
         LongDescr = "Takiki, A Mon Calamarian police clerk\
", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         ShortDescr = "Takiki, A Mon Calamarian police clerk", 
      }, 
   }, 
   VnumRanges = 
   {
      Object = 
      {
         Last = 21435, 
         First = 21000, 
      }, 
      Mob = 
      {
         Last = 21499, 
         First = 21000, 
      }, 
      Room = 
      {
         Last = 21499, 
         First = 21000, 
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
   Resets = 
   {
      [1] = 
      {
         Arg1 = 21045, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21003, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg1 = 21055, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21010, 
         Command = "M", 
      }, 
      [3] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 21012, 
         Command = "M", 
      }, 
      [4] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [5] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [6] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [7] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [8] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [9] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [10] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [11] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [12] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [13] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 21018, 
         Command = "M", 
      }, 
      [14] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [15] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [16] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [17] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [18] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [19] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [20] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [21] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [22] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [23] = 
      {
         Arg1 = 21052, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21026, 
         Command = "M", 
      }, 
      [24] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 21029, 
         Command = "M", 
      }, 
      [25] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [26] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [27] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [28] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [29] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [30] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [31] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [32] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [33] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [34] = 
      {
         Arg1 = 21045, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21048, 
         Command = "M", 
      }, 
      [35] = 
      {
         Arg1 = 21017, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21053, 
         Command = "M", 
      }, 
      [36] = 
      {
         Arg1 = 21048, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21053, 
         Command = "O", 
      }, 
      [37] = 
      {
         Arg1 = 38, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21053, 
         Command = "O", 
      }, 
      [38] = 
      {
         Arg1 = 21001, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21055, 
         Command = "M", 
      }, 
      [39] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21422, 
      }, 
      [40] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21423, 
      }, 
      [41] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21424, 
      }, 
      [42] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21425, 
      }, 
      [43] = 
      {
         Arg1 = 21011, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21056, 
         Command = "M", 
      }, 
      [44] = 
      {
         Arg1 = 21018, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21057, 
         Command = "M", 
      }, 
      [45] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21014, 
      }, 
      [46] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21015, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21016, 
      }, 
      [48] = 
      {
         Arg1 = 21002, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21058, 
         Command = "M", 
      }, 
      [49] = 
      {
         Arg1 = 21019, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21060, 
         Command = "M", 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21020, 
      }, 
      [51] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21021, 
      }, 
      [52] = 
      {
         Arg1 = 21020, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21061, 
         Command = "M", 
      }, 
      [53] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21017, 
      }, 
      [54] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21018, 
      }, 
      [55] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21019, 
      }, 
      [56] = 
      {
         Arg1 = 21016, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21062, 
         Command = "M", 
      }, 
      [57] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [59] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21081, 
      }, 
      [60] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21082, 
      }, 
      [61] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 21062, 
         Command = "M", 
      }, 
      [62] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [63] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [64] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [65] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [66] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [67] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [68] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [69] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [70] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [71] = 
      {
         Arg1 = 21055, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21063, 
         Command = "O", 
      }, 
      [72] = 
      {
         Arg1 = 21052, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21064, 
         Command = "M", 
      }, 
      [73] = 
      {
         Arg1 = 21052, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21064, 
         Command = "M", 
      }, 
      [74] = 
      {
         Arg1 = 21055, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21064, 
         Command = "O", 
      }, 
      [75] = 
      {
         Arg1 = 21055, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21065, 
         Command = "O", 
      }, 
      [76] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 21080, 
         Command = "M", 
      }, 
      [77] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [78] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [79] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [80] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [81] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [82] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [83] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [84] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [85] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
      }, 
      [86] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
      }, 
      [87] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [88] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [89] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [90] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [91] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21087, 
         Command = "M", 
      }, 
      [92] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [93] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [94] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [95] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [96] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [97] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [98] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [99] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [100] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [101] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
      }, 
      [102] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
      }, 
      [103] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [104] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [105] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [106] = 
      {
         Arg1 = 21070, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [107] = 
      {
         Arg1 = 21087, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [108] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21088, 
         Command = "M", 
      }, 
      [109] = 
      {
         Arg1 = 21070, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [110] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [111] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [112] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [113] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [114] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [115] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [116] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [117] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [118] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [119] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [120] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [121] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [122] = 
      {
         Arg1 = 21088, 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [123] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21099, 
         Command = "M", 
      }, 
      [124] = 
      {
         Arg1 = 21071, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [125] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [126] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [127] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [128] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [129] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [130] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [131] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [132] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [133] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [134] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [135] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [136] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [137] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
      }, 
      [138] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
      }, 
      [139] = 
      {
         Arg1 = 21099, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [140] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21112, 
         Command = "M", 
      }, 
      [141] = 
      {
         Arg1 = 21072, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [142] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
      }, 
      [143] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [144] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [145] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [146] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [147] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [148] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [149] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [150] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [151] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [152] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
      }, 
      [153] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [154] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [155] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [156] = 
      {
         Arg1 = 21112, 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [157] = 
      {
         Arg1 = 21003, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21054, 
         Command = "M", 
      }, 
      [158] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32230, 
      }, 
      [159] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10487, 
      }, 
      [160] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 21054, 
         Command = "M", 
      }, 
      [161] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [162] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [163] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [164] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [165] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [166] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [167] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [168] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [169] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [170] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21075, 
         Command = "M", 
      }, 
      [171] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [172] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [173] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [174] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [175] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [176] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [177] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [178] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [179] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [180] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [181] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [182] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [183] = 
      {
         Arg1 = 21073, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [184] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
      }, 
      [185] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
      }, 
      [186] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21075, 
         Command = "M", 
      }, 
      [187] = 
      {
         Arg1 = 21075, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [188] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21119, 
         Command = "M", 
      }, 
      [189] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 21114, 
         Command = "M", 
      }, 
      [190] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [191] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [192] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [193] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [194] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [195] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [196] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [197] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [198] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [199] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [200] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
      }, 
      [201] = 
      {
         Arg1 = 21065, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
      }, 
      [202] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [203] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [204] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [205] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [206] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [207] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [208] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [209] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [210] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [211] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [212] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [213] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [214] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [215] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [216] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [217] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [218] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [219] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [220] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [221] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [222] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [223] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [224] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [225] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [226] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [227] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [228] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [229] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [230] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [231] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21022, 
      }, 
      [232] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21019, 
      }, 
      [233] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21020, 
      }, 
      [234] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10317, 
      }, 
      [235] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10312, 
      }, 
      [236] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10424, 
      }, 
      [237] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21114, 
         Command = "M", 
      }, 
      [238] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 21106, 
         Command = "M", 
      }, 
      [239] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 21094, 
         Command = "M", 
      }, 
      [240] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 6, 
         Arg3 = 21089, 
         Command = "M", 
      }, 
      [241] = 
      {
         Arg1 = 21435, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21129, 
         Command = "M", 
      }, 
      [242] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32254, 
      }, 
      [243] = 
      {
         Arg1 = 32231, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21071, 
         Command = "O", 
      }, 
      [244] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21100, 
         Command = "M", 
      }, 
      [245] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [246] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [247] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [248] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [249] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [250] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [251] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [252] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [253] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [254] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [255] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [256] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [257] = 
      {
         Arg1 = 21071, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [258] = 
      {
         Arg1 = 21421, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21100, 
         Command = "O", 
      }, 
      [259] = 
      {
         Arg1 = 21100, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [260] = 
      {
         Arg1 = 21068, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21074, 
         Command = "M", 
      }, 
      [261] = 
      {
         Arg1 = 21073, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [262] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [263] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [264] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [265] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [266] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [267] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [268] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [269] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [270] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [271] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [272] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [273] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [274] = 
      {
         Arg1 = 21074, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [275] = 
      {
         Arg1 = 21014, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21052, 
         Command = "M", 
      }, 
      [276] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21094, 
      }, 
      [277] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [278] = 
      {
         Arg1 = 21444, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21128, 
         Command = "M", 
      }, 
      [279] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6824, 
      }, 
      [280] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32283, 
      }, 
      [281] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21113, 
         Command = "M", 
      }, 
      [282] = 
      {
         Arg1 = 21056, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
      }, 
      [283] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
      }, 
      [284] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [285] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [286] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
      }, 
      [287] = 
      {
         Arg1 = 21061, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [288] = 
      {
         Arg1 = 21062, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
      }, 
      [289] = 
      {
         Arg1 = 21063, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
      }, 
      [290] = 
      {
         Arg1 = 21064, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
      }, 
      [291] = 
      {
         Arg1 = 21066, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
      }, 
      [292] = 
      {
         Arg1 = 21067, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
      }, 
      [293] = 
      {
         Arg1 = 21069, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [294] = 
      {
         Arg1 = 21072, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [295] = 
      {
         Arg1 = 21113, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [296] = 
      {
         Arg1 = 21436, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21072, 
         Command = "M", 
      }, 
      [297] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6814, 
      }, 
      [298] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6824, 
      }, 
      [299] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6822, 
      }, 
      [300] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6825, 
      }, 
      [301] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21133, 
      }, 
      [302] = 
      {
         Arg1 = 32208, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21072, 
         Command = "O", 
      }, 
      [303] = 
      {
         Arg1 = 21059, 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 21135, 
         Command = "M", 
      }, 
      [304] = 
      {
         Arg1 = 21060, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21135, 
         Command = "M", 
      }, 
      [305] = 
      {
         Arg1 = 21447, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
      }, 
      [306] = 
      {
         Arg1 = 21446, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
      }, 
      [307] = 
      {
         Arg1 = 21446, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
      }, 
      [308] = 
      {
         Arg1 = 21447, 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
      }, 
      [309] = 
      {
         Arg1 = 21446, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21137, 
         Command = "M", 
      }, 
      [310] = 
      {
         Arg1 = 21447, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21137, 
         Command = "M", 
      }, 
      [311] = 
      {
         Arg1 = 21446, 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 21136, 
         Command = "M", 
      }, 
      [312] = 
      {
         Arg1 = 21447, 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 21136, 
         Command = "M", 
      }, 
      [313] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 21007, 
         Command = "M", 
      }, 
      [314] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 9, 
         Arg3 = 21011, 
         Command = "M", 
      }, 
      [315] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 10, 
         Arg3 = 21015, 
         Command = "M", 
      }, 
      [316] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 11, 
         Arg3 = 21021, 
         Command = "M", 
      }, 
      [317] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 21027, 
         Command = "M", 
      }, 
      [318] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 13, 
         Arg3 = 21032, 
         Command = "M", 
      }, 
      [319] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 14, 
         Arg3 = 21001, 
         Command = "M", 
      }, 
      [320] = 
      {
         Arg1 = 21015, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21059, 
         Command = "M", 
      }, 
      [321] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [322] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [323] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [324] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [325] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 29008, 
      }, 
      [326] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [327] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [328] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [329] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [330] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [331] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 29007, 
      }, 
      [332] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [333] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 29006, 
      }, 
      [334] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21426, 
      }, 
      [335] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10311, 
      }, 
      [336] = 
      {
         Arg1 = 21448, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21138, 
         Command = "M", 
      }, 
      [337] = 
      {
         Arg1 = 21433, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21150, 
         Command = "M", 
      }, 
      [338] = 
      {
         Arg1 = 21427, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21150, 
         Command = "O", 
      }, 
      [339] = 
      {
         Arg1 = 21037, 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 21145, 
         Command = "M", 
      }, 
      [340] = 
      {
         Arg1 = 21114, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21000, 
         Command = "O", 
      }, 
      [341] = 
      {
         Arg1 = 21115, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21148, 
         Command = "O", 
      }, 
      [342] = 
      {
         Arg1 = 21116, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21148, 
         Command = "O", 
      }, 
      [343] = 
      {
         Arg1 = 21148, 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [344] = 
      {
         Arg1 = 21141, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [345] = 
      {
         Arg1 = 21140, 
         MiscData = 0, 
         Arg2 = 8, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [346] = 
      {
         Arg1 = 21116, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21149, 
         Command = "O", 
      }, 
      [347] = 
      {
         Arg1 = 21115, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21149, 
         Command = "O", 
      }, 
      [348] = 
      {
         Arg1 = 21149, 
         MiscData = 0, 
         Arg2 = 7, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [349] = 
      {
         Arg1 = 21139, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [350] = 
      {
         Arg1 = 21142, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [351] = 
      {
         Arg1 = 21143, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [352] = 
      {
         Arg1 = 21438, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21144, 
         Command = "M", 
      }, 
      [353] = 
      {
         Arg1 = 21140, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
      }, 
      [354] = 
      {
         Arg1 = 21081, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21146, 
         Command = "M", 
      }, 
      [355] = 
      {
         Arg1 = 21115, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21146, 
         Command = "O", 
      }, 
      [356] = 
      {
         Arg1 = 21116, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21146, 
         Command = "O", 
      }, 
      [357] = 
      {
         Arg1 = 21146, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [358] = 
      {
         Arg1 = 21073, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [359] = 
      {
         Arg1 = 21082, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21147, 
         Command = "M", 
      }, 
      [360] = 
      {
         Arg1 = 21117, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [361] = 
      {
         Arg1 = 28015, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
      }, 
      [362] = 
      {
         Arg1 = 21118, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [363] = 
      {
         Arg1 = 21115, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21147, 
         Command = "O", 
      }, 
      [364] = 
      {
         Arg1 = 21116, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21147, 
         Command = "O", 
      }, 
      [365] = 
      {
         Arg1 = 21147, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
         Command = "D", 
      }, 
      [366] = 
      {
         Arg1 = 21400, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21132, 
         Command = "M", 
      }, 
      [367] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [368] = 
      {
         Arg1 = 21132, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [369] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21067, 
         Command = "M", 
      }, 
      [370] = 
      {
         Arg1 = 21057, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21067, 
         Command = "M", 
      }, 
      [371] = 
      {
         Arg1 = 21437, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21067, 
         Command = "M", 
      }, 
      [372] = 
      {
         Arg1 = 60, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
      }, 
      [373] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21067, 
         Command = "M", 
      }, 
      [374] = 
      {
         Arg1 = 21058, 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 21067, 
         Command = "M", 
      }, 
      [375] = 
      {
         Arg1 = 21083, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21130, 
         Command = "M", 
      }, 
      [376] = 
      {
         Arg1 = 21130, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [377] = 
      {
         Arg1 = 21126, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [378] = 
      {
         Arg1 = 21434, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21127, 
         Command = "M", 
      }, 
      [379] = 
      {
         Arg1 = 21127, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [380] = 
      {
         Arg1 = 21040, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [381] = 
      {
         Arg1 = 21025, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21069, 
         Command = "M", 
      }, 
      [382] = 
      {
         Arg1 = 21069, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [383] = 
      {
         Arg1 = 21013, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21068, 
         Command = "M", 
      }, 
      [384] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21009, 
      }, 
      [385] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21008, 
      }, 
      [386] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21010, 
      }, 
      [387] = 
      {
         Arg1 = 21445, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21068, 
         Command = "M", 
      }, 
      [388] = 
      {
         Arg1 = 21068, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [389] = 
      {
         Arg1 = 21041, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [390] = 
      {
         Arg1 = 21022, 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [391] = 
      {
         Arg1 = 21021, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21066, 
         Command = "M", 
      }, 
      [392] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21076, 
      }, 
      [393] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21077, 
      }, 
      [394] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21078, 
      }, 
      [395] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21079, 
      }, 
      [396] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21080, 
      }, 
      [397] = 
      {
         Arg1 = 21066, 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [398] = 
      {
         Arg1 = 21066, 
         MiscData = 0, 
         Arg2 = 5, 
         Arg3 = 0, 
         Command = "D", 
      }, 
      [399] = 
      {
         Arg1 = 21180, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [400] = 
      {
         Arg1 = 21184, 
         MiscData = 0, 
         Arg2 = 3, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [401] = 
      {
         Arg1 = 21183, 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "D", 
      }, 
      [402] = 
      {
         Arg1 = 21435, 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 21187, 
         Command = "O", 
      }, 
   }, 
   ResetMessage = "Imperial TIE fighters scream past above, patrolling this occupied city.", 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   LowEconomy = 187437344, 
}
