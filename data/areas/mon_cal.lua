-- Mon Calamri
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   Name = "Mon Calamri", 
   Author = "Ackbar", 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Rooms = 
   {
      [21000] = 
      {
         Vnum = 21000, 
         Name = "Coral City Center", 
         Description = "&P You are standing within the expanse of the famous Mon Calamrian City of\
Coral City .  A metallic statue of Admiral Ackbar occupies the square's\
center, surrounded by gardens of shrubbery which enhance the air of\
serenity and peace here in the center of the city.  The main roads lead\
away in the cardinal directions, while to the east and west are smooth\
carved rock roads. The roof tops of a buildings can be seen rising to the\
south east.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [15] = "NoDropAll", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "&Y In Honor of the Great Admiral Ackbar.\
\13Who died giving his life for Freedom of all Underwater Creatures.\
\13We can only look tot he heavens for bravery like his.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21001, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Anna Avenue lies to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21036, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "To the east lies Barster Road.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21042, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Anna Avenue lies to the south.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21039, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "To the west lies Barster Road.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21001] = 
      {
         Vnum = 21001, 
         Name = "Anna Avenue", 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. Directly south you\
can see the circular center of Coral City.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21002, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Anna Avenue lies in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21000, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road to the south leads to the main  Square.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21002] = 
      {
         Vnum = 21002, 
         TeleVnum = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21003, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The worn metallic roads of Anna Avenue lie in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21001, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A peculiar section of Anna Avenue lies to the south.\
", 
            }, 
         }, 
         Name = "Anna Avenue", 
      }, 
      [21003] = 
      {
         Vnum = 21003, 
         TeleVnum = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. to the north you can see an intersection. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21004, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Anna Avenue and Security Road cross just north of here.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21002, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A rather bland portion of Anna Avenue lies to the south.\
", 
            }, 
         }, 
         Name = "Anna Avenue", 
      }, 
      [21004] = 
      {
         Vnum = 21004, 
         TeleVnum = 0, 
         Description = "&RYou stand at the intersection of &PAnna Avenue&R and Security Road.  This\
main road is home to the Mon Calamari Police. It is highly recommended\
that you do not walk down this street with rifle a blaze. Soft greenery\
have been added to the street sides to help make it look more attractive.\
To the north you can see the north docking bay where the transport ships\
continualy stop. Security Road lies to the east and west, while &P Anna\
Avenue &R can be seen to the north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
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
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21100, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The northern Docking bay can be seen in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21005, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road extends to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21003, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Going south will bring you near the heart of the city.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21035, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road extends to the west.\
", 
            }, 
         }, 
         Name = "Intersection of Anna Avenue and Security Road", 
      }, 
      [21005] = 
      {
         Vnum = 21005, 
         TeleVnum = 0, 
         Description = "&R This portion of Security Road seems extremly well taken care of.  A\
whistling northern wind can be heard passing the large Security building\
to the north.  The extremly large building was made out of grinded lava\
rock from the planet ocean floor. This extremly hard surface is known for\
it's ability to keep criminals inside. Security Road stretches  to the\
east and west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 21132, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21006, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21004, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The intersection of Anna Avenue and Security Road is to the west.\
", 
            }, 
         }, 
         Name = "Main Security Office", 
      }, 
      [21006] = 
      {
         Vnum = 21006, 
         TeleVnum = 0, 
         Description = "&RYou are on a straight section of Security Road.  A statue depicting a\
party of adventurers fighting off a Imperial Stortrooper sits in the\
center of the road.  Blinking back a tear, you remember hearing this tale\
in a local Factory , and realize that the statue is a memorial.  Security\
Road extends to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "statue", 
               Description = "The statue is of the Late members of S.P.I.N. belived to be past\
\13away.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21007, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road is to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21005, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road extends westward.\
", 
            }, 
         }, 
         Name = "Security Road", 
      }, 
      [21007] = 
      {
         Vnum = 21007, 
         TeleVnum = 0, 
         Description = "&R You are walking down Security Road.  The long road, which lines the\
northern wall of Coral City, meets up with Oceanview Street to the east to\
form one of the four corners of Coral City. Beyond these four corners is a\
small walkway guarded by a Mon built breakwater that turns back the\
largest ocean on a habital planet. The street continues westward.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21008, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road meets Luke Street to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21006, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road continues to the west.\
", 
            }, 
         }, 
         Name = "Security Road", 
      }, 
      [21008] = 
      {
         Vnum = 21008, 
         TeleVnum = 0, 
         Description = "&B Oceanview Street and Security Road come together here to form one of the\
four corners of Coral City. Oceanview Street lies to the south, while\
Security Road stretches westward.To the south you can see Mon Calamrian\
New Rebublic troops practicing military drills incase and invasion ever\
occurs again. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "West  - Security Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13South - Luke Street\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21009, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Luke Street lies to the south.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21007, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road lies to the west.\
", 
            }, 
         }, 
         Name = "Meeting of Oceanview Street and Security Road ", 
      }, 
      [21009] = 
      {
         Vnum = 21009, 
         TeleVnum = 0, 
         Description = "&B This section of Oceanview Street is reserved for the Mon Calamrian\
defense team.  E- Web Blaster's and Com - blasters are stacked high into\
the air, almost within reach of the  New Rebublic guards on the outpost.\
to the west. Oceanview Street stretches to the north and south.  You also\
\
see in the enterance a body scanner that will make sure you have no\
weapons on you.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21008, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Luke Street meets up with Security Road to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21010, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Luke Street continues to the south.\
", 
            }, 
         }, 
         Name = "Oceanview Street", 
      }, 
      [21010] = 
      {
         Vnum = 21010, 
         TeleVnum = 0, 
         Description = "&B This portion of Oceanview Street is rather poor and unkempt.  Rags\
\
litter the street, and several of the city's unfortunate have set up\
residence here.;A holohome has been set up on the eastern side of the\
road, a beggar's home no doubt.  They prefer this road thanks to the\
constant tourists that travelk it. Oceanview Street continues to the north\
and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21009, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Luke Street continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21011, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road ranges to the south.\
", 
            }, 
         }, 
         Name = "Oceanview Street", 
      }, 
      [21011] = 
      {
         Vnum = 21011, 
         TeleVnum = 0, 
         Description = "&BYou are walking down the northern half of Oceanview Street at a brisk\
pace. To the east is the towering  security wall of Coral City ,blocking\
your view of the awsome ocean.   Oceanview Street ranges to the north and\
south.  The road is extremly polished and looks as if not to many Mon\
Calamrian's travel down it.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21010, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Luke Street extends northward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21012, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Barster Road and Luke Street cross to the south.\
", 
            }, 
         }, 
         Name = "Oceanview Street", 
      }, 
      [21012] = 
      {
         Vnum = 21012, 
         TeleVnum = 0, 
         Description = "&B You stand at the intersection of Barster Road and Oceanview Street.  To\
the east you can see the massive east Docking bay of Coral City. This is\
one of the main smuggling bay's of the city.While Oceanview Street lies to\
the north and south, and Barster Road runs west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Luke Street\
\13        - To Security Road\
\13East  - The East Docking bay of Akatmer\
\13South - Luke Street\
\13        - To Trading Post Street\
\13        - To Law Avenue\
\13West  - Barster Road\
\13        - To Akatamer Square\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21011, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Luke Street is to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21113, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "To the east is the eastern Docking bay.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21013, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "You can see Luke Street stretch far to the south.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21038, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Barster Road lies to the east.\
", 
            }, 
         }, 
         Name = "Intersection of Barster Road and Oceanview Street", 
      }, 
      [21013] = 
      {
         Vnum = 21013, 
         TeleVnum = 0, 
         Description = "&B You take a brief pause on your way down Oceanview Street, and you can\
hear the chirping of some strange bird like creature  coming from the\
other side of the extending breakwall.  Upon catching your breath from the\
salty air, you gather  your belongings and continue on your way.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21012, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Barster Road and Luke Street cross just north of here.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21014, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The Trading Post  and Luke Street intersection is south of here.\
", 
            }, 
         }, 
         Name = "Oceanview Street", 
      }, 
      [21014] = 
      {
         Vnum = 21014, 
         TeleVnum = 0, 
         Description = "&B You stand at the intersection of Trading Post Street and Luke Street.\
You look out and can see the waves crash upon the breakwall To the west\
are the glorious pavilions and shops of Coral City, while Oceanview Street\
continues to the north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Luke Street\
\13        - To Barster Road\
\13        - To Security Road\
\13South - Luke Street\
\13        - To Law Avenue\
\13West  - Trading Post Street\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21013, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Luke Street lies in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21015, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Luke Street stretches southward as far as the eye can see.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21050, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The Trading posts of Akatamer await your arrival and Credits.\
", 
            }, 
         }, 
         Name = "Intersection of Trading post Street and Oceanview Street ", 
      }, 
      [21015] = 
      {
         Vnum = 21015, 
         TeleVnum = 0, 
         Description = "&B This portion of Oceanview street allows you see rest and watch one of\
the two suns set. Two crome like  benches sit on opposite sides of the\
polished rock road, enticing you to rest.  You can see Law Avenue meeting\
up with Oceanview Street to the south, while to the north is the Trading\
Post Street  and Oceanview Street intersection.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21014, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Trading post Street and Luke Street meet to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21016, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Gazing southward, you see the southeastern corner of Akatamer.\
", 
            }, 
         }, 
         Name = "Oceanview Street.", 
      }, 
      [21016] = 
      {
         Vnum = 21016, 
         TeleVnum = 0, 
         Description = "&WOceanview  Street and Law Avenue come together here to form one of the\
four corners of Coral City. This attractive street recived it's name\
\
becasue the creators of the city's layout placed it on a hill allowing you\
to look at the ocean.Oceanview Street lies to the north, while Law Avenue\
stretches westward.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Luke Street\
\13        - To trading Post Street\
\13        - To Barster Road\
\13        - To Security Road\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21015, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Luke Street lies to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 6905, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21017, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue lies to the west.\
", 
            }, 
         }, 
         Name = "Meeting of Oceanview Street and Law Avenue ", 
      }, 
      [21017] = 
      {
         Vnum = 21017, 
         TeleVnum = 0, 
         Description = "&WYou are walking down the newly paved Law Avenue, the road which lines the\
southern wall of Coral City recives constant traffic and is ofen the\
center of attraction.  The dust  here seems wet and muddy. you must be\
getting closer to the ocean  To the east is one of the four corners  of\
Coral City, while Law Avenue continues westward. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Companions and Mounts\
\13East  - Law Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21016, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Law Avenue joins Luke Street to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21018, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue stretches westward.\
", 
            }, 
         }, 
         Name = "Law Avenue", 
      }, 
      [21018] = 
      {
         Vnum = 21018, 
         TeleVnum = 0, 
         Description = "&W A tall statue attracts your attention on this portion of Law Avenue. \
The platiki metallic  sculpture is of a Calamrian in his late years\
wielding a E-web Blaster against an unseen attacker, although from the\
man's posture it is obvious that his opponent was enormous.  A small\
golden plaque sits near the statue, explaining its importance.  The newly\
paved road stretches both east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "plaque", 
               Description = "The plaque reads: 'May you rest in peace, Ghett of S.P.I.N..'\
\13", 
            }, 
            [2] = 
            {
               Keyword = "statue ", 
               Description = "In honor of the late GHETT, founder of the special forces team S.P.I.N.\
\13True friend, and hero to all of us. \
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21138, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21017, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road extends eastward.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21019, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue stretches westward as far as the eye can see.\
", 
            }, 
         }, 
         Name = "Law Avenue", 
      }, 
      [21019] = 
      {
         Vnum = 21019, 
         TeleVnum = 0, 
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
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Jawa Traders\
\13East  - Law Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21051, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21018, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Law Avenue continues to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21020, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Anna Avenue and Law Avenue cross to the west.\
", 
            }, 
         }, 
         Name = "Law Avenue", 
      }, 
      [21020] = 
      {
         Vnum = 21020, 
         TeleVnum = 0, 
         Description = "&W You stand at the intersection of Anna Avenue and Law Avenue.  Gazing to\
the south, you see the massive south Docking bay of Coral City. It is\
there most new traders enter the city. It also there that new bounty\
hunters enter. The newly covered roads of Anna Avenue and Law Avenue lie\
in the four cardinal directions.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
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
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21044, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "To the north is Anna Avenue.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21019, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "You see the legendary Law Avenue.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21074, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "To the south is Akatamer's southern Docking bay.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21021, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue extends to the west.\
", 
            }, 
         }, 
         Name = "Intersection of Anna Avenue and Law Avenue", 
      }, 
      [21021] = 
      {
         Vnum = 21021, 
         TeleVnum = 0, 
         Description = "&W You are traveling down one of the newly covered section of Law Avenue at\
a brisk pace. To the north is the Mon Calamrian Factory , a building known\
throughout the the world for its rare metal melting.  You feel almost like\
paying the building a visit.  Law Avenue extends to the east and west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Akatamer square\
\13\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21073, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21020, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Law Avenue and Anna Road cross to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21022, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue ranges to the west.\
", 
            }, 
         }, 
         Name = "Law Avenue", 
      }, 
      [21022] = 
      {
         Vnum = 21022, 
         TeleVnum = 0, 
         Description = "&W You are walking down a rather commercial part of Law Avenue. Merchants\
and droids hassle you to spend your credits as you attempt to continue on\
your way. Glancing to the north, you see  the only shop worth visiting,\
owned by the respectable Lokist the Tailor.  Law Avenue stretches to the\
east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Anikeim's fashion  Clothing\
\13West  - Law Avenue\
\13        - To Monock Road\
\13East  - Law Avenue\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21066, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "A fashion shop is situated to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21021, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Law Avenue extends to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21023, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue stretches westward.\
", 
            }, 
         }, 
         Name = "Law Avenue", 
      }, 
      [21023] = 
      {
         Vnum = 21023, 
         TeleVnum = 0, 
         Description = "&W This stretch of Law Avenue is well trimed and well kept, like most of\
the streets now in Coral City.  Looking northward, you see a small defense\
building that looks like it saw some where and tear twenty years  ago.\
Most of the remains are unenterable.  The lengthy polished rock road\
extends to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - An Abandoned defense building\
\13        - To the Guild of Pilots\
\13\
\13West  - Law Avenue\
\13        - To Monock Road\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21186, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21022, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Law Avenue continues in this direction.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21024, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Law Avenue clashes with Monock Road to the west.\
", 
            }, 
         }, 
         Name = "Law Avenue", 
      }, 
      [21024] = 
      {
         Vnum = 21024, 
         TeleVnum = 0, 
         Description = "&W Monock Road and Law Avenue come together here to form one of the four\
corners of Coral City.  A metal staircase leads up onto the main city's\
Security Post, from where even the strongest Imperial Stormtrooper  can be\
repelled. Monock Road lies to the north, while Law Avenue stretches\
eastward.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Monock Road\
\13        - To Trading Post  Street\
\13        - To Barster Road\
\13        - To Security Road\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21025, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Monock Road lies to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21023, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Law Avenue lies to the east.\
", 
            }, 
         }, 
         Name = "Meeting of Monock Road and Law Avenue", 
      }, 
      [21025] = 
      {
         Vnum = 21025, 
         TeleVnum = 0, 
         Description = "&p You pick up your pace as you travel down this portion of Monock Road.\
\
Gazing eastward, you see what is easily the darkest alley in the city,\
though a glimmer of light can be seen flickering in the shadows of the\
slim street.  To the north is an intersection, while Monock Road continues\
to the south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Monock Road\
\13        - To Security Road\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13East  - Thieves Alley\
\13        - To the Guild of Thieves\
\13South - Monock Road\
\13        - To Law Avenue\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21026, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Thieves Alley is east of here.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21063, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The Thieves Alley is east of here.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21024, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "One of the four corners of Akatamer is located to the south.\
", 
            }, 
         }, 
         Name = "Monock Road", 
      }, 
      [21026] = 
      {
         Vnum = 21026, 
         TeleVnum = 0, 
         Description = "&Y You stand at the intersection of Trading Post  Street and Monock Road. \
A wall towers over you to the west, keeping intruders (mostly Quarren) out\
of Coral City unannounced.  To the east are the newly built shops of Coral\
City, while Monock Road continues to the north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Monock Road\
\13        - To Security Road\
\13        - To Barster Road\
\13East  - Trading Post  Street\
\13South - Monock Road\
\13        - To Law Avenue\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21027, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Monock Road lies in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21045, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "You gaze at the pavillions and shops of Trading Post  Street.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21025, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "To the south is Monock Road.\
", 
            }, 
         }, 
         Name = "Intersection of Trading Post  Street and Monock Road", 
      }, 
      [21027] = 
      {
         Vnum = 21027, 
         TeleVnum = 0, 
         Description = "&p You are walking down a poorer section of Monock Road.  The carved rock\
roads  seem unkept and poorly made, definitely unusual in this city which\
represents hope and order.  The street ranges to the north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21028, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Barster Road and Monock Road cross to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21026, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Trading Post  Street and Monock Road cross just south of here.\
", 
            }, 
         }, 
         Name = "Monock Road", 
      }, 
      [21028] = 
      {
         Vnum = 21028, 
         TeleVnum = 0, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in the four cardinal directions.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "West  - The Western Docking bay of Akatamer\
\13South - Monock Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13East  - Barster Road\
\13        - To Akatamer Square\
\13North - Monock Road\
\13        - To Security Avenue\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21029, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The metallic streets of Monock Road lie to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21041, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Walking in this direction will lead you into the very heart of the city.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21027, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21088, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "To the west is the west Docking bay of Akatamer.\
", 
            }, 
         }, 
         Name = "Intersection of Barster Road and Monock Road", 
      }, 
      [21029] = 
      {
         Vnum = 21029, 
         TeleVnum = 0, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in two directions north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21030, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Monock Road stretches northward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21028, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The intersection of Barster Road and Monock Road is south of here.\
", 
            }, 
         }, 
         Name = "Monock Road", 
      }, 
      [21030] = 
      {
         Vnum = 21030, 
         TeleVnum = 0, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not palnning to tackle for awile. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21031, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Monock Road extends northward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21067, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21029, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Monock Road stretches southward.\
", 
            }, 
         }, 
         Name = "Monock Road", 
      }, 
      [21031] = 
      {
         Vnum = 21031, 
         TeleVnum = 0, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not planning to tackle for awile.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21032, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Monock Road meets with Security Road to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21030, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
            }, 
         }, 
         Name = "Monock Road", 
      }, 
      [21032] = 
      {
         Vnum = 21032, 
         TeleVnum = 0, 
         Description = "&R Monock Road and Security Road come together here to form one of the four\
corners of Coral City.  From here you can smell the ocean sea salt form\
the nearby breakwall to the west. It reminds you of the fun you have\
swimming in the huge ocean that surrounds this city. Monock Road lies to\
the south, while Security Road stretches \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "East - Security Road\
\13        - to Anna Avenue\
\13        - to Luke Street\
\13South - Monock Road\
\13        - to Barster Road\
\13        - to Trading Post  Street\
\13        - to Law Avenue\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21033, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21031, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
            }, 
         }, 
         Name = "Meeting of Monock Road and Security Road", 
      }, 
      [21033] = 
      {
         Vnum = 21033, 
         TeleVnum = 0, 
         Description = "&RYou stand on  Security Road staring at the two suns or the stars above\
your head, depending on time.  This newly paved street is made of polished\
rock that glimers when the first sun comes up. In the distence you can see\
Mon Calamrian children playing in the nearby park. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21034, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road stretches eastward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21032, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road and Monock Road meet to the west.\
", 
            }, 
         }, 
         Name = "Security Road", 
      }, 
      [21034] = 
      {
         Vnum = 21034, 
         TeleVnum = 0, 
         Description = "&RYou travel down a newly lanscaped area of Security Road.  In the new park\
created to the south you can hear strange animal noises that remind you of\
the days back when you used to go to the galactic zoo.  The mysterious\
melody relaxes you as you start to whistle with the birds in a city of\
peace and goodness.  Security Road stretches east and west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21035, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21131, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21033, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road continues to the west.\
", 
            }, 
         }, 
         Name = "Security Road", 
      }, 
      [21035] = 
      {
         Vnum = 21035, 
         TeleVnum = 0, 
         Description = "&R You are walking cautiously through this part of Security Road.  Lately\
you have heard rumors of thieves prowling these parts, mocking the very\
name of the road.  But that is mostly not likely. The newly paved street\
\
ranges to the east and west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21004, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The intersection of Anna Avenue and Security Road is east of here.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21034, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Security Road stretches westward.\
", 
            }, 
         }, 
         Name = "Security Road", 
      }, 
      [21036] = 
      {
         Vnum = 21036, 
         TeleVnum = 0, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east and west is the  Barster Road  \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
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
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21037, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Barster Road stretches onward in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21000, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road to the west leads to Akatamer Square.\
", 
            }, 
         }, 
         Name = "Barster Road", 
      }, 
      [21037] = 
      {
         Vnum = 21037, 
         TeleVnum = 0, 
         Description = "&c While walking Barster Road, you gaze up at the Akatamer medical\
facility, whose entrance lies to the south. New plantlife grows along side\
the road,&G adding a buitiful haze of green. &c The lengthy rock carved\
out road stretches to the east and west.&x\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - Akatamer Tower of jedi's \
\13        - To the Guild of Jedimasters\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21038, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Barster Road continues in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21126, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The enterence to Akatamer's Tower of Jedi's are to the south.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21036, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Barster Road continues in this direction.\
", 
            }, 
         }, 
         Name = "Barster Road", 
      }, 
      [21038] = 
      {
         Vnum = 21038, 
         TeleVnum = 0, 
         Description = "&c Young and giddy Mon Calmarians pass you as you travel this portion of\
Barster Road.  Gazing southward, you see the illustrious Coral City\
Academy, which has the responsibility of educateting new Mon Calamarian's.\
 The newly carved rock road of Barster  continue to the east and west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - Akatamer Academy\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21012, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The intersection of Barster Road and Luke Street lies to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 21133, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21037, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Barster Road stretches to the west as far as the eye can see.\
", 
            }, 
         }, 
         Name = "Barster Road", 
      }, 
      [21039] = 
      {
         Vnum = 21039, 
         TeleVnum = 0, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east is Coral City Square, while Barster Road\
leads on to the west.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - Western Hall\
\13West  - Barster Road\
\13        - To Monock Road\
\13\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21000, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road to the east leads to Akatamer Square.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21040, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Barster Road stretches onward as far as the eye can see.\
", 
            }, 
         }, 
         Name = "Barster Road", 
      }, 
      [21040] = 
      {
         Vnum = 21040, 
         TeleVnum = 0, 
         Description = "&cHere the city's only and extremly large  Hotel stands to the south It was\
constructed fromt he remains of crashed space vessel. It is considered\
sheek to stay in this coverted junk heap (Who figures?)You make note to\
remember  this location for later.  Gazing to the east and west, you can\
see nothing but Barster Road. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - The hotel \
\13West  - Barster Road\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21039, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Barster Road stretches further eastward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21069, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "The town hotel  awaits.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21041, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Barster Road stretches further westward.\
", 
            }, 
         }, 
         Name = "Barster Road", 
      }, 
      [21041] = 
      {
         Vnum = 21041, 
         TeleVnum = 0, 
         Description = "&c Cheery laughter can be heard in this section of Barster Road.  Listening\
closely, you are not surprised to find the laughter coming from the\
Cantinia to the south.  People from differnt planets passing by also seem\
interested in those who can find joy in these dark times. This tavern is\
best place to find new friends, bith good and evil. Barster Road ranges to\
the east and west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - The Grim Smile\
\13West  - Barster Road\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21040, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Barster Road continues in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21068, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "The tavern lies to the south.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21028, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Barster Road and Monock Road cross to the west.\
", 
            }, 
         }, 
         Name = "Barster Road", 
      }, 
      [21042] = 
      {
         Vnum = 21042, 
         TeleVnum = 0, 
         Description = "&PYou are travelling upon the southern portion of Anna Avenue.  The newly\
constructed buildings of the Coral City Trading Post street rise high into\
the air to the east and west.  The metallic road stretches to the north\
and south, where you can see a bustling intersection of Mon Calamrian\
shopers.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21000, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The road to the north leads to Akatamer Square.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21043, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A bustling intersection lies to the south.\
", 
            }, 
         }, 
         Name = "Anna Avenue", 
      }, 
      [21043] = 
      {
         Vnum = 21043, 
         TeleVnum = 0, 
         Description = "&YYou stand at the intersection of Anna Avenue and Trading Post  Street. \
The intersection bustles with activity as citizens go about their\
business. To the east and west runs Trading Post  Street, lined with the\
exotic and local shops of Coral City, while Anna Avenue lies to the north\
and south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
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
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21042, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Anna Avenue lies to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21048, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21044, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Anna Avenue stretches to the south as far as the eye can see.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21047, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
            }, 
         }, 
         Name = "Intersection of Anna Avenue and Trading Post  Street", 
      }, 
      [21044] = 
      {
         Vnum = 21044, 
         TeleVnum = 0, 
         Description = "&PWhile traversing the busy, smooth carved road of Coral City, you notice a\
\
particularly dark alley to the west which citizens commonly avoid. As  you\
 imagine running into a cloaked thief lurking in the shadows. Anna Avenue\
extends to the north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
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
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21043, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Intersection of Anna Avenue and Trading Post  Street\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21020, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The intersection of Anna Avenue and Law Avenue lies to the south.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21065, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "You can't make out any details about the dark alley.\
", 
            }, 
         }, 
         Name = "Anna Avenue", 
      }, 
      [21045] = 
      {
         Vnum = 21045, 
         TeleVnum = 0, 
         Description = "To the north is where a rock seller used to hold shop, on the door is a\
small sign. it does keep your wife happy. Trading Post  Street extends to\
the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
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
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21046, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "More shops attract your attention to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21052, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A jewelry shop has been set up in the tent to the south.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21026, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Trading Post  Street meets up with Monock Road to the west.\
", 
            }, 
         }, 
         Name = "Trading Post  Street", 
      }, 
      [21046] = 
      {
         Vnum = 21046, 
         TeleVnum = 0, 
         Description = "&YCitizens of Coral City waddle  around you, anxious to finish their\
shopping. Gazing northward, you can see a female Rodian drying a multitude\
of spices, while to the south you see Coral City's courier service. \
Trading Post  Street ranges to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - The Spide Dealer\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - The Akatamer Courier\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21054, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The Spice Trader's is to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21047, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "More shops attract your attention to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21053, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The Akatamer mail service is situated in a building to the south.\
\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21045, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "More shops attract your attention to the west.\
", 
            }, 
         }, 
         Name = "Trading Post  Street", 
      }, 
      [21047] = 
      {
         Vnum = 21047, 
         TeleVnum = 0, 
         Description = "&YThe newly carved polished stone rock road is buzzing with activity. \
Eager shouts from numerous new buildings encourage potential customers to\
come inspect a shopkeeper's;wares.  To the north is Anikem's new shop,\
while a Map Builder  just moved in to the south.  Trading Post  Street\
stretches to the east and west. \
There is a small note tacked up on the north door.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Hermit's Tent\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - Map Builders\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
            }, 
            [2] = 
            {
               Keyword = "note", 
               Description = "Sorry due to costs of shipping I have moved my shop below closer to the\
\13mine.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21043, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "You see the intersection of Anna Avenue and Trading Post  Street.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21056, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A mapmaker store lies to the south.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21046, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "More shops attract your attention to the west.\
", 
            }, 
         }, 
         Name = "Trading Post  Street", 
      }, 
      [21048] = 
      {
         Vnum = 21048, 
         TeleVnum = 0, 
         Description = "&YThe newly carved rock road is buzzing with activity.  Eager shouts from\
the newly built buildings encourage potential customers to come inspect a\
shopkeeper's wares.  To the north you can smaell the sweet aroma that is\
the Bantha barbecue Shop , while the building to the south is dedicated to\
repairing broken items.  Trading Post  Street stretches to the east and\
west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - The Bantha Barbecue\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Unlit Saber\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21057, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The barbecue stand lies in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21049, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "More shops attract your attention in this direction.\
\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21058, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "You can see a stocky Mon Calamrian repairing equipment.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21043, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The intersection of Anna Avenue and Trading Post  Street lies to the west.\
", 
            }, 
         }, 
         Name = "Trading Post  Street", 
      }, 
      [21049] = 
      {
         Vnum = 21049, 
         TeleVnum = 0, 
         Description = "&YCitizens of Coral City scamper about you, eager to finish their shopping.\
The aroma of fresh bread assails your nose, coming from a bakery from the\
north, and you can see Armory clanging from the wind on the shop to the\
south.ity's armoury to the south.  Trading Post  Street ranges to the east\
and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - The Akatamer Bakery\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Bobba Wares\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21060, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "You can see a bakery to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21050, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "More shops attract your attention in this direction.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21059, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The Bobba waresis to the south.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21048, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "More shops attract your attention in this direction.\
", 
            }, 
         }, 
         Name = "Trading Post  Street", 
      }, 
      [21050] = 
      {
         Vnum = 21050, 
         TeleVnum = 0, 
         Description = "&YYou smile at the familiar sight of Trading Post  Street and its glorious\
newly built buildings. The buzz of vibro-blades can be heard from the\
south, while the blue milk dairy is situated to the north.  Trading Post \
Street extends east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign post signpost", 
               Description = "North - Blue Milk Dairy Products\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Vibro-Fizz\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21061, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The dairy to the north deals in all blue milk dairy products.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21014, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Trading Post  Street joins up with Luke Street to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21062, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Weapons can be bought or sold in the store to the south.\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21049, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "More shops attract you in this direction.\
\
", 
            }, 
         }, 
         Name = "Trading Post  Street", 
      }, 
      [21051] = 
      {
         Vnum = 21051, 
         Name = "Interior of City Hall", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21019, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21052] = 
      {
         Vnum = 21052, 
         Name = "The Shining Emerald", 
         Description = "&O A locked display box dominates this particular shop.  Under the glass of\
the box are two of the only three known ulti-ma pearls in existence., each\
lying gently upon a miniscule cushion. Various other items are displayed\
in differnt boxes. Hanging from the walls are various paintings, while\
sculptures take up the rest of the floor space. A north door leads back\
out onto Trading Post Street.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 100,000 credits 16 CHA\
\13Sorry ultima-pearls not included.\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21045, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21053] = 
      {
         Vnum = 21053, 
         Name = "Coral City Courier Office", 
         Description = "&O An immense computer set against the southern wall of the Building has\
been organized into small consoles, each containing letters to and from\
the citizens of Coral City through Star mail.  Errand boys are constantly\
coming in and collecting disks for delivery.  In the center of the room is\
a large glatic_net mail terminal where people from around the world can\
send mail. A door to the north leads back out onto Trading Post  Street .\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [18] = "NoDrop", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - Mail Service is Governemnt Own sorry!\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21046, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "An opening in the building leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21054] = 
      {
         Vnum = 21054, 
         Name = "The Spice dealer", 
         Description = "&OThis newly contructed building is filled with the scent of dried spices.\
Wooden shelves are lined with spices, each of varying colors. A counter\
sits in the center of the room. Walking nearer, you notice a small plaque\
on the counter which reads 'Success lies in Spices'. Dispite numerous\
attempts to outlaw spices , they are still legal in this city. A door\
south leads back out onto Trading Post  Street.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 50,000 Must be a smuggler of 40\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21046, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21055] = 
      {
         Vnum = 21055, 
         Name = "Anakiem's Rocks", 
         Description = "&O A musty odor fills your nostrils as you inhale.  Shelves hug the walls\
of this newly created building, each shelf filled with  items from the\
mines or ocean floor.  As you begin to inspect several of the shelves, you\
notice they are all covered in dust and dirt.  A square wooden counter\
sits in the center of the room, and to to the south a door leads back out\
onto Trading Post  Street. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost ", 
               Description = "Cost - Not for Sale\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 6882, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21056] = 
      {
         Vnum = 21056, 
         Name = "Maps", 
         Description = "&OYou find yourself in a rather small and empty shop.  Parchments tied into\
neat packs lie about in an unorganized manner in the back corner.  A\
counter in the center of the room houses numerous state of the art\
Holo-Maps, as well as a couple more computer writing tools. This thin\
printer is havinga hard time converting to new technology, and is even\
contemplating retiring. A door to the  north leads back out onto Trading\
Post  Street. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost ", 
               Description = "Cost - 50,000 credits Wis 16\
\13Also Mon Calamarian\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21047, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21057] = 
      {
         Vnum = 21057, 
         Name = "The Bantha Barbecue Shop", 
         Description = "&OThe smell of fresh meat grilled to a perfection as only chef Wannie knows\
how is present in the air of this shop.  Kept cool in frosted vaults, the\
city chef sells his meats here, imported from planets far distant or\
harvested form the ocean. There are a few tables scattered around for you\
to sit at, and share stories with your friends.Through the door to the\
south is Trading Post  Street.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21048, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "An opening in the tent allows you to return to Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21058] = 
      {
         Vnum = 21058, 
         Name = "The Unlit saber", 
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
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost ", 
               Description = "Cost - 38.000 credist \
\13Must be Engineer of 50\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21048, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21059] = 
      {
         Vnum = 21059, 
         Name = "Bobba's wares", 
         Description = "&O This Mon Calamarian is a dedicated creator of armor and shields.  Having\
lost her son to shabby equipment, she took up the job of putting\
protective suits of armor together. She is also  extremly infatuated with\
the legendary Bobba Fett, and collects any holographics  or drawings of\
this great Bounty Hunter. The enterance leads back out north onto Trading\
Post  Street.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost 80,000 plus a Dinner with Bobba Fett\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21049, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21060] = 
      {
         Vnum = 21060, 
         Name = "The Akatamer Bakery", 
         Description = "&OUpon entering the Akatamer Bakery, you find yourself surrounded by\
citizens of the marvelous city, each waiting in line for their daily\
bread. This Mon Calamrian is famous for his fine baked bread made from\
refined seaweed. This green food is terrific with every meal. The door to\
the south leads back out onto Trading Post  Street. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 28,000 And a Love for Bread\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21049, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21061] = 
      {
         Vnum = 21061, 
         Name = "The Blue Sea-Cow", 
         Description = "&OThis small shop smells strongly of blue cheese, as dozens of types of\
cheeses have been laid out and labeled properly on several long shelves. \
You notice many bottles of blue milk, considered to be more important than\
even water, carefully stacked in the northeast corner.  This Mon girl is\
staioned here by here father to sell this rare drink froma seacow. Through\
the door Trading Post  Street lies to the south.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost 28,000 credits a you must marry off His daughter.\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21050, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21062] = 
      {
         Vnum = 21062, 
         Name = "Vibro-Fizz", 
         Description = "&ORacks line the walls of this store, each filled to the brim with weapons.\
You grin evilly at the items of destruction, and try out a couple on the\
practice dummies hung from the ceiling.  A counter in the center of the\
room is where the keeper of this shop does business.  He is an extremly\
large calamarian who knows his stuff. The door to the north leads back out\
onto Trading Post  Street.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 89,000 credits and Engineering\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21050, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21063] = 
      {
         Vnum = 21063, 
         TeleVnum = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21064, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21025, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Monock Road lies to the west.\
", 
            }, 
         }, 
         Name = "Thieves Alley", 
      }, 
      [21064] = 
      {
         Vnum = 21064, 
         TeleVnum = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21065, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21063, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
         }, 
         Name = "Thieves Alley", 
      }, 
      [21065] = 
      {
         Vnum = 21065, 
         TeleVnum = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Akatamer.\
Whomp rats scurry across the metallicground, squeaking at you.  Empty crates and\
tattered rags are lying about.  The alley opens up to Anna Avenue to the\
\
east, while to the west the darkness deepens.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21044, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Anna Avenue lies to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21064, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
         }, 
         Name = "Thieves Alley", 
      }, 
      [21066] = 
      {
         Vnum = 21066, 
         Name = "Annir's Clothing", 
         Description = "&O The shop you have entered smells heavily of dried bantha leather. \
Gazing about, you see all manners of clothing, from leather to silk.  A\
coral counter lines the northern wall of the shop, and several stalls line\
the eastern wall, where you can try on your clothes (after you pay for\
them.).  A door to the south leads back out onto Law Avenue. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [3] = "Secret", 
               }, 
               DestinationVnum = 21022, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "The door leads back out onto Law Avenue\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 21180, 
               Distance = 0, 
               Keyword = "hatch", 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21067] = 
      {
         Vnum = 21067, 
         Name = "Companions and Mounts", 
         Description = "&O You walk into a large shop which smells of Banthas.  Behind the long\
wooden counter are dozens of cages containing varying types of animals. \
You can hear the sounds of creatures coming from a store room in the back\
of the shop.  A path to the west leads back out onto the busy Monnock St.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21030, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21068] = 
      {
         Vnum = 21068, 
         Name = "The Tavern", 
         Description = "&OYou enter the city's lavish cantinia, in fact the only bar inside the\
city;itself, appropriately connected to the city's hotel  to the east\
through a hallway. That way visitors can just get drunk then head over to\
bed. Smoke and the smell of alcohol mix with laughter, quickly gives you a\
dull headache. To the east is the town hotel , while the fresh air of the\
\
outdoors stands at bay to the north.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21041, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "A door leads out onto Barster Road.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21069, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The hotel  lies to the east.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21069] = 
      {
         Vnum = 21069, 
         Name = "The Akatamer hotel ", 
         Description = "&OHere a weary traveller can seek a good rest in comfort without fear of\
theft or, worse yet, murder.  A long counter stretches across much of the\
room, and for a few credits the hotel keeper will gladly rent you one of\
his rooms.  Drunken laughter emerges from a hall to the west.  To the\
south beyond a door barred by the hotel keeper are the rooms.\
 \
You may safely quit here.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21040, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "Barster Road lies to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21068, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The tavern lies to the west.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21071] = 
      {
         Vnum = 21071, 
         Name = "&C Inside Bacta Tank", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "mpechoat $n The healing warmth of the bacta spreads over your\
body.\
feel heal $n\
", 
            }, 
         }, 
         Description = "This room is for the severly wounded. Please donot take advantage of this\
great Facility or the Mon Calamarian Officals will have to remove the\
bacta tank. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21127, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21072] = 
      {
         Vnum = 21072, 
         Name = "Restarea", 
         Description = "&z This lavish room comes complete with plush bantha leather seat benches.\
A brand new drinking fountain that diperses fresh salt water for drinking.\
And a new cooking droid here to serve some of the great Mon Calamari food.\
The floor is a soft grey colored marble like rock sanded to a smooth\
surface. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21100, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21073] = 
      {
         Vnum = 21073, 
         Name = "Factory Enterence", 
         Description = "&c &C You stand before huge doors of the Krantz mining ore factory complex.\
 the doors are kept closed, yet the bared windows are cracked open to give\
all the heat and noise inside a means of escaping.  The doors are made of\
some sort of black metal, most likely found on the ocean floor  seemingly\
impenatrable, and has the Krontz symbol K carved into them  You are not\
sure if the doors are meant to keep intruders out, or workers in...\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21151, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21021, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21074] = 
      {
         Vnum = 21074, 
         Name = "Inside the Southern Docking bay", 
         Description = "&z You stand inside the southern Docking bay of Coral City. Ships of all\
sizes line the many enterences.There is only four docking bays on Mon\
Calamari that is known to the public and all four exsist on the outskirts\
of the city. They were originally created as Imperial Slave ports but were\
later converted to Docking bays.To the north is the intersection of Anna\
Avenue and Law Avenue.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21020, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Two roads cross to the north.\
", 
            }, 
            [2] = 
            {
               Key = 21073, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21075, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "south", 
               Description = "The Docking bay leads outside of Akatamer.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21075] = 
      {
         Vnum = 21075, 
         Name = "Outside the Southern Docking bay", 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the eastand west. While to the north you\
can hear the sounds of ships landing and taking off.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "foliage", 
               Description = "Searching thoroughly, you discover a manhole hidden beneath one of the\
\13many harbor edges.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21073, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21074, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "north", 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21123, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "A path begins to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21076, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "A path begins to the west.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21076] = 
      {
         Vnum = 21076, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
\
the city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21075, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "To the east the southern Docking bay of Akatamer.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21077, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road west of the Southern Docking Bay", 
      }, 
      [21077] = 
      {
         Vnum = 21077, 
         TeleVnum = 0, 
         Description = "&c You are on carved out rock road rounding the southern wall of Akatamer.\
The familiar sound of running water emanates from the Mon Calamarian ocean\
to the south. The large breakwater was created to keep the nasty wind\
storms that come up from spalshing 50 ft. waves upon the city.  The road\
stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21076, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21078, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21078] = 
      {
         Vnum = 21078, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21077, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21079, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The trail continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21079] = 
      {
         Vnum = 21079, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can hear the\
ocean getting nearer to the west.  \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21078, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21080, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21080] = 
      {
         Vnum = 21080, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can see the ocean\
front just off a dock to the west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21079, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21081, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21081] = 
      {
         Vnum = 21081, 
         TeleVnum = 0, 
         Description = "&c  You have come to the western most spot of the city. before you is a\
large dock leading out to the ocean..  Its supports are cracked,and the\
entire structure seems liable to fall into the ocean at any moment. To the\
north and east are two plain man made roads. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21082, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "A path begins to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21080, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "A road begins to the east.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 6908, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         Name = "Before the Dock", 
      }, 
      [21082] = 
      {
         Vnum = 21082, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21083, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21081, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The trail continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21083] = 
      {
         Vnum = 21083, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.You look into the sky\
and see a common Mon Calamarian bird above.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21084, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The trail continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21082, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21084] = 
      {
         Vnum = 21084, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21085, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The road continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21083, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21085] = 
      {
         Vnum = 21085, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21086, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21084, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21086] = 
      {
         Vnum = 21086, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21087, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The western entrance to Akatamer lies to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21085, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The Water Shuttle continues rounding the city wall of Akatamer.\
", 
            }, 
         }, 
         Name = "On a Road south of the Western Docking Bay", 
      }, 
      [21087] = 
      {
         Vnum = 21087, 
         Name = "Outside the Western Docking bay", 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the east you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21089, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "A path begins to the north.\
", 
            }, 
            [2] = 
            {
               Key = 21070, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21088, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "east", 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21086, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A road begins to the south.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21088] = 
      {
         Vnum = 21088, 
         Name = "Inside the Western Docking bay", 
         Description = "&z You stand in the western dockingbay, do to the massive damage this place\
took by the empire , only small shuttles can enter this docking bay. This\
platform was designed as a slave port for Mon Calamrian workers by the\
Empire years ago, but were later easily converted in to Docking Bay's for\
the Rebellion's greatest ship builder. You can hear the soft wind of the\
ocean to the west.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21028, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Two roads cross to the east.\
", 
            }, 
            [2] = 
            {
               Key = 21070, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21087, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "west", 
               Description = "The road continues deep into the metallic waste land s of Haon Dor.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21089] = 
      {
         Vnum = 21089, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the south you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21090, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21087, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The western Docking bay is to the south.\
", 
            }, 
         }, 
         Name = "On a Road north of the Western Docking Bay", 
      }, 
      [21090] = 
      {
         Vnum = 21090, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "The sign reads:\
\13 Hail Mon Calamrian!  You stand before the Ocean, a\
\13...which is populated by one of the smaller races of \
\13the world.  Do Not enter this zone any further...\
\13We see no use for New Rebublic law now..\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21091, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21089, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21091] = 
      {
         Vnum = 21091, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21092, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21090, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21092] = 
      {
         Vnum = 21092, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21093, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21091, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The trail continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21093] = 
      {
         Vnum = 21093, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21094, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "A gentle sea breeze is coming in from the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21092, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21094] = 
      {
         Vnum = 21094, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and south. \
\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21095, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21093, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21095] = 
      {
         Vnum = 21095, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21096, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21094, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21096] = 
      {
         Vnum = 21096, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "holodisk", 
               Description = "water and ocean plantlife lye on the top of the holodisk:\
\13You place the disk into your reader ,,,,it says :\
\13Akatamer's Time Will Come, Hail the New Empire.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21097, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The trail continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21095, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21097] = 
      {
         Vnum = 21097, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
breeze from the ocean beyond.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21098, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21096, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21098] = 
      {
         Vnum = 21098, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
drop of water from the ocean beyond.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21099, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "Akatamer's northern Docking bay is to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21097, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On the Road West of the Northern Docking Bay", 
      }, 
      [21099] = 
      {
         Vnum = 21099, 
         Name = "Outside the Northern Docking bay", 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the south you can\
hear alot of hustle and bustle of ships taking off.\
\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21101, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path begins to the east.\
", 
            }, 
            [2] = 
            {
               Key = 21071, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21100, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "south", 
               Description = "The Docking bay leads into Akatamer.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21098, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road begins to the west.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21100] = 
      {
         Vnum = 21100, 
         Name = "Inside the Northern Docking bay", 
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
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21071, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21099, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "north", 
               Description = "The Docking bay leads out of Akatamer.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21072, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21004, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Two roads meet to the south.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21101] = 
      {
         Vnum = 21101, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the west you can\
hear alot of hustle and bustle of ships taking off.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21102, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The trail continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21099, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Akatamer's northern Docking bay is to the west.\
", 
            }, 
         }, 
         Name = "On the Road East of the Northern Docking Bay", 
      }, 
      [21102] = 
      {
         Vnum = 21102, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "The sign reads:\
\13 Welcome to Akatamer - Upper World - City of Hope.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21103, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21101, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21103] = 
      {
         Vnum = 21103, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21105, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21102, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The trail continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21105] = 
      {
         Vnum = 21105, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You see a Mon Clamrian\
bird soaring in the sky.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21106, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21103, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21106] = 
      {
         Vnum = 21106, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the South and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21107, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21105, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path stretches westward.\
\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21107] = 
      {
         Vnum = 21107, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the eastern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from splashing 50 ft. waves upon\
the city.  The road stretches to the South and North. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21106, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path curves around the northeastern corner.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21108, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21108] = 
      {
         Vnum = 21108, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21107, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The trail stretches northward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21109, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21109] = 
      {
         Vnum = 21109, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21108, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The road heads northward.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21110, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road extends to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21110] = 
      {
         Vnum = 21110, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21109, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21111, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21111] = 
      {
         Vnum = 21111, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the south you can\
\
hear starships taking off.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21110, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21112, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "Akatamer's eastern Docking bay is to the south.\
", 
            }, 
         }, 
         Name = "On the Road North of The Eastern Docking Bay", 
      }, 
      [21112] = 
      {
         Vnum = 21112, 
         Name = "Outside the Eastern Docking bay", 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the east you can hear\
starships taking off.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21111, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "A path begins to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21114, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "A road begins to the south.\
", 
            }, 
            [3] = 
            {
               Key = 21072, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21113, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "west", 
               Description = "The Docking bay leads into Akatamer.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21113] = 
      {
         Vnum = 21113, 
         Name = "Inside the Eastern Docking bay", 
         Description = "&z You stand inside the eastern Docking bay of Coral City.  This docking\
\
bay gets very little use, very little survalanice..and consequently is\
known for it's secretive cargo. To the west is the intersection of Barster\
Road and Luke Street. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21072, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21112, 
               Distance = 0, 
               Keyword = "Docking bay", 
               Direction = "east", 
               Description = "The Docking bay leads out of Akatamer.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21012, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "Two roads cross to the west.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21114] = 
      {
         Vnum = 21114, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the north you can\
hear starships taking off.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21112, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The eastern Docking bay is to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21115, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On the Road South of The Eastern Docking Bay", 
      }, 
      [21115] = 
      {
         Vnum = 21115, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21114, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The trail continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21116, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21116] = 
      {
         Vnum = 21116, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21115, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The road continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21117, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21117] = 
      {
         Vnum = 21117, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21116, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21118, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21118] = 
      {
         Vnum = 21118, 
         TeleVnum = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. You can feel a soft mist\
coming from the ocean.\
\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21117, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21119, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21119] = 
      {
         Vnum = 21119, 
         TeleVnum = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the eastern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the north. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and North. You\
can feel a soft mist coming from the ocean.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21118, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21120, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21120] = 
      {
         Vnum = 21120, 
         TeleVnum = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21119, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21121, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21121] = 
      {
         Vnum = 21121, 
         TeleVnum = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21120, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21122, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21122] = 
      {
         Vnum = 21122, 
         TeleVnum = 0, 
         Description = "&c You walk briskly on carved out rock road rounding the southern wall of\
Akatamer.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the south. The large breakwater was created to keep\
the nasty wind storms that come up from spalshing 50 ft. waves upon the\
city.  The road stretches to the east and west. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21121, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21123, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21123] = 
      {
         Vnum = 21123, 
         TeleVnum = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can feel brief\
splashes of water as the ocean spills over the breakwall.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21122, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21075, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Name = "On a Road Rounding Coral City.", 
      }, 
      [21124] = 
      {
         Vnum = 21124, 
         Name = "On a Trail East of the Southern Docking bay", 
         Description = "You are on a man made road just east of the southern Docking bay.  You can hear\
the\
sound of a Ship Builder to the south and smile as you picture the\
citiy's Marina which must lie just ahead.  The trail continues east and west.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21123, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21075, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "To the west is the southern Docking bay of Akatamer.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21126] = 
      {
         Vnum = 21126, 
         Name = "&p Mon Calamri Medical Facility", 
         Description = "&c Before you is a large plain rock building used for healing the sick. The\
rock surface was once a coral underwater creature but is now a memorial to\
what once was. Here you can enter and recive top of the line treatment,\
from some of the greatest medical minds in the galexy. &R The pathway was\
properly framed with imported red plantlife. &c This is another one of\
those steps the new city officols are doing to clean up this city.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21037, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "Barster Road is to the north.\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21127, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "The Tower of Mon Calamri lies to the south.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21127] = 
      {
         Vnum = 21127, 
         Name = "&pWithin the Mon Calamri Medical Facility", 
         Description = "&C You walk beneath the impossibly high arches which support the Mon\
Calamari Medical facility.  Walls crafted of smooth coral rock are covered\
with extravegant Calamrian art which create a dazzling array of shimmering\
colors.  A inpatient desk lies in the center of the room, so one can check\
in. To the west is the waiting room. To the east is the medical supply\
store While the south leads to the main Bacta tanks. There is a sign at\
\
the enterance to the south. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&R due to money shortages we no longer can allow free\
\13treatment.\
\13 \
\13To enter the north you must first give the 100 credits to the Sec.\
\13 \
\13Sorry we no longer take Glactic Insurance.\
\13", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21126, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21129, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21128, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "An immense library is at the end of the corridor to the west.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21128] = 
      {
         Vnum = 21128, 
         Name = "Waiting Room", 
         Description = "&c This room while not highly decorated is a perfect place for adventurers\
who are grouping with a injured partener. The floor is a well polished and\
clean coral rock. While the walls are decorated with hand drawn pictures\
from Mon Calamarian children. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21127, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "The corridor leads back to the main hall.\
", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21129] = 
      {
         Vnum = 21129, 
         Name = "Medical Supply Store", 
         Description = "&C This small area of the building was sectioned off to allow travelers to\
Mon Calamari the option to purchase medical equipment. The walls are a\
polished coral rock which give off a pinkish reflection. The floor has a\
\
medical track on it to allow easy transport of victims to and from areas\
of the Medical facility. To the West is the Main hallway\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21127, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21130] = 
      {
         Vnum = 21130, 
         Name = "New Rebublic Mon Headquaters", 
         Description = "&z This high tech space appears to have no exits except for the main door.\
The walls are a smooth pink coral surface decorated with pictures and\
space charts. There appears to be dirt on the checkered pattern floor and\
a small lighting unit is suspeneded from the ceiling.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "dirt ", 
               Description = "There apears to be a small residue of dirt trailing from the entrance to\
\13the north east corner\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21009, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21131] = 
      {
         Vnum = 21131, 
         Name = "Coral City Park", 
         Description = "&G A attractive black metal gate frames the enterence to Coral City's\
newest relaxation area. The Security Park, is home to a few rare \
creatures flown in and captured by customs. Due to the lack of space for\
storage , city officals created this new park for them to roam around in.\
It also allows for Mon Calamarian youth to have a safe and fun place to\
play in. There is a large sign above the metal frame that welcome's all to\
the park.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "Please fell free to stop by at anytime, just DON\"T leave your children\
\13here, unattended.\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21034, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21135, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21134, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southeast", 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21137, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southwest", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21132] = 
      {
         Vnum = 21132, 
         Name = "Security Lobby", 
         Description = "&z You enter the main office of the Mon Calamari Security. This room is\
slightly, less extravegant then the rest, and has more of a rough ocean\
bottom feel. The walls  are decorated with pictures of wanted men, and the\
floors are polished rock that imitates a marble look. This rock was\
inported from the depths of the ocean floor. In front of you is a large\
counter to which you see alot of people working behind. At the counter is\
a sign that says step up for assistance.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21139, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21005, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21145, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21133] = 
      {
         Vnum = 21133, 
         Name = "Coral City Academy", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21038, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21134] = 
      {
         Vnum = 21134, 
         Name = "Coral City Park", 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for it's\
durablity and groth rate. Both of which will be need to maintain the\
trampling and activity it will see. This grass like surface is new to Mon\
Calamarians and they find it extremely interesting, while the Quarren's\
find it just frivlous. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21135, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21131, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northwest", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21136, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southwest", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21135] = 
      {
         Vnum = 21135, 
         Name = "Coral City Park", 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  You can see a large white leafed tree\
sitting in the middle of the park.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21131, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21134, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21136, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 21137, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21136] = 
      {
         Vnum = 21136, 
         Name = "Coral City Park", 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  There is a large brown fence keeping the\
animals and people in surrounding  the edge of the park\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21135, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21134, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northeast", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21137, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northwest", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21137] = 
      {
         Vnum = 21137, 
         Name = "Coral City Park", 
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
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21135, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21131, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northeast", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21136, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southeast", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21138] = 
      {
         Vnum = 21138, 
         Name = "First Bank of Mon (Main Branch)", 
         Description = "&z This marble like surfaced bank allows for easy transactions between you\
and your currencey. There is a large table in the center of the room to\
sign your life away along with, a counter towards the back where a very\
attractive clerk stands and counts the daily inflow of credits. On the top\
of the ceiling you can see a rather expensive security system tracking\
your everymove. The First bank of Mon's motto isn't \"your money is safe\
with us for no reason.\" To make a bank transaction please type bank.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [8] = "Bank", 
            [30] = "Prototype", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21018, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21139] = 
      {
         Vnum = 21139, 
         Name = "Security Corridor", 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The damp hallway is a dark grey with light grey flashes\
as you pass the cells. Very little activity occurs here as most criminals\
can't escape with over 20' of rock between them and the corridor. You  are\
safe and sure not to hear any of them. There is a large bashproof door to\
the east with an electronic doorslides for safty.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21428, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21140, 
               Distance = 0, 
               Keyword = "Door", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21150, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21132, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21140] = 
      {
         Vnum = 21140, 
         Name = "Security Corridor", 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21141, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21139, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21149, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "southeast", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21141] = 
      {
         Vnum = 21141, 
         Name = "Security Corridor", 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21148, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21140, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21142, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21142] = 
      {
         Vnum = 21142, 
         Name = "Security Corridor", 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21141, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21147, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21143, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21143] = 
      {
         Vnum = 21143, 
         Name = "Security Corridor", 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21146, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21142, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21144, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21144] = 
      {
         Vnum = 21144, 
         Name = "Security Corridor", 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21143, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 21145, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21145] = 
      {
         Vnum = 21145, 
         Name = "Chief Security Officer's Office", 
         Description = "The chief of security's office is now vacant. As the last chief was ordered\
to leave by the Crime Syndacate Mon Calamari is currently looking for a\
BRAVE security officer to replace him. If interested please contact\
Ackbar. Sorry you must be Mon Calamari to fulfill duties\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [23] = "BashProof", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 21144, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21132, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21146] = 
      {
         Vnum = 21146, 
         Name = "Cell Block 1138", 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "patch", 
               Description = "&R George Lucas\
\13&x\
\13", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21143, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21147] = 
      {
         Vnum = 21147, 
         Name = "Cell Block 1139", 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21142, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "north", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21148] = 
      {
         Vnum = 21148, 
         Name = "Cell Block 1140", 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21141, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21149] = 
      {
         Vnum = 21149, 
         Name = "Cell Block 1141", 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = 21140, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 21140, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "northwest", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21150] = 
      {
         Vnum = 21150, 
         Name = "Security Station", 
         Description = "&z This small cubicle is where a very alert and strong guard stays at\
attention. For it is here that the main door opens from and allows access\
to the jail cells. There is a small computer panel on the wall surrounded\
by laser proof glass panels. There is also a large swival chair with a\
recline feature.  The walls and floors are smooth surface unlike the\
surrounding area. It is most likely that this station was recently\
installed.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "computer", 
               Description = "There is a state of the art computer panel with a televison screen for each\
\13cell\
\13block.\
\13In the center of the computer panel is a large lever.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "lever", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21139, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21151] = 
      {
         Vnum = 21151, 
         Name = "Security Desk", 
         Description = "&c There is a big round desk in the middle of the room here, with all sorts\
of security equipment secured around it.  It looks like some sort of\
high-tech, punch in area for workers to check in. There is a room to the\
east, where most of the Quarren and Mon Calamarian workers seem to be\
going. There is a excellent grained wooden door to the west with an\
extravegant golden sign on it.  This room is tastefully done in a coral\
pink and dark purple decor which makes it feel somewhat exciting. You can\
smell in the distence the heavy smoke of iron ore mealting. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21152, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21073, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 21155, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21152] = 
      {
         Vnum = 21152, 
         Name = "Worker's Lobby", 
         Description = "&c This is a nice, sunlit area, strewn about with cushions and benches and\
other pieces of Calamrian comforts.  Along one wall is a array of service\
machines that sell food and drinks.  There is a mini kitchen near the\
windows, for the employee's lunches.  The walls are covered with pitures\
of home and of some of the workers children. On the table you even see a\
Mon Calamarian Fish Scout cookiee order form.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21160, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21151, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21153] = 
      {
         Vnum = 21153, 
         Name = "Floating in a void", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21152, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21155] = 
      {
         Vnum = 21155, 
         Name = "Customer Check-In", 
         Description = "This part of the factory is set up for customer relations with clients.\
There is a protocol droid sitting here to set up meetings, answer\
telecommunica ions and take orders for materials to be sent all over the\
galaxy. The carpet here \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21156, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North-Halway", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21151, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21156] = 
      {
         Vnum = 21156, 
         Name = "Hallway", 
         Description = "You are walking along a plush hallway.  Large windows line the western wall\
and a door is set to the east.  The markings on the door indicate a\
salesroom \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21158, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North-End of Hall", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21157, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Equipment Sales", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21155, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South-Customer Checkin", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21157] = 
      {
         Vnum = 21157, 
         Name = "Equipment Sales", 
         Description = "You barely step into the room and are stopped by a large counter.  A short \
squat Protocol Droid stands here taking orders and feeding the information \
into its counterpart, a large assembly droid.  Bins of parts and pieces line the\
walls behind the counter waiting for thier turn to be used in som useful pieces\
of equipment for you.", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21156, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-Hallway", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21158] = 
      {
         Vnum = 21158, 
         Name = "End of Hall", 
         Description = "Here a magnetic lift sits waiting to take customers up to the ship repair\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21159, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Workshop", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21156, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South-Hallway", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21170, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "Up-Ship Repair", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21159] = 
      {
         Vnum = 21159, 
         Name = "Workshop", 
         Description = "This is the largest and most elaborate workshop you have everseen. A\
magnetic balanced laser guided lathe sits along the north wall and further\
in is several plasma cutters and a bench of specialty tools of all shapes\
and sizes.  Along the south wall lies a circuit building station complete\
with touch screen  \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21158, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-End of Hall", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21160] = 
      {
         Vnum = 21160, 
         Name = "Security Check-Point", 
         Description = "Several Infra Scanners sweep over you for an ID check.  You can rest\
assured that if you are wanted on Mon Calamar you won't make it past this\
point.  Sever l Large swiveling blasters guard the room so that no one\
will enter the factory t at isn't meant to be here.  The workers take\
stairs to the plant floor below and managers continue north to the observe\
the proceedings.  To the south is the \
To the north is the observation booth, while down is the worker's\
entrance.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21161, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North- Observation Room", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21152, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21162, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "Down-Workers Entrance", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21161] = 
      {
         Vnum = 21161, 
         Name = "Observation Room", 
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
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21160, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South-Security Checkpoint", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21172, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "Up-Ship Yard", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21165, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "Down-Mainframe Computer", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21162] = 
      {
         Vnum = 21162, 
         Name = "Workers Entrance", 
         Description = "Rows upon Rows of Equipment lockers stand here holding workers personal\
items and tools for work.  This is presumably where those who work at the\
factory  suit up for the day.  There are two exits from here up to the\
security checkpoi t  In the Direction up you can goto the lift station\
while west is the security post. \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21163, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-Lift Station", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21160, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "Up-Security Checkpoint", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21163] = 
      {
         Vnum = 21163, 
         Name = "Lift Station", 
         Description = "The cooled parts arrive here on a conveyor from the north where they are\
loaded into large boxes and the boxes are loaded on to a repulsor lift and\
taken up to  the uppermost floor for storage and transfer onto shipping\
barges.  From here y u can go east to the workers entrance, you can go\
north further up the line, or up to the warehouse..or ne to the mainframe.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21164, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North-Cooling Section", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21162, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Workers Entrance", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21171, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "Up-Warehouse", 
            }, 
            [4] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21165, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northeast", 
               Description = "Northeast-Mainframe Computer", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21164] = 
      {
         Vnum = 21164, 
         Name = "Cooling Station", 
         Description = "Here the converyor makes a series of sharp turns to S its way from the\
north as dozens of droids turn cooling air hoses on the parts to cool them\
before they  make it to the lift station to the south.  Looking east you\
can see the system that controls the entire facility and from the north\
loud clanging and hissing \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21166, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North-Molding and Forming", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21165, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Mainframe Computer", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21163, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South-Lift Station", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21165] = 
      {
         Vnum = 21165, 
         Name = "Mainframe Computer", 
         Description = "Here before you is a huge cylinderical object that stretchs from floor to\
ceili g lights run the entire circumfrence of the object and wires string\
about running  away from the massive computer in all directions.  Several\
operator stations ci cle the factory's heart and soul as to monitor and\
solve any problems that occur at a moments notice.  It is possible to\
reach almost any station along the line fr m\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21167, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North-Smelting", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21164, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-Cooling Section", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21161, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "Up-Observation Room", 
            }, 
            [4] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21168, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northeast", 
               Description = "Northeast-Sorting and Seperating", 
            }, 
            [5] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21166, 
               Distance = 0, 
               Keyword = "", 
               Direction = "northwest", 
               Description = "Northwest-Molding and Forming", 
            }, 
            [6] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21163, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southwest", 
               Description = "Southwest-Lift Station", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21166] = 
      {
         Vnum = 21166, 
         Name = "Molding and Forming", 
         Description = "Here is where the super heated pipes carring the melted down ore end.  They pore\
their precious cargo into shape shifting molds that set the steel into whatever\
shape the clients of this factory require.  They are then lifted on to the conveyor\
by special droids designed to withstand the heat.  After that they are sent south \
to the cooling section.  You could go east to find out where the pipes are filled.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21167, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21164, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South- Cooling Section", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21165, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southeast", 
               Description = "Southeast-Mainframe Computer", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21167] = 
      {
         Vnum = 21167, 
         Name = "Smelting", 
         Description = "After the ore is seperated further east, it comes here to be dropped in a\
huge vat that melts it down.  Huge specially heated pipes connect to the\
vat here an \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21168, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Sorting and Seperating", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21165, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South-Mainframe Computer", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21166, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West- Molding and Forming", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21168] = 
      {
         Vnum = 21168, 
         Name = "Sorting and Seperating", 
         Description = "After the raw ore and other materials are recieved to the north it comes\
here. The materials that are used for maintence and electronic\
construction are seper ted from the ore here. As well unexecatable pieces\
of ore are returned to the molin \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21169, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "North-Recieving", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21167, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-Smelting", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21165, 
               Distance = 0, 
               Keyword = "", 
               Direction = "southwest", 
               Description = "Southwest-Mainframe Computer", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21169] = 
      {
         Vnum = 21169, 
         Name = "Recieving", 
         Description = "Here is where the moling miner machines return to drop off the ore after stripping\
it from the floor of the ocean below.  Other things are also recieved here as well,\
Parts for maintence of crucial machines and critical components that can not be\
created on site.  The sorting area to the south is responsible for deciphering where \
materials need to go,  here though the main concern is unloading the constant \
stream of machines as quickly as possible.", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21168, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "South-Sorting and Seperating", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21170] = 
      {
         Vnum = 21170, 
         Name = "Ship Repair", 
         Description = "A huge hangar surrounds you and large cranes susspended from the ceiling\
work  continuosly peeling old armor off of ships and pulling worn engine\
casings.  Maintence droids of all shapes and sizes swarm over the ships\
here beeping and whiring at an almost frantic pace.  You get the feeling\
that although this is an iron ore factory they recieve a substancial\
income from the repair of ships\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21171, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Warehouse", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21158, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "Down-End of Hall", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21171] = 
      {
         Vnum = 21171, 
         Name = "Warehouse", 
         Description = "As the repulsor lifts the huge packages of parts bound for other worlds.\
Binary load lifters sweep them up and move them into neat stacks to await \
transport.  Many of the boxes marked armor are sent west to the ship\
repair area and still many other boxes are being sent through huge doors\
to the east \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21172, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "East-Ship Yard", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21170, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-Ship Repair", 
            }, 
            [3] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21163, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "Down- Lift Station", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21172] = 
      {
         Vnum = 21172, 
         TeleVnum = 0, 
         Description = "Here a platform that holds at least five cargo ships at any given time is a\
bee hive of activity.  Binary load lifters beep at you to get out of the\
way as the   charge back and forth between waiting barges and the\
warehouse to the west. A  small lev tube sits out of the way at one corner\
of the platform. It seems to  \
West is the warehouse and Down is the observation booth.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               DestinationVnum = 21171, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "West-Warehouse", 
            }, 
            [2] = 
            {
               Key = 0, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               DestinationVnum = 21161, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "Down-Observation Room", 
            }, 
         }, 
         Name = "Shipping Platform", 
      }, 
      [21180] = 
      {
         Vnum = 21180, 
         Name = "Secret Room", 
         Description = "&z As you look up you can see a few light rays slipping down from the\
cracks in the hard wood floor above. There is a small light positioned in\
the corner of the room. The floor is carved out stone and rather ruffand\
dark. The walls lead around to a small steal circular hatch. If you become\
quiet you can hear small business transactions occuring above.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21181, 
               Distance = 0, 
               Keyword = "hatch", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21066, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21181] = 
      {
         Vnum = 21181, 
         Name = "Tunnel", 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see the hatch, while below you\
look down and see nothing but complete darkness.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21180, 
               Distance = 0, 
               Keyword = "hatch", 
               Direction = "west", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21182, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21182] = 
      {
         Vnum = 21182, 
         Name = "Tunnel", 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see only darkness, while below\
you look down and see a glimmer of light coming from the darkness.\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21181, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21183, 
               Distance = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21183] = 
      {
         Vnum = 21183, 
         Name = "Security Clearance Room", 
         Description = "&c  Looking around you know this place is one of danger and definitely\
doesn't belong here in Coral City. The Walls are carved out magma with\
extremly state of the art security cameras scanning your every bio-stat.\
Attached to the sides of the doors are small laser pods used to make sure\
someone doesn't pass who is not allowed.  \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21184, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 21182, 
               Distance = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21184] = 
      {
         Vnum = 21184, 
         Name = "Imperial Spy Base", 
         Description = "&z You stand in a rather large room full of computer and survailence\
equipment. There are strange markings on the displays .You are familiar\
with the markings, Imperial code language . Apparently the rumors about\
the Quarren are true. \
&x\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21185, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21183, 
               Distance = 0, 
               Keyword = "door", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21185] = 
      {
         Vnum = 21185, 
         Name = "Floating in a void", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21184, 
               Distance = 0, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21186] = 
      {
         Vnum = 21186, 
         Name = "&G Universe Construction Co.", 
         Description = "Welcome to the Universe Construction Co. , We are always looking for new\
builders. In this room is the Construction Board. On it will be\
assignments and a way to check in. This is not a place to ask for a zone\
you have to email me or contact me on the game! Failure to follow this\
simple rule will result in you getting smacked with my back fin!!!!\
To the east you see a large Library!\
Contact Ackbar for more info!\
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21187, 
               Distance = 0, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 21023, 
               Distance = 0, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21187] = 
      {
         Vnum = 21187, 
         Name = "Construction Blueprints", 
         Description = "Here you will find some background info available for your reading.\
Understand this is not all you can use but a basic idea to start with. Got\
any more info on projects were doing ..Well email me them at\
MonCal@netscape.net \
", 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 21186, 
               Distance = 0, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
      }, 
      [21445] = 
      {
         Vnum = 21445, 
         Name = "Floating in a void", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
      }, 
      [21499] = 
      {
         Vnum = 21499, 
         Name = "Floating in a void", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
      }, 
      [21436] = 
      {
         Vnum = 21436, 
         Name = "Floating in a void", 
         Description = "", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
      }, 
   }, 
   Objects = 
   {
      [21000] = 
      {
         Vnum = 21000, 
         Name = "potion violet glowing", 
         ItemType = "potion", 
         Description = "A glowing violet potion has been carelessly left here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "violet", 
               Description = "Textures of both deep red and pale purple swirl together inside the vial.\
\13", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
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
         Cost = 61000, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21001] = 
      {
         Vnum = 21001, 
         Name = "potion purple glowing", 
         ItemType = "potion", 
         Description = "A glowing purple potion has been carelessly left here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 6500, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21002] = 
      {
         Vnum = 21002, 
         Name = "puce potion glowing", 
         ItemType = "potion", 
         Description = "A glowing puce potion has been carelessly left here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 2400, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21003] = 
      {
         Vnum = 21003, 
         Name = "potion maroon glowing", 
         ItemType = "potion", 
         Description = "A glowing maroon potion has been carelessly left here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 750, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21004] = 
      {
         Vnum = 21004, 
         Name = "potion blue glowing", 
         ItemType = "trash", 
         Description = "A glowing blue potion has been carelessly left here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 15000, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21133] = 
      {
         Vnum = 21133, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "A freshly smoked womp rat lies here giving off a hickory scent.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "smoked womp rat", 
         ActionDescription = "%s savour$q a piece of $p.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "smoked womp rat", 
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21134] = 
      {
         Vnum = 21134, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "A plump roast kinewe bird has been carelessly left on the ground here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "roast kinewe", 
         ActionDescription = "%s delicately nibble$q on a piece of $p.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "Roast kinewe", 
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21135] = 
      {
         Vnum = 21135, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "Some freshly picked chanterelle mushrooms have been left behind here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "chanterelle mushrooms", 
         ActionDescription = "%s savor$q $p.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "some freshly picked chanterelle mushrooms", 
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21136] = 
      {
         Vnum = 21136, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "Nuts shells lie discarded around a small bag left here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bag black walnuts", 
         ActionDescription = "%s quickly down$q $p.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a bag of fresh black nuts", 
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21137] = 
      {
         Vnum = 21137, 
         Name = "leg dewback", 
         ItemType = "food", 
         Description = "A freshly cooked leg of dewback has been dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "%s savagely gnaw$q on $p.", 
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
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21010] = 
      {
         Vnum = 21010, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Description = "A large mug of ale sits here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "mug ale", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 12, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a mug of ale", 
         Cost = 75, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21139] = 
      {
         Vnum = 21139, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "A handfull of salty Grana seeds has been left hhere.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Grana seeds", 
         ActionDescription = "%s quickly consume$q $p.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a handful of Grana seeds", 
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21140] = 
      {
         Vnum = 21140, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "key", 
         Description = "&z A set of silver master keys was left here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "key master silver", 
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
         ShortDescr = "&z A set of silver master keys &x", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21141] = 
      {
         Vnum = 21141, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "treasure", 
         Description = "&c A Flag of War", 
         ExtraDescriptions = 
         {
         }, 
         Name = "flag", 
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
         ShortDescr = "A flag", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21014] = 
      {
         Vnum = 21014, 
         Name = "salami", 
         ItemType = "food", 
         Description = "A slice of salami sits in the man made.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 4, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21015] = 
      {
         Vnum = 21015, 
         Name = "beef", 
         ItemType = "food", 
         Description = "A large chunk of raw beef lies here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 9, 
         Layers = 0, 
         Weight = 5, 
      }, 
      [21016] = 
      {
         Vnum = 21016, 
         Name = "turkey", 
         ItemType = "food", 
         Description = "A  cooked Mon bird, which looks quite edible, lies on the tray.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 10, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21017] = 
      {
         Vnum = 21017, 
         Name = "bottle blue milk", 
         ItemType = "drink_container", 
         Description = "A bottle of imported blue milk sits upright on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 4, 
         Layers = 0, 
         Weight = 3, 
      }, 
      [21018] = 
      {
         Vnum = 21018, 
         Name = "wheel cheese", 
         ItemType = "food", 
         Description = "A round wheel of cheese looks very good.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 10, 
         Layers = 0, 
         Weight = 3, 
      }, 
      [21019] = 
      {
         Vnum = 21019, 
         Name = "lemonade cup", 
         ItemType = "drink_container", 
         Description = "A cup of spiked lemonade makes your thirst quench easily.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 1, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21020] = 
      {
         Vnum = 21020, 
         Name = "cake", 
         ItemType = "food", 
         Description = "A large chocolate cake awaits someone to eat it.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 15, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21021] = 
      {
         Vnum = 21021, 
         Name = "loaf bread", 
         ItemType = "food", 
         Description = "A scrumptious loaf of bread lies here, making your taste buds swirl.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 2, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21022] = 
      {
         Vnum = 21022, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "food", 
         Description = "A cherry pie makes your mouth water.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "cherry pie", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a cherry pie", 
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21023] = 
      {
         Vnum = 21023, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "pen", 
         Description = "A writing computer pen lies on the ground, unowned.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "pen", 
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
         ShortDescr = "a writing computer pen", 
         Cost = 30, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21420] = 
      {
         Vnum = 21420, 
         Name = "hologram", 
         ItemType = "book", 
         Description = "A hologram parchment sits here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "parchment", 
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
            }, 
            [2] = 
            {
               Keyword = "1", 
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
            }, 
            [3] = 
            {
               Keyword = "2", 
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
            }, 
            [4] = 
            {
               Keyword = "3", 
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
            }, 
            [5] = 
            {
               Keyword = "3a", 
               Description = "Area Knowledge\
\13\
\13Area Knowledge is important to survival whether engaging in pkilling or mob\
\13killing.  You should try to learn as much about an area before attempting\
\13to operate in it.  Know nearby safe zones and where you can or cannot\
\13recall from.  This knowledge may save you in the future.\
\13\
\13", 
            }, 
            [6] = 
            {
               Keyword = "4", 
               Description = "Sorry this info could not be obtained.\
\13", 
            }, 
            [7] = 
            {
               Keyword = "4a", 
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
            }, 
            [8] = 
            {
               Keyword = "5", 
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
            }, 
            [9] = 
            {
               Keyword = "6", 
               Description = "Config +FLEE\
\13\
\13Many players like this until they flee into a death trap.  In general, it's\
\13a bad idea.  You are usually better off to recall than to flee.  If you have\
\13problems recalling.\
\13\
\13", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
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
         ShortDescr = "A hologram", 
         Cost = 45000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21421] = 
      {
         Vnum = 21421, 
         Name = "bus stop sign", 
         ItemType = "furniture", 
         Description = "A pluogus bus stop sign.", 
         ExtraDescriptions = 
         {
         }, 
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
         ShortDescr = "a sign", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21422] = 
      {
         Vnum = 21422, 
         Name = "small crystal", 
         ItemType = "crystal", 
         Description = "A small crystal catches your eye.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
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
         ShortDescr = "a small crystal", 
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21423] = 
      {
         Vnum = 21423, 
         Name = "relacite crystal", 
         ItemType = "crystal", 
         Description = "A crystal was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 3000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21424] = 
      {
         Vnum = 21424, 
         Name = "Kathracite crystal", 
         ItemType = "crystal", 
         Description = "Something shiney catches your eye.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 2000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21425] = 
      {
         Vnum = 21425, 
         Name = "mephite crystal", 
         ItemType = "crystal", 
         Description = "Something shiney catches your eye.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 5000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21042] = 
      {
         Vnum = 21042, 
         Name = "board general", 
         ItemType = "furniture", 
         Description = "The Akatamer board hangs here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "book", 
               Description = "", 
            }, 
         }, 
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
         ShortDescr = "the general board", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1001, 
      }, 
      [21427] = 
      {
         Vnum = 21427, 
         Name = "lever omputer terminal", 
         ItemType = "lever", 
         Description = "&b A computer terminal rests aginst the wall here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "parchment", 
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
            }, 
            [2] = 
            {
               Keyword = "1", 
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
            }, 
            [3] = 
            {
               Keyword = "2", 
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
            }, 
            [4] = 
            {
               Keyword = "3", 
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
            }, 
            [5] = 
            {
               Keyword = "3a", 
               Description = "Area Knowledge\
\13\
\13Area Knowledge is important to survival whether engaging in pkilling or mob\
\13killing.  You should try to learn as much about an area before attempting\
\13to operate in it.  Know nearby safe zones and where you can or cannot\
\13recall from.  This knowledge may save you in the future.\
\13\
\13", 
            }, 
            [6] = 
            {
               Keyword = "4", 
               Description = "Sorry this info could not be obtained.\
\13", 
            }, 
            [7] = 
            {
               Keyword = "4a", 
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
            }, 
            [8] = 
            {
               Keyword = "5", 
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
            }, 
            [9] = 
            {
               Keyword = "6", 
               Description = "Config +FLEE\
\13\
\13Many players like this until they flee into a death trap.  In general, it's\
\13a bad idea.  You are usually better off to recall than to flee.  If you have\
\13problems recalling.\
\13\
\13", 
            }, 
            [10] = 
            {
               Keyword = "computer terminal", 
               Description = "", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
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
         ShortDescr = "A computer terminal lever", 
         Cost = 45000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21428] = 
      {
         Vnum = 21428, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "key", 
         Description = "Key", 
         ExtraDescriptions = 
         {
         }, 
         Name = "key ", 
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
         ShortDescr = "Key", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21045] = 
      {
         Vnum = 21045, 
         Name = "crystal staff", 
         ItemType = "_wand", 
         Description = "A sparkling crystal staff has been left lying here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 1000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21046] = 
      {
         Vnum = 21046, 
         Name = "bag rune-covered", 
         ItemType = "container", 
         Description = "A strange bag, covered in dust, has been left here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 1000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21048] = 
      {
         Vnum = 21048, 
         Name = "mail board stack", 
         ItemType = "furniture", 
         Description = "A stack of holomail is piled high here.", 
         ExtraDescriptions = 
         {
         }, 
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
         ShortDescr = "a stack of holomail", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1001, 
      }, 
      [21049] = 
      {
         Vnum = 21049, 
         Name = "ball light", 
         ItemType = "light", 
         Description = "A bright ball of light shimmers in the air.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21435] = 
      {
         Vnum = 21435, 
         Name = "augurer guild board", 
         ItemType = "furniture", 
         Description = "Data Info Center - (Terminal)", 
         ExtraDescriptions = 
         {
         }, 
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
         ShortDescr = "the board of the augurer guild", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21055] = 
      {
         Vnum = 21055, 
         Name = "thief ring", 
         Affects = 
         {
            [1] = 
            {
               Location = 31, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A ring which will bring good luck lies here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [16] = "_16", 
            [17] = "_17", 
            [19] = "LargeSize", 
            [5] = "Invis", 
            [14] = "_14", 
         }, 
         ActionDescription = "", 
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
         Cost = 500, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21056] = 
      {
         Vnum = 21056, 
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
         ItemType = "armor", 
         Description = "An iron ring has fallen here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "ring", 
               Description = "Rumors say that these rings protect from magical enchantments...\
\13", 
            }, 
         }, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21057] = 
      {
         Vnum = 21057, 
         Name = "a neck guard", 
         ItemType = "armor", 
         Description = "A large neck guard was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 30, 
         Layers = 0, 
         Weight = 3, 
      }, 
      [21058] = 
      {
         Vnum = 21058, 
         Name = "crested plate", 
         ItemType = "armor", 
         Description = "A New Rebublic breastplate has fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 150, 
         Layers = 128, 
         Weight = 8, 
      }, 
      [21059] = 
      {
         Vnum = 21059, 
         Name = "a helm", 
         ItemType = "armor", 
         Description = "A helm is here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 50, 
         Layers = 4, 
         Weight = 8, 
      }, 
      [21060] = 
      {
         Vnum = 21060, 
         Name = "guard leggings", 
         ItemType = "armor", 
         Description = "A set of guard leggings has fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 20, 
         Layers = 16, 
         Weight = 4, 
      }, 
      [21061] = 
      {
         Vnum = 21061, 
         Name = "boots black", 
         ItemType = "armor", 
         Description = "A set of boots has fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 40, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21062] = 
      {
         Vnum = 21062, 
         Name = "guard sleeves", 
         ItemType = "armor", 
         Description = "A set of guard sleeves has fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 20, 
         Layers = 0, 
         Weight = 3, 
      }, 
      [21063] = 
      {
         Vnum = 21063, 
         Name = "guard gauntlets", 
         ItemType = "armor", 
         Description = "Some guard gauntlets have fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 40, 
         Layers = 0, 
         Weight = 4, 
      }, 
      [21064] = 
      {
         Vnum = 21064, 
         Name = "bracer", 
         ItemType = "armor", 
         Description = "A bracer was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 75, 
         Layers = 128, 
         Weight = 2, 
      }, 
      [21065] = 
      {
         Vnum = 21065, 
         Name = "calamarian energy shield", 
         ItemType = "armor", 
         Description = "A calamarian energy shield was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 600, 
         Layers = 0, 
         Weight = 6, 
      }, 
      [21066] = 
      {
         Vnum = 21066, 
         Name = "rubber visor", 
         ItemType = "armor", 
         Description = "A rubber visor was misplaced here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 50, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21067] = 
      {
         Vnum = 21067, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "light", 
         Description = "A plain electric torch has been left lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "torch", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 24, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a torch", 
         Cost = 10, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21068] = 
      {
         Vnum = 21068, 
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
         ItemType = "weapon", 
         Description = "A com-blaster has fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 300, 
         Layers = 0, 
         Weight = 3, 
      }, 
      [21069] = 
      {
         Vnum = 21069, 
         Name = "hand blaster", 
         ItemType = "weapon", 
         Description = "A hand blaster has fallen here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 300, 
         Layers = 0, 
         Weight = 6, 
      }, 
      [21070] = 
      {
         Vnum = 21070, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "Key to Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
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
         ShortDescr = "Key to Docking Bay", 
         Cost = 1000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21071] = 
      {
         Vnum = 21071, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "The key to Akatamer's northern Docking bay lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
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
         ShortDescr = "the key to the northern Docking bay of Akatamer", 
         Cost = 1000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21072] = 
      {
         Vnum = 21072, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "The key to Akatamer's eastern Docking bay lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
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
         ShortDescr = "the key to the eastern Docking bay of Akatamer", 
         Cost = 1000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21073] = 
      {
         Vnum = 21073, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "armor", 
         Description = "The Key to the southern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
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
         ShortDescr = "Key to Southern Docking Bay.", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21076] = 
      {
         Vnum = 21076, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Description = "Someone has left a bantha leather shirt lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather shirt", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a leather shirt", 
         Cost = 200, 
         Layers = 0, 
         Weight = 4, 
      }, 
      [21077] = 
      {
         Vnum = 21077, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ItemType = "armor", 
         Description = "Some bantha leather pants are lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "pants leather", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "some leather pants", 
         Cost = 150, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21078] = 
      {
         Vnum = 21078, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ItemType = "armor", 
         Description = "Some bantha leather sleeves have been abandoned here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather sleeves", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "some leather sleeves", 
         Cost = 75, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21079] = 
      {
         Vnum = 21079, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ItemType = "armor", 
         Description = "A pair of bantha leather boots are lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather boots", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "some leather boots", 
         Cost = 125, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21080] = 
      {
         Vnum = 21080, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ItemType = "armor", 
         Description = "Two bantha leather gloves are lying on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather gloves pair", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a pair of leather gloves", 
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21081] = 
      {
         Vnum = 21081, 
         Name = "steel knife", 
         ItemType = "weapon", 
         Description = "A gleaming knife shines brightly here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
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
         ShortDescr = "a steel knife", 
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21082] = 
      {
         Vnum = 21082, 
         Name = "Mon-blaster", 
         ItemType = "weapon", 
         Description = "An Mon Blaster has been carelessly left here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
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
         Cost = 200, 
         Layers = 0, 
         Weight = 4, 
      }, 
      [21083] = 
      {
         Vnum = 21083, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "key", 
         Description = "This item doesn't need a long :P", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
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
         ShortDescr = "hotel  key", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21094] = 
      {
         Vnum = 21094, 
         Name = "ring golden band", 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 3072, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A strange golden band has been left lying here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Cost = 10000, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21426] = 
      {
         Vnum = 21426, 
         Name = "gill mask", 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = -2147483648, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "1", 
               MudProgType = "rand_prog", 
               Code = "mpecho &R^R Warning, Gill Mask Failure &x ^x\
", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "&O A Mon Gill was left here on the ground.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "gill mask", 
               Description = "&O The mon gill while very effective has a very short life span.\
\13", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
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
         ShortDescr = "&O A Mon Gill", 
         Cost = 200, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21138] = 
      {
         Vnum = 21138, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Description = "Some freshly gathered wild seaweed have been forgotten here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "wild mustard greens", 
         ActionDescription = "%s quickly eat$q $p.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "some wild seaweed greens", 
         Cost = 200, 
         Layers = 0, 
         Weight = 2, 
      }, 
      [21008] = 
      {
         Vnum = 21008, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Description = "A small bottle, tipped on its side, drips on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "beer bottle", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a bottle of beer", 
         Cost = 100, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21111] = 
      {
         Vnum = 21111, 
         Name = "manor painting", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "exa_prog", 
               Code = "mpechoat $n A magical force suddenly takes hold of you, pulling you in!\
mpechoat $n When you right yourself, you look around to collect your bearings,\
mpechoat $n and find yourself standing before the manor...\
mptrans $n 2400\
mpecho $n fades before your eyes while examining the painting of the manor.\
", 
            }, 
         }, 
         ItemType = "furniture", 
         Description = "A painting of a glorious security post hangs on the wall, catching your eye.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "painting manor house", 
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
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
         ShortDescr = "an oil painting", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21112] = 
      {
         Vnum = 21112, 
         Name = "solemn painting unholy", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "exa_prog", 
               Code = "mpechoat $n Your feel your body as it dissolves into elements of color,\
mpechoat $n sphotel ing slowly into the oils of the dark painting...\
mpechoaround $n Stepping forward to examine the painting, $n's body begins to\
mpechoaround $n liquesce, dissolving into a kaleidoscope of colors, sphotel ing\
mpechoaround $n funnel-like into the oiled textures of the solemn image.\
mptransfer $n 2171\
", 
            }, 
         }, 
         ItemType = "furniture", 
         Description = "A dark, solemn painting hangs here in the shadows, collecting dust.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "solemn painting unholy", 
               Description = "Gazing at the painting, you find yourself entranced by the image of a\
\13woman kneeling at the foot of a grave, mourning the loss of her child.\
\13As tears stream down her face, she finds the arms of an angel wrapped\
\13around her, seeming to comfort her in her hour of despair.  Suddenly,\
\13everything about you shifts and you find yourself becoming part of\
\13the painting, screaming as the angel of darkness drags you, too, \
\13unto the unholy grounds of the dead.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [2] = "_02", 
         }, 
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
         ShortDescr = "a dark, solemn painting", 
         Cost = 0, 
         Layers = 0, 
         Weight = 50, 
      }, 
      [21113] = 
      {
         Vnum = 21113, 
         Name = "map", 
         ItemType = "furniture", 
         Description = "A ratted up map was left here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "painting manor house", 
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
            }, 
            [2] = 
            {
               Keyword = "map", 
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
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
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
         ShortDescr = "A ratted up map", 
         Cost = 2, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21114] = 
      {
         Vnum = 21114, 
         Name = "statue", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "bow pray", 
               MudProgType = "act_prog", 
               Code = "mpecho You feel all your prayers are being answered from above.\
", 
            }, 
         }, 
         ItemType = "furniture", 
         Description = "&c A large bronze statue stands tall here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "painting manor house", 
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
            }, 
            [2] = 
            {
               Keyword = "statue", 
               Description = "&c This large bronze statue is of a great Mon Calamarian individual, who\
\13helped end the first Imperial force and the second Death Star. There is  a\
\13small frame on the sign with a gold inprint on it.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
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
         ShortDescr = "&c A large bronze statue ", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21115] = 
      {
         Vnum = 21115, 
         Name = "bed prison", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100 p sits down.", 
               MudProgType = "act_prog", 
               Code = "mpecho You plop flat in the large metal bed relaxing..\
mpecho thinking this is not to bad when...\
mpecho  BOING!\
mpecho  A spring pokes you in the back.\
mpforce $n stand\
", 
            }, 
         }, 
         ItemType = "furniture", 
         Description = "&z A metal prison bed lies aginst the wall. &x", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Chair", 
               Description = "What you've never seen a chair before??\
\13", 
            }, 
         }, 
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
         ShortDescr = "&z A metal prison bed ", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21116] = 
      {
         Vnum = 21116, 
         Name = "suction john toilet waste", 
         ItemType = "trash", 
         Description = "&c A TI-0 suction waste machine is placed in the corner.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Chair", 
               Description = "What you've never seen a chair before??\
\13", 
            }, 
         }, 
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
         ShortDescr = "&c A TI-0 suction waste machine", 
         Cost = 0, 
         Layers = 0, 
         Weight = 1, 
      }, 
      [21117] = 
      {
         Vnum = 21117, 
         Name = "vest gamorean double strap", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -10, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "&G A gamorrean double strap vest was left here. &x", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
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
         ShortDescr = "&G A gamorrean double strap vest &x", 
         Cost = 100, 
         Layers = 8, 
         Weight = 1, 
      }, 
      [21118] = 
      {
         Vnum = 21118, 
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
         ItemType = "armor", 
         Description = "&b Lizard skin feet covers were left here &x.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
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
         Cost = 125, 
         Layers = 4, 
         Weight = 1, 
      }, 
      [21009] = 
      {
         Vnum = 21009, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
         Description = "A bottle of whiskey spills drops on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "whiskey bottle", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a bottle of whiskey", 
         Cost = 50, 
         Layers = 0, 
         Weight = 1, 
      }, 
   }, 
   Mobiles = 
   {
      [21000] = 
      {
         Name = "healer jedi saint", 
         HitChance = 
         {
            HitNoDice = 25, 
            HitSizeDice = 500, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "elderly saint", 
         LongDescr = "A elderly saint wearing only a dark robe wanders here.\
", 
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
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21000, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [8] = "_08", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21001] = 
      {
         Name = "Anakiem shopkeeper", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "staff", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "_wand", 
            }, 
            KeeperVnum = 21001, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "Anikem the shopkeeper", 
            ProfitBuy = 120, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "corusca", 
               MudProgType = "speech_prog", 
               Code = "smile\
nod\
' ahh the rare corusca crystal is what you seek \
' the only one i know of was given to a young jedi by Master Luke.\
' Seek him out if you seek that crystal.\
smile $n\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Anikem the shopkeeper", 
         LongDescr = "Anakiem the shopkeeper stands here.\
", 
         HitRoll = 34, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21001, 
         NumberOfAttacks = 6, 
         ArmorClass = -300, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 20, 
            DamSizeDice = 100, 
            DamPlus = 100, 
         }, 
         DamRoll = 4, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Quarren", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21002] = 
      {
         Name = "Torval repair", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         RepairShop = 
         {
            KeeperShortDescr = "the repair tech", 
            FixTypes = 
            {
               [1] = "armor", 
               [2] = "container", 
               [0] = "weapon", 
            }, 
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperVnum = 21002, 
            ProfitFix = 120, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "10 ", 
               MudProgType = "rand_prog", 
               Code = "mpecho You hear loud bangs as Torval hammers out dents in the\
mpecho weapons\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say hello, if you don't have a weapon for me to repair please leave I'm\
mpecho busy!\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [2] = "twileki", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the repair tech", 
         LongDescr = "Torval the repir tech works on armor.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21002, 
         NumberOfAttacks = 5, 
         ArmorClass = -300, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 1000, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Twi'lek", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21003] = 
      {
         Name = "Shana spice dealer", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "potion", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "pill", 
            }, 
            KeeperVnum = 21003, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the spice dealer", 
            ProfitBuy = 115, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the spice dealer", 
         LongDescr = "The Rodian spice dealer stands behind the counter.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21003, 
         NumberOfAttacks = 6, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Wookiee", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21004] = 
      {
         Name = "Shuttleee", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "scroll", 
            }, 
            KeeperVnum = 21004, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the Shuttleee", 
            ProfitBuy = 120, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Shuttleee", 
         LongDescr = "The Shuttleee sits here.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21004, 
         NumberOfAttacks = 6, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Wookiee", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21006] = 
      {
         Name = "guildmaster", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
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
         Position = "standing", 
         HitRoll = 0, 
         Resistant = 
         {
            [1] = "cold", 
            [4] = "blunt", 
            [20] = "magic", 
         }, 
         Alignment = -1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         ShortDescr = "skill teacher", 
         LongDescr = "The skill teacher awaits a student.\
", 
         Susceptible = 
         {
            [0] = "fire", 
            [5] = "pierce", 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Vnum = 21006, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [12] = "_12", 
            [20] = "_20", 
            [6] = "_06", 
            [11] = "_11", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 20, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21007] = 
      {
         Name = "Mon Calamrian doll", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 100, 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Calamrian doll", 
         LongDescr = "A Calamrian doll hangs limply here.\
", 
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
         Vnum = 21007, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
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
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21009] = 
      {
         Name = "Ship builder", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "_boat", 
            }, 
            KeeperVnum = 21009, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the Builder", 
            ProfitBuy = 120, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the Builder", 
         LongDescr = "A Builder offers you his selection of Mon made ships.\
", 
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
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21009, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21010] = 
      {
         Name = "waitress", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the waitress", 
         LongDescr = "The cute Calamrian waitress awaits your order.\
", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21010, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the waitress", 
            ProfitBuy = 120, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21010, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 18, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 18, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21011] = 
      {
         Name = "printer", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the printer", 
         LongDescr = "A thin Calamrian printer sits behind a stack of papers.\
", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21011, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the printer", 
            ProfitBuy = 120, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Vnum = 21011, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21012] = 
      {
         Name = "Shuttleer father", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the Guild Father", 
         LongDescr = "The Guild's Shuttleer meditates here.\
\
", 
         Level = 50, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21012, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 5, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21013] = 
      {
         Name = "Monei bartender", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21013, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the bartender Monei", 
            ProfitBuy = 120, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say Pull up a chair and have a drink, we only live once ya know.\
", 
            }, 
            [2] = 
            {
               Arguments = "10 ", 
               MudProgType = "rand_prog", 
               Code = "mpemote You hear the bartender say, \"I wish those dman vendors would shut\
up!\"\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the bartender Monei", 
         LongDescr = "Monei the bartender stands behind his counter.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21013, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 100, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21014] = 
      {
         Name = "jeweler", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "treasure", 
            }, 
            KeeperVnum = 21014, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "Joyta, Mon Calamarian Jewler", 
            ProfitBuy = 95, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5 ", 
               MudProgType = "rand_prog", 
               Code = "Yell Come in , I've got the best Jewlery in the Galexy!\
", 
            }, 
            [2] = 
            {
               Arguments = "hi hello ", 
               MudProgType = "speech_prog", 
               Code = "Say Hello $n in the mood for buying some Jewlery?\
", 
            }, 
            [3] = 
            {
               Arguments = "yes", 
               MudProgType = "speech_prog", 
               Code = "Say Good come take a look at my display!\
", 
            }, 
            [4] = 
            {
               Arguments = "ultima pearl ultima_pearl", 
               MudProgType = "speech_prog", 
               Code = "say Sorry those are not for sale, protected by the governement.\
say Shhhh , I hear there are more in the ocean, get me one and I'll pay you\
a high\
price.\
say but you didn't here that from me.\
", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Joyta, Mon Calamarian Jewler", 
         LongDescr = "&C Joyta, Mon Calamarian Jewler displays here jems in the case.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21014, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21015] = 
      {
         Name = "rax armourer", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         RepairShop = 
         {
            KeeperShortDescr = "the Rax armourer", 
            FixTypes = 
            {
               [1] = "armor", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperVnum = 21015, 
            ProfitFix = 100, 
         }, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "armor", 
            }, 
            KeeperVnum = 21015, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the Rax armourer", 
            ProfitBuy = 130, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say Welcome $n Heard you were in town.\
say If you want any equipment just tell me.\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Rax armourer", 
         LongDescr = "Rax the armourer is here fitting a Mon Calamrian  helm.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21015, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 1000, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21016] = 
      {
         Name = "bonta weaponsmith", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "weapon", 
            }, 
            KeeperVnum = 21016, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the Bonta weaponsmith", 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say Welcome to my shop care to buy a weapon?\
mpecho Bonta grins at you evily.\
", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Bonta weaponsmith", 
         LongDescr = "The weaponsmith Bonta, labors over a lengthy blade.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21016, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21017] = 
      {
         Name = "postmaster", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the postmaster", 
         LongDescr = "The postmaster sorts the day's mail.\
", 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21017, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21018] = 
      {
         Name = "chef", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21018, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the chef Wannie", 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say Hello just step right up and get my galexy famous barbecue.\
", 
            }, 
            [2] = 
            {
               Arguments = "5 ", 
               MudProgType = "rand_prog", 
               Code = "Yell Barbecue, fresh and hot, falls of the bones. \
", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the chef Wannie", 
         LongDescr = "A chef Wannie greets you.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21018, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21019] = 
      {
         Name = "baker", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21019, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the baker", 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "say Welcome to my shop when you want to buy just yell!\
", 
            }, 
            [2] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = "Yell Fresh Hot Seaweed Bread, Get it while it's Hot!\
", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the baker", 
         LongDescr = "The Mon Calamarian baker is here, covered with seaweed flour.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21019, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 500, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21020] = 
      {
         Name = "Mon Calamrian girl", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitSizeDice = 10, 
            HitPlus = 1000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21020, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the Mon Calamrian girl", 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "say Hello, can I intrest you in anything?\
", 
            }, 
            [2] = 
            {
               Arguments = "sex you fuck", 
               MudProgType = "speech_prog", 
               Code = "Say Noy noe $n I'm working...maybe later!\
stare $n\
", 
            }, 
            [3] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = "Yell Fresh blue seacow milk, get it while it's here.\
", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Mon Calamrian girl", 
         LongDescr = "A young Mon Calamarian girl smiles as you enter.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Level = 100, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 20, 
         Vnum = 21020, 
         NumberOfAttacks = 3, 
         ArmorClass = -150, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 20, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21021] = 
      {
         Name = "Lokist tailor", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "armor", 
            }, 
            KeeperVnum = 21021, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "&z Lokist the tailor", 
            ProfitBuy = 120, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&z Lokist the tailor", 
         LongDescr = "&z Lokist the tailor is here showing off the latest fashion.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21021, 
         NumberOfAttacks = 6, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21022] = 
      {
         Name = "bantha keeper", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
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
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the bantha keeper", 
         LongDescr = "The bantha keeper tends to his animals.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21022, 
         NumberOfAttacks = 6, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21023] = 
      {
         Name = "thief master", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
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
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the Master Thief", 
         LongDescr = "A master thief is here to demonstrate the ways of thievery.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21023, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [19] = "_19", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21025] = 
      {
         Name = "hotel keeper", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         RepairShop = 
         {
            KeeperShortDescr = "the hotel keeper", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperVnum = 21025, 
            ProfitFix = 100, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "200", 
               MudProgType = "bribe_prog", 
               Code = "if inroom($i) == 21069\
  say Go on back and pick a room.\
  , points over his shoulder.\
  mptransfer $n 21146\
  mpat $n mea $n The hotel keeper points you down the hall.\
  mpat $n say When you wan'na leave, just tell me. And don't mess up the sheets\
  mppurge coins\
endif\
", 
            }, 
            [2] = 
            {
               Arguments = "leave exit", 
               MudProgType = "speech_prog", 
               Code = "if inroom($i) == 21146\
if inroom($n) == 21146\
  mptransfer $n 21069\
  mpat $n mea $n The hotel keeper leads you out.\
endif\
endif\
", 
            }, 
            [3] = 
            {
               Arguments = "", 
               MudProgType = "all_greet_prog", 
               Code = "Say Welcome $n your room awits you.\
", 
            }, 
            [4] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "say Welcome $n your room awaits.\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the hotel keeper", 
         LongDescr = "The hotel keeper stands here, looking rather gruff.\
", 
         HitRoll = 0, 
         Level = 50, 
         AffectedBy = 
         {
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
         Vnum = 21025, 
         NumberOfAttacks = 4, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 15, 
            DamPlus = 1000, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21028] = 
      {
         Name = "sage man", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the sage", 
         LongDescr = "A pensive sage mulls over new Jedi's .\
", 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21028, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 5, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21029] = 
      {
         Name = "storekeeper", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "weapon", 
               [2] = "armor", 
               [3] = "none", 
               [4] = "none", 
               [0] = "superconductor", 
            }, 
            KeeperVnum = 21029, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the storekeeper", 
            ProfitBuy = 120, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the storekeeper", 
         LongDescr = "A large man stands here, selling equipment for adventurers.\
", 
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
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [14] = "gamorrese", 
            }, 
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
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21029, 
         NumberOfAttacks = 4, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 25, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 10, 
            DamPlus = 1000, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21031] = 
      {
         Name = "man ranger", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the ranger Shuttleer", 
         LongDescr = "The ranger Shuttleer demonstrates combat maneuvers.\
", 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21031, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 5, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21416] = 
      {
         Name = "newbie mob", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created newbie mob", 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         Level = 1, 
         Vnum = 21416, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21034] = 
      {
         Name = "woman Shuttleer", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the officers Shuttleer", 
         LongDescr = "A robed woman is here, Shuttleing initiate officers.\
", 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21034, 
         NumberOfAttacks = 4, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 10, 
            DamPlus = 1000, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21035] = 
      {
         Name = "man Shuttleer", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the Warrior Shuttleer", 
         LongDescr = "A giant man stands here, waiting to Shuttle young warriors.\
", 
         Level = 50, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21035, 
         NumberOfAttacks = 5, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 100, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21420] = 
      {
         Name = "dark figure bounty hunter", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 200, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "25", 
               MudProgType = "all_greet_prog", 
               Code = "if isnpc($n)\
else\
  mpechoat $n A man hidden in the shadows beckons you over to him.\
  tell $n I have some information which may be of some value...\
  tell $n And for a price I will perhaps share it with you.\
endif\
", 
            }, 
            [2] = 
            {
               Arguments = "p how much", 
               MudProgType = "speech_prog", 
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
    mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
            }, 
            [3] = 
            {
               Arguments = "p what price", 
               MudProgType = "speech_prog", 
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
   mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
            }, 
            [4] = 
            {
               Arguments = "45000", 
               MudProgType = "bribe_prog", 
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
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the bounty hunter", 
         LongDescr = "A dark figure lurks here, hiding in the shadows.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 10, 
         AffectedBy = 
         {
            [15] = "Sneak", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21420, 
         NumberOfAttacks = 1, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 16, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "A dark Mon Calamrian stands before you, seemingly wearing the shadows around him\
like a cloak.  His gaze bores into your soul, and he appears to beckon\
you over to speak with him.  The glint of a blaster by his side alerts you\
that this man is probably bounty hunter.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = -10, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21037] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "guard man", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A Mon Calamrian guard patrols the streets of the city.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21037, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 16, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 16, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 20, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21041] = 
      {
         Name = "guard", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 20, 
         }, 
         Position = "sleeping", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A tired guard is here.\
", 
         Level = 5, 
         Vnum = 21041, 
         NumberOfAttacks = 2, 
         ArmorClass = 90, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 100, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21043] = 
      {
         Name = "E-web guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A E-Web guard stares out over the area.\
", 
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
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
         Vnum = 21043, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 500, 
         HitRoll = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21044] = 
      {
         Name = "executioner", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Executioner", 
         LongDescr = "A executioner stands silently before you.\
", 
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
         Level = 50, 
         AffectedBy = 
         {
            [2] = "DetectEvil", 
            [3] = "DetectInvis", 
            [13] = "Protect", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [7] = "Sanctuary", 
         }, 
         HitRoll = 0, 
         Vnum = 21044, 
         NumberOfAttacks = 4, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 18, 
            Wisdom = 18, 
            Strength = 18, 
            Force = 0, 
            Constitution = 18, 
            Dexterity = 18, 
            Luck = 18, 
            Charisma = 15, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 800, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21045] = 
      {
         Name = "dog stray", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 35, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a stray", 
         LongDescr = "A stray Mosny dog noses along the street.\
", 
         Level = 5, 
         Languages = 
         {
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
            Speaking = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
         }, 
         Vnum = 21045, 
         NumberOfAttacks = 0, 
         ArmorClass = 100, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 5, 
            DamPlus = 2, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Yevetha", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21431] = 
      {
         Name = "kinalsta man", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30000, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "Kinalsta", 
         LongDescr = "A proud man stands here, deliberating over his theories.\
", 
         Level = 51, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         Vnum = 21431, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 10, 
            DamPlus = 1000, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21433] = 
      {
         Name = "guard sleeping", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "incapacitated", 
         Alignment = 40, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "A sleeping Security Guard", 
         LongDescr = "A sleeping Security Guard rests here.\
", 
         Level = 49, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "mpecho You hear the sweat sounds of a guard snoring.\
say &c ZZZZZZZZZZzzzzzzzzzz    ZZZZZZZZZZZZZzzzzzzzzzz\
", 
            }, 
         }, 
         Vnum = 21433, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
         }, 
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21434] = 
      {
         Name = "woman sec secretary female", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 0, 
            HitPlus = 100, 
         }, 
         Position = "standing", 
         Alignment = -750, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A female Secretary ", 
         LongDescr = "A Mon Calamrian Secretary sits here doing important things.\
\
", 
         Level = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
               Code = "Say Please state your emergency, I'm busy here.\
mpecho You see the secretary return to watching\
\
mpecho her favorite soap.\
", 
            }, 
            [2] = 
            {
               Arguments = "hurt sick injured bleeding emergency ", 
               MudProgType = "speech_prog", 
               Code = "Say Ya ya ya take a number $n.\
Say please fill out these forms and give me 200 credits for the\
say apointment.\
", 
            }, 
            [3] = 
            {
               Arguments = "insurance poor money broke", 
               MudProgType = "speech_prog", 
               Code = "Say Sorry we have paying customers here. Move along!\
", 
            }, 
            [4] = 
            {
               Arguments = "200", 
               MudProgType = "bribe_prog", 
               Code = "Say Well, well you do have money! Have a good time.\
mptransfer $n 21071\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Vnum = 21434, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 1, 
         HitRoll = 0, 
         Description = "", 
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
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21435] = 
      {
         Name = "mon nurse", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 510, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&P A Mon Calamarian Nurse", 
         LongDescr = "&P A Mon Calamarian Nurse sorts through medical supplies.\
", 
         Level = 51, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21435, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "&P A Mon Calamarian Nurse", 
            ProfitBuy = 120, 
         }, 
         Vnum = 21435, 
         NumberOfAttacks = 0, 
         ArmorClass = -27, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         HitRoll = 10, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 10, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21052] = 
      {
         SpecFuns = 
         {
            [1] = "spec_thief", 
         }, 
         Name = "thief figure", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 40, 
            HitPlus = 50, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the thief", 
         LongDescr = "A strange figure lurks furtively.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "29", 
               MudProgType = "greet_prog", 
               Code = "mpecho From behind the shadows you can feel somone lighten your pockets.\
mpforce $n give 25 credits thief\
mpecho You turn around and see noone.\
", 
            }, 
         }, 
         Level = 8, 
         AffectedBy = 
         {
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [15] = "Sneak", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Vnum = 21052, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Resistant = 
         {
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 2, 
            DamPlus = 5, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21437] = 
      {
         Name = "sleeping shop ", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "incapacitated", 
         Alignment = 40, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "&R A sleeping Mount shop keeper ", 
         LongDescr = "&R A sleeping Mount shop keeper lies here.\
", 
         Level = 49, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "35", 
               MudProgType = "rand_prog", 
               Code = "mpecho You hear the soft sounds of ZZZZZZZZZzzzzzzzz coming from the shop\
mpecho keeper!\
", 
            }, 
         }, 
         Vnum = 21437, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "This shop keeper is of a very young age, most likely hi father left him\
here to rent out the\
beasts.\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21438] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "elite officer hyko", 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&c An Elite Security Officer , Hyko ", 
         LongDescr = "&c An Elite Security Officer , Hyko stands here.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say &z Hey if your not supposed to be here, leave before\
Say &z I place you in one of those.\
mpecho The guard points toward the jail cell.\
", 
            }, 
            [2] = 
            {
               Arguments = "fuck ass suck dick ", 
               MudProgType = "speech_prog", 
               Code = "Say &z Sorry pal but your mouth just bought you a night in jail!\
mptransfer $n 21147\
", 
            }, 
         }, 
         Level = 40, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
         }, 
         Vnum = 21438, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 6, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 6, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21055] = 
      {
         Name = "beggar man beggarprog", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 20, 
         }, 
         Position = "standing", 
         Alignment = 300, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the beggar", 
         LongDescr = "A decrepit old beggar sits on the cobbles of the road, pleading.\
", 
         Level = 3, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
            }, 
            [2] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = ", rummages in one of many pouches, searching for gold no doubt.\
", 
            }, 
            [3] = 
            {
               Arguments = "1000", 
               MudProgType = "bribe_prog", 
               Code = "say OHHH MY!!!\
mpecho The beggar suddenly clutches his chest and doubles over.\
mpecho In the blink of an eye, he is dead. \
mpecho The surprise and shock must have been too much for him.\
mpat 21194 mpforce cleric mpat beggarprog mppurge beggarprog\
", 
            }, 
            [4] = 
            {
               Arguments = "100", 
               MudProgType = "bribe_prog", 
               Code = "say I cannot express my gratitude in words $n!\
kis $n\
say If only others were so generous.\
", 
            }, 
            [5] = 
            {
               Arguments = "10", 
               MudProgType = "bribe_prog", 
               Code = "say Thank you for such a worthy donation.\
thank $n\
", 
            }, 
         }, 
         Vnum = 21055, 
         NumberOfAttacks = 0, 
         ArmorClass = 100, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
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
         Description = "The old man is clad in the rags of what was once a military outfit.\
He eyes you warily and holds out a tin cup in supplication...\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21056] = 
      {
         Name = "Calmese", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 75, 
            HitPlus = 100, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         ShortDescr = "the regal calmese", 
         LongDescr = "A proud Calmese bird perches regally here, defiant to all.\
", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
            Speaking = 
            {
               [9] = "antarian", 
            }, 
         }, 
         Level = 15, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         Vnum = 21056, 
         NumberOfAttacks = 2, 
         ArmorClass = -20, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Description = "The Calmese returns your stare with unfeeling eyes.  Its beak and talons\
appear as though they could rend even the toughest of flesh.\
", 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 10, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "_78", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21057] = 
      {
         Name = "bantha", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 100, 
            HitPlus = 100, 
         }, 
         Position = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [18] = "_clan", 
               [9] = "antarian", 
            }, 
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
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the smelly bantha", 
         LongDescr = "A smelly white bantha slowly trods in a circle.\
", 
         HitRoll = 0, 
         Level = 20, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Vnum = 21057, 
         NumberOfAttacks = 2, 
         ArmorClass = 80, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         Description = "This white bantha sports a brilliant white coat and  lies at your approach.\
She appears ready to serve anyone.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 10, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "_86", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21058] = 
      {
         Name = "dewback", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 100, 
            HitPlus = 250, 
         }, 
         Position = "standing", 
         Languages = 
         {
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
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [18] = "_clan", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
            }, 
         }, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the dewback", 
         LongDescr = "A mighty green dewback beats angrily at the ground here.\
", 
         HitRoll = 0, 
         Level = 25, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Vnum = 21058, 
         NumberOfAttacks = 2, 
         ArmorClass = 80, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         Description = "The green dewback snorts as you examine him.  His green scales shine\
brightly regardless of light and the dewback seems as though it could\
move tirelessly for days. dewbacks are scarse here...mostly for pets.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 30, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "_86", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21059] = 
      {
         Name = "teke lizard", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 75, 
            HitPlus = 50, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         ShortDescr = "teke lizard", 
         LongDescr = "A teke lizard scampers away from your booted feet.\
", 
         Level = 5, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Vnum = 21059, 
         NumberOfAttacks = 2, 
         ArmorClass = 20, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
            Speaking = 
            {
               [9] = "antarian", 
            }, 
         }, 
         Description = "The teke lizard appears frightened out of its mind...\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 20, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "_74", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21060] = 
      {
         Name = "dog", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 75, 
            HitPlus = 85, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         ShortDescr = "the Mon Calmarian mutt", 
         LongDescr = "A mon calamrian mutt paces in circles here, sniffing the ground.\
", 
         Level = 10, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Languages = 
         {
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
            Speaking = 
            {
               [9] = "antarian", 
               [11] = "barabel", 
               [7] = "ewokese", 
            }, 
         }, 
         Vnum = 21060, 
         NumberOfAttacks = 2, 
         ArmorClass = 30, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         Description = "The Mon Calmarian mutt constantly sniffs the ground, searching for its prey.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "_73", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21061] = 
      {
         Name = "guard man", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A heavy guard walks the wall of the city.\
", 
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
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21061, 
         NumberOfAttacks = 3, 
         ArmorClass = 5, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21062] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 150, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Docking bay guard", 
         LongDescr = "A Docking bay guard tends the western Docking bay.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un w\
op w\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close w\
\
lock w\
", 
            }, 
         }, 
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
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
         Vnum = 21062, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 2, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21063] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "man guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un e\
op e\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close e\
lock e\
", 
            }, 
         }, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
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
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21063, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21064] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "guard man", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un n\
op n\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close n\
lock n\
", 
            }, 
         }, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A Docking bay guard tends the north Docking bay.\
", 
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
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21064, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21065] = 
      {
         Name = "guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close s\
lock s\
", 
            }, 
            [2] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "unlock s\
op s\
\
", 
            }, 
         }, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
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
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21065, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 4, 
            DamPlus = 15, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21066] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un e\
op e\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close e\
lock e\
", 
            }, 
         }, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A guard of watches you as you move by.\
", 
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
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21066, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 16, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 16, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21067] = 
      {
         Name = "man guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un w\
op w\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close w\
lock w\
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
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A guard of the city stands here.\
", 
         HitRoll = 2, 
         Level = 15, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Vnum = 21067, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21068] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 150, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "A guard of the city stands at the ready.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un s\
op s\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close s\
lock s\
", 
            }, 
         }, 
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
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
         Vnum = 21068, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 2, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21069] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [2] = "spec_guardian", 
         }, 
         Name = "guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "6", 
               MudProgType = "time_prog", 
               Code = "un n\
op n\
", 
            }, 
            [2] = 
            {
               Arguments = "20", 
               MudProgType = "time_prog", 
               Code = "close n\
lock n\
close manhole\
", 
            }, 
         }, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         LongDescr = "An guard keeps vigilant watch here.\
", 
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
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         Vnum = 21069, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21070] = 
      {
         Name = "ratler", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 40, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the pack ratler", 
         LongDescr = "A pack ratler lumbers about, carrying its master's belongings.\
", 
         Level = 6, 
         Vnum = 21070, 
         NumberOfAttacks = 2, 
         ArmorClass = 150, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Languages = 
         {
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
         }, 
         Description = "This fat, lumbering creature is tame and unkept. You find yourself\
wondering what it carries.\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 3, 
            DamPlus = 8, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "_86", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21071] = 
      {
         Name = "E-Web Guard", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         Alignment = 1000, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the E-web", 
         LongDescr = "A E-Web guard peers over the area.\
", 
         Level = 15, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
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
         Vnum = 21071, 
         NumberOfAttacks = 3, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         HitRoll = 2, 
         Description = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21073] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21073, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21074] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21074, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21075] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21075, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21076] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21076, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21077] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21077, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21078] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21078, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21079] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21079, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21080] = 
      {
         Name = "Key", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Level = 1, 
         Vnum = 21080, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21081] = 
      {
         Name = "man elderly george lucas", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 10, 
            HitPlus = 150, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "&p An elderly entertainment man ", 
         LongDescr = "&p An elderly entertainment man rests on the bed contimplating filming a movie.\
&x\
\
", 
         Level = 15, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "say Hey tell me your here to buy my new script... Intersteller Wars?\
", 
            }, 
         }, 
         Vnum = 21081, 
         NumberOfAttacks = 0, 
         ArmorClass = 62, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "This bearded human was jailed after he lost control and shot several Mon\
Calamari individuals. His clothes are ragged and it is rumored that at one\
time he was well known for his excellent Sci-Fiction writing. There is a\
small patch with writing on it. \
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21082] = 
      {
         Name = "gamorrean male Toisk", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "&G Toisk, A rather dumb Gamorrean male", 
         LongDescr = "&G Toisk, A rather dumb Gamorrean male sits here counting the cracks in the\
floor.\
", 
         Level = 10, 
         Vnum = 21082, 
         NumberOfAttacks = 2, 
         ArmorClass = 10, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 18, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 6, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Gamorrean", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21083] = 
      {
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
         }, 
         Name = "scanner enterance", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
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
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&z A Tk-13y Security scanner", 
         LongDescr = "&z A Tk-13y voice active security scanner frames the enterace. &z\
", 
         HitRoll = 0, 
         Level = 15, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Vnum = 21083, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21084] = 
      {
         Name = "Greeting Protocol Droid", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [18] = "Mountable", 
            [0] = "Npc", 
            [30] = "Prototype", 
            [26] = "Droid", 
         }, 
         ShortDescr = "&z Greeting Protocol Droid stands here.", 
         LongDescr = "A power droid is here.\
", 
         Level = 10, 
         Vnum = 21084, 
         NumberOfAttacks = 0, 
         ArmorClass = 75, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21100] = 
      {
         Name = "Protocol Droid Secretary", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Protocol Droid", 
         LongDescr = "Protocol Droid Secretary Greets you\
", 
         Level = 1, 
         Vnum = 21100, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "As busy as this guy is he still takes the time to help each and\
every customer that walks into the room.  His silver coated frame\
gleems brightly and you can see that he will remain in service \
for some time barring any accidents.\
", 
         HitRoll = 3, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 6, 
            DamPlus = 0, 
         }, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21101] = 
      {
         Name = "Janitor", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "A janitor Droid", 
         LongDescr = "A janitor droid scoots about picking up your trash\
", 
         Level = 1, 
         Vnum = 21101, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21445] = 
      {
         Name = "drunk quarren", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 110, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A quarren drunk ", 
         LongDescr = "A quarren drunk stumbles here.\
", 
         Level = 11, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
               Code = "Say hello, You new here $n? or have I talked to you I don't know, \
say hey bartender get me another drink.\
mpecho You see the bartender poor the quarren another drink.\
say you ever been down to the quarren city $n It's awsome.\
mpecho You see the drunk reach in his pockets and \
mpecho you see he has no credits.\
Say hey $n give me 200 credits and I'll give you a map to the Quarren city\
.\
", 
            }, 
            [2] = 
            {
               Arguments = "200 ", 
               MudProgType = "bribe_prog", 
               Code = "Say well thanks $n\
mpoload 21113\
give map $n\
", 
            }, 
         }, 
         Vnum = 21445, 
         NumberOfAttacks = 0, 
         ArmorClass = 72, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21448] = 
      {
         Name = "clerk mon bank", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&G A \"First Bank of Mon\" bank clerk", 
         LongDescr = "&G A \"First Bank of Mon\" bank clerk counts credits to be sorted.\
", 
         Level = 50, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "Say  &c Hello, welcome to the first bank of Mon ,\
Say &c Here your money is safe with us.\
smile $n\
mpecho &R You are reasured of that fact as you feal a red\
mpecho &R laser beam scan you for your bio-info.\
", 
            }, 
         }, 
         Vnum = 21448, 
         NumberOfAttacks = 0, 
         ArmorClass = -25, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 25, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
         }, 
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
      [21447] = 
      {
         Name = "child mon", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "A Mon child", 
         LongDescr = "A Mon child digs in the ground.\
", 
         Level = 1, 
         Vnum = 21447, 
         NumberOfAttacks = 1, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21446] = 
      {
         Name = "quarren child", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "A Quarren child plays here.", 
         LongDescr = "A Quarren child plays here.\
", 
         Level = 1, 
         Vnum = 21446, 
         NumberOfAttacks = 1, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
         }, 
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Quarren", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21499] = 
      {
         Name = "final mob", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created final mob", 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Level = 1, 
         Vnum = 21499, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21444] = 
      {
         Name = "food dispensor", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&R A XT-4y Food Dispensor ", 
         LongDescr = "&R A XT-4y Food Dispensor sits here.\
", 
         Level = 1, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21444, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "&R A XT-4y Food Dispensor ", 
            ProfitBuy = 120, 
         }, 
         Vnum = 21444, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21436] = 
      {
         Name = "Cooking Droid", 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 15, 
            HitPlus = 300, 
         }, 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperVnum = 21436, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "A TK-71 cooking droid", 
            ProfitBuy = 120, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A TK-71 cooking droid", 
         LongDescr = "&C A TK-71 cooking droid stands behind the grill waiting.\
", 
         HitRoll = 0, 
         Level = 15, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Vnum = 21436, 
         NumberOfAttacks = 2, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "male", 
         Weight = 0, 
      }, 
      [21415] = 
      {
         Name = "newbie mob", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created newbie mob", 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         Level = 1, 
         Vnum = 21415, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Credits = 0, 
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
         Description = "", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Weight = 0, 
      }, 
      [21400] = 
      {
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [2] = "spec_police", 
         }, 
         Name = "takiki mon police clerk", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 110, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Position = "standing", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Takiki, A Mon Calamarian police clerk", 
         LongDescr = "Takiki, A Mon Calamarian police clerk\
", 
         Level = 11, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hi", 
               MudProgType = "speech_prog", 
               Code = "Say Hello how can I help you....well come on..\
", 
            }, 
            [2] = 
            {
               Arguments = "crime killed prison free", 
               MudProgType = "speech_prog", 
               Code = "Say Sorry $n come back with someone who cares.\
", 
            }, 
            [3] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "mpecho As you enter the clerk looks up\
mpecho stares you down..\
laugh\
mpecho Then returns to work.\
", 
            }, 
         }, 
         Vnum = 21400, 
         NumberOfAttacks = 0, 
         ArmorClass = 72, 
         Stats = 
         {
            Intelligence = 13, 
            Wisdom = 13, 
            Strength = 13, 
            Force = 0, 
            Constitution = 13, 
            Dexterity = 13, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
         }, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         HitRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Race = "Human", 
         Sex = "female", 
         Weight = 0, 
      }, 
   }, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21003, 
         Arg1 = 21045, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21010, 
         Arg1 = 21055, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 21012, 
         Arg1 = 21037, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 21018, 
         Arg1 = 21037, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21026, 
         Arg1 = 21052, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 21029, 
         Arg1 = 21037, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21048, 
         Arg1 = 21045, 
      }, 
      [35] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21053, 
         Arg1 = 21017, 
      }, 
      [36] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21053, 
         Arg1 = 21048, 
      }, 
      [37] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21053, 
         Arg1 = 38, 
      }, 
      [38] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21055, 
         Arg1 = 21001, 
      }, 
      [39] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21422, 
      }, 
      [40] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21423, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21424, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21425, 
      }, 
      [43] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21056, 
         Arg1 = 21011, 
      }, 
      [44] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21057, 
         Arg1 = 21018, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21014, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21015, 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21016, 
      }, 
      [48] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21058, 
         Arg1 = 21002, 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21060, 
         Arg1 = 21019, 
      }, 
      [50] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21020, 
      }, 
      [51] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21021, 
      }, 
      [52] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21061, 
         Arg1 = 21020, 
      }, 
      [53] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21017, 
      }, 
      [54] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21018, 
      }, 
      [55] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21019, 
      }, 
      [56] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21062, 
         Arg1 = 21016, 
      }, 
      [57] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21069, 
      }, 
      [59] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21081, 
      }, 
      [60] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21082, 
      }, 
      [61] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 21062, 
         Arg1 = 21037, 
      }, 
      [62] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [63] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [64] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [65] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [66] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [67] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [68] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [69] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [70] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [71] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21063, 
         Arg1 = 21055, 
      }, 
      [72] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21064, 
         Arg1 = 21052, 
      }, 
      [73] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21064, 
         Arg1 = 21052, 
      }, 
      [74] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21064, 
         Arg1 = 21055, 
      }, 
      [75] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21065, 
         Arg1 = 21055, 
      }, 
      [76] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 21080, 
         Arg1 = 21061, 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [78] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [79] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [80] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [81] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [82] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [83] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [84] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [85] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 21064, 
      }, 
      [86] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
         Arg1 = 21065, 
      }, 
      [87] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [88] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [89] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [90] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [91] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21087, 
         Arg1 = 21063, 
      }, 
      [92] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [93] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [94] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [95] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [96] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [97] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [98] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [99] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [100] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [101] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 21064, 
      }, 
      [102] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
         Arg1 = 21065, 
      }, 
      [103] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [104] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [105] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [106] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21070, 
      }, 
      [107] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21087, 
      }, 
      [108] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21088, 
         Arg1 = 21062, 
      }, 
      [109] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21070, 
      }, 
      [110] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [111] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [112] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [113] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [114] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [115] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [116] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [117] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [118] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [119] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [120] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [121] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [122] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 0, 
         Arg1 = 21088, 
      }, 
      [123] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21099, 
         Arg1 = 21065, 
      }, 
      [124] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21071, 
      }, 
      [125] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [126] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [127] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [128] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [129] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [130] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [131] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [132] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [133] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [134] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [135] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [136] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [137] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
         Arg1 = 21065, 
      }, 
      [138] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 21064, 
      }, 
      [139] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 0, 
         Arg1 = 21099, 
      }, 
      [140] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21112, 
         Arg1 = 21067, 
      }, 
      [141] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21072, 
      }, 
      [142] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
         Arg1 = 21065, 
      }, 
      [143] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [144] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [145] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [146] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [147] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [148] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [149] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [150] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [151] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [152] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 21064, 
      }, 
      [153] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [154] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [155] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [156] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 0, 
         Arg1 = 21112, 
      }, 
      [157] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21054, 
         Arg1 = 21003, 
      }, 
      [158] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 32230, 
      }, 
      [159] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10487, 
      }, 
      [160] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 21054, 
         Arg1 = 21037, 
      }, 
      [161] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [162] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [163] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [164] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [165] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [166] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [167] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [168] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [169] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [170] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21075, 
         Arg1 = 21069, 
      }, 
      [171] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [172] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [173] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [174] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [175] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [176] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [177] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [178] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [179] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [180] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [181] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [182] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [183] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21073, 
      }, 
      [184] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 21064, 
      }, 
      [185] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
         Arg1 = 21065, 
      }, 
      [186] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21075, 
         Arg1 = 21059, 
      }, 
      [187] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 0, 
         Arg1 = 21075, 
      }, 
      [188] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21119, 
         Arg1 = 21059, 
      }, 
      [189] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 21114, 
         Arg1 = 21061, 
      }, 
      [190] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [191] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [192] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [193] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [194] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [195] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [196] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [197] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [198] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [199] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [200] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 21064, 
      }, 
      [201] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
         Arg1 = 21065, 
      }, 
      [202] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [203] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [204] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21056, 
      }, 
      [205] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21058, 
      }, 
      [206] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21059, 
      }, 
      [207] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21060, 
      }, 
      [208] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21061, 
      }, 
      [209] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21062, 
      }, 
      [210] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21063, 
      }, 
      [211] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21066, 
      }, 
      [212] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21067, 
      }, 
      [213] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [214] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21058, 
      }, 
      [215] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21062, 
      }, 
      [216] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [217] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21057, 
      }, 
      [218] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21060, 
      }, 
      [219] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21061, 
      }, 
      [220] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21064, 
      }, 
      [221] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [222] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21063, 
      }, 
      [223] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [224] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21067, 
      }, 
      [225] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [226] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [227] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21057, 
      }, 
      [228] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [229] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21064, 
      }, 
      [230] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21068, 
      }, 
      [231] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21022, 
      }, 
      [232] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21019, 
      }, 
      [233] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21020, 
      }, 
      [234] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10317, 
      }, 
      [235] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10312, 
      }, 
      [236] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10424, 
      }, 
      [237] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21114, 
         Arg1 = 21059, 
      }, 
      [238] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 21106, 
         Arg1 = 21059, 
      }, 
      [239] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 21094, 
         Arg1 = 21059, 
      }, 
      [240] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 6, 
         Arg3 = 21089, 
         Arg1 = 21059, 
      }, 
      [241] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21129, 
         Arg1 = 21435, 
      }, 
      [242] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 32254, 
      }, 
      [243] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21071, 
         Arg1 = 32231, 
      }, 
      [244] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21100, 
         Arg1 = 21064, 
      }, 
      [245] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [246] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [247] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [248] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [249] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [250] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [251] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [252] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [253] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [254] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [255] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [256] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [257] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21071, 
      }, 
      [258] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21100, 
         Arg1 = 21421, 
      }, 
      [259] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 0, 
         Arg1 = 21100, 
      }, 
      [260] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21074, 
         Arg1 = 21068, 
      }, 
      [261] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21073, 
      }, 
      [262] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [263] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [264] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [265] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [266] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [267] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [268] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [269] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [270] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [271] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [272] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [273] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [274] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 0, 
         Arg1 = 21074, 
      }, 
      [275] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21052, 
         Arg1 = 21014, 
      }, 
      [276] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21094, 
      }, 
      [277] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21056, 
      }, 
      [278] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21128, 
         Arg1 = 21444, 
      }, 
      [279] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 6824, 
      }, 
      [280] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 32283, 
      }, 
      [281] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21113, 
         Arg1 = 21066, 
      }, 
      [282] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21056, 
      }, 
      [283] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 21057, 
      }, 
      [284] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21058, 
      }, 
      [285] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 21059, 
      }, 
      [286] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 21060, 
      }, 
      [287] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21061, 
      }, 
      [288] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 21062, 
      }, 
      [289] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
         Arg1 = 21063, 
      }, 
      [290] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 21064, 
      }, 
      [291] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 20, 
         Arg1 = 21066, 
      }, 
      [292] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21067, 
      }, 
      [293] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 21069, 
      }, 
      [294] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21072, 
      }, 
      [295] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 21113, 
      }, 
      [296] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21072, 
         Arg1 = 21436, 
      }, 
      [297] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 6814, 
      }, 
      [298] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 6824, 
      }, 
      [299] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 6822, 
      }, 
      [300] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 6825, 
      }, 
      [301] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21133, 
      }, 
      [302] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21072, 
         Arg1 = 32208, 
      }, 
      [303] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 21135, 
         Arg1 = 21059, 
      }, 
      [304] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21135, 
         Arg1 = 21060, 
      }, 
      [305] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21134, 
         Arg1 = 21447, 
      }, 
      [306] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21134, 
         Arg1 = 21446, 
      }, 
      [307] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21134, 
         Arg1 = 21446, 
      }, 
      [308] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 21134, 
         Arg1 = 21447, 
      }, 
      [309] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21137, 
         Arg1 = 21446, 
      }, 
      [310] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21137, 
         Arg1 = 21447, 
      }, 
      [311] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 21136, 
         Arg1 = 21446, 
      }, 
      [312] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 21136, 
         Arg1 = 21447, 
      }, 
      [313] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 21007, 
         Arg1 = 21037, 
      }, 
      [314] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 21011, 
         Arg1 = 21037, 
      }, 
      [315] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 21015, 
         Arg1 = 21037, 
      }, 
      [316] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 11, 
         Arg3 = 21021, 
         Arg1 = 21037, 
      }, 
      [317] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 21027, 
         Arg1 = 21037, 
      }, 
      [318] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 13, 
         Arg3 = 21032, 
         Arg1 = 21037, 
      }, 
      [319] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 21001, 
         Arg1 = 21037, 
      }, 
      [320] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21059, 
         Arg1 = 21015, 
      }, 
      [321] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21057, 
      }, 
      [322] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21058, 
      }, 
      [323] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21059, 
      }, 
      [324] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21060, 
      }, 
      [325] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 29008, 
      }, 
      [326] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21062, 
      }, 
      [327] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21063, 
      }, 
      [328] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21064, 
      }, 
      [329] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21065, 
      }, 
      [330] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21066, 
      }, 
      [331] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 29007, 
      }, 
      [332] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21061, 
      }, 
      [333] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 29006, 
      }, 
      [334] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21426, 
      }, 
      [335] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10311, 
      }, 
      [336] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21138, 
         Arg1 = 21448, 
      }, 
      [337] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21150, 
         Arg1 = 21433, 
      }, 
      [338] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21150, 
         Arg1 = 21427, 
      }, 
      [339] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 21145, 
         Arg1 = 21037, 
      }, 
      [340] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21000, 
         Arg1 = 21114, 
      }, 
      [341] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21148, 
         Arg1 = 21115, 
      }, 
      [342] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21148, 
         Arg1 = 21116, 
      }, 
      [343] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 2, 
         Arg1 = 21148, 
      }, 
      [344] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 2, 
         Arg1 = 21141, 
      }, 
      [345] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 8, 
         Arg3 = 2, 
         Arg1 = 21140, 
      }, 
      [346] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21149, 
         Arg1 = 21116, 
      }, 
      [347] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21149, 
         Arg1 = 21115, 
      }, 
      [348] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 7, 
         Arg3 = 2, 
         Arg1 = 21149, 
      }, 
      [349] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 2, 
         Arg1 = 21139, 
      }, 
      [350] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 2, 
         Arg1 = 21142, 
      }, 
      [351] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 2, 
         Arg1 = 21143, 
      }, 
      [352] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21144, 
         Arg1 = 21438, 
      }, 
      [353] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 17, 
         Arg1 = 21140, 
      }, 
      [354] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21146, 
         Arg1 = 21081, 
      }, 
      [355] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21146, 
         Arg1 = 21115, 
      }, 
      [356] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21146, 
         Arg1 = 21116, 
      }, 
      [357] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 2, 
         Arg1 = 21146, 
      }, 
      [358] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 21073, 
      }, 
      [359] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21147, 
         Arg1 = 21082, 
      }, 
      [360] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 21117, 
      }, 
      [361] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 28015, 
      }, 
      [362] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 21118, 
      }, 
      [363] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21147, 
         Arg1 = 21115, 
      }, 
      [364] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21147, 
         Arg1 = 21116, 
      }, 
      [365] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 2, 
         Arg1 = 21147, 
      }, 
      [366] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21132, 
         Arg1 = 21400, 
      }, 
      [367] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21069, 
      }, 
      [368] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 21132, 
      }, 
      [369] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21067, 
         Arg1 = 21058, 
      }, 
      [370] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21067, 
         Arg1 = 21057, 
      }, 
      [371] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21067, 
         Arg1 = 21437, 
      }, 
      [372] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 60, 
      }, 
      [373] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21067, 
         Arg1 = 21058, 
      }, 
      [374] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 21067, 
         Arg1 = 21058, 
      }, 
      [375] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21130, 
         Arg1 = 21083, 
      }, 
      [376] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21130, 
      }, 
      [377] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 21126, 
      }, 
      [378] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21127, 
         Arg1 = 21434, 
      }, 
      [379] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 21127, 
      }, 
      [380] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 21040, 
      }, 
      [381] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21069, 
         Arg1 = 21025, 
      }, 
      [382] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 21069, 
      }, 
      [383] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21068, 
         Arg1 = 21013, 
      }, 
      [384] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21009, 
      }, 
      [385] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21008, 
      }, 
      [386] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21010, 
      }, 
      [387] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21068, 
         Arg1 = 21445, 
      }, 
      [388] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 21068, 
      }, 
      [389] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 21041, 
      }, 
      [390] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 21022, 
      }, 
      [391] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 21066, 
         Arg1 = 21021, 
      }, 
      [392] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21076, 
      }, 
      [393] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21077, 
      }, 
      [394] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21078, 
      }, 
      [395] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21079, 
      }, 
      [396] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 21080, 
      }, 
      [397] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 21066, 
      }, 
      [398] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 5, 
         Arg3 = 0, 
         Arg1 = 21066, 
      }, 
      [399] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21180, 
      }, 
      [400] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 1, 
         Arg1 = 21184, 
      }, 
      [401] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 21183, 
      }, 
      [402] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 21187, 
         Arg1 = 21435, 
      }, 
   }, 
   Filename = "mon_cal.lua", 
   LowEconomy = 187437352, 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   ResetMessage = "Imperial TIE fighters scream past above, patrolling this occupied city.", 
}
